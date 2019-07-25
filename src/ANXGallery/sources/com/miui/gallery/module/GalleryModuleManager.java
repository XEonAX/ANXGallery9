package com.miui.gallery.module;

import android.content.Context;
import android.content.Intent;
import android.support.v4.content.LocalBroadcastManager;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.util.Log;
import java.util.ArrayList;
import miui.module.ModuleManager;

public class GalleryModuleManager {
    private static final GalleryModuleManager INSTANCE = new GalleryModuleManager(GalleryApp.sGetAndroidContext());
    /* access modifiers changed from: private */
    public Context mContext;
    /* access modifiers changed from: private */
    public ArrayList<String> mLoadedModules = new ArrayList<>();
    /* access modifiers changed from: private */
    public ArrayList<String> mLoadingModules = new ArrayList<>();

    public interface ModuleLoadListener {
        void onLoadFailed();

        void onLoadSuccess();
    }

    public GalleryModuleManager(Context context) {
        this.mContext = context;
    }

    public static GalleryModuleManager getInstance() {
        return INSTANCE;
    }

    public boolean isModuleLoaded(String str) {
        boolean contains;
        synchronized (this.mLoadedModules) {
            contains = this.mLoadedModules.contains(str);
        }
        return contains;
    }

    public boolean isModuleLoading(String str) {
        boolean contains;
        synchronized (this.mLoadingModules) {
            contains = this.mLoadingModules.contains(str);
        }
        return contains;
    }

    public void loadModule(boolean z, final ModuleLoadListener moduleLoadListener, String str) {
        synchronized (this.mLoadingModules) {
            if (!this.mLoadingModules.contains(str)) {
                this.mLoadingModules.add(str);
            }
        }
        Intent intent = new Intent("com.miui.gallery.extra_load_module_failed");
        intent.putExtra("module", str);
        LocalBroadcastManager.getInstance(this.mContext).sendBroadcast(intent);
        if (str != null) {
            ModuleManager.getInstance().setModuleLoadListener(new miui.module.ModuleManager.ModuleLoadListener() {
                public void onLoadFail(String str, int i) {
                    StringBuilder sb = new StringBuilder();
                    sb.append("load module fail :");
                    sb.append(str);
                    Log.d("GalleryModuleManager", sb.toString());
                    synchronized (GalleryModuleManager.this.mLoadingModules) {
                        GalleryModuleManager.this.mLoadingModules.remove(str);
                    }
                    Intent intent = new Intent("com.miui.gallery.extra_load_module_failed");
                    intent.putExtra("module", str);
                    LocalBroadcastManager.getInstance(GalleryModuleManager.this.mContext).sendBroadcast(intent);
                    if (i == 3) {
                        CacheRepository.clearCache(GalleryModuleManager.this.mContext, str);
                    }
                    ThreadManager.getMainHandler().post(new Runnable() {
                        public void run() {
                            if (moduleLoadListener != null) {
                                moduleLoadListener.onLoadFailed();
                            }
                        }
                    });
                }

                public void onLoadFinish() {
                }

                public void onLoadSuccess(String str, String str2) {
                    StringBuilder sb = new StringBuilder();
                    sb.append("load module success :");
                    sb.append(str);
                    Log.d("GalleryModuleManager", sb.toString());
                    synchronized (GalleryModuleManager.this.mLoadedModules) {
                        if (!GalleryModuleManager.this.mLoadedModules.contains(str)) {
                            GalleryModuleManager.this.mLoadedModules.add(str);
                        }
                    }
                    synchronized (GalleryModuleManager.this.mLoadingModules) {
                        GalleryModuleManager.this.mLoadingModules.remove(str);
                    }
                    Intent intent = new Intent("com.miui.gallery.extra_load_module_success");
                    intent.putExtra("module", str);
                    LocalBroadcastManager.getInstance(GalleryModuleManager.this.mContext).sendBroadcast(intent);
                    ThreadManager.getMainHandler().post(new Runnable() {
                        public void run() {
                            if (moduleLoadListener != null) {
                                moduleLoadListener.onLoadSuccess();
                            }
                        }
                    });
                }
            });
        }
        if (z) {
            ModuleManager.getInstance().loadModules(new CacheRepository(this.mContext, true), new String[]{str});
            return;
        }
        ModuleManager.getInstance().loadModules(new CacheRepository(this.mContext, false), new String[]{str});
    }
}
