package com.miui.gallery.search.resultpage;

import android.text.TextUtils;
import android.util.SparseArray;
import android.util.SparseBooleanArray;
import com.miui.gallery.search.core.QueryInfo;
import com.miui.gallery.search.core.suggestion.GroupedSuggestionCursor;
import com.miui.gallery.search.core.suggestion.Suggestion;
import com.miui.gallery.search.core.suggestion.SuggestionSection;
import java.util.ArrayList;
import java.util.List;

class ImageResultSuggestionCursor extends GroupedSuggestionCursor<SuggestionSection> implements ExpandableGroupList<SuggestionSection, Suggestion> {
    private SparseArray<Integer[]> mGroupCollapsedItemArray;
    private SparseBooleanArray mGroupExpandStateArray;
    private boolean mSupportExpand;

    public ImageResultSuggestionCursor(QueryInfo queryInfo, List<SuggestionSection> list, boolean z) {
        super(queryInfo, list);
        this.mSupportExpand = z;
    }

    public ImageResultSuggestionCursor(QueryInfo queryInfo, List<SuggestionSection> list, boolean z, SparseBooleanArray sparseBooleanArray) {
        this(queryInfo, list, z);
        initGroupCollapsedItemArray(list, sparseBooleanArray);
    }

    private void initGroupCollapsedItemArray(List<SuggestionSection> list, SparseBooleanArray sparseBooleanArray) {
        this.mGroupExpandStateArray = new SparseBooleanArray(list.size());
        this.mGroupCollapsedItemArray = new SparseArray<>(list.size());
        ArrayList arrayList = new ArrayList();
        for (int i = 0; i < list.size(); i++) {
            SuggestionSection suggestionSection = (SuggestionSection) list.get(i);
            if (sparseBooleanArray != null) {
                this.mGroupExpandStateArray.put(i, sparseBooleanArray.get(Integer.valueOf(suggestionSection.getSectionExtras().getExtra("create_date")).intValue(), false));
            }
            int columnIndex = suggestionSection.getColumnIndex("item_collapse_visibility");
            for (int i2 = 0; i2 < suggestionSection.getCount(); i2++) {
                suggestionSection.moveToPosition(i2);
                if (columnIndex >= 0 && "visible".equals(suggestionSection.getString(columnIndex))) {
                    arrayList.add(Integer.valueOf(i2));
                }
            }
            Integer[] numArr = new Integer[arrayList.size()];
            if (!arrayList.isEmpty()) {
                numArr = (Integer[]) arrayList.toArray(numArr);
            }
            this.mGroupCollapsedItemArray.put(i, numArr);
            arrayList.clear();
        }
    }

    public int getChildrenCount(int i) {
        return getChildrenCount(i, getGroupExpandState(i));
    }

    public int getChildrenCount(int i, boolean z) {
        checkGroupPosition(i);
        return (!this.mSupportExpand || z) ? ((SuggestionSection) getGroup(i)).getCount() : ((Integer[]) this.mGroupCollapsedItemArray.get(i)).length;
    }

    public int getGroupCreateDate(int i) {
        if (getGroupExtra(i, "create_date") != null) {
            return Integer.valueOf(getGroupExtra(i, "create_date")).intValue();
        }
        return -1;
    }

    public long getGroupCreateTime(int i) {
        if (getGroupExtra(i, "create_time") != null) {
            return Long.valueOf(getGroupExtra(i, "create_time")).longValue();
        }
        return -1;
    }

    public boolean getGroupExpandState(int i) {
        checkGroupPosition(i);
        return this.mSupportExpand && this.mGroupExpandStateArray.get(i);
    }

    /* access modifiers changed from: 0000 */
    public SparseBooleanArray getGroupExpandStateArray() {
        SparseBooleanArray sparseBooleanArray = new SparseBooleanArray(getGroupCount());
        for (int i = 0; i < getGroupCount(); i++) {
            sparseBooleanArray.put(getGroupCreateDate(i), getGroupExpandState(i));
        }
        return sparseBooleanArray;
    }

    /* access modifiers changed from: protected */
    public String getGroupExtra(int i, String str) {
        return ((SuggestionSection) getGroup(i)).getSectionExtras().getExtra(str);
    }

    public String getGroupRankValue(int i) {
        return getGroupExtra(i, "rank_value");
    }

    public String getGroupTitle(int i) {
        return (!this.mSupportExpand || !getGroupExpandState(i)) ? getGroupExtra(i, "title") : getGroupExtra(i, "expand_title");
    }

    public String getImageIds() {
        int groupCount = getGroupCount();
        ArrayList arrayList = new ArrayList(getGroupCount());
        for (int i = 0; i < groupCount; i++) {
            if (!this.mSupportExpand || getGroupExpandState(i)) {
                arrayList.add(getGroupExtra(i, "all_ids"));
            } else {
                arrayList.add(getGroupExtra(i, "collapse_visible_ids"));
            }
        }
        if (arrayList.size() > 0) {
            return TextUtils.join(",", arrayList);
        }
        return null;
    }

    /* access modifiers changed from: protected */
    public boolean onMoveGroup(int i, int i2) {
        return (!this.mSupportExpand || getGroupExpandState(i)) ? super.onMoveGroup(i, i2) : ((SuggestionSection) getGroup(i)).moveToPosition(((Integer[]) this.mGroupCollapsedItemArray.get(i))[i2].intValue());
    }
}
