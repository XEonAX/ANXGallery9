package com.miui.gallery.editor.photo.core.imports.sticker;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Matrix.ScaleToFit;
import android.graphics.PointF;
import android.graphics.RectF;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.view.MotionEvent;
import android.view.ScaleGestureDetector;
import com.miui.gallery.R;
import com.miui.gallery.editor.photo.utils.Bitmaps;
import com.miui.gallery.editor.photo.widgets.imageview.BitmapGestureView;
import java.util.ArrayList;
import java.util.List;

public class StickerEditorView extends BitmapGestureView {
    private Matrix mBitmapToCanvas = new Matrix();
    /* access modifiers changed from: private */
    public Cache mCache;
    private Matrix mCanvasToBitmap = new Matrix();
    private float mInitialSize;
    private float[] mMatrixValue = new float[9];
    /* access modifiers changed from: private */
    public float mMaxRadius;
    /* access modifiers changed from: private */
    public float mMinRadius;
    /* access modifiers changed from: private */
    public Mutator mMutator;
    /* access modifiers changed from: private */
    public PointF mPrePoint = new PointF();
    /* access modifiers changed from: private */
    public RectF mRectTemp = new RectF();
    /* access modifiers changed from: private */
    public PointF mReusePoint = new PointF();
    /* access modifiers changed from: private */
    public State mState = State.IDLE;

    private class CustomGestureListener implements FeatureGesListener {
        private float mDownX;
        private float mDownY;
        private float mFirstSpan;
        private float[] mPoint;
        private float mPreScale;

        private CustomGestureListener() {
            this.mPoint = new float[2];
        }

        private void bindItem(int i) {
            StickerEditorView.this.mState = State.PENDING;
            StickerNode remove = StickerEditorView.this.mCache.remove(i);
            StickerEditorView.this.mCache.append(StickerEditorView.this.mMutator.unbind());
            StickerEditorView.this.mMutator.bind(remove);
            StickerEditorView.this.enableChildHandleMode();
            StickerEditorView.this.invalidate();
        }

        private void moveItem(MotionEvent motionEvent, MotionEvent motionEvent2, float f, float f2) {
            StickerEditorView.this.mRectTemp.set(StickerEditorView.this.mMutator.getDrawBounds());
            int access$1300 = StickerEditorView.this.getRectOverScrollStatus(StickerEditorView.this.mRectTemp);
            float f3 = 0.0f;
            if ((access$1300 & 8) == 0 ? !((access$1300 & 4) == 0 || f >= 0.0f) : f > 0.0f) {
                f = 0.0f;
            }
            if ((access$1300 & 2) == 0 ? (access$1300 & 1) == 0 || f2 >= 0.0f : f2 <= 0.0f) {
                f3 = f2;
            }
            PointF access$800 = StickerEditorView.this.mReusePoint;
            access$800.set(-f, -f3);
            StickerEditorView.this.resetTransByBounds(access$800);
            StickerEditorView.this.mMutator.translate(access$800.x, access$800.y);
            StickerEditorView.this.mPrePoint.set(motionEvent2.getX(), motionEvent2.getY());
            StickerEditorView.this.invalidate();
        }

        public void onActionUp(float f, float f2) {
            StickerEditorView.this.mState = State.IDLE;
            StickerEditorView.this.invalidate();
        }

        public boolean onDown(MotionEvent motionEvent) {
            this.mDownX = motionEvent.getX();
            this.mDownY = motionEvent.getY();
            StickerEditorView.this.convertPointToViewPortCoordinate(motionEvent, this.mPoint);
            if (StickerEditorView.this.mMutator.isIdle()) {
                StickerEditorView.this.mState = State.IDLE;
            } else if (StickerEditorView.this.mMutator.isScale(this.mDownX, this.mDownY)) {
                StickerEditorView.this.mState = State.SCALE;
            } else if (StickerEditorView.this.mMutator.isDelete(this.mDownX, this.mDownY)) {
                StickerEditorView.this.mState = State.DELETE;
            } else if (StickerEditorView.this.mMutator.isMirror(this.mDownX, this.mDownY)) {
                StickerEditorView.this.mState = State.MIRROR;
            } else if (StickerEditorView.this.mMutator.contains(this.mDownX, this.mDownY)) {
                StickerEditorView.this.mPrePoint.set(this.mDownX, this.mDownY);
                StickerEditorView.this.mState = State.PENDING;
            } else {
                StickerEditorView.this.mState = State.IDLE;
            }
            StickerEditorView.this.invalidate();
            return true;
        }

        public boolean onScale(ScaleGestureDetector scaleGestureDetector) {
            float currentSpan = (scaleGestureDetector.getCurrentSpan() / this.mFirstSpan) / this.mPreScale;
            this.mPreScale *= currentSpan;
            if (!StickerEditorView.this.mMutator.isIdle()) {
                float radius = StickerEditorView.this.mMutator.getRadius();
                float access$900 = StickerEditorView.this.getCurrentCanvasScale();
                float access$1000 = StickerEditorView.this.mMinRadius * access$900;
                float access$1100 = StickerEditorView.this.mMaxRadius * access$900;
                if (currentSpan <= 1.0f && radius < access$1000) {
                    return false;
                }
                if (currentSpan > 1.0f && radius > access$1100) {
                    return false;
                }
                StickerEditorView.this.mMutator.scale(currentSpan);
                StickerEditorView.this.mState = State.MOVE;
                StickerEditorView.this.invalidate();
            }
            return false;
        }

        public boolean onScaleBegin(ScaleGestureDetector scaleGestureDetector) {
            this.mFirstSpan = scaleGestureDetector.getCurrentSpan();
            this.mPreScale = 1.0f;
            return false;
        }

        public void onScaleEnd(ScaleGestureDetector scaleGestureDetector) {
        }

        public void onScroll(MotionEvent motionEvent, MotionEvent motionEvent2, float f, float f2) {
            float x = motionEvent2.getX();
            float y = motionEvent2.getY();
            if (StickerEditorView.this.mState == State.IDLE && !StickerEditorView.this.mMutator.isIdle()) {
                int find = StickerEditorView.this.mCache.find(motionEvent.getX(), motionEvent.getY());
                if (find != -1) {
                    bindItem(find);
                }
                StickerEditorView.this.mState = State.MOVE;
            } else if (StickerEditorView.this.mState == State.MOVE) {
                moveItem(motionEvent, motionEvent2, f, f2);
            } else if (StickerEditorView.this.mState == State.PENDING) {
                StickerEditorView.this.mState = State.MOVE;
            } else if (StickerEditorView.this.mState == State.SCALE) {
                PointF access$800 = StickerEditorView.this.mReusePoint;
                access$800.set(StickerEditorView.this.mMutator.getVertex(3)[0], StickerEditorView.this.mMutator.getVertex(3)[1]);
                float centerX = (float) StickerEditorView.this.mMutator.getDrawBounds().centerX();
                float centerY = (float) StickerEditorView.this.mMutator.getDrawBounds().centerY();
                float f3 = x - centerX;
                float f4 = y - centerY;
                double hypot = Math.hypot((double) f3, (double) f4);
                double hypot2 = Math.hypot((double) (access$800.x - centerX), (double) (access$800.y - centerY));
                float access$900 = StickerEditorView.this.getCurrentCanvasScale();
                float access$1100 = StickerEditorView.this.mMaxRadius * access$900;
                double access$1000 = (double) (StickerEditorView.this.mMinRadius * access$900);
                if (hypot < access$1000) {
                    Double.isNaN(access$1000);
                    float f5 = (float) (access$1000 / hypot);
                    y = (f4 * f5) + centerY;
                    x = (f3 * f5) + centerX;
                } else {
                    access$1000 = hypot;
                }
                double d = (double) access$1100;
                if (access$1000 > d) {
                    Double.isNaN(d);
                    float f6 = (float) (d / access$1000);
                    x = ((x - centerX) * f6) + centerX;
                    y = ((y - centerY) * f6) + centerY;
                    access$1000 = d;
                }
                StickerEditorView.this.mMutator.scale((float) (access$1000 / hypot2));
                access$800.set(StickerEditorView.this.mMutator.getVertex(3)[0], StickerEditorView.this.mMutator.getVertex(3)[1]);
                double hypot3 = Math.hypot((double) (x - access$800.x), (double) (y - access$800.y));
                double d2 = (((access$1000 * access$1000) * 2.0d) - (hypot3 * hypot3)) / ((2.0d * access$1000) * access$1000);
                double d3 = (double) (x - centerX);
                double d4 = (double) (access$800.x - centerX);
                double d5 = (double) (access$800.y - centerY);
                Double.isNaN(d4);
                double d6 = d4 * d2;
                Double.isNaN(d3);
                double d7 = d6 - d3;
                Double.isNaN(d5);
                StickerEditorView.this.mMutator.rotate((float) (d7 / d5), (float) d2);
                StickerEditorView.this.invalidate();
            } else if (StickerEditorView.this.mMutator.isIdle()) {
                int find2 = StickerEditorView.this.mCache.find(motionEvent.getX(), motionEvent.getY());
                if (find2 != -1) {
                    bindItem(find2);
                }
                StickerEditorView.this.invalidate();
            }
        }

        public void onSingleTapUp(MotionEvent motionEvent) {
            if (!StickerEditorView.this.mMutator.isIdle() && StickerEditorView.this.mState == State.IDLE) {
                int find = StickerEditorView.this.mCache.find(motionEvent.getX(), motionEvent.getY());
                if (find == -1) {
                    StickerEditorView.this.mCache.append(StickerEditorView.this.mMutator.unbind());
                    StickerEditorView.this.disableChildHandleMode();
                    StickerEditorView.this.invalidate();
                } else {
                    bindItem(find);
                }
            } else if (StickerEditorView.this.mState == State.MIRROR && StickerEditorView.this.mMutator.isMirror(motionEvent.getX(), motionEvent.getY())) {
                StickerEditorView.this.mMutator.mirror();
                StickerEditorView.this.mState = State.IDLE;
                StickerEditorView.this.invalidate();
            } else if (StickerEditorView.this.mState != State.DELETE || !StickerEditorView.this.mMutator.isDelete(motionEvent.getX(), motionEvent.getY())) {
                int find2 = StickerEditorView.this.mCache.find(motionEvent.getX(), motionEvent.getY());
                if (find2 != -1) {
                    bindItem(find2);
                }
            } else {
                StickerEditorView.this.mMutator.unbind();
                StickerEditorView.this.disableChildHandleMode();
                StickerEditorView.this.mState = State.IDLE;
                StickerEditorView.this.invalidate();
            }
        }
    }

    private enum State {
        IDLE,
        PENDING,
        MOVE,
        MIRROR,
        SCALE,
        DELETE
    }

    public static class StickerEntry implements Parcelable {
        public static final Creator<StickerEntry> CREATOR = new Creator<StickerEntry>() {
            public StickerEntry createFromParcel(Parcel parcel) {
                return new StickerEntry(parcel);
            }

            public StickerEntry[] newArray(int i) {
                return new StickerEntry[i];
            }
        };
        private List<StickerNode> mItems;
        private RectF mPreviewBounds;

        StickerEntry(RectF rectF, List<StickerNode> list) {
            this.mPreviewBounds = new RectF(rectF);
            this.mItems = list;
        }

        protected StickerEntry(Parcel parcel) {
            this.mPreviewBounds = (RectF) parcel.readParcelable(RectF.class.getClassLoader());
            this.mItems = new ArrayList();
            parcel.readList(this.mItems, StickerNode.class.getClassLoader());
        }

        public Bitmap apply(Bitmap bitmap) {
            if (!bitmap.isMutable()) {
                bitmap = Bitmaps.copyBitmap(bitmap);
            }
            if (bitmap == null) {
                return null;
            }
            RectF rectF = new RectF(0.0f, 0.0f, (float) bitmap.getWidth(), (float) bitmap.getHeight());
            Matrix matrix = new Matrix();
            matrix.setRectToRect(this.mPreviewBounds, rectF, ScaleToFit.FILL);
            Canvas canvas = new Canvas(bitmap);
            canvas.concat(matrix);
            for (StickerNode draw : this.mItems) {
                draw.draw(canvas);
            }
            return bitmap;
        }

        public int describeContents() {
            return 0;
        }

        public void writeToParcel(Parcel parcel, int i) {
            parcel.writeParcelable(this.mPreviewBounds, i);
            parcel.writeList(this.mItems);
        }
    }

    public StickerEditorView(Context context) {
        super(context);
        init();
    }

    /* access modifiers changed from: private */
    public float getCurrentCanvasScale() {
        this.mBitmapGestureParamsHolder.mCanvasMatrix.getValues(this.mMatrixValue);
        return this.mMatrixValue[0];
    }

    private void init() {
        setFeatureGestureListener(new CustomGestureListener());
    }

    private void refreshMatrix() {
        this.mBitmapToCanvas.reset();
        this.mBitmapToCanvas.set(this.mBitmapGestureParamsHolder.mBitmapToDisplayMatrix);
        this.mBitmapToCanvas.postConcat(this.mBitmapGestureParamsHolder.mCanvasMatrix);
        this.mBitmapToCanvas.invert(this.mCanvasToBitmap);
    }

    /* access modifiers changed from: private */
    public void resetTransByBounds(PointF pointF) {
        RectF rectF = this.mBitmapGestureParamsHolder.mDisplayRect;
        if (pointF.x > 0.0f && (pointF.x + ((float) this.mMutator.getDrawBounds().right)) - (((float) this.mMutator.getDrawBounds().width()) * 0.8f) > rectF.right) {
            pointF.x = (rectF.right - ((float) this.mMutator.getDrawBounds().right)) + (((float) this.mMutator.getDrawBounds().width()) * 0.8f);
        }
        if (pointF.x < 0.0f && pointF.x + ((float) this.mMutator.getDrawBounds().left) + (((float) this.mMutator.getDrawBounds().width()) * 0.8f) < rectF.left) {
            pointF.x = (rectF.left - ((float) this.mMutator.getDrawBounds().left)) - (((float) this.mMutator.getDrawBounds().width()) * 0.8f);
        }
        if (pointF.y > 0.0f && (pointF.y + ((float) this.mMutator.getDrawBounds().bottom)) - (((float) this.mMutator.getDrawBounds().height()) * 0.8f) > rectF.bottom) {
            pointF.y = (rectF.bottom - ((float) this.mMutator.getDrawBounds().bottom)) + (((float) this.mMutator.getDrawBounds().height()) * 0.8f);
        }
        if (pointF.y < 0.0f && pointF.y + ((float) this.mMutator.getDrawBounds().top) + (((float) this.mMutator.getDrawBounds().height()) * 0.8f) < rectF.top) {
            pointF.y = (rectF.top - ((float) this.mMutator.getDrawBounds().top)) - (((float) this.mMutator.getDrawBounds().height()) * 0.8f);
        }
    }

    public void add(Bitmap bitmap, String str, long j, String str2) {
        if (this.mMutator != null) {
            StickerNode stickerNode = new StickerNode(bitmap, str, j, str2);
            if (!this.mMutator.isIdle()) {
                this.mCache.append(this.mMutator.unbind());
            }
            stickerNode.init(this.mBitmapGestureParamsHolder.mCanvasMatrixInvert, this.mDisplayBitmap);
            this.mMutator.bind(stickerNode);
            float currentCanvasScale = this.mMinRadius * getCurrentCanvasScale();
            float radius = this.mMutator.getRadius();
            float f = currentCanvasScale / radius;
            this.mMutator.translate((-this.mMutator.getBorderBounds().width()) / 2.0f, (-this.mMutator.getBorderBounds().height()) / 2.0f);
            if (radius < currentCanvasScale) {
                this.mMutator.scale(f);
            }
            if (this.mCache.isEmpty()) {
                this.mMutator.translate(this.mBitmapGestureParamsHolder.mBitmapDisplayInsideRect.centerX() - this.mBitmapGestureParamsHolder.mBitmapDisplayRect.left, this.mBitmapGestureParamsHolder.mBitmapDisplayInsideRect.centerY() - this.mBitmapGestureParamsHolder.mBitmapDisplayRect.top);
            } else {
                float f2 = this.mBitmapGestureParamsHolder.mBitmapDisplayInsideRect.left - this.mBitmapGestureParamsHolder.mBitmapDisplayRect.left;
                float f3 = this.mBitmapGestureParamsHolder.mBitmapDisplayInsideRect.top - this.mBitmapGestureParamsHolder.mBitmapDisplayRect.top;
                float width = this.mBitmapGestureParamsHolder.mBitmapDisplayInsideRect.width();
                float height = this.mBitmapGestureParamsHolder.mBitmapDisplayInsideRect.height();
                double random = Math.random();
                double d = (double) width;
                Double.isNaN(d);
                float f4 = (float) (random * d);
                double random2 = Math.random();
                double d2 = (double) height;
                Double.isNaN(d2);
                this.mMutator.translate(f2 + f4, f3 + ((float) (random2 * d2)));
            }
            enableChildHandleMode();
            invalidate();
        }
    }

    /* access modifiers changed from: protected */
    public void drawChild(Canvas canvas) {
        if (this.mCache != null && this.mMutator != null) {
            canvas.save();
            canvas.clipRect(this.mBitmapGestureParamsHolder.mBitmapDisplayRect);
            this.mCache.draw(canvas);
            this.mMutator.draw(canvas, this.mState == State.MOVE || this.mState == State.SCALE);
            canvas.restore();
        }
    }

    public StickerEntry export() {
        return new StickerEntry(this.mBitmapGestureParamsHolder.mBitmapRect, getCacheNode());
    }

    public List<StickerNode> getCacheNode() {
        if (!this.mMutator.isIdle()) {
            this.mCache.append(this.mMutator.unbind());
        }
        return this.mCache.getNodes();
    }

    /* access modifiers changed from: protected */
    public void onBitmapMatrixChanged() {
        refreshMatrix();
        onStart();
    }

    /* access modifiers changed from: protected */
    public void onCanvasMatrixChange() {
        if (this.mMutator != null && !this.mMutator.isIdle()) {
            this.mMutator.updateDisplayInfo();
        }
        refreshMatrix();
    }

    public void onDestroy() {
        if (this.mMutator != null && !this.mMutator.isIdle()) {
            this.mCache.append(this.mMutator.unbind());
        }
        this.mMutator = null;
        this.mCache = null;
        this.mState = State.IDLE;
    }

    /* access modifiers changed from: protected */
    public void onStart() {
        this.mInitialSize = this.mBitmapToCanvas.mapRadius((float) getContext().getResources().getDimensionPixelSize(R.dimen.sticker_initial_size));
        this.mMinRadius = (float) getContext().getResources().getDimensionPixelSize(R.dimen.sticker_min_radius);
        this.mMaxRadius = (float) getContext().getResources().getDimensionPixelSize(R.dimen.sticker_max_radius);
        this.mMutator = new Mutator(getContext(), this.mBitmapToCanvas, this.mCanvasToBitmap);
        this.mCache = new Cache(this.mDisplayBitmap, this.mCanvasToBitmap, this.mBitmapToCanvas);
    }
}
