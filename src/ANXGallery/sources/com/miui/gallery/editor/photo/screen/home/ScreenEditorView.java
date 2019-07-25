package com.miui.gallery.editor.photo.screen.home;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.Canvas;
import android.graphics.RectF;
import android.util.AttributeSet;
import com.miui.gallery.editor.photo.core.common.model.BaseDrawNode;
import com.miui.gallery.editor.photo.core.imports.doodle.DoodleManager;
import com.miui.gallery.editor.photo.core.imports.longcrop.LongScreenshotCropEditorView.Entry;
import com.miui.gallery.editor.photo.screen.base.IScreenOperationEditor;
import com.miui.gallery.editor.photo.screen.base.ScreenBaseGestureView;
import com.miui.gallery.editor.photo.screen.core.ScreenDrawEntry;
import com.miui.gallery.editor.photo.screen.core.ScreenProviderManager;
import com.miui.gallery.editor.photo.screen.core.ScreenRenderData;
import com.miui.gallery.editor.photo.screen.crop.ScreenCropView;
import com.miui.gallery.editor.photo.screen.doodle.ScreenDoodleView;
import com.miui.gallery.editor.photo.screen.mosaic.ScreenMosaicProvider;
import com.miui.gallery.editor.photo.screen.mosaic.ScreenMosaicView;
import com.miui.gallery.editor.photo.screen.text.ScreenTextDrawNode;
import com.miui.gallery.editor.photo.screen.text.ScreenTextView;
import com.miui.gallery.util.Log;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

public class ScreenEditorView extends ScreenBaseGestureView implements IScreenEditorController {
    private ScreenEditViewAnimatorHelper mAnimatorHelper;
    private IScreenOperationEditor mCurrentScreenEditor;
    private List<BaseDrawNode> mDrawNodeList = new ArrayList();
    private boolean mIsLongCrop;
    private List<BaseDrawNode> mLastNodeList = new ArrayList();
    private IScreenOperationEditor mLastScreenEditor;
    private Entry mLongCropEntry = new Entry();
    private RectF mLongCropFullBitmapRect;
    private OperationUpdateListener mOperationUpdateListener;
    private LinkedList<BaseDrawNode> mRevokedNodeList = new LinkedList<>();
    private List<BaseDrawNode> mSavingNodeList = new ArrayList();
    private ScreenCropView mScreenCrop;
    private ScreenDoodleView mScreenDoodle;
    private Callback mScreenEditViewAnimatorCallback = new Callback() {
        public Bitmap getOriginBitmap() {
            return ScreenEditorView.this.mOriginBitmap;
        }

        public RectF getShowRect() {
            return ScreenEditorView.this.getBitmapGestureParamsHolder().mBitmapDisplayInitRect;
        }

        public void onAnimationStart() {
            if (ScreenEditorView.this.mThumbnailAnimatorCallback != null) {
                ScreenEditorView.this.mThumbnailAnimatorCallback.onAnimationStart();
            }
        }

        public void onAnimationUpdate(float f) {
            if (ScreenEditorView.this.mThumbnailAnimatorCallback != null) {
                ScreenEditorView.this.mThumbnailAnimatorCallback.onAnimationUpdate(f);
            }
        }

        public void onInvalidate() {
            ScreenEditorView.this.invalidate();
        }
    };
    private ScreenMosaicView mScreenMosaic;
    private ScreenTextView mScreenText;
    /* access modifiers changed from: private */
    public ThumbnailAnimatorCallback mThumbnailAnimatorCallback;
    private int mTopPixel;

    public ScreenEditorView(Context context) {
        super(context);
    }

    public ScreenEditorView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    public ScreenEditorView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
    }

    private void clearRevokeNode() {
        this.mRevokedNodeList.clear();
    }

    private void drawToDisplayCanvas() {
        if (this.mDrawNodeList.size() > 10) {
            this.mDisplayCanvas.save();
            this.mDisplayCanvas.concat(this.mBitmapGestureParamsHolder.mDisplayToBitmapMatrix);
            for (int i = 0; i < this.mDrawNodeList.size() - 1; i++) {
                ((BaseDrawNode) this.mDrawNodeList.get(i)).draw(this.mDisplayCanvas, getLongCropFullDisplayRect());
            }
            this.mDisplayCanvas.restore();
            BaseDrawNode baseDrawNode = (BaseDrawNode) this.mDrawNodeList.remove(this.mDrawNodeList.size() - 1);
            this.mSavingNodeList.addAll(this.mDrawNodeList);
            this.mDrawNodeList.clear();
            this.mDrawNodeList.add(baseDrawNode);
        }
    }

    private RectF getLongCropFullDisplayRect() {
        return this.mLongCropFullBitmapRect;
    }

    private void setLongCropFullBitmapRect() {
        if (this.mIsLongCrop) {
            RectF rectF = new RectF(this.mBitmapGestureParamsHolder.mBitmapDisplayInitRect);
            float height = rectF.height() / (this.mLongCropEntry.mBottomRatio - this.mLongCropEntry.mTopRatio);
            rectF.top -= this.mLongCropEntry.mTopRatio * height;
            rectF.bottom += height * (1.0f - this.mLongCropEntry.mBottomRatio);
            this.mLongCropFullBitmapRect = rectF;
        }
    }

    public void addDrawNode(BaseDrawNode baseDrawNode) {
        this.mDrawNodeList.add(baseDrawNode);
        baseDrawNode.setBitmapRect(getLongCropFullDisplayRect());
        clearRevokeNode();
        notifyOperationUpdate();
    }

    public void addRevokedDrawNode(BaseDrawNode baseDrawNode) {
        this.mRevokedNodeList.add(baseDrawNode);
    }

    public boolean canRevert() {
        return !this.mRevokedNodeList.isEmpty();
    }

    public boolean canRevoke() {
        boolean z = true;
        if (this.mCurrentScreenEditor == this.mScreenText && this.mScreenText.canRevoke()) {
            return true;
        }
        if (this.mDrawNodeList.isEmpty() && this.mSavingNodeList.isEmpty()) {
            z = false;
        }
        return z;
    }

    public void checkTextEditor(boolean z) {
        if (this.mCurrentScreenEditor == this.mScreenText) {
            this.mScreenText.onChangeOperation(!z);
        }
    }

    public void doRevert() {
        this.mCurrentScreenEditor.clearActivation();
        BaseDrawNode baseDrawNode = (BaseDrawNode) this.mRevokedNodeList.removeLast();
        if (this.mCurrentScreenEditor != this.mScreenText || !(baseDrawNode instanceof ScreenTextDrawNode) || ((ScreenTextDrawNode) baseDrawNode).isSaved()) {
            this.mDrawNodeList.add(baseDrawNode);
            invalidate();
            notifyOperationUpdate();
            return;
        }
        this.mScreenText.doRevert();
        notifyOperationUpdate();
    }

    public void doRevoke() {
        this.mCurrentScreenEditor.clearActivation();
        if (this.mCurrentScreenEditor != this.mScreenText || !this.mScreenText.canRevoke()) {
            if (this.mDrawNodeList.size() <= 0) {
                if (this.mSavingNodeList.size() >= 10) {
                    this.mDrawNodeList.addAll(this.mSavingNodeList.subList(this.mSavingNodeList.size() - 10, this.mSavingNodeList.size()));
                    this.mSavingNodeList = this.mSavingNodeList.subList(0, this.mSavingNodeList.size() - 10);
                } else {
                    this.mDrawNodeList.addAll(this.mSavingNodeList);
                    this.mSavingNodeList.clear();
                }
                refreshDisplayCanvas();
            }
            BaseDrawNode baseDrawNode = (BaseDrawNode) this.mDrawNodeList.get(this.mDrawNodeList.size() - 1);
            this.mDrawNodeList.remove(baseDrawNode);
            this.mRevokedNodeList.add(baseDrawNode);
            invalidate();
            notifyOperationUpdate();
            return;
        }
        this.mScreenText.doRevoke();
        notifyOperationUpdate();
    }

    public IScreenOperationEditor getCurrentScreenEditor() {
        return this.mCurrentScreenEditor;
    }

    public void init() {
        if (!this.mIsLongCrop) {
            this.mScreenCrop = new ScreenCropView(this);
        }
        setCurrentScreenEditor(2);
    }

    public boolean isModified() {
        return this.mDrawNodeList.size() > 0 || this.mSavingNodeList.size() > 0 || (this.mScreenCrop != null && this.mScreenCrop.isModified());
    }

    public boolean isModifiedBaseLast() {
        boolean z = this.mLastNodeList.size() != this.mDrawNodeList.size() + this.mSavingNodeList.size() || !this.mLastNodeList.containsAll(this.mDrawNodeList) || !this.mLastNodeList.containsAll(this.mSavingNodeList);
        this.mLastNodeList.clear();
        this.mLastNodeList.addAll(this.mDrawNodeList);
        this.mLastNodeList.addAll(this.mSavingNodeList);
        if (z) {
            return true;
        }
        return this.mScreenCrop != null && this.mScreenCrop.isModifiedBaseLast();
    }

    public void notifyOperationUpdate() {
        if (this.mOperationUpdateListener != null) {
            this.mOperationUpdateListener.onOperationUpdate(isModified(), canRevoke(), canRevert());
        }
    }

    public void onBitmapMatrixChanged() {
        if (this.mScreenCrop != null) {
            this.mScreenCrop.onStart();
        }
        invalidate();
    }

    public void onCanvasMatrixChange() {
        this.mCurrentScreenEditor.canvasMatrixChange();
        if (this.mScreenCrop != null) {
            this.mScreenCrop.canvasMatrixChange();
        }
        invalidate();
        notifyOperationUpdate();
    }

    /* access modifiers changed from: protected */
    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        if (this.mScreenCrop != null) {
            this.mScreenCrop.onDetachedFromWindow();
        }
        if (this.mScreenText != null) {
            this.mScreenText.onDetachedFromWindow();
        }
        if (this.mScreenDoodle != null) {
            this.mScreenDoodle.onDetachedFromWindow();
        }
        if (this.mScreenMosaic != null) {
            this.mScreenMosaic.onDetachedFromWindow();
        }
        this.mThumbnailAnimatorCallback = null;
    }

    public void onDraw(Canvas canvas) {
        if (this.mDisplayBitmap != null && !this.mDisplayBitmap.isRecycled()) {
            if (this.mAnimatorHelper == null || this.mAnimatorHelper.isAnimatorEnd()) {
                drawToDisplayCanvas();
                canvas.save();
                canvas.concat(this.mBitmapGestureParamsHolder.mCanvasMatrix);
                canvas.drawBitmap(this.mDisplayBitmap, this.mBitmapGestureParamsHolder.mBitmapToDisplayMatrix, this.mBitmapPaint);
                canvas.clipRect(getBitmapGestureParamsHolder().mBitmapDisplayInitRect);
                for (BaseDrawNode draw : this.mDrawNodeList) {
                    draw.draw(canvas, getLongCropFullDisplayRect());
                }
                if (this.mCurrentScreenEditor == this.mScreenText) {
                    this.mScreenText.drawCurrentNode(canvas, getLongCropFullDisplayRect());
                }
                canvas.restore();
                this.mCurrentScreenEditor.drawOverlay(canvas);
                if (this.mScreenCrop != null) {
                    this.mScreenCrop.drawOverlay(canvas);
                }
            } else {
                this.mAnimatorHelper.draw(canvas);
            }
        }
    }

    public ScreenRenderData onExport() {
        ArrayList arrayList = new ArrayList();
        arrayList.addAll(this.mSavingNodeList);
        arrayList.addAll(this.mDrawNodeList);
        return new ScreenRenderData(new ScreenDrawEntry(this.mIsLongCrop, this.mBitmapGestureParamsHolder.mBitmapDisplayInitRect, arrayList), this.mScreenCrop == null ? null : this.mScreenCrop.export());
    }

    /* access modifiers changed from: protected */
    public void refreshDisplayCanvas() {
        this.mDisplayCanvas.drawBitmap(this.mOriginBitmap, 0.0f, (float) (-this.mTopPixel), this.mBitmapPaint);
        this.mDisplayCanvas.save();
        this.mDisplayCanvas.concat(this.mBitmapGestureParamsHolder.mDisplayToBitmapMatrix);
        for (BaseDrawNode draw : this.mSavingNodeList) {
            draw.draw(this.mDisplayCanvas, getLongCropFullDisplayRect());
        }
        this.mDisplayCanvas.restore();
    }

    public void removeDrawNode(BaseDrawNode baseDrawNode) {
        this.mDrawNodeList.remove(baseDrawNode);
        notifyOperationUpdate();
    }

    public void removeRevokedDrawNode(BaseDrawNode baseDrawNode) {
        this.mRevokedNodeList.remove(baseDrawNode);
    }

    public boolean setCurrentScreenEditor(int i) {
        this.mLastScreenEditor = this.mCurrentScreenEditor;
        if (this.mLastScreenEditor != null) {
            this.mLastScreenEditor.onChangeOperation(false);
        }
        if (i == 2) {
            if (this.mScreenDoodle == null) {
                this.mScreenDoodle = new ScreenDoodleView(this);
                this.mScreenDoodle.setDoodleData(DoodleManager.getDefaultScreenDoodleData(), 0);
            }
            this.mCurrentScreenEditor = this.mScreenDoodle;
        } else if (i == 3) {
            if (this.mScreenText == null) {
                this.mScreenText = new ScreenTextView(this);
            }
            this.mCurrentScreenEditor = this.mScreenText;
        } else if (i == 4) {
            if (this.mScreenMosaic == null) {
                ScreenMosaicProvider screenMosaicProvider = (ScreenMosaicProvider) ScreenProviderManager.INSTANCE.getProvider(ScreenMosaicProvider.class);
                if (!screenMosaicProvider.isInitialized()) {
                    Log.w("ScreenEditorView", "ScreenMosaicProvider has not initialized");
                    return false;
                }
                this.mScreenMosaic = new ScreenMosaicView(this);
                this.mScreenMosaic.setMosaicData(screenMosaicProvider.getDefaultData(), 0);
            }
            this.mCurrentScreenEditor = this.mScreenMosaic;
        }
        if (this.mCurrentScreenEditor != null) {
            this.mCurrentScreenEditor.onChangeOperation(true);
        }
        notifyOperationUpdate();
        return true;
    }

    public void setLongCrop(boolean z) {
        this.mIsLongCrop = z;
    }

    public void setLongCropEntry(Entry entry) {
        if (!this.mLongCropEntry.equals(entry)) {
            this.mLongCropEntry = entry;
            setPreviewBitmap(this.mOriginBitmap);
        }
    }

    public void setOperationUpdateListener(OperationUpdateListener operationUpdateListener) {
        this.mOperationUpdateListener = operationUpdateListener;
    }

    public void setPreviewBitmap(Bitmap bitmap) {
        this.mOriginBitmap = bitmap;
        this.mTopPixel = (int) ((((float) bitmap.getHeight()) * this.mLongCropEntry.mTopRatio) + 0.5f);
        this.mDisplayBitmap = Bitmap.createBitmap(bitmap.getWidth(), ((int) ((((float) bitmap.getHeight()) * this.mLongCropEntry.mBottomRatio) + 0.5f)) - this.mTopPixel, Config.ARGB_8888);
        this.mBitmapGestureParamsHolder.setBitmap(this.mDisplayBitmap);
        setLongCropFullBitmapRect();
        this.mDisplayCanvas = new Canvas(this.mDisplayBitmap);
        refreshDisplayCanvas();
    }

    public void startScreenThumbnailAnimate(ThumbnailAnimatorCallback thumbnailAnimatorCallback) {
        if (this.mAnimatorHelper == null) {
            this.mAnimatorHelper = new ScreenEditViewAnimatorHelper();
        }
        this.mThumbnailAnimatorCallback = thumbnailAnimatorCallback;
        this.mAnimatorHelper.startEnterAnimation(getContext(), this.mScreenEditViewAnimatorCallback, thumbnailAnimatorCallback.getThumbnailRect());
    }
}
