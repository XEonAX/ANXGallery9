package com.miui.gallery.editor.photo.core.imports.text;

import android.animation.ObjectAnimator;
import android.animation.ValueAnimator;
import android.animation.ValueAnimator.AnimatorUpdateListener;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Matrix.ScaleToFit;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.Rect;
import android.graphics.RectF;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.text.TextUtils;
import android.view.MotionEvent;
import android.view.ScaleGestureDetector;
import com.miui.gallery.editor.photo.core.imports.doodle.PaintElementOperationDrawable;
import com.miui.gallery.editor.photo.core.imports.doodle.PaintElementOperationDrawable.Action;
import com.miui.gallery.editor.photo.core.imports.text.base.ITextDialogConfig;
import com.miui.gallery.editor.photo.core.imports.text.dialog.BaseDialogModel;
import com.miui.gallery.editor.photo.core.imports.text.model.DialogStatusData;
import com.miui.gallery.editor.photo.core.imports.text.typeface.TextStyle;
import com.miui.gallery.editor.photo.core.imports.text.utils.AutoLineLayout.TextAlignment;
import com.miui.gallery.editor.photo.core.imports.text.watermark.WatermarkDialog;
import com.miui.gallery.editor.photo.core.imports.text.watermark.WatermarkDialog.BitmapLoadingListener;
import com.miui.gallery.editor.photo.utils.Bitmaps;
import com.miui.gallery.editor.photo.widgets.imageview.BitmapGestureView;
import com.miui.gallery.util.Log;
import java.util.ArrayList;
import java.util.List;

public class TextEditorView extends BitmapGestureView {
    private Paint mAuxiliaryPaint = new Paint(1);
    private float mCanvasOffsetY = 0.0f;
    private Context mContext;
    /* access modifiers changed from: private */
    public int mCurrentIndex = -1;
    private float mCurrentTargetOffsetY = 0.0f;
    /* access modifiers changed from: private */
    public List<ITextDialogConfig> mITextDialogConfigs = new ArrayList();
    private int[] mLocation = new int[2];
    private ObjectAnimator mOffsetAnimator;
    /* access modifiers changed from: private */
    public PaintElementOperationDrawable mOperationDrawable;
    private float mOriginScale = 1.0f;
    /* access modifiers changed from: private */
    public RectF mRectFTemp = new RectF();
    private Rect mRectTemp = new Rect();
    private TextEditorListener mTextEditorListener;
    private AnimatorUpdateListener mUpdateListener = new AnimatorUpdateListener() {
        public void onAnimationUpdate(ValueAnimator valueAnimator) {
            TextEditorView.this.invalidate();
        }
    };

    private class GesListener implements FeatureGesListener {
        float mBaseDegrees;
        float mBaseDistance;
        float mCenterX;
        float mCenterY;
        ITextDialogConfig mCurrentConfig;
        ITextDialogConfig mDownConfig;
        int mDownIndex;
        float mDownX;
        float mDownY;
        boolean mNeedInit;
        private float[] mPointTemp1;
        private float[] mPointTemp2;
        float mPreDegrees;
        float mPreScale;
        RectF mRectF;
        TouchAction mTouchAction;

        private GesListener() {
            this.mTouchAction = TouchAction.NONE;
            this.mDownIndex = -1;
            this.mBaseDistance = 0.0f;
            this.mBaseDegrees = 0.0f;
            this.mCenterX = 0.0f;
            this.mCenterY = 0.0f;
            this.mRectF = new RectF();
            this.mNeedInit = false;
            this.mPreScale = 1.0f;
            this.mPreDegrees = 0.0f;
            this.mPointTemp1 = new float[2];
            this.mPointTemp2 = new float[2];
        }

        private void doScroll(float f, float f2, ITextDialogConfig iTextDialogConfig) {
            if (iTextDialogConfig != null) {
                iTextDialogConfig.getOutLineRect(TextEditorView.this.mRectFTemp);
                TextEditorView.this.mBitmapGestureParamsHolder.mCanvasMatrix.mapRect(TextEditorView.this.mRectFTemp);
                int access$2000 = TextEditorView.this.getRectOverScrollStatus(TextEditorView.this.mRectFTemp);
                float f3 = 0.0f;
                if ((access$2000 & 8) == 0 ? !((access$2000 & 4) == 0 || f >= 0.0f) : f > 0.0f) {
                    f = 0.0f;
                }
                if ((access$2000 & 2) == 0 ? (access$2000 & 1) == 0 || f2 >= 0.0f : f2 <= 0.0f) {
                    f3 = f2;
                }
                iTextDialogConfig.appendUserLocationX(-f);
                iTextDialogConfig.appendUserLocationY(-f3);
                TextEditorView.this.countAndInvalidate(iTextDialogConfig, false, false);
                TextEditorView.this.configOperationPosition(this.mCurrentConfig);
                this.mCurrentConfig.setDrawOutline(false);
                TextEditorView.this.mOperationDrawable.setDrawDecoration(false);
                TextEditorView.this.invalidate();
            }
        }

        public void onActionUp(float f, float f2) {
            int access$1600 = TextEditorView.this.findActivationIndex();
            if (access$1600 >= 0) {
                ITextDialogConfig iTextDialogConfig = (ITextDialogConfig) TextEditorView.this.mITextDialogConfigs.get(access$1600);
                iTextDialogConfig.refreshRotateDegree();
                iTextDialogConfig.setDrawOutline(true);
                TextEditorView.this.countAndInvalidate(iTextDialogConfig, true, false);
                TextEditorView.this.notifyModify();
            }
            TextEditorView.this.mOperationDrawable.setDrawDecoration(true);
            TextEditorView.this.invalidate();
        }

        public boolean onDown(MotionEvent motionEvent) {
            TextEditorView.this.convertPointToViewPortCoordinate(motionEvent, this.mPointTemp1);
            this.mDownX = this.mPointTemp1[0];
            this.mDownY = this.mPointTemp1[1];
            this.mDownIndex = TextEditorView.this.findItemByEvent(this.mDownX, this.mDownY);
            if (this.mDownIndex != -1) {
                this.mDownConfig = (ITextDialogConfig) TextEditorView.this.mITextDialogConfigs.get(this.mDownIndex);
                this.mDownConfig.getOutLineRect(this.mRectF);
            } else {
                this.mDownConfig = null;
            }
            if (TextEditorView.this.mCurrentIndex != -1) {
                this.mTouchAction = TextEditorView.this.findTouchAction(motionEvent.getX(), motionEvent.getY());
                this.mCurrentConfig = (ITextDialogConfig) TextEditorView.this.mITextDialogConfigs.get(TextEditorView.this.mCurrentIndex);
                this.mCenterX = -1.0f;
                this.mNeedInit = true;
                this.mCurrentConfig.getOutLineRect(this.mRectF);
            } else {
                this.mTouchAction = TouchAction.NONE;
                this.mCurrentConfig = null;
            }
            Log.d("TextEditorView", "mTouchAction : %s", (Object) this.mTouchAction);
            return true;
        }

        public boolean onScale(ScaleGestureDetector scaleGestureDetector) {
            if (this.mCurrentConfig != null) {
                this.mCurrentConfig.setUserScaleMultiple(this.mCurrentConfig.getUserScaleMultiple() * scaleGestureDetector.getScaleFactor());
            }
            TextEditorView.this.invalidate();
            return false;
        }

        public boolean onScaleBegin(ScaleGestureDetector scaleGestureDetector) {
            if (TextEditorView.this.mCurrentIndex != -1) {
                this.mCurrentConfig = (ITextDialogConfig) TextEditorView.this.mITextDialogConfigs.get(TextEditorView.this.mCurrentIndex);
            } else {
                this.mCurrentConfig = null;
            }
            return false;
        }

        public void onScaleEnd(ScaleGestureDetector scaleGestureDetector) {
        }

        public void onScroll(MotionEvent motionEvent, MotionEvent motionEvent2, float f, float f2) {
            TextEditorView.this.convertPointToViewPortCoordinate(motionEvent, this.mPointTemp1);
            TextEditorView.this.convertPointToViewPortCoordinate(motionEvent2, this.mPointTemp2);
            float f3 = this.mPointTemp2[0];
            float f4 = this.mPointTemp2[1];
            float f5 = this.mPointTemp1[0];
            float f6 = this.mPointTemp1[1];
            float access$1200 = TextEditorView.this.convertDistanceX(f);
            float access$1300 = TextEditorView.this.convertDistanceY(f2);
            if (AnonymousClass2.$SwitchMap$com$miui$gallery$editor$photo$core$imports$text$TextEditorView$TouchAction[this.mTouchAction.ordinal()] == 6) {
                if (this.mNeedInit) {
                    this.mCenterX = this.mRectF.centerX();
                    this.mCenterY = this.mRectF.centerY();
                    this.mBaseDistance = (float) Math.hypot((double) (this.mCenterX - f5), (double) (this.mCenterY - f6));
                    this.mBaseDegrees = (float) Math.atan2((double) (f6 - this.mCenterY), (double) (f5 - this.mCenterX));
                    this.mPreScale = this.mCurrentConfig.getUserScaleMultiple();
                    this.mPreDegrees = this.mCurrentConfig.getRotateDegrees();
                    this.mNeedInit = false;
                }
                double hypot = Math.hypot((double) (this.mCenterX - f3), (double) (this.mCenterY - f4));
                double atan2 = Math.atan2((double) (f4 - this.mCenterY), (double) (f3 - this.mCenterX));
                double d = (double) this.mBaseDistance;
                Double.isNaN(d);
                float f7 = (float) (hypot / d);
                double d2 = (double) this.mBaseDegrees;
                Double.isNaN(d2);
                double degrees = Math.toDegrees(atan2 - d2);
                this.mCurrentConfig.setUserScaleMultiple(f7 * this.mPreScale);
                this.mCurrentConfig.setRotateDegrees(((float) degrees) + this.mPreDegrees);
                this.mCurrentConfig.setDrawOutline(false);
                TextEditorView.this.mOperationDrawable.setDrawDecoration(false);
                TextEditorView.this.countAndInvalidate(this.mCurrentConfig, false, false);
            } else if (TextEditorView.this.mCurrentIndex != -1) {
                doScroll(access$1200, access$1300, this.mCurrentConfig);
            } else if (this.mDownIndex != -1) {
                TextEditorView.this.setActivation(this.mDownIndex);
                this.mCurrentConfig = (ITextDialogConfig) TextEditorView.this.mITextDialogConfigs.get(this.mDownIndex);
                doScroll(access$1200, access$1300, this.mCurrentConfig);
            }
            if (this.mCurrentConfig != null) {
                TextEditorView.this.configOperationPosition(this.mCurrentConfig);
            }
        }

        public void onSingleTapUp(MotionEvent motionEvent) {
            Log.d("TextEditorView", "click number： %d", (Object) Integer.valueOf(this.mDownIndex));
            TextEditorView.this.convertPointToViewPortCoordinate(motionEvent, this.mPointTemp1);
            if (TextEditorView.this.mCurrentIndex == -1) {
                if (this.mDownIndex != -1) {
                    TextEditorView.this.setActivation(this.mDownIndex);
                }
            } else if (this.mCurrentConfig != null) {
                switch (this.mTouchAction) {
                    case MIRROR:
                        if (this.mCurrentConfig.isDialogEnable()) {
                            this.mCurrentConfig.toggleMirror();
                            TextEditorView.this.countAndInvalidate(this.mCurrentConfig, true, true);
                            return;
                        }
                        return;
                    case REVERSE_WHITE:
                        if (this.mCurrentConfig.isWatermark()) {
                            this.mCurrentConfig.reverseColor(-16777216);
                            TextEditorView.this.updateOperationDrawable(false);
                            TextEditorView.this.invalidate();
                            return;
                        }
                        return;
                    case REVERSE_BLACK:
                        if (this.mCurrentConfig.isWatermark()) {
                            this.mCurrentConfig.reverseColor(-1);
                            TextEditorView.this.updateOperationDrawable(true);
                            TextEditorView.this.invalidate();
                            return;
                        }
                        return;
                    case DELETE:
                    case SCALE:
                        return;
                    case EDIT:
                        TextEditorView.this.notifyItemEdit();
                        return;
                    default:
                        if (!this.mCurrentConfig.contains(this.mPointTemp1[0], this.mPointTemp1[1])) {
                            TextEditorView.this.clearActivation(true);
                            return;
                        } else {
                            TextEditorView.this.notifyItemEdit();
                            return;
                        }
                }
            }
        }
    }

    public interface TextEditorListener {
        void onClear();

        void onItemEdit();

        void onModify();
    }

    public static class TextEntry implements Parcelable {
        public static final Creator<TextEntry> CREATOR = new Creator<TextEntry>() {
            public TextEntry createFromParcel(Parcel parcel) {
                return new TextEntry(parcel);
            }

            public TextEntry[] newArray(int i) {
                return new TextEntry[i];
            }
        };
        private List<ITextDialogConfig> mITextDialogConfigList;
        private RectF mRectF = new RectF();
        private Resources mResource;

        TextEntry(RectF rectF, List<ITextDialogConfig> list, Resources resources) {
            this.mRectF.set(rectF);
            this.mITextDialogConfigList = new ArrayList(list);
            this.mResource = resources;
        }

        protected TextEntry(Parcel parcel) {
            this.mRectF = (RectF) parcel.readParcelable(RectF.class.getClassLoader());
            this.mITextDialogConfigList = new ArrayList();
            parcel.readList(this.mITextDialogConfigList, ITextDialogConfig.class.getClassLoader());
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
            for (ITextDialogConfig iTextDialogConfig : this.mITextDialogConfigList) {
                iTextDialogConfig.setDrawOutline(false);
                iTextDialogConfig.draw(canvas);
            }
            return bitmap;
        }

        public int describeContents() {
            return 0;
        }

        public void writeToParcel(Parcel parcel, int i) {
            parcel.writeParcelable(this.mRectF, i);
            parcel.writeList(this.mITextDialogConfigList);
        }
    }

    private enum TouchAction {
        NONE,
        DELETE,
        SCALE,
        MIRROR,
        EDIT,
        REVERSE_WHITE,
        REVERSE_BLACK
    }

    public TextEditorView(Context context) {
        super(context);
        init(context);
    }

    private void configOperationDecoration(ITextDialogConfig iTextDialogConfig) {
        if (iTextDialogConfig.isWatermark()) {
            this.mOperationDrawable.configActionPosition(Action.EDIT, null, Action.SCALE, iTextDialogConfig.isReverseColor() ? Action.REVERSE_BLACK : Action.REVERSE_WHITE, getResources());
        } else if (!iTextDialogConfig.isDialogEnable()) {
            this.mOperationDrawable.configActionPosition(Action.EDIT, null, Action.SCALE, null, getResources());
        } else {
            this.mOperationDrawable.configActionPosition(Action.EDIT, null, Action.SCALE, Action.MIRROR, getResources());
        }
    }

    /* access modifiers changed from: private */
    public void configOperationPosition(ITextDialogConfig iTextDialogConfig) {
        iTextDialogConfig.getOutLineRect(this.mRectFTemp);
        this.mOperationDrawable.configDecorationPositon(this.mRectFTemp, this.mBitmapGestureParamsHolder.mCanvasMatrix, iTextDialogConfig.getRotateDegrees(), this.mRectFTemp.centerX(), this.mRectFTemp.centerY());
    }

    /* access modifiers changed from: private */
    public void countAndInvalidate(ITextDialogConfig iTextDialogConfig, boolean z, boolean z2) {
        iTextDialogConfig.countLocation(z2, this.mBitmapGestureParamsHolder.mBitmapDisplayInitRect.width());
        if (z) {
            iTextDialogConfig.getOutLineRect(this.mRectFTemp);
            this.mRectFTemp.roundOut(this.mRectTemp);
            invalidate(this.mRectTemp);
            return;
        }
        invalidate();
    }

    /* access modifiers changed from: private */
    public int findActivationIndex() {
        for (int i = 0; i < this.mITextDialogConfigs.size(); i++) {
            if (((ITextDialogConfig) this.mITextDialogConfigs.get(i)).isActivation()) {
                return i;
            }
        }
        return -1;
    }

    /* access modifiers changed from: private */
    public int findItemByEvent(float f, float f2) {
        int i = -1;
        float f3 = -1.0f;
        for (int i2 = 0; i2 < this.mITextDialogConfigs.size(); i2++) {
            ITextDialogConfig iTextDialogConfig = (ITextDialogConfig) this.mITextDialogConfigs.get(i2);
            if (iTextDialogConfig.contains(f, f2)) {
                iTextDialogConfig.getOutLineRect(this.mRectFTemp);
                float distance = getDistance(this.mRectFTemp, f, f2);
                if (f3 == -1.0f) {
                    i = i2;
                    f3 = distance;
                } else if (distance <= f3) {
                    i = i2;
                }
            }
        }
        return i;
    }

    /* access modifiers changed from: private */
    public TouchAction findTouchAction(float f, float f2) {
        int round = Math.round(f);
        int round2 = Math.round(f2);
        this.mOperationDrawable.getDecorationRect(Action.DELETE, this.mRectFTemp);
        float f3 = (float) round;
        float f4 = (float) round2;
        if (this.mRectFTemp.contains(f3, f4)) {
            return TouchAction.DELETE;
        }
        this.mOperationDrawable.getDecorationRect(Action.SCALE, this.mRectFTemp);
        if (this.mRectFTemp.contains(f3, f4)) {
            return TouchAction.SCALE;
        }
        this.mOperationDrawable.getDecorationRect(Action.MIRROR, this.mRectFTemp);
        if (this.mRectFTemp.contains(f3, f4)) {
            return TouchAction.MIRROR;
        }
        this.mOperationDrawable.getDecorationRect(Action.EDIT, this.mRectFTemp);
        if (this.mRectFTemp.contains(f3, f4)) {
            return TouchAction.EDIT;
        }
        this.mOperationDrawable.getDecorationRect(Action.REVERSE_WHITE, this.mRectFTemp);
        if (this.mRectFTemp.contains(f3, f4)) {
            return TouchAction.REVERSE_WHITE;
        }
        this.mOperationDrawable.getDecorationRect(Action.REVERSE_BLACK, this.mRectFTemp);
        return this.mRectFTemp.contains(f3, f4) ? TouchAction.REVERSE_BLACK : TouchAction.NONE;
    }

    private float getDistance(RectF rectF, float f, float f2) {
        return (float) Math.hypot((double) (rectF.centerX() - f), (double) (rectF.centerY() - f2));
    }

    private void init(Context context) {
        this.mContext = context;
        setBackground(null);
        this.mAuxiliaryPaint.setColor(-1);
        this.mAuxiliaryPaint.setStyle(Style.STROKE);
        this.mAuxiliaryPaint.setStrokeWidth(1.0f);
        setFeatureGestureListener(new GesListener());
        this.mOperationDrawable = new PaintElementOperationDrawable(getResources());
    }

    private void notifyClear() {
        if (this.mTextEditorListener != null) {
            this.mTextEditorListener.onClear();
        }
    }

    /* access modifiers changed from: private */
    public void notifyItemEdit() {
        if (this.mTextEditorListener != null) {
            this.mTextEditorListener.onItemEdit();
        }
    }

    /* access modifiers changed from: private */
    public void notifyModify() {
        if (this.mTextEditorListener != null) {
            this.mTextEditorListener.onModify();
        }
    }

    private void refreshTextConfig() {
        ITextDialogConfig itemTextDialogConfig = getItemTextDialogConfig();
        if (itemTextDialogConfig != null) {
            if (!itemTextDialogConfig.isWatermark()) {
                itemTextDialogConfig.setScaleMultipleOrigin(this.mOriginScale);
            } else {
                WatermarkDialog watermarkDialog = (WatermarkDialog) itemTextDialogConfig;
                watermarkDialog.setScaleMultipleOrigin((this.mBitmapGestureParamsHolder.mBitmapDisplayInitRect.width() / this.mBitmapGestureParamsHolder.mDisplayInitRect.width()) / 0.95f);
                watermarkDialog.setBitmapSize(this.mBitmapGestureParamsHolder.mBitmapDisplayInitRect.width(), this.mBitmapGestureParamsHolder.mBitmapDisplayInitRect.height());
            }
            itemTextDialogConfig.setDisplaySize((float) getWidth(), (float) getHeight());
            countAndInvalidate(itemTextDialogConfig, false, true);
            configOperationPosition((ITextDialogConfig) this.mITextDialogConfigs.get(this.mCurrentIndex));
        }
    }

    private void setCanvasOffsetY(float f) {
        this.mCanvasOffsetY = f;
    }

    /* access modifiers changed from: private */
    public void updateOperationDrawable(boolean z) {
        this.mOperationDrawable.configActionPosition(Action.EDIT, null, Action.SCALE, z ? Action.REVERSE_WHITE : Action.REVERSE_BLACK, getResources());
    }

    public void addNewItem(TextConfig textConfig) {
        ITextDialogConfig iTextDialogConfig;
        if (textConfig == null || !textConfig.isWatermark()) {
            ITextDialogConfig textAppendConfig = new TextAppendConfig(this.mContext);
            textAppendConfig.setScaleMultipleOrigin(this.mOriginScale);
            iTextDialogConfig = textAppendConfig;
        } else {
            WatermarkDialog watermarkDialog = new WatermarkDialog(getResources(), textConfig.getWatermarkInfo(), (this.mBitmapGestureParamsHolder.mBitmapDisplayInitRect.width() / this.mBitmapGestureParamsHolder.mDisplayInitRect.width()) / 0.95f);
            watermarkDialog.init();
            watermarkDialog.setBitmapSize(this.mBitmapGestureParamsHolder.mBitmapDisplayInitRect.width(), this.mBitmapGestureParamsHolder.mBitmapDisplayInitRect.height());
            watermarkDialog.setBitmapLoadingListener(new BitmapLoadingListener() {
                public final void onCompleted() {
                    TextEditorView.this.invalidate();
                }
            });
            watermarkDialog.setPaddingTop(getPaddingTop());
            iTextDialogConfig = watermarkDialog;
        }
        this.mITextDialogConfigs.add(iTextDialogConfig);
        iTextDialogConfig.setDisplaySize((float) getWidth(), (float) getHeight());
        countAndInvalidate(iTextDialogConfig, false, true);
        setLastItemActivation();
    }

    public void clearActivation(boolean z) {
        int i = 0;
        while (i < this.mITextDialogConfigs.size()) {
            ITextDialogConfig iTextDialogConfig = (ITextDialogConfig) this.mITextDialogConfigs.get(i);
            if (iTextDialogConfig.getText() == null) {
                int i2 = i - 1;
                this.mITextDialogConfigs.remove(i);
                notifyClear();
                i = i2;
            } else {
                iTextDialogConfig.setDrawOutline(false);
                iTextDialogConfig.setActivation(false);
            }
            i++;
        }
        this.mCurrentIndex = -1;
        disableChildHandleMode();
        if (z) {
            invalidate();
        }
    }

    /* access modifiers changed from: protected */
    public void drawChild(Canvas canvas) {
        canvas.save();
        canvas.concat(this.mBitmapGestureParamsHolder.mCanvasMatrix);
        canvas.clipRect(this.mBitmapGestureParamsHolder.mBitmapDisplayInitRect);
        Log.d("TextEditorView", "drawChild size : %d", (Object) Integer.valueOf(this.mITextDialogConfigs.size()));
        for (ITextDialogConfig iTextDialogConfig : this.mITextDialogConfigs) {
            if (!iTextDialogConfig.isActivation()) {
                iTextDialogConfig.draw(canvas);
            }
        }
        canvas.restore();
        if (this.mCurrentIndex != -1) {
            canvas.save();
            canvas.concat(this.mBitmapGestureParamsHolder.mCanvasMatrix);
            canvas.clipRect(this.mBitmapGestureParamsHolder.mBitmapDisplayInitRect);
            canvas.translate(0.0f, this.mCanvasOffsetY);
            ((ITextDialogConfig) this.mITextDialogConfigs.get(this.mCurrentIndex)).draw(canvas);
            canvas.restore();
            canvas.save();
            canvas.clipRect(this.mBitmapGestureParamsHolder.mBitmapDisplayRect);
            canvas.translate(0.0f, this.mCanvasOffsetY);
            this.mOperationDrawable.draw(canvas);
            canvas.restore();
        }
    }

    public void enableStatusForCurrentItem(DialogStatusData dialogStatusData, boolean z) {
        if (isIndexValid(this.mCurrentIndex)) {
            ITextDialogConfig iTextDialogConfig = (ITextDialogConfig) this.mITextDialogConfigs.get(this.mCurrentIndex);
            iTextDialogConfig.setDialogWithStatusData(dialogStatusData);
            if (z) {
                float centerX = this.mBitmapGestureParamsHolder.mDisplayRect.centerX();
                float centerY = this.mBitmapGestureParamsHolder.mDisplayRect.centerY();
                float centerX2 = this.mBitmapGestureParamsHolder.mDisplayInsideRect.centerX();
                float centerY2 = this.mBitmapGestureParamsHolder.mDisplayInsideRect.centerY();
                iTextDialogConfig.appendUserLocationX(centerX2 - centerX);
                iTextDialogConfig.appendUserLocationY(centerY2 - centerY);
            }
            countAndInvalidate(iTextDialogConfig, false, true);
            configOperationPosition(iTextDialogConfig);
        }
    }

    public TextEntry export() {
        return new TextEntry(this.mBitmapGestureParamsHolder.mBitmapDisplayInitRect, this.mITextDialogConfigs, getResources());
    }

    public int getActivationItemBottom() {
        getLocationInWindow(this.mLocation);
        int i = this.mLocation[1];
        return this.mCurrentIndex != -1 ? (int) (((float) i) + this.mOperationDrawable.findLowerDecorationPosition()) : i;
    }

    public void getCurrentItemStatus(DialogStatusData dialogStatusData) {
        if (!isIndexValid(this.mCurrentIndex)) {
            dialogStatusData.setEmpty();
            return;
        }
        ITextDialogConfig iTextDialogConfig = (ITextDialogConfig) this.mITextDialogConfigs.get(this.mCurrentIndex);
        dialogStatusData.color = iTextDialogConfig.getColor();
        dialogStatusData.transparentProgress = iTextDialogConfig.getTextTransparent();
        dialogStatusData.textStyle = iTextDialogConfig.getTextStyle();
        dialogStatusData.textBold = iTextDialogConfig.isBoldText();
        dialogStatusData.textShadow = iTextDialogConfig.isShadow();
        dialogStatusData.textAlignment = iTextDialogConfig.getTextAlignment();
        dialogStatusData.itemPositionX = iTextDialogConfig.getUserLocationX();
        dialogStatusData.itemPositionY = iTextDialogConfig.getUserLocationY();
        dialogStatusData.itemScale = iTextDialogConfig.getUserScaleMultiple();
        dialogStatusData.itemDegree = iTextDialogConfig.getRotateDegrees();
    }

    public void getDialogStatusData(DialogStatusData dialogStatusData) {
        if (!isIndexValid(this.mCurrentIndex)) {
            dialogStatusData.setEmpty();
        } else {
            ((ITextDialogConfig) this.mITextDialogConfigs.get(this.mCurrentIndex)).getDialogStatusData(dialogStatusData);
        }
    }

    public TextAlignment getItemAlignment() {
        return !isIndexValid(this.mCurrentIndex) ? TextAlignment.LEFT : ((ITextDialogConfig) this.mITextDialogConfigs.get(this.mCurrentIndex)).getTextAlignment();
    }

    public boolean getItemBold() {
        if (!isIndexValid(this.mCurrentIndex)) {
            return false;
        }
        return ((ITextDialogConfig) this.mITextDialogConfigs.get(this.mCurrentIndex)).isBoldText();
    }

    public int getItemColor() {
        if (!isIndexValid(this.mCurrentIndex)) {
            return 0;
        }
        return ((ITextDialogConfig) this.mITextDialogConfigs.get(this.mCurrentIndex)).getColor();
    }

    public BaseDialogModel getItemDialogModel() {
        if (!isIndexValid(this.mCurrentIndex)) {
            return null;
        }
        return ((ITextDialogConfig) this.mITextDialogConfigs.get(this.mCurrentIndex)).getDialogModel();
    }

    public boolean getItemShadow() {
        if (!isIndexValid(this.mCurrentIndex)) {
            return false;
        }
        return ((ITextDialogConfig) this.mITextDialogConfigs.get(this.mCurrentIndex)).isShadow();
    }

    public String getItemText() {
        return !isIndexValid(this.mCurrentIndex) ? "" : ((ITextDialogConfig) this.mITextDialogConfigs.get(this.mCurrentIndex)).getText();
    }

    public ITextDialogConfig getItemTextDialogConfig() {
        if (!isIndexValid(this.mCurrentIndex)) {
            return null;
        }
        return (ITextDialogConfig) this.mITextDialogConfigs.get(this.mCurrentIndex);
    }

    public float getItemTransparent() {
        if (!isIndexValid(this.mCurrentIndex)) {
            return 0.0f;
        }
        return ((ITextDialogConfig) this.mITextDialogConfigs.get(this.mCurrentIndex)).getTextTransparent();
    }

    public boolean isEmpty() {
        return this.mITextDialogConfigs.isEmpty();
    }

    public boolean isIndexValid(int i) {
        return i >= 0 && i < this.mITextDialogConfigs.size();
    }

    public boolean isItemActivation() {
        return this.mCurrentIndex != -1;
    }

    public void offsetWithAnimator(float f) {
        if (this.mCurrentIndex != -1 && this.mCurrentTargetOffsetY != f) {
            if (this.mOffsetAnimator != null) {
                this.mOffsetAnimator.cancel();
            } else {
                this.mOffsetAnimator = new ObjectAnimator();
                this.mOffsetAnimator.addUpdateListener(this.mUpdateListener);
            }
            this.mCurrentTargetOffsetY = f;
            this.mOffsetAnimator.setTarget(this);
            this.mOffsetAnimator.setPropertyName("canvasOffsetY");
            this.mOffsetAnimator.setFloatValues(new float[]{this.mCanvasOffsetY, f});
            this.mOffsetAnimator.start();
            Log.d("TextEditorView", "start targetOffset : %f", (Object) Float.valueOf(f));
        }
    }

    /* access modifiers changed from: protected */
    public void onBitmapMatrixChanged() {
        super.onBitmapMatrixChanged();
        this.mOriginScale = this.mBitmapGestureParamsHolder.mBitmapDisplayInitRect.width() / this.mBitmapGestureParamsHolder.mDisplayRect.width();
        if (this.mOriginScale < 0.3f) {
            this.mOriginScale = 0.3f;
        }
        if (this.mITextDialogConfigs.isEmpty()) {
            addNewItem(null);
        } else {
            refreshTextConfig();
        }
    }

    /* access modifiers changed from: protected */
    public void onCanvasMatrixChange() {
        super.onCanvasMatrixChange();
        if (this.mCurrentIndex != -1) {
            configOperationPosition((ITextDialogConfig) this.mITextDialogConfigs.get(this.mCurrentIndex));
        }
    }

    public void removeLastItem() {
        if (this.mITextDialogConfigs.size() > 0) {
            this.mITextDialogConfigs.remove(this.mITextDialogConfigs.size() - 1);
        }
    }

    public void setActivation(int i) {
        clearActivation(false);
        if (i >= 0 && i < this.mITextDialogConfigs.size() && !((ITextDialogConfig) this.mITextDialogConfigs.get(i)).isActivation()) {
            ITextDialogConfig iTextDialogConfig = (ITextDialogConfig) this.mITextDialogConfigs.get(i);
            iTextDialogConfig.setActivation(true);
            iTextDialogConfig.setDrawOutline(true);
            countAndInvalidate(iTextDialogConfig, false, false);
            configOperationDecoration(iTextDialogConfig);
            configOperationPosition(iTextDialogConfig);
            this.mCurrentIndex = i;
            enableChildHandleMode();
            invalidate();
        }
    }

    public void setItemBold(boolean z) {
        if (isIndexValid(this.mCurrentIndex)) {
            ITextDialogConfig iTextDialogConfig = (ITextDialogConfig) this.mITextDialogConfigs.get(this.mCurrentIndex);
            iTextDialogConfig.setBoldText(z);
            iTextDialogConfig.setActivation(true);
            countAndInvalidate(iTextDialogConfig, false, true);
        }
    }

    public void setItemDialogModel(BaseDialogModel baseDialogModel) {
        if (isIndexValid(this.mCurrentIndex)) {
            ITextDialogConfig iTextDialogConfig = (ITextDialogConfig) this.mITextDialogConfigs.get(this.mCurrentIndex);
            iTextDialogConfig.setActivation(true);
            iTextDialogConfig.setDialogModel(baseDialogModel, getResources());
            countAndInvalidate(iTextDialogConfig, false, true);
            configOperationDecoration(iTextDialogConfig);
            configOperationPosition(iTextDialogConfig);
        }
    }

    public void setItemShadow(boolean z) {
        if (isIndexValid(this.mCurrentIndex)) {
            ITextDialogConfig iTextDialogConfig = (ITextDialogConfig) this.mITextDialogConfigs.get(this.mCurrentIndex);
            iTextDialogConfig.setShadow(z);
            iTextDialogConfig.setActivation(true);
            countAndInvalidate(iTextDialogConfig, false, true);
        }
    }

    public void setItemText(String str) {
        if (isIndexValid(this.mCurrentIndex)) {
            ITextDialogConfig iTextDialogConfig = (ITextDialogConfig) this.mITextDialogConfigs.get(this.mCurrentIndex);
            if (!TextUtils.equals(str, iTextDialogConfig.getText())) {
                iTextDialogConfig.setActivation(true);
                iTextDialogConfig.setText(str);
                countAndInvalidate(iTextDialogConfig, false, true);
                configOperationPosition(iTextDialogConfig);
            }
        }
    }

    public void setItemTextAlignment(TextAlignment textAlignment) {
        if (isIndexValid(this.mCurrentIndex)) {
            ITextDialogConfig iTextDialogConfig = (ITextDialogConfig) this.mITextDialogConfigs.get(this.mCurrentIndex);
            iTextDialogConfig.setTextAlignment(textAlignment);
            iTextDialogConfig.setActivation(true);
            countAndInvalidate(iTextDialogConfig, false, false);
        }
    }

    public void setItemTextColor(int i) {
        if (isIndexValid(this.mCurrentIndex)) {
            ITextDialogConfig iTextDialogConfig = (ITextDialogConfig) this.mITextDialogConfigs.get(this.mCurrentIndex);
            iTextDialogConfig.setActivation(true);
            iTextDialogConfig.setColor(i);
            countAndInvalidate(iTextDialogConfig, true, false);
        }
    }

    public void setItemTransparent(float f) {
        if (isIndexValid(this.mCurrentIndex)) {
            ITextDialogConfig iTextDialogConfig = (ITextDialogConfig) this.mITextDialogConfigs.get(this.mCurrentIndex);
            iTextDialogConfig.setActivation(true);
            iTextDialogConfig.setTextTransparent(f);
            countAndInvalidate(iTextDialogConfig, true, false);
        }
    }

    public void setItemTypeface(TextStyle textStyle) {
        if (isIndexValid(this.mCurrentIndex)) {
            ITextDialogConfig iTextDialogConfig = (ITextDialogConfig) this.mITextDialogConfigs.get(this.mCurrentIndex);
            iTextDialogConfig.setActivation(true);
            iTextDialogConfig.setTextStyle(textStyle);
            countAndInvalidate(iTextDialogConfig, false, true);
        }
    }

    public void setLastItemActivation() {
        setActivation(this.mITextDialogConfigs.size() - 1);
    }

    public void setTextEditorListener(TextEditorListener textEditorListener) {
        this.mTextEditorListener = textEditorListener;
    }
}
