package com.miui.gallery.util.face;

import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.PorterDuff.Mode;
import android.graphics.PorterDuffColorFilter;
import android.util.StateSet;
import android.view.View;
import com.miui.gallery.R;
import com.nostra13.universalimageloader.core.assist.LoadedFrom;
import com.nostra13.universalimageloader.core.display.BitmapDisplayer;
import com.nostra13.universalimageloader.core.display.CircleBitmapDisplayer.CircleDrawable;
import com.nostra13.universalimageloader.core.imageaware.ImageAware;
import com.nostra13.universalimageloader.core.imageaware.ImageViewAware;

public class PeopleItemBitmapDisplayer implements BitmapDisplayer {
    private boolean mClickable;

    public static class PressableCircleBitmapDrawable extends CircleDrawable {
        private PorterDuffColorFilter mPressedColorFilter;
        private int[] mStateSpec = {16842919};

        public PressableCircleBitmapDrawable(Bitmap bitmap, Integer num, Integer num2, float f) {
            super(bitmap, num2, f);
            if (num != null) {
                this.mPressedColorFilter = new PorterDuffColorFilter(num.intValue(), Mode.DARKEN);
            }
        }

        public boolean isStateful() {
            return true;
        }

        /* access modifiers changed from: protected */
        public boolean onStateChange(int[] iArr) {
            if (this.mPressedColorFilter == null) {
                return super.onStateChange(iArr);
            }
            if (StateSet.stateSetMatches(this.mStateSpec, iArr)) {
                setColorFilter(this.mPressedColorFilter);
            } else {
                clearColorFilter();
            }
            invalidateSelf();
            return true;
        }
    }

    public PeopleItemBitmapDisplayer(boolean z) {
        this.mClickable = z;
    }

    public void display(Bitmap bitmap, ImageAware imageAware, LoadedFrom loadedFrom) {
        if (imageAware instanceof ImageViewAware) {
            View wrappedView = imageAware.getWrappedView();
            if (wrappedView != null) {
                Resources resources = wrappedView.getResources();
                imageAware.saveBitmap(bitmap);
                imageAware.setImageDrawable(new PressableCircleBitmapDrawable(bitmap, this.mClickable ? Integer.valueOf(resources.getColor(R.color.image_pressed_color)) : null, Integer.valueOf(resources.getColor(R.color.image_stroke_color)), (float) resources.getDimensionPixelSize(R.dimen.image_stroke_width)));
                return;
            }
            return;
        }
        throw new IllegalArgumentException("ImageAware should wrap ImageView. ImageViewAware is expected.");
    }
}
