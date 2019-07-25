package com.miui.gallery.editor.photo.core.imports.doodle;

import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Matrix;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import com.miui.gallery.R;
import java.util.HashMap;
import java.util.Map.Entry;

public class PaintElementOperationDrawable extends Drawable {
    private HashMap<Action, Integer> mActionPosition = new HashMap<>();
    private RectF mBound = new RectF();
    private Matrix mCurrentMatrix = new Matrix();
    private Drawable[] mDecorationDrawables = new Drawable[4];
    private Rect[] mDecorationRects = new Rect[4];
    private boolean mDrawDecoration = true;
    private Matrix mMatrix = new Matrix();
    private float[] mPoint = new float[2];
    private RectF mRectFTemp = new RectF();
    private float mRotateCenterX;
    private float mRotateCenterY;
    private float mRotateDegree;
    private Matrix mRotateMatrix = new Matrix();
    private Drawable mWindow;

    public enum Action {
        EDIT(R.drawable.common_editor_window_action_btn_edit),
        ROTATE(R.drawable.common_editor_window_action_btn_rotate),
        SCALE(R.drawable.common_editor_window_action_btn_scale),
        DELETE(R.drawable.common_editor_window_action_btn_delete),
        MIRROR(R.drawable.common_editor_window_action_btn_mirror),
        REVERSE_WHITE(R.drawable.common_editor_window_action_btn_reverse_white),
        REVERSE_BLACK(R.drawable.common_editor_window_action_btn_reverse_black);
        
        public final int icon;

        private Action(int i) {
            this.icon = i;
        }
    }

    public PaintElementOperationDrawable(Resources resources) {
        this.mWindow = resources.getDrawable(R.drawable.common_editor_window_n);
        for (int i = 0; i < this.mDecorationRects.length; i++) {
            this.mDecorationRects[i] = new Rect();
        }
    }

    private static void configRectByPointAndSize(Rect rect, float[] fArr, float f, float f2) {
        if (fArr != null && fArr.length == 2) {
            rect.set(Math.round(fArr[0] - f), Math.round(fArr[1] - f2), Math.round(fArr[0] + f), Math.round(fArr[1] + f2));
        }
    }

    public void configActionPosition(Action action, Action action2, Action action3, Action action4, Resources resources) {
        this.mActionPosition.clear();
        if (action != null) {
            this.mActionPosition.put(action, Integer.valueOf(0));
            this.mDecorationDrawables[0] = resources.getDrawable(action.icon);
        }
        if (action2 != null) {
            this.mActionPosition.put(action2, Integer.valueOf(1));
            this.mDecorationDrawables[1] = resources.getDrawable(action2.icon);
        }
        if (action3 != null) {
            this.mActionPosition.put(action3, Integer.valueOf(2));
            this.mDecorationDrawables[2] = resources.getDrawable(action3.icon);
        }
        if (action4 != null) {
            this.mActionPosition.put(action4, Integer.valueOf(3));
            this.mDecorationDrawables[3] = resources.getDrawable(action4.icon);
        }
    }

    public void configDecorationPositon(RectF rectF, Matrix matrix, float f, float f2, float f3) {
        this.mBound.set(rectF);
        this.mMatrix.reset();
        this.mMatrix.postConcat(matrix);
        this.mRotateMatrix.reset();
        this.mRotateMatrix.postRotate(f, f2, f3);
        this.mRotateDegree = f;
        this.mRotateCenterX = f2;
        this.mRotateCenterY = f3;
    }

    public void draw(Canvas canvas) {
        this.mRectFTemp.set(this.mBound);
        this.mPoint[0] = this.mRotateCenterX;
        this.mPoint[1] = this.mRotateCenterY;
        this.mMatrix.mapRect(this.mRectFTemp);
        this.mMatrix.mapPoints(this.mPoint);
        this.mWindow.setBounds((int) this.mRectFTemp.left, (int) this.mRectFTemp.top, (int) this.mRectFTemp.right, (int) this.mRectFTemp.bottom);
        canvas.save();
        canvas.rotate(this.mRotateDegree, this.mPoint[0], this.mPoint[1]);
        this.mWindow.draw(canvas);
        canvas.restore();
        for (Entry value : this.mActionPosition.entrySet()) {
            int intValue = ((Integer) value.getValue()).intValue();
            if (intValue == 0) {
                this.mPoint[0] = this.mBound.left;
                this.mPoint[1] = this.mBound.top;
            } else if (intValue == 1) {
                this.mPoint[0] = this.mBound.right;
                this.mPoint[1] = this.mBound.top;
            } else if (intValue == 2) {
                this.mPoint[0] = this.mBound.right;
                this.mPoint[1] = this.mBound.bottom;
            } else if (intValue == 3) {
                this.mPoint[0] = this.mBound.left;
                this.mPoint[1] = this.mBound.bottom;
            }
            this.mCurrentMatrix.reset();
            this.mCurrentMatrix.postConcat(this.mMatrix);
            this.mCurrentMatrix.preConcat(this.mRotateMatrix);
            this.mCurrentMatrix.mapPoints(this.mPoint);
            Drawable drawable = this.mDecorationDrawables[intValue];
            float intrinsicWidth = (float) (drawable.getIntrinsicWidth() / 2);
            configRectByPointAndSize(this.mDecorationRects[intValue], this.mPoint, intrinsicWidth, intrinsicWidth);
            drawable.setBounds(this.mDecorationRects[intValue]);
            if (this.mDrawDecoration) {
                drawable.draw(canvas);
            }
        }
    }

    public float findLowerDecorationPosition() {
        float f = 0.0f;
        if (this.mActionPosition.isEmpty()) {
            return 0.0f;
        }
        for (Entry value : this.mActionPosition.entrySet()) {
            float f2 = (float) this.mDecorationRects[((Integer) value.getValue()).intValue()].bottom;
            if (f2 > f) {
                f = f2;
            }
        }
        return f;
    }

    public void getDecorationRect(Action action, RectF rectF) {
        Integer num = (Integer) this.mActionPosition.get(action);
        if (num == null) {
            rectF.setEmpty();
        } else {
            rectF.set(this.mDecorationRects[num.intValue()]);
        }
    }

    public int getOpacity() {
        return -2;
    }

    public void setAlpha(int i) {
    }

    public void setColorFilter(ColorFilter colorFilter) {
    }

    public void setDrawDecoration(boolean z) {
        this.mDrawDecoration = z;
    }
}
