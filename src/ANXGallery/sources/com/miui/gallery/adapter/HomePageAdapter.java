package com.miui.gallery.adapter;

import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.LayoutManager;
import android.view.View;
import android.view.ViewGroup;
import com.miui.gallery.R;
import com.miui.gallery.adapter.SyncStateDisplay.DisplayScene;
import com.miui.gallery.assistant.cache.ImageFeatureCacheManager;
import com.miui.gallery.ui.HomePageGridHeaderItem;
import com.miui.gallery.ui.HomePageGridItem;
import com.miui.gallery.util.BurstFilterCursor;
import com.miui.gallery.util.GalleryDateUtils;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.TalkBackUtil;
import com.miui.gallery.widget.recyclerview.BaseViewHolder;
import com.miui.gallery.widget.recyclerview.transition.FuzzyMatchItem;
import com.miui.gallery.widget.stickyheader.core.HeaderViewHolder;
import com.miui.gallery.widget.stickyheader.core.StickyHeaderAdapter;
import java.util.ArrayList;
import java.util.Collection;

public class HomePageAdapter extends PreloadMediaAdapter implements CheckableAdapter, StickyHeaderAdapter<HeaderViewHolder> {
    public static final String[] PROJECTION = {"_id", "alias_micro_thumbnail", "alias_create_date", "alias_create_time", "location", "sha1", "serverType", "duration", "mimeType", "alias_sync_state", "thumbnailFile", "localFile", "alias_clear_thumbnail", "alias_is_favorite", "specialTypeFlags", "alias_sort_time", "size", "title", "burst_group_id"};
    private ArrayList<Integer> mGroupItemCount;
    private ArrayList<String> mGroupStartLocations;
    private ArrayList<Integer> mGroupStartPos;

    public HomePageAdapter(Context context) {
        this(context, DisplayScene.SCENE_IN_CHECK_MODE);
    }

    public HomePageAdapter(Context context, DisplayScene displayScene) {
        super(context, displayScene);
    }

    private void bindContentDescription(View view, int i) {
        Cursor item = getItem(i);
        view.setContentDescription(TalkBackUtil.getContentDescriptionForImage(view.getContext(), item.getLong(3), item.getString(4), item.getString(8)));
    }

    private int getSyncState(Cursor cursor) {
        return getSyncStateInternal(cursor.getInt(9));
    }

    public void doBindData(BaseViewHolder baseViewHolder, int i) {
        int i2 = i;
        Log.d("HomePageAdapter", "doBindViewHolder %d", (Object) Integer.valueOf(i));
        HomePageGridItem homePageGridItem = (HomePageGridItem) baseViewHolder.itemView;
        homePageGridItem.bindImage(getItemId(i2), getClearThumbFilePath(i2), getDownloadUri(i2), getDisplayImageOptions(i2));
        Cursor item = getItem(i2);
        String string = item.getString(8);
        long j = item.getLong(7);
        long j2 = item.getLong(14);
        boolean z = (item instanceof BurstFilterCursor) && ((BurstFilterCursor) item).isBurstPosition(i2);
        if (z) {
            j2 |= 64;
        }
        homePageGridItem.bindIndicator(string, j, j2);
        homePageGridItem.bindFavoriteIndicator(isFavorite(item.getPosition()));
        int syncState = getSyncState(item);
        long j3 = item.getLong(0);
        homePageGridItem.bindSyncIndicator(j3, syncState, this.mShowScene);
        if (this.mViewScrollState == 0) {
            bindContentDescription(homePageGridItem, i2);
        }
        if (z) {
            homePageGridItem.setIsSimilarBestImage(ImageFeatureCacheManager.getInstance().shouldShowSelectionStar(j3, false, false, getBurstItemKeys(i2)));
        } else {
            homePageGridItem.setIsSimilarBestImage(ImageFeatureCacheManager.getInstance().shouldShowSelectionStar(j3, false, false));
        }
    }

    public FuzzyMatchItem findFuzzyMatchItem(FuzzyMatchItem fuzzyMatchItem) {
        int i;
        long j;
        String str;
        long j2;
        int i2;
        long itemKey;
        FuzzyMatchItem fuzzyMatchItem2 = fuzzyMatchItem;
        if (fuzzyMatchItem2 == null || this.mCursor == null) {
            return null;
        }
        int i3 = 1;
        while (true) {
            if (i3 >= this.mGroupStartPos.size()) {
                i = -1;
                break;
            }
            if (fuzzyMatchItem2.mDate > getItemSortTime(((Integer) this.mGroupStartPos.get(i3)).intValue())) {
                i = i3 - 1;
                break;
            }
            i3++;
        }
        if (i == -1) {
            i = this.mGroupStartPos.size() - 1;
        }
        if (i != -1 && i < this.mGroupStartPos.size()) {
            int intValue = ((Integer) this.mGroupStartPos.get(i)).intValue();
            int intValue2 = ((Integer) this.mGroupItemCount.get(i)).intValue() + intValue;
            while (true) {
                if (intValue >= intValue2) {
                    break;
                }
                itemKey = getItemKey(intValue);
                if (itemKey == fuzzyMatchItem2.mId || fuzzyMatchItem2.mDate > getItemSortTime(intValue) || intValue == intValue2 - 1) {
                    str = getItem(intValue).getString(4);
                    j = getItemSortTime(intValue);
                    i2 = intValue;
                    j2 = itemKey;
                } else {
                    intValue++;
                }
            }
            str = getItem(intValue).getString(4);
            j = getItemSortTime(intValue);
            i2 = intValue;
            j2 = itemKey;
            FuzzyMatchItem fuzzyMatchItem3 = new FuzzyMatchItem(i2, j2, str, j);
            return fuzzyMatchItem3;
        }
        str = null;
        j2 = -1;
        j = 0;
        i2 = i;
        FuzzyMatchItem fuzzyMatchItem32 = new FuzzyMatchItem(i2, j2, str, j);
        return fuzzyMatchItem32;
    }

    public ArrayList<Long> getBurstItemKeys(int i) {
        if (getCursor() != null) {
            return ((BurstFilterCursor) getCursor()).getBurstIdsInGroup(i, 0);
        }
        return null;
    }

    public View getCheckableView(View view) {
        return ((HomePageGridItem) view).getCheckBox();
    }

    public String getClearThumbFilePath(int i) {
        return getMicroPath(getItem(i), 12, 5);
    }

    public Uri getDownloadUri(int i) {
        return getDownloadUri(getItem(i), 9, 0);
    }

    public long getFileLength(int i) {
        return getItem(i).getLong(16);
    }

    public int getHeaderCount() {
        if (this.mGroupStartPos != null) {
            return this.mGroupStartPos.size();
        }
        return 0;
    }

    public long getHeaderId(int i) {
        return (long) i;
    }

    public int getHeaderIndex(int i) {
        if (this.mGroupStartPos == null || this.mGroupStartPos.isEmpty()) {
            return -1;
        }
        for (int i2 = 0; i2 < this.mGroupStartPos.size(); i2++) {
            if (i < ((Integer) this.mGroupStartPos.get(i2)).intValue()) {
                return i2 - 1;
            }
        }
        return this.mGroupStartPos.size() - 1;
    }

    public int getHeaderViewType(int i) {
        return 0;
    }

    public long getItemKey(int i) {
        return getItem(i).getLong(0);
    }

    public int[] getItemPositionInterval(int i) {
        if (this.mGroupStartPos == null || this.mGroupStartPos.isEmpty()) {
            return new int[]{-1, -1};
        }
        return new int[]{((Integer) this.mGroupStartPos.get(i)).intValue(), (i < this.mGroupStartPos.size() - 1 ? ((Integer) this.mGroupStartPos.get(i + 1)).intValue() : getItemCount()) - 1};
    }

    public long getItemSortTime(int i) {
        return getItem(i).getLong(15);
    }

    public String getLocalPath(int i) {
        return getMicroPath(getItem(i), 1, 5);
    }

    public String getMicroThumbFilePath(int i) {
        return getItem(i).getString(1);
    }

    public String getMimeType(int i) {
        return getItem(i).getString(8);
    }

    public String getOriginFilePath(int i) {
        return getItem(i).getString(11);
    }

    public String getSha1(int i) {
        return getItem(i).getString(5);
    }

    public String getThumbFilePath(int i) {
        return getItem(i).getString(10);
    }

    public boolean isFavorite(int i) {
        return getItem(i).getInt(13) > 0;
    }

    public void onBindHeaderViewHolder(HeaderViewHolder headerViewHolder, int i) {
        ((HomePageGridHeaderItem) headerViewHolder.itemView).bindData(GalleryDateUtils.formatRelativeDate(getItem(getItemPositionInterval(i)[0]).getLong(15)), (String) this.mGroupStartLocations.get(i));
    }

    public HeaderViewHolder onCreateHeaderViewHolder(ViewGroup viewGroup, int i) {
        Log.d("HomePageAdapter", "onCreateViewHolder %d", (Object) Integer.valueOf(i));
        return new HeaderViewHolder(HeaderViewHolder.getView(viewGroup, R.layout.home_page_grid_header_item));
    }

    public BaseViewHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
        return new BaseViewHolder(BaseViewHolder.getView(viewGroup, R.layout.home_page_grid_item));
    }

    public void onViewRecycled(BaseViewHolder baseViewHolder) {
        Log.d("HomePageAdapter", "onViewRecycled %d", (Object) Integer.valueOf(baseViewHolder.getAdapterPosition()));
        super.onViewRecycled(baseViewHolder);
    }

    /* access modifiers changed from: protected */
    public void onViewScrollStateChanged(RecyclerView recyclerView, int i) {
        super.onViewScrollStateChanged(recyclerView, i);
        if (i == 0) {
            LayoutManager layoutManager = recyclerView.getLayoutManager();
            int childCount = layoutManager.getChildCount();
            for (int i2 = 0; i2 < childCount; i2++) {
                View childAt = layoutManager.getChildAt(i2);
                Object tag = childAt.getTag(R.id.tag_item_position);
                if (tag != null) {
                    bindContentDescription(childAt, ((Integer) tag).intValue());
                }
            }
        }
    }

    public FuzzyMatchItem packageFuzzyMatchItem(int i) {
        FuzzyMatchItem fuzzyMatchItem = new FuzzyMatchItem(i, getItemKey(i), getItem(i).getString(4), getItem(i).getLong(15));
        return fuzzyMatchItem;
    }

    public Cursor swapCursor(Cursor cursor) {
        Collection collection;
        BurstFilterCursor burstFilterCursor;
        Collection collection2;
        Collection collection3 = null;
        if (cursor != null) {
            BurstFilterCursor burstFilterCursor2 = new BurstFilterCursor(cursor);
            Bundle extras = cursor.getExtras();
            ArrayList integerArrayList = extras.getIntegerArrayList("extra_timeline_item_count_in_group");
            collection = extras.getIntegerArrayList("extra_timeline_group_start_pos");
            collection2 = extras.getStringArrayList("extra_timeline_group_start_locations");
            Collection collection4 = integerArrayList;
            burstFilterCursor = burstFilterCursor2;
            collection3 = collection4;
        } else {
            collection2 = null;
            burstFilterCursor = null;
            collection = null;
        }
        if (collection3 == null || collection == null || collection2 == null) {
            if (this.mGroupItemCount != null) {
                this.mGroupItemCount.clear();
            }
            if (this.mGroupStartPos != null) {
                this.mGroupStartPos.clear();
            }
            if (this.mGroupStartLocations != null) {
                this.mGroupStartLocations.clear();
            }
        } else {
            this.mGroupItemCount = new ArrayList<>(collection3);
            this.mGroupStartPos = new ArrayList<>(collection);
            this.mGroupStartLocations = new ArrayList<>(collection2);
            ArrayList resultPos = burstFilterCursor.getResultPos();
            if (MiscUtil.isValid(resultPos)) {
                BurstFilterCursor.wrapGroupInfos(resultPos, cursor.getCount(), this.mGroupStartPos, this.mGroupItemCount);
            }
        }
        return super.swapCursor(burstFilterCursor);
    }
}
