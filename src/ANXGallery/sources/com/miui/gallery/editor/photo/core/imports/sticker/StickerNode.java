package com.miui.gallery.editor.photo.core.imports.sticker;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import com.miui.gallery.R;
import com.miui.gallery.editor.photo.utils.parcelable.ParcelableMatrix;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.ScreenUtils;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* compiled from: StickerEditorView */
class StickerNode implements Parcelable {
    public static final Creator<StickerNode> CREATOR = new Creator<StickerNode>() {
        public StickerNode createFromParcel(Parcel parcel) {
            return new StickerNode(parcel);
        }

        public StickerNode[] newArray(int i) {
            return new StickerNode[i];
        }
    };
    /* access modifiers changed from: private */
    public RectF mDrawBounds;
    /* access modifiers changed from: private */
    public RectF mImageBounds;
    private Matrix mInvert = new Matrix();
    /* access modifiers changed from: private */
    public ModifyListener mListener;
    /* access modifiers changed from: private */
    public ParcelableMatrix mMatrix = new ParcelableMatrix();
    private float[] mMatrixValue = new float[9];
    private Paint mPaint = new Paint(3);
    private String mPathName;
    /* access modifiers changed from: private */
    public Matrix mRotate = new Matrix();
    private Bitmap mSticker;
    public String mStickerCateName;
    public long mStickerId;

    /* compiled from: StickerEditorView */
    static class Cache {
        private Bitmap mBackground;
        private Matrix mBitmapToCanvas;
        private Canvas mCanvas;
        private Rect mCanvasBound = new Rect();
        private Matrix mCanvasToBitmap;
        private Bitmap mLayer;
        private ArrayList<StickerNode> mNodes = new ArrayList<>();
        private Paint mPaint = new Paint(3);
        private RectF mRedrawDst = new RectF();
        private Rect mRedrawSrc = new Rect();
        private float[] mReusePoint = new float[2];

        Cache(Bitmap bitmap, Matrix matrix, Matrix matrix2) {
            this.mBackground = bitmap;
            this.mCanvasToBitmap = matrix;
            this.mBitmapToCanvas = matrix2;
            this.mLayer = bitmap.copy(Config.ARGB_8888, true);
            this.mCanvas = new Canvas(this.mLayer);
            this.mCanvasBound.set(0, 0, this.mLayer.getWidth(), this.mLayer.getHeight());
        }

        private List<StickerNode> findIntersects(StickerNode stickerNode) {
            ArrayList arrayList = new ArrayList();
            Iterator it = this.mNodes.iterator();
            while (it.hasNext()) {
                StickerNode stickerNode2 = (StickerNode) it.next();
                if (RectF.intersects(stickerNode2.mDrawBounds, stickerNode.mDrawBounds)) {
                    arrayList.add(stickerNode2);
                }
            }
            return arrayList;
        }

        /* access modifiers changed from: 0000 */
        public void append(StickerNode stickerNode) {
            if (stickerNode != null) {
                this.mNodes.add(stickerNode);
                stickerNode.draw(this.mCanvas);
            }
        }

        /* access modifiers changed from: 0000 */
        public void draw(Canvas canvas) {
            canvas.drawBitmap(this.mLayer, this.mBitmapToCanvas, this.mPaint);
        }

        /* access modifiers changed from: 0000 */
        public int find(float f, float f2) {
            this.mReusePoint[0] = f;
            this.mReusePoint[1] = f2;
            this.mCanvasToBitmap.mapPoints(this.mReusePoint);
            for (int size = this.mNodes.size() - 1; size >= 0; size--) {
                if (((StickerNode) this.mNodes.get(size)).contains(this.mReusePoint)) {
                    return size;
                }
            }
            return -1;
        }

        /* access modifiers changed from: 0000 */
        public List<StickerNode> getNodes() {
            return (List) this.mNodes.clone();
        }

        /* access modifiers changed from: 0000 */
        public boolean isEmpty() {
            return this.mNodes.isEmpty();
        }

        /* access modifiers changed from: 0000 */
        public StickerNode remove(int i) {
            StickerNode stickerNode = (StickerNode) this.mNodes.remove(i);
            this.mRedrawSrc.set((int) Math.floor((double) stickerNode.mDrawBounds.left), (int) Math.floor((double) stickerNode.mDrawBounds.top), (int) Math.ceil((double) stickerNode.mDrawBounds.right), (int) Math.ceil((double) stickerNode.mDrawBounds.bottom));
            this.mRedrawDst.set(this.mRedrawSrc);
            long currentTimeMillis = System.currentTimeMillis();
            this.mCanvas.save();
            this.mCanvas.clipRect(this.mRedrawSrc);
            this.mCanvas.drawBitmap(this.mBackground, this.mRedrawSrc, this.mRedrawDst, this.mPaint);
            List<StickerNode> findIntersects = findIntersects(stickerNode);
            Log.d("StickerEditorView", "need rebuild %d items", (Object) Integer.valueOf(findIntersects.size()));
            for (StickerNode draw : findIntersects) {
                draw.draw(this.mCanvas);
            }
            this.mCanvas.restore();
            Log.d("StickerNode", "rebuild finish costs %dms", (Object) Long.valueOf(System.currentTimeMillis() - currentTimeMillis));
            return stickerNode;
        }
    }

    /* compiled from: StickerEditorView */
    private interface ModifyListener {
        void onModified();
    }

    /* compiled from: StickerEditorView */
    static class Mutator {
        private final Matrix mBitmapToCanvas;
        private Drawable mBorder;
        private final Matrix mCanvasToBitmap;
        private Drawable mDelete;
        private Rect mDrawBounds = new Rect();
        private StickerNode mItem;
        private ModifyListener mListener = new ModifyListener() {
            public void onModified() {
                Mutator.this.updateDisplayInfo();
            }
        };
        private Drawable mMirror;
        private Matrix mReuseDegree = new Matrix();
        private Matrix mReuseMatrix = new Matrix();
        private float[] mReusePoint = new float[2];
        private RectF mReuseRect = new RectF();
        private float[] mReuseVector = new float[2];
        private Drawable mScale;
        private float[][] mVertices = ((float[][]) Array.newInstance(float.class, new int[]{4, 2}));

        Mutator(Context context, Matrix matrix, Matrix matrix2) {
            for (int i = 0; i < 4; i++) {
                this.mVertices[i] = new float[2];
            }
            this.mDelete = context.getResources().getDrawable(R.drawable.common_editor_window_action_btn_delete);
            this.mMirror = context.getResources().getDrawable(R.drawable.common_editor_window_action_btn_mirror);
            this.mScale = context.getResources().getDrawable(R.drawable.common_editor_window_action_btn_scale);
            this.mBorder = context.getResources().getDrawable(R.drawable.common_editor_window_n);
            this.mBitmapToCanvas = matrix;
            this.mCanvasToBitmap = matrix2;
        }

        private static void setBounds(Drawable drawable, float f, float f2) {
            float intrinsicWidth = ((float) drawable.getIntrinsicWidth()) / 2.0f;
            float intrinsicHeight = ((float) drawable.getIntrinsicHeight()) / 2.0f;
            drawable.setBounds(Math.round(f - intrinsicWidth), Math.round(f2 - intrinsicHeight), Math.round(f + intrinsicWidth), Math.round(f2 + intrinsicHeight));
        }

        /* access modifiers changed from: 0000 */
        public void bind(StickerNode stickerNode) {
            if (this.mItem != null) {
                this.mItem.mListener = null;
            }
            stickerNode.mListener = this.mListener;
            this.mItem = stickerNode;
            updateDisplayInfo();
        }

        /* access modifiers changed from: 0000 */
        public boolean contains(float f, float f2) {
            if (this.mItem == null) {
                return false;
            }
            this.mReusePoint[0] = f;
            this.mReusePoint[1] = f2;
            this.mCanvasToBitmap.mapPoints(this.mReusePoint);
            return this.mItem.contains(this.mReusePoint);
        }

        /* access modifiers changed from: 0000 */
        public void draw(Canvas canvas, boolean z) {
            if (this.mItem != null) {
                canvas.save();
                canvas.concat(this.mBitmapToCanvas);
                this.mItem.draw(canvas);
                canvas.restore();
                canvas.save();
                canvas.translate((float) this.mBorder.getBounds().centerX(), (float) this.mBorder.getBounds().centerY());
                canvas.concat(this.mItem.mRotate);
                canvas.translate((float) (-this.mBorder.getBounds().centerX()), (float) (-this.mBorder.getBounds().centerY()));
                this.mBorder.draw(canvas);
                canvas.restore();
                if (!z) {
                    this.mMirror.draw(canvas);
                    this.mDelete.draw(canvas);
                    this.mScale.draw(canvas);
                }
            }
        }

        /* access modifiers changed from: 0000 */
        public RectF getBorderBounds() {
            return this.mReuseRect;
        }

        /* access modifiers changed from: 0000 */
        public Rect getDrawBounds() {
            return this.mDrawBounds;
        }

        /* access modifiers changed from: 0000 */
        public float getRadius() {
            return (float) Math.hypot((double) (this.mScale.getBounds().centerX() - this.mDrawBounds.centerX()), (double) (this.mScale.getBounds().centerY() - this.mDrawBounds.centerY()));
        }

        /* access modifiers changed from: 0000 */
        public float[] getVertex(int i) {
            if (i <= 4) {
                return this.mVertices[i];
            }
            throw new IllegalArgumentException("error params");
        }

        /* access modifiers changed from: 0000 */
        public boolean isDelete(float f, float f2) {
            return this.mDelete.getBounds().contains(Math.round(f), Math.round(f2));
        }

        /* access modifiers changed from: 0000 */
        public boolean isIdle() {
            return this.mItem == null;
        }

        /* access modifiers changed from: 0000 */
        public boolean isMirror(float f, float f2) {
            return this.mMirror.getBounds().contains(Math.round(f), Math.round(f2));
        }

        /* access modifiers changed from: 0000 */
        public boolean isScale(float f, float f2) {
            return this.mScale.getBounds().contains(Math.round(f), Math.round(f2));
        }

        /* access modifiers changed from: 0000 */
        public void mirror() {
            this.mItem.mirror();
        }

        /* access modifiers changed from: 0000 */
        public void rotate(float f, float f2) {
            this.mReuseDegree.setSinCos(f, f2);
            this.mItem.rotate(this.mReuseDegree);
        }

        /* access modifiers changed from: 0000 */
        public void scale(float f) {
            this.mItem.scale(f);
        }

        /* access modifiers changed from: 0000 */
        public void translate(float f, float f2) {
            this.mReuseVector[0] = f;
            this.mReuseVector[1] = f2;
            this.mCanvasToBitmap.mapVectors(this.mReuseVector);
            this.mItem.translate(this.mReuseVector[0], this.mReuseVector[1]);
        }

        /* access modifiers changed from: 0000 */
        public StickerNode unbind() {
            StickerNode stickerNode = this.mItem;
            this.mItem = null;
            return stickerNode;
        }

        /* access modifiers changed from: 0000 */
        public void updateDisplayInfo() {
            this.mReuseRect.set(this.mItem.mDrawBounds);
            this.mBitmapToCanvas.mapRect(this.mReuseRect);
            this.mDrawBounds.set(Math.round(this.mReuseRect.left), Math.round(this.mReuseRect.top), Math.round(this.mReuseRect.right), Math.round(this.mReuseRect.bottom));
            this.mItem.mRotate.invert(this.mReuseMatrix);
            this.mReuseMatrix.preTranslate(-this.mItem.mDrawBounds.centerX(), -this.mItem.mDrawBounds.centerY());
            this.mReuseMatrix.postTranslate(this.mItem.mDrawBounds.centerX(), this.mItem.mDrawBounds.centerY());
            this.mReuseMatrix.preConcat(this.mItem.mMatrix);
            this.mReuseMatrix.mapRect(this.mReuseRect, this.mItem.mImageBounds);
            this.mBitmapToCanvas.mapRect(this.mReuseRect);
            this.mBorder.setBounds(Math.round(this.mReuseRect.left), Math.round(this.mReuseRect.top), Math.round(this.mReuseRect.right), Math.round(this.mReuseRect.bottom));
            this.mVertices[0][0] = this.mReuseRect.left;
            this.mVertices[0][1] = this.mReuseRect.top;
            this.mVertices[1][0] = this.mReuseRect.right;
            this.mVertices[1][1] = this.mReuseRect.top;
            this.mVertices[2][0] = this.mReuseRect.left;
            this.mVertices[2][1] = this.mReuseRect.bottom;
            this.mVertices[3][0] = this.mReuseRect.right;
            this.mVertices[3][1] = this.mReuseRect.bottom;
            this.mReuseMatrix.setTranslate(-this.mReuseRect.centerX(), -this.mReuseRect.centerY());
            this.mReuseMatrix.postConcat(this.mItem.mRotate);
            this.mReuseMatrix.postTranslate(this.mReuseRect.centerX(), this.mReuseRect.centerY());
            for (float[] mapPoints : this.mVertices) {
                this.mReuseMatrix.mapPoints(mapPoints);
            }
            setBounds(this.mDelete, this.mVertices[1][0], this.mVertices[1][1]);
            setBounds(this.mMirror, this.mVertices[0][0], this.mVertices[0][1]);
            setBounds(this.mScale, this.mVertices[3][0], this.mVertices[3][1]);
        }
    }

    StickerNode(Bitmap bitmap, String str, long j, String str2) {
        this.mSticker = bitmap;
        this.mStickerId = j;
        this.mStickerCateName = str2;
        this.mPathName = str;
        this.mImageBounds = new RectF(0.0f, 0.0f, (float) bitmap.getWidth(), (float) bitmap.getHeight());
        this.mDrawBounds = new RectF(this.mImageBounds);
    }

    protected StickerNode(Parcel parcel) {
        this.mMatrix = (ParcelableMatrix) parcel.readParcelable(ParcelableMatrix.class.getClassLoader());
        this.mPathName = parcel.readString();
        initForParcelable();
    }

    /* access modifiers changed from: private */
    public boolean contains(float[] fArr) {
        float f = fArr[0];
        float f2 = fArr[1];
        this.mInvert.mapPoints(fArr);
        boolean contains = this.mImageBounds.contains(fArr[0], fArr[1]);
        fArr[0] = f;
        fArr[1] = f2;
        return contains;
    }

    /* access modifiers changed from: private */
    public void mirror() {
        this.mMatrix.preScale(-1.0f, 1.0f, this.mImageBounds.centerX(), this.mImageBounds.centerY());
        postModify();
    }

    private void postModify() {
        this.mMatrix.mapRect(this.mDrawBounds, this.mImageBounds);
        this.mMatrix.invert(this.mInvert);
        if (this.mListener != null) {
            this.mListener.onModified();
        }
    }

    /* access modifiers changed from: private */
    public void rotate(Matrix matrix) {
        this.mRotate.postConcat(matrix);
        this.mMatrix.postTranslate(-this.mDrawBounds.centerX(), -this.mDrawBounds.centerY());
        this.mMatrix.postConcat(matrix);
        this.mMatrix.postTranslate(this.mDrawBounds.centerX(), this.mDrawBounds.centerY());
        postModify();
    }

    /* access modifiers changed from: private */
    public void scale(float f) {
        this.mMatrix.postScale(f, f, this.mDrawBounds.centerX(), this.mDrawBounds.centerY());
        postModify();
    }

    /* access modifiers changed from: private */
    public void translate(float f, float f2) {
        this.mMatrix.postTranslate(f, f2);
        postModify();
    }

    public int describeContents() {
        return 0;
    }

    /* access modifiers changed from: 0000 */
    public void draw(Canvas canvas) {
        canvas.drawBitmap(this.mSticker, this.mMatrix, this.mPaint);
    }

    /* access modifiers changed from: 0000 */
    public void init(Matrix matrix, Bitmap bitmap) {
        matrix.getValues(this.mMatrixValue);
        float width = (float) bitmap.getWidth();
        float screenWidth = (float) ScreenUtils.getScreenWidth();
        float f = this.mMatrixValue[0];
        if (width < screenWidth) {
            f *= width / screenWidth;
        }
        this.mMatrix.postScale(f, f, 0.0f, 0.0f);
        postModify();
    }

    public void initForParcelable() {
        this.mSticker = BitmapFactory.decodeFile(this.mPathName);
    }

    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeParcelable(this.mMatrix, i);
        parcel.writeString(this.mPathName);
    }
}
