package com.miui.gallery.editor.photo.core.imports.text.utils;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Paint.FontMetricsInt;
import android.graphics.RectF;
import android.os.Build.VERSION;
import android.text.TextPaint;
import android.text.TextUtils;
import com.miui.gallery.util.Log;
import java.util.ArrayList;
import java.util.List;

public class AutoLineLayout {
    private RectF mBound = new RectF();
    /* access modifiers changed from: private */
    public FontMetricsInt mFontMetricsInt = new FontMetricsInt();
    private boolean mIsSingleVerticalText;
    private float mLineHeight = 0.0f;
    private float mLineHeightOffset = 0.0f;
    private int mMaxLines;
    private MultipleLineText mMultipleLineText = new MultipleLineText();
    private String mOriginText;
    /* access modifiers changed from: private */
    public final TextPaint mPaint = new TextPaint(1);
    private String mText;
    private TextAlignment mTextAlignment = TextAlignment.LEFT;

    private class MultipleLineText {
        /* access modifiers changed from: private */
        public float mHeight;
        /* access modifiers changed from: private */
        public String mLongestText;
        /* access modifiers changed from: private */
        public List<SingleLineText> mSingleLineTextList;
        /* access modifiers changed from: private */
        public float mWidth;

        private MultipleLineText() {
            this.mSingleLineTextList = new ArrayList();
            this.mLongestText = "";
            this.mHeight = 0.0f;
            this.mWidth = 0.0f;
        }

        /* access modifiers changed from: private */
        public void reset() {
            this.mSingleLineTextList.clear();
            this.mHeight = 0.0f;
            this.mWidth = 0.0f;
        }
    }

    private class SingleLineText {
        /* access modifiers changed from: private */
        public StringBuilder mBuilder;
        /* access modifiers changed from: private */
        public float mWidth;

        private SingleLineText() {
            this.mBuilder = new StringBuilder("");
            this.mWidth = 0.0f;
        }

        public void count() {
            this.mWidth = AutoLineLayout.this.mPaint.measureText(this.mBuilder.toString());
        }

        public void draw(Canvas canvas) {
            canvas.drawText(this.mBuilder, 0, this.mBuilder.length(), 0.0f, (float) (-AutoLineLayout.this.mFontMetricsInt.ascent), AutoLineLayout.this.mPaint);
        }
    }

    public enum TextAlignment {
        LEFT,
        CENTER,
        RIGHT
    }

    public AutoLineLayout() {
        this.mPaint.setColor(-1);
    }

    private List<SingleLineText> cutSingleLineTextByWidth(SingleLineText singleLineText, float f, int i) {
        int i2;
        ArrayList arrayList = new ArrayList();
        if (i <= 0) {
            return arrayList;
        }
        char[] charArray = singleLineText.mBuilder.toString().toCharArray();
        int i3 = 0;
        SingleLineText singleLineText2 = new SingleLineText();
        int i4 = 0;
        while (i2 <= charArray.length) {
            int i5 = i2 - i4;
            if (this.mPaint.measureText(charArray, i4, i5) > f) {
                i2--;
                if (i2 == i4) {
                    i2++;
                }
                singleLineText2.mBuilder.append(charArray, i4, i2 - i4);
                singleLineText2.count();
                arrayList.add(singleLineText2);
                if (arrayList.size() >= i) {
                    return arrayList;
                }
                singleLineText2 = new SingleLineText();
                i4 = i2;
            } else if (i2 == charArray.length) {
                singleLineText2.mBuilder.append(charArray, i4, i5);
                singleLineText2.count();
                arrayList.add(singleLineText2);
                if (arrayList.size() >= i) {
                    return arrayList;
                }
            } else {
                continue;
            }
            i3 = i2 + 1;
        }
        return arrayList;
    }

    private void cutText() {
        long currentTimeMillis = System.currentTimeMillis();
        this.mPaint.getFontMetricsInt(this.mFontMetricsInt);
        this.mLineHeight = getLineHeight();
        this.mMultipleLineText.reset();
        if (!TextUtils.isEmpty(this.mText)) {
            List access$100 = this.mMultipleLineText.mSingleLineTextList;
            access$100.add(new SingleLineText());
            int i = 0;
            while (i < this.mText.length()) {
                int indexOf = TextUtils.indexOf(this.mText, 10, i, this.mText.length());
                SingleLineText singleLineText = (SingleLineText) access$100.get(access$100.size() - 1);
                singleLineText.mBuilder.append(this.mText.substring(i, indexOf == -1 ? this.mText.length() : indexOf));
                singleLineText.count();
                if (singleLineText.mWidth > this.mMultipleLineText.mWidth) {
                    this.mMultipleLineText.mWidth = singleLineText.mWidth;
                    this.mMultipleLineText.mLongestText = singleLineText.mBuilder.toString();
                }
                if (indexOf == -1) {
                    break;
                }
                access$100.add(new SingleLineText());
                i = indexOf + 1;
            }
            this.mMultipleLineText.mHeight = ((float) this.mMultipleLineText.mSingleLineTextList.size()) * this.mLineHeight;
            Log.d("AutoLineLayout", "cut text coast time： %d", (Object) Long.valueOf(System.currentTimeMillis() - currentTimeMillis));
        }
    }

    private void findSuitableTextSize(float f, float f2, float f3, float f4, float f5) {
        float textSize = this.mPaint.getTextSize();
        float access$900 = this.mMultipleLineText.mHeight;
        float access$200 = this.mMultipleLineText.mWidth;
        float f6 = textSize;
        while (access$200 < f && access$900 < f2 && f6 <= f4) {
            f6 += f5;
            this.mPaint.setTextSize(f6);
            access$900 = this.mPaint.getFontSpacing() * ((float) this.mMultipleLineText.mSingleLineTextList.size());
            access$200 = this.mMultipleLineText.mWidth * (f6 / textSize);
        }
        while (true) {
            if ((access$200 > f || access$900 > f2) && f6 >= f3) {
                f6 -= f5;
                this.mPaint.setTextSize(f6);
                access$900 = this.mPaint.getFontSpacing() * ((float) this.mMultipleLineText.mSingleLineTextList.size());
                access$200 = this.mMultipleLineText.mWidth * (f6 / textSize);
            }
        }
        float measureText = this.mPaint.measureText(this.mMultipleLineText.mLongestText);
        while (measureText < f && access$900 < f2 && f6 <= f4) {
            f6 += f5;
            this.mPaint.setTextSize(f6);
            access$900 = ((float) this.mMultipleLineText.mSingleLineTextList.size()) * this.mPaint.getFontSpacing();
            measureText = this.mPaint.measureText(this.mMultipleLineText.mLongestText);
        }
        while (true) {
            if ((measureText > f || access$900 > f2) && f6 >= f3) {
                f6 -= f5;
                this.mPaint.setTextSize(f6);
                access$900 = this.mPaint.getFontSpacing() * ((float) this.mMultipleLineText.mSingleLineTextList.size());
                measureText = this.mPaint.measureText(this.mMultipleLineText.mLongestText);
            }
        }
        this.mMultipleLineText.mWidth = measureText;
        this.mMultipleLineText.mHeight = access$900;
        refreshRect();
    }

    private float getLineHeight() {
        return this.mPaint.getFontSpacing() + this.mLineHeightOffset;
    }

    private static String getSingleLineText(String str) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < str.length(); i++) {
            char charAt = str.charAt(i);
            if (charAt != 10) {
                sb.append(charAt);
                if (i < str.length() - 1) {
                    sb.append(10);
                }
            }
        }
        return sb.toString();
    }

    private void refreshRect() {
        float access$200 = this.mMultipleLineText.mWidth / 2.0f;
        float access$900 = this.mMultipleLineText.mHeight / 2.0f;
        this.mLineHeight = getLineHeight();
        this.mBound.set(-access$200, -access$900, access$200, access$900);
    }

    public void countText() {
        cutText();
        refreshRect();
    }

    public void countText(float f, float f2) {
        this.mPaint.getFontMetricsInt(this.mFontMetricsInt);
        this.mLineHeight = getLineHeight();
        this.mMultipleLineText.reset();
        if (f != 0.0f && f2 != 0.0f) {
            if (f < 0.0f) {
                f = Float.MAX_VALUE;
            }
            int i = f2 < 0.0f ? Integer.MAX_VALUE : (int) (f2 / this.mLineHeight);
            if (i < 1) {
                i = 1;
            }
            if (this.mMaxLines > 0 && i > this.mMaxLines) {
                i = this.mMaxLines;
            }
            List access$100 = this.mMultipleLineText.mSingleLineTextList;
            access$100.add(new SingleLineText());
            int i2 = 0;
            while (i2 < this.mText.length() && access$100.size() <= i) {
                int indexOf = TextUtils.indexOf(this.mText, 10, i2, this.mText.length());
                SingleLineText singleLineText = (SingleLineText) access$100.get(access$100.size() - 1);
                singleLineText.mBuilder.append(this.mText.substring(i2, indexOf == -1 ? this.mText.length() : indexOf));
                singleLineText.count();
                if (singleLineText.mWidth > f) {
                    access$100.remove(access$100.size() - 1);
                    access$100.addAll(cutSingleLineTextByWidth(singleLineText, f, i - access$100.size()));
                }
                if (indexOf == -1) {
                    break;
                }
                access$100.add(new SingleLineText());
                i2 = indexOf + 1;
            }
            while (access$100.size() > i) {
                access$100.remove(this.mMultipleLineText.mSingleLineTextList.size() - 1);
            }
            for (SingleLineText singleLineText2 : this.mMultipleLineText.mSingleLineTextList) {
                if (singleLineText2.mWidth > this.mMultipleLineText.mWidth) {
                    this.mMultipleLineText.mWidth = singleLineText2.mWidth;
                }
            }
            this.mMultipleLineText.mHeight = this.mLineHeight * ((float) this.mMultipleLineText.mSingleLineTextList.size());
            refreshRect();
        }
    }

    public void countTextArea(float f, float f2, float f3, float f4, float f5) {
        Log.d("AutoLineLayout", "--- begin count text in a area ---");
        this.mMultipleLineText.reset();
        this.mBound.setEmpty();
        if (!TextUtils.isEmpty(this.mText)) {
            cutText();
            long currentTimeMillis = System.currentTimeMillis();
            findSuitableTextSize(f, f2, f3, f4, f5);
            countText(f, f2);
            findSuitableTextSize(f, f2, f3, f4, f5);
            long currentTimeMillis2 = System.currentTimeMillis();
            Log.d("AutoLineLayout", "text size coast time：%d", (Object) Long.valueOf(currentTimeMillis2 - currentTimeMillis));
            countText(f, f2);
            Log.d("AutoLineLayout", "text resize coast time：%d", (Object) Long.valueOf(System.currentTimeMillis() - currentTimeMillis2));
            Log.d("AutoLineLayout", "--- end count text in a area ---");
        }
    }

    public void draw(Canvas canvas) {
        canvas.save();
        canvas.translate((-this.mBound.width()) / 2.0f, (-this.mBound.height()) / 2.0f);
        float f = 0.0f;
        for (SingleLineText singleLineText : this.mMultipleLineText.mSingleLineTextList) {
            switch (this.mTextAlignment) {
                case CENTER:
                    f = (this.mMultipleLineText.mWidth - singleLineText.mWidth) / 2.0f;
                    break;
                case RIGHT:
                    f = this.mMultipleLineText.mWidth - singleLineText.mWidth;
                    break;
                case LEFT:
                    f = 0.0f;
                    break;
            }
            canvas.translate(f, 0.0f);
            singleLineText.draw(canvas);
            canvas.translate(-f, 0.0f);
            canvas.translate(0.0f, this.mLineHeight);
        }
        canvas.restore();
    }

    public Paint getPaint() {
        return this.mPaint;
    }

    public String getText() {
        return this.mOriginText;
    }

    public TextAlignment getTextAlignment() {
        return this.mTextAlignment;
    }

    public void getTextRect(RectF rectF) {
        rectF.set(this.mBound);
    }

    public void setLetterSpace(float f) {
        if (VERSION.SDK_INT >= 21) {
            this.mPaint.setLetterSpacing(f);
        }
    }

    public void setLineHeightOffset(float f) {
        this.mLineHeightOffset = f;
    }

    public void setMaxLines(int i) {
        this.mMaxLines = i;
    }

    public void setSingleVerticalText(boolean z) {
        this.mIsSingleVerticalText = z;
    }

    public void setText(String str) {
        this.mOriginText = str;
        this.mText = str;
        if (this.mIsSingleVerticalText) {
            this.mText = getSingleLineText(this.mText);
        }
    }

    public void setTextAlignment(TextAlignment textAlignment) {
        this.mTextAlignment = textAlignment;
    }
}
