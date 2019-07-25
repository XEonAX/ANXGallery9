package com.miui.gallery.editor.photo.screen.doodle;

import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.RectF;
import android.view.MotionEvent;
import android.view.ScaleGestureDetector;
import com.miui.gallery.editor.photo.app.doodle.DoodlePaintItem.PaintType;
import com.miui.gallery.editor.photo.core.common.model.DoodleData;
import com.miui.gallery.editor.photo.core.imports.doodle.DoodleConfig;
import com.miui.gallery.editor.photo.core.imports.doodle.PaintElementOperationDrawable;
import com.miui.gallery.editor.photo.core.imports.doodle.PaintElementOperationDrawable.Action;
import com.miui.gallery.editor.photo.core.imports.doodle.painter.DoodleItem;
import com.miui.gallery.editor.photo.core.imports.doodle.painter.DoodleNode;
import com.miui.gallery.editor.photo.core.imports.doodle.painter.DoodleNode.DoodleDrawableType;
import com.miui.gallery.editor.photo.screen.base.ScreenBaseGestureView.FeatureGesListener;
import com.miui.gallery.editor.photo.screen.base.ScreenVirtualEditorView;
import com.miui.gallery.editor.photo.screen.home.ScreenEditorView;
import com.miui.gallery.util.Log;
import java.util.ArrayList;
import java.util.Iterator;

public class ScreenDoodleView extends ScreenVirtualEditorView implements IScreenDoodleOperation {
    /* access modifiers changed from: private */
    public int mActivationIndex = -1;
    private int mColor = -35801;
    /* access modifiers changed from: private */
    public DoodleItem mCurrentDoodleItem = DoodleItem.PATH;
    private int mCurrentMenuItemIndex;
    /* access modifiers changed from: private */
    public ArrayList<DoodleNode> mDoodleNodeList = new ArrayList<>();
    private FeatureGesListener mGesListener = new GesListener();
    /* access modifiers changed from: private */
    public boolean mIsAddNew = false;
    /* access modifiers changed from: private */
    public Matrix mMatrix = new Matrix();
    /* access modifiers changed from: private */
    public PaintElementOperationDrawable mOperationDrawable;
    private PaintType mPaintType = PaintType.MEDIUM;
    /* access modifiers changed from: private */
    public RectF mRectFTemp = new RectF();

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
            if (ScreenDoodleView.this.mActivationIndex != -1 && ((DoodleNode) ScreenDoodleView.this.mDoodleNodeList.get(ScreenDoodleView.this.mActivationIndex)).contains(f, f2)) {
                return ScreenDoodleView.this.mActivationIndex;
            }
            for (int size = ScreenDoodleView.this.mDoodleNodeList.size() - 1; size >= 0; size--) {
                DoodleNode doodleNode = (DoodleNode) ScreenDoodleView.this.mDoodleNodeList.get(size);
                if (doodleNode.contains(f, f2) && doodleNode.isCanSelected()) {
                    return size;
                }
            }
            return -1;
        }

        private TouchAction findTouchActionWithAction(float f, float f2) {
            ScreenDoodleView.this.mOperationDrawable.getDecorationRect(Action.DELETE, ScreenDoodleView.this.mRectFTemp);
            if (ScreenDoodleView.this.mRectFTemp.contains(f, f2)) {
                return TouchAction.DELETE;
            }
            ScreenDoodleView.this.mOperationDrawable.getDecorationRect(Action.ROTATE, ScreenDoodleView.this.mRectFTemp);
            if (ScreenDoodleView.this.mRectFTemp.contains(f, f2)) {
                return TouchAction.ROTATE;
            }
            ScreenDoodleView.this.mOperationDrawable.getDecorationRect(Action.SCALE, ScreenDoodleView.this.mRectFTemp);
            return ScreenDoodleView.this.mRectFTemp.contains(f, f2) ? TouchAction.SCALE : TouchAction.NONE;
        }

        private void generateDoodle(float f, float f2) {
            if (this.mCurrentNode == null) {
                this.mCurrentNode = ScreenDoodleView.this.mCurrentDoodleItem.getDoodleDrawable(ScreenDoodleView.this.mEditorView.getContext().getResources());
                ScreenDoodleView.this.addNewItem(this.mCurrentNode);
                ScreenDoodleView.this.mIsAddNew = true;
            }
            this.mCurrentNode.receivePosition(f, f2);
        }

        private void moveDoodle(float f, float f2, DoodleNode doodleNode) {
            doodleNode.getStrokeRectF(ScreenDoodleView.this.mRectFTemp);
            ScreenDoodleView.this.mMatrix.reset();
            ScreenDoodleView.this.mMatrix.postRotate(doodleNode.getRotateDegrees(), doodleNode.getRotateX(), doodleNode.getRotateY());
            ScreenDoodleView.this.mMatrix.postTranslate(doodleNode.getUserLocationX(), doodleNode.getUserLocationY());
            ScreenDoodleView.this.mMatrix.postConcat(ScreenDoodleView.this.getBitmapGestureParamsHolder().mCanvasMatrix);
            ScreenDoodleView.this.mMatrix.mapRect(ScreenDoodleView.this.mRectFTemp);
            int rectOverScrollStatus = ScreenDoodleView.this.mEditorView.getRectOverScrollStatus(ScreenDoodleView.this.mRectFTemp);
            Log.d("ScreenDoodleView", "scroll rect : %s", (Object) ScreenDoodleView.this.mRectFTemp);
            float f3 = 0.0f;
            if ((rectOverScrollStatus & 8) == 0 ? !((rectOverScrollStatus & 4) == 0 || f >= 0.0f) : f > 0.0f) {
                f = 0.0f;
            }
            if ((rectOverScrollStatus & 2) == 0 ? (rectOverScrollStatus & 1) == 0 || f2 >= 0.0f : f2 <= 0.0f) {
                f3 = f2;
            }
            doodleNode.appendUserLocationX(-f);
            doodleNode.appendUserLocationY(-f3);
            ScreenDoodleView.this.mOperationDrawable.setDrawDecoration(false);
        }

        public void onActionUp(float f, float f2) {
            if (ScreenDoodleView.this.mIsAddNew) {
                DoodleNode doodleNode = (DoodleNode) ScreenDoodleView.this.mDoodleNodeList.get(ScreenDoodleView.this.mDoodleNodeList.size() - 1);
                doodleNode.countSize();
                if (doodleNode.getDoodleType() != DoodleDrawableType.PATH) {
                    ScreenDoodleView.this.setActivation(ScreenDoodleView.this.mDoodleNodeList.size() - 1);
                    ScreenDoodleView.this.invalidate();
                }
            } else if (this.mActivationNode != null) {
                this.mActivationNode.processOnUp();
                ScreenDoodleView.this.invalidate();
            }
            ScreenDoodleView.this.mOperationDrawable.setDrawDecoration(true);
            ScreenDoodleView.this.invalidate();
        }

        public boolean onDown(MotionEvent motionEvent) {
            Log.d("ScreenDoodleView", "onDown");
            ScreenDoodleView.this.mEditorView.convertPointToViewPortCoordinate(motionEvent, this.mPointTemp1);
            this.mDownX = this.mPointTemp1[0];
            this.mDownY = this.mPointTemp1[1];
            this.mScrollX = this.mDownX;
            this.mScrollY = this.mDownY;
            this.mTouchAction = TouchAction.NONE;
            this.mCurrentNode = null;
            this.mDownNode = null;
            this.mActivationNode = null;
            ScreenDoodleView.this.mIsAddNew = false;
            this.mScaleMode = false;
            if (ScreenDoodleView.this.mActivationIndex != -1) {
                this.mActivationNode = (DoodleNode) ScreenDoodleView.this.mDoodleNodeList.get(ScreenDoodleView.this.mActivationIndex);
            }
            this.mDownIndex = findItemByEvent(this.mDownX, this.mDownY);
            if (this.mDownIndex != -1) {
                this.mDownNode = (DoodleNode) ScreenDoodleView.this.mDoodleNodeList.get(this.mDownIndex);
            }
            if (this.mActivationNode != null) {
                this.mTouchAction = findTouchActionWithAction(motionEvent.getX(), motionEvent.getY());
                this.mActivationNode.processOnDownEvent(this.mDownX, this.mDownY);
            } else {
                this.mTouchAction = TouchAction.NONE;
            }
            Log.d("ScreenDoodleView", "mTouchAction %s", (Object) this.mTouchAction);
            return true;
        }

        public boolean onScale(ScaleGestureDetector scaleGestureDetector) {
            float scaleFactor = scaleGestureDetector.getScaleFactor();
            Log.d("ScreenDoodleView", "onScale : %f", (Object) Float.valueOf(scaleFactor));
            if (this.mActivationNode != null) {
                this.mActivationNode.appendScale(scaleFactor);
            }
            ScreenDoodleView.this.invalidate();
            return false;
        }

        public boolean onScaleBegin(ScaleGestureDetector scaleGestureDetector) {
            if (ScreenDoodleView.this.mActivationIndex != -1) {
                this.mActivationNode = (DoodleNode) ScreenDoodleView.this.mDoodleNodeList.get(ScreenDoodleView.this.mActivationIndex);
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
            float convertDistanceX = ScreenDoodleView.this.mEditorView.convertDistanceX(f);
            float convertDistanceY = ScreenDoodleView.this.mEditorView.convertDistanceY(f2);
            this.mScrollX -= convertDistanceX;
            this.mScrollY -= convertDistanceY;
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
                                moveDoodle(convertDistanceX, convertDistanceY, this.mActivationNode);
                                break;
                            }
                        } else {
                            if (this.mCurrentNode == null) {
                                generateDoodle(this.mDownX, this.mDownY);
                            }
                            ScreenDoodleView.this.mEditorView.convertPointToViewPortCoordinate(motionEvent4, fArr2);
                            if (motionEvent2.getPointerCount() == 1) {
                                generateDoodle(fArr2[0], fArr2[1]);
                                break;
                            }
                        }
                    } else if (this.mActivationNode != null) {
                        moveDoodle(convertDistanceX, convertDistanceY, this.mActivationNode);
                        break;
                    }
                    break;
                case ROTATE:
                    ScreenDoodleView.this.mEditorView.convertPointToViewPortCoordinate(motionEvent3, fArr);
                    ScreenDoodleView.this.mEditorView.convertPointToViewPortCoordinate(motionEvent4, fArr2);
                    ScreenDoodleView.this.mOperationDrawable.getDecorationRect(Action.ROTATE, ScreenDoodleView.this.mRectFTemp);
                    float[] fArr3 = this.mPointTemp3;
                    fArr3[0] = ScreenDoodleView.this.mRectFTemp.centerX();
                    fArr3[1] = ScreenDoodleView.this.mRectFTemp.centerY();
                    ScreenDoodleView.this.mEditorView.convertPointToViewPortCoordinate(fArr3);
                    this.mActivationNode.processRotateEvent(fArr[0], fArr[1], fArr2[0], fArr2[1], convertDistanceX, convertDistanceY, fArr3[0], fArr3[1]);
                    ScreenDoodleView.this.mOperationDrawable.setDrawDecoration(false);
                    break;
                case SCALE:
                    ScreenDoodleView.this.mEditorView.convertPointToViewPortCoordinate(motionEvent3, fArr);
                    ScreenDoodleView.this.mEditorView.convertPointToViewPortCoordinate(motionEvent4, fArr2);
                    ScreenDoodleView.this.mOperationDrawable.getDecorationRect(Action.SCALE, ScreenDoodleView.this.mRectFTemp);
                    float[] fArr4 = this.mPointTemp3;
                    fArr4[0] = ScreenDoodleView.this.mRectFTemp.centerX();
                    fArr4[1] = ScreenDoodleView.this.mRectFTemp.centerY();
                    ScreenDoodleView.this.mEditorView.convertPointToViewPortCoordinate(fArr4);
                    this.mActivationNode.processScaleEvent(fArr[0], fArr[1], fArr2[0], fArr2[1], convertDistanceX, convertDistanceY, fArr4[0], fArr4[1]);
                    ScreenDoodleView.this.mOperationDrawable.setDrawDecoration(false);
                    break;
            }
            if (this.mActivationNode != null) {
                ScreenDoodleView.this.configOperationPosition(this.mActivationNode);
            }
            ScreenDoodleView.this.invalidate();
        }

        public void onSingleTapUp(MotionEvent motionEvent) {
            if (this.mTouchAction != TouchAction.NONE) {
                if (AnonymousClass1.$SwitchMap$com$miui$gallery$editor$photo$screen$doodle$ScreenDoodleView$TouchAction[this.mTouchAction.ordinal()] == 1) {
                    ScreenDoodleView.this.deleteItem(this.mActivationNode);
                }
            } else if (this.mDownIndex == -1) {
                ScreenDoodleView.this.clearActivation();
            } else if (this.mDownIndex != ScreenDoodleView.this.mActivationIndex) {
                ScreenDoodleView.this.setActivation(this.mDownIndex);
            }
        }
    }

    private enum TouchAction {
        NONE,
        DELETE,
        SCALE,
        ROTATE
    }

    public ScreenDoodleView(ScreenEditorView screenEditorView) {
        super(screenEditorView);
        this.mEditorView.setFeatureGestureListener(this.mGesListener);
        this.mOperationDrawable = new PaintElementOperationDrawable(this.mContext.getResources());
    }

    /* access modifiers changed from: private */
    public void addNewItem(DoodleNode doodleNode) {
        if (doodleNode != null) {
            doodleNode.setPaintSize((this.mPaintType.paintSize * this.mContext.getResources().getDisplayMetrics().density) / getBitmapGestureParamsHolder().getMatrixValues()[0]);
            doodleNode.setPaintColor(this.mColor);
            this.mDoodleNodeList.add(doodleNode);
            addDrawNode(doodleNode);
        }
    }

    private void configOperationDecoration(DoodleNode doodleNode) {
        if (doodleNode.getDoodleType() != DoodleDrawableType.VECTOR) {
            this.mOperationDrawable.configActionPosition(Action.DELETE, Action.ROTATE, Action.SCALE, null, this.mEditorView.getResources());
        } else if (doodleNode.getDoodleName().equals(DoodleItem.ARROW.name())) {
            this.mOperationDrawable.configActionPosition(null, Action.DELETE, null, Action.SCALE, this.mEditorView.getResources());
        } else {
            this.mOperationDrawable.configActionPosition(Action.DELETE, null, Action.SCALE, null, this.mEditorView.getResources());
        }
    }

    /* access modifiers changed from: private */
    public void configOperationPosition(DoodleNode doodleNode) {
        float userLocationX = doodleNode.getUserLocationX();
        float userLocationY = doodleNode.getUserLocationY();
        doodleNode.getStrokeRectF(this.mRectFTemp);
        this.mRectFTemp.offset(userLocationX, userLocationY);
        this.mOperationDrawable.configDecorationPositon(this.mRectFTemp, getBitmapGestureParamsHolder().mCanvasMatrix, doodleNode.getRotateDegrees(), doodleNode.getRotateX() + userLocationX, doodleNode.getRotateY() + userLocationY);
    }

    /* access modifiers changed from: private */
    public void deleteItem(DoodleNode doodleNode) {
        this.mActivationIndex = -1;
        this.mDoodleNodeList.remove(doodleNode);
        removeDrawNode(doodleNode);
        invalidate();
        this.mEditorView.disableChildHandleMode();
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
        this.mEditorView.enableChildHandleMode();
    }

    public void canvasMatrixChange() {
        if (this.mActivationIndex != -1) {
            configOperationPosition((DoodleNode) this.mDoodleNodeList.get(this.mActivationIndex));
        }
    }

    public void clearActivation() {
        this.mActivationIndex = -1;
        invalidate();
        this.mEditorView.disableChildHandleMode();
    }

    public void drawOverlay(Canvas canvas) {
        canvas.save();
        canvas.clipRect(getBitmapGestureParamsHolder().mBitmapDisplayRect);
        if (this.mActivationIndex != -1) {
            this.mOperationDrawable.draw(canvas);
        }
        canvas.restore();
    }

    public int getCurrentMenuItemIndex() {
        return this.mCurrentMenuItemIndex;
    }

    public PaintType getPaintType() {
        return this.mPaintType;
    }

    public void onChangeOperation(boolean z) {
        if (z) {
            this.mEditorView.setFeatureGestureListener(this.mGesListener);
            return;
        }
        Iterator it = this.mDoodleNodeList.iterator();
        while (it.hasNext()) {
            ((DoodleNode) it.next()).setCanSelected(false);
        }
        clearActivation();
    }

    public void onDetachedFromWindow() {
    }

    public void setColor(int i) {
        this.mColor = i;
    }

    public void setCurrentDoodleItem(DoodleItem doodleItem) {
        this.mCurrentDoodleItem = doodleItem;
    }

    public void setDoodleData(DoodleData doodleData, int i) {
        setCurrentDoodleItem(((DoodleConfig) doodleData).getDoodleItem());
        clearActivation();
        this.mCurrentMenuItemIndex = i;
    }

    public void setPaintType(PaintType paintType) {
        this.mPaintType = paintType;
    }
}
