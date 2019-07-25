package com.miui.gallery.editor.photo.app.filter.skytransfer;

import android.annotation.SuppressLint;
import com.miui.gallery.net.download.Request.Listener;
import com.miui.gallery.net.resource.Resource;
import com.miui.gallery.net.resource.ResourceDownloadManager;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.StaticContext;
import com.miui.gallery.util.UnzipUtils;
import io.reactivex.Observable;
import io.reactivex.ObservableEmitter;
import io.reactivex.ObservableOnSubscribe;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.functions.Consumer;
import io.reactivex.functions.Function;
import io.reactivex.schedulers.Schedulers;
import java.io.File;

public class SkyResourceDownloadHelper {
    private static String SKY_RES_DIR = "sky_res";
    private static String SKY_V1_DIR = "filter_sky_v1";
    private static SkyResourceDownloadHelper sInstance = new SkyResourceDownloadHelper();
    private SkyDownloadStateListener mDownloadStateListener;
    private boolean mIsDownloading;
    private ResourceDownloadManager mResourceDownloadManager;

    @SuppressLint({"CheckResult"})
    private void downloadResource(boolean z) {
        refreshDownloadStart();
        if (this.mResourceDownloadManager == null) {
            this.mResourceDownloadManager = new ResourceDownloadManager();
        }
        Resource resource = new Resource();
        resource.id = 11285679226814528L;
        String downloadPath = getDownloadPath();
        StringBuilder sb = new StringBuilder();
        sb.append(downloadPath);
        sb.append(File.separator);
        sb.append("file.zip");
        String sb2 = sb.toString();
        Observable.create(new ObservableOnSubscribe(sb2, resource, z) {
            private final /* synthetic */ String f$1;
            private final /* synthetic */ Resource f$2;
            private final /* synthetic */ boolean f$3;

            {
                this.f$1 = r2;
                this.f$2 = r3;
                this.f$3 = r4;
            }

            public final void subscribe(ObservableEmitter observableEmitter) {
                SkyResourceDownloadHelper.this.mResourceDownloadManager.download(this.f$2, this.f$1, new Listener(this.f$1, observableEmitter) {
                    public void onComplete(int i) {
                        r5.onNext(Integer.valueOf(i));
                    }

                    public void onProgressUpdate(int i) {
                        Log.d("SkyResourceDownloadHelper", "download progress %s :%d", r2, Integer.valueOf(i));
                        SkyResourceDownloadHelper.this.refreshDownloading(i);
                    }

                    public void onStart() {
                    }
                }, this.f$3);
            }
        }).observeOn(Schedulers.io()).map(new Function(sb2) {
            private final /* synthetic */ String f$1;

            {
                this.f$1 = r2;
            }

            public final Object apply(Object obj) {
                return SkyResourceDownloadHelper.lambda$downloadResource$99(SkyResourceDownloadHelper.this, this.f$1, (Integer) obj);
            }
        }).observeOn(AndroidSchedulers.mainThread()).subscribe((Consumer<? super T>) new Consumer() {
            public final void accept(Object obj) {
                SkyResourceDownloadHelper.lambda$downloadResource$100(SkyResourceDownloadHelper.this, (Integer) obj);
            }
        });
    }

    private String getDownloadPath() {
        StringBuilder sb = new StringBuilder();
        sb.append(StaticContext.sGetAndroidContext().getFilesDir().getAbsolutePath());
        sb.append(File.separator);
        sb.append(SKY_RES_DIR);
        return sb.toString();
    }

    public static SkyResourceDownloadHelper getInstance() {
        return sInstance;
    }

    public static /* synthetic */ void lambda$downloadResource$100(SkyResourceDownloadHelper skyResourceDownloadHelper, Integer num) throws Exception {
        skyResourceDownloadHelper.refreshDownloadResult(num.intValue() == 0, num.intValue());
    }

    public static /* synthetic */ Integer lambda$downloadResource$99(SkyResourceDownloadHelper skyResourceDownloadHelper, String str, Integer num) throws Exception {
        if (num.intValue() == 0 && !UnzipUtils.unZipFile(str)) {
            num = Integer.valueOf(-2);
        }
        Log.d("SkyResourceDownloadHelper", "download %s :%d", skyResourceDownloadHelper.getDownloadPath(), num);
        return num;
    }

    private void refreshDownloadResult(boolean z, int i) {
        this.mIsDownloading = false;
        if (this.mDownloadStateListener != null) {
            this.mDownloadStateListener.onFinish(2, z, i);
        }
    }

    private void refreshDownloadStart() {
        this.mIsDownloading = true;
        if (this.mDownloadStateListener != null) {
            this.mDownloadStateListener.onDownloadStart(2);
        }
    }

    /* access modifiers changed from: private */
    public void refreshDownloading(int i) {
        if (this.mDownloadStateListener != null) {
            this.mDownloadStateListener.onDownloading(2, i);
        }
    }

    public String getSkyResPathV1() {
        StringBuilder sb = new StringBuilder();
        sb.append(getDownloadPath());
        sb.append(File.separator);
        sb.append(SKY_V1_DIR);
        return sb.toString();
    }

    public boolean isResourceDownloaded() {
        File file = new File(getDownloadPath(), SKY_V1_DIR);
        return file.exists() && file.isDirectory();
    }

    public void setDownloadStateListener(SkyDownloadStateListener skyDownloadStateListener) {
        this.mDownloadStateListener = skyDownloadStateListener;
    }

    public void startDownload(boolean z) {
        if (!this.mIsDownloading) {
            downloadResource(z);
        }
    }
}
