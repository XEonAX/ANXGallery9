package com.miui.gallery.video;

import android.content.Context;
import android.graphics.Bitmap;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.Adapter;
import android.support.v7.widget.RecyclerView.LayoutParams;
import android.support.v7.widget.RecyclerView.ViewHolder;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.ImageView.ScaleType;
import com.miui.gallery.R;
import java.util.ArrayList;
import java.util.List;

public class VideoFrameThumbAdapter extends Adapter<ViewHolder> {
    private Context mContext;
    private List<Bitmap> mDataList;
    private int mDividerWidth;
    private int mEmptyViewWidth;
    /* access modifiers changed from: private */
    public int mItemWidth;
    private int mScreenWidth;
    private int mTotalWidth;

    private class EmptyHolder extends ViewHolder {
        public EmptyHolder(View view) {
            super(view);
        }
    }

    private class FrameThumbHolder extends ViewHolder {
        private ImageView mImageView = ((ImageView) this.itemView);

        public FrameThumbHolder(View view) {
            super(new ImageView(view.getContext()));
            this.mImageView.setLayoutParams(new LayoutParams(VideoFrameThumbAdapter.this.mItemWidth, -1));
            this.mImageView.setScaleType(ScaleType.CENTER_CROP);
        }

        public void setBitmap(Bitmap bitmap) {
            this.mImageView.setImageBitmap(bitmap);
        }
    }

    public VideoFrameThumbAdapter(Context context) {
        this.mContext = context;
        this.mDividerWidth = context.getResources().getDimensionPixelSize(R.dimen.video_frame_seek_bar_divider);
        this.mItemWidth = context.getResources().getDimensionPixelSize(R.dimen.video_frame_thumb_width);
        if (this.mDividerWidth % 2 != 0) {
            this.mDividerWidth++;
        }
    }

    private int getCurrentOffset(RecyclerView recyclerView) {
        if (this.mScreenWidth == 0 || getDataListSize() <= 0 || recyclerView.getChildCount() == 0) {
            return 0;
        }
        View childAt = recyclerView.getChildAt(0);
        LayoutParams layoutParams = (LayoutParams) childAt.getLayoutParams();
        if (layoutParams == null) {
            return 0;
        }
        int viewAdapterPosition = layoutParams.getViewAdapterPosition();
        int i = -childAt.getLeft();
        if (viewAdapterPosition > 0) {
            i += this.mEmptyViewWidth + ((viewAdapterPosition - 1) * this.mItemWidth);
        }
        return i + (this.mScreenWidth / 2);
    }

    private Bitmap getDataItem(int i) {
        if (this.mDataList == null) {
            return null;
        }
        return (Bitmap) this.mDataList.get(i - 1);
    }

    private int getDataListSize() {
        if (this.mDataList == null) {
            return 0;
        }
        return this.mDataList.size();
    }

    public void configLayoutParams(int i) {
        if (i != this.mScreenWidth) {
            this.mScreenWidth = i;
            this.mEmptyViewWidth = (this.mScreenWidth - this.mDividerWidth) / 2;
            notifyDataSetChanged();
        }
    }

    public int getItemCount() {
        return getDataListSize() + 2;
    }

    public int getItemViewType(int i) {
        return (i == 0 || i == getDataListSize() + 1) ? 1 : 0;
    }

    public int getScrollOffset(RecyclerView recyclerView, float f) {
        int currentOffset = getCurrentOffset(recyclerView);
        if (currentOffset <= 0) {
            return 0;
        }
        return ((int) (((((float) (this.mTotalWidth - this.mDividerWidth)) * f) + ((float) (this.mDividerWidth / 2))) + ((float) this.mEmptyViewWidth))) - currentOffset;
    }

    public float getScrollPercent(RecyclerView recyclerView) {
        int currentOffset = getCurrentOffset(recyclerView);
        if (currentOffset <= 0) {
            return 0.0f;
        }
        return Math.min(Math.max(this.mTotalWidth > this.mDividerWidth ? (((float) ((currentOffset - this.mEmptyViewWidth) - (this.mDividerWidth / 2))) * 1.0f) / ((float) (this.mTotalWidth - this.mDividerWidth)) : 0.0f, 0.0f), 1.0f);
    }

    public void onBindViewHolder(ViewHolder viewHolder, int i) {
        int itemViewType = getItemViewType(i);
        if (itemViewType == 0) {
            ((FrameThumbHolder) viewHolder).setBitmap(getDataItem(i));
        } else if (itemViewType == 1) {
            viewHolder.itemView.getLayoutParams().width = this.mEmptyViewWidth;
        }
    }

    public ViewHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
        if (i != 1) {
            return new FrameThumbHolder(viewGroup);
        }
        View view = new View(this.mContext);
        view.setLayoutParams(new ViewGroup.LayoutParams(this.mEmptyViewWidth, -1));
        return new EmptyHolder(view);
    }

    public void updateDataList(List<Bitmap> list) {
        if (this.mDataList == null) {
            this.mDataList = new ArrayList();
        }
        this.mDataList.clear();
        this.mTotalWidth = 0;
        if (list != null) {
            this.mDataList.addAll(list);
            this.mTotalWidth = this.mItemWidth * list.size();
        }
        notifyDataSetChanged();
    }
}
