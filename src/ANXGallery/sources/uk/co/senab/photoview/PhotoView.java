package uk.co.senab.photoview;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.RectF;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.util.AttributeSet;
import android.view.GestureDetector.OnDoubleTapListener;
import android.view.View.OnLongClickListener;
import android.widget.ImageView;
import android.widget.ImageView.ScaleType;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.photoview.BitmapRecycleCallback;
import com.miui.gallery.util.photoview.ItemViewInfo;
import com.miui.gallery.util.photoview.TileBitProvider;
import com.miui.gallery.util.photoview.TrimMemoryCallback;
import com.miui.os.Rom;
import java.util.HashMap;
import java.util.Locale;
import uk.co.senab.photoview.PhotoViewAttacher.OnBackgroundAlphaChangedListener;
import uk.co.senab.photoview.PhotoViewAttacher.OnExitListener;
import uk.co.senab.photoview.PhotoViewAttacher.OnMatrixChangedListener;
import uk.co.senab.photoview.PhotoViewAttacher.OnPhotoTapListener;
import uk.co.senab.photoview.PhotoViewAttacher.OnRotateListener;
import uk.co.senab.photoview.PhotoViewAttacher.OnScaleChangeListener;
import uk.co.senab.photoview.PhotoViewAttacher.OnScaleStageChangedListener;
import uk.co.senab.photoview.PhotoViewAttacher.OnViewTapListener;
import uk.co.senab.photoview.PhotoViewAttacher.TransitionListener;
import uk.co.senab.photoview.log.LogManager;

public class PhotoView extends ImageView implements IPhotoView {
    private PhotoViewAttacher mAttacher;
    private ScaleType mPendingScaleType;

    public PhotoView(Context context) {
        this(context, null);
    }

    public PhotoView(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public PhotoView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        super.setScaleType(ScaleType.MATRIX);
        init();
    }

    private boolean isDrawableValid() {
        Drawable drawable = getDrawable();
        if (drawable != null && (drawable instanceof BitmapDrawable)) {
            Bitmap bitmap = ((BitmapDrawable) drawable).getBitmap();
            if (bitmap == null || bitmap.isRecycled()) {
                int width = bitmap != null ? bitmap.getWidth() : 0;
                int height = bitmap != null ? bitmap.getHeight() : 0;
                LogManager.getLogger().e("PhotoView", String.format("bitmap illegal [%d, %d]", new Object[]{Integer.valueOf(width), Integer.valueOf(height)}));
                HashMap hashMap = new HashMap();
                hashMap.put("size", String.format(Locale.US, "%d_%d", new Object[]{Integer.valueOf(width), Integer.valueOf(height)}));
                GallerySamplingStatHelper.recordErrorEvent("photo", "photo_bitmap_recycled", hashMap);
                return false;
            }
        }
        return true;
    }

    public void addOnMatrixChangeListener(OnMatrixChangedListener onMatrixChangedListener) {
        this.mAttacher.addOnMatrixChangeListener(onMatrixChangedListener);
    }

    public void animEnter(ItemViewInfo itemViewInfo, TransitionListener transitionListener) {
        this.mAttacher.animEnter(itemViewInfo, transitionListener);
    }

    public void animExit(ItemViewInfo itemViewInfo, TransitionListener transitionListener) {
        this.mAttacher.animExit(itemViewInfo, transitionListener);
    }

    public void draw(Canvas canvas) {
        if (this.mAttacher.beforeDraw(canvas)) {
            super.draw(canvas);
            this.mAttacher.afterDraw(canvas);
        }
    }

    public boolean getAbsoluteRect(RectF rectF) {
        return this.mAttacher.getAbsoluteRect(rectF);
    }

    public RectF getBaseDisplayRect() {
        return this.mAttacher.getBaseDisplayRect();
    }

    public Matrix getBaseMatrix() {
        return this.mAttacher.getBaseMatrix();
    }

    public Matrix getDisplayMatrix() {
        return this.mAttacher.getDisplayMatrix();
    }

    public RectF getDisplayRect() {
        return this.mAttacher.getDisplayRect();
    }

    public RectF getDrawableSize() {
        return this.mAttacher.getDrawableSize();
    }

    public IPhotoView getIPhotoViewImplementation() {
        return this.mAttacher;
    }

    @Deprecated
    public float getMaxScale() {
        return getMaximumScale();
    }

    public float getMaximumScale() {
        return this.mAttacher.getMaximumScale();
    }

    public float getMediumScale() {
        return this.mAttacher.getMediumScale();
    }

    @Deprecated
    public float getMidScale() {
        return getMediumScale();
    }

    @Deprecated
    public float getMinScale() {
        return getMinimumScale();
    }

    public float getMinimumScale() {
        return this.mAttacher.getMinimumScale();
    }

    public OnPhotoTapListener getOnPhotoTapListener() {
        return this.mAttacher.getOnPhotoTapListener();
    }

    public OnViewTapListener getOnViewTapListener() {
        return this.mAttacher.getOnViewTapListener();
    }

    public float getRotate() {
        return this.mAttacher.getRotate();
    }

    public float getScale() {
        return this.mAttacher.getScale();
    }

    public ScaleType getScaleType() {
        return this.mAttacher.getScaleType();
    }

    public Matrix getSuppMatrix() {
        return this.mAttacher.getSuppMatrix();
    }

    public Bitmap getVisibleRectangleBitmap() {
        return this.mAttacher.getVisibleRectangleBitmap();
    }

    /* access modifiers changed from: protected */
    public void init() {
        if (this.mAttacher == null || this.mAttacher.getImageView() == null) {
            this.mAttacher = new PhotoViewAttacher(this);
        }
        if (this.mPendingScaleType != null) {
            setScaleType(this.mPendingScaleType);
            this.mPendingScaleType = null;
        }
    }

    public boolean isGestureOperating() {
        return this.mAttacher.isGestureOperating();
    }

    /* access modifiers changed from: protected */
    public void onAttachedToWindow() {
        init();
        super.onAttachedToWindow();
    }

    /* access modifiers changed from: protected */
    public void onDetachedFromWindow() {
        this.mAttacher.cleanup();
        super.onDetachedFromWindow();
    }

    /* access modifiers changed from: protected */
    public void onDraw(Canvas canvas) {
        if ((!Rom.IS_ALPHA && !Rom.IS_DEV) || isDrawableValid()) {
            super.onDraw(canvas);
        }
    }

    public void releaseTile() {
        this.mAttacher.releaseTile();
    }

    public void removeOnMatrixChangeListener(OnMatrixChangedListener onMatrixChangedListener) {
        this.mAttacher.removeOnMatrixChangeListener(onMatrixChangedListener);
    }

    public void setAllowParentInterceptOnEdge(boolean z) {
        this.mAttacher.setAllowParentInterceptOnEdge(z);
    }

    public void setAlphaBackground(Drawable drawable) {
        this.mAttacher.setAlphaBackground(drawable);
    }

    public void setBackgroundAlpha(float f) {
        this.mAttacher.setBackgroundAlpha(f);
    }

    public boolean setDisplayMatrix(Matrix matrix) {
        return this.mAttacher.setDisplayMatrix(matrix);
    }

    public void setHDState(int i, int i2, boolean z) {
        this.mAttacher.setHDState(i, i2, z);
    }

    public void setImageBitmap(Bitmap bitmap, boolean z) {
        super.setImageDrawable(new BitmapDrawable(getResources(), bitmap));
        if (this.mAttacher != null) {
            this.mAttacher.update(z);
        }
    }

    public void setImageDrawable(Drawable drawable) {
        super.setImageDrawable(drawable);
        if (this.mAttacher != null) {
            this.mAttacher.update(false);
        }
    }

    public void setImageResource(int i) {
        super.setImageResource(i);
        if (this.mAttacher != null) {
            this.mAttacher.update(false);
        }
    }

    public void setImageURI(Uri uri) {
        super.setImageURI(uri);
        if (this.mAttacher != null) {
            this.mAttacher.update(false);
        }
    }

    public void setInterceptTouch(boolean z) {
        this.mAttacher.setInterceptTouch(z);
    }

    @Deprecated
    public void setMaxScale(float f) {
        setMaximumScale(f);
    }

    public void setMaximumScale(float f) {
        this.mAttacher.setMaximumScale(f);
    }

    public void setMediumScale(float f) {
        this.mAttacher.setMediumScale(f);
    }

    @Deprecated
    public void setMidScale(float f) {
        setMediumScale(f);
    }

    @Deprecated
    public void setMinScale(float f) {
        setMinimumScale(f);
    }

    public void setMinimumScale(float f) {
        this.mAttacher.setMinimumScale(f);
    }

    public void setOnBackgroundAlphaChangedListener(OnBackgroundAlphaChangedListener onBackgroundAlphaChangedListener) {
        this.mAttacher.setOnBackgroundAlphaChangedListener(onBackgroundAlphaChangedListener);
    }

    public void setOnDoubleTapListener(OnDoubleTapListener onDoubleTapListener) {
        this.mAttacher.setOnDoubleTapListener(onDoubleTapListener);
    }

    public void setOnExitListener(OnExitListener onExitListener) {
        this.mAttacher.setOnExitListener(onExitListener);
    }

    public void setOnLongClickListener(OnLongClickListener onLongClickListener) {
        this.mAttacher.setOnLongClickListener(onLongClickListener);
    }

    public void setOnPhotoTapListener(OnPhotoTapListener onPhotoTapListener) {
        this.mAttacher.setOnPhotoTapListener(onPhotoTapListener);
    }

    public void setOnRotateListener(OnRotateListener onRotateListener) {
        this.mAttacher.setOnRotateListener(onRotateListener);
    }

    public void setOnScaleChangeListener(OnScaleChangeListener onScaleChangeListener) {
        this.mAttacher.setOnScaleChangeListener(onScaleChangeListener);
    }

    public void setOnScaleStageChangedListener(OnScaleStageChangedListener onScaleStageChangedListener) {
        this.mAttacher.setOnScaleStageChangedListener(onScaleStageChangedListener);
    }

    public void setOnViewTapListener(OnViewTapListener onViewTapListener) {
        this.mAttacher.setOnViewTapListener(onViewTapListener);
    }

    public void setPhotoViewRotation(float f) {
        this.mAttacher.setRotationTo(f);
    }

    public void setRegionDecodeEnable(boolean z) {
        this.mAttacher.setRegionDecodeEnable(z);
    }

    public void setRotatable(boolean z) {
        this.mAttacher.setRotatable(z);
    }

    public void setRotationBy(float f) {
        this.mAttacher.setRotationBy(f);
    }

    public void setRotationTo(float f) {
        this.mAttacher.setRotationTo(f);
    }

    public void setScale(float f) {
        this.mAttacher.setScale(f);
    }

    public void setScaleType(ScaleType scaleType) {
        if (this.mAttacher != null) {
            this.mAttacher.setScaleType(scaleType);
        } else {
            this.mPendingScaleType = scaleType;
        }
    }

    public void setStroke(int i, int i2) {
        this.mAttacher.setStroke(i, i2);
    }

    public void setZoomTransitionDuration(int i) {
        this.mAttacher.setZoomTransitionDuration(i);
    }

    public void setZoomable(boolean z) {
        this.mAttacher.setZoomable(z);
    }

    public void setupTile(TileBitProvider tileBitProvider, BitmapRecycleCallback bitmapRecycleCallback, TrimMemoryCallback trimMemoryCallback) {
        this.mAttacher.setupTile(tileBitProvider, bitmapRecycleCallback, trimMemoryCallback);
    }
}
