package com.miui.gallery.editor.photo.widgets;

import android.content.Context;
import android.graphics.Bitmap;
import android.opengl.GLES20;
import android.util.AttributeSet;
import com.miui.arcsoftbeauty.ArcsoftBeautyJni;
import com.miui.filtersdk.beauty.BeautyParameterType;
import com.miui.filtersdk.beauty.BeautyProcessorManager;
import com.miui.filtersdk.beauty.IntelligentBeautyProcessor;
import com.miui.filtersdk.filter.YUVBeautyFilter;
import com.miui.filtersdk.utils.Rotation;
import com.miui.gallery.editor.photo.app.miuibeautify.MiuiBeautyFragment;
import com.miui.gallery.editor.photo.widgets.base.MagicBaseView;
import com.miui.gallery.editor.photo.widgets.base.MagicBaseView.ScaleType;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.nio.channels.FileChannel;
import java.nio.channels.FileChannel.MapMode;
import java.util.Map;
import javax.microedition.khronos.egl.EGLConfig;
import javax.microedition.khronos.opengles.GL10;

public class BeautyImageView extends MagicBaseView {
    private IntelligentBeautyProcessor mBeautyProcessor;
    private int mBufferSize;
    private Context mContext;
    private boolean mFirstRenderFinished;
    private boolean mHasRawYuv;
    private InitRenderCallback mInitRenderCallback;
    private byte[] mPicData;
    private int mRenderRecordIndex;
    private YUVBeautyFilter mYUVFilter;

    public interface InitRenderCallback {
        void onRenderFinish();
    }

    public BeautyImageView(Context context) {
        this(context, null);
    }

    public BeautyImageView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.mRenderRecordIndex = -1;
        this.mFirstRenderFinished = false;
        this.mContext = context;
        getHolder().addCallback(this);
        this.scaleType = ScaleType.CENTER_INSIDE;
        this.mYUVFilter = getYUVBeautyRender();
        this.mHasRawYuv = false;
    }

    private File getTmpRecordFile(int i) {
        File file = new File(this.mContext.getCacheDir(), "beauty-records");
        if (!file.exists() && !file.mkdir()) {
            return null;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("beauty_record_temp_");
        sb.append(i);
        return new File(file, sb.toString());
    }

    private YUVBeautyFilter getYUVBeautyRender() {
        YUVBeautyFilter yUVBeautyFilter = new YUVBeautyFilter();
        IntelligentBeautyProcessor beautyProcessor = BeautyProcessorManager.INSTANCE.getBeautyProcessor();
        beautyProcessor.setRotation(0);
        this.mBeautyProcessor = beautyProcessor;
        yUVBeautyFilter.setBeautyProcessor(beautyProcessor);
        return yUVBeautyFilter;
    }

    private void readRecordBuffer() {
        RandomAccessFile randomAccessFile;
        IOException e;
        try {
            randomAccessFile = new RandomAccessFile(getTmpRecordFile(this.mRenderRecordIndex), "r");
            try {
                FileChannel channel = randomAccessFile.getChannel();
                channel.map(MapMode.READ_ONLY, 0, channel.size()).get(this.mPicData);
            } catch (IOException e2) {
                e = e2;
            }
        } catch (IOException e3) {
            IOException iOException = e3;
            randomAccessFile = null;
            e = iOException;
            try {
                e.printStackTrace();
                MiscUtil.closeSilently(randomAccessFile);
            } catch (Throwable th) {
                th = th;
                MiscUtil.closeSilently(randomAccessFile);
                throw th;
            }
        } catch (Throwable th2) {
            Throwable th3 = th2;
            randomAccessFile = null;
            th = th3;
            MiscUtil.closeSilently(randomAccessFile);
            throw th;
        }
        MiscUtil.closeSilently(randomAccessFile);
    }

    private void refreshDisplay() {
        requestRender();
    }

    public boolean clearAllRecords() {
        boolean z = true;
        for (int i = 0; i < MiuiBeautyFragment.BEAUTY_RECORDS_MAX; i++) {
            File tmpRecordFile = getTmpRecordFile(i);
            if (tmpRecordFile != null && tmpRecordFile.exists() && !tmpRecordFile.delete()) {
                StringBuilder sb = new StringBuilder();
                sb.append("Failed to delete beauty record file: ");
                sb.append(tmpRecordFile.getPath());
                Log.e("BeautyImageView", sb.toString());
                z = false;
            }
        }
        return z;
    }

    public void getBmpFromCurrBuffer(Bitmap bitmap) {
        ArcsoftBeautyJni.updateBmpWithYuvBuffer(bitmap, this.imageWidth, this.imageHeight, this.mPicData);
    }

    public void onDrawFrame(GL10 gl10) {
        GLES20.glClearColor(1.0f, 1.0f, 1.0f, 0.0f);
        GLES20.glClear(16640);
        this.mYUVFilter.onDrawFrame(0, this.gLCubeBuffer, this.gLTextureBuffer);
        if (!this.mFirstRenderFinished) {
            if (this.mInitRenderCallback != null) {
                this.mInitRenderCallback.onRenderFinish();
            }
            this.mFirstRenderFinished = true;
        }
    }

    public void onSurfaceChanged(GL10 gl10, int i, int i2) {
        super.onSurfaceChanged(gl10, i, i2);
        adjustSize(Rotation.NORMAL.asInt(), false, false);
    }

    public void onSurfaceCreated(GL10 gl10, EGLConfig eGLConfig) {
        super.onSurfaceCreated(gl10, eGLConfig);
        this.mYUVFilter.init();
    }

    public void reloadTexture(boolean z) {
        if (z) {
            this.mYUVFilter.genYUVTextures(this.mPicData, this.imageWidth, this.imageHeight);
            this.mBeautyProcessor.clearBeautyParameters();
            return;
        }
        byte[] bArr = new byte[(((this.imageWidth * this.imageHeight) * 3) / 2)];
        System.arraycopy(this.mPicData, 0, bArr, 0, ((this.imageWidth * this.imageHeight) * 3) / 2);
        this.mYUVFilter.genYUVTextures(bArr, this.imageWidth, this.imageHeight);
    }

    public void renderNextBuffer() {
        this.mRenderRecordIndex = (this.mRenderRecordIndex + 1) % MiuiBeautyFragment.BEAUTY_RECORDS_MAX;
        readRecordBuffer();
        reloadTexture(false);
        refreshDisplay();
    }

    public void renderPreviousBuffer() {
        this.mRenderRecordIndex = (this.mRenderRecordIndex - 1) % MiuiBeautyFragment.BEAUTY_RECORDS_MAX;
        if (this.mRenderRecordIndex < 0) {
            this.mRenderRecordIndex += MiuiBeautyFragment.BEAUTY_RECORDS_MAX;
        }
        readRecordBuffer();
        reloadTexture(false);
        refreshDisplay();
    }

    public void setInitRenderCallback(InitRenderCallback initRenderCallback) {
        this.mInitRenderCallback = initRenderCallback;
    }

    public void setPicData(Bitmap bitmap) {
        setPicData(bitmap, true);
    }

    public void setPicData(Bitmap bitmap, boolean z) {
        this.imageWidth = bitmap.getWidth();
        this.imageHeight = bitmap.getHeight();
        if (!this.mHasRawYuv) {
            this.mBufferSize = ((this.imageWidth * this.imageHeight) * 3) / 2;
            this.mPicData = new byte[this.mBufferSize];
            ArcsoftBeautyJni.encodeYUV420SP(bitmap, this.imageWidth, this.imageHeight, this.mPicData);
            writeRecordFile();
            this.mHasRawYuv = true;
        }
        reloadTexture(false);
        if (z) {
            refreshDisplay();
        }
    }

    public void updateBeautyProcessor(Map<BeautyParameterType, Float> map) {
        if (map == null || map.size() == 0) {
            this.mBeautyProcessor.clearBeautyParameters();
        } else {
            this.mBeautyProcessor.setBeautyParamsDegree(map);
        }
    }

    public void writeRecordFile() {
        RandomAccessFile randomAccessFile;
        IOException e;
        this.mYUVFilter.genYUVTextures(this.mPicData, this.imageWidth, this.imageHeight);
        this.mBeautyProcessor.clearBeautyParameters();
        this.mRenderRecordIndex = (this.mRenderRecordIndex + 1) % MiuiBeautyFragment.BEAUTY_RECORDS_MAX;
        try {
            randomAccessFile = new RandomAccessFile(getTmpRecordFile(this.mRenderRecordIndex), "rw");
            try {
                randomAccessFile.getChannel().map(MapMode.READ_WRITE, 0, (long) this.mBufferSize).put(this.mPicData);
            } catch (IOException e2) {
                e = e2;
            }
        } catch (IOException e3) {
            IOException iOException = e3;
            randomAccessFile = null;
            e = iOException;
            try {
                e.printStackTrace();
                MiscUtil.closeSilently(randomAccessFile);
            } catch (Throwable th) {
                th = th;
                MiscUtil.closeSilently(randomAccessFile);
                throw th;
            }
        } catch (Throwable th2) {
            Throwable th3 = th2;
            randomAccessFile = null;
            th = th3;
            MiscUtil.closeSilently(randomAccessFile);
            throw th;
        }
        MiscUtil.closeSilently(randomAccessFile);
    }
}
