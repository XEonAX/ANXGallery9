package com.miui.gallery.editor.photo.core.imports.mosaic;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.RectF;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.view.MotionEvent;
import android.view.ScaleGestureDetector;
import com.miui.gallery.editor.photo.app.OperationUpdateListener;
import com.miui.gallery.editor.photo.core.imports.filter.render.PixelBuffer;
import com.miui.gallery.editor.photo.widgets.glview.BitmapGestureGLView;
import com.miui.gallery.editor.photo.widgets.glview.BitmapGestureGLView.FeatureGesListener;
import com.miui.gallery.editor.photo.widgets.glview.shader.GLTextureShader;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.ScreenUtils;
import com.nostra13.universalimageloader.core.ImageLoader;
import com.nostra13.universalimageloader.core.download.ImageDownloader.Scheme;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import javax.microedition.khronos.egl.EGLConfig;
import javax.microedition.khronos.opengles.GL10;

public class MosaicGLView extends BitmapGestureGLView {
    private CaptureListener mCaptureListener = new CaptureListener() {
        public void onCapture() {
            if (MosaicGLView.this.mOperationUpdateListener != null) {
                MosaicGLView.this.post(new Runnable() {
                    public void run() {
                        if (MosaicGLView.this.mOperationUpdateListener != null) {
                            MosaicGLView.this.mOperationUpdateListener.onOperationUpdate();
                        }
                    }
                });
            }
        }
    };
    /* access modifiers changed from: private */
    public MosaicGLEntity mCurrentEntity;
    /* access modifiers changed from: private */
    public MosaicRender mCustomRender;
    private FeatureGesListener mFeatureGesListener = new FeatureGesListener() {
        private boolean mIsFirst;
        public float[] mMatrixValues = new float[9];
        private PaintingItem mPaintingItem;
        private float[] mPoint = new float[2];

        private void addPoint(float[] fArr, boolean z) {
            MosaicGLView.this.mMarkRect.left = fArr[0] - MosaicGLView.this.mPaintSizeScale;
            MosaicGLView.this.mMarkRect.right = fArr[0] + MosaicGLView.this.mPaintSizeScale;
            MosaicGLView.this.mMarkRect.top = fArr[1] - MosaicGLView.this.mPaintSizeScale;
            MosaicGLView.this.mMarkRect.bottom = fArr[1] + MosaicGLView.this.mPaintSizeScale;
            BitmapGestureGLView.generateVertexPositionToBitmap(MosaicGLView.this.mMarkRect, MosaicGLView.this.mMarkPosition, (float) MosaicGLView.this.mOriginBitmap.getWidth(), (float) MosaicGLView.this.mOriginBitmap.getHeight());
            GLRectF gLRectF = new GLRectF(MosaicGLView.this.mMarkPosition);
            if (z) {
                MosaicGLView.this.mCustomRender.drawRect(gLRectF, true);
            } else {
                MosaicGLView.this.mCustomRender.drawRect(gLRectF, false);
            }
            this.mPaintingItem.add(gLRectF);
            MosaicGLView.this.requestRender();
        }

        public void onActionUp(float f, float f2) {
            if (!this.mPaintingItem.isEmpty()) {
                MosaicGLView.this.mMosaicUndoManager.record(this.mPaintingItem, MosaicGLView.this.mCurrentEntity, true);
                MosaicGLView.this.mCustomRender.capture(MosaicGLView.this.mMosaicUndoManager);
                MosaicGLView.this.requestRender();
            }
        }

        public boolean onDown(MotionEvent motionEvent) {
            MosaicGLView.this.mBitmapGestureParamsHolder.mCanvasMatrix.getValues(this.mMatrixValues);
            MosaicGLView.this.mPaintSizeScale = ((MosaicGLView.this.mPaintSize * ((float) MosaicGLView.this.mOriginBitmap.getWidth())) / ((float) ScreenUtils.getScreenWidth())) / this.mMatrixValues[0];
            this.mPaintingItem = new PaintingItem();
            this.mIsFirst = true;
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
            if (this.mIsFirst) {
                MosaicGLView.this.mBitmapGestureParamsHolder.convertPointToBitmapCoordinate(motionEvent, this.mPoint);
                addPoint(this.mPoint, true);
                this.mIsFirst = false;
            }
            MosaicGLView.this.mBitmapGestureParamsHolder.convertPointToBitmapCoordinate(motionEvent2, this.mPoint);
            addPoint(this.mPoint, false);
        }

        public void onSingleTapUp(MotionEvent motionEvent) {
            MosaicGLView.this.mBitmapGestureParamsHolder.convertPointToBitmapCoordinate(motionEvent, this.mPoint);
            addPoint(this.mPoint, true);
        }
    };
    private float[] mGLPosition = new float[8];
    private float[] mGLPositionReverse = new float[8];
    private boolean mInit = false;
    /* access modifiers changed from: private */
    public float[] mMarkPosition = new float[8];
    /* access modifiers changed from: private */
    public RectF mMarkRect = new RectF();
    /* access modifiers changed from: private */
    public MosaicUndoManager mMosaicUndoManager;
    /* access modifiers changed from: private */
    public OperationUpdateListener mOperationUpdateListener;
    /* access modifiers changed from: private */
    public float mPaintSize = 200.0f;
    /* access modifiers changed from: private */
    public float mPaintSizeScale = this.mPaintSize;

    static class MosaicEntry implements Parcelable {
        public static final Creator<MosaicEntry> CREATOR = new Creator<MosaicEntry>() {
            public MosaicEntry createFromParcel(Parcel parcel) {
                return new MosaicEntry(parcel);
            }

            public MosaicEntry[] newArray(int i) {
                return new MosaicEntry[i];
            }
        };
        /* access modifiers changed from: private */
        public final LinkedList<MosaicOperationItem> mMosaicOperationItems;
        private final int mPreviewHeight;
        private final int mPreviewWidth;

        protected MosaicEntry(Parcel parcel) {
            this.mMosaicOperationItems = new LinkedList<>();
            parcel.readTypedList(this.mMosaicOperationItems, MosaicOperationItem.CREATOR);
            this.mPreviewWidth = parcel.readInt();
            this.mPreviewHeight = parcel.readInt();
        }

        MosaicEntry(LinkedList<MosaicOperationItem> linkedList, int i, int i2) {
            this.mMosaicOperationItems = new LinkedList<>(linkedList);
            this.mPreviewWidth = i;
            this.mPreviewHeight = i2;
        }

        public Bitmap apply(Bitmap bitmap) {
            Log.d("MosaicEntry", "MosaicEntry apply mosaic start! bitmap width : %d height : %d", Integer.valueOf(bitmap.getWidth()), Integer.valueOf(bitmap.getHeight()));
            if (this.mMosaicOperationItems.isEmpty()) {
                Log.d("MosaicEntry", "MosaicEntry operationItem size zero return null!");
                return null;
            }
            final float f = 1.0f;
            PixelBuffer pixelBuffer = new PixelBuffer(bitmap.getWidth(), bitmap.getHeight());
            if (!(this.mPreviewWidth == bitmap.getWidth() && this.mPreviewHeight == bitmap.getHeight())) {
                f = Math.max(((float) bitmap.getWidth()) / ((float) this.mPreviewWidth), ((float) bitmap.getHeight()) / ((float) this.mPreviewHeight));
            }
            pixelBuffer.setRenderer(new MosaicRender(bitmap, ImageLoader.getInstance().loadImageSync(Scheme.ASSETS.wrap(MosaicProvider.PEN_MASK_PATH))) {
                public void onDrawFrame(GL10 gl10) {
                    super.onDrawFrame(gl10);
                }

                public void onSurfaceChanged(GL10 gl10, int i, int i2) {
                    super.onSurfaceChanged(gl10, i, i2);
                    new InitTask().run();
                    Log.d("MosaicEntry", "MosaicEntry init finish begin apply operation item, size : %d", (Object) Integer.valueOf(MosaicEntry.this.mMosaicOperationItems.size()));
                    long currentTimeMillis = System.currentTimeMillis();
                    Iterator it = MosaicEntry.this.mMosaicOperationItems.iterator();
                    while (it.hasNext()) {
                        MosaicOperationItem mosaicOperationItem = (MosaicOperationItem) it.next();
                        new EnableEntityTask(mosaicOperationItem.mosaicGLEntity, f).run();
                        drawMaskPaintingItems(mosaicOperationItem.paintingItems);
                    }
                    Log.d("MosaicEntry", "MosaicEntry apply operation item coast : %d", (Object) Long.valueOf(System.currentTimeMillis() - currentTimeMillis));
                    System.arraycopy(GLTextureShader.CUBE, 0, this.mGLPosition, 0, this.mGLPosition.length);
                    new DestroyBufferTask().run();
                }

                public void onSurfaceCreated(GL10 gl10, EGLConfig eGLConfig) {
                    super.onSurfaceCreated(gl10, eGLConfig);
                    Log.d("MosaicEntry", "MosaicEntry onSurfaceCreated");
                }
            });
            Log.d("MosaicEntry", "MosaicEntry begin read pixel");
            long currentTimeMillis = System.currentTimeMillis();
            pixelBuffer.getBitmap(bitmap);
            Log.d("MosaicEntry", "MosaicEntry read pixel coast %d", (Object) Long.valueOf(System.currentTimeMillis() - currentTimeMillis));
            pixelBuffer.destroy();
            Log.d("MosaicEntry", "MosaicEntry pixelBuffer destroy");
            return bitmap;
        }

        public int describeContents() {
            return 0;
        }

        public void writeToParcel(Parcel parcel, int i) {
            parcel.writeTypedList(this.mMosaicOperationItems);
            parcel.writeInt(this.mPreviewWidth);
            parcel.writeInt(this.mPreviewHeight);
        }
    }

    public MosaicGLView(Context context) {
        super(context);
        init();
    }

    private void init() {
    }

    private void refreshGLPosition() {
        RectF rectF = this.mBitmapGestureParamsHolder.mBitmapDisplayRect;
        generateVertexPosition(rectF, this.mGLPosition);
        generateVertexPositionReverse(rectF, this.mGLPositionReverse);
        System.arraycopy(this.mGLPositionReverse, 0, this.mCustomRender.mGLPosition, 0, this.mGLPositionReverse.length);
    }

    public boolean canRevert() {
        return this.mMosaicUndoManager.canRevert();
    }

    public boolean canRevoke() {
        return this.mMosaicUndoManager.canRevoke();
    }

    public void doRevert() {
        this.mCustomRender.enableCapture(this.mMosaicUndoManager.doRevert());
        requestRender();
        if (this.mOperationUpdateListener != null) {
            this.mOperationUpdateListener.onOperationUpdate();
        }
    }

    public void doRevoke() {
        this.mCustomRender.enableCapture(this.mMosaicUndoManager.doRevoke());
        requestRender();
        if (this.mOperationUpdateListener != null) {
            this.mOperationUpdateListener.onOperationUpdate();
        }
    }

    public MosaicEntry export() {
        return new MosaicEntry(this.mMosaicUndoManager.exportRecord(), this.mOriginBitmap.getWidth(), this.mOriginBitmap.getHeight());
    }

    public List<String> generateSample() {
        if (this.mMosaicUndoManager == null) {
            return null;
        }
        return this.mMosaicUndoManager.generateSample();
    }

    public boolean isEmpty() {
        return this.mMosaicUndoManager == null || this.mMosaicUndoManager.isEmpty();
    }

    /* access modifiers changed from: protected */
    public void onBitmapMatrixChange() {
        if (!this.mInit) {
            this.mMosaicUndoManager = new MosaicUndoManager(this.mOriginBitmap.getWidth(), this.mOriginBitmap.getHeight(), getWidth(), getHeight());
            this.mMosaicUndoManager.setCaptureListener(this.mCaptureListener);
            this.mCustomRender = new MosaicRender(this.mOriginBitmap, ImageLoader.getInstance().loadImageSync(Scheme.ASSETS.wrap(MosaicProvider.PEN_MASK_PATH)));
            setRenderer(this.mCustomRender);
            setFeatureGestureListener(this.mFeatureGesListener);
            setRenderMode(0);
            this.mCustomRender.init(this.mCurrentEntity);
            this.mCustomRender.capture(this.mMosaicUndoManager);
            this.mInit = true;
        }
        refreshGLPosition();
        requestRender();
    }

    /* access modifiers changed from: protected */
    public void onCanvasMatrixChange() {
        refreshGLPosition();
        requestRender();
    }

    public void onClear() {
        if (this.mMosaicUndoManager != null) {
            this.mMosaicUndoManager.clearBuffer();
        }
    }

    public boolean onTouchEvent(MotionEvent motionEvent) {
        if (!this.mInit) {
            return true;
        }
        return super.onTouchEvent(motionEvent);
    }

    public void setCurrentEntity(MosaicGLEntity mosaicGLEntity) {
        this.mCurrentEntity = mosaicGLEntity;
        if (this.mCustomRender != null) {
            this.mCustomRender.enableEntity(this.mCurrentEntity);
            requestRender();
        }
    }

    public void setMosaicPaintSize(int i) {
        this.mPaintSize = (float) i;
    }

    public void setOperationUpdateListener(OperationUpdateListener operationUpdateListener) {
        this.mOperationUpdateListener = operationUpdateListener;
    }
}
