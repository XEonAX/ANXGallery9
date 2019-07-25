package com.miui.gallery.video;

import android.content.Context;
import android.graphics.Bitmap;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.OnScrollListener;
import android.util.AttributeSet;
import android.widget.FrameLayout;
import com.miui.gallery.R;
import com.miui.gallery.util.Log;
import java.util.List;

public class VideoFrameSeekBar extends FrameLayout {
    private Context mContext;
    /* access modifiers changed from: private */
    public OnSeekBarChangeListener mOnSeekBarChangeListener;
    /* access modifiers changed from: private */
    public float mProgress;
    /* access modifiers changed from: private */
    public VideoFrameThumbAdapter mRecyclerAdapter;
    private RecyclerView mRecyclerView;
    /* access modifiers changed from: private */
    public boolean mScrollIdle = true;

    public interface OnSeekBarChangeListener {
        void onProgressChanged(float f);

        void onScrollStateChanged(boolean z);
    }

    public VideoFrameSeekBar(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    public VideoFrameSeekBar(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
    }

    public float getProgress() {
        return this.mProgress;
    }

    /* access modifiers changed from: protected */
    public void onFinishInflate() {
        super.onFinishInflate();
        this.mContext = getContext();
        this.mRecyclerView = (RecyclerView) findViewById(R.id.video_frame_thumb_list);
        this.mRecyclerAdapter = new VideoFrameThumbAdapter(this.mContext);
        this.mRecyclerView.setLayoutManager(new LinearLayoutManager(this.mContext, 0, false));
        this.mRecyclerView.setAdapter(this.mRecyclerAdapter);
        this.mRecyclerView.setOverScrollMode(2);
        this.mRecyclerView.addOnScrollListener(new OnScrollListener() {
            public void onScrollStateChanged(RecyclerView recyclerView, int i) {
                boolean z = false;
                if (VideoFrameSeekBar.this.mScrollIdle && i != 0) {
                    VideoFrameSeekBar.this.mScrollIdle = false;
                }
                if (VideoFrameSeekBar.this.mOnSeekBarChangeListener != null) {
                    OnSeekBarChangeListener access$300 = VideoFrameSeekBar.this.mOnSeekBarChangeListener;
                    if (i != 0) {
                        z = true;
                    }
                    access$300.onScrollStateChanged(z);
                }
            }

            public void onScrolled(RecyclerView recyclerView, int i, int i2) {
                if (!VideoFrameSeekBar.this.mScrollIdle) {
                    VideoFrameSeekBar.this.mProgress = VideoFrameSeekBar.this.mRecyclerAdapter.getScrollPercent(recyclerView);
                    if (VideoFrameSeekBar.this.mOnSeekBarChangeListener != null) {
                        VideoFrameSeekBar.this.mOnSeekBarChangeListener.onProgressChanged(VideoFrameSeekBar.this.mProgress);
                    }
                }
            }
        });
    }

    /* access modifiers changed from: protected */
    public void onLayout(boolean z, int i, int i2, int i3, int i4) {
        super.onLayout(z, i, i2, i3, i4);
        if (z) {
            if (this.mRecyclerAdapter != null) {
                this.mRecyclerAdapter.configLayoutParams(i3 - i);
            }
            setProgress(this.mProgress);
        }
    }

    public void setFrameList(List<Bitmap> list) {
        this.mScrollIdle = true;
        if (this.mRecyclerAdapter != null) {
            this.mProgress = 0.0f;
            this.mRecyclerView.scrollToPosition(0);
            Log.d("VideoFrameSeekBar", "scrollToPosition 0");
            this.mRecyclerAdapter.updateDataList(list);
        }
    }

    public void setOnSeekBarChangeListener(OnSeekBarChangeListener onSeekBarChangeListener) {
        this.mOnSeekBarChangeListener = onSeekBarChangeListener;
    }

    public void setProgress(float f) {
        if (this.mRecyclerAdapter != null) {
            this.mRecyclerView.scrollBy(this.mRecyclerAdapter.getScrollOffset(this.mRecyclerView, f), 0);
            this.mProgress = f;
        }
    }
}
