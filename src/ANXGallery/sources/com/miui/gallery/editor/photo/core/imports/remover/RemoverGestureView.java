package com.miui.gallery.editor.photo.core.imports.remover;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.Canvas;
import android.graphics.Matrix.ScaleToFit;
import android.graphics.Paint;
import android.graphics.Paint.Cap;
import android.graphics.Paint.Join;
import android.graphics.Paint.Style;
import android.graphics.Path;
import android.graphics.PointF;
import android.graphics.Rect;
import android.graphics.RectF;
import android.os.AsyncTask;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.ScaleGestureDetector;
import android.widget.Toast;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.R;
import com.miui.gallery.editor.photo.app.remover.Inpaint;
import com.miui.gallery.editor.photo.utils.parcelable.ParcelablePathUtils;
import com.miui.gallery.editor.photo.widgets.imageview.BitmapGestureView;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.lang.ref.WeakReference;
import java.nio.channels.FileChannel;
import java.nio.channels.FileChannel.MapMode;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class RemoverGestureView extends BitmapGestureView {
    /* access modifiers changed from: private */
    public Context mContext;
    /* access modifiers changed from: private */
    public Paint mCurvePaint;
    /* access modifiers changed from: private */
    public List<Curve> mCurves;
    /* access modifiers changed from: private */
    public ElementType mElementType;
    private GesListener mGesListener;
    private boolean mHasRawYuv;
    /* access modifiers changed from: private */
    public boolean mIsProcessing;
    /* access modifiers changed from: private */
    public Bitmap mMaskBitmap;
    /* access modifiers changed from: private */
    public RemoverCallback mRemoverCallback;
    /* access modifiers changed from: private */
    public RemoverPaintData mRemoverPaintData;
    private int mRenderRecordIndex;

    public static abstract class Curve implements Parcelable {
        protected Paint mPaint;
        private float mStrokeWidth;

        static abstract class Builder<T extends Curve> {
            T mDraft;

            Builder() {
            }

            /* access modifiers changed from: 0000 */
            public Curve done() {
                T t = this.mDraft;
                this.mDraft = null;
                return t;
            }

            /* access modifiers changed from: 0000 */
            public void draw(Canvas canvas) {
                this.mDraft.draw(canvas);
            }

            /* access modifiers changed from: 0000 */
            public final void handleDown(float f, float f2) {
                onDown(f, f2);
            }

            /* access modifiers changed from: 0000 */
            public final void handleMove(float f, float f2) {
                onMove(f, f2);
            }

            /* access modifiers changed from: 0000 */
            public final void handleUp(float f, float f2) {
                onUp(f, f2);
            }

            /* access modifiers changed from: 0000 */
            public final void initDraft(Paint paint) {
                this.mDraft = onCreateDraft(paint);
            }

            /* access modifiers changed from: 0000 */
            public abstract T onCreateDraft(Paint paint);

            /* access modifiers changed from: 0000 */
            public abstract void onDown(float f, float f2);

            /* access modifiers changed from: 0000 */
            public abstract void onMove(float f, float f2);

            /* access modifiers changed from: 0000 */
            public abstract void onUp(float f, float f2);
        }

        Curve(Paint paint) {
            this.mPaint = paint;
            this.mStrokeWidth = paint.getStrokeWidth();
        }

        protected Curve(Parcel parcel) {
            this.mStrokeWidth = parcel.readFloat();
            this.mPaint = RemoverGestureView.initCurvePaint(GalleryApp.sGetAndroidContext());
            this.mPaint.setStrokeWidth(this.mStrokeWidth);
        }

        /* access modifiers changed from: 0000 */
        public final void computeBounds(RectF rectF) {
            onComputeBounds(rectF);
            rectF.inset(-this.mPaint.getStrokeWidth(), -this.mPaint.getStrokeWidth());
        }

        public int describeContents() {
            return 0;
        }

        /* access modifiers changed from: 0000 */
        public final void draw(Canvas canvas) {
            onDraw(canvas, this.mPaint);
        }

        /* access modifiers changed from: 0000 */
        public abstract boolean isEmpty(RectF rectF);

        /* access modifiers changed from: 0000 */
        public abstract void onComputeBounds(RectF rectF);

        /* access modifiers changed from: 0000 */
        public abstract void onDraw(Canvas canvas, Paint paint);

        public void writeToParcel(Parcel parcel, int i) {
            parcel.writeFloat(this.mStrokeWidth);
        }
    }

    public enum ElementType {
        FREE(new Builder()),
        LINE(new Builder()),
        POINT(new Builder());
        
        /* access modifiers changed from: private */
        public Builder<?> mBuilder;

        private ElementType(Builder<?> builder) {
            this.mBuilder = builder;
        }

        /* access modifiers changed from: 0000 */
        public boolean activated() {
            return this.mBuilder.mDraft != null;
        }
    }

    private static class Free extends Curve {
        public static final Creator<Free> CREATOR = new Creator<Free>() {
            public Free createFromParcel(Parcel parcel) {
                return new Free(parcel);
            }

            public Free[] newArray(int i) {
                return new Free[i];
            }
        };
        /* access modifiers changed from: private */
        public Path mPath;
        /* access modifiers changed from: private */
        public List<PointF> mPointFList;

        static class Builder extends Builder<Free> {
            private PointF mLastPoint = new PointF();

            Builder() {
            }

            /* access modifiers changed from: 0000 */
            public Free onCreateDraft(Paint paint) {
                return new Free(new Paint(paint));
            }

            /* access modifiers changed from: 0000 */
            public void onDown(float f, float f2) {
                ((Free) this.mDraft).mPath.moveTo(f, f2);
                this.mLastPoint.set(f, f2);
                ((Free) this.mDraft).mPointFList.clear();
                ((Free) this.mDraft).mPointFList.add(new PointF(f, f2));
            }

            /* access modifiers changed from: 0000 */
            public void onMove(float f, float f2) {
                ((Free) this.mDraft).mPath.quadTo(this.mLastPoint.x, this.mLastPoint.y, (this.mLastPoint.x + f) / 2.0f, (this.mLastPoint.y + f2) / 2.0f);
                this.mLastPoint.set(f, f2);
                ((Free) this.mDraft).mPointFList.add(new PointF(f, f2));
            }

            /* access modifiers changed from: 0000 */
            public void onUp(float f, float f2) {
            }
        }

        Free(Paint paint) {
            super(paint);
            this.mPath = new Path();
            this.mPointFList = new ArrayList();
        }

        protected Free(Parcel parcel) {
            super(parcel);
            this.mPointFList = parcel.createTypedArrayList(PointF.CREATOR);
            this.mPath = ParcelablePathUtils.getPathFromPointList(this.mPointFList);
        }

        public int describeContents() {
            return 0;
        }

        /* access modifiers changed from: 0000 */
        public boolean isEmpty(RectF rectF) {
            RectF rectF2 = new RectF();
            onComputeBounds(rectF2);
            return rectF2.isEmpty();
        }

        /* access modifiers changed from: 0000 */
        public void onComputeBounds(RectF rectF) {
            this.mPath.computeBounds(rectF, true);
        }

        /* access modifiers changed from: 0000 */
        public void onDraw(Canvas canvas, Paint paint) {
            canvas.drawPath(this.mPath, paint);
        }

        public void writeToParcel(Parcel parcel, int i) {
            super.writeToParcel(parcel, i);
            parcel.writeTypedList(this.mPointFList);
        }
    }

    private class GesListener implements FeatureGesListener {
        private ElementType mPreType;

        private GesListener() {
        }

        public void onActionUp(float f, float f2) {
            if (RemoverGestureView.this.mState != State.BY_CHILD) {
                RemoverGestureView.this.mElementType.mBuilder.done();
            } else if (RemoverGestureView.this.mElementType.mBuilder.mDraft != null) {
                RemoverGestureView.this.mElementType.mBuilder.handleUp(f, f2);
                if (RemoverGestureView.this.mCurves == null) {
                    RemoverGestureView.this.mCurves = new ArrayList();
                }
                RemoverGestureView.this.mCurves.add(RemoverGestureView.this.mElementType.mBuilder.done());
                if (RemoverGestureView.this.mElementType == ElementType.POINT && this.mPreType != null) {
                    RemoverGestureView.this.mElementType = this.mPreType;
                    RemoverGestureView.this.mElementType.mBuilder.done();
                }
                RemoverGestureView.this.doRemove();
                RemoverGestureView.this.invalidate();
            }
        }

        public boolean onDown(MotionEvent motionEvent) {
            this.mPreType = null;
            if (RemoverGestureView.this.mIsProcessing) {
                return false;
            }
            float x = motionEvent.getX();
            float y = motionEvent.getY();
            RemoverGestureView.this.mElementType.mBuilder.initDraft(RemoverGestureView.this.mCurvePaint);
            RemoverGestureView.this.mElementType.mBuilder.handleDown(x, y);
            return true;
        }

        public boolean onScale(ScaleGestureDetector scaleGestureDetector) {
            return false;
        }

        public boolean onScaleBegin(ScaleGestureDetector scaleGestureDetector) {
            return false;
        }

        public void onScaleEnd(ScaleGestureDetector scaleGestureDetector) {
        }

        public void onScroll(MotionEvent motionEvent, MotionEvent motionEvent2, float f, float f2) {
            if (!RemoverGestureView.this.mIsProcessing && RemoverGestureView.this.mElementType.mBuilder.mDraft != null) {
                float x = motionEvent2.getX();
                float y = motionEvent2.getY();
                if (RemoverGestureView.this.mBitmapGestureParamsHolder.mBitmapDisplayRect.contains(x, y)) {
                    RemoverGestureView.this.mElementType.mBuilder.handleMove(x, y);
                    RemoverGestureView.this.invalidate();
                }
            }
        }

        public void onSingleTapUp(MotionEvent motionEvent) {
            if (!RemoverGestureView.this.mIsProcessing) {
                float x = motionEvent.getX();
                float y = motionEvent.getY();
                if (RemoverGestureView.this.mBitmapGestureParamsHolder.mBitmapDisplayRect.contains(x, y)) {
                    this.mPreType = RemoverGestureView.this.mElementType;
                    RemoverGestureView.this.mElementType = ElementType.POINT;
                    RemoverGestureView.this.mElementType.mBuilder.initDraft(RemoverGestureView.this.mCurvePaint);
                    RemoverGestureView.this.mElementType.mBuilder.handleDown(x, y);
                    RemoverGestureView.this.invalidate();
                }
            }
        }
    }

    private static class Point extends Curve {
        public static final Creator<Point> CREATOR = new Creator<Point>() {
            public Point createFromParcel(Parcel parcel) {
                return new Point(parcel);
            }

            public Point[] newArray(int i) {
                return new Point[i];
            }
        };
        /* access modifiers changed from: private */
        public PointF mPointF = new PointF();
        private Paint mPointPaint;

        private static class Builder extends Builder<Point> {
            private Builder() {
            }

            /* access modifiers changed from: 0000 */
            public Point onCreateDraft(Paint paint) {
                return new Point(paint);
            }

            /* access modifiers changed from: 0000 */
            public void onDown(float f, float f2) {
                ((Point) this.mDraft).mPointF.x = f;
                ((Point) this.mDraft).mPointF.y = f2;
            }

            /* access modifiers changed from: 0000 */
            public void onMove(float f, float f2) {
            }

            /* access modifiers changed from: 0000 */
            public void onUp(float f, float f2) {
            }
        }

        Point(Paint paint) {
            super(paint);
            this.mPointPaint = new Paint(paint);
            this.mPointPaint.setStyle(Style.FILL);
        }

        protected Point(Parcel parcel) {
            super(parcel);
            this.mPointF = (PointF) parcel.readParcelable(PointF.class.getClassLoader());
            this.mPointPaint = new Paint(this.mPaint);
            this.mPointPaint.setStyle(Style.FILL);
        }

        public int describeContents() {
            return 0;
        }

        /* access modifiers changed from: 0000 */
        public boolean isEmpty(RectF rectF) {
            return !rectF.contains(this.mPointF.x, this.mPointF.y);
        }

        /* access modifiers changed from: 0000 */
        public void onComputeBounds(RectF rectF) {
            rectF.set(this.mPointF.x, this.mPointF.y, this.mPointF.x, this.mPointF.y);
        }

        /* access modifiers changed from: 0000 */
        public void onDraw(Canvas canvas, Paint paint) {
            canvas.drawCircle(this.mPointF.x, this.mPointF.y, paint.getStrokeWidth() / 2.0f, this.mPointPaint);
        }

        public void writeToParcel(Parcel parcel, int i) {
            super.writeToParcel(parcel, i);
            parcel.writeParcelable(this.mPointF, i);
        }
    }

    private static class RemoveTask extends AsyncTask<Void, Void, Integer> {
        private WeakReference<RemoverGestureView> mWeakRemoverGestureView;

        RemoveTask(RemoverGestureView removerGestureView) {
            this.mWeakRemoverGestureView = new WeakReference<>(removerGestureView);
        }

        /* access modifiers changed from: protected */
        public Integer doInBackground(Void... voidArr) {
            RemoverGestureView removerGestureView = (RemoverGestureView) this.mWeakRemoverGestureView.get();
            if (removerGestureView == null) {
                return null;
            }
            RemoverGestureView.export(removerGestureView.mMaskBitmap, removerGestureView.mRemoverPaintData, removerGestureView.mCurves);
            RectF rectF = new RectF();
            Rect rect = new Rect();
            int width = removerGestureView.mMaskBitmap.getWidth();
            int height = removerGestureView.mMaskBitmap.getHeight();
            RemoverGestureView.getMaskBounds(rectF, width, height, removerGestureView.mRemoverPaintData, removerGestureView.mCurves);
            rectF.roundOut(rect);
            Log.d("RemoverGestureView", "mask rect: %s, width: %s, height %s", rect, Integer.valueOf(width), Integer.valueOf(height));
            if (rect.isEmpty()) {
                return Integer.valueOf(-12);
            }
            if (rect.width() >= width || rect.height() >= height) {
                return Integer.valueOf(-11);
            }
            RemoverNNFData removerNNFData = new RemoverNNFData();
            removerGestureView.mRemoverPaintData.mRemoverNNFData = removerNNFData;
            return Integer.valueOf(Inpaint.inpaintBmpData(removerGestureView.mDisplayBitmap, removerGestureView.mMaskBitmap, removerGestureView.mDisplayBitmap.getWidth(), removerGestureView.mDisplayBitmap.getHeight(), rect.left, rect.top, rect.right, rect.bottom, removerNNFData));
        }

        /* access modifiers changed from: protected */
        public void onPostExecute(Integer num) {
            super.onPostExecute(num);
            RemoverGestureView removerGestureView = (RemoverGestureView) this.mWeakRemoverGestureView.get();
            if (!(num == null || removerGestureView == null)) {
                if (removerGestureView.mRemoverCallback != null) {
                    if (num.intValue() == -11) {
                        Toast.makeText(removerGestureView.mContext, R.string.remover_erase_aera_too_big, 0).show();
                        removerGestureView.mRemoverCallback.removeDone(null);
                    } else if (num.intValue() == -12) {
                        removerGestureView.mRemoverCallback.removeDone(null);
                    } else if (num.intValue() < 0) {
                        removerGestureView.mRemoverCallback.removeDone(null);
                        Log.e("RemoverGestureView", "remove sdk process error :%d", (Object) num);
                    } else if (removerGestureView.mCurves != null && removerGestureView.mCurves.size() > 0) {
                        RemoverPaintData removerPaintData = new RemoverPaintData();
                        removerPaintData.mCurves = removerGestureView.mCurves;
                        removerPaintData.mApplyDoodleMatrix.set(removerGestureView.mRemoverPaintData.mApplyDoodleMatrix);
                        removerPaintData.mExportBounds.set(removerGestureView.mRemoverPaintData.mExportBounds);
                        removerPaintData.mDrawableBounds.set(removerGestureView.mRemoverPaintData.mDrawableBounds);
                        removerPaintData.mDrawBitmapMatrix.set(removerGestureView.mRemoverPaintData.mDrawBitmapMatrix);
                        removerPaintData.mExportMatrix.set(removerGestureView.mRemoverPaintData.mExportMatrix);
                        removerPaintData.mBmpBounds.set(removerGestureView.mRemoverPaintData.mBmpBounds);
                        removerPaintData.mViewBounds.set(removerGestureView.mRemoverPaintData.mViewBounds);
                        removerPaintData.mRemoverNNFData = removerGestureView.mRemoverPaintData.mRemoverNNFData;
                        removerGestureView.mRemoverCallback.removeDone(removerPaintData);
                    }
                }
                if (!removerGestureView.mElementType.activated()) {
                    removerGestureView.mCurves = null;
                    removerGestureView.invalidate();
                }
            }
        }

        /* access modifiers changed from: protected */
        public void onPreExecute() {
            super.onPreExecute();
            RemoverGestureView removerGestureView = (RemoverGestureView) this.mWeakRemoverGestureView.get();
            if (removerGestureView != null && removerGestureView.mRemoverCallback != null) {
                removerGestureView.mRemoverCallback.onRemoveStart();
            }
        }
    }

    interface RemoverCallback {
        void onRemoveStart();

        void removeDone(RemoverPaintData removerPaintData);
    }

    private static class StraightLine extends Curve {
        public static final Creator<StraightLine> CREATOR = new Creator<StraightLine>() {
            public StraightLine createFromParcel(Parcel parcel) {
                return new StraightLine(parcel);
            }

            public StraightLine[] newArray(int i) {
                return new StraightLine[i];
            }
        };
        /* access modifiers changed from: private */
        public PointF mEnd = new PointF();
        /* access modifiers changed from: private */
        public PointF mStart = new PointF();

        private static class Builder extends Builder<StraightLine> {
            private Builder() {
            }

            /* access modifiers changed from: 0000 */
            public StraightLine onCreateDraft(Paint paint) {
                return new StraightLine(new Paint(paint));
            }

            /* access modifiers changed from: 0000 */
            public void onDown(float f, float f2) {
                ((StraightLine) this.mDraft).mStart.set(f, f2);
                ((StraightLine) this.mDraft).mEnd.set(f, f2);
            }

            /* access modifiers changed from: 0000 */
            public void onMove(float f, float f2) {
                ((StraightLine) this.mDraft).mEnd.set(f, f2);
            }

            /* access modifiers changed from: 0000 */
            public void onUp(float f, float f2) {
                ((StraightLine) this.mDraft).mEnd.set(f, f2);
            }
        }

        StraightLine(Paint paint) {
            super(paint);
        }

        protected StraightLine(Parcel parcel) {
            super(parcel);
            this.mStart = (PointF) parcel.readParcelable(PointF.class.getClassLoader());
            this.mEnd = (PointF) parcel.readParcelable(PointF.class.getClassLoader());
        }

        public int describeContents() {
            return 0;
        }

        /* access modifiers changed from: 0000 */
        public boolean isEmpty(RectF rectF) {
            return this.mStart.equals(this.mEnd) || (!rectF.contains(this.mStart.x, this.mStart.y) && !rectF.contains(this.mEnd.x, this.mEnd.y));
        }

        /* access modifiers changed from: 0000 */
        public void onComputeBounds(RectF rectF) {
            if (this.mStart.x < this.mEnd.x) {
                rectF.left = this.mStart.x;
                rectF.right = this.mEnd.x;
            } else {
                rectF.left = this.mEnd.x;
                rectF.right = this.mStart.x;
            }
            if (this.mStart.y < this.mEnd.y) {
                rectF.top = this.mStart.y;
                rectF.bottom = this.mEnd.y;
                return;
            }
            rectF.top = this.mEnd.y;
            rectF.bottom = this.mStart.y;
        }

        /* access modifiers changed from: 0000 */
        public void onDraw(Canvas canvas, Paint paint) {
            canvas.drawLine(this.mStart.x, this.mStart.y, this.mEnd.x, this.mEnd.y, paint);
        }

        public void writeToParcel(Parcel parcel, int i) {
            super.writeToParcel(parcel, i);
            parcel.writeParcelable(this.mStart, i);
            parcel.writeParcelable(this.mEnd, i);
        }
    }

    public RemoverGestureView(Context context) {
        this(context, null);
    }

    public RemoverGestureView(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public RemoverGestureView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.mElementType = ElementType.FREE;
        this.mCurves = new ArrayList();
        this.mGesListener = new GesListener();
        this.mContext = context;
        this.mCurvePaint = initCurvePaint(context);
        this.mIsProcessing = false;
        this.mHasRawYuv = false;
        this.mRemoverPaintData = new RemoverPaintData();
        setFeatureGestureListener(this.mGesListener);
    }

    /* access modifiers changed from: private */
    public void doRemove() {
        boolean z;
        Iterator it = this.mCurves.iterator();
        while (true) {
            if (it.hasNext()) {
                if (((Curve) it.next()).isEmpty(this.mBitmapGestureParamsHolder.mBitmapDisplayRect)) {
                    z = true;
                    break;
                }
            } else {
                z = false;
                break;
            }
        }
        if (z) {
            this.mCurves.clear();
        } else {
            new RemoveTask(this).execute(new Void[0]);
        }
    }

    public static void export(Bitmap bitmap, RemoverPaintData removerPaintData, List<Curve> list) {
        if (list != null && list.size() != 0) {
            removerPaintData.mExportBounds.set(0.0f, 0.0f, (float) bitmap.getWidth(), (float) bitmap.getHeight());
            removerPaintData.mExportMatrix.setRectToRect(removerPaintData.mBmpBounds, removerPaintData.mExportBounds, ScaleToFit.CENTER);
            bitmap.eraseColor(0);
            Canvas canvas = new Canvas(bitmap);
            removerPaintData.mDrawBitmapMatrix.invert(removerPaintData.mApplyDoodleMatrix);
            removerPaintData.mExportMatrix.preConcat(removerPaintData.mApplyDoodleMatrix);
            canvas.setMatrix(removerPaintData.mExportMatrix);
            for (Curve draw : list) {
                draw.draw(canvas);
            }
        }
    }

    public static void getMaskBounds(RectF rectF, int i, int i2, RemoverPaintData removerPaintData, List<Curve> list) {
        RectF rectF2 = new RectF();
        for (Curve curve : list) {
            rectF2.setEmpty();
            curve.computeBounds(rectF2);
            if (!rectF2.isEmpty()) {
                rectF.union(rectF2);
            }
        }
        removerPaintData.mDrawBitmapMatrix.invert(removerPaintData.mApplyDoodleMatrix);
        float f = (float) i;
        float f2 = (float) i2;
        removerPaintData.mExportBounds.set(0.0f, 0.0f, f, f2);
        removerPaintData.mExportMatrix.setRectToRect(removerPaintData.mBmpBounds, removerPaintData.mExportBounds, ScaleToFit.CENTER);
        removerPaintData.mExportMatrix.preConcat(removerPaintData.mApplyDoodleMatrix);
        removerPaintData.mExportMatrix.mapRect(rectF);
        if (!rectF.intersect(0.0f, 0.0f, f, f2)) {
            rectF.setEmpty();
        }
    }

    private File getTmpRecordFile(int i) {
        File file = new File(this.mContext.getCacheDir(), "remover-records");
        if (!file.exists() && !file.mkdir()) {
            return null;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("remover_record_temp_");
        sb.append(i);
        return new File(file, sb.toString());
    }

    public static Paint initCurvePaint(Context context) {
        Paint paint = new Paint(3);
        paint.setStyle(Style.STROKE);
        paint.setStrokeCap(Cap.ROUND);
        paint.setStrokeJoin(Join.ROUND);
        paint.setColor(context.getResources().getColor(R.color.photo_editor_highlight_color));
        paint.setAlpha(context.getResources().getInteger(R.integer.remover_paint_alpha));
        return paint;
    }

    private void readRecordBuffer() {
        RandomAccessFile randomAccessFile;
        IOException e;
        try {
            randomAccessFile = new RandomAccessFile(getTmpRecordFile(this.mRenderRecordIndex), "r");
            try {
                FileChannel channel = randomAccessFile.getChannel();
                this.mDisplayBitmap.copyPixelsFromBuffer(channel.map(MapMode.READ_ONLY, 0, channel.size()));
            } catch (IOException e2) {
                e = e2;
            }
        } catch (IOException e3) {
            IOException iOException = e3;
            randomAccessFile = null;
            e = iOException;
            try {
                e.printStackTrace();
                MiscUtil.closeSilently(randomAccessFile);
            } catch (Throwable th) {
                th = th;
                MiscUtil.closeSilently(randomAccessFile);
                throw th;
            }
        } catch (Throwable th2) {
            Throwable th3 = th2;
            randomAccessFile = null;
            th = th3;
            MiscUtil.closeSilently(randomAccessFile);
            throw th;
        }
        MiscUtil.closeSilently(randomAccessFile);
    }

    /* access modifiers changed from: protected */
    public void drawChild(Canvas canvas) {
        canvas.save();
        canvas.clipRect(this.mBitmapGestureParamsHolder.mBitmapDisplayRect);
        if (this.mCurves != null) {
            for (Curve draw : this.mCurves) {
                draw.draw(canvas);
            }
        }
        if (this.mElementType.activated()) {
            this.mElementType.mBuilder.draw(canvas);
        }
        canvas.restore();
    }

    public Bitmap getPreview() {
        return this.mDisplayBitmap;
    }

    /* access modifiers changed from: protected */
    public void onBitmapMatrixChanged() {
        this.mRemoverPaintData.mDrawableBounds.set(this.mBitmapGestureParamsHolder.mBitmapDisplayRect);
        this.mRemoverPaintData.mViewBounds.set(this.mBitmapGestureParamsHolder.mDisplayRect);
        this.mRemoverPaintData.mDrawBitmapMatrix.set(this.mBitmapGestureParamsHolder.mBitmapToDisplayMatrix);
        this.mRemoverPaintData.mBmpBounds.set(this.mBitmapGestureParamsHolder.mBitmapRect);
    }

    /* access modifiers changed from: protected */
    public void onCanvasMatrixChange() {
        this.mRemoverPaintData.mDrawBitmapMatrix.reset();
        this.mRemoverPaintData.mDrawBitmapMatrix.set(this.mBitmapGestureParamsHolder.mBitmapToDisplayMatrix);
        this.mRemoverPaintData.mDrawBitmapMatrix.postConcat(this.mBitmapGestureParamsHolder.mCanvasMatrix);
    }

    public boolean onTouchEvent(MotionEvent motionEvent) {
        if (this.mIsProcessing) {
            return false;
        }
        return super.onTouchEvent(motionEvent);
    }

    public void renderNextBuffer() {
        this.mRenderRecordIndex = (this.mRenderRecordIndex + 1) % 10;
        readRecordBuffer();
        invalidate();
    }

    public void renderPreviousBuffer() {
        this.mRenderRecordIndex = (this.mRenderRecordIndex - 1) % 10;
        if (this.mRenderRecordIndex < 0) {
            this.mRenderRecordIndex += 10;
        }
        readRecordBuffer();
        invalidate();
    }

    public void setBitmap(Bitmap bitmap) {
        super.setBitmap(bitmap);
        this.mMaskBitmap = Bitmap.createBitmap(bitmap.getWidth(), bitmap.getHeight(), Config.ALPHA_8);
        if (!this.mHasRawYuv) {
            writeRecordFile();
            this.mHasRawYuv = true;
        }
        invalidate();
    }

    public boolean setElementType(ElementType elementType) {
        if (this.mElementType.activated()) {
            return false;
        }
        this.mElementType = elementType;
        return true;
    }

    public void setIsProcessing(boolean z) {
        this.mIsProcessing = z;
    }

    public void setRemoverCallback(RemoverCallback removerCallback) {
        this.mRemoverCallback = removerCallback;
    }

    public boolean setStrokeSize(int i) {
        if (this.mElementType.activated()) {
            return false;
        }
        this.mCurvePaint.setStrokeWidth((float) i);
        return true;
    }

    public void writeRecordFile() {
        RandomAccessFile randomAccessFile;
        IOException e;
        this.mRenderRecordIndex = (this.mRenderRecordIndex + 1) % 10;
        try {
            randomAccessFile = new RandomAccessFile(getTmpRecordFile(this.mRenderRecordIndex), "rw");
            try {
                this.mDisplayBitmap.copyPixelsToBuffer(randomAccessFile.getChannel().map(MapMode.READ_WRITE, 0, (long) this.mDisplayBitmap.getByteCount()));
            } catch (IOException e2) {
                e = e2;
            }
        } catch (IOException e3) {
            IOException iOException = e3;
            randomAccessFile = null;
            e = iOException;
            try {
                e.printStackTrace();
                MiscUtil.closeSilently(randomAccessFile);
            } catch (Throwable th) {
                th = th;
                MiscUtil.closeSilently(randomAccessFile);
                throw th;
            }
        } catch (Throwable th2) {
            Throwable th3 = th2;
            randomAccessFile = null;
            th = th3;
            MiscUtil.closeSilently(randomAccessFile);
            throw th;
        }
        MiscUtil.closeSilently(randomAccessFile);
    }
}
