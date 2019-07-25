package com.miui.gallery.adapter;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.OnScrollListener;
import com.miui.gallery.Config.ThumbConfig;
import com.miui.gallery.adapter.SyncStateDisplay.DisplayScene;
import com.miui.gallery.widget.recyclerview.BaseViewHolder;
import com.miui.gallery.widget.recyclerview.GalleryRecyclerView;
import com.nostra13.universalimageloader.core.DisplayImageOptions.Builder;
import com.nostra13.universalimageloader.core.ImageLoader;
import com.nostra13.universalimageloader.core.assist.ImageSize;
import com.nostra13.universalimageloader.core.assist.ViewScaleType;
import com.nostra13.universalimageloader.core.download.ImageDownloader.Scheme;
import com.nostra13.universalimageloader.core.imageaware.ImageAware;
import com.nostra13.universalimageloader.core.imageaware.NonViewAware;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

public abstract class PreloadMediaAdapter extends BaseMediaAdapter<BaseViewHolder> {
    private PreloadOnScrollListener mPreloadListener;
    private int mPreloadNum = ThumbConfig.get().sPreloadNum;
    private List<PreloadViewAware> mPreloadViewList = new LinkedList();
    private List<PreloadViewAware> mRecycleViewList = new LinkedList();

    public static class PreloadOnScrollListener extends OnScrollListener {
        private int mFirstVisiblePos = 0;
        private int mLastVisiblePos = 0;
        private OnScrollListener mScrollListener;
        private int mScrollState = 0;

        public PreloadOnScrollListener(OnScrollListener onScrollListener) {
            this.mScrollListener = onScrollListener;
        }

        public int getFirstPosition() {
            return this.mFirstVisiblePos;
        }

        public int getLastPosition() {
            return this.mLastVisiblePos;
        }

        public int getScrollState() {
            return this.mScrollState;
        }

        public void onScrollStateChanged(RecyclerView recyclerView, int i) {
            super.onScrollStateChanged(recyclerView, i);
            if (this.mScrollListener != null) {
                this.mScrollListener.onScrollStateChanged(recyclerView, i);
            }
        }

        public void onScrolled(RecyclerView recyclerView, int i, int i2) {
            super.onScrolled(recyclerView, i, i2);
            GalleryRecyclerView galleryRecyclerView = (GalleryRecyclerView) recyclerView;
            int findFirstVisibleItemPosition = galleryRecyclerView.findFirstVisibleItemPosition();
            int findLastVisibleItemPosition = galleryRecyclerView.findLastVisibleItemPosition();
            if (findFirstVisibleItemPosition != this.mFirstVisiblePos) {
                this.mScrollState = findFirstVisibleItemPosition > this.mFirstVisiblePos ? 0 : 1;
            }
            this.mFirstVisiblePos = findFirstVisibleItemPosition;
            this.mLastVisiblePos = findLastVisibleItemPosition;
            if (this.mScrollListener != null) {
                this.mScrollListener.onScrolled(recyclerView, i, i2);
            }
        }
    }

    private static class PreloadViewAware extends NonViewAware {
        protected int position;

        public PreloadViewAware(ImageSize imageSize, ViewScaleType viewScaleType) {
            super(imageSize, viewScaleType);
        }

        public PreloadViewAware setImageSize(ImageSize imageSize) {
            this.imageSize = imageSize;
            return this;
        }

        public PreloadViewAware setImageUri(String str) {
            this.imageUri = str;
            return this;
        }

        public PreloadViewAware setPosition(int i) {
            this.position = i;
            return this;
        }

        public PreloadViewAware setScaleType(ViewScaleType viewScaleType) {
            this.scaleType = viewScaleType;
            return this;
        }
    }

    public PreloadMediaAdapter(Context context, DisplayScene displayScene) {
        super(context, displayScene);
    }

    /* JADX WARNING: Removed duplicated region for block: B:10:0x002f A[RETURN] */
    private void doPreload(int i) {
        boolean z;
        boolean isBackwards = isBackwards();
        if (this.mPreloadViewList.size() > 0) {
            if (isBackwards) {
                z = false;
                if (z) {
                    return;
                }
            } else {
                z = false;
                if (z) {
                }
            }
            z = true;
            if (z) {
            }
        }
        Iterator it = this.mPreloadViewList.iterator();
        while (it.hasNext()) {
            PreloadViewAware preloadViewAware = (PreloadViewAware) it.next();
            if (!isBackwards ? preloadViewAware.position < i : preloadViewAware.position > i) {
                break;
            }
            it.remove();
            this.mRecycleViewList.add(preloadViewAware);
        }
        int i2 = -1;
        int i3 = (isBackwards ? 1 : -1) + i;
        if (this.mPreloadViewList.size() > 0) {
            int i4 = ((PreloadViewAware) this.mPreloadViewList.get(this.mPreloadViewList.size() - 1)).position;
            if (isBackwards) {
                i2 = 1;
            }
            i3 = i4 + i2;
        }
        int min = isBackwards ? Math.min(i + this.mPreloadNum, getItemCount() - 1) : Math.max(i - this.mPreloadNum, 0);
        if (isBackwards) {
            while (i3 <= min) {
                loadImage(i3);
                i3++;
            }
        } else {
            while (i3 >= min) {
                loadImage(i3);
                i3--;
            }
        }
    }

    private PreloadViewAware getViewAware() {
        return this.mRecycleViewList.size() > 0 ? (PreloadViewAware) this.mRecycleViewList.remove(0) : new PreloadViewAware(ThumbConfig.get().sMicroTargetSize, ViewScaleType.CROP);
    }

    private boolean isBackwards() {
        return this.mPreloadListener.getScrollState() == 0;
    }

    private void loadImage(int i) {
        PreloadViewAware viewAware = getViewAware();
        String wrap = Scheme.FILE.wrap(getClearThumbFilePath(i));
        viewAware.setPosition(i).setImageUri(wrap).setImageSize(getDisplayImageSize(i)).setScaleType(getDisplayScaleType(i));
        ImageLoader.getInstance().displayImage(wrap, (ImageAware) viewAware, new Builder().cloneFrom(getDisplayImageOptions(i)).cacheInMemory(false).cacheInSubMemory(true).preferSyncLoadFromMicroCache(false).build());
        this.mPreloadViewList.add(viewAware);
    }

    private boolean needPreload(int i) {
        boolean z = false;
        if (this.mPreloadNum <= 0 || this.mPreloadListener == null) {
            return false;
        }
        switch (this.mPreloadListener.getScrollState()) {
            case 0:
                if (i >= this.mPreloadListener.getLastPosition()) {
                    z = true;
                }
                return z;
            case 1:
                if (i <= this.mPreloadListener.getFirstPosition()) {
                    z = true;
                }
                return z;
            default:
                return false;
        }
    }

    private void preload(int i) {
        if (needPreload(i)) {
            doPreload(i);
        }
    }

    /* access modifiers changed from: protected */
    public abstract void doBindData(BaseViewHolder baseViewHolder, int i);

    public final void doBindViewHolder(BaseViewHolder baseViewHolder, int i) {
        doBindData(baseViewHolder, i);
        preload(i);
    }

    public OnScrollListener generateWrapScrollListener(OnScrollListener onScrollListener) {
        this.mPreloadListener = new PreloadOnScrollListener(super.generateWrapScrollListener(onScrollListener));
        return this.mPreloadListener;
    }

    /* access modifiers changed from: protected */
    public void initDisplayImageOptions() {
        super.initDisplayImageOptions();
        this.mDisplayImageOptionBuilder.preferSyncLoadFromMicroCache(false);
        this.mDefaultDisplayImageOptions = this.mDisplayImageOptionBuilder.build();
    }
}
