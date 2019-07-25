package com.meicam.sdk;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.PorterDuff.Mode;
import android.graphics.PorterDuffXfermode;
import android.graphics.Rect;
import android.util.AttributeSet;
import android.view.View;
import com.meicam.sdk.NvsWaveformDataGenerator.WaveformDataCallback;

public class NvsWaveformView extends View implements WaveformDataCallback {
    private long m_audioFileDuration = 0;
    private String m_audioFilePath;
    private long m_audioFileSampleCount = 0;
    private long m_currentTaskId = 0;
    private float[] m_leftWaveformData;
    private boolean m_needUpdateWaveformData = false;
    private float[] m_rightWaveformData;
    private long m_samplesPerGroup = 0;
    private boolean m_singleChannelMode = false;
    private long m_trimIn = 0;
    private long m_trimOut = 0;
    private int m_waveformColor = -16777216;
    private NvsWaveformDataGenerator m_waveformDataGenerator;

    public NvsWaveformView(Context context) {
        super(context);
        NvsUtils.checkFunctionInMainThread();
        init();
    }

    public NvsWaveformView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        NvsUtils.checkFunctionInMainThread();
        init();
    }

    public NvsWaveformView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        NvsUtils.checkFunctionInMainThread();
        init();
    }

    public NvsWaveformView(Context context, AttributeSet attributeSet, int i, int i2) {
        super(context, attributeSet, i, i2);
        NvsUtils.checkFunctionInMainThread();
        init();
    }

    private long calcExpectedSamplesPerGroup() {
        double d = (double) (this.m_trimOut - this.m_trimIn);
        double d2 = (double) this.m_audioFileDuration;
        Double.isNaN(d);
        Double.isNaN(d2);
        double d3 = d / d2;
        double d4 = (double) this.m_audioFileSampleCount;
        Double.isNaN(d4);
        long j = (long) (d4 * d3);
        int width = getWidth();
        if (width <= 0) {
            return 1;
        }
        return Math.max((j + ((long) (width / 2))) / ((long) width), 1);
    }

    private void cancelCurrentTask() {
        if (!isInEditMode() && this.m_currentTaskId != 0) {
            if (this.m_waveformDataGenerator != null) {
                this.m_waveformDataGenerator.cancelTask(this.m_currentTaskId);
            }
            this.m_currentTaskId = 0;
        }
    }

    private void init() {
        if (!isInEditMode()) {
            this.m_waveformDataGenerator = new NvsWaveformDataGenerator();
            this.m_waveformDataGenerator.setWaveformDataCallback(this);
        }
        setBackgroundColor(-1);
    }

    private void validateWaveformData() {
        if (this.m_samplesPerGroup <= 0) {
            this.m_needUpdateWaveformData = true;
            cancelCurrentTask();
            return;
        }
        if (calcExpectedSamplesPerGroup() != this.m_samplesPerGroup) {
            this.m_needUpdateWaveformData = true;
            cancelCurrentTask();
            invalidate();
        }
    }

    public String getAudioFilePath() {
        NvsUtils.checkFunctionInMainThread();
        return this.m_audioFilePath;
    }

    public boolean getSingleChannelMode() {
        NvsUtils.checkFunctionInMainThread();
        return this.m_singleChannelMode;
    }

    public long getTrimIn() {
        NvsUtils.checkFunctionInMainThread();
        return this.m_trimIn;
    }

    public long getTrimOut() {
        NvsUtils.checkFunctionInMainThread();
        return this.m_trimOut;
    }

    public int getWaveformColor() {
        NvsUtils.checkFunctionInMainThread();
        return this.m_waveformColor;
    }

    /* access modifiers changed from: protected */
    public void onAttachedToWindow() {
    }

    /* access modifiers changed from: protected */
    public void onDetachedFromWindow() {
        cancelCurrentTask();
        if (this.m_waveformDataGenerator != null) {
            this.m_waveformDataGenerator.setWaveformDataCallback(null);
            this.m_waveformDataGenerator.release();
            this.m_waveformDataGenerator = null;
        }
        super.onDetachedFromWindow();
    }

    /* access modifiers changed from: protected */
    public void onDraw(Canvas canvas) {
        Rect rect;
        int i;
        Canvas canvas2 = canvas;
        super.onDraw(canvas);
        if (!isInEditMode() && this.m_audioFileDuration > 0) {
            if (this.m_needUpdateWaveformData && this.m_waveformDataGenerator != null) {
                this.m_needUpdateWaveformData = false;
                this.m_currentTaskId = this.m_waveformDataGenerator.generateWaveformData(this.m_audioFilePath, calcExpectedSamplesPerGroup(), 0);
            }
            if (this.m_samplesPerGroup > 0 && this.m_leftWaveformData != null) {
                int length = this.m_leftWaveformData.length / 2;
                int length2 = (this.m_rightWaveformData == null || this.m_singleChannelMode) ? 0 : this.m_rightWaveformData.length / 2;
                if (length != 0) {
                    int width = getWidth();
                    int height = getHeight();
                    if (length2 != 0) {
                        height /= 2;
                    }
                    Rect rect2 = new Rect();
                    Paint paint = new Paint();
                    paint.setStyle(Style.FILL);
                    paint.setAntiAlias(false);
                    paint.setColor(this.m_waveformColor);
                    Color.alpha(this.m_waveformColor);
                    paint.setXfermode(new PorterDuffXfermode(Mode.SRC));
                    double d = (double) this.m_trimIn;
                    double d2 = (double) this.m_audioFileDuration;
                    Double.isNaN(d);
                    Double.isNaN(d2);
                    double d3 = d / d2;
                    double d4 = (double) this.m_audioFileSampleCount;
                    Double.isNaN(d4);
                    long j = (long) (d3 * d4);
                    double d5 = (double) (this.m_trimOut - this.m_trimIn);
                    double d6 = (double) this.m_audioFileDuration;
                    Double.isNaN(d5);
                    Double.isNaN(d6);
                    double d7 = d5 / d6;
                    double d8 = (double) this.m_audioFileSampleCount;
                    Double.isNaN(d8);
                    long j2 = (long) (d7 * d8);
                    if (j2 != 0) {
                        int i2 = 0;
                        while (i2 < width) {
                            double d9 = (double) i2;
                            Rect rect3 = rect2;
                            Paint paint2 = paint;
                            double d10 = (double) width;
                            Double.isNaN(d9);
                            Double.isNaN(d10);
                            double d11 = d9 / d10;
                            double d12 = (double) j2;
                            Double.isNaN(d12);
                            int i3 = (int) ((((long) (d11 * d12)) + j) / this.m_samplesPerGroup);
                            if (i3 < length) {
                                float f = (float) height;
                                int i4 = i3 * 2;
                                rect = rect3;
                                rect.set(i2, (int) ((1.0f - ((this.m_leftWaveformData[i4 + 1] + 1.0f) / 2.0f)) * f), i2 + 1, (int) (f * (1.0f - ((this.m_leftWaveformData[i4] + 1.0f) / 2.0f))));
                                paint = paint2;
                                canvas2.drawRect(rect, paint);
                            } else {
                                rect = rect3;
                                paint = paint2;
                            }
                            if (i3 < length2) {
                                float f2 = (float) height;
                                int i5 = i3 * 2;
                                i = length;
                                rect.set(i2, ((int) ((1.0f - ((this.m_rightWaveformData[i5 + 1] + 1.0f) / 2.0f)) * f2)) + height, i2 + 1, ((int) (f2 * (1.0f - ((this.m_rightWaveformData[i5] + 1.0f) / 2.0f)))) + height);
                                canvas2.drawRect(rect, paint);
                            } else {
                                i = length;
                            }
                            i2++;
                            rect2 = rect;
                            length = i;
                        }
                    }
                }
            }
        }
    }

    /* access modifiers changed from: protected */
    public void onSizeChanged(int i, int i2, int i3, int i4) {
        if (i3 != i) {
            validateWaveformData();
        }
        super.onSizeChanged(i, i2, i3, i4);
    }

    public void onWaveformDataGenerationFailed(long j, String str, long j2) {
    }

    public void onWaveformDataReady(long j, String str, long j2, long j3, float[] fArr, float[] fArr2) {
        this.m_leftWaveformData = fArr;
        this.m_rightWaveformData = fArr2;
        this.m_samplesPerGroup = j3;
        this.m_currentTaskId = 0;
        invalidate();
    }

    public void setAudioFilePath(String str) {
        NvsUtils.checkFunctionInMainThread();
        if (this.m_audioFilePath != null && this.m_audioFilePath != null && this.m_audioFilePath.equals(str)) {
            return;
        }
        if (str == null) {
            this.m_audioFilePath = null;
            this.m_audioFileSampleCount = 0;
            cancelCurrentTask();
            invalidate();
        } else if (this.m_waveformDataGenerator != null) {
            long audioFileDuration = this.m_waveformDataGenerator.getAudioFileDuration(str);
            long audioFileSampleCount = this.m_waveformDataGenerator.getAudioFileSampleCount(str);
            if (audioFileDuration > 0 && audioFileSampleCount > 0) {
                this.m_audioFilePath = str;
                this.m_audioFileDuration = audioFileDuration;
                this.m_audioFileSampleCount = audioFileSampleCount;
                this.m_trimIn = 0;
                this.m_trimOut = audioFileDuration;
                this.m_needUpdateWaveformData = true;
                cancelCurrentTask();
                invalidate();
            }
        }
    }

    public void setSingleChannelMode(boolean z) {
        NvsUtils.checkFunctionInMainThread();
        if (z != this.m_singleChannelMode) {
            this.m_singleChannelMode = z;
            invalidate();
        }
    }

    public void setTrimIn(long j) {
        NvsUtils.checkFunctionInMainThread();
        long max = Math.max(j, 0);
        if (max != this.m_trimIn) {
            this.m_trimIn = max;
            validateWaveformData();
        }
    }

    public void setTrimOut(long j) {
        NvsUtils.checkFunctionInMainThread();
        long min = Math.min(Math.max(j, this.m_trimIn + 1), this.m_audioFileDuration);
        if (min != this.m_trimOut) {
            this.m_trimOut = min;
            validateWaveformData();
        }
    }

    public void setWaveformColor(int i) {
        NvsUtils.checkFunctionInMainThread();
        if (i != this.m_waveformColor) {
            this.m_waveformColor = i;
            invalidate();
        }
    }
}
