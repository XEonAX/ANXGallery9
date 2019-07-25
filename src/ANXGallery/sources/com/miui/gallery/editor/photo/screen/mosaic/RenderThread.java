package com.miui.gallery.editor.photo.screen.mosaic;

import android.graphics.Bitmap;
import android.graphics.Matrix;
import android.os.Handler;
import android.os.Handler.Callback;
import android.os.HandlerThread;
import android.os.Message;
import com.miui.gallery.editor.photo.screen.mosaic.shader.MosaicEntity;
import com.miui.gallery.editor.photo.screen.mosaic.shader.MosaicShaderHolder;
import com.miui.gallery.threadpool.ThreadManager;

class RenderThread extends HandlerThread implements Callback {
    private Handler mHandler;
    private Handler mMainHandler = ThreadManager.getMainHandler();
    private RenderListener mRenderListener;

    interface RenderListener {
        void onShaderComplete(MosaicShaderHolder mosaicShaderHolder);
    }

    static class RenderShaderData {
        Matrix bitmapMatrix;
        Bitmap current;
        MosaicEntity mosaicEntity;

        RenderShaderData() {
        }
    }

    RenderThread() {
        super("mosaic_render_thread");
        start();
        this.mHandler = new Handler(getLooper(), this);
    }

    public static /* synthetic */ void lambda$handleMessage$46(RenderThread renderThread, MosaicShaderHolder mosaicShaderHolder) {
        if (renderThread.mRenderListener != null) {
            renderThread.mRenderListener.onShaderComplete(mosaicShaderHolder);
        }
    }

    public boolean handleMessage(Message message) {
        if (message.what == 0) {
            RenderShaderData renderShaderData = (RenderShaderData) message.obj;
            MosaicShaderHolder generateShader = renderShaderData.mosaicEntity.generateShader(renderShaderData.current, renderShaderData.bitmapMatrix);
            if (this.mRenderListener != null) {
                this.mMainHandler.post(new Runnable(generateShader) {
                    private final /* synthetic */ MosaicShaderHolder f$1;

                    {
                        this.f$1 = r2;
                    }

                    public final void run() {
                        RenderThread.lambda$handleMessage$46(RenderThread.this, this.f$1);
                    }
                });
            }
        }
        return true;
    }

    /* access modifiers changed from: 0000 */
    public void sendGenerateShaderMsg(MosaicEntity mosaicEntity, Bitmap bitmap, Matrix matrix) {
        this.mHandler.removeMessages(0);
        RenderShaderData renderShaderData = new RenderShaderData();
        renderShaderData.mosaicEntity = mosaicEntity;
        renderShaderData.current = bitmap;
        renderShaderData.bitmapMatrix = matrix;
        Message obtain = Message.obtain();
        obtain.what = 0;
        obtain.obj = renderShaderData;
        this.mHandler.sendMessage(obtain);
    }

    /* access modifiers changed from: 0000 */
    public void setRenderListener(RenderListener renderListener) {
        this.mRenderListener = renderListener;
    }
}
