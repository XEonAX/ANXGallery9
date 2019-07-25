package com.miui.gallery.editor.photo.core.imports.doodle;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Matrix.ScaleToFit;
import android.graphics.RectF;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.view.MotionEvent;
import android.view.ScaleGestureDetector;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.editor.photo.app.OperationUpdateListener;
import com.miui.gallery.editor.photo.app.doodle.DoodlePaintView.PaintType;
import com.miui.gallery.editor.photo.core.imports.doodle.PaintElementOperationDrawable.Action;
import com.miui.gallery.editor.photo.core.imports.doodle.painter.DoodleItem;
import com.miui.gallery.editor.photo.core.imports.doodle.painter.DoodleNode;
import com.miui.gallery.editor.photo.core.imports.doodle.painter.DoodleNode.DoodleDrawableType;
import com.miui.gallery.editor.photo.utils.Bitmaps;
import com.miui.gallery.editor.photo.widgets.imageview.BitmapGestureView;
import com.miui.gallery.util.Log;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

public class DoodleEditorView extends BitmapGestureView {
    /* access modifiers changed from: private */
    public int mActivationIndex = -1;
    private int mColor = -16777216;
    /* access modifiers changed from: private */
    public DoodleItem mCurrentDoodleItem = DoodleItem.PATH;
    /* access modifiers changed from: private */
    public DoodleCallback mDoodleCallback;
    /* access modifiers changed from: private */
    public ArrayList<DoodleNode> mDoodleNodeList = new ArrayList<>();
    private GesListener mGesListener = new GesListener();
    /* access modifiers changed from: private */
    public boolean mIsAddNew = false;
    /* access modifiers changed from: private */
    public Matrix mMatrix = new Matrix();
    private float[] mMatrixValues = new float[9];
    /* access modifiers changed from: private */
    public PaintElementOperationDrawable mOperationDrawable;
    private OperationUpdateListener mOperationUpdateListener;
    private float mPaintSize;
    /* access modifiers changed from: private */
    public RectF mRectFTemp = new RectF();
    /* access modifiers changed from: private */
    public LinkedList<DoodleNode> mRevokedDoodleNodeList = new LinkedList<>();

    public interface DoodleCallback {
        void onDoodleGenerate(String str);
    }

    public static class DoodleEntry implements Parcelable {
        public static final Creator<DoodleEntry> CREATOR = new Creator<DoodleEntry>() {
            public DoodleEntry createFromParcel(Parcel parcel) {
                return new DoodleEntry(parcel);
            }

            public DoodleEntry[] newArray(int i) {
                return new DoodleEntry[i];
            }
        };
        private List<DoodleNode> mDoodleNodeList;
        private RectF mRectF = new RectF();

        DoodleEntry(RectF rectF, List<DoodleNode> list) {
            this.mRectF.set(rectF);
            this.mDoodleNodeList = new ArrayList(list);
        }

        protected DoodleEntry(Parcel parcel) {
            this.mRectF = (RectF) parcel.readParcelable(RectF.class.getClassLoader());
            int readInt = parcel.readInt();
            this.mDoodleNodeList = new ArrayList(readInt);
            for (int i = 0; i < readInt; i++) {
                try {
                    this.mDoodleNodeList.add((DoodleNode) parcel.readParcelable(Class.forName(parcel.readString()).getClassLoader()));
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                }
            }
        }

        /* access modifiers changed from: protected */
        public Bitmap apply(Bitmap bitmap) {
            if (!bitmap.isMutable()) {
                bitmap = Bitmaps.copyBitmap(bitmap);
            }
            if (bitmap == null) {
                return null;
            }
            RectF rectF = new RectF(0.0f, 0.0f, (float) bitmap.getWidth(), (float) bitmap.getHeight());
            Matrix matrix = new Matrix();
            matrix.setRectToRect(this.mRectF, rectF, ScaleToFit.FILL);
            Canvas canvas = new Canvas(bitmap);
            canvas.concat(matrix);
            for (DoodleNode doodleNode : this.mDoodleNodeList) {
                doodleNode.initForParcelable(GalleryApp.sGetAndroidContext());
                doodleNode.draw(canvas);
            }
            return bitmap;
        }

        public int describeContents() {
            return 0;
        }

        public void writeToParcel(Parcel parcel, int i) {
            parcel.writeParcelable(this.mRectF, i);
            parcel.writeInt(this.mDoodleNodeList.size());
            for (DoodleNode doodleNode : this.mDoodleNodeList) {
                parcel.writeString(doodleNode.getClass().getName());
                parcel.writeParcelable(doodleNode, i);
            }
        }
    }

    private class GesListener implements FeatureGesListener {
        private DoodleNode mActivationNode;
        private DoodleNode mCurrentNode;
        private int mDownIndex;
        private DoodleNode mDownNode;
        private float mDownX;
        private float mDownY;
        private float[] mPointTemp1;
        private float[] mPointTemp2;
        private float[] mPointTemp3;
        private boolean mScaleMode;
        private float mScrollX;
        private float mScrollY;
        private TouchAction mTouchAction;

        private GesListener() {
            this.mTouchAction = TouchAction.NONE;
            this.mDownIndex = -1;
            this.mScaleMode = false;
            this.mPointTemp1 = new float[2];
            this.mPointTemp2 = new float[2];
            this.mPointTemp3 = new float[2];
        }

        private int findItemByEvent(float f, float f2) {
            if (DoodleEditorView.this.mActivationIndex != -1 && ((DoodleNode) DoodleEditorView.this.mDoodleNodeList.get(DoodleEditorView.this.mActivationIndex)).contains(f, f2)) {
                return DoodleEditorView.this.mActivationIndex;
            }
            for (int size = DoodleEditorView.this.mDoodleNodeList.size() - 1; size >= 0; size--) {
                if (((DoodleNode) DoodleEditorView.this.mDoodleNodeList.get(size)).contains(f, f2)) {
                    return size;
                }
            }
            return -1;
        }

        private TouchAction findTouchActionWithAction(float f, float f2) {
            DoodleEditorView.this.mOperationDrawable.getDecorationRect(Action.DELETE, DoodleEditorView.this.mRectFTemp);
            if (DoodleEditorView.this.mRectFTemp.contains(f, f2)) {
                return TouchAction.DELETE;
            }
            DoodleEditorView.this.mOperationDrawable.getDecorationRect(Action.ROTATE, DoodleEditorView.this.mRectFTemp);
            if (DoodleEditorView.this.mRectFTemp.contains(f, f2)) {
                return TouchAction.ROTATE;
            }
            DoodleEditorView.this.mOperationDrawable.getDecorationRect(Action.SCALE, DoodleEditorView.this.mRectFTemp);
            return DoodleEditorView.this.mRectFTemp.contains(f, f2) ? TouchAction.SCALE : TouchAction.NONE;
        }

        private void generateDoodle(float f, float f2) {
            if (this.mCurrentNode == null) {
                this.mCurrentNode = DoodleEditorView.this.mCurrentDoodleItem.getDoodleDrawable(DoodleEditorView.this.getContext().getResources());
                DoodleEditorView.this.addNewItem(this.mCurrentNode);
                DoodleEditorView.this.mIsAddNew = true;
                if (DoodleEditorView.this.mDoodleCallback != null) {
                    DoodleEditorView.this.mDoodleCallback.onDoodleGenerate(this.mCurrentNode.getDoodleName());
                }
            }
            this.mCurrentNode.receivePosition(f, f2);
        }

        private void moveDoodle(float f, float f2, DoodleNode doodleNode) {
            doodleNode.getStrokeRectF(DoodleEditorView.this.mRectFTemp);
            DoodleEditorView.this.mMatrix.reset();
            DoodleEditorView.this.mMatrix.postRotate(doodleNode.getRotateDegrees(), doodleNode.getRotateX(), doodleNode.getRotateY());
            DoodleEditorView.this.mMatrix.postTranslate(doodleNode.getUserLocationX(), doodleNode.getUserLocationY());
            DoodleEditorView.this.mMatrix.postConcat(DoodleEditorView.this.mBitmapGestureParamsHolder.mCanvasMatrix);
            DoodleEditorView.this.mMatrix.mapRect(DoodleEditorView.this.mRectFTemp);
            int access$2600 = DoodleEditorView.this.getRectOverScrollStatus(DoodleEditorView.this.mRectFTemp);
            Log.d("DoodleEditorView", "scroll rect : %s", (Object) DoodleEditorView.this.mRectFTemp);
            float f3 = 0.0f;
            if ((access$2600 & 8) == 0 ? !((access$2600 & 4) == 0 || f >= 0.0f) : f > 0.0f) {
                f = 0.0f;
            }
            if ((access$2600 & 2) == 0 ? (access$2600 & 1) == 0 || f2 >= 0.0f : f2 <= 0.0f) {
                f3 = f2;
            }
            doodleNode.appendUserLocationX(-f);
            doodleNode.appendUserLocationY(-f3);
            DoodleEditorView.this.mOperationDrawable.setDrawDecoration(false);
        }

        public void onActionUp(float f, float f2) {
            if (DoodleEditorView.this.mIsAddNew) {
                DoodleNode doodleNode = (DoodleNode) DoodleEditorView.this.mDoodleNodeList.get(DoodleEditorView.this.mDoodleNodeList.size() - 1);
                doodleNode.countSize();
                if (doodleNode.getDoodleType() != DoodleDrawableType.PATH) {
                    DoodleEditorView.this.setActivation(DoodleEditorView.this.mDoodleNodeList.size() - 1);
                    DoodleEditorView.this.invalidate();
                }
                DoodleEditorView.this.mRevokedDoodleNodeList.clear();
                DoodleEditorView.this.notifyOperationUpdate();
            } else if (this.mActivationNode != null) {
                this.mActivationNode.processOnUp();
                DoodleEditorView.this.invalidate();
                DoodleEditorView.this.notifyOperationUpdate();
            }
            DoodleEditorView.this.mOperationDrawable.setDrawDecoration(true);
            DoodleEditorView.this.invalidate();
        }

        public boolean onDown(MotionEvent motionEvent) {
            Log.d("DoodleEditorView", "onDown");
            DoodleEditorView.this.convertPointToViewPortCoordinate(motionEvent, this.mPointTemp1);
            this.mDownX = this.mPointTemp1[0];
            this.mDownY = this.mPointTemp1[1];
            this.mScrollX = this.mDownX;
            this.mScrollY = this.mDownY;
            this.mTouchAction = TouchAction.NONE;
            this.mCurrentNode = null;
            this.mDownNode = null;
            this.mActivationNode = null;
            DoodleEditorView.this.mIsAddNew = false;
            this.mScaleMode = false;
            if (DoodleEditorView.this.mActivationIndex != -1) {
                this.mActivationNode = (DoodleNode) DoodleEditorView.this.mDoodleNodeList.get(DoodleEditorView.this.mActivationIndex);
            }
            this.mDownIndex = findItemByEvent(this.mDownX, this.mDownY);
            if (this.mDownIndex != -1) {
                this.mDownNode = (DoodleNode) DoodleEditorView.this.mDoodleNodeList.get(this.mDownIndex);
            }
            if (this.mActivationNode != null) {
                this.mTouchAction = findTouchActionWithAction(motionEvent.getX(), motionEvent.getY());
                this.mActivationNode.processOnDownEvent(this.mDownX, this.mDownY);
            } else {
                this.mTouchAction = TouchAction.NONE;
            }
            Log.d("DoodleEditorView", "mTouchAction %s", (Object) this.mTouchAction);
            return true;
        }

        public boolean onScale(ScaleGestureDetector scaleGestureDetector) {
            float scaleFactor = scaleGestureDetector.getScaleFactor();
            Log.d("DoodleEditorView", "onScale : %f", (Object) Float.valueOf(scaleFactor));
            if (this.mActivationNode != null) {
                this.mActivationNode.appendScale(scaleFactor);
            }
            DoodleEditorView.this.invalidate();
            return false;
        }

        public boolean onScaleBegin(ScaleGestureDetector scaleGestureDetector) {
            if (DoodleEditorView.this.mActivationIndex != -1) {
                this.mActivationNode = (DoodleNode) DoodleEditorView.this.mDoodleNodeList.get(DoodleEditorView.this.mActivationIndex);
                this.mScaleMode = true;
            }
            return false;
        }

        public void onScaleEnd(ScaleGestureDetector scaleGestureDetector) {
        }

        public void onScroll(MotionEvent motionEvent, MotionEvent motionEvent2, float f, float f2) {
            MotionEvent motionEvent3 = motionEvent;
            MotionEvent motionEvent4 = motionEvent2;
            float[] fArr = this.mPointTemp1;
            float[] fArr2 = this.mPointTemp2;
            float access$700 = DoodleEditorView.this.convertDistanceX(f);
            float access$800 = DoodleEditorView.this.convertDistanceY(f2);
            this.mScrollX -= access$700;
            this.mScrollY -= access$800;
            switch (this.mTouchAction) {
                case NONE:
                    if (!this.mScaleMode) {
                        if (this.mActivationNode != null) {
                            if (this.mDownNode == null || this.mDownNode != this.mActivationNode) {
                                if (motionEvent2.getPointerCount() == 1) {
                                    generateDoodle(this.mScrollX, this.mScrollY);
                                    break;
                                }
                            } else {
                                moveDoodle(access$700, access$800, this.mActivationNode);
                                break;
                            }
                        } else {
                            if (this.mCurrentNode == null) {
                                generateDoodle(this.mDownX, this.mDownY);
                            }
                            DoodleEditorView.this.convertPointToViewPortCoordinate(motionEvent4, fArr2);
                            if (motionEvent2.getPointerCount() == 1) {
                                generateDoodle(fArr2[0], fArr2[1]);
                                break;
                            }
                        }
                    } else if (this.mActivationNode != null) {
                        moveDoodle(access$700, access$800, this.mActivationNode);
                        break;
                    }
                    break;
                case ROTATE:
                    DoodleEditorView.this.convertPointToViewPortCoordinate(motionEvent3, fArr);
                    DoodleEditorView.this.convertPointToViewPortCoordinate(motionEvent4, fArr2);
                    DoodleEditorView.this.mOperationDrawable.getDecorationRect(Action.ROTATE, DoodleEditorView.this.mRectFTemp);
                    float[] fArr3 = this.mPointTemp3;
                    fArr3[0] = DoodleEditorView.this.mRectFTemp.centerX();
                    fArr3[1] = DoodleEditorView.this.mRectFTemp.centerY();
                    DoodleEditorView.this.convertPointToViewPortCoordinate(fArr3);
                    this.mActivationNode.processRotateEvent(fArr[0], fArr[1], fArr2[0], fArr2[1], access$700, access$800, fArr3[0], fArr3[1]);
                    DoodleEditorView.this.mOperationDrawable.setDrawDecoration(false);
                    break;
                case SCALE:
                    DoodleEditorView.this.convertPointToViewPortCoordinate(motionEvent3, fArr);
                    DoodleEditorView.this.convertPointToViewPortCoordinate(motionEvent4, fArr2);
                    DoodleEditorView.this.mOperationDrawable.getDecorationRect(Action.SCALE, DoodleEditorView.this.mRectFTemp);
                    float[] fArr4 = this.mPointTemp3;
                    fArr4[0] = DoodleEditorView.this.mRectFTemp.centerX();
                    fArr4[1] = DoodleEditorView.this.mRectFTemp.centerY();
                    DoodleEditorView.this.convertPointToViewPortCoordinate(fArr4);
                    this.mActivationNode.processScaleEvent(fArr[0], fArr[1], fArr2[0], fArr2[1], access$700, access$800, fArr4[0], fArr4[1]);
                    DoodleEditorView.this.mOperationDrawable.setDrawDecoration(false);
                    break;
            }
            if (this.mActivationNode != null) {
                DoodleEditorView.this.configOperationPosition(this.mActivationNode);
            }
            DoodleEditorView.this.invalidate();
        }

        public void onSingleTapUp(MotionEvent motionEvent) {
            if (this.mTouchAction != TouchAction.NONE) {
                if (AnonymousClass1.$SwitchMap$com$miui$gallery$editor$photo$core$imports$doodle$DoodleEditorView$TouchAction[this.mTouchAction.ordinal()] == 1) {
                    DoodleEditorView.this.deleteItem(this.mActivationNode);
                }
            } else if (this.mDownIndex == -1) {
                DoodleEditorView.this.clearActivation();
            } else if (this.mDownIndex != DoodleEditorView.this.mActivationIndex) {
                DoodleEditorView.this.setActivation(this.mDownIndex);
            }
        }
    }

    private enum TouchAction {
        NONE,
        DELETE,
        SCALE,
        ROTATE
    }

    public DoodleEditorView(Context context) {
        super(context);
        init();
    }

    /* access modifiers changed from: private */
    public void addNewItem(DoodleNode doodleNode) {
        this.mBitmapGestureParamsHolder.mCanvasMatrix.getValues(this.mMatrixValues);
        doodleNode.setPaintSize(this.mPaintSize / this.mMatrixValues[0]);
        doodleNode.setPaintColor(this.mColor);
        this.mDoodleNodeList.add(doodleNode);
    }

    private void configOperationDecoration(DoodleNode doodleNode) {
        if (doodleNode.getDoodleType() != DoodleDrawableType.VECTOR) {
            this.mOperationDrawable.configActionPosition(Action.DELETE, Action.ROTATE, Action.SCALE, null, getResources());
        } else if (doodleNode.getDoodleName().equals(DoodleItem.ARROW.name())) {
            this.mOperationDrawable.configActionPosition(null, Action.DELETE, null, Action.SCALE, getResources());
        } else {
            this.mOperationDrawable.configActionPosition(Action.DELETE, null, Action.SCALE, null, getResources());
        }
    }

    /* access modifiers changed from: private */
    public void configOperationPosition(DoodleNode doodleNode) {
        float userLocationX = doodleNode.getUserLocationX();
        float userLocationY = doodleNode.getUserLocationY();
        doodleNode.getStrokeRectF(this.mRectFTemp);
        this.mRectFTemp.offset(userLocationX, userLocationY);
        this.mOperationDrawable.configDecorationPositon(this.mRectFTemp, this.mBitmapGestureParamsHolder.mCanvasMatrix, doodleNode.getRotateDegrees(), doodleNode.getRotateX() + userLocationX, doodleNode.getRotateY() + userLocationY);
    }

    /* access modifiers changed from: private */
    public void deleteItem(DoodleNode doodleNode) {
        this.mActivationIndex = -1;
        this.mDoodleNodeList.remove(doodleNode);
        invalidate();
        disableChildHandleMode();
    }

    private void init() {
        setBackground(null);
        setFeatureGestureListener(this.mGesListener);
        this.mOperationDrawable = new PaintElementOperationDrawable(getResources());
        this.mPaintSize = getResources().getDisplayMetrics().density * PaintType.MEDIUM.paintSize;
    }

    /* access modifiers changed from: private */
    public void notifyOperationUpdate() {
        if (this.mOperationUpdateListener != null) {
            this.mOperationUpdateListener.onOperationUpdate();
        }
    }

    /* access modifiers changed from: private */
    public void setActivation(int i) {
        this.mActivationIndex = i;
        if (this.mActivationIndex != -1) {
            DoodleNode doodleNode = (DoodleNode) this.mDoodleNodeList.get(this.mActivationIndex);
            configOperationPosition(doodleNode);
            configOperationDecoration(doodleNode);
        }
        invalidate();
        enableChildHandleMode();
    }

    public boolean canRevert() {
        return !this.mRevokedDoodleNodeList.isEmpty();
    }

    public boolean canRevoke() {
        return !this.mDoodleNodeList.isEmpty();
    }

    public void clearActivation() {
        this.mActivationIndex = -1;
        invalidate();
        disableChildHandleMode();
    }

    public void doRevert() {
        this.mActivationIndex = -1;
        this.mDoodleNodeList.add(this.mRevokedDoodleNodeList.removeLast());
        invalidate();
        notifyOperationUpdate();
        disableChildHandleMode();
    }

    public void doRevoke() {
        this.mActivationIndex = -1;
        this.mRevokedDoodleNodeList.add(this.mDoodleNodeList.remove(this.mDoodleNodeList.size() - 1));
        invalidate();
        notifyOperationUpdate();
        disableChildHandleMode();
    }

    /* access modifiers changed from: protected */
    public void drawChild(Canvas canvas) {
        canvas.save();
        canvas.concat(this.mBitmapGestureParamsHolder.mCanvasMatrix);
        canvas.clipRect(this.mBitmapGestureParamsHolder.mBitmapDisplayInitRect);
        for (int i = 0; i < this.mDoodleNodeList.size(); i++) {
            ((DoodleNode) this.mDoodleNodeList.get(i)).draw(canvas);
        }
        canvas.restore();
        canvas.save();
        canvas.clipRect(this.mBitmapGestureParamsHolder.mBitmapDisplayRect);
        if (this.mActivationIndex != -1) {
            this.mOperationDrawable.draw(canvas);
        }
        canvas.restore();
    }

    public DoodleEntry export() {
        clearActivation();
        return new DoodleEntry(this.mBitmapGestureParamsHolder.mBitmapDisplayInitRect, this.mDoodleNodeList);
    }

    public boolean isEmpty() {
        return this.mDoodleNodeList.isEmpty();
    }

    /* access modifiers changed from: protected */
    public void onCanvasMatrixChange() {
        if (this.mActivationIndex != -1) {
            configOperationPosition((DoodleNode) this.mDoodleNodeList.get(this.mActivationIndex));
        }
        invalidate();
    }

    public void setColor(int i) {
        this.mColor = i;
    }

    public void setCurrentDoodleItem(DoodleItem doodleItem) {
        this.mCurrentDoodleItem = doodleItem;
    }

    public void setDoodleCallback(DoodleCallback doodleCallback) {
        this.mDoodleCallback = doodleCallback;
    }

    public void setOperationUpdateListener(OperationUpdateListener operationUpdateListener) {
        this.mOperationUpdateListener = operationUpdateListener;
    }

    public void setPaintSize(float f) {
        this.mPaintSize = f;
    }
}
