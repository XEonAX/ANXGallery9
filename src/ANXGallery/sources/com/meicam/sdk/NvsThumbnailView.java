package com.meicam.sdk;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.os.Handler;
import android.util.AttributeSet;
import android.view.View;

public class NvsThumbnailView extends View {
    private long m_iconGetter = 0;
    private String m_mediaFilePath;
    private boolean m_needUpdate = false;
    private boolean m_painting = false;
    /* access modifiers changed from: private */
    public Bitmap m_thumbnail = null;
    private long m_thumbnailView = 0;

    public NvsThumbnailView(Context context) {
        super(context);
    }

    public NvsThumbnailView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    public NvsThumbnailView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
    }

    public NvsThumbnailView(Context context, AttributeSet attributeSet, int i, int i2) {
        super(context, attributeSet, i, i2);
    }

    private void cancelIconTask() {
        if (!isInEditMode()) {
            nativeCancelIconTask(this.m_iconGetter);
        }
    }

    private native void nativeCancelIconTask(long j);

    private native void nativeClose(long j);

    private native void nativeGetThumbnail(long j, String str);

    private native long nativeInit();

    public String getMediaFilePath() {
        NvsUtils.checkFunctionInMainThread();
        return this.m_mediaFilePath;
    }

    /* access modifiers changed from: protected */
    public void notifyThumbnailArrived(final Bitmap bitmap) {
        if (!this.m_painting) {
            this.m_thumbnail = bitmap;
            invalidate();
            return;
        }
        new Handler().post(new Runnable() {
            public void run() {
                NvsThumbnailView.this.m_thumbnail = bitmap;
                NvsThumbnailView.this.invalidate();
            }
        });
    }

    /* access modifiers changed from: protected */
    public void onAttachedToWindow() {
        if (!isInEditMode()) {
            this.m_thumbnailView = nativeInit();
        }
    }

    /* access modifiers changed from: protected */
    public void onDetachedFromWindow() {
        cancelIconTask();
        if (this.m_thumbnailView != 0) {
            nativeClose(this.m_thumbnailView);
            this.m_thumbnailView = 0;
            this.m_iconGetter = 0;
        }
        this.m_thumbnail = null;
        super.onDetachedFromWindow();
    }

    /* access modifiers changed from: protected */
    public void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        if (this.m_mediaFilePath != null && !this.m_mediaFilePath.isEmpty()) {
            if (this.m_thumbnail != null && !this.m_needUpdate) {
                Rect rect = new Rect();
                getDrawingRect(rect);
                int width = this.m_thumbnail.getWidth();
                int height = this.m_thumbnail.getHeight();
                double d = (double) width;
                double width2 = (double) rect.width();
                Double.isNaN(d);
                Double.isNaN(width2);
                double d2 = d / width2;
                double d3 = (double) height;
                double height2 = (double) rect.height();
                Double.isNaN(d3);
                Double.isNaN(height2);
                double d4 = d3 / height2;
                if (d2 > d4) {
                    Double.isNaN(d);
                    double d5 = d / d4;
                    int i = rect.left;
                    double width3 = (double) rect.width();
                    Double.isNaN(width3);
                    rect.left = i + ((int) ((width3 - d5) / 2.0d));
                    double d6 = (double) rect.left;
                    Double.isNaN(d6);
                    rect.right = (int) (d6 + d5);
                } else {
                    Double.isNaN(d3);
                    double d7 = d3 / d2;
                    int i2 = rect.top;
                    double height3 = (double) rect.height();
                    Double.isNaN(height3);
                    rect.top = i2 + ((int) ((height3 - d7) / 2.0d));
                    double d8 = (double) rect.top;
                    Double.isNaN(d8);
                    rect.bottom = (int) (d8 + d7);
                }
                canvas.drawBitmap(this.m_thumbnail, null, rect, new Paint(2));
            } else if (this.m_thumbnailView != 0 && this.m_iconGetter != 0) {
                this.m_needUpdate = false;
                this.m_painting = true;
                if (!isInEditMode()) {
                    nativeGetThumbnail(this.m_iconGetter, this.m_mediaFilePath);
                }
                this.m_painting = false;
            }
        }
    }

    public void setMediaFilePath(String str) {
        NvsUtils.checkFunctionInMainThread();
        if (this.m_mediaFilePath == null || str == null || !this.m_mediaFilePath.equals(str)) {
            this.m_mediaFilePath = str;
            this.m_needUpdate = true;
            cancelIconTask();
            invalidate();
        }
    }
}
