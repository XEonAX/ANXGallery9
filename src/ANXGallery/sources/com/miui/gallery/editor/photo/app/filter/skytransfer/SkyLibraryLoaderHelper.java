package com.miui.gallery.editor.photo.app.filter.skytransfer;

import android.annotation.SuppressLint;
import android.os.AsyncTask;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.assistant.library.Library;
import com.miui.gallery.assistant.library.Library.LibraryStatus;
import com.miui.gallery.assistant.library.LibraryManager;
import com.miui.gallery.assistant.library.LibraryManager.DownloadListener;
import com.miui.gallery.assistant.library.LibraryUtils;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.OptionalResult;
import io.reactivex.Observable;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.functions.Consumer;
import io.reactivex.schedulers.Schedulers;

public class SkyLibraryLoaderHelper {
    private static SkyLibraryLoaderHelper sInstance = new SkyLibraryLoaderHelper();
    private SkyDownloadStateListener mDownloadStateListener;
    private boolean mIsDownloading;

    private void doDownloadLibrary(Library library, boolean z) {
        LibraryManager.getInstance().downloadLibrary(library, z, new DownloadListener() {
            public void onDownloadProgress(long j, int i) {
                Log.d("SkyLibraryLoaderHelper", "onDownloadProgress: %d", (Object) Integer.valueOf(i));
                SkyLibraryLoaderHelper.this.refreshDownloading(i);
            }

            public void onDownloadResult(long j, int i) {
                Log.d("SkyLibraryLoaderHelper", "download result %d", (Object) Integer.valueOf(i));
                SkyLibraryLoaderHelper.this.refreshDownloadResult(i == 0, i);
            }
        });
    }

    public static SkyLibraryLoaderHelper getInstance() {
        return sInstance;
    }

    private int getLoaderState(Library library) {
        if (library == null || library.getLibraryStatus() != LibraryStatus.STATE_AVAILABLE) {
            return this.mIsDownloading ? 1 : 2;
        }
        return 0;
    }

    public static /* synthetic */ void lambda$startDownload$97(SkyLibraryLoaderHelper skyLibraryLoaderHelper, boolean z, OptionalResult optionalResult) throws Exception {
        Library library = (Library) optionalResult.getIncludeNull();
        if (library == null) {
            Log.w("SkyLibraryLoaderHelper", "getLibrarySync failed");
            skyLibraryLoaderHelper.refreshDownloadResult(false, -2);
            return;
        }
        skyLibraryLoaderHelper.doDownloadLibrary(library, z);
    }

    /* access modifiers changed from: private */
    public void refreshDownloadResult(boolean z, int i) {
        this.mIsDownloading = false;
        if (this.mDownloadStateListener != null) {
            this.mDownloadStateListener.onFinish(1, z, i);
        }
    }

    private void refreshDownloadStart() {
        Log.d("SkyLibraryLoaderHelper", "refreshDownloadStart");
        this.mIsDownloading = true;
        if (this.mDownloadStateListener != null) {
            this.mDownloadStateListener.onDownloadStart(1);
        }
    }

    /* access modifiers changed from: private */
    public void refreshDownloading(int i) {
        this.mIsDownloading = true;
        if (this.mDownloadStateListener != null) {
            this.mDownloadStateListener.onDownloading(1, i);
        }
    }

    public String getLibraryDirPath() {
        return LibraryUtils.getLibraryDirPath(GalleryApp.sGetAndroidContext());
    }

    public int getLoaderState() {
        return getLoaderState(LibraryManager.getInstance().getLibrary(1012));
    }

    public void setDownloadStateListener(SkyDownloadStateListener skyDownloadStateListener) {
        this.mDownloadStateListener = skyDownloadStateListener;
    }

    @SuppressLint({"CheckResult"})
    public void startDownload(boolean z) {
        refreshDownloadStart();
        Library library = LibraryManager.getInstance().getLibrary(1012);
        if (library == null) {
            Observable.create($$Lambda$SkyLibraryLoaderHelper$qmL23Q1AG0OUmP05fSaJIcgKCK4.INSTANCE).subscribeOn(Schedulers.from(AsyncTask.THREAD_POOL_EXECUTOR)).observeOn(AndroidSchedulers.mainThread()).subscribe((Consumer<? super T>) new Consumer(z) {
                private final /* synthetic */ boolean f$1;

                {
                    this.f$1 = r2;
                }

                public final void accept(Object obj) {
                    SkyLibraryLoaderHelper.lambda$startDownload$97(SkyLibraryLoaderHelper.this, this.f$1, (OptionalResult) obj);
                }
            });
        } else {
            doDownloadLibrary(library, z);
        }
    }
}
