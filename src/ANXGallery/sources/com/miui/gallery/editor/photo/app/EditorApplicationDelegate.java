package com.miui.gallery.editor.photo.app;

import com.miui.filtersdk.BeautificationSDK;
import com.miui.gallery.Config.ImageLoaderConfig;
import com.miui.gallery.cloudcontrol.CloudControlManager;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.threadpool.ThreadPool.Job;
import com.miui.gallery.threadpool.ThreadPool.JobContext;
import com.miui.gallery.util.GalleryStatHelper;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.uil.CloudImageLoader;
import com.nostra13.universalimageloader.core.ImageLoader;
import com.nostra13.universalimageloader.core.ImageLoader.Initializer;
import com.nostra13.universalimageloader.core.ImageLoaderConfiguration;
import miui.external.ApplicationDelegate;

public class EditorApplicationDelegate extends ApplicationDelegate {
    public void onCreate() {
        super.onCreate();
        Log.d("EditApplicationDelegate", "edit progress start");
        CloudControlManager.getInstance().init(this);
        GalleryStatHelper.init(this);
        CloudImageLoader.init(this);
        BeautificationSDK.init(this);
        final AnonymousClass1 r0 = new Initializer() {
            /* access modifiers changed from: protected */
            public ImageLoaderConfiguration getConfig() {
                return ImageLoaderConfig.getConfig(EditorApplicationDelegate.this);
            }
        };
        ImageLoader.setInitializer(r0);
        ThreadManager.getMiscPool().submit(new Job<Void>() {
            public Void run(JobContext jobContext) {
                r0.preInitialize();
                return null;
            }
        });
    }
}
