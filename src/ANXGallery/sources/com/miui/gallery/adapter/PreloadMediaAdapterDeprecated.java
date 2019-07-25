package com.miui.gallery.adapter;

import android.content.Context;
import android.database.Cursor;
import android.view.View;
import android.widget.AbsListView;
import android.widget.AbsListView.OnScrollListener;
import com.miui.gallery.Config.ThumbConfig;
import com.miui.gallery.adapter.SyncStateDisplay.DisplayScene;
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

public abstract class PreloadMediaAdapterDeprecated extends BaseMediaSyncStateAdapter {
    private PreloadOnScrollListener mPreloadListener;
    private int mPreloadNum = ThumbConfig.get().sPreloadNum;
    private List<PreloadViewAware> mPreloadViewList = new LinkedList();
    private List<PreloadViewAware> mRecycleViewList = new LinkedList();

    public static class PreloadOnScrollListener implements OnScrollListener {
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

        public void onScroll(AbsListView absListView, int i, int i2, int i3) {
            if (i != this.mFirstVisiblePos) {
                this.mScrollState = i > this.mFirstVisiblePos ? 0 : 1;
            }
            this.mFirstVisiblePos = i;
            this.mLastVisiblePos = (this.mFirstVisiblePos + i2) - 1;
            if (this.mScrollListener != null) {
                this.mScrollListener.onScroll(absListView, i, i2, i3);
            }
        }

        public void onScrollStateChanged(AbsListView absListView, int i) {
            if (this.mScrollListener != null) {
                this.mScrollListener.onScrollStateChanged(absListView, i);
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

    public PreloadMediaAdapterDeprecated(Context context, DisplayScene displayScene) {
        super(context, displayScene);
    }

    public PreloadMediaAdapterDeprecated(Context context, DisplayScene displayScene, int i) {
        super(context, displayScene, i);
    }

    /* JADX WARNING: Removed duplicated region for block: B:10:0x0033 A[RETURN] */
    private void doPreload(Context context, Cursor cursor) {
        boolean z;
        boolean isBackwards = isBackwards();
        int position = cursor.getPosition();
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
            if (!isBackwards ? preloadViewAware.position < position : preloadViewAware.position > position) {
                break;
            }
            it.remove();
            this.mRecycleViewList.add(preloadViewAware);
        }
        int i = -1;
        int i2 = (isBackwards ? 1 : -1) + position;
        if (this.mPreloadViewList.size() > 0) {
            int i3 = ((PreloadViewAware) this.mPreloadViewList.get(this.mPreloadViewList.size() - 1)).position;
            if (isBackwards) {
                i = 1;
            }
            i2 = i3 + i;
        }
        int min = isBackwards ? Math.min(position + this.mPreloadNum, cursor.getCount() - 1) : Math.max(position - this.mPreloadNum, 0);
        if (isBackwards) {
            while (i2 <= min) {
                loadImage(i2);
                i2++;
            }
        } else {
            while (i2 >= min) {
                loadImage(i2);
                i2--;
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

    private void preload(Context context, Cursor cursor) {
        if (needPreload(cursor.getPosition())) {
            doPreload(context, cursor);
        }
    }

    /* access modifiers changed from: protected */
    public abstract void doBindData(View view, Context context, Cursor cursor);

    /* access modifiers changed from: protected */
    public final void doBindView(View view, Context context, Cursor cursor) {
        doBindData(view, context, cursor);
        preload(context, cursor);
    }

    public OnScrollListener generateWrapScrollListener(OnScrollListener onScrollListener) {
        this.mPreloadListener = new PreloadOnScrollListener(super.generateWrapScrollListener(onScrollListener));
        return this.mPreloadListener;
    }

    public void setPreloadNum(int i) {
        this.mPreloadNum = i;
    }
}
