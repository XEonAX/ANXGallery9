package com.miui.gallery.util;

import android.app.Activity;
import android.app.DialogFragment;
import android.os.AsyncTask;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.R;
import com.miui.gallery.assistant.library.Library;
import com.miui.gallery.assistant.library.Library.LibraryStatus;
import com.miui.gallery.assistant.library.LibraryManager;
import com.miui.gallery.assistant.library.LibraryManager.DownloadListener;
import com.miui.gallery.assistant.library.LibraryUtils;
import com.miui.gallery.cloud.NetworkUtils;
import com.miui.gallery.movie.utils.MovieStatUtils;
import com.miui.gallery.ui.ConfirmDialog;
import com.miui.gallery.ui.ConfirmDialog.ConfirmDialogInterface;
import io.reactivex.Observable;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.functions.Consumer;
import io.reactivex.schedulers.Schedulers;
import java.util.Iterator;
import java.util.concurrent.CopyOnWriteArrayList;

public class MovieLibraryLoaderHelper {
    private static MovieLibraryLoaderHelper sInstance = new MovieLibraryLoaderHelper();
    private CopyOnWriteArrayList<DownloadStateListener> mDownloadStateListeners = new CopyOnWriteArrayList<>();
    private boolean mIsDownloading;

    public interface DownloadStartListener {
        void onDownloadStart();
    }

    public interface DownloadStateListener {
        void onDownloading();

        void onFinish(boolean z, int i);
    }

    private void doDownloadLibrary(Library library, boolean z) {
        LibraryManager.getInstance().downloadLibrary(library, z, new DownloadListener() {
            public void onDownloadProgress(long j, int i) {
            }

            public void onDownloadResult(long j, int i) {
                Log.d("MovieLibraryLoaderHelper", "download result %d", (Object) Integer.valueOf(i));
                MovieLibraryLoaderHelper.this.refreshDownloadResult(i == 0, i);
            }
        });
    }

    public static MovieLibraryLoaderHelper getInstance() {
        return sInstance;
    }

    private int getLoaderState(Library library) {
        if (library == null || library.getLibraryStatus() != LibraryStatus.STATE_AVAILABLE) {
            return this.mIsDownloading ? 1 : 2;
        }
        return 0;
    }

    public static /* synthetic */ void lambda$startDownloadWithCheckLibrary$12(MovieLibraryLoaderHelper movieLibraryLoaderHelper, boolean z, OptionalResult optionalResult) throws Exception {
        Library library = (Library) optionalResult.getIncludeNull();
        if (library == null) {
            Log.w("MovieLibraryLoaderHelper", "getLibrarySync failed");
            movieLibraryLoaderHelper.refreshDownloadResult(false, -2);
            return;
        }
        movieLibraryLoaderHelper.doDownloadLibrary(library, z);
    }

    private void onDownloading() {
        this.mIsDownloading = true;
        Iterator it = this.mDownloadStateListeners.iterator();
        while (it.hasNext()) {
            ((DownloadStateListener) it.next()).onDownloading();
        }
    }

    /* access modifiers changed from: private */
    public void refreshDownloadResult(boolean z, int i) {
        this.mIsDownloading = false;
        Iterator it = this.mDownloadStateListeners.iterator();
        while (it.hasNext()) {
            ((DownloadStateListener) it.next()).onFinish(z, i);
        }
        MovieStatUtils.statMovieLibraryDownloadResult(z);
        ToastUtils.makeText(GalleryApp.sGetAndroidContext(), z ? R.string.photo_movie_module_finish : R.string.photo_movie_module_failed);
    }

    private void startDownloadWithCheck(Activity activity, final Library library, final DownloadStartListener downloadStartListener) {
        if (!NetworkUtils.isNetworkConnected()) {
            ToastUtils.makeText(GalleryApp.sGetAndroidContext(), (int) R.string.movie_download_failed_for_notwork);
            Log.d("MovieLibraryLoaderHelper", "download sdk no network");
            refreshDownloadResult(false, -1);
        } else if (NetworkUtils.isActiveNetworkMetered()) {
            ConfirmDialog.showConfirmDialog(activity.getFragmentManager(), activity.getResources().getString(R.string.movie_download_sdk_without_wifi_title), activity.getResources().getString(R.string.movie_download_sdk_without_wifi_msg), activity.getResources().getString(R.string.movie_cancel_download), activity.getResources().getString(R.string.movie_download), new ConfirmDialogInterface() {
                public void onCancel(DialogFragment dialogFragment) {
                    MovieLibraryLoaderHelper.this.refreshDownloadResult(false, -1);
                }

                public void onConfirm(DialogFragment dialogFragment) {
                    MovieLibraryLoaderHelper.this.startDownloadWithCheckLibrary(library, true, downloadStartListener);
                }
            });
        } else {
            startDownloadWithCheckLibrary(library, false, downloadStartListener);
        }
    }

    /* access modifiers changed from: private */
    public void startDownloadWithCheckLibrary(Library library, boolean z, DownloadStartListener downloadStartListener) {
        if (downloadStartListener != null) {
            downloadStartListener.onDownloadStart();
        }
        if (library == null) {
            Observable.create($$Lambda$MovieLibraryLoaderHelper$JqYlSH515W9VJVeXikiMLmIyjW4.INSTANCE).subscribeOn(Schedulers.from(AsyncTask.THREAD_POOL_EXECUTOR)).observeOn(AndroidSchedulers.mainThread()).subscribe((Consumer<? super T>) new Consumer(z) {
                private final /* synthetic */ boolean f$1;

                {
                    this.f$1 = r2;
                }

                public final void accept(Object obj) {
                    MovieLibraryLoaderHelper.lambda$startDownloadWithCheckLibrary$12(MovieLibraryLoaderHelper.this, this.f$1, (OptionalResult) obj);
                }
            });
        } else {
            doDownloadLibrary(library, z);
        }
    }

    public void addDownloadStateListener(DownloadStateListener downloadStateListener) {
        if (downloadStateListener != null) {
            this.mDownloadStateListeners.add(downloadStateListener);
        }
    }

    public boolean checkAbleOrDownload(Activity activity) {
        return checkAbleOrDownload(activity, null);
    }

    public boolean checkAbleOrDownload(Activity activity, DownloadStartListener downloadStartListener) {
        Library library = LibraryManager.getInstance().getLibrary(1011);
        if (library != null && getLoaderState(library) == 0) {
            return true;
        }
        onDownloading();
        startDownloadWithCheck(activity, library, downloadStartListener);
        return false;
    }

    public String getLibraryDirPath() {
        return LibraryUtils.getLibraryDirPath(GalleryApp.sGetAndroidContext());
    }

    public int getLoaderState() {
        return getLoaderState(LibraryManager.getInstance().getLibrary(1011));
    }

    public void removeDownloadStateListener(DownloadStateListener downloadStateListener) {
        if (downloadStateListener != null) {
            this.mDownloadStateListeners.remove(downloadStateListener);
        }
    }
}
