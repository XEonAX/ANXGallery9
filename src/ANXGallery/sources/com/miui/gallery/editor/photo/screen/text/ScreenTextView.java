package com.miui.gallery.editor.photo.screen.text;

import android.animation.ObjectAnimator;
import android.animation.ValueAnimator;
import android.animation.ValueAnimator.AnimatorUpdateListener;
import android.app.Activity;
import android.app.FragmentManager;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.Rect;
import android.graphics.RectF;
import android.text.Editable;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.util.SparseArray;
import android.view.MotionEvent;
import android.view.ScaleGestureDetector;
import com.miui.gallery.R;
import com.miui.gallery.editor.photo.core.imports.doodle.PaintElementOperationDrawable;
import com.miui.gallery.editor.photo.core.imports.doodle.PaintElementOperationDrawable.Action;
import com.miui.gallery.editor.photo.core.imports.text.TextAppendConfig;
import com.miui.gallery.editor.photo.core.imports.text.TextConfig;
import com.miui.gallery.editor.photo.core.imports.text.TextManager;
import com.miui.gallery.editor.photo.core.imports.text.base.ITextDialogConfig;
import com.miui.gallery.editor.photo.core.imports.text.dialog.BaseDialogModel;
import com.miui.gallery.editor.photo.core.imports.text.editdialog.TextEditDialog;
import com.miui.gallery.editor.photo.core.imports.text.editdialog.TextEditDialog.ConfigChangeListener;
import com.miui.gallery.editor.photo.core.imports.text.model.DialogStatusData;
import com.miui.gallery.editor.photo.core.imports.text.typeface.TextStyle;
import com.miui.gallery.editor.photo.core.imports.text.utils.AutoLineLayout.TextAlignment;
import com.miui.gallery.editor.photo.core.imports.text.watermark.WatermarkDialog;
import com.miui.gallery.editor.photo.core.imports.text.watermark.WatermarkDialog.BitmapLoadingListener;
import com.miui.gallery.editor.photo.screen.base.ScreenBaseGestureView.FeatureGesListener;
import com.miui.gallery.editor.photo.screen.base.ScreenVirtualEditorView;
import com.miui.gallery.editor.photo.screen.home.ScreenEditorView;
import com.miui.gallery.util.Log;
import java.util.ArrayList;
import java.util.List;

public class ScreenTextView extends ScreenVirtualEditorView implements IScreenTextOperation {
    private Paint mAuxiliaryPaint = new Paint(1);
    private String mBubbleText;
    private float mCanvasOffsetY = 0.0f;
    /* access modifiers changed from: private */
    public int mCurrentDialogConfigIndex = -1;
    private int mCurrentMenuItemIndex = 0;
    private float mCurrentTargetOffsetY = 0.0f;
    private FragmentManager mFragmentManager;
    private GesListener mGesListener = new GesListener();
    /* access modifiers changed from: private */
    public List<ITextDialogConfig> mITextDialogConfigs = new ArrayList();
    /* access modifiers changed from: private */
    public boolean mIsTextChanged;
    private int[] mLocation = new int[2];
    private ObjectAnimator mOffsetAnimator;
    /* access modifiers changed from: private */
    public PaintElementOperationDrawable mOperationDrawable;
    private float mOriginScale = 1.0f;
    /* access modifiers changed from: private */
    public RectF mRectFTemp = new RectF();
    private Rect mRectTemp = new Rect();
    private String mRevokeText;
    /* access modifiers changed from: private */
    public StatusListener mStatusListener = new StatusListener();
    private SparseArray<DialogStatusData> mTextConfigDataArray = new SparseArray<>();
    private ScreenTextDrawNode mTextDrawNode;
    private TextEditDialog mTextEditDialog;
    private TextWatcher mTextWatcher = new TextWatcher() {
        public void afterTextChanged(Editable editable) {
        }

        public void beforeTextChanged(CharSequence charSequence, int i, int i2, int i3) {
        }

        public void onTextChanged(CharSequence charSequence, int i, int i2, int i3) {
            ScreenTextView.this.setItemText(charSequence.toString());
            ScreenTextView.this.mStatusListener.onTextChange();
            Log.d("ScreenTextView", "onTextChanged %s", (Object) charSequence);
            if (!ScreenTextView.this.mIsTextChanged) {
                ScreenTextView.this.mIsTextChanged = true;
                ScreenTextView.this.mEditorView.notifyOperationUpdate();
            }
        }
    };
    private AnimatorUpdateListener mUpdateListener = new AnimatorUpdateListener() {
        public void onAnimationUpdate(ValueAnimator valueAnimator) {
            ScreenTextView.this.invalidate();
        }
    };

    private class ConfigListener implements ConfigChangeListener {
        private ConfigListener() {
        }

        public void onBoldChange(boolean z) {
            ScreenTextView.this.setItemBold(z);
        }

        public void onColorChange(int i) {
            ScreenTextView.this.setItemTextColor(i);
        }

        public void onShadowChange(boolean z) {
            ScreenTextView.this.setItemShadow(z);
        }

        public void onTextAlignChange(TextAlignment textAlignment) {
            ScreenTextView.this.setItemTextAlignment(textAlignment);
        }

        public void onTransparentChange(int i) {
            ScreenTextView.this.setItemTransparent(((float) i) / 100.0f);
        }

        public void onTypefaceChange(TextStyle textStyle) {
            ScreenTextView.this.setItemTypeface(textStyle);
        }
    }

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

        /* JADX WARNING: Code restructure failed: missing block: B:13:0x0055, code lost:
            if (r5 > 0.0f) goto L_0x0067;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:17:0x0063, code lost:
            if (r5 < 0.0f) goto L_0x0067;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:4:0x0038, code lost:
            if (r4 > 0.0f) goto L_0x003a;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:9:0x0047, code lost:
            if (r4 < 0.0f) goto L_0x003a;
         */
        /* JADX WARNING: Removed duplicated region for block: B:12:0x0053  */
        /* JADX WARNING: Removed duplicated region for block: B:14:0x0058  */
        private void doScroll(float f, float f2, ITextDialogConfig iTextDialogConfig) {
            if (iTextDialogConfig != null) {
                iTextDialogConfig.getOutLineRect(ScreenTextView.this.mRectFTemp);
                ScreenTextView.this.getBitmapGestureParamsHolder().mCanvasMatrix.mapRect(ScreenTextView.this.mRectFTemp);
                int rectOverScrollStatus = ScreenTextView.this.mEditorView.getRectOverScrollStatus(ScreenTextView.this.mRectFTemp);
                ScreenTextView.this.mEditorView;
                float f3 = 0.0f;
                if ((rectOverScrollStatus & 8) == 0) {
                    ScreenTextView.this.mEditorView;
                    if ((rectOverScrollStatus & 4) != 0) {
                    }
                    ScreenTextView.this.mEditorView;
                    if ((rectOverScrollStatus & 2) != 0) {
                        ScreenTextView.this.mEditorView;
                        if ((rectOverScrollStatus & 1) != 0) {
                        }
                    }
                    f3 = f2;
                    iTextDialogConfig.appendUserLocationX(-f);
                    iTextDialogConfig.appendUserLocationY(-f3);
                    ScreenTextView.this.countAndInvalidate(iTextDialogConfig, false, false);
                    ScreenTextView.this.configOperationPosition(this.mCurrentConfig);
                    this.mCurrentConfig.setDrawOutline(false);
                    ScreenTextView.this.mOperationDrawable.setDrawDecoration(false);
                    ScreenTextView.this.invalidate();
                }
                f = 0.0f;
                ScreenTextView.this.mEditorView;
                if ((rectOverScrollStatus & 2) != 0) {
                }
                f3 = f2;
                iTextDialogConfig.appendUserLocationX(-f);
                iTextDialogConfig.appendUserLocationY(-f3);
                ScreenTextView.this.countAndInvalidate(iTextDialogConfig, false, false);
                ScreenTextView.this.configOperationPosition(this.mCurrentConfig);
                this.mCurrentConfig.setDrawOutline(false);
                ScreenTextView.this.mOperationDrawable.setDrawDecoration(false);
                ScreenTextView.this.invalidate();
            }
        }

        public void onActionUp(float f, float f2) {
            int access$3000 = ScreenTextView.this.findActivationIndex();
            if (access$3000 >= 0) {
                ITextDialogConfig iTextDialogConfig = (ITextDialogConfig) ScreenTextView.this.mITextDialogConfigs.get(access$3000);
                iTextDialogConfig.refreshRotateDegree();
                iTextDialogConfig.setDrawOutline(true);
                ScreenTextView.this.countAndInvalidate(iTextDialogConfig, true, false);
            }
            ScreenTextView.this.mOperationDrawable.setDrawDecoration(true);
            ScreenTextView.this.invalidate();
        }

        public boolean onDown(MotionEvent motionEvent) {
            ScreenTextView.this.mEditorView.convertPointToViewPortCoordinate(motionEvent, this.mPointTemp1);
            this.mDownX = this.mPointTemp1[0];
            this.mDownY = this.mPointTemp1[1];
            this.mDownIndex = ScreenTextView.this.findItemByEvent(this.mDownX, this.mDownY);
            if (this.mDownIndex != -1) {
                this.mDownConfig = (ITextDialogConfig) ScreenTextView.this.mITextDialogConfigs.get(this.mDownIndex);
                this.mDownConfig.getOutLineRect(this.mRectF);
            } else {
                this.mDownConfig = null;
            }
            if (ScreenTextView.this.mCurrentDialogConfigIndex != -1) {
                this.mTouchAction = ScreenTextView.this.findTouchAction(motionEvent.getX(), motionEvent.getY());
                this.mCurrentConfig = (ITextDialogConfig) ScreenTextView.this.mITextDialogConfigs.get(ScreenTextView.this.mCurrentDialogConfigIndex);
                this.mCenterX = -1.0f;
                this.mNeedInit = true;
                this.mCurrentConfig.getOutLineRect(this.mRectF);
            } else {
                this.mTouchAction = TouchAction.NONE;
                this.mCurrentConfig = null;
            }
            Log.d("ScreenTextView", "mTouchAction : %s", (Object) this.mTouchAction);
            return true;
        }

        public boolean onScale(ScaleGestureDetector scaleGestureDetector) {
            if (this.mCurrentConfig != null) {
                this.mCurrentConfig.setUserScaleMultiple(this.mCurrentConfig.getUserScaleMultiple() * scaleGestureDetector.getScaleFactor());
            }
            ScreenTextView.this.invalidate();
            return false;
        }

        public boolean onScaleBegin(ScaleGestureDetector scaleGestureDetector) {
            if (ScreenTextView.this.mCurrentDialogConfigIndex != -1) {
                this.mCurrentConfig = (ITextDialogConfig) ScreenTextView.this.mITextDialogConfigs.get(ScreenTextView.this.mCurrentDialogConfigIndex);
            } else {
                this.mCurrentConfig = null;
            }
            return false;
        }

        public void onScaleEnd(ScaleGestureDetector scaleGestureDetector) {
        }

        public void onScroll(MotionEvent motionEvent, MotionEvent motionEvent2, float f, float f2) {
            ScreenTextView.this.mEditorView.convertPointToViewPortCoordinate(motionEvent, this.mPointTemp1);
            ScreenTextView.this.mEditorView.convertPointToViewPortCoordinate(motionEvent2, this.mPointTemp2);
            float f3 = this.mPointTemp2[0];
            float f4 = this.mPointTemp2[1];
            float f5 = this.mPointTemp1[0];
            float f6 = this.mPointTemp1[1];
            float convertDistanceX = ScreenTextView.this.mEditorView.convertDistanceX(f);
            float convertDistanceY = ScreenTextView.this.mEditorView.convertDistanceY(f2);
            if (AnonymousClass3.$SwitchMap$com$miui$gallery$editor$photo$screen$text$ScreenTextView$TouchAction[this.mTouchAction.ordinal()] == 5) {
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
                ScreenTextView.this.mOperationDrawable.setDrawDecoration(false);
                ScreenTextView.this.countAndInvalidate(this.mCurrentConfig, false, false);
            } else if (ScreenTextView.this.mCurrentDialogConfigIndex != -1) {
                doScroll(convertDistanceX, convertDistanceY, this.mCurrentConfig);
            } else if (this.mDownIndex != -1) {
                ScreenTextView.this.setActivation(this.mDownIndex);
                this.mCurrentConfig = (ITextDialogConfig) ScreenTextView.this.mITextDialogConfigs.get(this.mDownIndex);
                doScroll(convertDistanceX, convertDistanceY, this.mCurrentConfig);
            }
            if (this.mCurrentConfig != null) {
                ScreenTextView.this.configOperationPosition(this.mCurrentConfig);
            }
        }

        public void onSingleTapUp(MotionEvent motionEvent) {
            Log.d("ScreenTextView", "click number： %d", (Object) Integer.valueOf(this.mDownIndex));
            ScreenTextView.this.mEditorView.convertPointToViewPortCoordinate(motionEvent, this.mPointTemp1);
            if (ScreenTextView.this.mCurrentDialogConfigIndex == -1) {
                if (this.mDownIndex != -1) {
                    ScreenTextView.this.setActivation(this.mDownIndex);
                }
            } else if (this.mCurrentConfig != null) {
                switch (this.mTouchAction) {
                    case MIRROR:
                        if (this.mCurrentConfig.isDialogEnable()) {
                            this.mCurrentConfig.toggleMirror();
                            ScreenTextView.this.countAndInvalidate(this.mCurrentConfig, true, true);
                            return;
                        }
                        return;
                    case REVERSE_WHITE:
                        if (this.mCurrentConfig.isWatermark()) {
                            this.mCurrentConfig.reverseColor(-16777216);
                            ScreenTextView.this.updateOperationDrawable(false);
                            ScreenTextView.this.invalidate();
                            return;
                        }
                        return;
                    case REVERSE_BLACK:
                        if (this.mCurrentConfig.isWatermark()) {
                            this.mCurrentConfig.reverseColor(-1);
                            ScreenTextView.this.updateOperationDrawable(true);
                            ScreenTextView.this.invalidate();
                            return;
                        }
                        return;
                    case DELETE:
                    case SCALE:
                        return;
                    case EDIT:
                        ScreenTextView.this.onItemEdit();
                        return;
                    default:
                        if (!this.mCurrentConfig.contains(this.mPointTemp1[0], this.mPointTemp1[1])) {
                            ScreenTextView.this.clearActivation(true);
                            return;
                        } else {
                            ScreenTextView.this.onItemEdit();
                            return;
                        }
                }
            }
        }
    }

    private class StatusListener implements com.miui.gallery.editor.photo.core.imports.text.editdialog.TextEditDialog.StatusListener {
        private int mDialogBottom;

        private StatusListener() {
        }

        public void onBottomChange(int i) {
            this.mDialogBottom = i;
            Log.d("ScreenTextView", "onBottomChange: %d", (Object) Integer.valueOf(i));
            int activationItemBottom = ScreenTextView.this.getActivationItemBottom();
            Log.d("ScreenTextView", "text bottom: %d", (Object) Integer.valueOf(activationItemBottom));
            if (activationItemBottom > i) {
                ScreenTextView.this.offsetWithAnimator((float) (i - activationItemBottom));
            } else {
                ScreenTextView.this.offsetWithAnimator(0.0f);
            }
        }

        public void onDismiss() {
        }

        public void onShow() {
        }

        /* access modifiers changed from: 0000 */
        public void onTextChange() {
            onBottomChange(this.mDialogBottom);
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

    public ScreenTextView(ScreenEditorView screenEditorView) {
        super(screenEditorView);
    }

    private void addNewDrawNode() {
        this.mTextDrawNode = new ScreenTextDrawNode();
        updateDrawNode();
    }

    private void addNewItem(TextConfig textConfig) {
        ITextDialogConfig iTextDialogConfig;
        if (textConfig == null || !textConfig.isWatermark()) {
            ITextDialogConfig textAppendConfig = new TextAppendConfig(this.mContext);
            this.mOriginScale = ((1.0f / getBitmapGestureParamsHolder().getMatrixValues()[0]) * getBitmapGestureParamsHolder().mBitmapDisplayRect.width()) / getBitmapGestureParamsHolder().mDisplayRect.width();
            if (this.mOriginScale < 0.3f) {
                this.mOriginScale = 0.3f;
            }
            textAppendConfig.setScaleMultipleOrigin(this.mOriginScale);
            iTextDialogConfig = textAppendConfig;
        } else {
            WatermarkDialog watermarkDialog = new WatermarkDialog(this.mContext.getResources(), textConfig.getWatermarkInfo(), (getBitmapGestureParamsHolder().mBitmapDisplayInitRect.width() / getBitmapGestureParamsHolder().mDisplayInitRect.width()) / 0.95f);
            watermarkDialog.setBitmapSize(getBitmapGestureParamsHolder().mBitmapDisplayInitRect.width(), getBitmapGestureParamsHolder().mBitmapDisplayInitRect.height());
            watermarkDialog.setBitmapLoadingListener(new BitmapLoadingListener() {
                public final void onCompleted() {
                    ScreenTextView.this.invalidate();
                }
            });
            watermarkDialog.setPaddingTop(this.mEditorView.getPaddingTop());
            iTextDialogConfig = watermarkDialog;
        }
        if (!TextUtils.isEmpty(this.mBubbleText)) {
            iTextDialogConfig.setText(this.mBubbleText);
        }
        this.mITextDialogConfigs.add(iTextDialogConfig);
        iTextDialogConfig.setDisplaySize(0.0f, 0.0f);
        countAndInvalidate(iTextDialogConfig, false, true);
        setLastItemActivation();
    }

    /* access modifiers changed from: private */
    public void clearActivation(boolean z) {
        int i = 0;
        while (i < this.mITextDialogConfigs.size()) {
            ITextDialogConfig iTextDialogConfig = (ITextDialogConfig) this.mITextDialogConfigs.get(i);
            if (TextUtils.isEmpty(iTextDialogConfig.getText())) {
                int i2 = i - 1;
                this.mITextDialogConfigs.remove(i);
                clear();
                i = i2;
            } else {
                iTextDialogConfig.setDrawOutline(false);
                iTextDialogConfig.setActivation(false);
            }
            i++;
        }
        this.mCurrentDialogConfigIndex = -1;
        this.mEditorView.disableChildHandleMode();
        if (z) {
            invalidate();
        }
    }

    private void configOperationDecoration(ITextDialogConfig iTextDialogConfig) {
        if (iTextDialogConfig.isWatermark()) {
            this.mOperationDrawable.configActionPosition(Action.EDIT, null, Action.SCALE, iTextDialogConfig.isReverseColor() ? Action.REVERSE_BLACK : Action.REVERSE_WHITE, this.mContext.getResources());
        } else if (!iTextDialogConfig.isDialogEnable()) {
            this.mOperationDrawable.configActionPosition(Action.EDIT, null, Action.SCALE, null, this.mContext.getResources());
        } else {
            this.mOperationDrawable.configActionPosition(Action.EDIT, null, Action.SCALE, Action.MIRROR, this.mContext.getResources());
        }
    }

    /* access modifiers changed from: private */
    public void configOperationPosition(ITextDialogConfig iTextDialogConfig) {
        iTextDialogConfig.getOutLineRect(this.mRectFTemp);
        this.mOperationDrawable.configDecorationPositon(this.mRectFTemp, getBitmapGestureParamsHolder().mCanvasMatrix, iTextDialogConfig.getRotateDegrees(), this.mRectFTemp.centerX(), this.mRectFTemp.centerY());
    }

    /* access modifiers changed from: private */
    public void countAndInvalidate(ITextDialogConfig iTextDialogConfig, boolean z, boolean z2) {
        iTextDialogConfig.countLocation(z2, getBitmapGestureParamsHolder().mBitmapDisplayInitRect.width());
        if (z) {
            iTextDialogConfig.getOutLineRect(this.mRectFTemp);
            this.mRectFTemp.roundOut(this.mRectTemp);
            this.mEditorView.invalidate(this.mRectTemp);
            return;
        }
        invalidate();
    }

    private void doEditorExit() {
        this.mEditorView.removeRevokedDrawNode(this.mTextDrawNode);
        if (!this.mIsTextChanged) {
            removeLastItem();
            this.mTextDrawNode = null;
            this.mCurrentDialogConfigIndex = -1;
        } else {
            this.mTextDrawNode.setSaved(true);
            addDrawNode(this.mTextDrawNode);
        }
        clear();
    }

    private void enableStatusForCurrentItem(DialogStatusData dialogStatusData, boolean z) {
        if (isIndexValid(this.mCurrentDialogConfigIndex)) {
            ITextDialogConfig iTextDialogConfig = (ITextDialogConfig) this.mITextDialogConfigs.get(this.mCurrentDialogConfigIndex);
            iTextDialogConfig.setDialogWithStatusData(dialogStatusData);
            if (z) {
                float centerX = getBitmapGestureParamsHolder().mDisplayInsideRect.centerX();
                float centerY = getBitmapGestureParamsHolder().mDisplayInsideRect.centerY();
                iTextDialogConfig.setUserLocationX(centerX);
                iTextDialogConfig.setUserLocationY(centerY);
            }
            countAndInvalidate(iTextDialogConfig, false, false);
            configOperationPosition(iTextDialogConfig);
        }
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

    private void getCurrentItemStatus(DialogStatusData dialogStatusData) {
        if (!isIndexValid(this.mCurrentDialogConfigIndex)) {
            dialogStatusData.setEmpty();
            return;
        }
        ITextDialogConfig iTextDialogConfig = (ITextDialogConfig) this.mITextDialogConfigs.get(this.mCurrentDialogConfigIndex);
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

    private void getDialogStatusData(DialogStatusData dialogStatusData) {
        if (!isIndexValid(this.mCurrentDialogConfigIndex)) {
            dialogStatusData.setEmpty();
        } else {
            ((ITextDialogConfig) this.mITextDialogConfigs.get(this.mCurrentDialogConfigIndex)).getDialogStatusData(dialogStatusData);
        }
    }

    private float getDistance(RectF rectF, float f, float f2) {
        return (float) Math.hypot((double) (rectF.centerX() - f), (double) (rectF.centerY() - f2));
    }

    private String getItemTextDialogConfig() {
        return !isIndexValid(this.mCurrentDialogConfigIndex) ? "" : ((ITextDialogConfig) this.mITextDialogConfigs.get(this.mCurrentDialogConfigIndex)).getText();
    }

    private DialogStatusData getTextConfigDataByIndex(int i) {
        DialogStatusData dialogStatusData = (DialogStatusData) this.mTextConfigDataArray.get(i);
        if (dialogStatusData != null) {
            return dialogStatusData;
        }
        DialogStatusData dialogStatusData2 = new DialogStatusData();
        dialogStatusData2.setEmpty();
        this.mTextConfigDataArray.put(i, dialogStatusData2);
        return dialogStatusData2;
    }

    private void init() {
        this.mTextEditDialog = new TextEditDialog();
        this.mTextEditDialog.setConfigChangeListener(new ConfigListener());
        this.mTextEditDialog.setTextWatch(this.mTextWatcher);
        this.mTextEditDialog.setStatusListener(this.mStatusListener);
        this.mAuxiliaryPaint.setColor(-1);
        this.mAuxiliaryPaint.setStyle(Style.STROKE);
        this.mAuxiliaryPaint.setStrokeWidth(1.0f);
        this.mEditorView.setFeatureGestureListener(this.mGesListener);
        this.mOperationDrawable = new PaintElementOperationDrawable(this.mContext.getResources());
        if (this.mContext instanceof Activity) {
            this.mFragmentManager = ((Activity) this.mContext).getFragmentManager();
        }
        TextConfig defaultTextConfig = TextManager.getDefaultTextConfig();
        addNewItem(defaultTextConfig);
        performSetDialog(defaultTextConfig, 0);
    }

    private boolean isIndexValid(int i) {
        return i >= 0 && i < this.mITextDialogConfigs.size();
    }

    private boolean isItemActivation() {
        return this.mCurrentDialogConfigIndex != -1;
    }

    private void performSetDialog(TextConfig textConfig, int i) {
        boolean z;
        BaseDialogModel baseDialogModel = textConfig.getBaseDialogModel();
        DialogStatusData dialogStatusData = (DialogStatusData) this.mTextConfigDataArray.get(i);
        if (dialogStatusData == null) {
            dialogStatusData = getTextConfigDataByIndex(i);
            if (textConfig.isWatermark()) {
                dialogStatusData.watermarkInitSelf(textConfig.getWatermarkInfo());
            } else {
                dialogStatusData.configSelfByInit(baseDialogModel);
            }
            z = true;
        } else {
            z = false;
        }
        if (!textConfig.isWatermark() && this.mBubbleText != null) {
            dialogStatusData.text = this.mBubbleText;
        }
        enableStatusForCurrentItem(dialogStatusData, z);
        this.mCurrentMenuItemIndex = i;
        setItemDialogModel(baseDialogModel);
    }

    private void removeLastItem() {
        if (this.mITextDialogConfigs.size() > 0) {
            this.mITextDialogConfigs.remove(this.mITextDialogConfigs.size() - 1);
        }
    }

    /* access modifiers changed from: private */
    public void setItemBold(boolean z) {
        if (isIndexValid(this.mCurrentDialogConfigIndex)) {
            ITextDialogConfig iTextDialogConfig = (ITextDialogConfig) this.mITextDialogConfigs.get(this.mCurrentDialogConfigIndex);
            iTextDialogConfig.setBoldText(z);
            iTextDialogConfig.setActivation(true);
            countAndInvalidate(iTextDialogConfig, false, true);
        }
    }

    private void setItemDialogModel(BaseDialogModel baseDialogModel) {
        if (isIndexValid(this.mCurrentDialogConfigIndex)) {
            ITextDialogConfig iTextDialogConfig = (ITextDialogConfig) this.mITextDialogConfigs.get(this.mCurrentDialogConfigIndex);
            iTextDialogConfig.setActivation(true);
            iTextDialogConfig.setDialogModel(baseDialogModel, this.mContext.getResources());
            countAndInvalidate(iTextDialogConfig, false, true);
            configOperationDecoration(iTextDialogConfig);
            configOperationPosition(iTextDialogConfig);
        }
    }

    /* access modifiers changed from: private */
    public void setItemShadow(boolean z) {
        if (isIndexValid(this.mCurrentDialogConfigIndex)) {
            ITextDialogConfig iTextDialogConfig = (ITextDialogConfig) this.mITextDialogConfigs.get(this.mCurrentDialogConfigIndex);
            iTextDialogConfig.setShadow(z);
            iTextDialogConfig.setActivation(true);
            countAndInvalidate(iTextDialogConfig, false, true);
        }
    }

    /* access modifiers changed from: private */
    public void setItemTextAlignment(TextAlignment textAlignment) {
        if (isIndexValid(this.mCurrentDialogConfigIndex)) {
            ITextDialogConfig iTextDialogConfig = (ITextDialogConfig) this.mITextDialogConfigs.get(this.mCurrentDialogConfigIndex);
            iTextDialogConfig.setTextAlignment(textAlignment);
            iTextDialogConfig.setActivation(true);
            countAndInvalidate(iTextDialogConfig, false, false);
        }
    }

    /* access modifiers changed from: private */
    public void setItemTextColor(int i) {
        if (isIndexValid(this.mCurrentDialogConfigIndex)) {
            ITextDialogConfig iTextDialogConfig = (ITextDialogConfig) this.mITextDialogConfigs.get(this.mCurrentDialogConfigIndex);
            iTextDialogConfig.setActivation(true);
            iTextDialogConfig.setColor(i);
            countAndInvalidate(iTextDialogConfig, true, false);
        }
    }

    /* access modifiers changed from: private */
    public void setItemTransparent(float f) {
        if (isIndexValid(this.mCurrentDialogConfigIndex)) {
            ITextDialogConfig iTextDialogConfig = (ITextDialogConfig) this.mITextDialogConfigs.get(this.mCurrentDialogConfigIndex);
            iTextDialogConfig.setActivation(true);
            iTextDialogConfig.setTextTransparent(f);
            countAndInvalidate(iTextDialogConfig, true, false);
        }
    }

    /* access modifiers changed from: private */
    public void setItemTypeface(TextStyle textStyle) {
        if (isIndexValid(this.mCurrentDialogConfigIndex)) {
            ITextDialogConfig iTextDialogConfig = (ITextDialogConfig) this.mITextDialogConfigs.get(this.mCurrentDialogConfigIndex);
            iTextDialogConfig.setActivation(true);
            iTextDialogConfig.setTextStyle(textStyle);
            countAndInvalidate(iTextDialogConfig, false, true);
        }
    }

    private void setLastItemActivation() {
        setActivation(this.mITextDialogConfigs.size() - 1);
    }

    private void updateDrawNode() {
        if (this.mTextDrawNode != null) {
            this.mTextDrawNode.setTextDialogConfig((ITextDialogConfig) this.mITextDialogConfigs.get(this.mITextDialogConfigs.size() - 1));
        }
    }

    /* access modifiers changed from: private */
    public void updateOperationDrawable(boolean z) {
        this.mOperationDrawable.configActionPosition(Action.EDIT, null, Action.SCALE, z ? Action.REVERSE_WHITE : Action.REVERSE_BLACK, this.mContext.getResources());
    }

    public void add(TextConfig textConfig, int i) {
        if (i != this.mCurrentMenuItemIndex) {
            getDialogStatusData(getTextConfigDataByIndex(this.mCurrentMenuItemIndex));
            this.mBubbleText = getItemTextDialogConfig();
            removeLastItem();
            addNewItem(textConfig);
            if (!isItemActivation()) {
                setLastItemActivation();
            }
            performSetDialog(textConfig, i);
            updateDrawNode();
        }
    }

    public boolean canRevoke() {
        return this.mIsTextChanged;
    }

    public void canvasMatrixChange() {
        if (isIndexValid(this.mCurrentDialogConfigIndex)) {
            configOperationPosition((ITextDialogConfig) this.mITextDialogConfigs.get(this.mCurrentDialogConfigIndex));
        }
    }

    public void clear() {
        this.mIsTextChanged = false;
        this.mCurrentMenuItemIndex = -1;
        this.mBubbleText = null;
        this.mITextDialogConfigs.clear();
        this.mTextConfigDataArray.clear();
    }

    public void clearActivation() {
        this.mEditorView.disableChildHandleMode();
    }

    public void doRevert() {
        this.mIsTextChanged = true;
        if (isIndexValid(this.mCurrentDialogConfigIndex)) {
            setItemText(this.mRevokeText);
            invalidate();
        }
    }

    public void doRevoke() {
        this.mIsTextChanged = false;
        if (isIndexValid(this.mCurrentDialogConfigIndex)) {
            this.mRevokeText = ((ITextDialogConfig) this.mITextDialogConfigs.get(this.mCurrentDialogConfigIndex)).getText();
            setItemText(this.mContext.getString(R.string.text_append_hint));
            this.mEditorView.addRevokedDrawNode(this.mTextDrawNode);
            invalidate();
        }
    }

    public void drawCurrentNode(Canvas canvas, RectF rectF) {
        if (this.mTextDrawNode != null) {
            this.mTextDrawNode.draw(canvas, rectF);
        }
    }

    public void drawOverlay(Canvas canvas) {
        if (isIndexValid(this.mCurrentDialogConfigIndex)) {
            canvas.save();
            canvas.clipRect(getBitmapGestureParamsHolder().mBitmapDisplayRect);
            this.mOperationDrawable.draw(canvas);
            canvas.restore();
        }
    }

    public int getActivationItemBottom() {
        this.mEditorView.getLocationInWindow(this.mLocation);
        int i = this.mLocation[1];
        return this.mCurrentDialogConfigIndex != -1 ? (int) (((float) i) + this.mOperationDrawable.findLowerDecorationPosition()) : i;
    }

    public int getCurrentMenuItemIndex() {
        return this.mCurrentMenuItemIndex;
    }

    public void offsetWithAnimator(float f) {
        if (this.mCurrentDialogConfigIndex != -1 && this.mCurrentTargetOffsetY != f) {
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
            Log.d("ScreenTextView", "start targetOffset : %f", (Object) Float.valueOf(f));
        }
    }

    public void onChangeOperation(boolean z) {
        if (z) {
            init();
            addNewDrawNode();
        } else {
            clearActivation();
            doEditorExit();
        }
        invalidate();
    }

    public void onDetachedFromWindow() {
    }

    public void onItemEdit() {
        if (!this.mTextEditDialog.isShowing()) {
            String itemTextDialogConfig = getItemTextDialogConfig();
            this.mTextEditDialog.setWillEditText(itemTextDialogConfig, this.mContext.getString(R.string.text_append_hint).equals(itemTextDialogConfig));
            DialogStatusData textConfigDataByIndex = getTextConfigDataByIndex(this.mCurrentMenuItemIndex);
            getCurrentItemStatus(textConfigDataByIndex);
            this.mTextEditDialog.setInitializeData(textConfigDataByIndex);
            this.mTextEditDialog.showAllowingStateLoss(this.mFragmentManager, "TextEditDialog");
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
            this.mCurrentDialogConfigIndex = i;
            this.mEditorView.enableChildHandleMode();
            invalidate();
        }
    }

    public void setItemText(String str) {
        if (isIndexValid(this.mCurrentDialogConfigIndex)) {
            ITextDialogConfig iTextDialogConfig = (ITextDialogConfig) this.mITextDialogConfigs.get(this.mCurrentDialogConfigIndex);
            if (!TextUtils.equals(str, iTextDialogConfig.getText())) {
                iTextDialogConfig.setActivation(true);
                iTextDialogConfig.setText(str);
                countAndInvalidate(iTextDialogConfig, false, true);
                configOperationPosition(iTextDialogConfig);
            }
        }
    }
}
