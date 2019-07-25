package com.miui.gallery.video.editor.manager;

import android.text.TextUtils;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.util.Log;
import com.miui.gallery.video.editor.config.VideoEditorConfig;
import com.miui.gallery.video.editor.util.FileHelper;
import com.nexstreaming.nexeditorsdk.nexApplicationConfig;
import com.nexstreaming.nexeditorsdk.nexAssetPackageManager;
import com.nexstreaming.nexeditorsdk.nexAssetPackageManager.OnInstallPackageListener;
import com.nexstreaming.nexeditorsdk.nexColorEffect;
import com.nexstreaming.nexeditorsdk.nexOverlayPreset;
import com.nexstreaming.nexeditorsdk.nexTemplateManager;
import com.nexstreaming.nexeditorsdk.nexTemplateManager.Template;
import java.util.List;

public class NexAssetTemplateManager {
    /* access modifiers changed from: private */
    public String TAG;
    private String assetInstallRootPath;
    private String assetStoreSubDir;

    public interface ICheckExpiredAssetListener {
        void onFinished(List<Template> list);
    }

    public interface ILoadAssetTemplate {
        void onFail();

        void onSuccess();
    }

    public interface ILoadSmartEffectListener {
        void onFinished(List<Template> list);
    }

    public interface ILoadWaterMarkListener {
        void onFinished(String[] strArr);
    }

    private static class NexTemplateManagerHolder {
        /* access modifiers changed from: private */
        public static final NexAssetTemplateManager INSTANCE = new NexAssetTemplateManager();
    }

    private NexAssetTemplateManager() {
        this.TAG = "NexAssetTemplateManager";
    }

    public static final NexAssetTemplateManager getInstance() {
        return NexTemplateManagerHolder.INSTANCE;
    }

    private void initPath() {
        this.assetStoreSubDir = VideoEditorConfig.ASSET_STORE_PATH;
        this.assetInstallRootPath = VideoEditorConfig.ASSET_INSTALL_ROOT_PATH;
        if (FileHelper.createDir(this.assetStoreSubDir)) {
            nexApplicationConfig.setAssetStoreRootPath(this.assetStoreSubDir);
            nexApplicationConfig.setAssetInstallRootPath(this.assetInstallRootPath);
        }
    }

    private void installProcess(int i, final ILoadAssetTemplate iLoadAssetTemplate) {
        if (iLoadAssetTemplate != null) {
            initPath();
            nexAssetPackageManager.getAssetPackageManager(GalleryApp.sGetAndroidContext()).installPackagesAsync(i, new OnInstallPackageListener() {
                public void onCompleted(int i, int i2) {
                    if (i == -1) {
                        iLoadAssetTemplate.onFail();
                        Log.d(NexAssetTemplateManager.this.TAG, "Install a new  asset package to NexEditorSDK Fail! ");
                        return;
                    }
                    iLoadAssetTemplate.onSuccess();
                    nexColorEffect.updatePluginLut();
                    Log.d(NexAssetTemplateManager.this.TAG, "Install a new asset package to NexEditorSDK Success! ");
                }

                public void onProgress(int i, int i2, int i3) {
                }
            });
        }
    }

    public void checkExpiredAsset(final ICheckExpiredAssetListener iCheckExpiredAssetListener) {
        if (iCheckExpiredAssetListener != null) {
            final nexTemplateManager kmTemplateManager = getKmTemplateManager();
            if (kmTemplateManager != null) {
                kmTemplateManager.loadTemplate((Runnable) new Runnable() {
                    public void run() {
                        List<Template> templates = kmTemplateManager.getTemplates();
                        boolean z = false;
                        for (Template template : templates) {
                            if (template != null) {
                                nexAssetPackageManager.getAssetPackageManager(GalleryApp.sGetAndroidContext());
                                if (nexAssetPackageManager.checkExpireAsset(template.packageInfo())) {
                                    NexAssetTemplateManager.this.uninstallPackageById(template.id());
                                    z = true;
                                }
                            }
                        }
                        if (z) {
                            NexAssetTemplateManager.this.getKmTemplateManager().loadTemplate();
                            iCheckExpiredAssetListener.onFinished(kmTemplateManager.getTemplates());
                            return;
                        }
                        iCheckExpiredAssetListener.onFinished(templates);
                    }
                });
            }
        }
    }

    public nexTemplateManager getKmTemplateManager() {
        return nexTemplateManager.getTemplateManager(GalleryApp.sGetAndroidContext(), GalleryApp.sGetAndroidContext());
    }

    public void installSmartEffectAssetPackageToSdk(int i, ILoadAssetTemplate iLoadAssetTemplate) {
        installProcess(i, iLoadAssetTemplate);
    }

    public void installWaterMarkAssetPackageToSdk(int i, ILoadAssetTemplate iLoadAssetTemplate) {
        installProcess(i, iLoadAssetTemplate);
    }

    public void loadSmartEffectTemplateList(final ILoadSmartEffectListener iLoadSmartEffectListener) {
        if (iLoadSmartEffectListener != null) {
            initPath();
            final nexTemplateManager kmTemplateManager = getKmTemplateManager();
            if (!(kmTemplateManager == null || iLoadSmartEffectListener == null)) {
                kmTemplateManager.loadTemplate((Runnable) new Runnable() {
                    public void run() {
                        iLoadSmartEffectListener.onFinished(kmTemplateManager.getTemplates());
                    }
                });
            }
        }
    }

    public void loadWaterMarkTemplateList(ILoadWaterMarkListener iLoadWaterMarkListener) {
        if (iLoadWaterMarkListener != null) {
            initPath();
            iLoadWaterMarkListener.onFinished(nexOverlayPreset.getOverlayPreset(GalleryApp.sGetAndroidContext()).getIDs());
        }
    }

    public void uninstallPackageById(String str) {
        if (!TextUtils.isEmpty(str)) {
            nexAssetPackageManager.getAssetPackageManager(GalleryApp.sGetAndroidContext()).uninstallPackageById(str);
        }
    }
}
