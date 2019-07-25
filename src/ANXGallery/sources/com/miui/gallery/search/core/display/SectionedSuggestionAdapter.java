package com.miui.gallery.search.core.display;

import android.app.Activity;
import com.miui.gallery.search.core.suggestion.GroupedSuggestionCursor;
import com.miui.gallery.search.core.suggestion.SuggestionSection;

public class SectionedSuggestionAdapter extends BaseSuggestionAdapter<GroupedSuggestionCursor<SuggestionSection>> {
    public SectionedSuggestionAdapter(Activity activity, SuggestionViewFactory suggestionViewFactory, String str) {
        super(activity, suggestionViewFactory, str);
    }

    /* access modifiers changed from: protected */
    public void bindInnerItemViewHolder(BaseSuggestionViewHolder baseSuggestionViewHolder, int i) {
        int[] indexes = getIndexes(i);
        this.mViewFactory.bindViewHolder(this.mQueryInfo, getSection(indexes[0]), indexes[1], baseSuggestionViewHolder, getActionClickListener());
    }

    /* access modifiers changed from: protected */
    public int getHeaderCount(int i) {
        return 1;
    }

    public int[] getIndexes(int i) {
        int[] iArr = new int[2];
        int i2 = 0;
        int i3 = 0;
        while (true) {
            if (i2 >= getSectionCount()) {
                break;
            }
            int sectionTotalItemCount = getSectionTotalItemCount(i2) + i3;
            if (i < sectionTotalItemCount) {
                int headerCount = getHeaderCount(i2);
                iArr[0] = i2;
                iArr[1] = i - i3;
                if (iArr[1] < headerCount) {
                    iArr[1] = -1;
                } else if (iArr[1] == getSectionItemCount(i2) + headerCount) {
                    iArr[1] = -3;
                } else if (useBatchContent(iArr[0])) {
                    iArr[1] = -2;
                } else {
                    iArr[1] = iArr[1] - headerCount;
                }
            } else {
                i2++;
                i3 = sectionTotalItemCount;
            }
        }
        if (iArr[1] >= 0) {
            ((GroupedSuggestionCursor) getSuggestionCursor()).moveToPosition(iArr[0], iArr[1]);
        }
        return iArr;
    }

    /* access modifiers changed from: protected */
    public int getInnerItemViewCount() {
        int i = 0;
        for (int i2 = 0; i2 < getSectionCount(); i2++) {
            i += getSectionTotalItemCount(i2);
        }
        return i;
    }

    /* access modifiers changed from: protected */
    public int getInnerItemViewType(int i) {
        int[] indexes = getIndexes(i);
        return ((Integer) this.mViewTypeMap.get(this.mViewFactory.getViewType(this.mQueryInfo, getSection(indexes[0]), indexes[1]))).intValue();
    }

    /* access modifiers changed from: protected */
    public SuggestionSection getSection(int i) {
        if (getSuggestionCursor() != null) {
            return (SuggestionSection) ((GroupedSuggestionCursor) getSuggestionCursor()).getGroup(i);
        }
        return null;
    }

    /* access modifiers changed from: protected */
    public int getSectionCount() {
        if (getSuggestionCursor() != null) {
            return ((GroupedSuggestionCursor) getSuggestionCursor()).getGroupCount();
        }
        return 0;
    }

    /* access modifiers changed from: protected */
    public int getSectionItemCount(int i) {
        if (getSection(i) == null) {
            return 0;
        }
        return useBatchContent(i) ? getHeaderCount(i) : getSection(i).getCount();
    }

    /* access modifiers changed from: protected */
    public int getSectionTotalItemCount(int i) {
        return getHeaderCount(i) + getSectionItemCount(i) + ((getSection(i).moveToMore() == null || useBatchContent(i)) ? 0 : 1);
    }

    /* access modifiers changed from: protected */
    public boolean useBatchContent(int i) {
        return false;
    }
}
