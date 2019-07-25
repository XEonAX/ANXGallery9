package com.miui.gallery.editor.photo.screen.core;

import android.graphics.Bitmap;
import android.os.AsyncTask;
import com.miui.gallery.editor.photo.app.DraftManager;
import com.miui.gallery.editor.photo.screen.base.ScreenRenderCallback;
import com.miui.gallery.util.Log;
import io.reactivex.Observable;
import io.reactivex.ObservableEmitter;
import io.reactivex.ObservableOnSubscribe;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.functions.Consumer;
import io.reactivex.schedulers.Schedulers;

public class ScreenRenderManager {
    private DraftManager mDraftManager;
    private Bitmap mOrigin;
    private OnOriginLoadedListener mOriginLoadedListener;
    private Bitmap mRenderBitmap;

    public interface OnOriginLoadedListener {
        void onRefresh(Bitmap bitmap);
    }

    public ScreenRenderManager(DraftManager draftManager) {
        this.mDraftManager = draftManager;
    }

    private Bitmap getOriginBitmap() {
        return this.mOrigin == null ? this.mDraftManager.getPreview() : this.mOrigin;
    }

    public static /* synthetic */ void lambda$decodeOrigin$52(ScreenRenderManager screenRenderManager, Bitmap bitmap) throws Exception {
        screenRenderManager.mOrigin = bitmap;
        if (screenRenderManager.mOriginLoadedListener != null) {
            screenRenderManager.mOriginLoadedListener.onRefresh(screenRenderManager.mOrigin);
        }
    }

    public static /* synthetic */ void lambda$renderBitmap$54(ScreenRenderManager screenRenderManager, ScreenRenderCallback screenRenderCallback, boolean z, Bitmap bitmap) throws Exception {
        screenRenderManager.mRenderBitmap = bitmap;
        screenRenderCallback.setShareBitmap(bitmap, true);
        screenRenderCallback.onComplete(z);
    }

    public void decodeOrigin() {
        if (this.mDraftManager.isPreviewSameWithOrigin()) {
            this.mOrigin = this.mDraftManager.getPreview();
            if (this.mOriginLoadedListener != null) {
                this.mOriginLoadedListener.onRefresh(this.mOrigin);
                return;
            }
            return;
        }
        Observable.create(new ObservableOnSubscribe() {
            public final void subscribe(ObservableEmitter observableEmitter) {
                observableEmitter.onNext(ScreenRenderManager.this.mDraftManager.decodeOrigin());
            }
        }).subscribeOn(Schedulers.from(AsyncTask.THREAD_POOL_EXECUTOR)).observeOn(AndroidSchedulers.mainThread()).subscribe((Consumer<? super T>) new Consumer() {
            public final void accept(Object obj) {
                ScreenRenderManager.lambda$decodeOrigin$52(ScreenRenderManager.this, (Bitmap) obj);
            }
        });
    }

    public Bitmap getRenderBitmap() {
        return this.mRenderBitmap == null ? getOriginBitmap() : this.mRenderBitmap;
    }

    public void release() {
        if (this.mRenderBitmap != null && !this.mRenderBitmap.isRecycled()) {
            this.mRenderBitmap.recycle();
            this.mRenderBitmap = null;
        }
        if (this.mOrigin != null && !this.mOrigin.isRecycled()) {
            this.mOrigin.recycle();
            this.mOrigin = null;
        }
    }

    public void renderBitmap(boolean z, ScreenRenderData screenRenderData, ScreenRenderCallback screenRenderCallback) {
        Log.d("ScreenRenderManager", "renderBitmap: start.");
        Observable.create(new ObservableOnSubscribe(screenRenderData) {
            private final /* synthetic */ ScreenRenderData f$1;

            {
                this.f$1 = r2;
            }

            public final void subscribe(ObservableEmitter observableEmitter) {
                observableEmitter.onNext(this.f$1.apply(ScreenRenderManager.this.getOriginBitmap()));
            }
        }).subscribeOn(Schedulers.from(AsyncTask.THREAD_POOL_EXECUTOR)).observeOn(AndroidSchedulers.mainThread()).subscribe((Consumer<? super T>) new Consumer(screenRenderCallback, z) {
            private final /* synthetic */ ScreenRenderCallback f$1;
            private final /* synthetic */ boolean f$2;

            {
                this.f$1 = r2;
                this.f$2 = r3;
            }

            public final void accept(Object obj) {
                ScreenRenderManager.lambda$renderBitmap$54(ScreenRenderManager.this, this.f$1, this.f$2, (Bitmap) obj);
            }
        });
    }

    public void setOriginLoadedListener(OnOriginLoadedListener onOriginLoadedListener) {
        this.mOriginLoadedListener = onOriginLoadedListener;
    }
}
