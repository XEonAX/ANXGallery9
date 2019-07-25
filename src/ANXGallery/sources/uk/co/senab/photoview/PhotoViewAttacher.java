package uk.co.senab.photoview;

import android.annotation.SuppressLint;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Matrix.ScaleToFit;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.view.GestureDetector;
import android.view.GestureDetector.OnDoubleTapListener;
import android.view.GestureDetector.SimpleOnGestureListener;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnLongClickListener;
import android.view.View.OnTouchListener;
import android.view.ViewConfiguration;
import android.view.ViewParent;
import android.view.ViewTreeObserver;
import android.view.ViewTreeObserver.OnGlobalLayoutListener;
import android.view.animation.AccelerateDecelerateInterpolator;
import android.view.animation.Animation;
import android.view.animation.Interpolator;
import android.view.animation.LinearInterpolator;
import android.widget.ImageView;
import android.widget.ImageView.ScaleType;
import android.widget.Scroller;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.MatrixUtil;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.photoview.BitmapRecycleCallback;
import com.miui.gallery.util.photoview.ItemViewInfo;
import com.miui.gallery.util.photoview.TileBitProvider;
import com.miui.gallery.util.photoview.TileView;
import com.miui.gallery.util.photoview.TrimMemoryCallback;
import java.lang.ref.WeakReference;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Locale;
import java.util.Set;
import miui.view.animation.CubicEaseOutInterpolator;
import uk.co.senab.photoview.gestures.OnGestureListener;
import uk.co.senab.photoview.gestures.RotateGestureDetector;
import uk.co.senab.photoview.gestures.RotateGestureDetector.OnRotationGestureListener;
import uk.co.senab.photoview.gestures.VersionedGestureDetector;
import uk.co.senab.photoview.log.LogManager;
import uk.co.senab.photoview.scrollerproxy.ScrollerProxy;

public class PhotoViewAttacher implements OnTouchListener, OnGlobalLayoutListener, IPhotoView, OnGestureListener {
    static final Interpolator sInterpolator = new AccelerateDecelerateInterpolator();
    private final float EXIT_SCALE_RATIO;
    int ZOOM_DURATION;
    private boolean mAllowParentInterceptOnEdge;
    /* access modifiers changed from: private */
    public float mAlpha;
    private OnBackgroundAlphaChangedListener mAlphaChangedListener;
    private Drawable mAlphaDrawable;
    private int mAnim;
    /* access modifiers changed from: private */
    public final Matrix mBaseMatrix;
    private FlingRunnable mCurrentFlingRunnable;
    private final RectF mDisplayRect;
    private float mDownScale;
    private float mDragDownOutThreshold;
    private float mDragDownOutY;
    private boolean mDragHandled;
    private final Matrix mDrawMatrix;
    private ItemViewInfo mEnterInfo;
    private OnExitListener mExitListener;
    private float mExitScale;
    private GestureDetector mGestureDetector;
    private int mHScrollEdge;
    private boolean mHasScale;
    private WeakReference<ImageView> mImageView;
    private boolean mIntercepted;
    private boolean mIsDragDownOut;
    private boolean mIsRegionDecodeEnable;
    private int mIvBottom;
    private int mIvLeft;
    private int mIvRight;
    private int mIvTop;
    private float mLastScaleFocusX;
    private float mLastScaleFocusY;
    /* access modifiers changed from: private */
    public OnLongClickListener mLongClickListener;
    private Set<OnMatrixChangedListener> mMatrixChangeListeners;
    private final float[] mMatrixValues;
    private float mMaxDoubleTapScale;
    private float mMaxPointsScale;
    private float mMaxScale;
    private float mMidScale;
    private float mMinScale;
    private int mOriginHeight;
    private int mOriginWidth;
    private OnPhotoTapListener mPhotoTapListener;
    private RotateManager mRotateDetector;
    private boolean mRotateEnabled;
    /* access modifiers changed from: private */
    public OnRotateListener mRotateListener;
    private OnScaleChangeListener mScaleChangeListener;
    private uk.co.senab.photoview.gestures.GestureDetector mScaleDragDetector;
    private OnScaleStageChangedListener mScaleStageChangedListener;
    private ScaleType mScaleType;
    private int mStrokeColor;
    private Paint mStrokePaint;
    private int mStrokeWidth;
    /* access modifiers changed from: private */
    public final Matrix mSuppMatrix;
    private boolean mSupportHd;
    private TileView mTileView;
    private float mTouchDownY;
    private Transition mTransition;
    private TransitionListener mTransitionListener;
    private int mVScrollEdge;
    private OnViewTapListener mViewTapListener;
    private long mWantEnterTime;
    /* access modifiers changed from: private */
    public boolean mZoomEnabled;

    /* renamed from: uk.co.senab.photoview.PhotoViewAttacher$2 reason: invalid class name */
    static /* synthetic */ class AnonymousClass2 {
        static final /* synthetic */ int[] $SwitchMap$android$widget$ImageView$ScaleType = new int[ScaleType.values().length];

        /* JADX WARNING: Can't wrap try/catch for region: R(12:0|1|2|3|4|5|6|7|8|9|10|12) */
        /* JADX WARNING: Code restructure failed: missing block: B:13:?, code lost:
            return;
         */
        /* JADX WARNING: Failed to process nested try/catch */
        /* JADX WARNING: Missing exception handler attribute for start block: B:3:0x0014 */
        /* JADX WARNING: Missing exception handler attribute for start block: B:5:0x001f */
        /* JADX WARNING: Missing exception handler attribute for start block: B:7:0x002a */
        /* JADX WARNING: Missing exception handler attribute for start block: B:9:0x0035 */
        static {
            $SwitchMap$android$widget$ImageView$ScaleType[ScaleType.MATRIX.ordinal()] = 1;
            $SwitchMap$android$widget$ImageView$ScaleType[ScaleType.FIT_START.ordinal()] = 2;
            $SwitchMap$android$widget$ImageView$ScaleType[ScaleType.FIT_END.ordinal()] = 3;
            $SwitchMap$android$widget$ImageView$ScaleType[ScaleType.FIT_CENTER.ordinal()] = 4;
            $SwitchMap$android$widget$ImageView$ScaleType[ScaleType.FIT_XY.ordinal()] = 5;
        }
    }

    private class AnimatedZoomRunnable implements Runnable {
        private final float mFocalX;
        private final float mFocalY;
        private final long mStartTime = System.currentTimeMillis();
        private final float mZoomEnd;
        private final float mZoomStart;

        public AnimatedZoomRunnable(float f, float f2, float f3, float f4) {
            this.mFocalX = f3;
            this.mFocalY = f4;
            this.mZoomStart = f;
            this.mZoomEnd = f2;
        }

        private float interpolate() {
            return PhotoViewAttacher.sInterpolator.getInterpolation(Math.min(1.0f, (((float) (System.currentTimeMillis() - this.mStartTime)) * 1.0f) / ((float) PhotoViewAttacher.this.ZOOM_DURATION)));
        }

        public void run() {
            ImageView imageView = PhotoViewAttacher.this.getImageView();
            if (imageView == null) {
                PhotoViewAttacher.this.clearAnim(1);
                return;
            }
            PhotoViewAttacher.this.appendAnim(1);
            float interpolate = interpolate();
            PhotoViewAttacher.this.onScale((this.mZoomStart + ((this.mZoomEnd - this.mZoomStart) * interpolate)) / PhotoViewAttacher.this.getScale(), this.mFocalX, this.mFocalY);
            if (interpolate < 1.0f) {
                Compat.postOnAnimation(imageView, this);
            } else {
                PhotoViewAttacher.this.clearAnim(1);
            }
        }
    }

    private class FlingRunnable implements Runnable {
        private int mCurrentX;
        private int mCurrentY;
        private final ScrollerProxy mScroller;

        public FlingRunnable(Context context) {
            this.mScroller = ScrollerProxy.getScroller(context);
        }

        public void cancelFling() {
            this.mScroller.forceFinished(true);
        }

        public void fling(int i, int i2, int i3, int i4) {
            int i5;
            int i6;
            int i7;
            int i8;
            RectF displayRect = PhotoViewAttacher.this.getDisplayRect();
            if (displayRect != null) {
                int round = Math.round(-displayRect.left);
                float f = (float) i;
                if (f < displayRect.width()) {
                    i5 = Math.round(displayRect.width() - f);
                    i6 = 0;
                } else {
                    i6 = round;
                    i5 = i6;
                }
                int round2 = Math.round(-displayRect.top);
                float f2 = (float) i2;
                if (f2 < displayRect.height()) {
                    i7 = Math.round(displayRect.height() - f2);
                    i8 = 0;
                } else {
                    i8 = round2;
                    i7 = i8;
                }
                this.mCurrentX = round;
                this.mCurrentY = round2;
                if (!(round == i5 && round2 == i7)) {
                    this.mScroller.fling(round, round2, i3, i4, i6, i5, i8, i7, 0, 0);
                }
            }
        }

        public void run() {
            if (this.mScroller.isFinished()) {
                PhotoViewAttacher.this.clearAnim(2);
                return;
            }
            PhotoViewAttacher.this.appendAnim(2);
            ImageView imageView = PhotoViewAttacher.this.getImageView();
            if (imageView == null || !this.mScroller.computeScrollOffset()) {
                PhotoViewAttacher.this.clearAnim(2);
            } else {
                int currX = this.mScroller.getCurrX();
                int currY = this.mScroller.getCurrY();
                PhotoViewAttacher.this.postTranslate((float) (this.mCurrentX - currX), (float) (this.mCurrentY - currY));
                PhotoViewAttacher.this.setImageViewMatrix(PhotoViewAttacher.this.getDrawMatrix());
                this.mCurrentX = currX;
                this.mCurrentY = currY;
                Compat.postOnAnimation(imageView, this);
            }
        }
    }

    public interface OnBackgroundAlphaChangedListener {
        void onAlphaChanged(float f);
    }

    public interface OnExitListener {
        void onExit();
    }

    public interface OnMatrixChangedListener {
        void onMatrixChanged(RectF rectF);
    }

    public interface OnPhotoTapListener {
        void onPhotoTap(View view, float f, float f2);
    }

    public interface OnRotateListener {
        void onRotate(float f, float f2, float f3, float f4);

        void onRotateBegin(float f);

        void onRotateEnd(float f);
    }

    public interface OnScaleChangeListener {
        void onScaleChange(float f, float f2, float f3, float f4, float f5);
    }

    public interface OnScaleStageChangedListener {
        void onMaxScaleStage(boolean z);

        void onMidScaleStage(boolean z);
    }

    public interface OnViewTapListener {
        void onViewTap(View view, float f, float f2);
    }

    private class RotateManager implements OnRotationGestureListener {
        private final float CRITICAL_VELOCITY;
        private AdjustAnimation mAjustAnim;
        private RotateGestureDetector mRotateDetector;
        private float mRotatedDegrees;

        class AdjustAnimation implements Runnable {
            private boolean isRunning;
            private Scroller mAlphaScroller;
            private float mRotateFocusX;
            private float mRotateFocusY;
            private Scroller mRotateScroller;
            private Scroller mScaleScroller;
            private Scroller mTranslateScroller;
            private int mTranslateX;
            private int mTraslateY;

            public AdjustAnimation(Context context) {
                CubicEaseOutInterpolator cubicEaseOutInterpolator = new CubicEaseOutInterpolator();
                this.mRotateScroller = new Scroller(context, cubicEaseOutInterpolator);
                this.mScaleScroller = new Scroller(context, cubicEaseOutInterpolator);
                this.mTranslateScroller = new Scroller(context, cubicEaseOutInterpolator);
                this.mAlphaScroller = new Scroller(context, cubicEaseOutInterpolator);
            }

            private void checkBounds() {
                ImageView imageView = PhotoViewAttacher.this.getImageView();
                if (imageView != null) {
                    RectF access$500 = PhotoViewAttacher.this.getDisplayRect(PhotoViewAttacher.this.getDrawMatrix());
                    float rotate = PhotoViewAttacher.this.getRotate();
                    float access$1300 = (float) PhotoViewAttacher.this.trimRotation(rotate);
                    if (!MiscUtil.floatEquals(rotate, access$1300)) {
                        PhotoViewAttacher.this.postRotate(rotate - access$1300, access$500.centerX(), access$500.centerY());
                    }
                    float[] access$2300 = RotateManager.this.calculateTranslate(PhotoViewAttacher.this.getDrawMatrix());
                    if (access$2300 != null) {
                        PhotoViewAttacher.this.postTranslate(access$2300[0], access$2300[1]);
                    }
                    RectF access$1600 = PhotoViewAttacher.this.calculateBaseRect(imageView.getDrawable(), (int) PhotoViewAttacher.this.getRotate());
                    if (access$1600 == null) {
                        LogManager.getLogger().e("PhotoViewAttacher", "calculate base display null");
                        return;
                    }
                    RectF access$5002 = PhotoViewAttacher.this.getDisplayRect(PhotoViewAttacher.this.getDrawMatrix());
                    float width = access$5002.width() < access$1600.width() ? access$1600.width() / access$5002.width() : 1.0f;
                    float width2 = ((access$5002.width() * width) * (access$1600.height() / access$1600.width())) / access$5002.height();
                    if (!MiscUtil.floatEquals(width, 1.0f) || !MiscUtil.floatEquals(width2, 1.0f)) {
                        PhotoViewAttacher.this.postScale(width, width2, access$5002.centerX(), access$5002.centerY());
                    }
                }
            }

            private int precise(float f) {
                return (int) (f * 10000.0f);
            }

            private float unPrecise(int i) {
                return (((float) i) * 1.0f) / 10000.0f;
            }

            private void updateMatrix() {
                float f;
                float f2;
                if (PhotoViewAttacher.this.getImageView() != null) {
                    float rotate = PhotoViewAttacher.this.getRotate();
                    RectF rectF = new RectF(PhotoViewAttacher.this.getDisplayRect(PhotoViewAttacher.this.getDrawMatrix()));
                    PhotoViewAttacher.this.updateBaseMatrix(PhotoViewAttacher.this.getImageView().getDrawable(), PhotoViewAttacher.this.trimRotation(rotate));
                    RectF rectF2 = new RectF(PhotoViewAttacher.this.getDisplayRect(PhotoViewAttacher.this.mBaseMatrix));
                    PhotoViewAttacher.this.mSuppMatrix.reset();
                    if (!RotateManager.this.needTrimToBaseRect(rectF, rectF2)) {
                        float width = rectF.width() / rectF2.width();
                        float height = rectF.height() / rectF2.height();
                        Matrix matrix = new Matrix();
                        matrix.postScale(width, height, rectF2.centerX(), rectF2.centerY());
                        matrix.postTranslate(rectF.centerX() - rectF2.centerX(), rectF.centerY() - rectF2.centerY());
                        PhotoViewAttacher.this.mSuppMatrix.set(matrix);
                        f = height;
                        f2 = width;
                    } else {
                        f2 = 1.0f;
                        f = 1.0f;
                    }
                    PhotoViewAttacher.this.dispatchScaleChanged(f2, f, rectF2.centerX(), rectF2.centerY(), PhotoViewAttacher.this.getScale());
                }
            }

            public void alpha(float f, float f2, int i) {
                this.mAlphaScroller.forceFinished(true);
                this.mAlphaScroller.startScroll(precise(f), 0, precise(f2 - f), 0, i);
            }

            public boolean isRunning() {
                return this.isRunning;
            }

            public void rotate(float f, float f2, float f3, float f4, int i) {
                this.mRotateScroller.forceFinished(true);
                this.mRotateFocusX = f3;
                this.mRotateFocusY = f4;
                this.mRotateScroller.startScroll(precise(f), 0, precise(f2 - f), 0, i);
            }

            public void run() {
                boolean z;
                if (!isRunning()) {
                    stop();
                    return;
                }
                ImageView imageView = PhotoViewAttacher.this.getImageView();
                if (imageView != null) {
                    if (this.mRotateScroller.computeScrollOffset()) {
                        float unPrecise = unPrecise(this.mRotateScroller.getCurrX());
                        PhotoViewAttacher.this.postRotate(PhotoViewAttacher.this.getRotate() - unPrecise, this.mRotateFocusX, this.mRotateFocusY);
                        z = true;
                    } else {
                        z = false;
                    }
                    if (this.mScaleScroller.computeScrollOffset()) {
                        float unPrecise2 = unPrecise(this.mScaleScroller.getCurrX()) / MatrixUtil.getScale(PhotoViewAttacher.this.mSuppMatrix);
                        RectF access$500 = PhotoViewAttacher.this.getDisplayRect(PhotoViewAttacher.this.getDrawMatrix());
                        if (access$500 != null) {
                            PhotoViewAttacher.this.postScale(unPrecise2, unPrecise2, access$500.centerX(), access$500.centerY());
                        }
                        z = true;
                    }
                    if (this.mTranslateScroller.computeScrollOffset()) {
                        int currX = this.mTranslateScroller.getCurrX();
                        int currY = this.mTranslateScroller.getCurrY();
                        float unPrecise3 = unPrecise(currX - this.mTranslateX);
                        float unPrecise4 = unPrecise(currY - this.mTraslateY);
                        this.mRotateFocusX += unPrecise3;
                        this.mRotateFocusY += unPrecise4;
                        PhotoViewAttacher.this.postTranslate(unPrecise3, unPrecise4);
                        this.mTranslateX = currX;
                        this.mTraslateY = currY;
                        z = true;
                    }
                    if (this.mAlphaScroller.computeScrollOffset()) {
                        PhotoViewAttacher.this.updateAlpha(unPrecise(this.mAlphaScroller.getCurrX()));
                    }
                    PhotoViewAttacher.this.setImageViewMatrix(PhotoViewAttacher.this.getDrawMatrix());
                    if (z) {
                        Compat.postOnAnimation(imageView, this);
                    } else {
                        checkBounds();
                        updateMatrix();
                        PhotoViewAttacher.this.updateAlpha(1.0f);
                        this.isRunning = false;
                        PhotoViewAttacher.this.setImageViewMatrix(PhotoViewAttacher.this.getDrawMatrix());
                        PhotoViewAttacher.this.clearAnim(8);
                        if (PhotoViewAttacher.this.mRotateListener != null) {
                            PhotoViewAttacher.this.mRotateListener.onRotateEnd(PhotoViewAttacher.this.getRotate());
                        }
                    }
                }
            }

            public void scale(float f, float f2, int i) {
                this.mScaleScroller.forceFinished(true);
                this.mScaleScroller.startScroll(precise(f), 0, precise(f2 - f), 0, i);
            }

            public void start() {
                ImageView imageView = PhotoViewAttacher.this.getImageView();
                if (imageView != null) {
                    this.isRunning = true;
                    Compat.postOnAnimation(imageView, this);
                }
            }

            public void stop() {
                this.mRotateScroller.forceFinished(true);
                this.mScaleScroller.forceFinished(true);
                this.mTranslateScroller.forceFinished(true);
                if (this.isRunning) {
                    this.isRunning = false;
                    PhotoViewAttacher.this.clearAnim(8);
                }
            }

            public void translate(float f, float f2, float f3, float f4, int i) {
                this.mTranslateScroller.forceFinished(true);
                this.mTranslateX = precise(f);
                this.mTraslateY = precise(f2);
                this.mTranslateScroller.startScroll(precise(f), precise(f2), precise(f3), precise(f4), i);
            }
        }

        RotateManager() {
            Context context = PhotoViewAttacher.this.getImageView().getContext();
            this.mRotateDetector = new RotateGestureDetector(context, this);
            this.mAjustAnim = new AdjustAnimation(context);
            ViewConfiguration viewConfiguration = ViewConfiguration.get(context);
            this.CRITICAL_VELOCITY = Math.min(((float) viewConfiguration.getScaledMinimumFlingVelocity()) * 10.0f, ((float) viewConfiguration.getScaledMaximumFlingVelocity()) / 10.0f);
        }

        private void adjustAfterRotate(RotateGestureDetector rotateGestureDetector, boolean z, float f) {
            int i;
            if (PhotoViewAttacher.this.getImageView() != null) {
                this.mAjustAnim.stop();
                float rotate = PhotoViewAttacher.this.getRotate();
                float calculateFinalDegrees = (float) calculateFinalDegrees(z, f);
                Matrix matrix = new Matrix(PhotoViewAttacher.this.getDrawMatrix());
                float f2 = rotate - calculateFinalDegrees;
                matrix.postRotate(f2, rotateGestureDetector.getFocusX(), rotateGestureDetector.getFocusY());
                int calculateRotateDuration = calculateRotateDuration(Math.abs(f2), f);
                this.mAjustAnim.rotate(rotate, calculateFinalDegrees, rotateGestureDetector.getFocusX(), rotateGestureDetector.getFocusY(), calculateRotateDuration);
                float[] calculateTranslate = calculateTranslate(matrix);
                if (calculateTranslate != null) {
                    this.mAjustAnim.translate(0.0f, 0.0f, calculateTranslate[0], calculateTranslate[1], calculateRotateDuration);
                }
                float calculateScale = calculateScale(matrix);
                if (!Float.isNaN(calculateScale)) {
                    float scale = MatrixUtil.getScale(PhotoViewAttacher.this.mSuppMatrix);
                    float f3 = scale * calculateScale;
                    i = calculateScaleDuration(calculateScale, f);
                    this.mAjustAnim.scale(scale, f3, i);
                } else {
                    i = calculateRotateDuration;
                }
                this.mAjustAnim.alpha(PhotoViewAttacher.this.mAlpha, 1.0f, Math.max(calculateRotateDuration, i));
                this.mAjustAnim.start();
            }
        }

        private int calculateFinalDegrees(boolean z, float f) {
            float rotate = PhotoViewAttacher.this.getRotate();
            float f2 = this.mRotatedDegrees % 90.0f;
            float abs = ((f2 <= 0.0f || z) && (f2 >= 0.0f || !z)) ? Math.abs(f2) : 90.0f - Math.abs(f2);
            if (Math.abs(f) <= this.CRITICAL_VELOCITY) {
                return abs > 45.0f ? PhotoViewAttacher.this.trimRotation(rotate) : (((int) rotate) / 90) * 90;
            }
            if (abs <= 20.0f) {
                return (((int) rotate) / 90) * 90;
            }
            float f3 = rotate % 90.0f;
            float f4 = f3 > 0.0f ? z ? -f3 : 90.0f - f3 : z ? -90.0f - f3 : -f3;
            return PhotoViewAttacher.this.trimRotation(rotate + f4);
        }

        private int calculateRotateDuration(float f, float f2) {
            return 300;
        }

        private float calculateScale(Matrix matrix) {
            ImageView imageView = PhotoViewAttacher.this.getImageView();
            if (imageView == null) {
                return Float.NaN;
            }
            RectF access$1600 = PhotoViewAttacher.this.calculateBaseRect(imageView.getDrawable(), (int) MatrixUtil.getRotate(matrix));
            if (access$1600 == null) {
                return Float.NaN;
            }
            RectF rectF = new RectF(PhotoViewAttacher.this.getDisplayRect(matrix));
            if (needTrimToBaseRect(rectF, access$1600)) {
                return Math.max(access$1600.width() / rectF.width(), access$1600.height() / rectF.height());
            }
            return Float.NaN;
        }

        private int calculateScaleDuration(float f, float f2) {
            return 300;
        }

        /* access modifiers changed from: private */
        public float[] calculateTranslate(Matrix matrix) {
            float f;
            float f2;
            ImageView imageView = PhotoViewAttacher.this.getImageView();
            if (imageView == null) {
                return null;
            }
            RectF access$1600 = PhotoViewAttacher.this.calculateBaseRect(imageView.getDrawable(), (int) MatrixUtil.getRotate(matrix));
            if (access$1600 == null) {
                return null;
            }
            RectF rectF = new RectF(PhotoViewAttacher.this.getDisplayRect(matrix));
            if (needTrimToBaseRect(rectF, access$1600)) {
                f = (float) ((int) (access$1600.centerX() - rectF.centerX()));
                f2 = (float) ((int) (access$1600.centerY() - rectF.centerY()));
            } else {
                if (rectF.width() > ((float) PhotoViewAttacher.this.getImageViewWidth(imageView))) {
                    f = rectF.left > 0.0f ? (float) ((int) (0.0f - rectF.left)) : 0.0f;
                    if (rectF.right < ((float) PhotoViewAttacher.this.getImageViewWidth(imageView))) {
                        f = (float) ((int) (((float) PhotoViewAttacher.this.getImageViewWidth(imageView)) - rectF.right));
                    }
                } else {
                    f = (float) ((int) (access$1600.centerX() - rectF.centerX()));
                }
                if (rectF.height() > ((float) PhotoViewAttacher.this.getImageViewHeight(imageView))) {
                    f2 = rectF.bottom < ((float) PhotoViewAttacher.this.getImageViewHeight(imageView)) ? (float) ((int) (((float) PhotoViewAttacher.this.getImageViewHeight(imageView)) - rectF.bottom)) : rectF.top > 0.0f ? (float) ((int) (0.0f - rectF.top)) : 0.0f;
                } else {
                    f2 = (float) ((int) (access$1600.centerY() - rectF.centerY()));
                }
            }
            return new float[]{f, f2};
        }

        /* access modifiers changed from: private */
        public boolean needTrimToBaseRect(RectF rectF, RectF rectF2) {
            return !PhotoViewAttacher.this.mZoomEnabled || rectF.width() < rectF2.width() * 1.2f || rectF.height() < rectF2.height() * 1.2f;
        }

        private void rotateBy(float f, float f2, float f3) {
            PhotoViewAttacher.this.postRotate(f, f2, f3);
            PhotoViewAttacher.this.setImageViewMatrix(PhotoViewAttacher.this.getDrawMatrix());
        }

        public boolean isAutoRotating() {
            return this.mAjustAnim.isRunning();
        }

        public boolean isManualRotating() {
            return this.mRotateDetector.isInProgress();
        }

        public boolean isRotating() {
            return isManualRotating() || isAutoRotating();
        }

        public boolean onRotate(RotateGestureDetector rotateGestureDetector) {
            float rotateDegrees = rotateGestureDetector.getRotateDegrees();
            if (Float.isNaN(rotateDegrees) || Float.isInfinite(rotateDegrees)) {
                return false;
            }
            this.mRotatedDegrees += rotateDegrees;
            rotateBy(rotateDegrees, rotateGestureDetector.getFocusX(), rotateGestureDetector.getFocusY());
            if (PhotoViewAttacher.this.mRotateListener != null) {
                PhotoViewAttacher.this.mRotateListener.onRotate(rotateDegrees, PhotoViewAttacher.this.getRotate(), rotateGestureDetector.getFocusX(), rotateGestureDetector.getFocusY());
            }
            return true;
        }

        public boolean onRotateBegin(RotateGestureDetector rotateGestureDetector) {
            PhotoViewAttacher.this.appendAnim(8);
            this.mRotatedDegrees = 0.0f;
            if (PhotoViewAttacher.this.mRotateListener != null) {
                PhotoViewAttacher.this.mRotateListener.onRotateBegin(PhotoViewAttacher.this.getRotate());
            }
            return true;
        }

        public void onRotateEnd(RotateGestureDetector rotateGestureDetector, boolean z, float f) {
            adjustAfterRotate(rotateGestureDetector, z, f);
        }

        public boolean onTouchEvent(MotionEvent motionEvent) {
            return this.mRotateDetector.onTouchEvent(motionEvent);
        }

        public void stop() {
            this.mAjustAnim.stop();
        }
    }

    private class Transition implements Runnable {
        private boolean isExitTransition;
        private boolean isExited;
        private boolean isRunning;
        private ScrollerProxy mAlphaScroller;
        private Matrix mClipMatrix = new Matrix();
        private RectF mClipRect;
        private ScrollerProxy mClipScroller;
        private int mCurrentX;
        private int mCurrentY;
        public TransitionListener mListener;
        private ScrollerProxy mScaleScroller;
        private ScrollerProxy mTranslateScroller;

        public Transition(Context context) {
            CubicEaseOutInterpolator cubicEaseOutInterpolator = new CubicEaseOutInterpolator();
            this.mAlphaScroller = ScrollerProxy.getScroller(context, new LinearInterpolator());
            this.mTranslateScroller = ScrollerProxy.getScroller(context, cubicEaseOutInterpolator);
            this.mScaleScroller = ScrollerProxy.getScroller(context, cubicEaseOutInterpolator);
            this.mClipScroller = ScrollerProxy.getScroller(context, cubicEaseOutInterpolator);
        }

        public void alpha(float f, float f2) {
            this.mAlphaScroller.startScroll((int) (f * 10000.0f), 0, (int) ((f2 - f) * 10000.0f), 0, 150);
        }

        public void clip(float f, float f2, float f3, float f4) {
            RectF access$500 = PhotoViewAttacher.this.getDisplayRect(PhotoViewAttacher.this.getDrawMatrix());
            if (access$500 != null) {
                float f5 = (access$500.left + access$500.right) / 2.0f;
                this.mClipMatrix.setScale(f, f2, f5, f5);
                this.mClipRect = new RectF();
                this.mClipMatrix.mapRect(this.mClipRect, access$500);
                this.mClipScroller.startScroll((int) (f * 10000.0f), (int) (f2 * 10000.0f), (int) (f3 * 10000.0f), (int) (f4 * 10000.0f), 150);
            }
        }

        public void ensureAlpha(boolean z) {
            float f = 0.0f;
            if (!z) {
                f = MiscUtil.floatEquals(PhotoViewAttacher.this.mAlpha, 0.0f) ? 1.0f : PhotoViewAttacher.this.mAlpha;
            } else if (!MiscUtil.floatEquals(PhotoViewAttacher.this.mAlpha, 1.0f)) {
                f = PhotoViewAttacher.this.mAlpha;
            }
            PhotoViewAttacher.this.updateAlpha(f);
        }

        public RectF getClipRect() {
            return this.mClipRect;
        }

        public boolean isExited() {
            return this.isExited;
        }

        public boolean isRunning() {
            return this.isRunning;
        }

        public void run() {
            boolean z;
            if (!this.isRunning) {
                PhotoViewAttacher.this.clearAnim(4);
                return;
            }
            ImageView imageView = PhotoViewAttacher.this.getImageView();
            if (imageView != null) {
                if (this.mTranslateScroller.computeScrollOffset()) {
                    PhotoViewAttacher.this.postTranslate((float) (this.mTranslateScroller.getCurrX() - this.mCurrentX), (float) (this.mTranslateScroller.getCurrY() - this.mCurrentY));
                    this.mCurrentX = this.mTranslateScroller.getCurrX();
                    this.mCurrentY = this.mTranslateScroller.getCurrY();
                    z = true;
                } else {
                    z = false;
                }
                if (this.mScaleScroller.computeScrollOffset()) {
                    float currX = ((float) this.mScaleScroller.getCurrX()) / (PhotoViewAttacher.this.getScale() * 10000.0f);
                    RectF access$500 = PhotoViewAttacher.this.getDisplayRect(PhotoViewAttacher.this.getDrawMatrix());
                    if (access$500 != null) {
                        PhotoViewAttacher.this.postScale(currX, currX, access$500.left, access$500.top);
                    }
                    z = true;
                }
                if (this.mClipScroller.computeScrollOffset()) {
                    float currX2 = (((float) this.mClipScroller.getCurrX()) * 1.0f) / 10000.0f;
                    float currY = (((float) this.mClipScroller.getCurrY()) * 1.0f) / 10000.0f;
                    RectF access$5002 = PhotoViewAttacher.this.getDisplayRect(PhotoViewAttacher.this.getDrawMatrix());
                    if (access$5002 != null) {
                        this.mClipMatrix.setScale(currX2, currY, (access$5002.left + access$5002.right) / 2.0f, (access$5002.top + access$5002.bottom) / 2.0f);
                        this.mClipMatrix.mapRect(this.mClipRect, access$5002);
                    }
                    if (MiscUtil.floatEquals(currX2, 1.0f)) {
                        this.mClipRect.left = 0.0f;
                        this.mClipRect.right = (float) imageView.getWidth();
                    }
                    if (MiscUtil.floatEquals(currY, 1.0f)) {
                        this.mClipRect.top = 0.0f;
                        this.mClipRect.bottom = (float) imageView.getHeight();
                    }
                    z = true;
                }
                if (this.mAlphaScroller.computeScrollOffset()) {
                    PhotoViewAttacher.this.updateAlpha((((float) this.mAlphaScroller.getCurrX()) * 1.0f) / 10000.0f);
                    z = true;
                }
                if (PhotoViewAttacher.this.getDisplayRect(PhotoViewAttacher.this.getDrawMatrix()) != null) {
                    PhotoViewAttacher.this.setImageViewMatrix(PhotoViewAttacher.this.getDrawMatrix());
                } else {
                    imageView.invalidate();
                }
                if (z) {
                    PhotoViewAttacher.this.appendAnim(4);
                    Compat.postOnAnimation(imageView, this);
                } else {
                    PhotoViewAttacher.this.clearAnim(4);
                    if (this.isRunning) {
                        this.mClipRect = null;
                        this.isRunning = false;
                        if (this.isExitTransition) {
                            this.isExited = true;
                        } else {
                            this.isExited = false;
                            PhotoViewAttacher.this.resetMatrix();
                        }
                        if (this.mListener != null) {
                            imageView.postDelayed(new Runnable() {
                                public void run() {
                                    if (Transition.this.mListener != null) {
                                        Transition.this.mListener.onTransitEnd();
                                        Transition.this.mListener = null;
                                    }
                                }
                            }, 20);
                        }
                    }
                }
            } else {
                PhotoViewAttacher.this.clearAnim(4);
            }
        }

        public void scale(float f, float f2) {
            this.mScaleScroller.startScroll((int) (f * 10000.0f), 0, (int) ((f2 - f) * 10000.0f), 0, 150);
        }

        public void setTransitionListener(TransitionListener transitionListener) {
            this.mListener = transitionListener;
        }

        public void start(boolean z) {
            ImageView imageView = PhotoViewAttacher.this.getImageView();
            if (imageView != null) {
                this.isRunning = true;
                this.isExitTransition = z;
                Compat.postOnAnimation(imageView, this);
            }
        }

        public void stop() {
            ImageView imageView = PhotoViewAttacher.this.getImageView();
            if (imageView != null) {
                imageView.removeCallbacks(this);
            }
            this.mTranslateScroller.forceFinished(true);
            this.mScaleScroller.forceFinished(true);
            this.mClipScroller.forceFinished(true);
            this.isRunning = false;
        }

        public void translate(int i, int i2, int i3, int i4) {
            this.mCurrentX = i;
            this.mCurrentY = i2;
            this.mTranslateScroller.startScroll(i, i2, i3, i4, 150);
        }
    }

    public interface TransitionListener {
        void onTransitEnd();
    }

    public PhotoViewAttacher(ImageView imageView) {
        this(imageView, true);
    }

    public PhotoViewAttacher(ImageView imageView, boolean z) {
        this.ZOOM_DURATION = 200;
        this.EXIT_SCALE_RATIO = 0.8f;
        this.mExitScale = 0.8f;
        this.mDownScale = 1.0f;
        this.mMinScale = 1.0f;
        this.mMidScale = 1.75f;
        this.mMaxScale = 2.0f;
        this.mAllowParentInterceptOnEdge = true;
        this.mBaseMatrix = new Matrix();
        this.mDrawMatrix = new Matrix();
        this.mSuppMatrix = new Matrix();
        this.mDisplayRect = new RectF();
        this.mMatrixValues = new float[9];
        this.mMatrixChangeListeners = new HashSet();
        this.mHScrollEdge = 4;
        this.mVScrollEdge = 4;
        this.mRotateEnabled = true;
        this.mScaleType = ScaleType.FIT_CENTER;
        this.mIsRegionDecodeEnable = true;
        this.mAnim = 0;
        this.mAlpha = 1.0f;
        this.mImageView = new WeakReference<>(imageView);
        imageView.setOnTouchListener(this);
        ViewTreeObserver viewTreeObserver = imageView.getViewTreeObserver();
        if (viewTreeObserver != null) {
            viewTreeObserver.addOnGlobalLayoutListener(this);
        }
        setImageViewScaleTypeMatrix(imageView);
        if (!imageView.isInEditMode()) {
            setZoomable(z);
            this.mDragDownOutThreshold = imageView.getResources().getDisplayMetrics().density * 10.0f;
        }
    }

    /* access modifiers changed from: private */
    public void appendAnim(int i) {
        this.mAnim = i | this.mAnim;
    }

    /* access modifiers changed from: private */
    public RectF calculateBaseRect(Drawable drawable, int i) {
        ImageView imageView = getImageView();
        if (imageView == null || drawable == null) {
            return null;
        }
        float imageViewWidth = (float) getImageViewWidth(imageView);
        float imageViewHeight = (float) getImageViewHeight(imageView);
        int drawableWidth = getDrawableWidth(i);
        int drawbleHeight = getDrawbleHeight(i);
        if (imageViewWidth == 0.0f || imageViewHeight == 0.0f || drawableWidth == 0 || drawbleHeight == 0) {
            return null;
        }
        Matrix matrix = new Matrix();
        float f = (float) drawableWidth;
        float f2 = imageViewWidth / f;
        float f3 = (float) drawbleHeight;
        float f4 = imageViewHeight / f3;
        if (this.mScaleType != ScaleType.CENTER) {
            if (this.mScaleType != ScaleType.CENTER_CROP) {
                if (this.mScaleType != ScaleType.CENTER_INSIDE) {
                    RectF rectF = new RectF(0.0f, 0.0f, f, f3);
                    RectF rectF2 = new RectF(0.0f, 0.0f, imageViewWidth, imageViewHeight);
                    switch (AnonymousClass2.$SwitchMap$android$widget$ImageView$ScaleType[this.mScaleType.ordinal()]) {
                        case 2:
                            matrix.setRectToRect(rectF, rectF2, ScaleToFit.START);
                            break;
                        case 3:
                            matrix.setRectToRect(rectF, rectF2, ScaleToFit.END);
                            break;
                        case 4:
                            matrix.setRectToRect(rectF, rectF2, ScaleToFit.CENTER);
                            break;
                        case 5:
                            matrix.setRectToRect(rectF, rectF2, ScaleToFit.FILL);
                            break;
                    }
                } else {
                    float min = Math.min(1.0f, Math.min(f2, f4));
                    matrix.postScale(min, min);
                    matrix.postTranslate((imageViewWidth - (f * min)) / 2.0f, (imageViewHeight - (min * f3)) / 2.0f);
                }
            } else {
                float max = Math.max(f2, f4);
                matrix.postScale(max, max);
                matrix.postTranslate((imageViewWidth - (f * max)) / 2.0f, (imageViewHeight - (max * f3)) / 2.0f);
            }
        } else {
            matrix.postTranslate((imageViewWidth - f) / 2.0f, (imageViewHeight - f3) / 2.0f);
        }
        RectF rectF3 = new RectF();
        rectF3.set(0.0f, 0.0f, f, f3);
        matrix.mapRect(rectF3);
        return rectF3;
    }

    private void calculateScales() {
        if (getImageView() != null) {
            float imageViewWidth = (float) getImageViewWidth(getImageView());
            float imageViewHeight = (float) getImageViewHeight(getImageView());
            int rotate = (int) getRotate();
            int drawableWidth = getDrawableWidth(rotate);
            int drawbleHeight = getDrawbleHeight(rotate);
            if (imageViewWidth != 0.0f && imageViewHeight != 0.0f && drawableWidth != 0 && drawbleHeight != 0) {
                this.mMaxDoubleTapScale = 0.0f;
                this.mMaxPointsScale = 0.0f;
                RectF displayRect = getDisplayRect(this.mBaseMatrix);
                float width = displayRect.width();
                float maximumScale = (getMaximumScale() * width) / imageViewWidth;
                float height = (displayRect.height() * getMaximumScale()) / imageViewHeight;
                switch (getEnlargeMode(width, imageViewWidth)) {
                    case 0:
                        float f = 2.0f;
                        if (maximumScale < height) {
                            if (((double) maximumScale) < 1.0d) {
                                f = imageViewWidth / displayRect.width();
                            }
                            this.mMidScale = f;
                            this.mMaxDoubleTapScale = ((float) getCorrectWidth(this.mOriginWidth, this.mOriginHeight)) / displayRect.width();
                        } else {
                            if (((double) height) < 1.0d) {
                                f = imageViewHeight / displayRect.height();
                            }
                            this.mMidScale = f;
                            this.mMaxDoubleTapScale = ((float) getCorrectHeight(this.mOriginWidth, this.mOriginHeight)) / displayRect.height();
                        }
                        if (this.mMidScale > this.mMaxDoubleTapScale) {
                            this.mMaxDoubleTapScale = this.mMaxScale;
                            break;
                        }
                        break;
                    case 1:
                        this.mMidScale = imageViewWidth / displayRect.width();
                        this.mMaxDoubleTapScale = this.mMidScale;
                        break;
                    case 2:
                        if (((double) height) < 1.0d) {
                            this.mMaxDoubleTapScale = imageViewHeight / displayRect.height();
                        } else {
                            this.mMaxDoubleTapScale = getMaximumScale();
                        }
                        this.mMidScale = this.mMaxDoubleTapScale;
                        break;
                }
                this.mMaxPointsScale = this.mMaxDoubleTapScale * 1.5f;
            }
        }
    }

    private void cancelFling() {
        if (this.mCurrentFlingRunnable != null) {
            this.mCurrentFlingRunnable.cancelFling();
            this.mCurrentFlingRunnable = null;
        }
    }

    private void checkAndDisplayMatrix() {
        if (checkMatrixBounds()) {
            setImageViewMatrix(getDrawMatrix());
        }
    }

    private void checkImageViewScaleType() {
        ImageView imageView = getImageView();
        if (imageView != null && !(imageView instanceof IPhotoView) && !ScaleType.MATRIX.equals(imageView.getScaleType())) {
            throw new IllegalStateException("The ImageView's ScaleType has been changed since attaching a PhotoViewAttacher");
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:29:0x009f, code lost:
        r15 = r3;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:32:0x00aa, code lost:
        r0.mHScrollEdge = 4;
     */
    private boolean checkMatrixBounds() {
        float f;
        boolean z;
        float f2;
        float f3;
        if (interceptCheckBounds()) {
            return true;
        }
        ImageView imageView = getImageView();
        if (imageView == null) {
            return false;
        }
        RectF displayRect = getDisplayRect(getDrawMatrix());
        if (displayRect == null) {
            return false;
        }
        float height = displayRect.height();
        float width = displayRect.width();
        int imageViewHeight = getImageViewHeight(imageView);
        double d = (double) imageViewHeight;
        float f4 = 0.0f;
        if (Math.floor((double) height) <= d) {
            switch (AnonymousClass2.$SwitchMap$android$widget$ImageView$ScaleType[this.mScaleType.ordinal()]) {
                case 2:
                    f3 = -displayRect.top;
                    break;
                case 3:
                    f3 = (((float) imageViewHeight) - height) - displayRect.top;
                    break;
                default:
                    f3 = ((((float) imageViewHeight) - height) / 2.0f) - displayRect.top;
                    break;
            }
            this.mVScrollEdge = 5;
            f = f3;
        } else if (Math.floor((double) displayRect.top) >= 0.0d) {
            this.mVScrollEdge = 2;
            f = -displayRect.top;
        } else if (Math.floor((double) displayRect.bottom) <= d) {
            f = ((float) imageViewHeight) - displayRect.bottom;
            this.mVScrollEdge = 3;
        } else {
            this.mVScrollEdge = -1;
            f = 0.0f;
        }
        int imageViewWidth = getImageViewWidth(imageView);
        float f5 = (float) imageViewWidth;
        if (width <= f5) {
            switch (AnonymousClass2.$SwitchMap$android$widget$ImageView$ScaleType[this.mScaleType.ordinal()]) {
                case 2:
                    f4 = -displayRect.left;
                    break;
                case 3:
                    f2 = (f5 - width) - displayRect.left;
                    break;
                default:
                    f2 = ((f5 - width) / 2.0f) - displayRect.left;
                    break;
            }
        } else if (Math.floor((double) displayRect.left) >= 0.0d) {
            this.mHScrollEdge = 0;
            f4 = -displayRect.left;
        } else {
            if (Math.floor((double) displayRect.right) <= ((double) imageViewWidth)) {
                f4 = f5 - displayRect.right;
                z = true;
                this.mHScrollEdge = 1;
            } else {
                z = true;
                this.mHScrollEdge = -1;
            }
            postTranslate(f4, f);
            return z;
        }
        z = true;
        postTranslate(f4, f);
        return z;
    }

    private static void checkZoomLevels(float f, float f2, float f3) {
        if (f >= f2) {
            throw new IllegalArgumentException("MinZoom has to be less than MidZoom");
        } else if (f2 >= f3) {
            throw new IllegalArgumentException("MidZoom has to be less than MaxZoom");
        }
    }

    /* access modifiers changed from: private */
    public void clearAnim(int i) {
        this.mAnim = (i ^ -1) & this.mAnim;
    }

    /* access modifiers changed from: private */
    public void dispatchScaleChanged(float f, float f2, float f3, float f4, float f5) {
        if (this.mScaleChangeListener != null) {
            this.mScaleChangeListener.onScaleChange(f, f2, f3, f4, f5);
        }
    }

    private void drawBackground(Canvas canvas) {
        ImageView imageView = getImageView();
        if (imageView != null && this.mAlphaDrawable != null) {
            this.mAlphaDrawable.setAlpha((int) (this.mAlpha * 255.0f));
            this.mAlphaDrawable.setBounds(0, 0, getImageViewWidth(imageView), getImageViewHeight(imageView));
            this.mAlphaDrawable.draw(canvas);
        }
    }

    private void drawStroke(Canvas canvas) {
        if (this.mStrokeWidth > 0) {
            RectF displayRect = getDisplayRect();
            if (displayRect != null && this.mStrokePaint != null) {
                displayRect.inset((float) this.mStrokeWidth, (float) this.mStrokeWidth);
                canvas.drawRect(displayRect, this.mStrokePaint);
            }
        }
    }

    private void ensureRotateDetector() {
        if (this.mRotateDetector == null) {
            this.mRotateDetector = new RotateManager();
        }
    }

    private void ensureScaleDragDetector() {
        if (this.mScaleDragDetector == null) {
            ImageView imageView = getImageView();
            if (imageView != null) {
                this.mScaleDragDetector = VersionedGestureDetector.newInstance(imageView.getContext(), this);
            }
        }
    }

    private void ensureStrokePaint() {
        if (this.mStrokePaint == null) {
            this.mStrokePaint = new Paint();
            this.mStrokePaint.setAntiAlias(false);
            this.mStrokePaint.setStyle(Style.STROKE);
        }
    }

    private void ensureTapDetector() {
        if (this.mGestureDetector == null) {
            ImageView imageView = getImageView();
            if (imageView != null) {
                this.mGestureDetector = new GestureDetector(imageView.getContext(), new SimpleOnGestureListener() {
                    public boolean onDown(MotionEvent motionEvent) {
                        return true;
                    }

                    public void onLongPress(MotionEvent motionEvent) {
                        if (PhotoViewAttacher.this.mLongClickListener != null) {
                            PhotoViewAttacher.this.mLongClickListener.onLongClick(PhotoViewAttacher.this.getImageView());
                        }
                    }
                });
                this.mGestureDetector.setOnDoubleTapListener(new DefaultOnDoubleTapListener(this));
            }
        }
    }

    private int getCorrectHeight(int i, int i2) {
        RectF displayRect = getDisplayRect(this.mBaseMatrix);
        return displayRect.height() > displayRect.width() ? Math.max(i, i2) : Math.min(i, i2);
    }

    private int getCorrectWidth(int i, int i2) {
        RectF displayRect = getDisplayRect(this.mBaseMatrix);
        return displayRect.width() > displayRect.height() ? Math.max(i, i2) : Math.min(i, i2);
    }

    /* access modifiers changed from: private */
    public RectF getDisplayRect(Matrix matrix) {
        ImageView imageView = getImageView();
        if (imageView != null && getImageViewHeight(imageView) > 0 && getImageViewWidth(imageView) > 0) {
            Drawable drawable = imageView.getDrawable();
            if (drawable != null) {
                this.mDisplayRect.set(0.0f, 0.0f, (float) drawable.getIntrinsicWidth(), (float) drawable.getIntrinsicHeight());
                matrix.mapRect(this.mDisplayRect);
                return this.mDisplayRect;
            }
        }
        return null;
    }

    private int getDrawableWidth(int i) {
        ImageView imageView = getImageView();
        if (imageView == null) {
            return 0;
        }
        Drawable drawable = imageView.getDrawable();
        if (drawable == null) {
            return 0;
        }
        return (((i > 0 ? i + 45 : i + -45) / 90) & 1) == 0 ? drawable.getIntrinsicWidth() : drawable.getIntrinsicHeight();
    }

    private int getDrawbleHeight(int i) {
        ImageView imageView = getImageView();
        if (imageView == null) {
            return 0;
        }
        Drawable drawable = imageView.getDrawable();
        if (drawable == null) {
            return 0;
        }
        return (((i > 0 ? i + 45 : i + -45) / 90) & 1) == 0 ? drawable.getIntrinsicHeight() : drawable.getIntrinsicWidth();
    }

    private int getEnlargeMode(float f, float f2) {
        if (this.mSupportHd) {
            return 0;
        }
        return Math.round(f) < Math.round(f2) ? 1 : 2;
    }

    /* access modifiers changed from: private */
    public int getImageViewHeight(ImageView imageView) {
        if (imageView == null) {
            return 0;
        }
        return (imageView.getHeight() - imageView.getPaddingTop()) - imageView.getPaddingBottom();
    }

    /* access modifiers changed from: private */
    public int getImageViewWidth(ImageView imageView) {
        if (imageView == null) {
            return 0;
        }
        return (imageView.getWidth() - imageView.getPaddingLeft()) - imageView.getPaddingRight();
    }

    private float getMaxPointsScale() {
        return this.mMaxPointsScale > 0.0f ? this.mMaxPointsScale : getMaximumScale();
    }

    private float getMaxPointsScalingScale() {
        return getMaxPointsScale() * 1.5f;
    }

    private Transition getTransition() {
        if (this.mTransition == null) {
            ImageView imageView = getImageView();
            if (imageView != null) {
                this.mTransition = new Transition(imageView.getContext());
            }
        }
        return this.mTransition;
    }

    private float getValue(Matrix matrix, int i) {
        matrix.getValues(this.mMatrixValues);
        return this.mMatrixValues[i];
    }

    private static boolean hasDrawable(ImageView imageView) {
        return (imageView == null || imageView.getDrawable() == null) ? false : true;
    }

    private boolean interceptCheckBounds() {
        return this.mIsDragDownOut || getTransition().isRunning() || (this.mRotateDetector != null && this.mRotateDetector.isRotating());
    }

    private boolean interceptDrag() {
        return (this.mScaleDragDetector != null && this.mScaleDragDetector.isScaling()) || (this.mRotateDetector != null && this.mRotateDetector.isRotating());
    }

    private boolean interceptDrawTiles() {
        return !this.mIsRegionDecodeEnable || getTransition().isRunning() || isViewAnimationRunning() || (this.mRotateDetector != null && this.mRotateDetector.isRotating());
    }

    private boolean interceptMotionEnd() {
        return this.mRotateDetector != null && this.mRotateDetector.isRotating();
    }

    private boolean interceptTouch() {
        return getTransition().isRunning() || (this.mRotateDetector != null && this.mRotateDetector.isAutoRotating());
    }

    private static boolean isSupportedScaleType(ScaleType scaleType) {
        if (scaleType == null) {
            return false;
        }
        if (AnonymousClass2.$SwitchMap$android$widget$ImageView$ScaleType[scaleType.ordinal()] != 1) {
            return true;
        }
        StringBuilder sb = new StringBuilder();
        sb.append(scaleType.name());
        sb.append(" is not supported in PhotoView");
        throw new IllegalArgumentException(sb.toString());
    }

    private boolean isViewAnimationRunning() {
        ImageView imageView = getImageView();
        boolean z = false;
        if (imageView == null) {
            return false;
        }
        Animation animation = imageView.getAnimation();
        if (animation != null && animation.hasStarted() && !animation.hasEnded()) {
            z = true;
        }
        return z;
    }

    private boolean needDrawTile() {
        boolean z = false;
        if (interceptDrawTiles()) {
            return false;
        }
        ImageView imageView = getImageView();
        if (!(this.mTileView == null || imageView == null || imageView.getDrawable() == null)) {
            Drawable drawable = imageView.getDrawable();
            int intrinsicWidth = drawable.getIntrinsicWidth();
            int intrinsicHeight = drawable.getIntrinsicHeight();
            int tileProviderWidth = this.mTileView.getTileProviderWidth();
            int tileProviderHeight = this.mTileView.getTileProviderHeight();
            if (tileProviderWidth <= 0 || tileProviderHeight <= 0) {
                LogManager.getLogger().w("PhotoViewAttacher", String.format(Locale.US, "invalid tile size[%dx%d]", new Object[]{Integer.valueOf(tileProviderWidth), Integer.valueOf(tileProviderHeight)}));
                return false;
            }
            if (((this.mTileView.getTileProviderRotation() / 90) & 1) == 1) {
                tileProviderWidth = this.mTileView.getTileProviderHeight();
                tileProviderHeight = this.mTileView.getTileProviderWidth();
            }
            float f = (((float) intrinsicWidth) * 1.0f) / ((float) intrinsicHeight);
            float f2 = (((float) tileProviderWidth) * 1.0f) / ((float) tileProviderHeight);
            if (MiscUtil.floatNear(f, f2, 0.5f)) {
                if (getDisplayRect() != null && getScale() >= 1.0f) {
                    z = true;
                }
                return z;
            }
            LogManager.getLogger().w("PhotoViewAttacher", String.format("drawable w/h not equal to tile w/h: %.2f, %.2f", new Object[]{Float.valueOf(f), Float.valueOf(f2)}));
            if (MiscUtil.floatEquals((float) (Math.min(intrinsicWidth, intrinsicHeight) / Math.max(intrinsicWidth, intrinsicHeight)), (float) (Math.min(tileProviderWidth, tileProviderHeight) / Math.max(tileProviderWidth, tileProviderHeight)))) {
                LogManager.getLogger().e("PhotoViewAttacher", String.format("drawable w[%s], h[%s] not equal to tile w[%s], h[%s]; tile rotation[%s]", new Object[]{Integer.valueOf(intrinsicWidth), Integer.valueOf(intrinsicHeight), Integer.valueOf(tileProviderWidth), Integer.valueOf(tileProviderHeight), Integer.valueOf(this.mTileView.getTileProviderRotation())}));
                HashMap hashMap = new HashMap();
                hashMap.put("tile_rotation", String.valueOf(this.mTileView.getTileProviderRotation()));
                GallerySamplingStatHelper.recordErrorEvent("photo", "photo_tile_orientation_error", hashMap);
            }
        }
        return false;
    }

    private void notifyTileViewInvalidate() {
        if (needDrawTile()) {
            this.mTileView.notifyInvalidate(getDisplayRect(), getRotate());
        }
    }

    private void onBaseMatrixChanged() {
        tryAnimEnter();
        calculateScales();
        if (this.mTileView != null) {
            this.mTileView.setViewPort(new Rect(0, 0, getImageViewWidth(getImageView()), getImageViewHeight(getImageView())));
        }
    }

    private void onScaleChanged(float f, float f2, float f3, float f4) {
        float scale = getScale();
        updateAlpha(getScale());
        dispatchScaleChanged(f, f2, f3, f4, scale);
    }

    /* access modifiers changed from: private */
    public void postRotate(float f, float f2, float f3) {
        this.mSuppMatrix.postRotate(f, f2, f3);
    }

    /* access modifiers changed from: private */
    public void postScale(float f, float f2, float f3, float f4) {
        this.mSuppMatrix.postScale(f, f2, f3, f4);
        onScaleChanged(f, f2, f3, f4);
    }

    /* access modifiers changed from: private */
    public void postTranslate(float f, float f2) {
        this.mSuppMatrix.postTranslate(f, f2);
    }

    /* access modifiers changed from: private */
    public void resetMatrix() {
        float scale = getScale();
        if (!getTransition().isRunning()) {
            this.mSuppMatrix.reset();
        }
        setImageViewMatrix(getDrawMatrix());
        if (this.mScaleStageChangedListener != null) {
            if (scale >= this.mMaxDoubleTapScale) {
                this.mScaleStageChangedListener.onMaxScaleStage(false);
            } else if (scale >= this.mMidScale) {
                this.mScaleStageChangedListener.onMidScaleStage(false);
            }
        }
        checkMatrixBounds();
    }

    /* access modifiers changed from: private */
    public void setImageViewMatrix(Matrix matrix) {
        ImageView imageView = getImageView();
        if (imageView != null) {
            checkImageViewScaleType();
            imageView.setImageMatrix(matrix);
            notifyTileViewInvalidate();
            if (this.mMatrixChangeListeners != null && this.mMatrixChangeListeners.size() > 0) {
                RectF displayRect = getDisplayRect(matrix);
                if (displayRect != null) {
                    RectF rectF = new RectF(displayRect);
                    for (OnMatrixChangedListener onMatrixChanged : this.mMatrixChangeListeners) {
                        onMatrixChanged.onMatrixChanged(rectF);
                    }
                }
            }
        }
    }

    private static void setImageViewScaleTypeMatrix(ImageView imageView) {
        if (imageView != null && !(imageView instanceof IPhotoView) && !ScaleType.MATRIX.equals(imageView.getScaleType())) {
            imageView.setScaleType(ScaleType.MATRIX);
        }
    }

    private void setRotate(float f, float f2, float f3) {
        this.mSuppMatrix.setRotate(f, f2, f3);
    }

    private void setScale(float f, float f2, float f3, float f4) {
        this.mSuppMatrix.setScale(f, f2, f3, f4);
        onScaleChanged(f, f2, f3, f4);
    }

    /* access modifiers changed from: private */
    public int trimRotation(float f) {
        return ((((int) (f > 0.0f ? f + 45.0f : f - 45.0f)) / 90) * 90) % 360;
    }

    private void tryAnimEnter() {
        if (this.mEnterInfo == null) {
            return;
        }
        if (System.currentTimeMillis() - this.mWantEnterTime < 300) {
            animEnter(this.mEnterInfo, this.mTransitionListener);
        } else {
            this.mEnterInfo = null;
        }
    }

    private Paint tryGetViewPaint() {
        if (hasDrawable(getImageView())) {
            Drawable drawable = getImageView().getDrawable();
            if (drawable instanceof BitmapDrawable) {
                return ((BitmapDrawable) drawable).getPaint();
            }
        }
        return null;
    }

    /* access modifiers changed from: private */
    public void updateAlpha(float f) {
        if (f < 1.0f) {
            this.mAlpha = MiscUtil.clamp(f, 0.0f, 1.0f);
        } else {
            this.mAlpha = 1.0f;
        }
        if (this.mAlphaChangedListener != null) {
            this.mAlphaChangedListener.onAlphaChanged(this.mAlpha);
        }
    }

    /* access modifiers changed from: private */
    public void updateBaseMatrix(Drawable drawable, int i) {
        RectF calculateBaseRect = calculateBaseRect(drawable, i);
        if (calculateBaseRect != null) {
            this.mBaseMatrix.reset();
            this.mBaseMatrix.postRotate((float) (0 - i), calculateBaseRect.centerX(), calculateBaseRect.centerY());
            RectF displayRect = getDisplayRect(this.mBaseMatrix);
            this.mBaseMatrix.postTranslate(calculateBaseRect.centerX() - displayRect.centerX(), calculateBaseRect.centerY() - displayRect.centerY());
            this.mBaseMatrix.postScale(calculateBaseRect.width() / displayRect.width(), calculateBaseRect.height() / displayRect.height(), calculateBaseRect.centerX(), calculateBaseRect.centerY());
            onBaseMatrixChanged();
        }
    }

    public void addOnMatrixChangeListener(OnMatrixChangedListener onMatrixChangedListener) {
        if (onMatrixChangedListener != null) {
            this.mMatrixChangeListeners.add(onMatrixChangedListener);
        }
    }

    public void afterDraw(Canvas canvas) {
        if (needDrawTile()) {
            this.mTileView.draw(canvas, tryGetViewPaint());
        }
        drawStroke(canvas);
    }

    public void animEnter(ItemViewInfo itemViewInfo, TransitionListener transitionListener) {
        if (itemViewInfo != null && getTransition() != null && getImageView() != null) {
            getTransition().stop();
            RectF displayRect = getDisplayRect();
            if (displayRect != null) {
                ItemViewInfo imageInfo = ItemViewInfo.getImageInfo(getImageView(), 0);
                float width = ((float) itemViewInfo.getWidth()) / displayRect.width();
                float height = ((float) itemViewInfo.getHeight()) / displayRect.height();
                if (width <= height) {
                    width = height;
                }
                float scale = getScale();
                float width2 = displayRect.width() * width;
                float height2 = displayRect.height() * width;
                int x = (int) ((((float) imageInfo.getX()) + displayRect.left) - ((float) ((int) (((((float) itemViewInfo.getWidth()) - width2) / 2.0f) + ((float) itemViewInfo.getX())))));
                int y = (int) ((((float) imageInfo.getY()) + displayRect.top) - ((float) ((int) (((((float) itemViewInfo.getHeight()) - height2) / 2.0f) + ((float) itemViewInfo.getY())))));
                postScale(width, width, displayRect.left, displayRect.top);
                postTranslate((float) (-x), (float) (-y));
                setImageViewMatrix(getDrawMatrix());
                getTransition().scale(width, scale);
                getTransition().translate(0, 0, x, y);
                if (((float) itemViewInfo.getWidth()) < width2 || ((float) itemViewInfo.getHeight()) < height2) {
                    float width3 = ((float) itemViewInfo.getWidth()) / width2;
                    float height3 = ((float) itemViewInfo.getHeight()) / height2;
                    float clamp = MiscUtil.clamp(width3, 0.0f, 1.0f);
                    float clamp2 = MiscUtil.clamp(height3, 0.0f, 1.0f);
                    getTransition().clip(clamp, clamp2, 1.0f - clamp, 1.0f - clamp2);
                }
                this.mEnterInfo = null;
            } else {
                this.mEnterInfo = itemViewInfo;
                this.mTransitionListener = transitionListener;
                this.mWantEnterTime = System.currentTimeMillis();
            }
            getTransition().setTransitionListener(transitionListener);
            if (System.currentTimeMillis() - this.mWantEnterTime < 150) {
                getTransition().ensureAlpha(true);
            }
            getTransition().alpha(this.mAlpha, 1.0f);
            getTransition().start(false);
        } else if (transitionListener != null) {
            transitionListener.onTransitEnd();
        }
    }

    public void animExit(ItemViewInfo itemViewInfo, TransitionListener transitionListener) {
        if (itemViewInfo != null && itemViewInfo.isLocationValid() && getTransition() != null && getImageView() != null) {
            getTransition().stop();
            RectF displayRect = getDisplayRect(getDrawMatrix());
            if (displayRect != null) {
                RectF rectF = new RectF(displayRect);
                ItemViewInfo imageInfo = ItemViewInfo.getImageInfo(getImageView(), 0);
                RectF displayRect2 = getDisplayRect(this.mBaseMatrix);
                float width = ((float) itemViewInfo.getWidth()) / displayRect2.width();
                float height = ((float) itemViewInfo.getHeight()) / displayRect2.height();
                if (width <= height) {
                    width = height;
                }
                float scale = getScale();
                float width2 = displayRect2.width() * width;
                float height2 = displayRect2.height() * width;
                int x = (int) ((((float) imageInfo.getX()) + rectF.left) - ((float) ((int) (((((float) itemViewInfo.getWidth()) - width2) / 2.0f) + ((float) itemViewInfo.getX())))));
                int y = (int) ((((float) imageInfo.getY()) + rectF.top) - ((float) ((int) (((((float) itemViewInfo.getHeight()) - height2) / 2.0f) + ((float) itemViewInfo.getY())))));
                if (((float) itemViewInfo.getWidth()) < width2 || ((float) itemViewInfo.getHeight()) < height2) {
                    getTransition().clip(1.0f, 1.0f, (((float) itemViewInfo.getWidth()) / width2) - 1.0f, MiscUtil.clamp(((float) itemViewInfo.getHeight()) / height2, 0.0f, 1.0f) - 1.0f);
                }
                getTransition().scale(scale, width);
                getTransition().translate(0, 0, -x, -y);
            }
            getTransition().setTransitionListener(transitionListener);
            getTransition().ensureAlpha(false);
            getTransition().alpha(this.mAlpha, 0.0f);
            getTransition().start(true);
        } else if (transitionListener != null) {
            transitionListener.onTransitEnd();
        }
    }

    public boolean beforeDraw(Canvas canvas) {
        drawBackground(canvas);
        if (!getTransition().isRunning()) {
            return !getTransition().isExited();
        }
        if (getTransition().getClipRect() != null) {
            canvas.clipRect(getTransition().getClipRect());
        }
        return true;
    }

    public boolean canRotatable() {
        return this.mRotateEnabled;
    }

    public boolean canZoom() {
        return this.mZoomEnabled;
    }

    public void cleanup() {
        if (this.mImageView != null) {
            ImageView imageView = (ImageView) this.mImageView.get();
            if (imageView != null) {
                ViewTreeObserver viewTreeObserver = imageView.getViewTreeObserver();
                if (viewTreeObserver != null && viewTreeObserver.isAlive()) {
                    viewTreeObserver.removeGlobalOnLayoutListener(this);
                }
                imageView.setOnTouchListener(null);
                cancelFling();
            }
            if (this.mGestureDetector != null) {
                this.mGestureDetector.setOnDoubleTapListener(null);
            }
            this.mMatrixChangeListeners.clear();
            this.mPhotoTapListener = null;
            this.mViewTapListener = null;
            this.mLongClickListener = null;
            this.mScaleChangeListener = null;
            this.mExitListener = null;
            if (getTransition().isRunning()) {
                getTransition().stop();
                getTransition().setTransitionListener(null);
            }
            if (this.mRotateDetector != null && this.mRotateDetector.isRotating()) {
                this.mRotateDetector.stop();
            }
            releaseTile();
            this.mImageView = null;
        }
    }

    public boolean getAbsoluteRect(RectF rectF) {
        return getDrawMatrix().mapRect(rectF);
    }

    public RectF getBaseDisplayRect() {
        RectF displayRect = getDisplayRect(this.mBaseMatrix);
        if (displayRect != null) {
            return new RectF(displayRect);
        }
        return null;
    }

    public Matrix getBaseMatrix() {
        return new Matrix(this.mBaseMatrix);
    }

    public Matrix getDisplayMatrix() {
        return new Matrix(getDrawMatrix());
    }

    public RectF getDisplayRect() {
        checkMatrixBounds();
        RectF displayRect = getDisplayRect(getDrawMatrix());
        if (displayRect != null) {
            return new RectF(displayRect);
        }
        return null;
    }

    public Matrix getDrawMatrix() {
        this.mDrawMatrix.set(this.mBaseMatrix);
        this.mDrawMatrix.postConcat(this.mSuppMatrix);
        return this.mDrawMatrix;
    }

    public RectF getDrawableSize() {
        ImageView imageView = getImageView();
        if (imageView != null && getImageViewHeight(imageView) > 0 && getImageViewWidth(imageView) > 0) {
            Drawable drawable = imageView.getDrawable();
            if (drawable != null) {
                return new RectF(0.0f, 0.0f, (float) drawable.getIntrinsicWidth(), (float) drawable.getIntrinsicHeight());
            }
        }
        return new RectF(0.0f, 0.0f, 0.0f, 0.0f);
    }

    public ImageView getImageView() {
        ImageView imageView = this.mImageView != null ? (ImageView) this.mImageView.get() : null;
        if (imageView == null) {
            cleanup();
            LogManager.getLogger().i("PhotoViewAttacher", "ImageView no longer exists. You should not use this PhotoViewAttacher any more.");
        }
        return imageView;
    }

    public float getMaximumScale() {
        return this.mMaxDoubleTapScale > 0.0f ? this.mMaxDoubleTapScale : this.mMaxScale;
    }

    public float getMediumScale() {
        return this.mMidScale;
    }

    public float getMinimumScale() {
        return this.mMinScale;
    }

    public OnPhotoTapListener getOnPhotoTapListener() {
        return this.mPhotoTapListener;
    }

    public OnViewTapListener getOnViewTapListener() {
        return this.mViewTapListener;
    }

    public float getRotate() {
        return MatrixUtil.getRotate(this.mSuppMatrix) + MatrixUtil.getRotate(this.mBaseMatrix);
    }

    public float getScale() {
        return MatrixUtil.getScale(this.mSuppMatrix);
    }

    public ScaleType getScaleType() {
        return this.mScaleType;
    }

    public Matrix getSuppMatrix() {
        return new Matrix(this.mSuppMatrix);
    }

    public Bitmap getVisibleRectangleBitmap() {
        return null;
    }

    public boolean isGestureOperating() {
        return (this.mScaleDragDetector != null && (this.mScaleDragDetector.isDragging() || this.mScaleDragDetector.isScaling())) || (this.mRotateDetector != null && this.mRotateDetector.isRotating());
    }

    public void onDoubleTap(float f, float f2) {
        if (hasDrawable(getImageView())) {
            float scale = getScale();
            if (scale < getMediumScale() - 0.001f) {
                setScale(getMediumScale(), f, f2, true);
                if (this.mScaleStageChangedListener != null && getMediumScale() < getMaximumScale()) {
                    this.mScaleStageChangedListener.onMidScaleStage(true);
                }
            } else if (scale < getMediumScale() - 0.001f || scale >= getMaximumScale() - 0.001f) {
                setScale(getMinimumScale(), f, f2, true);
            } else {
                setScale(getMaximumScale(), f, f2, true);
                if (this.mScaleStageChangedListener != null) {
                    this.mScaleStageChangedListener.onMaxScaleStage(true);
                }
            }
        }
    }

    public void onDrag(float f, float f2) {
        if (!interceptDrag()) {
            if (getScale() >= this.mMinScale || this.mIsDragDownOut) {
                if (!this.mHasScale && (this.mIsDragDownOut || (this.mVScrollEdge == 5 && Math.abs(f2) > Math.abs(f) && this.mTouchDownY > getImageView().getResources().getDisplayMetrics().density * 25.0f))) {
                    this.mDragDownOutY += f2;
                    if (!this.mIsDragDownOut && this.mDragDownOutY >= this.mDragDownOutThreshold) {
                        this.mIsDragDownOut = true;
                        this.mDragHandled = true;
                    }
                }
                ImageView imageView = getImageView();
                if (this.mIsDragDownOut) {
                    int imageViewWidth = getImageViewWidth(getImageView());
                    int imageViewHeight = getImageViewHeight(getImageView());
                    float value = getValue(this.mSuppMatrix, 5);
                    float f3 = (float) imageViewHeight;
                    float f4 = ((1.0f - (f2 / f3)) * 0.5f) + 0.5f;
                    postScale(f4, f4, (float) (imageViewWidth / 2), (f3 + value) / 2.0f);
                    postTranslate(f / 2.0f, f2);
                    updateAlpha(1.0f - (value / f3));
                } else if (this.mZoomEnabled) {
                    postTranslate(f, f2);
                }
                checkAndDisplayMatrix();
                ViewParent parent = imageView.getParent();
                if (this.mAllowParentInterceptOnEdge) {
                    if (Math.abs(f) > Math.abs(f2)) {
                        if (this.mHScrollEdge == 4 || ((this.mHScrollEdge == 0 && f >= 1.0f) || (this.mHScrollEdge == 1 && f <= -1.0f))) {
                            if (parent != null && !this.mDragHandled) {
                                parent.requestDisallowInterceptTouchEvent(false);
                            }
                            return;
                        }
                    } else if (this.mVScrollEdge == 5 || ((this.mVScrollEdge == 2 && f2 >= 1.0f) || (this.mVScrollEdge == 3 && f2 <= -1.0f))) {
                        if (parent != null && !this.mDragHandled) {
                            parent.requestDisallowInterceptTouchEvent(false);
                        }
                        return;
                    }
                } else if (parent != null) {
                    parent.requestDisallowInterceptTouchEvent(true);
                }
                this.mDragHandled = true;
            }
        }
    }

    public void onFling(float f, float f2, float f3, float f4) {
        if (this.mZoomEnabled && !interceptDrag() && getScale() >= this.mMinScale) {
            ImageView imageView = getImageView();
            this.mCurrentFlingRunnable = new FlingRunnable(imageView.getContext());
            this.mCurrentFlingRunnable.fling(getImageViewWidth(imageView), getImageViewHeight(imageView), (int) f3, (int) f4);
            imageView.post(this.mCurrentFlingRunnable);
        }
    }

    public void onGlobalLayout() {
        ImageView imageView = getImageView();
        if (imageView != null) {
            int top = imageView.getTop();
            int right = imageView.getRight();
            int bottom = imageView.getBottom();
            int left = imageView.getLeft();
            if (top != this.mIvTop || bottom != this.mIvBottom || left != this.mIvLeft || right != this.mIvRight) {
                updateBaseMatrix(imageView.getDrawable(), trimRotation(getRotate()));
                resetMatrix();
                this.mIvTop = top;
                this.mIvRight = right;
                this.mIvBottom = bottom;
                this.mIvLeft = left;
            }
        }
    }

    public void onScale(float f, float f2, float f3) {
        if (this.mZoomEnabled) {
            this.mHasScale = true;
            this.mIsDragDownOut = false;
            float scale = getScale();
            if (scale < getMaxPointsScalingScale() || f < 1.0f) {
                this.mLastScaleFocusX = f2;
                this.mLastScaleFocusY = f3;
                postScale(f, f, f2, f3);
                checkAndDisplayMatrix();
                float scale2 = getScale();
                if (this.mScaleStageChangedListener != null) {
                    if (f < 1.0f) {
                        if (scale2 < this.mMaxDoubleTapScale && scale >= this.mMaxDoubleTapScale) {
                            this.mScaleStageChangedListener.onMaxScaleStage(false);
                        } else if (scale2 < this.mMidScale && scale >= this.mMidScale) {
                            this.mScaleStageChangedListener.onMidScaleStage(false);
                        }
                    } else if (scale2 >= this.mMaxDoubleTapScale) {
                        this.mScaleStageChangedListener.onMaxScaleStage(true);
                    }
                }
            }
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:18:0x0058, code lost:
        r11 = false;
     */
    /* JADX WARNING: Removed duplicated region for block: B:56:0x00f9  */
    /* JADX WARNING: Removed duplicated region for block: B:59:0x010e  */
    @SuppressLint({"ClickableViewAccessibility"})
    public boolean onTouch(View view, MotionEvent motionEvent) {
        boolean z;
        boolean z2 = false;
        if (this.mIntercepted) {
            return false;
        }
        boolean z3 = true;
        if (!interceptTouch()) {
            if (hasDrawable((ImageView) view)) {
                ViewParent parent = view.getParent();
                int actionMasked = motionEvent.getActionMasked();
                if (actionMasked != 3) {
                    switch (actionMasked) {
                        case 0:
                            this.mDownScale = getScale();
                            if (parent != null) {
                                parent.requestDisallowInterceptTouchEvent(true);
                            } else {
                                LogManager.getLogger().i("PhotoViewAttacher", "onTouch getParent() returned null");
                            }
                            this.mTouchDownY = motionEvent.getY();
                            this.mDragHandled = false;
                            this.mHasScale = false;
                            cancelFling();
                            break;
                        case 1:
                            break;
                    }
                }
                if (interceptMotionEnd()) {
                    return true;
                }
                float scale = getScale();
                if (this.mIsDragDownOut) {
                    if (this.mDragDownOutY < this.mDragDownOutThreshold) {
                        updateAlpha(1.0f);
                        resetMatrix();
                    } else if (this.mExitListener != null) {
                        this.mExitListener.onExit();
                    }
                    this.mIsDragDownOut = false;
                    this.mDragDownOutY = 0.0f;
                } else if (this.mZoomEnabled) {
                    if (scale < this.mExitScale && this.mExitListener != null && this.mDownScale <= 1.0f) {
                        this.mExitListener.onExit();
                    } else if (scale < this.mMinScale) {
                        RectF displayRect = getDisplayRect();
                        if (displayRect != null) {
                            AnimatedZoomRunnable animatedZoomRunnable = new AnimatedZoomRunnable(scale, this.mMinScale, displayRect.centerX(), displayRect.centerY());
                            view.post(animatedZoomRunnable);
                            z = true;
                            this.mDragHandled = false;
                            if (canRotatable()) {
                                ensureRotateDetector();
                                z = this.mRotateDetector.onTouchEvent(motionEvent);
                            }
                            z2 = z;
                            ensureScaleDragDetector();
                            if (this.mScaleDragDetector.onTouchEvent(motionEvent)) {
                                z2 = true;
                            }
                        }
                    } else if (scale > getMaxPointsScale() && this.mLastScaleFocusX > 0.0f && this.mLastScaleFocusY > 0.0f) {
                        AnimatedZoomRunnable animatedZoomRunnable2 = new AnimatedZoomRunnable(scale, getMaxPointsScale(), this.mLastScaleFocusX, this.mLastScaleFocusY);
                        view.post(animatedZoomRunnable2);
                        this.mLastScaleFocusX = 0.0f;
                        this.mLastScaleFocusY = 0.0f;
                    }
                }
                z = false;
                this.mDragHandled = false;
                if (canRotatable()) {
                }
                z2 = z;
                ensureScaleDragDetector();
                if (this.mScaleDragDetector.onTouchEvent(motionEvent)) {
                }
            }
            ensureTapDetector();
            if (!this.mGestureDetector.onTouchEvent(motionEvent)) {
                z3 = z2;
            }
        } else if (view.getParent() != null) {
            view.getParent().requestDisallowInterceptTouchEvent(true);
        }
        return z3;
    }

    public void releaseTile() {
        if (this.mTileView != null) {
            this.mTileView.cleanup();
        }
        this.mTileView = null;
    }

    public void removeOnMatrixChangeListener(OnMatrixChangedListener onMatrixChangedListener) {
        if (onMatrixChangedListener != null) {
            this.mMatrixChangeListeners.remove(onMatrixChangedListener);
        }
    }

    public void setAllowParentInterceptOnEdge(boolean z) {
        this.mAllowParentInterceptOnEdge = z;
    }

    public void setAlphaBackground(Drawable drawable) {
        this.mAlphaDrawable = drawable;
        ImageView imageView = getImageView();
        if (imageView != null) {
            imageView.invalidate();
        }
    }

    public void setBackgroundAlpha(float f) {
        updateAlpha(f);
        ImageView imageView = getImageView();
        if (imageView != null) {
            imageView.invalidate();
        }
    }

    public boolean setDisplayMatrix(Matrix matrix) {
        if (matrix != null) {
            ImageView imageView = getImageView();
            if (imageView == null || imageView.getDrawable() == null) {
                return false;
            }
            this.mSuppMatrix.set(matrix);
            setImageViewMatrix(getDrawMatrix());
            checkMatrixBounds();
            return true;
        }
        throw new IllegalArgumentException("Matrix cannot be null");
    }

    public void setHDState(int i, int i2, boolean z) {
        this.mOriginWidth = i;
        this.mOriginHeight = i2;
        this.mSupportHd = z;
    }

    public void setInterceptTouch(boolean z) {
        this.mIntercepted = z;
    }

    public void setMaximumScale(float f) {
        checkZoomLevels(this.mMinScale, this.mMidScale, f);
        this.mMaxScale = f;
    }

    public void setMediumScale(float f) {
        checkZoomLevels(this.mMinScale, f, this.mMaxScale);
        this.mMidScale = f;
    }

    public void setMinimumScale(float f) {
        checkZoomLevels(f, this.mMidScale, this.mMaxScale);
        this.mMinScale = f;
        this.mExitScale = this.mMinScale * 0.8f;
    }

    public void setOnBackgroundAlphaChangedListener(OnBackgroundAlphaChangedListener onBackgroundAlphaChangedListener) {
        this.mAlphaChangedListener = onBackgroundAlphaChangedListener;
    }

    public void setOnDoubleTapListener(OnDoubleTapListener onDoubleTapListener) {
        ensureTapDetector();
        if (onDoubleTapListener != null) {
            this.mGestureDetector.setOnDoubleTapListener(onDoubleTapListener);
        } else {
            this.mGestureDetector.setOnDoubleTapListener(new DefaultOnDoubleTapListener(this));
        }
    }

    public void setOnExitListener(OnExitListener onExitListener) {
        this.mExitListener = onExitListener;
    }

    public void setOnLongClickListener(OnLongClickListener onLongClickListener) {
        this.mLongClickListener = onLongClickListener;
    }

    public void setOnPhotoTapListener(OnPhotoTapListener onPhotoTapListener) {
        this.mPhotoTapListener = onPhotoTapListener;
    }

    public void setOnRotateListener(OnRotateListener onRotateListener) {
        this.mRotateListener = onRotateListener;
    }

    public void setOnScaleChangeListener(OnScaleChangeListener onScaleChangeListener) {
        this.mScaleChangeListener = onScaleChangeListener;
    }

    public void setOnScaleStageChangedListener(OnScaleStageChangedListener onScaleStageChangedListener) {
        this.mScaleStageChangedListener = onScaleStageChangedListener;
    }

    public void setOnViewTapListener(OnViewTapListener onViewTapListener) {
        this.mViewTapListener = onViewTapListener;
    }

    public void setRegionDecodeEnable(boolean z) {
        if (this.mIsRegionDecodeEnable != z) {
            this.mIsRegionDecodeEnable = z;
            if (z) {
                notifyTileViewInvalidate();
            } else if (getImageView() != null) {
                getImageView().invalidate();
            }
        }
    }

    public void setRotatable(boolean z) {
        this.mRotateEnabled = z;
        if (!this.mRotateEnabled) {
            update(false);
        }
    }

    public void setRotationBy(float f) {
        postRotate(f % 360.0f, 0.0f, 0.0f);
        checkAndDisplayMatrix();
    }

    public void setRotationTo(float f) {
        setRotate(f % 360.0f, 0.0f, 0.0f);
        checkAndDisplayMatrix();
    }

    public void setScale(float f) {
        setScale(f, false);
    }

    public void setScale(float f, float f2, float f3, boolean z) {
        ImageView imageView = getImageView();
        if (imageView != null) {
            if (f < this.mMinScale || f > getMaximumScale()) {
                LogManager.getLogger().i("PhotoViewAttacher", "Scale must be within the range of minScale and maxScale");
            } else if (z) {
                AnimatedZoomRunnable animatedZoomRunnable = new AnimatedZoomRunnable(getScale(), f, f2, f3);
                imageView.post(animatedZoomRunnable);
            } else {
                setScale(f, f, f2, f3);
                checkAndDisplayMatrix();
            }
        }
    }

    public void setScale(float f, boolean z) {
        ImageView imageView = getImageView();
        if (imageView != null) {
            setScale(f, (float) (imageView.getRight() / 2), (float) (imageView.getBottom() / 2), z);
        }
    }

    public void setScaleType(ScaleType scaleType) {
        if (isSupportedScaleType(scaleType) && scaleType != this.mScaleType) {
            this.mScaleType = scaleType;
            update(true);
        }
    }

    public void setStroke(int i, int i2) {
        if (this.mStrokeColor != i || this.mStrokeWidth != i2) {
            this.mStrokeColor = i;
            this.mStrokeWidth = i2;
            if (i2 > 0) {
                ensureStrokePaint();
                this.mStrokePaint.setColor(this.mStrokeColor);
                this.mStrokePaint.setStrokeWidth((float) this.mStrokeWidth);
            }
            ImageView imageView = getImageView();
            if (imageView != null) {
                imageView.invalidate();
            }
        }
    }

    public void setZoomTransitionDuration(int i) {
        if (i < 0) {
            i = 200;
        }
        this.ZOOM_DURATION = i;
    }

    public void setZoomable(boolean z) {
        this.mZoomEnabled = z;
        ImageView imageView = getImageView();
        if (imageView != null && imageView.getDrawable() != null) {
            update(true);
        }
    }

    public void setupTile(TileBitProvider tileBitProvider, BitmapRecycleCallback bitmapRecycleCallback, TrimMemoryCallback trimMemoryCallback) {
        if (this.mTileView == null) {
            this.mTileView = new TileView(tileBitProvider, getImageView(), bitmapRecycleCallback, trimMemoryCallback);
        }
        this.mTileView.setViewPort(new Rect(0, 0, getImageViewWidth(getImageView()), getImageViewHeight(getImageView())));
        calculateScales();
        notifyTileViewInvalidate();
    }

    public void update(boolean z) {
        ImageView imageView = getImageView();
        if (imageView != null) {
            if (this.mZoomEnabled) {
                setImageViewScaleTypeMatrix(imageView);
            }
            updateBaseMatrix(imageView.getDrawable(), z ? trimRotation(getRotate()) : 0);
            if (!this.mZoomEnabled || !z) {
                resetMatrix();
            } else {
                setImageViewMatrix(getDrawMatrix());
            }
        }
    }
}
