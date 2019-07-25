package com.miui.gallery.cleaner;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.drawable.Drawable;
import android.support.v4.content.ContextCompat;
import android.text.SpannableString;
import android.text.style.ImageSpan;
import com.miui.gallery.R;

public class ScanResult {
    /* access modifiers changed from: private */
    public int mAction;
    /* access modifiers changed from: private */
    public int mCount;
    /* access modifiers changed from: private */
    public int mCountText;
    /* access modifiers changed from: private */
    public int mDescription;
    /* access modifiers changed from: private */
    public ResultImage[] mImages;
    /* access modifiers changed from: private */
    public OnScanResultClickListener mOnClickListener;
    /* access modifiers changed from: private */
    public long mSize;
    /* access modifiers changed from: private */
    public int mTitle;
    /* access modifiers changed from: private */
    public int mType;

    public static class Builder {
        private int mAction;
        private Context mContext;
        private int mCount;
        private int mCountText;
        private int mDescription;
        private ResultImage[] mImages;
        private OnScanResultClickListener mOnClickListener;
        private long mSize;
        private int mTitle;
        private int mType = -1;

        public Builder(Context context) {
            this.mContext = context;
        }

        public ScanResult build() {
            if (this.mType == -1) {
                throw new RuntimeException("the type must set.");
            } else if (this.mTitle == 0) {
                throw new RuntimeException("the title must not be empty.");
            } else if (this.mAction == 0) {
                throw new RuntimeException("the action must not be empty.");
            } else if (this.mOnClickListener != null) {
                ScanResult scanResult = new ScanResult();
                scanResult.mType = this.mType;
                long j = 0;
                if (this.mSize >= 0) {
                    j = this.mSize;
                }
                scanResult.mSize = j;
                scanResult.mImages = this.mImages;
                scanResult.mCount = this.mCount;
                scanResult.mTitle = this.mTitle;
                scanResult.mDescription = this.mDescription;
                scanResult.mAction = this.mAction;
                scanResult.mCountText = this.mCountText;
                scanResult.mOnClickListener = this.mOnClickListener;
                return scanResult;
            } else {
                throw new RuntimeException("the OnScanResultClickListener must not be null");
            }
        }

        public Builder setAction(int i) {
            this.mAction = i;
            return this;
        }

        public Builder setCount(int i) {
            this.mCount = i;
            return this;
        }

        public Builder setCountText(int i) {
            this.mCountText = i;
            return this;
        }

        public Builder setDescription(int i) {
            this.mDescription = i;
            return this;
        }

        public Builder setImages(ResultImage[] resultImageArr) {
            this.mImages = resultImageArr;
            return this;
        }

        public Builder setOnScanResultClickListener(OnScanResultClickListener onScanResultClickListener) {
            this.mOnClickListener = onScanResultClickListener;
            return this;
        }

        public Builder setSize(long j) {
            this.mSize = j;
            return this;
        }

        public Builder setTitle(int i) {
            this.mTitle = i;
            return this;
        }

        public Builder setType(int i) {
            this.mType = i;
            return this;
        }
    }

    private static class CenteredImageSpan extends ImageSpan {
        CenteredImageSpan(Drawable drawable) {
            super(drawable);
        }

        public void draw(Canvas canvas, CharSequence charSequence, int i, int i2, float f, int i3, int i4, int i5, Paint paint) {
            Drawable drawable = getDrawable();
            canvas.save();
            canvas.translate(f, ((float) (i5 - drawable.getBounds().bottom)) / 2.0f);
            drawable.draw(canvas);
            canvas.restore();
        }
    }

    public interface OnScanResultClickListener {
        void onClick(Context context);
    }

    public static class ResultImage {
        public long mId;
        public String mPath;

        public ResultImage(long j, String str) {
            this.mId = j;
            this.mPath = str;
        }
    }

    private ScanResult() {
    }

    public int getAction() {
        return this.mAction;
    }

    public int getDescription() {
        return this.mDescription;
    }

    public ResultImage[] getImages() {
        return this.mImages;
    }

    public CharSequence getMergedTitle(Context context) {
        String string = context.getString(this.mTitle);
        if (this.mCount <= 0) {
            return string;
        }
        String quantityString = context.getResources().getQuantityString(this.mCountText, this.mCount, new Object[]{Integer.valueOf(this.mCount)});
        Drawable drawable = ContextCompat.getDrawable(context, R.drawable.info_divider);
        drawable.setBounds(0, 0, drawable.getIntrinsicWidth(), drawable.getIntrinsicHeight());
        CenteredImageSpan centeredImageSpan = new CenteredImageSpan(drawable);
        StringBuilder sb = new StringBuilder();
        sb.append(string);
        sb.append("+");
        sb.append(quantityString);
        SpannableString spannableString = new SpannableString(sb.toString());
        spannableString.setSpan(centeredImageSpan, string.length(), string.length() + 1, 33);
        return spannableString;
    }

    public long getSize() {
        return this.mSize;
    }

    public int getType() {
        return this.mType;
    }

    public void onClick(Context context) {
        if (this.mOnClickListener != null) {
            this.mOnClickListener.onClick(context);
        }
    }
}
