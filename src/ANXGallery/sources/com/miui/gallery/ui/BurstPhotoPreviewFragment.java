package com.miui.gallery.ui;

import android.content.Context;
import android.graphics.PointF;
import android.net.Uri;
import android.os.Bundle;
import android.support.v7.widget.LinearSmoothScroller;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.Adapter;
import android.support.v7.widget.RecyclerView.LayoutManager;
import android.support.v7.widget.RecyclerView.OnScrollListener;
import android.support.v7.widget.RecyclerView.SmoothScroller.Action;
import android.support.v7.widget.RecyclerView.State;
import android.util.DisplayMetrics;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.FrameLayout.LayoutParams;
import android.widget.ImageView;
import com.miui.gallery.Config.ThumbConfig;
import com.miui.gallery.R;
import com.miui.gallery.adapter.HeaderFooterRecyclerAdapterWrapper;
import com.miui.gallery.app.Fragment;
import com.miui.gallery.editor.photo.widgets.recyclerview.ScrollControlLinearLayoutManager;
import com.miui.gallery.editor.photo.widgets.recyclerview.SimpleRecyclerView.BlankDivider;
import com.miui.gallery.model.BaseDataItem;
import com.miui.gallery.model.BaseDataSet;
import com.miui.gallery.sdk.download.DownloadType;
import com.miui.gallery.util.BindImageHelper;
import com.miui.gallery.util.ScreenUtils;
import com.miui.gallery.util.uil.CloudUriAdapter;
import com.miui.gallery.widget.PagerIndicator;
import com.miui.gallery.widget.recyclerview.BaseViewHolder;
import com.miui.gallery.widget.recyclerview.GalleryRecyclerView;
import com.nostra13.universalimageloader.core.DisplayImageOptions;
import com.nostra13.universalimageloader.core.DisplayImageOptions.Builder;
import com.nostra13.universalimageloader.core.assist.ImageSize;
import java.util.ArrayList;
import java.util.List;
import miui.view.animation.CubicEaseOutInterpolator;

public class BurstPhotoPreviewFragment extends Fragment {
    private PreviewViewAdapter mAdapter;
    /* access modifiers changed from: private */
    public PreviewViewHeaderFooterWrapper mAdapterWrapper;
    private BaseDataSet mContentDataSet;
    private View mDiscard;
    /* access modifiers changed from: private */
    public View mIndicator;
    /* access modifiers changed from: private */
    public boolean mIsScrolledByOutside = true;
    private OnClickListener mOnDiscardClickedListener = new OnClickListener() {
        public void onClick(View view) {
            if (BurstPhotoPreviewFragment.this.mOnExitListener != null) {
                BurstPhotoPreviewFragment.this.mOnExitListener.onDiscard();
            }
        }
    };
    /* access modifiers changed from: private */
    public OnExitListener mOnExitListener;
    /* access modifiers changed from: private */
    public OnScrollToPositionListener mOnItemScrolledListener;
    private OnClickListener mOnSaveClickedListener = new OnClickListener() {
        public void onClick(View view) {
            if (BurstPhotoPreviewFragment.this.mOnExitListener != null) {
                BurstPhotoPreviewFragment.this.mOnExitListener.onSave();
            }
        }
    };
    /* access modifiers changed from: private */
    public GalleryRecyclerView mPreviewRecyclerView;
    private View mSave;

    private class BurstOnScrollListener extends OnScrollListener {
        private BurstOnScrollListener() {
        }

        private int getCurrentPosition(RecyclerView recyclerView) {
            int left = (BurstPhotoPreviewFragment.this.mIndicator.getLeft() + BurstPhotoPreviewFragment.this.mIndicator.getRight()) / 2;
            LayoutManager layoutManager = recyclerView.getLayoutManager();
            int itemCount = layoutManager.getItemCount();
            int i = Integer.MAX_VALUE;
            int i2 = -1;
            for (int i3 = 0; i3 < itemCount; i3++) {
                View findViewByPosition = layoutManager.findViewByPosition(i3);
                if (findViewByPosition != null) {
                    int abs = Math.abs(((findViewByPosition.getLeft() + findViewByPosition.getRight()) / 2) - left);
                    if (abs >= i) {
                        return i2;
                    }
                    i2 = i3;
                    i = abs;
                }
            }
            return -1;
        }

        private boolean isScrollPositionValid(int i) {
            return i >= BurstPhotoPreviewFragment.this.mAdapterWrapper.getHeadersCount() && i <= BurstPhotoPreviewFragment.this.mAdapterWrapper.getItemCount() - BurstPhotoPreviewFragment.this.mAdapterWrapper.getFootersCount();
        }

        public void onScrollStateChanged(RecyclerView recyclerView, int i) {
            if (i == 1) {
                BurstPhotoPreviewFragment.this.mIsScrolledByOutside = false;
            } else if (i == 0) {
                int currentPosition = getCurrentPosition(recyclerView);
                if (isScrollPositionValid(currentPosition)) {
                    BurstPhotoPreviewFragment.this.mPreviewRecyclerView.smoothScrollToPosition(currentPosition);
                    if (BurstPhotoPreviewFragment.this.mOnItemScrolledListener != null) {
                        BurstPhotoPreviewFragment.this.mOnItemScrolledListener.onScrollToPosition(BurstPhotoPreviewFragment.this.mAdapterWrapper.getWrappedAdapterPosition(currentPosition));
                    }
                }
                BurstPhotoPreviewFragment.this.mIsScrolledByOutside = true;
            }
        }

        public void onScrolled(RecyclerView recyclerView, int i, int i2) {
            int currentPosition = getCurrentPosition(recyclerView);
            if (BurstPhotoPreviewFragment.this.mOnItemScrolledListener != null && !BurstPhotoPreviewFragment.this.mIsScrolledByOutside && isScrollPositionValid(currentPosition)) {
                BurstPhotoPreviewFragment.this.mOnItemScrolledListener.onScrollToPosition(BurstPhotoPreviewFragment.this.mAdapterWrapper.getWrappedAdapterPosition(currentPosition));
            }
        }
    }

    class BurstScrollControlLinearLayoutManager extends ScrollControlLinearLayoutManager {
        public BurstScrollControlLinearLayoutManager(Context context) {
            super(context);
        }

        public void smoothScrollToPosition(RecyclerView recyclerView, State state, int i) {
            AnonymousClass1 r2 = new LinearSmoothScroller(recyclerView.getContext()) {
                /* access modifiers changed from: protected */
                public float calculateSpeedPerPixel(DisplayMetrics displayMetrics) {
                    return BurstScrollControlLinearLayoutManager.this.mSmoothScrollerSpeed / ((float) displayMetrics.densityDpi);
                }

                public PointF computeScrollVectorForPosition(int i) {
                    return BurstScrollControlLinearLayoutManager.this.computeScrollVectorForPosition(i);
                }

                /* access modifiers changed from: protected */
                public void onTargetFound(View view, State state, Action action) {
                    if (getLayoutManager() != null) {
                        int screenWidth = (ScreenUtils.getScreenWidth() / 2) - ((view.getLeft() + view.getRight()) / 2);
                        if (((float) Math.abs(screenWidth)) > BurstScrollControlLinearLayoutManager.this.mMinDistance) {
                            action.update(-screenWidth, 0, 300, new CubicEaseOutInterpolator());
                        }
                    }
                }
            };
            r2.setTargetPosition(i);
            startSmoothScroll(r2);
        }
    }

    public interface OnExitListener {
        void onDiscard();

        void onSave();
    }

    public interface OnScrollToPositionListener {
        void onScrollToPosition(int i);
    }

    class PreviewViewAdapter extends Adapter<BaseViewHolder> {
        private Context mContext;
        private BaseDataSet mDataSet;
        DisplayImageOptions mDisplayOptions = new Builder().cloneFrom(ThumbConfig.get().MICRO_THUMB_DISPLAY_IMAGE_OPTIONS_DEFAULT).cacheThumbnail(false).loadFromMicroCache(false).build();
        private int mItemHeight;
        private int mItemWidth;
        private List<Integer> mSelectDataPos = new ArrayList();

        PreviewViewAdapter(Context context) {
            this.mContext = context;
            this.mItemWidth = BurstPhotoPreviewFragment.this.getActivity().getResources().getDimensionPixelSize(R.dimen.burst_preview_width);
            this.mItemHeight = BurstPhotoPreviewFragment.this.getActivity().getResources().getDimensionPixelSize(R.dimen.burst_preview_height);
        }

        public int getItemCount() {
            if (this.mDataSet != null) {
                return this.mDataSet.getCount();
            }
            return 0;
        }

        public int getSelectCount() {
            return this.mSelectDataPos.size();
        }

        public void onBindViewHolder(BaseViewHolder baseViewHolder, int i) {
            baseViewHolder.itemView.setTag(Integer.valueOf(i));
            if (this.mDataSet != null) {
                Uri uri = null;
                BaseDataItem item = this.mDataSet.getItem(null, i);
                long key = item.getKey();
                String str = item.getOriginalPath() == null ? item.getThumnailPath() == null ? item.getMicroPath() : item.getThumnailPath() : item.getOriginalPath();
                String str2 = str;
                if (item.isSynced()) {
                    uri = CloudUriAdapter.getDownloadUri(key);
                }
                Uri uri2 = uri;
                if (baseViewHolder instanceof PreviewViewHolder) {
                    ((PreviewViewHolder) baseViewHolder).bindImage(this.mSelectDataPos.contains(Integer.valueOf(i)), str2, uri2, this.mItemWidth, this.mItemHeight, this.mDisplayOptions);
                }
            }
        }

        public BaseViewHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
            return new PreviewViewHolder(LayoutInflater.from(this.mContext).inflate(R.layout.burst_preview_item, viewGroup, false));
        }

        public void setDateSet(BaseDataSet baseDataSet) {
            this.mDataSet = baseDataSet;
            notifyDataSetChanged();
        }

        public void setSelectDataPosition(int i, boolean z) {
            if (z) {
                this.mSelectDataPos.add(Integer.valueOf(i));
            } else if (this.mSelectDataPos.contains(Integer.valueOf(i))) {
                this.mSelectDataPos.remove(Integer.valueOf(i));
            }
            BaseViewHolder baseViewHolder = (BaseViewHolder) BurstPhotoPreviewFragment.this.mPreviewRecyclerView.findViewHolderForAdapterPosition(i + BurstPhotoPreviewFragment.this.mAdapterWrapper.getHeadersCount());
            if (baseViewHolder != null && (baseViewHolder instanceof PreviewViewHolder)) {
                ((PreviewViewHolder) baseViewHolder).setSelect(z);
            }
        }
    }

    class PreviewViewHeaderFooterWrapper extends HeaderFooterRecyclerAdapterWrapper<PreviewViewAdapter, BaseViewHolder> {
        public PreviewViewHeaderFooterWrapper(PreviewViewAdapter previewViewAdapter) {
            super(previewViewAdapter);
        }

        /* access modifiers changed from: protected */
        public BaseViewHolder onCreateHeaderFooterViewHolder(View view) {
            return new BaseViewHolder(view);
        }
    }

    class PreviewViewHolder extends BaseViewHolder {
        private ImageView mPreview;
        private View mSelectView;

        public PreviewViewHolder(View view) {
            super(view);
            this.mPreview = (ImageView) view.findViewById(R.id.preview);
            this.mSelectView = view.findViewById(R.id.select_view);
        }

        public void bindImage(boolean z, String str, Uri uri, int i, int i2, DisplayImageOptions displayImageOptions) {
            this.mSelectView.setVisibility(z ? 0 : 8);
            this.mPreview.setLayoutParams(new LayoutParams(i, i2));
            BindImageHelper.bindImage(str, uri, DownloadType.MICRO, this.mPreview, displayImageOptions, new ImageSize(i, i2));
            this.itemView.setOnClickListener(new OnClickListener() {
                public void onClick(View view) {
                    BurstPhotoPreviewFragment.this.scrollToPosition(((Integer) PreviewViewHolder.this.itemView.getTag()).intValue());
                }
            });
        }

        public void setSelect(boolean z) {
            this.mSelectView.setVisibility(z ? 0 : 8);
        }
    }

    public View onInflateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View inflate = layoutInflater.inflate(R.layout.burst_photo_preview, viewGroup, false);
        this.mSave = inflate.findViewById(R.id.save);
        this.mSave.setOnClickListener(this.mOnSaveClickedListener);
        this.mDiscard = inflate.findViewById(R.id.discard);
        this.mDiscard.setOnClickListener(this.mOnDiscardClickedListener);
        this.mIndicator = inflate.findViewById(R.id.indicator);
        ((PagerIndicator) this.mIndicator).showIndex(0, 1);
        this.mPreviewRecyclerView = (GalleryRecyclerView) inflate.findViewById(R.id.preview_view);
        BurstScrollControlLinearLayoutManager burstScrollControlLinearLayoutManager = new BurstScrollControlLinearLayoutManager(getActivity());
        burstScrollControlLinearLayoutManager.setOrientation(0);
        this.mPreviewRecyclerView.setLayoutManager(burstScrollControlLinearLayoutManager);
        this.mPreviewRecyclerView.addItemDecoration(new BlankDivider(getResources(), R.dimen.burst_preview_decoration_width, 0));
        this.mAdapter = new PreviewViewAdapter(getActivity());
        if (this.mContentDataSet != null) {
            this.mAdapter.setDateSet(this.mContentDataSet);
        }
        int screenWidth = ((ScreenUtils.getScreenWidth() / 2) - (getActivity().getResources().getDimensionPixelSize(R.dimen.burst_preview_width) / 2)) - getActivity().getResources().getDimensionPixelSize(R.dimen.burst_preview_decoration_width);
        View view = new View(getActivity());
        view.setLayoutParams(new ViewGroup.LayoutParams(screenWidth, 1));
        View view2 = new View(getActivity());
        view2.setLayoutParams(new ViewGroup.LayoutParams(screenWidth, 1));
        this.mAdapterWrapper = new PreviewViewHeaderFooterWrapper(this.mAdapter);
        this.mAdapterWrapper.addFooterView(view2);
        this.mAdapterWrapper.addHeaderView(view);
        this.mPreviewRecyclerView.setAdapter(this.mAdapterWrapper);
        this.mPreviewRecyclerView.addOnScrollListener(new BurstOnScrollListener());
        return inflate;
    }

    public void scrollToPosition(int i) {
        if (this.mIsScrolledByOutside) {
            this.mPreviewRecyclerView.smoothScrollToPosition(i + this.mAdapterWrapper.getHeadersCount());
        }
    }

    public void setCheckedItem(int i, boolean z) {
        this.mAdapter.setSelectDataPosition(i, z);
        this.mSave.setEnabled(this.mAdapter.getSelectCount() > 0);
    }

    public void setDataSet(BaseDataSet baseDataSet) {
        this.mContentDataSet = baseDataSet;
        if (this.mAdapter != null) {
            this.mAdapter.setDateSet(baseDataSet);
        }
    }

    public void setOnExitListener(OnExitListener onExitListener) {
        this.mOnExitListener = onExitListener;
    }

    public void setOnItemScrolledListener(OnScrollToPositionListener onScrollToPositionListener) {
        this.mOnItemScrolledListener = onScrollToPositionListener;
    }
}
