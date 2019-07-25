package com.miui.gallery.activity;

import android.app.Activity;
import android.content.Context;
import android.view.View;
import com.miui.gallery.R;
import com.miui.gallery.cloudcontrol.CloudControlManager;
import com.miui.gallery.cloudcontrol.FeatureProfile.Status;
import com.miui.gallery.cloudcontrol.observers.FeatureStatusObserver;
import com.miui.gallery.preference.GalleryPreferences.FeatureRedDot;
import com.miui.gallery.provider.GalleryContract.Common;
import com.miui.gallery.util.ActionURIHandler;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.IntentUtil;
import com.miui.gallery.util.MovieLibraryLoaderHelper;
import com.miui.gallery.util.MovieLibraryLoaderHelper.DownloadStateListener;
import com.miui.gallery.util.PhotoMovieEntranceUtils;
import com.miui.gallery.util.PrintInstallHelper;
import com.miui.gallery.util.PrintInstallHelper.InstallStateListener;
import com.miui.gallery.util.SyncUtil;
import com.miui.gallery.util.ToastUtils;
import com.miui.gallery.util.deviceprovider.ApplicationHelper;
import com.miui.gallery.widget.menu.ImmersionMenu;
import com.miui.gallery.widget.menu.ImmersionMenuItem;
import com.miui.gallery.widget.menu.ImmersionMenuListener;
import com.miui.gallery.widget.menu.PhoneImmersionMenu;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;

public class HomePageImmersionMenuHelper implements ImmersionMenuListener {
    /* access modifiers changed from: private */
    public Context mContext;
    private String mCurrentPage;
    private Map<Integer, FeatureInfo> mFeatureItemsMap = new HashMap();
    private boolean mHasRedDotItem;
    private InstallStateListener mInstallStateListener;
    private MenuItemsCheckListener mMenuItemsCheckListener;
    private DownloadStateListener mMovieDownloadStateListener;
    private PhoneImmersionMenu mPhoneImmersionMenu;
    private PrintStatusObserver mPrintStatusObserver;

    private class FeatureInfo {
        public String mFeatureName;
        private boolean mIsPushValid;
        private boolean mIsUpdate;

        public FeatureInfo(String str, boolean z, boolean z2) {
            this.mFeatureName = str;
            this.mIsUpdate = z;
            this.mIsPushValid = z2;
            if (!FeatureRedDot.isUpdateFeatureStated(str)) {
                HashMap hashMap = new HashMap();
                hashMap.put("featureName", str);
                GallerySamplingStatHelper.recordCountEvent("feature_red_dot", "new_feature", hashMap);
                FeatureRedDot.setUpdateFeatureStated(str, true);
            }
        }

        public boolean needRedDot() {
            return (this.mIsUpdate && !FeatureRedDot.hasUpdateFeatureUsed(this.mFeatureName)) || (this.mIsPushValid && FeatureRedDot.isFeatureRedDotValid(this.mFeatureName, System.currentTimeMillis()));
        }

        public void setFeatureUsed() {
            FeatureRedDot.setUpdateFeatureUsed(this.mFeatureName, true);
            if (FeatureRedDot.isFeatureRedDotValid(this.mFeatureName, System.currentTimeMillis())) {
                FeatureRedDot.setFeatureRedDotValidTime(this.mFeatureName, 0, 0);
            }
        }
    }

    public interface MenuItemsCheckListener {
        void onMenuItemsChecked(boolean z);
    }

    private class PrintStatusObserver extends FeatureStatusObserver {
        private PrintStatusObserver() {
        }

        public void onStatusChanged(String str, Status status) {
            if ("photo-print".equals(str)) {
                HomePageImmersionMenuHelper.this.onPrintStatueChanged(status);
            }
        }
    }

    public HomePageImmersionMenuHelper(Context context) {
        this.mContext = context;
        this.mPhoneImmersionMenu = new PhoneImmersionMenu(context, this);
        registerPrintStatusObserver();
    }

    private boolean isTrashBinEnable() {
        return ApplicationHelper.isCloudTrashBinFeatureOpen() && SyncUtil.existXiaomiAccount(this.mContext);
    }

    /* access modifiers changed from: private */
    public void onPrintStatueChanged(Status status) {
        if (PrintInstallHelper.getInstance().isPhotoPrintEnable()) {
            setMenuVisibility((int) R.id.menu_photo_print, true);
            GallerySamplingStatHelper.recordStringPropertyEvent("photo_print", "photo_print_enable", "true");
        }
    }

    private void registerFeature(int i, String str, boolean z, boolean z2) {
        this.mFeatureItemsMap.put(Integer.valueOf(i), new FeatureInfo(str, z, z2));
    }

    private void registerPrintStatusObserver() {
        this.mPrintStatusObserver = new PrintStatusObserver();
        onPrintStatueChanged(CloudControlManager.getInstance().registerStatusObserver("photo-print", this.mPrintStatusObserver));
    }

    private boolean setMenuVisibility(int i, boolean z) {
        if (this.mPhoneImmersionMenu == null) {
            return false;
        }
        ImmersionMenu immersionMenu = this.mPhoneImmersionMenu.getImmersionMenu();
        if (immersionMenu == null) {
            return false;
        }
        return setMenuVisibility(immersionMenu.findItem(i), z);
    }

    private boolean setMenuVisibility(ImmersionMenuItem immersionMenuItem, boolean z) {
        if (immersionMenuItem == null || immersionMenuItem.isVisible() == z) {
            return false;
        }
        immersionMenuItem.setVisible(z);
        checkRedDotFeature();
        return true;
    }

    private void unregisterPrintStatusObserver() {
        if (this.mPrintStatusObserver != null) {
            CloudControlManager.getInstance().unregisterStatusObserver(this.mPrintStatusObserver);
        }
    }

    public void checkRedDotFeature() {
        if (this.mPhoneImmersionMenu != null) {
            ImmersionMenu immersionMenu = this.mPhoneImmersionMenu.getImmersionMenu();
            if (immersionMenu != null) {
                this.mHasRedDotItem = false;
                for (Entry entry : this.mFeatureItemsMap.entrySet()) {
                    FeatureInfo featureInfo = (FeatureInfo) entry.getValue();
                    ImmersionMenuItem findItem = immersionMenu.findItem(((Integer) entry.getKey()).intValue());
                    boolean z = featureInfo.needRedDot() && findItem.isVisible();
                    this.mHasRedDotItem |= z;
                    findItem.setIsRedDotDisplayed(z);
                }
                if (this.mMenuItemsCheckListener != null) {
                    this.mMenuItemsCheckListener.onMenuItemsChecked(this.mHasRedDotItem);
                }
                updateImmersionMenu(immersionMenu);
            }
        }
    }

    public void onActivityDestroy() {
        if (this.mPhoneImmersionMenu != null && this.mPhoneImmersionMenu.isShowing()) {
            this.mPhoneImmersionMenu.dismiss();
        }
        PrintInstallHelper.getInstance().removeInstallStateListener(this.mInstallStateListener);
        MovieLibraryLoaderHelper.getInstance().removeDownloadStateListener(this.mMovieDownloadStateListener);
        unregisterPrintStatusObserver();
    }

    public void onCreateImmersionMenu(final ImmersionMenu immersionMenu) {
        if (this.mContext != null) {
            immersionMenu.add(R.id.menu_collage, this.mContext.getString(R.string.home_menu_collage)).setIconResource(R.drawable.home_menu_collage);
            registerFeature(R.id.menu_collage, "collage", true, false);
            if (PhotoMovieEntranceUtils.isPhotoMovieAvailable()) {
                final ImmersionMenuItem iconResource = immersionMenu.add(R.id.menu_photo_movie, this.mContext.getString(R.string.home_menu_photo_movie)).setIconResource(R.drawable.home_menu_photo_movie);
                registerFeature(R.id.menu_photo_movie, "photo_movie", true, false);
                this.mMovieDownloadStateListener = new DownloadStateListener() {
                    public void onDownloading() {
                        iconResource.setRemainWhenClick(true);
                        iconResource.setInformation((int) R.string.photo_movie_menu_loading);
                        HomePageImmersionMenuHelper.this.updateImmersionMenu(immersionMenu);
                    }

                    public void onFinish(boolean z, int i) {
                        iconResource.setRemainWhenClick(false);
                        iconResource.setInformation((CharSequence) null);
                        HomePageImmersionMenuHelper.this.updateImmersionMenu(immersionMenu);
                    }
                };
                MovieLibraryLoaderHelper.getInstance().addDownloadStateListener(this.mMovieDownloadStateListener);
            }
            immersionMenu.add(R.id.menu_cleaner, this.mContext.getString(R.string.home_menu_cleaner)).setIconResource(R.drawable.home_menu_cleaner);
            registerFeature(R.id.menu_cleaner, "photo_cleaner", true, false);
            ImmersionMenuItem iconResource2 = immersionMenu.add(R.id.trash_bin, this.mContext.getString(R.string.trash_bin)).setIconResource(R.drawable.home_menu_trash_bin);
            registerFeature(R.id.trash_bin, "trash_bin", false, false);
            setMenuVisibility(iconResource2, isTrashBinEnable());
            final ImmersionMenuItem iconResource3 = immersionMenu.add(R.id.menu_photo_print, this.mContext.getString(R.string.home_menu_print)).setIconResource(R.drawable.home_menu_print);
            registerFeature(R.id.menu_photo_print, "photo_print", true, true);
            iconResource3.setVisible(PrintInstallHelper.getInstance().isPhotoPrintEnable());
            this.mInstallStateListener = new InstallStateListener() {
                public void onFinish(boolean z, int i, int i2) {
                    if (z) {
                        ToastUtils.makeText(HomePageImmersionMenuHelper.this.mContext, (int) R.string.photo_print_package_finish);
                    } else {
                        int failReasonMsg = PrintInstallHelper.getFailReasonMsg(i, i2);
                        if (failReasonMsg != 0) {
                            ToastUtils.makeText(HomePageImmersionMenuHelper.this.mContext, failReasonMsg);
                        }
                    }
                    iconResource3.setRemainWhenClick(false);
                    iconResource3.setInformation((CharSequence) null);
                    HomePageImmersionMenuHelper.this.updateImmersionMenu(immersionMenu);
                }

                public void onInstallLimited() {
                    ToastUtils.makeText(HomePageImmersionMenuHelper.this.mContext, (int) R.string.try_again_later);
                }

                public void onInstalling() {
                    iconResource3.setRemainWhenClick(true);
                    iconResource3.setInformation((int) R.string.photo_print_menu_loading);
                    HomePageImmersionMenuHelper.this.updateImmersionMenu(immersionMenu);
                }
            };
            PrintInstallHelper.getInstance().addInstallStateListener(this.mInstallStateListener);
            immersionMenu.add(R.id.menu_settings, this.mContext.getString(R.string.gallery_setting)).setIconResource(R.drawable.home_menu_settings);
            registerFeature(R.id.menu_settings, "settings", false, false);
        }
    }

    public void onImmersionMenuSelected(ImmersionMenu immersionMenu, ImmersionMenuItem immersionMenuItem) {
        if (this.mContext != null) {
            int itemId = immersionMenuItem.getItemId();
            FeatureInfo featureInfo = (FeatureInfo) this.mFeatureItemsMap.get(Integer.valueOf(itemId));
            if (featureInfo != null) {
                featureInfo.setFeatureUsed();
                HashMap hashMap = new HashMap();
                hashMap.put(String.format(Locale.US, "%s_redDotDisplayed", new Object[]{this.mCurrentPage}), Boolean.valueOf(this.mHasRedDotItem));
                GallerySamplingStatHelper.recordCountEvent("feature_red_dot", String.format(Locale.US, "%s_%s", new Object[]{"click_menu", featureInfo.mFeatureName}), hashMap);
            }
            checkRedDotFeature();
            switch (itemId) {
                case R.id.menu_cleaner /*2131296707*/:
                    ActionURIHandler.handleUri((Activity) this.mContext, Common.URI_CLEANER_PAGE);
                    GallerySamplingStatHelper.recordCountEvent("home", "home_page_menu_cleaner");
                    break;
                case R.id.menu_collage /*2131296708*/:
                    ActionURIHandler.handleUri((Activity) this.mContext, Common.URI_COLLAGE_PAGE);
                    GallerySamplingStatHelper.recordCountEvent("home", "home_page_menu_collage");
                    break;
                case R.id.menu_photo_movie /*2131296720*/:
                    if (MovieLibraryLoaderHelper.getInstance().checkAbleOrDownload((Activity) this.mContext)) {
                        ActionURIHandler.handleUri((Activity) this.mContext, Common.URI_PHOTO_MOVIE);
                    }
                    GallerySamplingStatHelper.recordCountEvent("home", "home_page_menu_photo_movie");
                    break;
                case R.id.menu_photo_print /*2131296721*/:
                    PrintInstallHelper.getInstance().start(this.mContext);
                    GallerySamplingStatHelper.recordCountEvent("home", "home_page_menu_photo_print");
                    break;
                case R.id.menu_settings /*2131296725*/:
                    IntentUtil.enterGallerySetting(this.mContext);
                    break;
                case R.id.trash_bin /*2131297033*/:
                    IntentUtil.gotoTrashBin(this.mContext, "HomePageActivity");
                    break;
            }
        }
    }

    public boolean onPrepareImmersionMenu(ImmersionMenu immersionMenu) {
        if (this.mContext == null) {
            return false;
        }
        boolean menuVisibility = setMenuVisibility(immersionMenu.findItem(R.id.trash_bin), isTrashBinEnable());
        boolean isPhotoPrintEnable = PrintInstallHelper.getInstance().isPhotoPrintEnable();
        boolean menuVisibility2 = setMenuVisibility(immersionMenu.findItem(R.id.menu_photo_print), isPhotoPrintEnable) | menuVisibility;
        if (isPhotoPrintEnable) {
            GallerySamplingStatHelper.recordStringPropertyEvent("photo_print", "photo_print_menu_displayed", "true");
        }
        return menuVisibility2;
    }

    public void registerMenuItemsCheckListener(MenuItemsCheckListener menuItemsCheckListener) {
        this.mMenuItemsCheckListener = menuItemsCheckListener;
    }

    public void showImmersionMenu(View view, String str) {
        if (this.mPhoneImmersionMenu != null) {
            this.mPhoneImmersionMenu.show(view, null);
        }
        this.mCurrentPage = str;
        HashMap hashMap = new HashMap();
        hashMap.put(String.format(Locale.US, "%s_redDotDisplayed", new Object[]{this.mCurrentPage}), Boolean.valueOf(this.mHasRedDotItem));
        GallerySamplingStatHelper.recordCountEvent("feature_red_dot", "show_immersion_menu", hashMap);
    }

    public void updateImmersionMenu(ImmersionMenu immersionMenu) {
        if (this.mPhoneImmersionMenu != null) {
            this.mPhoneImmersionMenu.update(immersionMenu);
        }
    }
}
