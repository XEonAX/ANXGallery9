package com.miui.gallery.movie.ui.fragment;

import android.app.Activity;
import android.app.Dialog;
import android.app.FragmentManager;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnKeyListener;
import android.os.Bundle;
import android.view.KeyEvent;
import android.widget.Toast;
import com.miui.gallery.R;
import com.miui.gallery.movie.core.MovieManager;
import com.miui.gallery.movie.core.MovieManager.EncodeStateInterface;
import com.miui.gallery.movie.entity.MovieInfo;
import com.miui.gallery.movie.ui.listener.IShareDataCallback;
import com.miui.gallery.movie.utils.MovieStatUtils;
import com.miui.gallery.movie.utils.MovieStorage;
import com.miui.gallery.scanner.MediaScanner;
import com.miui.gallery.threadpool.Future;
import com.miui.gallery.threadpool.FutureHandler;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.threadpool.ThreadPool.Job;
import com.miui.gallery.threadpool.ThreadPool.JobContext;
import com.miui.gallery.util.FileUtils;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MediaStoreUtils;
import com.miui.gallery.util.ToastUtils;
import com.miui.gallery.widget.GalleryDialogFragment;
import java.io.File;
import miui.app.ProgressDialog;

public class MovieSavingFragment extends GalleryDialogFragment {
    private long mLastBackPressedTime;
    private OnSavingFinishListener mOnSavingFinishListener;
    private ProgressDialog mProgressDialog;
    private IShareDataCallback mShareCallback;

    public interface OnSavingFinishListener {
        void onFinish(boolean z, boolean z2, String str);
    }

    private boolean backPress() {
        long currentTimeMillis = System.currentTimeMillis();
        if (currentTimeMillis - this.mLastBackPressedTime > 3000) {
            this.mLastBackPressedTime = currentTimeMillis;
            Toast.makeText(getActivity(), getString(R.string.movie_save_stop_tips), 0).show();
        } else {
            if (this.mShareCallback != null) {
                this.mShareCallback.cancelExport();
            }
            dismissSafely();
        }
        return true;
    }

    private void doSaving(Context context, FragmentManager fragmentManager, MovieManager movieManager, OnSavingFinishListener onSavingFinishListener) {
        String tempFilePath = MovieStorage.getTempFilePath();
        final FragmentManager fragmentManager2 = fragmentManager;
        final String str = tempFilePath;
        final Context context2 = context;
        final OnSavingFinishListener onSavingFinishListener2 = onSavingFinishListener;
        AnonymousClass1 r0 = new EncodeStateInterface() {
            static /* synthetic */ String lambda$onEncodeEnd$137(String str, Context context, JobContext jobContext) {
                String outputMediaFilePath = MovieStorage.getOutputMediaFilePath();
                FileUtils.move(new File(str), new File(outputMediaFilePath));
                MediaScanner.scanSingleFile(context, outputMediaFilePath);
                MediaStoreUtils.insert(context, outputMediaFilePath, 2);
                MediaStoreUtils.sendScannerBroadcast(context, outputMediaFilePath);
                return outputMediaFilePath;
            }

            public void onEncodeEnd(final boolean z, final boolean z2, int i) {
                Log.d("MovieSavingFragment", "save result: %b,code: %d,path: %s", Boolean.valueOf(z), Integer.valueOf(i), str);
                if (z) {
                    ThreadManager.getMiscPool().submit(new Job(str, context2) {
                        private final /* synthetic */ String f$0;
                        private final /* synthetic */ Context f$1;

                        {
                            this.f$0 = r1;
                            this.f$1 = r2;
                        }

                        public final Object run(JobContext jobContext) {
                            return AnonymousClass1.lambda$onEncodeEnd$137(this.f$0, this.f$1, jobContext);
                        }
                    }, new FutureHandler<String>() {
                        public void onPostExecute(Future<String> future) {
                            MovieSavingFragment.this.dismissSafely();
                            if (onSavingFinishListener2 != null) {
                                onSavingFinishListener2.onFinish(z, z2, (String) future.get());
                            }
                        }
                    });
                    return;
                }
                MovieSavingFragment.this.dismissSafely();
                if (onSavingFinishListener2 != null) {
                    onSavingFinishListener2.onFinish(z, z2, null);
                }
            }

            public void onEncodeProgress(int i) {
                MovieSavingFragment.this.setProgress(i);
            }

            public void onEncodeStart() {
                Log.d("MovieSavingFragment", "save start");
                if (!MovieSavingFragment.this.isAdded()) {
                    MovieSavingFragment.this.showAllowingStateLoss(fragmentManager2, "MovieSavingFragment");
                }
            }
        };
        movieManager.export(tempFilePath, r0);
    }

    public static /* synthetic */ boolean lambda$onCreateDialog$134(MovieSavingFragment movieSavingFragment, DialogInterface dialogInterface, int i, KeyEvent keyEvent) {
        if (i == 4 && keyEvent.getAction() == 0) {
            return movieSavingFragment.backPress();
        }
        return false;
    }

    public static /* synthetic */ void lambda$show$135(MovieSavingFragment movieSavingFragment, Context context, boolean z, boolean z2, String str) {
        if (z) {
            if (movieSavingFragment.mOnSavingFinishListener != null) {
                movieSavingFragment.mOnSavingFinishListener.onFinish(z, z2, str);
            }
            ToastUtils.makeText(context, (int) R.string.movie_save_successfully, 0);
        } else if (!z2) {
            ToastUtils.makeText(context, (int) R.string.movie_save_failed, 0);
        }
        MovieStatUtils.statSaveResult(z ? MovieStatUtils.DOWNLOAD_SUCCESS : MovieStatUtils.DOWNLOAD_FAILED);
    }

    public static /* synthetic */ void lambda$showAndShare$136(MovieSavingFragment movieSavingFragment, Context context, boolean z, boolean z2, String str) {
        if (z) {
            ToastUtils.makeText(context, (int) R.string.movie_save_successfully, 0);
            if (movieSavingFragment.mShareCallback != null) {
                movieSavingFragment.mShareCallback.handleShareEvent(str);
            }
        } else if (!z2) {
            ToastUtils.makeText(context, (int) R.string.movie_save_failed, 0);
        }
    }

    public void onAttach(Context context) {
        super.onAttach(context);
        if (context instanceof IShareDataCallback) {
            this.mShareCallback = (IShareDataCallback) context;
        }
    }

    public Dialog onCreateDialog(Bundle bundle) {
        this.mProgressDialog = new ProgressDialog(getActivity());
        this.mProgressDialog.setMessage(getResources().getString(R.string.movie_saving));
        this.mProgressDialog.setProgressStyle(1);
        this.mProgressDialog.setIndeterminate(false);
        this.mProgressDialog.setMax(100);
        this.mProgressDialog.setCanceledOnTouchOutside(false);
        this.mProgressDialog.setOnKeyListener(new OnKeyListener() {
            public final boolean onKey(DialogInterface dialogInterface, int i, KeyEvent keyEvent) {
                return MovieSavingFragment.lambda$onCreateDialog$134(MovieSavingFragment.this, dialogInterface, i, keyEvent);
            }
        });
        setCancelable(false);
        return this.mProgressDialog;
    }

    public void onDetach() {
        super.onDetach();
        this.mShareCallback = null;
        this.mOnSavingFinishListener = null;
    }

    public void setProgress(int i) {
        this.mProgressDialog.setProgress(i);
    }

    public void show(Activity activity, MovieManager movieManager, MovieInfo movieInfo, boolean z, OnSavingFinishListener onSavingFinishListener) {
        MovieStatUtils.statSaveClick(z, movieInfo);
        Context applicationContext = activity.getApplicationContext();
        this.mOnSavingFinishListener = onSavingFinishListener;
        doSaving(applicationContext, activity.getFragmentManager(), movieManager, new OnSavingFinishListener(applicationContext) {
            private final /* synthetic */ Context f$1;

            {
                this.f$1 = r2;
            }

            public final void onFinish(boolean z, boolean z2, String str) {
                MovieSavingFragment.lambda$show$135(MovieSavingFragment.this, this.f$1, z, z2, str);
            }
        });
    }

    public void showAndShare(Activity activity, MovieManager movieManager, MovieInfo movieInfo) {
        MovieStatUtils.statShareClick(movieInfo);
        Context applicationContext = activity.getApplicationContext();
        doSaving(applicationContext, activity.getFragmentManager(), movieManager, new OnSavingFinishListener(applicationContext) {
            private final /* synthetic */ Context f$1;

            {
                this.f$1 = r2;
            }

            public final void onFinish(boolean z, boolean z2, String str) {
                MovieSavingFragment.lambda$showAndShare$136(MovieSavingFragment.this, this.f$1, z, z2, str);
            }
        });
    }
}
