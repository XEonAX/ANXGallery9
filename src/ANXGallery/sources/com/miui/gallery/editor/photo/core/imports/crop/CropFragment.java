package com.miui.gallery.editor.photo.core.imports.crop;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ObjectAnimator;
import android.graphics.Bitmap;
import android.graphics.RectF;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.util.Property;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnLayoutChangeListener;
import android.view.ViewGroup;
import com.miui.gallery.R;
import com.miui.gallery.editor.photo.core.RenderData;
import com.miui.gallery.editor.photo.core.common.fragment.AbstractCropFragment;
import com.miui.gallery.editor.photo.core.common.model.CropData.AspectRatio;
import com.miui.gallery.editor.photo.core.imports.obsoletes.Crop;
import com.miui.gallery.editor.photo.core.imports.obsoletes.Crop.OnCropChangedListener;
import com.miui.gallery.editor.photo.core.imports.obsoletes.EditorView;
import com.miui.gallery.preference.GalleryPreferences.PhotoEditor;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import miui.view.animation.CubicEaseInOutInterpolator;

public class CropFragment extends AbstractCropFragment {
    private AspectRatio mAspectRatio;
    private float mAutoCropDegree;
    private int mCanvasRotateTimes;
    /* access modifiers changed from: private */
    public Crop mCrop;
    /* access modifiers changed from: private */
    public View mCropTips;
    private Handler mCropTipsHandler;
    private EditorView mEditorView;
    private boolean mMirrored;
    private OnCropChangedListener mOnCropChangedListener = new OnCropChangedListener() {
        public void changeRotationState(boolean z) {
            CropFragment.this.changeRotationState(z);
        }

        public void onChanged() {
            CropFragment.this.onChanged();
        }
    };
    private OnLayoutChangeListener mOnLayoutChangeListener = new OnLayoutChangeListener() {
        public void onLayoutChange(View view, int i, int i2, int i3, int i4, int i5, int i6, int i7, int i8) {
            CropFragment.this.mCrop.start();
        }
    };
    private float mTuningDegree;

    /* access modifiers changed from: private */
    public void showAnimator(final boolean z) {
        View view = this.mCropTips;
        Property property = View.ALPHA;
        float[] fArr = new float[2];
        float f = 1.0f;
        fArr[0] = z ? 0.0f : 1.0f;
        if (!z) {
            f = 0.0f;
        }
        fArr[1] = f;
        ObjectAnimator ofFloat = ObjectAnimator.ofFloat(view, property, fArr);
        ofFloat.setDuration(300);
        ofFloat.setInterpolator(new CubicEaseInOutInterpolator());
        ofFloat.addListener(new AnimatorListenerAdapter() {
            public void onAnimationEnd(Animator animator) {
                super.onAnimationEnd(animator);
                if (!z) {
                    CropFragment.this.mCropTips.setVisibility(8);
                }
            }

            public void onAnimationStart(Animator animator) {
                super.onAnimationStart(animator);
                if (z) {
                    CropFragment.this.mCropTips.setAlpha(0.0f);
                    CropFragment.this.mCropTips.setVisibility(0);
                }
            }
        });
        ofFloat.start();
    }

    public void clear() {
        this.mCrop.reset();
    }

    public boolean doTouchEvent(MotionEvent motionEvent) {
        motionEvent.setLocation(motionEvent.getX(), motionEvent.getY() + ((float) this.mEditorView.getHeight()));
        return this.mEditorView.onTouchEvent(motionEvent);
    }

    public void finishTuning() {
        this.mCrop.finishRotate();
    }

    public boolean isEmpty() {
        RectF sampleSize = this.mCrop.getSampleSize();
        RectF croppedSize = this.mCrop.getCroppedSize();
        return !this.mMirrored && this.mTuningDegree == 0.0f && this.mCanvasRotateTimes % 4 == 0 && !(Math.round(sampleSize.width()) != Math.round(croppedSize.width()) || Math.round(sampleSize.height()) != Math.round(croppedSize.height()));
    }

    public boolean isSupportAnimation() {
        return true;
    }

    /* access modifiers changed from: protected */
    public void onAutoCrop(float f) {
        this.mCrop.setRotateDegreeWithAnimation(f);
        this.mTuningDegree = f;
        this.mAutoCropDegree = f;
        if (PhotoEditor.isCropTipsShow()) {
            PhotoEditor.addCropTipsShowTimes();
            showAnimator(true);
            this.mCropTipsHandler = new Handler() {
                public void handleMessage(Message message) {
                    super.handleMessage(message);
                    CropFragment.this.showAnimator(false);
                }
            };
            this.mCropTipsHandler.sendEmptyMessageDelayed(0, 3000);
        }
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        ViewGroup viewGroup2 = (ViewGroup) layoutInflater.inflate(R.layout.crop_preview_container, viewGroup, false);
        this.mEditorView = (EditorView) viewGroup2.findViewById(R.id.editor_view);
        this.mCropTips = viewGroup2.findViewById(R.id.crop_tips);
        this.mCrop = new Crop(getActivity());
        this.mEditorView.install(this.mCrop);
        this.mEditorView.setDrawBoundLine(false);
        this.mEditorView.setBitmap(getBitmap());
        this.mEditorView.addOnLayoutChangeListener(this.mOnLayoutChangeListener);
        this.mCrop.setOnCropChangedListener(this.mOnCropChangedListener);
        return viewGroup2;
    }

    public void onDestroyView() {
        super.onDestroyView();
        this.mEditorView.removeOnLayoutChangeListener(this.mOnLayoutChangeListener);
        if (this.mCropTipsHandler != null) {
            this.mCropTipsHandler.removeMessages(0);
        }
    }

    /* access modifiers changed from: protected */
    public void onDoMirror() {
        this.mCrop.mirror();
        this.mMirrored = !this.mMirrored;
    }

    /* access modifiers changed from: protected */
    public void onDoRotate() {
        this.mCrop.rotate();
        this.mCanvasRotateTimes++;
    }

    public RenderData onExport() {
        return new CropStateData(this.mCrop.export());
    }

    /* access modifiers changed from: protected */
    public List<String> onSample() {
        boolean z;
        ArrayList arrayList = new ArrayList();
        if (this.mMirrored) {
            arrayList.add("mirror");
        }
        if (this.mTuningDegree != 0.0f) {
            if (this.mAutoCropDegree == this.mTuningDegree) {
                arrayList.add("rotate_auto");
            } else {
                arrayList.add("rotate_manual");
            }
            z = true;
        } else {
            z = false;
        }
        if (this.mCanvasRotateTimes % 4 != 0) {
            arrayList.add("rotate_canvas");
            z = true;
        }
        if (z) {
            arrayList.add("rotate");
        }
        RectF sampleSize = this.mCrop.getSampleSize();
        RectF croppedSize = this.mCrop.getCroppedSize();
        if (!(Math.round(sampleSize.width()) == Math.round(croppedSize.width()) && Math.round(sampleSize.height()) == Math.round(croppedSize.height()))) {
            arrayList.add("crop");
        }
        Locale locale = Locale.US;
        String str = "aspect_ratio: %s";
        Object[] objArr = new Object[1];
        objArr[0] = this.mAspectRatio == null ? "free" : this.mAspectRatio.name;
        arrayList.add(String.format(locale, str, objArr));
        return arrayList;
    }

    /* access modifiers changed from: protected */
    public void onSetAspectRatio(AspectRatio aspectRatio) {
        this.mCrop.setFixedAspectRatio(aspectRatio.width, aspectRatio.height);
        this.mAspectRatio = aspectRatio;
    }

    /* access modifiers changed from: protected */
    public void onTurning(float f) {
        this.mCrop.setRotateDegree(f);
        this.mTuningDegree = f;
    }

    public void prepareTuning() {
        this.mCrop.beginRotate();
    }

    public void restore() {
        super.restore();
        this.mEditorView.setBitmap(getBitmap());
        this.mCrop.reset();
        if (this.mCropTipsHandler != null) {
            this.mCropTipsHandler.removeMessages(0);
            this.mCropTipsHandler.sendEmptyMessage(0);
        }
    }

    public void setBitmap(Bitmap bitmap) {
        super.setBitmap(bitmap);
        if (this.mEditorView != null) {
            this.mEditorView.setBitmap(bitmap);
        }
    }
}
