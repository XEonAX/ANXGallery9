package com.miui.gallery.editor.photo.widgets.seekbar;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.PorterDuff.Mode;
import android.graphics.PorterDuffXfermode;
import android.graphics.Rect;
import android.graphics.Region;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.DrawableContainer;
import android.graphics.drawable.LayerDrawable;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.ViewConfiguration;
import android.widget.SeekBar;
import android.widget.SeekBar.OnSeekBarChangeListener;
import com.miui.gallery.R;

public class BiDirectionSeekBar extends BasicSeekBar {
    private int mAnchor;
    /* access modifiers changed from: private */
    public int mMax;
    private boolean mStickyState;
    private int mTouchSlop;

    private static class BiDirectionDrawable extends Drawable {
        private Paint mBlankPaint;
        private float mBlankWidth;
        private Drawable mDrawable;
        private Rect mPadding = new Rect();

        public BiDirectionDrawable(Drawable drawable, Resources resources) {
            this.mDrawable = drawable;
            this.mDrawable.getPadding(this.mPadding);
            this.mBlankPaint = new Paint(1);
            this.mBlankPaint.setStyle(Style.FILL);
            this.mBlankPaint.setXfermode(new PorterDuffXfermode(Mode.CLEAR));
            this.mBlankWidth = resources.getDimension(R.dimen.photo_editor_bi_direction_seek_bar_blank);
        }

        public void clearColorFilter() {
            this.mDrawable.clearColorFilter();
        }

        public void draw(Canvas canvas) {
            int i;
            Rect bounds = getBounds();
            int centerX = bounds.centerX();
            this.mDrawable.setBounds(centerX - this.mPadding.left, bounds.top, bounds.right, bounds.bottom);
            int level = getLevel();
            int i2 = 0;
            if (level > 5000) {
                i2 = (level - 5000) * 2;
            } else if (level < 5000) {
                i = (5000 - level) * 2;
                this.mDrawable.setLevel(i2);
                this.mDrawable.draw(canvas);
                canvas.save();
                canvas.scale(-1.0f, 1.0f, (float) bounds.centerX(), 0.0f);
                this.mDrawable.setLevel(i);
                this.mDrawable.draw(canvas);
                canvas.restore();
                float f = (float) centerX;
                canvas.drawRect(f - this.mBlankWidth, (float) bounds.top, f + this.mBlankWidth, (float) bounds.bottom, this.mBlankPaint);
            }
            i = 0;
            this.mDrawable.setLevel(i2);
            this.mDrawable.draw(canvas);
            canvas.save();
            canvas.scale(-1.0f, 1.0f, (float) bounds.centerX(), 0.0f);
            this.mDrawable.setLevel(i);
            this.mDrawable.draw(canvas);
            canvas.restore();
            float f2 = (float) centerX;
            canvas.drawRect(f2 - this.mBlankWidth, (float) bounds.top, f2 + this.mBlankWidth, (float) bounds.bottom, this.mBlankPaint);
        }

        public int getAlpha() {
            return this.mDrawable.getAlpha();
        }

        public int getChangingConfigurations() {
            return this.mDrawable.getChangingConfigurations();
        }

        public int getOpacity() {
            return this.mDrawable.getOpacity();
        }

        public boolean getPadding(Rect rect) {
            if (this.mPadding.isEmpty()) {
                return false;
            }
            rect.set(this.mPadding);
            rect.left = rect.right;
            return true;
        }

        public int[] getState() {
            return this.mDrawable.getState();
        }

        public Region getTransparentRegion() {
            Rect bounds = getBounds();
            this.mDrawable.setBounds(bounds.centerX(), bounds.top, bounds.right, bounds.bottom);
            Region transparentRegion = this.mDrawable.getTransparentRegion();
            if (transparentRegion == null) {
                return null;
            }
            this.mDrawable.setBounds(bounds.left, bounds.top, bounds.centerX(), bounds.bottom);
            transparentRegion.union(this.mDrawable.getTransparentRegion().getBounds());
            return transparentRegion;
        }

        public boolean isStateful() {
            return this.mDrawable.isStateful();
        }

        public void jumpToCurrentState() {
            this.mDrawable.jumpToCurrentState();
        }

        public void setAlpha(int i) {
            this.mDrawable.setAlpha(i);
        }

        public void setChangingConfigurations(int i) {
            this.mDrawable.setChangingConfigurations(i);
        }

        public void setColorFilter(int i, Mode mode) {
            this.mDrawable.setColorFilter(i, mode);
        }

        public void setColorFilter(ColorFilter colorFilter) {
            this.mDrawable.setColorFilter(colorFilter);
        }

        public void setDither(boolean z) {
            this.mDrawable.setDither(z);
        }

        public void setFilterBitmap(boolean z) {
            this.mDrawable.setFilterBitmap(z);
        }

        public boolean setState(int[] iArr) {
            return this.mDrawable.setState(iArr);
        }
    }

    private class SeekBarChangeDelegator implements OnSeekBarChangeListener {
        private OnSeekBarChangeListener mDelegated;

        public SeekBarChangeDelegator(OnSeekBarChangeListener onSeekBarChangeListener) {
            this.mDelegated = onSeekBarChangeListener;
        }

        public void onProgressChanged(SeekBar seekBar, int i, boolean z) {
            if (this.mDelegated != null) {
                this.mDelegated.onProgressChanged(seekBar, i - BiDirectionSeekBar.this.mMax, z);
            }
        }

        public void onStartTrackingTouch(SeekBar seekBar) {
            if (this.mDelegated != null) {
                this.mDelegated.onStartTrackingTouch(seekBar);
            }
        }

        public void onStopTrackingTouch(SeekBar seekBar) {
            if (this.mDelegated != null) {
                this.mDelegated.onStopTrackingTouch(seekBar);
            }
        }
    }

    public BiDirectionSeekBar(Context context) {
        this(context, null);
    }

    public BiDirectionSeekBar(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 16842875);
    }

    public BiDirectionSeekBar(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.mMax = getMax() / 2;
        this.mTouchSlop = ViewConfiguration.get(context).getScaledTouchSlop();
        setLayerType(2, null);
    }

    public int getCurrentValue() {
        return getProgress() - this.mMax;
    }

    public int getMaxValue() {
        return this.mMax;
    }

    public boolean onTouchEvent(MotionEvent motionEvent) {
        if (this.mStickyState) {
            int action = motionEvent.getAction();
            if (action == 2) {
                if (Math.abs(this.mAnchor - ((int) motionEvent.getX())) < this.mTouchSlop) {
                    return true;
                }
            } else if (action == 1 || action == 3) {
                motionEvent.setLocation((float) this.mAnchor, motionEvent.getY());
                this.mStickyState = false;
            }
        }
        boolean onTouchEvent = super.onTouchEvent(motionEvent);
        if (!onTouchEvent || getCurrentValue() != 0) {
            this.mStickyState = false;
        } else {
            this.mStickyState = true;
            this.mAnchor = (int) motionEvent.getX();
        }
        return onTouchEvent;
    }

    public void setCurrentValue(int i) {
        setProgress(i + this.mMax);
    }

    public void setMaxValue(int i) {
        setMax(i * 2);
        this.mMax = i;
    }

    public void setOnSeekBarChangeListener(OnSeekBarChangeListener onSeekBarChangeListener) {
        super.setOnSeekBarChangeListener(new SeekBarChangeDelegator(onSeekBarChangeListener));
    }

    public void setProgressDrawable(Drawable drawable) {
        if (drawable instanceof LayerDrawable) {
            LayerDrawable layerDrawable = (LayerDrawable) drawable.mutate();
            Drawable findDrawableByLayerId = layerDrawable.findDrawableByLayerId(16908301);
            if (findDrawableByLayerId != null) {
                layerDrawable.setDrawableByLayerId(16908301, new BiDirectionDrawable(findDrawableByLayerId, getResources()));
                super.setProgressDrawable(layerDrawable);
                return;
            }
        } else if (drawable instanceof DrawableContainer) {
            drawable.mutate();
        }
        super.setProgressDrawable(new BiDirectionDrawable(drawable, getResources()));
    }

    /* access modifiers changed from: 0000 */
    public void updateThumb(int i) {
        super.updateThumb(i - this.mMax);
    }
}
