package com.miui.gallery.ui;

import android.content.Context;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.Drawable.ConstantState;
import android.net.Uri;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewStub;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.CheckBox;
import android.widget.ImageView;
import android.widget.ImageView.ScaleType;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.google.common.base.Strings;
import com.miui.gallery.Config.ThumbConfig;
import com.miui.gallery.R;
import com.miui.gallery.adapter.SyncStateDisplay.DisplayScene;
import com.miui.gallery.sdk.download.DownloadType;
import com.miui.gallery.util.BindImageHelper;
import com.miui.gallery.util.FileMimeUtil;
import com.miui.gallery.util.FormatUtil;
import com.miui.gallery.util.SpecialTypeMediaUtils;
import com.miui.gallery.widget.ForegroundImageView;
import com.miui.gallery.widget.editwrapper.PickAnimationHelper.BackgroundImageViewable;
import com.miui.gallery.widget.editwrapper.PickAnimationHelper.ShowNumberWhenPicking;
import com.miui.gallery.widget.recyclerview.transition.TransitionalItem;
import com.miui.gallery.widget.recyclerview.transition.TransitionalView;
import com.nostra13.universalimageloader.core.DisplayImageOptions;
import com.nostra13.universalimageloader.core.assist.ImageSize;
import com.nostra13.universalimageloader.core.imageaware.ImageViewAware;
import java.util.ArrayList;
import java.util.List;

public abstract class MicroThumbGridItem extends RelativeLayout implements CheckableView, BackgroundImageViewable, ShowNumberWhenPicking, TransitionalItem, TransitionalView {
    private View mBottomIndicatorContainer;
    private CheckBox mCheckBox;
    private View mCheckBoxContainer;
    private View mFavoriteIndicator;
    protected ImageViewAware mImageAware;
    protected ImageSize mImageSize;
    protected ImageView mImageView;
    private boolean mIsSimilarBestImage;
    private long mItemId;
    private String mItemPath = null;
    private ViewStub mItemStub;
    private long mLastSyncId = -1;
    private ImageView mMask;
    private TextView mPickingNumberIndicator;
    private ImageView mSimilarBestMark;
    private ImageView mSyncIndicator;
    private int mSyncState = Integer.MAX_VALUE;
    private View mTopIndicatorContainer;
    private TextView mTypeIndicator;

    public MicroThumbGridItem(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    private void checkStubInflate() {
        if (this.mItemStub != null) {
            View inflate = this.mItemStub.inflate();
            this.mMask = (ImageView) inflate.findViewById(R.id.mask);
            this.mCheckBox = (CheckBox) inflate.findViewById(16908289);
            this.mCheckBoxContainer = inflate.findViewById(R.id.checkbox_container);
            this.mSyncIndicator = (ImageView) inflate.findViewById(R.id.sync_indicator);
            this.mTopIndicatorContainer = inflate.findViewById(R.id.top_indicator_container);
            this.mPickingNumberIndicator = (TextView) inflate.findViewById(R.id.pick_num_indicator);
            this.mSimilarBestMark = (ImageView) inflate.findViewById(R.id.similar_best_mark);
            this.mItemStub = null;
        }
    }

    private static boolean displaySyncableState(int i) {
        return (i & 2) != 0;
    }

    private static boolean displaySyncedState(int i) {
        return (i & 8) != 0;
    }

    private static boolean displaySyncingState(int i) {
        return (i & 4) != 0;
    }

    private static boolean displayUnSyncableState(int i) {
        return (i & 1) != 0;
    }

    private boolean isInCheckMode() {
        return (this.mCheckBoxContainer == null ? 8 : this.mCheckBoxContainer.getVisibility()) == 0;
    }

    private boolean needRefreshSyncIndicator(long j, int i, int i2) {
        int i3 = (this.mLastSyncId > j ? 1 : (this.mLastSyncId == j ? 0 : -1));
        boolean z = true;
        if (i3 != 0) {
            this.mSyncState = Integer.MAX_VALUE;
            return true;
        } else if (this.mSyncState != i) {
            return true;
        } else {
            int visibility = this.mSyncIndicator == null ? 8 : this.mSyncIndicator.getVisibility();
            if (!needShowSyncIndicator(i, i2) ? visibility != 0 : visibility == 0) {
                z = false;
            }
            return z;
        }
    }

    private boolean needShowSyncIndicator(int i, int i2) {
        switch (i) {
            case 0:
            case 1:
                return displaySyncedState(i2);
            case 2:
                return displaySyncingState(i2);
            case 3:
                return displaySyncableState(i2);
            case 4:
                return displayUnSyncableState(i2);
            default:
                return false;
        }
    }

    private boolean needShowSyncIndicator(DisplayScene displayScene) {
        if (displayScene == DisplayScene.SCENE_ALWAYS) {
            return true;
        }
        return displayScene == DisplayScene.SCENE_IN_CHECK_MODE && isInCheckMode();
    }

    private void setSyncIndicatorVisibility(int i) {
        if (i == 0) {
            checkStubInflate();
            this.mSyncIndicator.setVisibility(0);
        } else if (this.mSyncIndicator != null) {
            this.mSyncIndicator.setVisibility(8);
        }
        updateTopIndicatorBg();
    }

    private void setTypeIndicatorVisibility(int i) {
        if (i == 0) {
            this.mTypeIndicator.setVisibility(0);
        } else if (this.mTypeIndicator != null) {
            this.mTypeIndicator.setVisibility(8);
        }
        updateBottomIndicatorBg();
    }

    private void updateSyncIndicator(int i, int i2, Animation animation, Animation animation2) {
        if (!(this.mSyncIndicator == null && i2 == 0)) {
            checkStubInflate();
            this.mSyncIndicator.setImageResource(i2);
        }
        setSyncIndicatorVisibility(i);
        if (animation != null) {
            checkStubInflate();
            this.mSyncIndicator.startAnimation(animation);
        } else if (this.mSyncIndicator != null) {
            this.mSyncIndicator.clearAnimation();
        }
        if (animation2 != null) {
            checkStubInflate();
            this.mTopIndicatorContainer.startAnimation(animation2);
        } else if (this.mTopIndicatorContainer != null) {
            this.mTopIndicatorContainer.clearAnimation();
        }
    }

    public void bindFavoriteIndicator(boolean z) {
        updateFavoriteIndicatorVisibility((!z || isInCheckMode()) ? 8 : 0);
    }

    public void bindImage(long j, String str, Uri uri, DownloadType downloadType, DisplayImageOptions displayImageOptions) {
        this.mItemId = j;
        this.mItemPath = str;
        BindImageHelper.bindImage(str, uri, downloadType, this.mImageView, displayImageOptions, this.mImageSize);
    }

    public void bindImage(long j, String str, Uri uri, DisplayImageOptions displayImageOptions) {
        bindImage(j, str, uri, DownloadType.MICRO, displayImageOptions);
    }

    public void bindImage(String str, Uri uri, DownloadType downloadType, DisplayImageOptions displayImageOptions) {
        bindImage(-1, str, uri, downloadType, displayImageOptions);
    }

    public void bindImage(String str, Uri uri, DisplayImageOptions displayImageOptions) {
        bindImage(-1, str, uri, DownloadType.MICRO, displayImageOptions);
    }

    public void bindIndicator(String str, long j, long j2) {
        int i;
        String str2;
        int i2 = 0;
        if (FileMimeUtil.isGifFromMimeType(str)) {
            str2 = "GIF";
            i = 0;
        } else if (FileMimeUtil.isVideoFromMimeType(str)) {
            int tryGetHFRIndicatorResId = SpecialTypeMediaUtils.tryGetHFRIndicatorResId(j2);
            if (tryGetHFRIndicatorResId != 0) {
                i = tryGetHFRIndicatorResId;
                str2 = "";
            } else {
                str2 = FormatUtil.formatVideoDuration(j);
                i = R.drawable.type_indicator_video;
            }
        } else if (SpecialTypeMediaUtils.isRefocusSupported(getContext(), j2)) {
            str2 = "";
            i = R.drawable.type_indicator_refocus;
        } else if (SpecialTypeMediaUtils.isMotionPhoto(getContext(), j2)) {
            str2 = "";
            i = R.drawable.type_indicator_motion_photo;
        } else if (SpecialTypeMediaUtils.isBurstPhoto(j2)) {
            str2 = "";
            i = R.drawable.type_indicator_burst_photo;
        } else {
            str2 = null;
            i = 0;
            i2 = 8;
        }
        updateTypeIndicator(i2, str2, i);
    }

    public void bindSyncIndicator(long j, int i, DisplayScene displayScene) {
        bindSyncIndicator(j, i, displayScene, 7);
    }

    /* JADX WARNING: Code restructure failed: missing block: B:20:0x0059, code lost:
        if (displaySyncableState(r11) != false) goto L_0x005b;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:21:0x005b, code lost:
        r10 = null;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:25:0x0072, code lost:
        r10 = null;
        r1 = 0;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:26:0x0074, code lost:
        r3 = 8;
     */
    public void bindSyncIndicator(long j, int i, DisplayScene displayScene, int i2) {
        Animation animation;
        if (!needShowSyncIndicator(displayScene)) {
            setSyncIndicatorVisibility(8);
            if (!(this.mSyncIndicator == null || this.mSyncIndicator.getAnimation() == null)) {
                this.mSyncIndicator.clearAnimation();
            }
        } else if (needRefreshSyncIndicator(j, i, i2)) {
            int i3 = R.drawable.photo_status_syncable;
            int i4 = 0;
            Animation animation2 = null;
            if (i != Integer.MAX_VALUE) {
                switch (i) {
                    case 0:
                    case 1:
                        if (!displaySyncedState(i2)) {
                            if (this.mSyncState == 2) {
                                if (displaySyncingState(i2)) {
                                    animation2 = AnimationUtils.loadAnimation(getContext(), R.anim.photo_status_sync_succ_disappear_anim);
                                    animation = AnimationUtils.loadAnimation(getContext(), R.anim.photo_status_sync_succ_disappear_anim);
                                    i3 = R.drawable.photo_status_sync_succ;
                                    break;
                                }
                            }
                        } else {
                            animation = null;
                            i3 = R.drawable.photo_status_sync_succ;
                            break;
                        }
                        break;
                    case 2:
                        if (displaySyncingState(i2)) {
                            animation2 = AnimationUtils.loadAnimation(getContext(), R.anim.photo_status_syncing_rotate_anim);
                            animation = null;
                            break;
                        }
                        break;
                    case 3:
                        break;
                    case 4:
                        if (displayUnSyncableState(i2)) {
                            i3 = R.drawable.photo_status_unsyncable;
                            break;
                        }
                        break;
                    default:
                        StringBuilder sb = new StringBuilder();
                        sb.append("unknow status: ");
                        sb.append(i);
                        throw new IllegalArgumentException(sb.toString());
                }
            }
            animation = null;
            i3 = 0;
            this.mLastSyncId = j;
            this.mSyncState = i;
            updateSyncIndicator(i4, i3, animation2, animation);
        }
    }

    public ImageView getBackgroundImageView() {
        return this.mImageView;
    }

    public ImageView getBackgroundMask() {
        checkStubInflate();
        return this.mMask;
    }

    public CheckBox getCheckBox() {
        checkStubInflate();
        return this.mCheckBox;
    }

    public TextView getShowNumberTextView() {
        checkStubInflate();
        return this.mPickingNumberIndicator;
    }

    public Drawable getTransitDrawable() {
        Drawable drawable = BindImageHelper.isViewBindDrawable(this.mImageView) ? this.mImageView.getDrawable() : null;
        if (drawable == null) {
            return drawable;
        }
        ConstantState constantState = drawable.getConstantState();
        return constantState != null ? constantState.newDrawable(getResources()) : drawable;
    }

    public RectF getTransitFrame() {
        return new RectF((float) getLeft(), (float) getTop(), (float) getRight(), (float) getBottom());
    }

    public long getTransitId() {
        return this.mItemId;
    }

    public String getTransitPath() {
        return this.mItemPath;
    }

    public ScaleType getTransitScaleType() {
        return this.mImageView.getScaleType();
    }

    public List<TransitionalItem> getTransitionalItems() {
        ArrayList arrayList = new ArrayList(1);
        if (this.mItemId > 0) {
            arrayList.add(this);
        }
        return arrayList;
    }

    public boolean isChecked() {
        if (this.mCheckBox == null) {
            return false;
        }
        return this.mCheckBox.isChecked();
    }

    /* access modifiers changed from: protected */
    public boolean isSquareItem() {
        return true;
    }

    /* access modifiers changed from: protected */
    public void onFinishInflate() {
        super.onFinishInflate();
        this.mItemStub = (ViewStub) findViewById(R.id.item_stub);
        this.mImageView = (ImageView) findViewById(R.id.micro_thumb);
        this.mTypeIndicator = (TextView) findViewById(R.id.type_indicator);
        this.mFavoriteIndicator = findViewById(R.id.favorites_indicator);
        this.mBottomIndicatorContainer = findViewById(R.id.bottom_indicator_container);
        this.mImageAware = new ImageViewAware(this.mImageView);
        this.mImageSize = ThumbConfig.get().sMicroTargetSize;
    }

    /* access modifiers changed from: protected */
    public void onMeasure(int i, int i2) {
        if (isSquareItem()) {
            super.onMeasure(i, i);
        } else {
            super.onMeasure(i, i2);
        }
    }

    public void setCheckable(boolean z) {
        if (z) {
            checkStubInflate();
            boolean z2 = false;
            this.mCheckBoxContainer.setVisibility(0);
            if (this.mFavoriteIndicator.getVisibility() == 0) {
                z2 = true;
            }
            bindFavoriteIndicator(z2);
        } else if (this.mCheckBoxContainer != null) {
            this.mCheckBoxContainer.setVisibility(8);
        }
        setSimilarMarkEnable(z);
    }

    public void setCheckableListener(OnClickListener onClickListener) {
        if (onClickListener != null) {
            checkStubInflate();
            this.mCheckBoxContainer.setOnClickListener(onClickListener);
        } else if (this.mCheckBoxContainer != null) {
            this.mCheckBoxContainer.setOnClickListener(null);
        }
    }

    public void setChecked(boolean z) {
        if (z) {
            checkStubInflate();
            this.mCheckBox.setChecked(true);
        } else if (this.mCheckBox != null) {
            this.mCheckBox.setChecked(false);
        }
    }

    public void setImageForeground(int i) {
        if (this.mImageView instanceof ForegroundImageView) {
            ((ForegroundImageView) this.mImageView).setForegroundResource(i);
        }
    }

    public void setImageSize(ImageSize imageSize) {
        if (imageSize != null) {
            this.mImageSize = imageSize;
        }
    }

    public void setIsSimilarBestImage(boolean z) {
        this.mIsSimilarBestImage = z;
        if (this.mCheckBoxContainer != null && this.mCheckBoxContainer.getVisibility() == 0) {
            setSimilarMarkEnable(true);
        }
    }

    public void setSimilarMarkEnable(boolean z) {
        if (z && this.mIsSimilarBestImage) {
            checkStubInflate();
            this.mSimilarBestMark.setVisibility(0);
        } else if (this.mSimilarBestMark != null) {
            this.mSimilarBestMark.setVisibility(8);
        }
    }

    public void toggle() {
        checkStubInflate();
        this.mCheckBox.toggle();
    }

    /* access modifiers changed from: protected */
    public void updateBottomIndicatorBg() {
        if ((this.mTypeIndicator != null && this.mTypeIndicator.getVisibility() == 0) || (this.mFavoriteIndicator != null && this.mFavoriteIndicator.getVisibility() == 0)) {
            this.mBottomIndicatorContainer.setVisibility(0);
        } else if (this.mBottomIndicatorContainer != null) {
            this.mBottomIndicatorContainer.setVisibility(8);
        }
    }

    /* access modifiers changed from: protected */
    public void updateFavoriteIndicatorVisibility(int i) {
        if (i == 0) {
            this.mFavoriteIndicator.setVisibility(0);
        } else if (this.mFavoriteIndicator != null) {
            this.mFavoriteIndicator.setVisibility(8);
        }
        updateBottomIndicatorBg();
    }

    /* access modifiers changed from: protected */
    public void updateTopIndicatorBg() {
        if (this.mSyncIndicator != null && this.mSyncIndicator.getVisibility() == 0 && this.mSyncIndicator.getDrawable() != null) {
            checkStubInflate();
            this.mTopIndicatorContainer.setVisibility(0);
        } else if (this.mTopIndicatorContainer != null) {
            this.mTopIndicatorContainer.setVisibility(8);
        }
    }

    /* access modifiers changed from: protected */
    public void updateTypeIndicator(int i, String str, int i2) {
        if (this.mTypeIndicator != null) {
            if (i == 0 || i != this.mTypeIndicator.getVisibility()) {
                String nullToEmpty = Strings.nullToEmpty(str);
                if (!TextUtils.equals(this.mTypeIndicator.getText(), nullToEmpty)) {
                    this.mTypeIndicator.setText(nullToEmpty);
                }
                Drawable drawable = i2 != 0 ? getContext().getDrawable(i2) : null;
                if (this.mTypeIndicator.getCompoundDrawablesRelative()[0] != drawable) {
                    this.mTypeIndicator.setCompoundDrawablesRelativeWithIntrinsicBounds(drawable, null, null, null);
                }
                setTypeIndicatorVisibility(i);
            }
        }
    }
}
