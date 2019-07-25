package com.miui.gallery.activity;

import android.app.Fragment;
import android.arch.lifecycle.DefaultLifecycleObserver;
import android.arch.lifecycle.DefaultLifecycleObserver.CC;
import android.arch.lifecycle.Lifecycle.State;
import android.arch.lifecycle.LifecycleOwner;
import android.arch.lifecycle.ProcessLifecycleOwner;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.Build;
import android.os.Bundle;
import android.os.IBinder;
import android.view.ActionMode;
import android.view.ActionMode.Callback;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.R;
import com.miui.gallery.activity.HomePageImmersionMenuHelper.MenuItemsCheckListener;
import com.miui.gallery.activity.HomePageStartupHelper.Attacher;
import com.miui.gallery.assistant.manager.ImageFeatureManager;
import com.miui.gallery.card.ui.cardlist.AssistantPageFragment;
import com.miui.gallery.preference.DocumentProviderPreference;
import com.miui.gallery.preference.GalleryPreferences.CTA;
import com.miui.gallery.scanner.MediaScannerReceiver;
import com.miui.gallery.scanner.MediaScannerUtil;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.threadpool.ThreadPool.Job;
import com.miui.gallery.threadpool.ThreadPool.JobContext;
import com.miui.gallery.ui.AlbumPageFragment;
import com.miui.gallery.ui.BaseFragment;
import com.miui.gallery.ui.HomePageFragment;
import com.miui.gallery.util.DocumentProviderUtils;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.OnAppFocusedListener;
import com.miui.gallery.util.ReceiverUtils;
import miui.app.ActionBar.FragmentViewPagerChangeListener;
import miui.view.ViewPager;

public class HomePageActivity extends BaseActivity implements DefaultLifecycleObserver, Attacher {
    /* access modifiers changed from: private */
    public String MT_CAMERA_PACKAGE_NAME = "com.mlab.cam";
    /* access modifiers changed from: private */
    public String MT_CAMERA_SERVICE_CLASS_NAME = "com.mtlab.service.CameraRemoteService";
    /* access modifiers changed from: private */
    public int mCurrentPagePosition = 0;
    /* access modifiers changed from: private */
    public boolean mFirstTime = true;
    /* access modifiers changed from: private */
    public int mFragmentPagerScrollState = 0;
    private HomePageStartupHelper mHomePageStartupHelper;
    /* access modifiers changed from: private */
    public HomePageImmersionMenuHelper mImmersionMenuHelper;
    private boolean mIsInStartup = false;
    private boolean mIsProcessFirstResumed = true;
    /* access modifiers changed from: private */
    public ServiceConnection mMTCameraServiceConnnection;
    private MediaScannerReceiver mMediaScannerReceiver;
    private MenuItemsCheckListener mMenuItemsCheckListener = new MenuItemsCheckListener() {
        public void onMenuItemsChecked(boolean z) {
            View customView = HomePageActivity.this.mActionBar.getCustomView();
            if (customView != null) {
                customView.findViewById(R.id.menu_update_view).setVisibility(z ? 0 : 4);
            }
        }
    };
    /* access modifiers changed from: private */
    public ViewPager mPager;
    private int mStartUpPage;

    private class CallbackWrapper implements Callback {
        private Callback mWrapped;

        public CallbackWrapper(Callback callback) {
            this.mWrapped = callback;
        }

        public boolean onActionItemClicked(ActionMode actionMode, MenuItem menuItem) {
            return this.mWrapped.onActionItemClicked(actionMode, menuItem);
        }

        public boolean onCreateActionMode(ActionMode actionMode, Menu menu) {
            return this.mWrapped.onCreateActionMode(actionMode, menu);
        }

        public void onDestroyActionMode(ActionMode actionMode) {
            this.mWrapped.onDestroyActionMode(actionMode);
            if (HomePageActivity.this.mPager != null) {
                HomePageActivity.this.mPager.setDraggable(true);
            }
        }

        public boolean onPrepareActionMode(ActionMode actionMode, Menu menu) {
            if (HomePageActivity.this.mFirstTime) {
                ViewPager findViewById = HomePageActivity.this.getWindow().findViewById(miui.R.id.view_pager);
                if (findViewById instanceof ViewPager) {
                    HomePageActivity.this.mPager = findViewById;
                    HomePageActivity.this.mPager.setDraggable(false);
                }
                HomePageActivity.this.mFirstTime = false;
            }
            if (HomePageActivity.this.mPager != null) {
                HomePageActivity.this.mPager.setDraggable(false);
            }
            return this.mWrapped.onPrepareActionMode(actionMode, menu);
        }
    }

    private static class MediaScanJob implements Job<Void> {
        private MediaScanJob() {
        }

        public Void run(JobContext jobContext) {
            Context sGetAndroidContext = GalleryApp.sGetAndroidContext();
            MediaScannerUtil.scanMediaProvider(sGetAndroidContext);
            MediaScannerUtil.scanAllAlbumDirectories(sGetAndroidContext, 5);
            MediaScannerUtil.cleanup(sGetAndroidContext);
            return null;
        }
    }

    private void bindMTCameraRemoteService() {
        if (Build.DEVICE.equalsIgnoreCase("vela")) {
            ThreadManager.getWorkHandler().post(new Runnable() {
                public void run() {
                    if (HomePageActivity.this.mMTCameraServiceConnnection == null) {
                        HomePageActivity.this.mMTCameraServiceConnnection = new ServiceConnection() {
                            public void onServiceConnected(ComponentName componentName, IBinder iBinder) {
                                Log.d("HomePageActivity", "CameraRemoteService connected");
                            }

                            public void onServiceDisconnected(ComponentName componentName) {
                                Log.d("HomePageActivity", "CameraRemoteService disconnected");
                            }
                        };
                        Intent intent = new Intent();
                        intent.setComponent(new ComponentName(HomePageActivity.this.MT_CAMERA_PACKAGE_NAME, HomePageActivity.this.MT_CAMERA_SERVICE_CLASS_NAME));
                        try {
                            HomePageActivity.this.bindService(intent, HomePageActivity.this.mMTCameraServiceConnnection, 5);
                            Log.d("HomePageActivity", "bind CameraRemoteService");
                        } catch (Exception e) {
                            HomePageActivity.this.mMTCameraServiceConnnection = null;
                            Log.e("HomePageActivity", "bind CameraRemoteService failed", (Object) e);
                        }
                    }
                }
            });
        }
    }

    /* access modifiers changed from: private */
    public String getPageName(int i) {
        if (i == 0) {
            return "home";
        }
        if (i == 1) {
            return "album";
        }
        if (i == 2) {
            return "assistant";
        }
        return null;
    }

    /* access modifiers changed from: private */
    public void markAlbumPageVisible() {
        if (1 < this.mActionBar.getFragmentTabCount()) {
            Fragment fragmentAt = this.mActionBar.getFragmentAt(1);
            if (fragmentAt != null && (fragmentAt instanceof AlbumPageFragment)) {
                fragmentAt.setUserVisibleHint(true);
            }
        }
    }

    /* JADX WARNING: type inference failed for: r7v0, types: [android.content.Context, com.miui.gallery.activity.HomePageActivity] */
    private void registerMediaScannerReceiver() {
        if (this.mMediaScannerReceiver == null) {
            this.mMediaScannerReceiver = new MediaScannerReceiver();
        }
        ReceiverUtils.registerReceiver(this, this.mMediaScannerReceiver, 0, "file", "android.intent.action.MEDIA_MOUNTED", "android.intent.action.MEDIA_UNMOUNTED", "android.intent.action.MEDIA_SCANNER_FINISHED", "android.intent.action.MEDIA_SCANNER_SCAN_FILE");
    }

    /* JADX WARNING: type inference failed for: r3v0, types: [android.content.Context, com.miui.gallery.activity.HomePageActivity] */
    private void setupActionBar() {
        this.mActionBar.setFragmentViewPagerMode(this, getFragmentManager(), false);
        this.mActionBar.setCustomView(R.layout.action_bar_more);
        View customView = this.mActionBar.getCustomView();
        this.mImmersionMenuHelper = new HomePageImmersionMenuHelper(this);
        this.mImmersionMenuHelper.registerMenuItemsCheckListener(this.mMenuItemsCheckListener);
        this.mImmersionMenuHelper.checkRedDotFeature();
        customView.findViewById(R.id.more).setOnClickListener(new OnClickListener() {
            public void onClick(View view) {
                Fragment fragmentAt = HomePageActivity.this.mActionBar.getFragmentAt(HomePageActivity.this.mCurrentPagePosition);
                HomePageActivity.this.mImmersionMenuHelper.showImmersionMenu(view, fragmentAt instanceof BaseFragment ? ((BaseFragment) fragmentAt).getPageName() : String.valueOf(HomePageActivity.this.mCurrentPagePosition));
            }
        });
        updateActionBarMore(this.mCurrentPagePosition);
    }

    private void setupHomePageFragment() {
        this.mActionBar.addFragmentTab("HomePageFragment", this.mActionBar.newTab().setText(R.string.home_page_label), HomePageFragment.class, null, false);
        this.mActionBar.addFragmentTab("Empty", this.mActionBar.newTab().setText(R.string.album_page_label), Fragment.class, null, false);
        if (ImageFeatureManager.isDeviceSupportStoryFunction()) {
            this.mActionBar.addFragmentTab("StoryStub", this.mActionBar.newTab().setText(R.string.assistant_page_label), Fragment.class, null, false);
        }
        this.mActionBar.addOnFragmentViewPagerChangeListener(new FragmentViewPagerChangeListener() {
            private boolean mIsPendingSelectDispatched = false;

            public void onPageScrollStateChanged(int i) {
                if (i == 0) {
                    this.mIsPendingSelectDispatched = false;
                }
                HomePageActivity.this.mFragmentPagerScrollState = i;
                HomePageActivity.this.setupOtherFragments();
            }

            public void onPageScrolled(int i, float f, boolean z, boolean z2) {
                if (!this.mIsPendingSelectDispatched) {
                    if (i == HomePageActivity.this.mCurrentPagePosition && f >= 0.15f) {
                        int i2 = i + 1;
                        Log.d("HomePageActivity", "pending select page: %d, curr ratio: %f", Integer.valueOf(i2), Float.valueOf(f));
                        if (i2 == 1) {
                            HomePageActivity.this.markAlbumPageVisible();
                        }
                        this.mIsPendingSelectDispatched = true;
                    }
                    if (i == HomePageActivity.this.mCurrentPagePosition - 1 && f <= 0.8f) {
                        Log.d("HomePageActivity", "pending select page: %d, curr ratio: %f", Integer.valueOf(i), Float.valueOf(f));
                        if (i == 1) {
                            HomePageActivity.this.markAlbumPageVisible();
                        }
                        this.mIsPendingSelectDispatched = true;
                    }
                }
            }

            /* JADX WARNING: type inference failed for: r0v5, types: [android.app.Activity, com.miui.gallery.activity.HomePageActivity] */
            /* JADX WARNING: type inference failed for: r0v6, types: [android.app.Activity, com.miui.gallery.activity.HomePageActivity] */
            /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v5, types: [android.app.Activity, com.miui.gallery.activity.HomePageActivity]
  assigns: [com.miui.gallery.activity.HomePageActivity]
  uses: [android.app.Activity]
  mth insns count: 22
            	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
            	at java.util.ArrayList.forEach(Unknown Source)
            	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
            	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
            	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
            	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
            	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
            	at java.util.ArrayList.forEach(Unknown Source)
            	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
            	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
            	at java.util.ArrayList.forEach(Unknown Source)
            	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
            	at jadx.core.ProcessClass.process(ProcessClass.java:30)
            	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
            	at jadx.api.JavaClass.decompile(JavaClass.java:62)
            	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
             */
            /* JADX WARNING: Unknown variable types count: 2 */
            public void onPageSelected(int i) {
                Log.d("HomePageActivity", "onPageSelected %d", (Object) Integer.valueOf(i));
                if (HomePageActivity.this.mCurrentPagePosition != i) {
                    GallerySamplingStatHelper.recordPageEnd(HomePageActivity.this, HomePageActivity.this.getPageName(HomePageActivity.this.mCurrentPagePosition));
                    GallerySamplingStatHelper.recordPageStart(HomePageActivity.this, HomePageActivity.this.getPageName(i));
                }
                HomePageActivity.this.updateActionBarMore(i);
                HomePageActivity.this.mCurrentPagePosition = i;
            }
        });
    }

    /* access modifiers changed from: private */
    public void setupOtherFragments() {
        if (this.mIsInStartup && this.mFragmentPagerScrollState == 0) {
            this.mIsInStartup = false;
            int i = this.mCurrentPagePosition;
            this.mActionBar.addFragmentTab("AlbumPageFragment", this.mActionBar.newTab().setText(R.string.album_page_label), 1, AlbumPageFragment.class, null, false);
            this.mActionBar.removeFragmentTabAt(2);
            if (ImageFeatureManager.isDeviceSupportStoryFunction()) {
                this.mActionBar.addFragmentTab("AssistantPageFragment", this.mActionBar.newTab().setText(R.string.assistant_page_label), 2, AssistantPageFragment.class, null, false);
                this.mActionBar.removeFragmentTabAt(3);
            }
            if (this.mStartUpPage <= 0 || this.mStartUpPage >= this.mActionBar.getTabCount()) {
                this.mActionBar.selectTab(this.mActionBar.getTabAt(i));
            } else {
                this.mActionBar.selectTab(this.mActionBar.getTabAt(this.mStartUpPage));
            }
        }
    }

    private void unbindMTCameraRemoteService() {
        ThreadManager.getWorkHandler().post(new Runnable() {
            public void run() {
                if (HomePageActivity.this.mMTCameraServiceConnnection != null) {
                    try {
                        HomePageActivity.this.unbindService(HomePageActivity.this.mMTCameraServiceConnnection);
                        HomePageActivity.this.mMTCameraServiceConnnection = null;
                        Log.d("HomePageActivity", "unbind CameraRemoteService");
                    } catch (Exception e) {
                        Log.e("HomePageActivity", "unbind CameraRemoteService failed", (Object) e);
                    }
                }
            }
        });
    }

    /* JADX WARNING: type inference failed for: r1v0, types: [android.content.Context, com.miui.gallery.activity.HomePageActivity] */
    private void unregisterMediaScannerReceiver() {
        ReceiverUtils.safeUnregisterReceiver(this, this.mMediaScannerReceiver);
        this.mMediaScannerReceiver = null;
    }

    /* access modifiers changed from: private */
    public void updateActionBarMore(int i) {
        if (i == 1) {
            this.mActionBar.setDisplayShowCustomEnabled(true);
        } else if (i == 0) {
            this.mActionBar.setDisplayShowCustomEnabled(true);
        } else {
            this.mActionBar.setDisplayShowCustomEnabled(true);
        }
    }

    /* access modifiers changed from: protected */
    public void dispatchAppFocused() {
        Fragment fragmentAt = this.mActionBar.getFragmentAt(this.mCurrentPagePosition);
        if (fragmentAt instanceof OnAppFocusedListener) {
            ((OnAppFocusedListener) fragmentAt).onAppFocused();
        }
    }

    public HomePageStartupHelper getStartupHelper() {
        return this.mHomePageStartupHelper;
    }

    /* access modifiers changed from: protected */
    public boolean hasCustomContentView() {
        return true;
    }

    public /* synthetic */ void onCreate(LifecycleOwner lifecycleOwner) {
        CC.$default$onCreate(this, lifecycleOwner);
    }

    /* JADX WARNING: type inference failed for: r2v0, types: [com.miui.gallery.activity.BaseActivity, android.content.Context, com.miui.gallery.activity.HomePageStartupHelper$Attacher, android.arch.lifecycle.LifecycleObserver, com.miui.gallery.activity.HomePageActivity] */
    /* access modifiers changed from: protected */
    public void onCreate(Bundle bundle) {
        this.mHomePageStartupHelper = new HomePageStartupHelper(this, this);
        this.mHomePageStartupHelper.onActivityCreate();
        ProcessLifecycleOwner.get().getLifecycle().addObserver(this);
        super.onCreate(bundle);
        Intent intent = getIntent();
        if (intent != null) {
            this.mStartUpPage = intent.getIntExtra("extra_start_page", 0);
        }
        this.mActionBar.setFragmentViewPagerMode(this, getFragmentManager());
        setupHomePageFragment();
        CTA.onCreateOrDestroyHomePage();
    }

    /* JADX WARNING: type inference failed for: r0v0, types: [android.content.Context, android.app.Activity, com.miui.gallery.activity.HomePageActivity] */
    /* access modifiers changed from: protected */
    public void onCtaChecked(boolean z) {
        if (DocumentProviderPreference.isFirstEntrance() && DocumentProviderUtils.needRequestExternalSDCardPermission(this)) {
            DocumentProviderUtils.startFirstEntrancyPermissionActivityForResult(this);
        }
    }

    public void onDestroy() {
        ProcessLifecycleOwner.get().getLifecycle().removeObserver(this);
        super.onDestroy();
        unregisterMediaScannerReceiver();
        this.mHomePageStartupHelper.onActivityDestroy();
        if (this.mImmersionMenuHelper != null) {
            this.mImmersionMenuHelper.onActivityDestroy();
        }
        CTA.onCreateOrDestroyHomePage();
        unbindMTCameraRemoteService();
    }

    public /* synthetic */ void onDestroy(LifecycleOwner lifecycleOwner) {
        CC.$default$onDestroy(this, lifecycleOwner);
    }

    /* JADX WARNING: type inference failed for: r1v0, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity, com.miui.gallery.activity.HomePageActivity] */
    /* access modifiers changed from: protected */
    public void onPause() {
        super.onPause();
        GallerySamplingStatHelper.recordPageEnd(this, getPageName(this.mCurrentPagePosition));
    }

    public /* synthetic */ void onPause(LifecycleOwner lifecycleOwner) {
        CC.$default$onPause(this, lifecycleOwner);
    }

    public void onPermissionsChecked(String[] strArr, int[] iArr) {
        super.onPermissionsChecked(strArr, iArr);
        ThreadManager.getMiscPool().submit(new MediaScanJob());
    }

    /* JADX WARNING: type inference failed for: r1v0, types: [com.miui.gallery.activity.BaseActivity, android.app.Activity, com.miui.gallery.activity.HomePageActivity] */
    /* access modifiers changed from: protected */
    public void onResume() {
        super.onResume();
        GallerySamplingStatHelper.recordPageStart(this, getPageName(this.mCurrentPagePosition));
        updateActionBarMore(this.mCurrentPagePosition);
    }

    public void onResume(LifecycleOwner lifecycleOwner) {
        if (lifecycleOwner == ProcessLifecycleOwner.get() && getLifecycle().getCurrentState().isAtLeast(State.STARTED)) {
            Log.d("HomePageActivity", "onProcessResumed");
            dispatchAppFocused();
            if (this.mIsProcessFirstResumed) {
                this.mIsProcessFirstResumed = false;
            } else {
                ThreadManager.getMiscPool().submit(new MediaScanJob());
            }
        }
    }

    public /* synthetic */ void onStart(LifecycleOwner lifecycleOwner) {
        CC.$default$onStart(this, lifecycleOwner);
    }

    public void onStartup() {
        this.mIsInStartup = true;
        setupOtherFragments();
        setupActionBar();
        registerMediaScannerReceiver();
        bindMTCameraRemoteService();
    }

    public /* synthetic */ void onStop(LifecycleOwner lifecycleOwner) {
        CC.$default$onStop(this, lifecycleOwner);
    }

    public ActionMode onWindowStartingActionMode(Callback callback) {
        return super.onWindowStartingActionMode(new CallbackWrapper(callback));
    }

    /* access modifiers changed from: protected */
    public boolean supportEnterSetting() {
        return true;
    }
}
