package com.miui.gallery.collage.render;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.DashPathEffect;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.Path;
import android.graphics.Path.Direction;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.text.TextUtils;
import com.miui.gallery.R;
import com.miui.gallery.collage.CollageUtils;
import com.miui.gallery.collage.core.poster.ElementPositionModel;
import com.miui.gallery.collage.core.poster.ImageElementModel;
import com.miui.gallery.collage.core.poster.PosterModel;
import com.miui.gallery.collage.core.poster.SpecifyDrawableModel;
import com.miui.gallery.collage.core.poster.TextElementModel;
import com.miui.gallery.editor.photo.core.imports.text.utils.AutoLineLayout;
import com.miui.gallery.editor.photo.core.imports.text.utils.AutoLineLayout.TextAlignment;
import java.io.File;

public class PosterElementRender {
    /* access modifiers changed from: private */
    public int mBackground = -1;
    /* access modifiers changed from: private */
    public Drawable[] mImageDrawables;
    /* access modifiers changed from: private */
    public Drawable[] mSpecifyDrawables;
    /* access modifiers changed from: private */
    public TextEditorHolder[] mTextEditorHolders;

    public interface LoadDataListener {
        void onLoadFinish();
    }

    public static class TextEditorHolder {
        private int mAlpha;
        private AutoLineLayout mAutoLineLayout = new AutoLineLayout();
        private float mCurrentTextProgress;
        private float mDensity;
        private boolean mHasModify;
        private int mHighLightBackground;
        private int mHighLightColor;
        private int mHighLightLineColor;
        private Path mHighLightPath = new Path();
        private RectF mHighLightRectF = new RectF();
        private String mOriginText;
        private Paint mPaint = new Paint(1);
        private int mParentHeight;
        private int mParentWidth;
        private Paint mPathPaint = new Paint(1);
        private boolean mRTL;
        private float mScaleOffset;
        private TextElementModel mTextElementModel;
        private RectF mTextRectF = new RectF();
        private RectF mTextRectForTouch;
        private int mTextTouchOffset;

        TextEditorHolder(Context context, TextElementModel textElementModel, int i, int i2, float f) {
            boolean z = false;
            this.mHighLightBackground = 0;
            this.mTextRectForTouch = new RectF();
            this.mCurrentTextProgress = 0.0f;
            this.mAlpha = 0;
            this.mHasModify = false;
            this.mRTL = false;
            Resources resources = context.getResources();
            if (resources.getConfiguration().getLayoutDirection() == 1) {
                z = true;
            }
            this.mRTL = z;
            this.mHighLightLineColor = resources.getColor(R.color.collage_poster_high_light_line_color);
            this.mTextTouchOffset = resources.getDimensionPixelSize(R.dimen.collage_text_touch_offset);
            this.mHighLightColor = resources.getColor(R.color.collage_poster_high_light_color);
            this.mPathPaint.setPathEffect(new DashPathEffect(new float[]{12.0f, 6.0f}, 0.0f));
            this.mPathPaint.setColor(this.mHighLightLineColor);
            this.mPathPaint.setStyle(Style.STROKE);
            this.mPathPaint.setStrokeWidth(1.0f);
            this.mParentWidth = i;
            this.mParentHeight = i2;
            this.mDensity = resources.getDisplayMetrics().density;
            this.mScaleOffset = f;
            this.mTextElementModel = textElementModel;
            configPaint(resources);
            this.mOriginText = this.mTextElementModel.getText(context);
            if (TextUtils.isEmpty(this.mTextElementModel.currentText)) {
                this.mTextElementModel.currentText = this.mOriginText;
            } else {
                this.mHasModify = true;
            }
            this.mAutoLineLayout.setTextAlignment(TextAlignment.CENTER);
            this.mAutoLineLayout.setText(textElementModel.currentText);
            countTextAndStroke();
        }

        private void configPaint(Resources resources) {
            if (this.mTextElementModel != null) {
                PosterElementRender.configTextPaint(this.mAutoLineLayout, this.mTextElementModel, resources);
            }
        }

        public boolean contains(float f, float f2) {
            return this.mTextRectForTouch.contains(f, f2);
        }

        /* access modifiers changed from: 0000 */
        public void countTextAndStroke() {
            if (this.mTextElementModel != null) {
                PosterElementRender.countText(this.mAutoLineLayout, this.mTextElementModel, this.mTextRectF, this.mParentWidth, this.mParentHeight, this.mScaleOffset, this.mRTL);
                this.mHighLightRectF.set(this.mTextRectF);
                this.mHighLightRectF.inset(this.mDensity * -6.0f, this.mDensity * -2.0f);
                RectF rectF = new RectF();
                rectF.set(this.mHighLightRectF);
                this.mHighLightPath.reset();
                this.mHighLightPath.addRect(rectF, Direction.CW);
                this.mTextRectForTouch.set(this.mTextRectF);
                this.mTextRectForTouch.inset((float) (-this.mTextTouchOffset), (float) (-this.mTextTouchOffset));
            }
        }

        /* access modifiers changed from: 0000 */
        public void draw(Canvas canvas) {
            if (this.mCurrentTextProgress > 0.0f) {
                this.mPaint.setColor(this.mHighLightBackground);
                this.mPathPaint.setAlpha(this.mAlpha);
                canvas.drawRect(this.mHighLightRectF, this.mPaint);
                canvas.drawPath(this.mHighLightPath, this.mPathPaint);
            }
            PosterElementRender.drawText(canvas, this.mAutoLineLayout, this.mTextRectF, this.mScaleOffset);
        }

        public String getCurrentText() {
            return this.mAutoLineLayout.getText();
        }

        public int getMaxSize() {
            return Math.max(this.mTextElementModel.maxLength, this.mOriginText.length());
        }

        public boolean hasModify() {
            return this.mHasModify;
        }

        public void setCurrentTextProgress(float f) {
            this.mCurrentTextProgress = f;
            this.mHighLightBackground = PosterElementRender.getColorToColorProgress(0, this.mHighLightColor, this.mCurrentTextProgress);
            this.mAlpha = (int) (this.mCurrentTextProgress * 255.0f);
        }

        public void setTextAndCount(String str, Rect rect) {
            if (this.mTextElementModel != null) {
                this.mHasModify = true;
                this.mTextElementModel.currentText = str;
                this.mAutoLineLayout.setText(str);
                countTextAndStroke();
                this.mTextRectF.roundOut(rect);
            }
        }
    }

    /* access modifiers changed from: private */
    public static void configTextPaint(AutoLineLayout autoLineLayout, TextElementModel textElementModel, Resources resources) {
        if (textElementModel != null) {
            Paint paint = autoLineLayout.getPaint();
            paint.setTextSize(textElementModel.textSize * resources.getDisplayMetrics().density);
            paint.setColor(Color.parseColor(textElementModel.textColor));
            autoLineLayout.setLetterSpace(textElementModel.letterSpace);
        }
    }

    /* access modifiers changed from: private */
    public static void countText(AutoLineLayout autoLineLayout, TextElementModel textElementModel, RectF rectF, int i, int i2, float f, boolean z) {
        autoLineLayout.countText();
        autoLineLayout.getTextRect(rectF);
        rectF.left *= f;
        rectF.right *= f;
        rectF.top *= f;
        rectF.bottom *= f;
        ElementPositionModel.getRectByLocation(rectF, textElementModel, rectF.width(), rectF.height(), i, i2, z);
    }

    /* access modifiers changed from: private */
    public static void drawText(Canvas canvas, AutoLineLayout autoLineLayout, RectF rectF, float f) {
        canvas.save();
        canvas.translate(rectF.centerX(), rectF.centerY());
        canvas.scale(f, f, 0.0f, 0.0f);
        autoLineLayout.draw(canvas);
        canvas.restore();
    }

    /* access modifiers changed from: private */
    public static Drawable[] generateImageDrawables(Resources resources, ImageElementModel[] imageElementModelArr, int i, int i2) {
        ImageElementModel[] imageElementModelArr2 = imageElementModelArr;
        if (imageElementModelArr2 == null || imageElementModelArr2.length == 0) {
            return null;
        }
        RectF rectF = new RectF();
        Rect rect = new Rect();
        Drawable[] drawableArr = new Drawable[imageElementModelArr2.length];
        for (int i3 = 0; i3 < drawableArr.length; i3++) {
            ImageElementModel imageElementModel = imageElementModelArr2[i3];
            StringBuilder sb = new StringBuilder();
            sb.append(imageElementModel.relativePath);
            sb.append(File.separator);
            sb.append(imageElementModel.name);
            Drawable drawableByAssets = CollageUtils.getDrawableByAssets(resources, sb.toString());
            float f = imageElementModel.width * ((float) i);
            ElementPositionModel.getRectByLocation(rectF, imageElementModel, f, f * (((float) drawableByAssets.getIntrinsicHeight()) / ((float) drawableByAssets.getIntrinsicWidth())), i, i2, resources.getConfiguration().getLayoutDirection() == 1);
            rectF.round(rect);
            drawableByAssets.setBounds(rect);
            drawableArr[i3] = drawableByAssets;
        }
        return drawableArr;
    }

    /* access modifiers changed from: private */
    public static Drawable[] generateSpecifyDrawables(Resources resources, SpecifyDrawableModel[] specifyDrawableModelArr, int i, int i2, float f) {
        float f2;
        float f3;
        SpecifyDrawableModel[] specifyDrawableModelArr2 = specifyDrawableModelArr;
        if (specifyDrawableModelArr2 == null || specifyDrawableModelArr2.length == 0) {
            return null;
        }
        RectF rectF = new RectF();
        Rect rect = new Rect();
        Drawable[] drawableArr = new Drawable[specifyDrawableModelArr2.length];
        for (int i3 = 0; i3 < drawableArr.length; i3++) {
            SpecifyDrawableModel specifyDrawableModel = specifyDrawableModelArr2[i3];
            Drawable drawable = specifyDrawableModel.specifyDrawableType.getDrawable(resources, specifyDrawableModel);
            float intrinsicWidth = (float) drawable.getIntrinsicWidth();
            float intrinsicHeight = (float) drawable.getIntrinsicHeight();
            if (specifyDrawableModel.width != 0.0f) {
                f3 = ((float) i) * specifyDrawableModel.width;
                if (specifyDrawableModel.height != 0.0f) {
                    f2 = ((float) i2) * specifyDrawableModel.height;
                } else {
                    int i4 = i2;
                    f2 = (intrinsicHeight / f3) * f3;
                }
            } else {
                int i5 = i;
                int i6 = i2;
                f3 = intrinsicWidth * f;
                f2 = intrinsicHeight * f;
            }
            ElementPositionModel.getRectByLocation(rectF, specifyDrawableModel, f3, f2, i, i2, resources.getConfiguration().getLayoutDirection() == 1);
            rectF.round(rect);
            drawable.setBounds(rect);
            drawableArr[i3] = drawable;
        }
        return drawableArr;
    }

    /* access modifiers changed from: private */
    public static TextEditorHolder[] generateTextHolders(Context context, TextElementModel[] textElementModelArr, int i, int i2, float f) {
        TextEditorHolder[] textEditorHolderArr = new TextEditorHolder[textElementModelArr.length];
        for (int i3 = 0; i3 < textElementModelArr.length; i3++) {
            TextEditorHolder textEditorHolder = new TextEditorHolder(context, textElementModelArr[i3], i, i2, f);
            textEditorHolderArr[i3] = textEditorHolder;
        }
        return textEditorHolderArr;
    }

    /* access modifiers changed from: private */
    public static int getColorToColorProgress(int i, int i2, float f) {
        int alpha = Color.alpha(i);
        int red = Color.red(i);
        int green = Color.green(i);
        int blue = Color.blue(i);
        return Color.argb(alpha + ((int) (((float) (Color.alpha(i2) - alpha)) * f)), red + ((int) (((float) (Color.red(i2) - red)) * f)), green + ((int) (((float) (Color.green(i2) - green)) * f)), blue + ((int) (((float) (Color.blue(i2) - blue)) * f)));
    }

    public void draw(Canvas canvas) {
        if (this.mImageDrawables != null && this.mImageDrawables.length > 0) {
            for (Drawable draw : this.mImageDrawables) {
                draw.draw(canvas);
            }
        }
        if (this.mSpecifyDrawables != null && this.mSpecifyDrawables.length > 0) {
            for (Drawable draw2 : this.mSpecifyDrawables) {
                draw2.draw(canvas);
            }
        }
        if (this.mTextEditorHolders != null && this.mTextEditorHolders.length > 0) {
            for (TextEditorHolder draw3 : this.mTextEditorHolders) {
                draw3.draw(canvas);
            }
        }
    }

    public int getBackground() {
        return this.mBackground;
    }

    public TextEditorHolder[] getTextEditorHolders() {
        return this.mTextEditorHolders;
    }

    public void initialize(PosterModel posterModel, int i, int i2, float f, Context context) {
        ImageElementModel[] imageElementModelArr = posterModel.imageElementModels;
        SpecifyDrawableModel[] specifyDrawableModelArr = posterModel.specifyDrawableModels;
        TextElementModel[] textElementModelArr = posterModel.textElementModels;
        String str = posterModel.background;
        if (imageElementModelArr != null && imageElementModelArr.length > 0) {
            this.mImageDrawables = generateImageDrawables(context.getResources(), imageElementModelArr, i, i2);
        }
        if (specifyDrawableModelArr != null && specifyDrawableModelArr.length > 0) {
            this.mSpecifyDrawables = generateSpecifyDrawables(context.getResources(), specifyDrawableModelArr, i, i2, f);
        }
        if (textElementModelArr != null && textElementModelArr.length > 0) {
            this.mTextEditorHolders = generateTextHolders(context, textElementModelArr, i, i2, f);
        }
        if (!TextUtils.isEmpty(str)) {
            this.mBackground = Color.parseColor(str);
        }
    }

    public void initializeAsync(PosterModel posterModel, int i, int i2, float f, Context context, LoadDataListener loadDataListener) {
        final PosterModel posterModel2 = posterModel;
        final Context context2 = context;
        final int i3 = i;
        final int i4 = i2;
        final float f2 = f;
        final LoadDataListener loadDataListener2 = loadDataListener;
        AnonymousClass1 r0 = new Thread() {
            /* access modifiers changed from: private */
            public int mBackground;
            /* access modifiers changed from: private */
            public Drawable[] mImageDrawables;
            /* access modifiers changed from: private */
            public Drawable[] mSpecifyDrawables;
            /* access modifiers changed from: private */
            public TextEditorHolder[] mTextEditorHolders;

            public void run() {
                ImageElementModel[] imageElementModelArr = posterModel2.imageElementModels;
                SpecifyDrawableModel[] specifyDrawableModelArr = posterModel2.specifyDrawableModels;
                TextElementModel[] textElementModelArr = posterModel2.textElementModels;
                String str = posterModel2.background;
                if (imageElementModelArr != null && imageElementModelArr.length > 0) {
                    this.mImageDrawables = PosterElementRender.generateImageDrawables(context2.getResources(), imageElementModelArr, i3, i4);
                }
                if (specifyDrawableModelArr != null && specifyDrawableModelArr.length > 0) {
                    this.mSpecifyDrawables = PosterElementRender.generateSpecifyDrawables(context2.getResources(), specifyDrawableModelArr, i3, i4, f2);
                }
                if (textElementModelArr != null && textElementModelArr.length > 0) {
                    this.mTextEditorHolders = PosterElementRender.generateTextHolders(context2, textElementModelArr, i3, i4, f2);
                }
                if (!TextUtils.isEmpty(str)) {
                    this.mBackground = Color.parseColor(str);
                }
                new Handler(context2.getMainLooper()).post(new Runnable() {
                    public void run() {
                        PosterElementRender.this.mImageDrawables = AnonymousClass1.this.mImageDrawables;
                        PosterElementRender.this.mSpecifyDrawables = AnonymousClass1.this.mSpecifyDrawables;
                        PosterElementRender.this.mTextEditorHolders = AnonymousClass1.this.mTextEditorHolders;
                        PosterElementRender.this.mBackground = AnonymousClass1.this.mBackground;
                        if (loadDataListener2 != null) {
                            loadDataListener2.onLoadFinish();
                        }
                    }
                });
            }
        };
        r0.start();
    }

    public void initializeAsync(PosterModel posterModel, int i, int i2, Context context, LoadDataListener loadDataListener) {
        initializeAsync(posterModel, i, i2, 1.0f, context, loadDataListener);
    }
}
