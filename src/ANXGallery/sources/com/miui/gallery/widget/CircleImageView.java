package com.miui.gallery.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.BitmapShader;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Matrix;
import android.graphics.Matrix.ScaleToFit;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.RectF;
import android.graphics.Shader.TileMode;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.util.AttributeSet;
import android.widget.ImageView;
import android.widget.ImageView.ScaleType;
import com.miui.gallery.R;
import com.miui.gallery.util.Log;

public class CircleImageView extends ImageView {
    private static final Config BITMAP_CONFIG = Config.ARGB_8888;
    private static final ScaleType SCALE_TYPE = ScaleType.CENTER_CROP;
    private Bitmap mBitmap;
    private int mBitmapHeight;
    private final Paint mBitmapPaint;
    private BitmapShader mBitmapShader;
    private int mBitmapWidth;
    private int mBorderColor;
    private boolean mBorderOverlay;
    private final Paint mBorderPaint;
    private float mBorderRadius;
    private final RectF mBorderRect;
    private int mBorderWidth;
    private ColorFilter mColorFilter;
    private float mDrawableRadius;
    private final RectF mDrawableRect;
    private int mDrawableRectInset;
    private int mFillColor;
    private final Paint mFillPaint;
    private boolean mReady;
    private boolean mSetupPending;
    private final Matrix mShaderMatrix;

    public CircleImageView(Context context) {
        this(context, null);
    }

    public CircleImageView(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public CircleImageView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.mDrawableRect = new RectF();
        this.mBorderRect = new RectF();
        this.mShaderMatrix = new Matrix();
        this.mBitmapPaint = new Paint();
        this.mBorderPaint = new Paint();
        this.mFillPaint = new Paint();
        this.mBorderColor = 0;
        this.mBorderWidth = 0;
        this.mFillColor = 0;
        this.mDrawableRectInset = 0;
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, R.styleable.CircleImageView, i, 0);
        this.mBorderColor = obtainStyledAttributes.getColor(0, 0);
        this.mBorderWidth = obtainStyledAttributes.getDimensionPixelSize(2, 0);
        this.mBorderOverlay = obtainStyledAttributes.getBoolean(1, false);
        this.mFillColor = obtainStyledAttributes.getColor(3, 0);
        obtainStyledAttributes.recycle();
        init();
    }

    private void applyColorFilter() {
        if (this.mBitmapPaint != null) {
            this.mBitmapPaint.setColorFilter(this.mColorFilter);
        }
    }

    private Bitmap getBitmapFromDrawable(Drawable drawable) {
        if (drawable == null) {
            return null;
        }
        if (drawable instanceof BitmapDrawable) {
            return ((BitmapDrawable) drawable).getBitmap();
        }
        try {
            Bitmap createBitmap = drawable instanceof ColorDrawable ? Bitmap.createBitmap(2, 2, BITMAP_CONFIG) : Bitmap.createBitmap(drawable.getIntrinsicWidth(), drawable.getIntrinsicHeight(), BITMAP_CONFIG);
            Canvas canvas = new Canvas(createBitmap);
            drawable.setBounds(0, 0, canvas.getWidth(), canvas.getHeight());
            drawable.draw(canvas);
            return createBitmap;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    private void init() {
        super.setScaleType(SCALE_TYPE);
        this.mReady = true;
        if (this.mSetupPending) {
            setup();
            this.mSetupPending = false;
        }
    }

    private void setup() {
        if (!this.mReady) {
            this.mSetupPending = true;
        } else if (getWidth() != 0 || getHeight() != 0) {
            if (this.mBitmap == null) {
                invalidate();
                return;
            }
            this.mBitmapShader = new BitmapShader(this.mBitmap, TileMode.CLAMP, TileMode.CLAMP);
            this.mBitmapPaint.setAntiAlias(true);
            this.mBitmapPaint.setShader(this.mBitmapShader);
            this.mBorderPaint.setStyle(Style.STROKE);
            this.mBorderPaint.setAntiAlias(true);
            this.mBorderPaint.setColor(this.mBorderColor);
            this.mBorderPaint.setStrokeWidth((float) this.mBorderWidth);
            this.mFillPaint.setStyle(Style.FILL);
            this.mFillPaint.setAntiAlias(true);
            this.mFillPaint.setColor(this.mFillColor);
            this.mBitmapHeight = this.mBitmap.getHeight();
            this.mBitmapWidth = this.mBitmap.getWidth();
            this.mBorderRect.set(0.0f, 0.0f, (float) getWidth(), (float) getHeight());
            this.mBorderRadius = Math.min((this.mBorderRect.height() - ((float) this.mBorderWidth)) / 2.0f, (this.mBorderRect.width() - ((float) this.mBorderWidth)) / 2.0f);
            this.mDrawableRect.set(this.mBorderRect);
            if (!this.mBorderOverlay) {
                this.mDrawableRect.inset((float) this.mBorderWidth, (float) this.mBorderWidth);
            }
            this.mDrawableRadius = Math.min(this.mDrawableRect.height() / 2.0f, this.mDrawableRect.width() / 2.0f);
            this.mDrawableRect.inset((float) this.mDrawableRectInset, (float) this.mDrawableRectInset);
            if (this.mDrawableRect.width() < 0.0f || this.mDrawableRect.height() < 0.0f) {
                Log.w("CircleImageView", "invalidate drawable inset %d", Integer.valueOf(this.mDrawableRectInset));
                this.mDrawableRect.inset((float) (-this.mDrawableRectInset), (float) (-this.mDrawableRectInset));
            }
            applyColorFilter();
            updateShaderMatrix();
            invalidate();
        }
    }

    private void updateShaderMatrix() {
        this.mShaderMatrix.set(null);
        this.mShaderMatrix.setRectToRect(new RectF(0.0f, 0.0f, (float) this.mBitmapWidth, (float) this.mBitmapHeight), this.mDrawableRect, ScaleToFit.FILL);
        this.mBitmapShader.setLocalMatrix(this.mShaderMatrix);
    }

    public int getBorderColor() {
        return this.mBorderColor;
    }

    public int getBorderWidth() {
        return this.mBorderWidth;
    }

    public int getFillColor() {
        return this.mFillColor;
    }

    public ScaleType getScaleType() {
        return SCALE_TYPE;
    }

    /* access modifiers changed from: protected */
    public void onDraw(Canvas canvas) {
        if (this.mBitmap != null) {
            if (this.mFillColor != 0) {
                canvas.drawCircle(((float) getWidth()) / 2.0f, ((float) getHeight()) / 2.0f, this.mDrawableRadius, this.mFillPaint);
            }
            canvas.drawCircle(((float) getWidth()) / 2.0f, ((float) getHeight()) / 2.0f, this.mDrawableRadius, this.mBitmapPaint);
            if (this.mBorderWidth != 0) {
                canvas.drawCircle(((float) getWidth()) / 2.0f, ((float) getHeight()) / 2.0f, this.mBorderRadius, this.mBorderPaint);
            }
        }
    }

    /* access modifiers changed from: protected */
    public void onSizeChanged(int i, int i2, int i3, int i4) {
        super.onSizeChanged(i, i2, i3, i4);
        setup();
    }

    public void setAdjustViewBounds(boolean z) {
        if (z) {
            throw new IllegalArgumentException("adjustViewBounds not supported.");
        }
    }

    public void setBorderColor(int i) {
        if (i != this.mBorderColor) {
            this.mBorderColor = i;
            this.mBorderPaint.setColor(this.mBorderColor);
            invalidate();
        }
    }

    public void setBorderColorResource(int i) {
        setBorderColor(getContext().getResources().getColor(i));
    }

    public void setBorderOverlay(boolean z) {
        if (z != this.mBorderOverlay) {
            this.mBorderOverlay = z;
            setup();
        }
    }

    public void setBorderWidth(int i) {
        if (i != this.mBorderWidth) {
            this.mBorderWidth = i;
            setup();
        }
    }

    public void setColorFilter(ColorFilter colorFilter) {
        if (colorFilter != this.mColorFilter) {
            this.mColorFilter = colorFilter;
            applyColorFilter();
            invalidate();
        }
    }

    public void setDrawableInset(int i, boolean z) {
        if (this.mDrawableRectInset != i) {
            this.mDrawableRectInset = i;
            if (z) {
                updateShaderMatrix();
                invalidate();
            }
        }
    }

    public void setFillColor(int i) {
        if (i != this.mFillColor) {
            this.mFillColor = i;
            this.mFillPaint.setColor(i);
            invalidate();
        }
    }

    public void setFillColorResource(int i) {
        setFillColor(getContext().getResources().getColor(i));
    }

    public void setImageBitmap(Bitmap bitmap) {
        super.setImageBitmap(bitmap);
        this.mBitmap = bitmap;
        setup();
    }

    public void setImageDrawable(Drawable drawable) {
        super.setImageDrawable(drawable);
        this.mBitmap = getBitmapFromDrawable(drawable);
        setup();
    }

    public void setImageResource(int i) {
        super.setImageResource(i);
        this.mBitmap = getBitmapFromDrawable(getDrawable());
        setup();
    }

    public void setImageURI(Uri uri) {
        super.setImageURI(uri);
        this.mBitmap = uri != null ? getBitmapFromDrawable(getDrawable()) : null;
        setup();
    }

    public void setScaleType(ScaleType scaleType) {
        if (scaleType != SCALE_TYPE) {
            throw new IllegalArgumentException(String.format("ScaleType %s not supported.", new Object[]{scaleType}));
        }
    }
}
