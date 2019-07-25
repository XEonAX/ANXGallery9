package com.miui.gallery.activity;

import android.content.ContentUris;
import android.content.Intent;
import android.net.Uri;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.text.TextUtils;
import com.miui.display.DisplayFeatureHelper;
import com.miui.gallery.Config.ThumbConfig;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.R;
import com.miui.gallery.model.ImageLoadParams;
import com.miui.gallery.permission.core.PermissionUtils;
import com.miui.gallery.ui.PhotoPageFragment;
import com.miui.gallery.util.BrightnessProvider;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.IntentUtil;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MediaStoreUtils;
import com.miui.gallery.util.ProcessingMediaHelper;
import com.miui.gallery.util.ScreenUtils;
import com.miui.gallery.view.BrightnessManager;
import com.nostra13.universalimageloader.core.DisplayImageOptions;
import com.nostra13.universalimageloader.core.DisplayImageOptions.Builder;
import com.nostra13.universalimageloader.core.ImageLoader;
import com.nostra13.universalimageloader.core.assist.ImageScaleType;
import com.nostra13.universalimageloader.core.assist.ImageSize;
import com.nostra13.universalimageloader.core.assist.ViewScaleType;
import com.nostra13.universalimageloader.core.imageaware.ImageAware;
import com.nostra13.universalimageloader.core.imageaware.NonViewAware;

public class ExternalPhotoPageActivity extends BaseActivity implements BrightnessProvider {
    private static final String[] REQUIRED_RUNTIME_PERMISSIONS = {"android.permission.WRITE_EXTERNAL_STORAGE"};
    private BrightnessManager mBrightnessManager;
    private boolean mSupportWindowAnim;

    private static ImageSize getImageSize(boolean z) {
        return z ? ThumbConfig.get().sMicroTargetSize : new ImageSize(ScreenUtils.getScreenWidth(), ScreenUtils.getScreenHeight());
    }

    private boolean isCameraPreview() {
        Intent intent = getIntent();
        return intent != null && intent.getBooleanExtra("from_MiuiCamera", false);
    }

    public static void preloadThumbnail(String str) {
        preloadThumbnail(str, ProcessingMediaHelper.getInstance().isMediaInProcessing(str));
    }

    public static void preloadThumbnail(String str, boolean z) {
        if (!PermissionUtils.checkPermission(GalleryApp.sGetAndroidContext(), "android.permission.WRITE_EXTERNAL_STORAGE")) {
            Log.w("ExternalPhotoPageActivity", "Can't access external storage, relate permission is ungranted");
            return;
        }
        ImageSize imageSize = getImageSize(z);
        Builder cloneFrom = new Builder().cloneFrom(ThumbConfig.THUMBNAIL_DISPLAY_IMAGE_OPTIONS_DEFAULT);
        cloneFrom.loadFromBigPhotoCache(true).imageScaleType(ImageScaleType.EXACTLY).delayCacheThumbnail(true).cacheInMemory(true).highPriority(true);
        DisplayImageOptions build = cloneFrom.build();
        if (z) {
            build = ThumbConfig.appendBlurOptions(build);
        }
        NonViewAware nonViewAware = new NonViewAware(imageSize, ViewScaleType.FIT_INSIDE);
        ImageLoader.getInstance().resume();
        ImageLoader.getInstance().displayImage(str, (ImageAware) nonViewAware, build);
    }

    /* JADX WARNING: type inference failed for: r0v0, types: [com.miui.gallery.activity.ExternalPhotoPageActivity, android.app.Activity] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v0, types: [com.miui.gallery.activity.ExternalPhotoPageActivity, android.app.Activity]
  assigns: [?[OBJECT, ARRAY]]
  uses: [com.miui.gallery.activity.ExternalPhotoPageActivity, android.app.Activity]
  mth insns count: 59
    	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
    	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
    	at jadx.core.ProcessClass.process(ProcessClass.java:30)
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    private void prepareIfFromCamera() {
        Intent intent = getIntent();
        if (intent != null && intent.getData() != null && intent.getExtras() != null) {
            Bundle extras = intent.getExtras();
            if (isCameraPreview()) {
                int integer = getResources().getInteger(R.integer.photo_page_anim_support_width);
                int integer2 = getResources().getInteger(R.integer.photo_page_anim_support_height);
                if (ScreenUtils.getScreenWidth() == integer && Math.abs(ScreenUtils.getScreenHeight() - integer2) <= 5 && getResources().getConfiguration().orientation == 1) {
                    getWindow().setWindowAnimations(2131820544);
                    this.mSupportWindowAnim = true;
                }
                Uri data = intent.getData();
                String uri = data.toString();
                intent.putExtra("photo_count", 1);
                intent.putExtra("photo_init_position", 0);
                ImageLoadParams imageLoadParams = new ImageLoadParams(ContentUris.parseId(data), uri, getImageSize(ProcessingMediaHelper.getInstance().isMediaInProcessing(uri)), null, 0, MediaStoreUtils.getMineTypeFromUri(data), -1);
                intent.putExtra("photo_transition_data", imageLoadParams);
                preloadThumbnail(uri);
                this.mBrightnessManager = new BrightnessManager(this, (((float) extras.getInt(extras.getInt("camera-brightness-manual", -1) == -1 ? "camera-brightness" : "camera-brightness-manual", -1)) * 1.0f) / 255.0f, extras.getFloat("camera-brightness-auto", -1.0f));
            }
        }
    }

    private void setScreenEffect(boolean z) {
        DisplayFeatureHelper.setScreenEffect(z);
    }

    private void startMainActivity() {
        Intent intent = new Intent("android.intent.action.MAIN");
        intent.setPackage(getPackageName());
        intent.addFlags(67108864);
        startActivity(intent);
    }

    public void finish() {
        if (VERSION.SDK_INT >= 21) {
            finishAndRemoveTask();
        } else {
            super.finish();
        }
        if (this.mSupportWindowAnim) {
            overridePendingTransition(R.anim.photo_page_close_enter, R.anim.photo_page_close_exit);
        }
    }

    public float getAutoBrightness() {
        if (this.mBrightnessManager == null) {
            return -1.0f;
        }
        return this.mBrightnessManager.getAutoBrightness();
    }

    /* access modifiers changed from: protected */
    public int getFragmentContainerId() {
        return 16908290;
    }

    public float getManualBrightness() {
        if (this.mBrightnessManager == null) {
            return -1.0f;
        }
        return this.mBrightnessManager.getManualBrightness();
    }

    public String[] getRuntimePermissions() {
        return REQUIRED_RUNTIME_PERMISSIONS;
    }

    /* access modifiers changed from: protected */
    public boolean hasCustomContentView() {
        return true;
    }

    public void onActivityReenter(int i, Intent intent) {
        PhotoPageFragment photoPageFragment = (PhotoPageFragment) getFragmentManager().findFragmentByTag("PhotoPageFragment");
        if (photoPageFragment != null) {
            photoPageFragment.onActivityReenter(i, intent);
        }
    }

    public void onActivityResult(int i, int i2, Intent intent) {
        super.onActivityResult(i, i2, intent);
        if (getFragmentManager().getBackStackEntryCount() == 0) {
            PhotoPageFragment photoPageFragment = (PhotoPageFragment) getFragmentManager().findFragmentByTag("PhotoPageFragment");
            if (photoPageFragment != null) {
                photoPageFragment.onActivityResult(i, i2, intent);
            }
        }
    }

    public void onBackPressed() {
        if (getFragmentManager().getBackStackEntryCount() == 0) {
            PhotoPageFragment photoPageFragment = (PhotoPageFragment) getFragmentManager().findFragmentByTag("PhotoPageFragment");
            if (photoPageFragment != null && photoPageFragment.isVisible() && photoPageFragment.onBackPressed()) {
                return;
            }
        }
        super.onBackPressed();
    }

    /* JADX WARNING: type inference failed for: r3v0, types: [com.miui.gallery.activity.BaseActivity, com.miui.gallery.activity.ExternalPhotoPageActivity, android.app.Activity] */
    public void onCreate(Bundle bundle) {
        prepareIfFromCamera();
        super.onCreate(bundle);
        String callingPackage = IntentUtil.getCallingPackage(this);
        String str = "photo";
        String str2 = "external_view_photo";
        if (TextUtils.isEmpty(callingPackage)) {
            callingPackage = "Unknown";
        }
        GallerySamplingStatHelper.recordStringPropertyEvent(str, str2, callingPackage);
    }

    /* access modifiers changed from: protected */
    public void onPause() {
        super.onPause();
        ImageLoader.getInstance().pause();
        if (this.mBrightnessManager != null) {
            this.mBrightnessManager.onPause();
        }
        setScreenEffect(false);
    }

    /* JADX WARNING: type inference failed for: r3v3, types: [android.app.Fragment, com.miui.gallery.ui.PhotoPageFragment] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r3v3, types: [android.app.Fragment, com.miui.gallery.ui.PhotoPageFragment]
  assigns: [com.miui.gallery.ui.PhotoPageFragment]
  uses: [android.app.Fragment]
  mth insns count: 19
    	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
    	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
    	at jadx.core.ProcessClass.process(ProcessClass.java:30)
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Unknown variable types count: 1 */
    public void onPermissionsChecked(String[] strArr, int[] iArr) {
        super.onPermissionsChecked(strArr, iArr);
        Intent intent = getIntent();
        if (intent != null) {
            Uri data = intent.getData();
            if (data != null) {
                if (((PhotoPageFragment) getFragmentManager().findFragmentByTag("PhotoPageFragment")) == null) {
                    startFragment(PhotoPageFragment.newInstance(data, intent.getType(), intent.getExtras(), 0), "PhotoPageFragment", false, true);
                }
                return;
            }
        }
        finish();
        startMainActivity();
    }

    /* access modifiers changed from: protected */
    public void onResume() {
        super.onResume();
        ImageLoader.getInstance().resume();
        if (this.mBrightnessManager != null) {
            this.mBrightnessManager.onResume();
        }
        setScreenEffect(true);
    }

    public void onWindowFocusChanged(boolean z) {
        super.onWindowFocusChanged(z);
        if (this.mBrightnessManager != null) {
            this.mBrightnessManager.onWindowFocusChanged(z);
        }
    }
}
