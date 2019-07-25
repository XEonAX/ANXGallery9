package com.miui.gallery.adapter;

import android.util.SparseLongArray;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.miui.gallery.BaseConfig.ScreenConfig;
import com.miui.gallery.R;
import com.miui.gallery.model.BaseDataItem;
import com.miui.gallery.model.BaseDataSet;
import com.miui.gallery.model.ImageLoadParams;
import com.miui.gallery.provider.ProcessingMedia;
import com.miui.gallery.ui.PhotoPageFragmentBase.PhotoPageInteractionListener;
import com.miui.gallery.ui.PhotoPageItem;
import com.miui.gallery.ui.PhotoPageItem.OnImageLoadFinishListener;
import com.miui.gallery.ui.PhotoPageItem.TransitionListener;
import com.miui.gallery.util.ExifUtil;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.photoview.ItemViewInfo;
import com.miui.gallery.util.photoview.PhotoPageDataCache;
import com.miui.gallery.widget.PagerAdapter;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

public class PhotoPageAdapter extends PagerAdapter implements OnImageLoadFinishListener, TransitionListener {
    private boolean isPreviewing;
    private LinkedList<WeakReference<PhotoPageItem>>[] mCachedViews;
    private Source mCheckSource = new Source() {
        public int getCount() {
            return PhotoPageAdapter.this.getCount();
        }

        public long getItemKey(int i) {
            if (PhotoPageAdapter.this.mDataSet != null) {
                return PhotoPageAdapter.this.mDataSet.getItemKey(i);
            }
            return -1;
        }

        public int getItemPos(long j, int i) {
            if (PhotoPageAdapter.this.mDataSet != null) {
                return PhotoPageAdapter.this.mDataSet.getIndexOfItem(new BaseDataItem().setKey(j), i);
            }
            return -1;
        }

        public void notifyCheckState() {
            PhotoPageAdapter.this.notifyDataSetChanged();
        }
    };
    private ChoiceMode mChoiceMode;
    /* access modifiers changed from: private */
    public BaseDataSet mDataSet;
    private int mInitCount;
    private PhotoPageInteractionListener mPhotoPageInteractionListener;
    private ImageLoadParams mPreviewCache;
    private OnPreviewedListener mPreviewedListener;
    private WeakReference<PhotoPageItem> mPreviewingItem;
    private Map<String, ProcessingMedia> mProcessingMediaMap;
    private ItemViewInfo mTransitInfo;

    private static class CheckState {
        private SparseLongArray mSelectedIds;
        private Source mSource;

        public interface Source {
            int getCount();

            long getItemKey(int i);

            int getItemPos(long j, int i);

            void notifyCheckState();
        }

        public CheckState(Source source) {
            this.mSource = source;
            this.mSelectedIds = new SparseLongArray(source.getCount());
        }

        public void appendCheck(int i, long j) {
            this.mSelectedIds.append(i, j);
        }

        public List<Integer> getSelectedPositions() {
            int size = this.mSelectedIds.size();
            ArrayList arrayList = new ArrayList(size);
            for (int i = 0; i < size; i++) {
                arrayList.add(Integer.valueOf(this.mSelectedIds.keyAt(i)));
            }
            return arrayList;
        }

        public boolean isCheckedId(long j) {
            return this.mSelectedIds.indexOfValue(j) > -1;
        }

        public void notifyDataChanged() {
            int size = this.mSelectedIds.size();
            if (size > 0) {
                SparseLongArray sparseLongArray = new SparseLongArray(size);
                for (int i = 0; i < size; i++) {
                    long valueAt = this.mSelectedIds.valueAt(i);
                    int itemPos = this.mSource.getItemPos(valueAt, this.mSelectedIds.keyAt(i));
                    if (itemPos > -1) {
                        sparseLongArray.put(itemPos, valueAt);
                    }
                }
                this.mSelectedIds = sparseLongArray;
            }
        }

        public void setChecked(int i, long j, boolean z) {
            if (z) {
                this.mSelectedIds.put(i, j);
            } else {
                this.mSelectedIds.delete(i);
            }
        }
    }

    public static class ChoiceMode {
        /* access modifiers changed from: private */
        public MultiChoiceModeListener mChoiceModeListener;
        private boolean mInAction = false;
        /* access modifiers changed from: private */
        public CheckState mOriginCheck;
        private ChoiceModeInterface mOriginInterface;
        private ChoiceModeInterface mRenderInterface;
        /* access modifiers changed from: private */
        public CheckState mRenderState;
        /* access modifiers changed from: private */
        public CheckState mSelectCheck;
        private ChoiceModeInterface mSelectInterface;
        /* access modifiers changed from: private */
        public Source mSource;

        ChoiceMode(Source source, MultiChoiceModeListener multiChoiceModeListener) {
            this.mOriginCheck = new CheckState(source);
            this.mSelectCheck = new CheckState(source);
            this.mRenderState = new CheckState(source);
            this.mSource = source;
            this.mChoiceModeListener = multiChoiceModeListener;
            this.mInAction = true;
        }

        /* access modifiers changed from: private */
        public boolean isInAction() {
            return this.mInAction;
        }

        private void refreshAllState(boolean z) {
            int count = this.mSource.getCount();
            for (int i = 0; i < count; i++) {
                long itemKey = this.mSource.getItemKey(i);
                this.mSelectCheck.setChecked(i, itemKey, z);
                if (!z) {
                    this.mOriginCheck.setChecked(i, itemKey, z);
                    this.mRenderState.setChecked(i, itemKey, z);
                }
            }
            this.mSource.notifyCheckState();
        }

        public void appendCheck(int i, long j) {
            this.mSelectCheck.appendCheck(i, j);
        }

        public void chooseAll() {
            refreshAllState(true);
            if (this.mChoiceModeListener != null) {
                this.mChoiceModeListener.onAllItemsCheckedStateChanged(true);
            }
        }

        public void finish() {
            this.mInAction = false;
            this.mSource.notifyCheckState();
        }

        public void finishInit() {
            this.mSource.notifyCheckState();
            if (this.mChoiceModeListener != null) {
                this.mChoiceModeListener.onItemCheckedStateChanged(0, this.mSource.getItemKey(0), true);
            }
        }

        public int getCount() {
            return this.mSource.getCount();
        }

        /* access modifiers changed from: protected */
        public ChoiceModeInterface getOriginIInstance() {
            if (this.mOriginInterface == null) {
                this.mOriginInterface = new ChoiceModeInterface() {
                    public boolean isChecked(long j) {
                        return ChoiceMode.this.mOriginCheck.isCheckedId(j);
                    }

                    public void onItemCheckedChanged(int i, long j, boolean z) {
                        if (z) {
                            ChoiceMode.this.mSelectCheck.setChecked(i, j, z);
                        }
                        int count = ChoiceMode.this.mSource.getCount();
                        for (int i2 = 0; i2 < count; i2++) {
                            ChoiceMode.this.mOriginCheck.setChecked(i2, ChoiceMode.this.mSource.getItemKey(i2), z);
                        }
                        ChoiceMode.this.mSource.notifyCheckState();
                        if (ChoiceMode.this.mChoiceModeListener != null) {
                            ChoiceMode.this.mChoiceModeListener.onItemCheckedStateChanged(i, j, z);
                        }
                    }

                    public void setChecked(int i, long j, boolean z) {
                        ChoiceMode.this.mOriginCheck.setChecked(i, j, z);
                    }
                };
            }
            return this.mOriginInterface;
        }

        public List<Integer> getOriginItems() {
            return this.mOriginCheck.getSelectedPositions();
        }

        /* access modifiers changed from: protected */
        public ChoiceModeInterface getRenderIInstance() {
            if (this.mRenderInterface == null) {
                this.mRenderInterface = new ChoiceModeInterface() {
                    public boolean isChecked(long j) {
                        return ChoiceMode.this.mRenderState.isCheckedId(j);
                    }

                    public void onItemCheckedChanged(int i, long j, boolean z) {
                        ChoiceMode.this.mRenderState.setChecked(i, j, z);
                    }

                    public void setChecked(int i, long j, boolean z) {
                        ChoiceMode.this.mRenderState.setChecked(i, j, z);
                    }
                };
            }
            return this.mRenderInterface;
        }

        public List<Integer> getRenderItems() {
            return this.mRenderState.getSelectedPositions();
        }

        /* access modifiers changed from: protected */
        public ChoiceModeInterface getSelectIInstance() {
            if (this.mSelectInterface == null) {
                this.mSelectInterface = new ChoiceModeInterface() {
                    public boolean isChecked(long j) {
                        return ChoiceMode.this.mSelectCheck.isCheckedId(j);
                    }

                    public void onItemCheckedChanged(int i, long j, boolean z) {
                        ChoiceMode.this.mSelectCheck.setChecked(i, j, z);
                        if (ChoiceMode.this.mChoiceModeListener != null) {
                            ChoiceMode.this.mChoiceModeListener.onItemCheckedStateChanged(i, j, z);
                        }
                    }

                    public void setChecked(int i, long j, boolean z) {
                        ChoiceMode.this.mSelectCheck.setChecked(i, j, z);
                    }
                };
            }
            return this.mSelectInterface;
        }

        public List<Integer> getSelectItems() {
            return this.mSelectCheck.getSelectedPositions();
        }

        public void notifyDataChanged() {
            this.mOriginCheck.notifyDataChanged();
            this.mSelectCheck.notifyDataChanged();
            this.mRenderState.notifyDataChanged();
        }

        public void setChecked(int i, long j, boolean z) {
            this.mSelectCheck.setChecked(i, j, z);
            this.mSource.notifyCheckState();
            if (this.mChoiceModeListener != null) {
                this.mChoiceModeListener.onItemCheckedStateChanged(i, j, z);
            }
        }

        public void setRenderChecked(int i, long j, boolean z) {
            this.mRenderState.setChecked(i, j, z);
        }

        /* access modifiers changed from: 0000 */
        public void startAction() {
            this.mInAction = true;
            this.mSource.notifyCheckState();
        }

        public void unChooseAll() {
            refreshAllState(false);
            if (this.mChoiceModeListener != null) {
                this.mChoiceModeListener.onAllItemsCheckedStateChanged(true);
            }
        }
    }

    public interface ChoiceModeInterface {
        boolean isChecked(long j);

        void onItemCheckedChanged(int i, long j, boolean z);

        void setChecked(int i, long j, boolean z);
    }

    public interface MultiChoiceModeListener {
        void onAllItemsCheckedStateChanged(boolean z);

        void onItemCheckedStateChanged(int i, long j, boolean z);
    }

    public interface OnPreviewedListener {
        void onPreviewed();
    }

    public static class PlaceHolderItem {
    }

    public PhotoPageAdapter(int i, ImageLoadParams imageLoadParams, ItemViewInfo itemViewInfo, OnPreviewedListener onPreviewedListener, PhotoPageInteractionListener photoPageInteractionListener) {
        this.mInitCount = i;
        this.mPreviewCache = imageLoadParams;
        this.mTransitInfo = itemViewInfo;
        int viewTypeCount = getViewTypeCount();
        this.mCachedViews = new LinkedList[viewTypeCount];
        for (int i2 = 0; i2 < viewTypeCount; i2++) {
            this.mCachedViews[i2] = new LinkedList<>();
        }
        this.mPreviewedListener = onPreviewedListener;
        this.mPhotoPageInteractionListener = photoPageInteractionListener;
        if (this.mPreviewCache != null) {
            this.isPreviewing = true;
        }
    }

    private void bindData(PhotoPageItem photoPageItem, int i) {
        photoPageItem.setTag(R.id.tag_item_position, Integer.valueOf(i));
        ProcessingMedia processingMedia = null;
        if (this.isPreviewing) {
            if (this.mPreviewCache.match(null, i)) {
                if (this.mPreviewingItem == null) {
                    this.mPreviewingItem = new WeakReference<>(photoPageItem);
                }
                if (photoPageItem.getCacheItem() == null) {
                    photoPageItem.setCacheItem(this.mPreviewCache, this);
                    if (needTransit()) {
                        photoPageItem.animEnter(this.mTransitInfo, this);
                    }
                }
                if (this.mDataSet != null && photoPageItem.getDataItem() == null) {
                    BaseDataItem dataItem = getDataItem(this.mDataSet.getIndexOfItem(new BaseDataItem().setKey(this.mPreviewCache.getKey()), this.mPreviewCache.getPos()));
                    if (dataItem != null) {
                        if (this.mProcessingMediaMap != null) {
                            processingMedia = (ProcessingMedia) this.mProcessingMediaMap.get(dataItem.getOriginalPath());
                        }
                        photoPageItem.setProcessingMedia(processingMedia);
                        photoPageItem.swapItem(dataItem);
                    }
                }
            }
        } else if (this.mDataSet != null) {
            BaseDataItem dataItem2 = getDataItem(i);
            ProcessingMedia processingMedia2 = photoPageItem.getProcessingMedia();
            if (!(this.mProcessingMediaMap == null || dataItem2 == null)) {
                processingMedia = (ProcessingMedia) this.mProcessingMediaMap.get(dataItem2.getOriginalPath());
            }
            photoPageItem.setProcessingMedia(processingMedia);
            BaseDataItem dataItem3 = photoPageItem.getDataItem();
            if (dataItem3 == null || dataItem3.isModified(dataItem2) || isProcessingStatusChanged(processingMedia2, processingMedia)) {
                if (this.mPreviewCache == null || !this.mPreviewCache.match(dataItem2, i)) {
                    photoPageItem.swapItem(dataItem2);
                } else {
                    photoPageItem.swapItem(dataItem2, this.mPreviewCache);
                }
            }
            if (this.mPreviewCache == null) {
                notifyPreviewedCallback();
            }
        }
    }

    private void clearPreviewParams() {
        this.isPreviewing = false;
        if (this.mPreviewingItem != null) {
            this.mPreviewingItem.clear();
            this.mPreviewingItem = null;
        }
    }

    public static float getMinSlideHeight() {
        return ((float) ScreenConfig.getScreenHeight()) * 0.2f;
    }

    public static float getMinSlideWidth() {
        return ((float) ScreenConfig.getScreenWidth()) * 0.5f;
    }

    private PhotoPageItem getPageItem(int i, ViewGroup viewGroup) {
        if (this.mCachedViews[i].size() > 0) {
            WeakReference weakReference = (WeakReference) this.mCachedViews[i].removeFirst();
            if (weakReference != null) {
                PhotoPageItem photoPageItem = (PhotoPageItem) weakReference.get();
                if (photoPageItem != null) {
                    Log.d("PhotoPageAdapter", "instantiateItem reuse photoview");
                    return photoPageItem;
                }
            }
        }
        if (isPreviewing()) {
            View cacheItem = PhotoPageDataCache.getInstance().getCacheItem();
            if (cacheItem != null) {
                Log.d("PhotoPageAdapter", "cache item");
                return (PhotoPageItem) cacheItem;
            }
        }
        Log.d("PhotoPageAdapter", "instantiateItem new photoview");
        return (PhotoPageItem) LayoutInflater.from(viewGroup.getContext()).inflate(getLayoutId(i), viewGroup, false);
    }

    public static boolean isItemValidate(Object obj) {
        return obj != null && (obj instanceof PhotoPageItem);
    }

    private boolean isProcessingStatusChanged(ProcessingMedia processingMedia, ProcessingMedia processingMedia2) {
        return (processingMedia != null && processingMedia2 == null) || (processingMedia2 != null && processingMedia == null);
    }

    private boolean needTransit() {
        return this.mTransitInfo != null && this.mTransitInfo.isLocationValid();
    }

    private void notifyPreviewedCallback() {
        if (this.mPreviewedListener != null) {
            Log.i("PhotoPageAdapter", "notifyPreviewedCallback");
            this.mPreviewedListener.onPreviewed();
            this.mPreviewedListener = null;
        }
    }

    private void onPreviewedEnd() {
        if (this.isPreviewing) {
            notifyPreviewedCallback();
            clearPreviewParams();
            if (this.mDataSet != null) {
                notifyDataSetChanged();
            }
        }
    }

    private void startOrFinishItemActionMode(PhotoPageItem photoPageItem) {
        if (this.mChoiceMode == null || !this.mChoiceMode.isInAction()) {
            photoPageItem.finishActionMode();
        } else {
            photoPageItem.startActionMode(this.mChoiceMode.getOriginIInstance(), this.mChoiceMode.getSelectIInstance(), this.mChoiceMode.getRenderIInstance());
        }
    }

    public void changeDataSet(BaseDataSet baseDataSet) {
        changeDataSet(baseDataSet, false);
    }

    public void changeDataSet(BaseDataSet baseDataSet, boolean z) {
        Log.d("PhotoPageAdapter", "change dataset [%s] to [%s], ignoreDelayNotify %s", this.mDataSet, baseDataSet, Boolean.valueOf(z));
        if (this.isPreviewing && z) {
            clearPreviewParams();
            notifyPreviewedCallback();
        }
        this.mDataSet = baseDataSet;
        boolean z2 = true;
        if (this.isPreviewing) {
            PhotoPageItem photoPageItem = this.mPreviewingItem != null ? (PhotoPageItem) this.mPreviewingItem.get() : null;
            if (photoPageItem != null) {
                refreshItem(photoPageItem, this.mPreviewCache.getPos());
                z2 = false;
            }
        }
        if (z2) {
            notifyDataSetChanged();
        }
        if (this.mChoiceMode != null) {
            this.mChoiceMode.notifyDataChanged();
        }
    }

    public void destroyItem(ViewGroup viewGroup, int i, Object obj) {
        if (isItemValidate(obj)) {
            Log.d("PhotoPageAdapter", "destroyItem %d", (Object) Integer.valueOf(i));
            PhotoPageItem photoPageItem = (PhotoPageItem) obj;
            viewGroup.removeView(photoPageItem);
            this.mCachedViews[((Integer) photoPageItem.getTag(R.id.tag_view_type)).intValue()].add(new WeakReference(photoPageItem));
            photoPageItem.setPhotoPageCallback(null);
        }
    }

    public int getCount() {
        return (this.isPreviewing || this.mDataSet == null) ? this.mInitCount : this.mDataSet.getCount();
    }

    public BaseDataItem getDataItem(int i) {
        if (this.mDataSet == null || i < 0 || i >= this.mDataSet.getCount()) {
            return null;
        }
        return this.mDataSet.getItem(null, i);
    }

    public BaseDataSet getDataSet() {
        return this.mDataSet;
    }

    public int getItemPosition(Object obj, int i) {
        if (this.isPreviewing) {
            return isItemValidate(obj) ? -3 : -1;
        }
        if (this.mDataSet != null) {
            return (i < 0 || i >= this.mDataSet.getCount() || !isTypeMatch(obj, i)) ? -2 : -3;
        }
        return -1;
    }

    /* access modifiers changed from: protected */
    public int getLayoutId(int i) {
        switch (i) {
            case 0:
                return R.layout.photo_page_image_item;
            case 1:
                return R.layout.photo_page_gif_item;
            case 2:
                return R.layout.photo_page_video_item;
            case 3:
                return R.layout.photo_page_face_item;
            default:
                return 0;
        }
    }

    public int getSlipWidth(int i, int i2) {
        BaseDataItem dataItem = getDataItem(i2);
        if (dataItem != null && dataItem.getWidth() > 0 && dataItem.getHeight() > 0) {
            float height = ExifUtil.isWidthHeightRotated(dataItem.getOrientation()) ? ((((float) i) * 1.0f) * ((float) dataItem.getHeight())) / ((float) dataItem.getWidth()) : ((((float) i) * 1.0f) * ((float) dataItem.getWidth())) / ((float) dataItem.getHeight());
            if (height > getMinSlideWidth()) {
                return (int) height;
            }
        }
        return super.getSlipWidth(i, i2);
    }

    /* access modifiers changed from: protected */
    public int getViewType(int i) {
        BaseDataItem dataItem = getDataItem(i);
        if (this.isPreviewing) {
            if (this.mPreviewCache.match(dataItem, i)) {
                if (this.mPreviewCache.isGif()) {
                    return 1;
                }
                if (this.mPreviewCache.isVideo()) {
                    return 2;
                }
                return this.mPreviewCache.isFromFace() ? 3 : 0;
            }
        } else if (dataItem != null) {
            if (dataItem.isGif()) {
                return 1;
            }
            if (dataItem.isVideo()) {
                return 2;
            }
            return dataItem.hasFace() ? 3 : 0;
        }
        return -1;
    }

    /* access modifiers changed from: protected */
    public int getViewTypeCount() {
        return 4;
    }

    public Object instantiateItem(ViewGroup viewGroup, int i) {
        int viewType = getViewType(i);
        if (viewType == -1) {
            return new PlaceHolderItem();
        }
        Log.d("PhotoPageAdapter", "instantiateItem %d", (Object) Integer.valueOf(i));
        PhotoPageItem pageItem = getPageItem(viewType, viewGroup);
        bindData(pageItem, i);
        pageItem.setTag(R.id.tag_view_type, Integer.valueOf(viewType));
        viewGroup.addView(pageItem, -1, -1);
        pageItem.setPhotoPageCallback(this.mPhotoPageInteractionListener);
        startOrFinishItemActionMode(pageItem);
        return pageItem;
    }

    public boolean isPreviewing() {
        return this.isPreviewing;
    }

    /* access modifiers changed from: protected */
    public boolean isTypeMatch(Object obj, int i) {
        boolean z = false;
        if (isItemValidate(obj)) {
            Integer num = (Integer) ((PhotoPageItem) obj).getTag(R.id.tag_view_type);
            BaseDataItem dataItem = getDataItem(i);
            if (dataItem != null) {
                if ((dataItem.isVideo() && num.intValue() == 2) || ((dataItem.isGif() && num.intValue() == 1) || ((dataItem.hasFace() && num.intValue() == 3) || (!dataItem.isVideo() && !dataItem.isGif() && !dataItem.hasFace() && num.intValue() == 0)))) {
                    z = true;
                }
                return z;
            }
        }
        return false;
    }

    public boolean isViewFromObject(View view, Object obj) {
        return view == obj;
    }

    public void onImageLoadFinish(boolean z, String str) {
        if (!needTransit()) {
            onPreviewedEnd();
        }
    }

    public void onTransitEnd() {
        Log.i("PhotoPageAdapter", "onTransitEnd");
        onPreviewedEnd();
    }

    public void refreshItem(Object obj, int i) {
        if (isItemValidate(obj)) {
            Log.d("PhotoPageAdapter", "refreshItem %d", (Object) Integer.valueOf(i));
            PhotoPageItem photoPageItem = (PhotoPageItem) obj;
            bindData(photoPageItem, i);
            startOrFinishItemActionMode(photoPageItem);
        }
    }

    public void setProcessingMedias(Map<String, ProcessingMedia> map) {
        this.mProcessingMediaMap = map;
    }

    public ChoiceMode startActionMode(MultiChoiceModeListener multiChoiceModeListener) {
        if (this.mChoiceMode == null) {
            this.mChoiceMode = new ChoiceMode(this.mCheckSource, multiChoiceModeListener);
        }
        this.mChoiceMode.startAction();
        return this.mChoiceMode;
    }
}
