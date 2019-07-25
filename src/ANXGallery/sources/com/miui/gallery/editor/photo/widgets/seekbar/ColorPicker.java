package com.miui.gallery.editor.photo.widgets.seekbar;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.widget.SeekBar;
import com.miui.gallery.R;

public class ColorPicker extends SeekBar {
    public static int[] COLORS = {-16747777, -384518, -53457, -35801, -16384, -13964758, -15998977};
    /* access modifiers changed from: private */
    public static int MAX_LEVEL = 10000;
    private Delegator mDelegator;
    private CircleDrawable mThumbDrawable;

    private static class BitmapDelegator extends Delegator<BitmapDrawable> {
        private Bitmap mBitmap;

        public BitmapDelegator(BitmapDrawable bitmapDrawable) {
            super(bitmapDrawable);
            this.mBitmap = bitmapDrawable.getBitmap();
        }

        /* access modifiers changed from: 0000 */
        public int findLevel(int i) {
            for (int i2 = 0; i2 < this.mBitmap.getWidth(); i2++) {
                if (this.mBitmap.getPixel(i2, this.mBitmap.getHeight() / 2) == i) {
                    return (int) ((((float) i2) / ((float) this.mBitmap.getWidth())) * ((float) ColorPicker.MAX_LEVEL));
                }
            }
            return -1;
        }

        /* access modifiers changed from: 0000 */
        public int getColor() {
            return this.mBitmap.getPixel((int) ((((float) this.mBitmap.getWidth()) / ((float) ColorPicker.MAX_LEVEL)) * ((float) ((BitmapDrawable) this.mDrawable).getLevel())), this.mBitmap.getHeight() / 2);
        }
    }

    private static abstract class Delegator<D extends Drawable> {
        D mDrawable;

        Delegator(D d) {
            this.mDrawable = d;
        }

        /* access modifiers changed from: 0000 */
        public abstract int findLevel(int i);

        /* access modifiers changed from: 0000 */
        public abstract int getColor();
    }

    private static class GradientDelegator extends Delegator<ColorGradientDrawable> {
        private int[] mColors;

        GradientDelegator(ColorGradientDrawable colorGradientDrawable) {
            super(colorGradientDrawable);
            this.mColors = colorGradientDrawable.getColors();
        }

        private int ave(int i, int i2, float f) {
            return i + Math.round(f * ((float) (i2 - i)));
        }

        private float findColorProgress(int i, int i2, int i3) {
            float valueProgress = getValueProgress(Color.alpha(i), Color.alpha(i2), Color.alpha(i3));
            float valueProgress2 = getValueProgress(Color.red(i), Color.red(i2), Color.red(i3));
            float valueProgress3 = getValueProgress(Color.green(i), Color.green(i2), Color.green(i3));
            return Math.max(Math.max(Math.max(valueProgress, valueProgress2), valueProgress3), getValueProgress(Color.blue(i), Color.blue(i2), Color.blue(i3)));
        }

        private float getValueProgress(int i, int i2, int i3) {
            if (i3 == i2) {
                return 0.0f;
            }
            return ((float) (i - i2)) / ((float) (i3 - i2));
        }

        private boolean isValueInside(int i, int i2, int i3) {
            return (i >= i2 && i <= i3) || (i >= i3 && i <= i2);
        }

        /* access modifiers changed from: 0000 */
        public int findLevel(int i) {
            int i2;
            int i3 = i;
            if (i3 == -16777216) {
                return 0;
            }
            if (i3 == -1) {
                return ColorPicker.MAX_LEVEL;
            }
            int alpha = Color.alpha(i);
            int red = Color.red(i);
            int green = Color.green(i);
            int blue = Color.blue(i);
            int i4 = 0;
            while (true) {
                if (i4 >= this.mColors.length - 1) {
                    i2 = -1;
                    i4 = -1;
                    break;
                }
                int i5 = this.mColors[i4];
                int i6 = i4 + 1;
                int i7 = this.mColors[i6];
                if (i3 != i5) {
                    if (i3 != i7) {
                        int alpha2 = Color.alpha(i5);
                        int red2 = Color.red(i5);
                        int green2 = Color.green(i5);
                        int blue2 = Color.blue(i5);
                        int alpha3 = Color.alpha(i7);
                        int red3 = Color.red(i7);
                        int green3 = Color.green(i7);
                        int blue3 = Color.blue(i7);
                        if (isValueInside(alpha, alpha2, alpha3) && isValueInside(red, red2, red3) && isValueInside(green, green2, green3) && isValueInside(blue, blue2, blue3)) {
                            i2 = -1;
                            break;
                        }
                        i4 = i6;
                    } else {
                        return (int) ((((float) i6) / ((float) (this.mColors.length - 1))) * ((float) ColorPicker.MAX_LEVEL));
                    }
                } else {
                    return (int) ((((float) i4) / ((float) (this.mColors.length - 1))) * ((float) ColorPicker.MAX_LEVEL));
                }
            }
            if (i4 == i2) {
                return 0;
            }
            return (int) (((((float) i4) / ((float) (this.mColors.length - 1))) + (findColorProgress(i3, this.mColors[i4], this.mColors[i4 + 1]) * (1.0f / ((float) (this.mColors.length - 1))))) * ((float) ColorPicker.MAX_LEVEL));
        }

        /* access modifiers changed from: 0000 */
        public int getColor() {
            int level = ((ColorGradientDrawable) this.mDrawable).getLevel();
            if (level == ColorPicker.MAX_LEVEL) {
                return -1;
            }
            if (level == 0) {
                return -16777216;
            }
            float access$000 = ((float) level) / ((float) ColorPicker.MAX_LEVEL);
            if (access$000 <= 0.0f) {
                return this.mColors[0];
            }
            if (access$000 >= 1.0f) {
                return this.mColors[this.mColors.length - 1];
            }
            float length = access$000 * ((float) (this.mColors.length - 1));
            int i = (int) length;
            float f = length - ((float) i);
            int i2 = this.mColors[i];
            int i3 = this.mColors[i + 1];
            return Color.argb(ave(Color.alpha(i2), Color.alpha(i3), f), ave(Color.red(i2), Color.red(i3), f), ave(Color.green(i2), Color.green(i3), f), ave(Color.blue(i2), Color.blue(i3), f));
        }
    }

    public ColorPicker(Context context) {
        super(context);
        init();
    }

    public ColorPicker(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        init();
    }

    public ColorPicker(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        init();
    }

    private void init() {
        this.mThumbDrawable = new CircleDrawable((float) getContext().getResources().getDimensionPixelSize(R.dimen.editor_seek_bar_progress_thumb_start), getResources());
        int dimensionPixelSize = getContext().getResources().getDimensionPixelSize(R.dimen.custom_seekbar_thumb_size);
        this.mThumbDrawable.setIntrinsicWidth(dimensionPixelSize);
        this.mThumbDrawable.setIntrinsicHeight(dimensionPixelSize);
        setThumb(this.mThumbDrawable);
        setLayerType(2, null);
    }

    public int findProgressByColor(int i) {
        return (this.mDelegator.findLevel(i) * getMax()) / MAX_LEVEL;
    }

    public int getColor() {
        return this.mDelegator.getColor();
    }

    public void setProgressDrawable(Drawable drawable) {
        super.setProgressDrawable(drawable);
        if (drawable instanceof BitmapDrawable) {
            this.mDelegator = new BitmapDelegator((BitmapDrawable) drawable);
        } else if (drawable instanceof ColorGradientDrawable) {
            this.mDelegator = new GradientDelegator((ColorGradientDrawable) drawable);
        }
    }

    public void setThumbColor(int i) {
        this.mThumbDrawable.setColor(i);
    }
}
