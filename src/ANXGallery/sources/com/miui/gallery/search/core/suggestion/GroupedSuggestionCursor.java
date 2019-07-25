package com.miui.gallery.search.core.suggestion;

import android.database.AbstractCursor;
import android.database.ContentObserver;
import android.database.DataSetObserver;
import android.os.Bundle;
import com.miui.gallery.search.core.GroupList;
import com.miui.gallery.search.core.QueryInfo;
import com.miui.gallery.search.core.source.Source;
import com.miui.gallery.search.core.suggestion.SuggestionCursor;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

public class GroupedSuggestionCursor<S extends SuggestionCursor> extends AbstractCursor implements GroupList<S, Suggestion>, SuggestionCursor {
    protected Integer mCachedCount;
    private Bundle mExtras;
    protected DataSetObserver mObserver = new DataSetObserver() {
        public void onChanged() {
            GroupedSuggestionCursor.this.mPos = -1;
            GroupedSuggestionCursor.this.mCachedCount = null;
        }

        public void onInvalidated() {
            GroupedSuggestionCursor.this.mPos = -1;
            GroupedSuggestionCursor.this.mCachedCount = null;
        }
    };
    protected final QueryInfo mQueryInfo;
    private S mSection;
    private List<S> mSections;

    public GroupedSuggestionCursor(QueryInfo queryInfo, List<S> list) {
        SuggestionCursor suggestionCursor = null;
        this.mCachedCount = null;
        this.mExtras = Bundle.EMPTY;
        this.mQueryInfo = queryInfo;
        if (list == null || list.isEmpty()) {
            throw new IllegalArgumentException("Empty section value is not acceptable!");
        }
        this.mSections = new ArrayList(list.size());
        for (S s : list) {
            this.mSections.add(s);
            s.registerDataSetObserver(this.mObserver);
        }
        if (this.mSections.size() >= 1) {
            suggestionCursor = (SuggestionCursor) this.mSections.get(0);
        }
        setSection(suggestionCursor);
    }

    private void setSection(S s) {
        if (this.mSection != s) {
            this.mSection = s;
        }
    }

    /* access modifiers changed from: protected */
    public void checkGroupPosition(int i) {
        if (i < 0 || i >= this.mSections.size()) {
            throw new IndexOutOfBoundsException(String.format(Locale.getDefault(), "Invalid groupIndex %d, total group count %d", new Object[]{Integer.valueOf(i), Integer.valueOf(this.mSections.size())}));
        }
    }

    public void close() {
        for (S close : this.mSections) {
            close.close();
        }
        this.mSection = null;
        super.close();
    }

    public void deactivate() {
        for (S deactivate : this.mSections) {
            deactivate.deactivate();
        }
    }

    public byte[] getBlob(int i) {
        return this.mSection.getBlob(i);
    }

    public int getChildrenCount(int i) {
        checkGroupPosition(i);
        if (this.mSections.get(i) != null) {
            return ((SuggestionCursor) this.mSections.get(i)).getCount();
        }
        return 0;
    }

    public String[] getColumnNames() {
        return this.mSection != null ? this.mSection.getColumnNames() : new String[0];
    }

    public int getCount() {
        if (this.mCachedCount == null) {
            int i = 0;
            for (int i2 = 0; i2 < getGroupCount(); i2++) {
                i += getChildrenCount(i2);
            }
            this.mCachedCount = Integer.valueOf(i);
        }
        return this.mCachedCount.intValue();
    }

    public Suggestion getCurrent() {
        return this.mSection.getCurrent();
    }

    public double getDouble(int i) {
        return this.mSection.getDouble(i);
    }

    public Bundle getExtras() {
        return this.mExtras;
    }

    public float getFloat(int i) {
        return this.mSection.getFloat(i);
    }

    public S getGroup(int i) {
        checkGroupPosition(i);
        return (SuggestionCursor) this.mSections.get(i);
    }

    public int getGroupCount() {
        return this.mSections.size();
    }

    public int getInt(int i) {
        return this.mSection.getInt(i);
    }

    public String getIntentActionURI() {
        return this.mSection.getIntentActionURI();
    }

    public long getLong(int i) {
        return this.mSection.getLong(i);
    }

    public QueryInfo getQueryInfo() {
        return this.mSection != null ? this.mSection.getQueryInfo() : this.mQueryInfo;
    }

    public short getShort(int i) {
        return this.mSection.getShort(i);
    }

    public String getString(int i) {
        return this.mSection.getString(i);
    }

    public SuggestionExtras getSuggestionExtras() {
        return this.mSection.getSuggestionExtras();
    }

    public String getSuggestionIcon() {
        return this.mSection.getSuggestionIcon();
    }

    public Source getSuggestionSource() {
        return this.mSection.getSuggestionSource();
    }

    public String getSuggestionSubTitle() {
        return this.mSection.getSuggestionSubTitle();
    }

    public String getSuggestionTitle() {
        return this.mSection.getSuggestionTitle();
    }

    public int getType(int i) {
        return this.mSection.getType(i);
    }

    public boolean isNull(int i) {
        return this.mSection.isNull(i);
    }

    public void moveToPosition(int i, int i2) {
        checkGroupPosition(i);
        int i3 = 0;
        for (int i4 = 0; i4 < i; i4++) {
            i3 += getChildrenCount(i);
        }
        moveToPosition(i3 + i2);
    }

    public boolean onMove(int i, int i2) {
        this.mSection = null;
        int i3 = 0;
        int i4 = 0;
        while (true) {
            if (i3 >= getGroupCount()) {
                i3 = -1;
                break;
            }
            int childrenCount = getChildrenCount(i3) + i4;
            if (i2 < childrenCount) {
                this.mSection = getGroup(i3);
                break;
            }
            i3++;
            i4 = childrenCount;
        }
        if (i3 >= 0) {
            return onMoveGroup(i3, i2 - i4);
        }
        return false;
    }

    /* access modifiers changed from: protected */
    public boolean onMoveGroup(int i, int i2) {
        return getGroup(i).moveToPosition(i2);
    }

    public void registerContentObserver(ContentObserver contentObserver) {
        for (S registerContentObserver : this.mSections) {
            registerContentObserver.registerContentObserver(contentObserver);
        }
        super.registerContentObserver(contentObserver);
    }

    public void registerDataSetObserver(DataSetObserver dataSetObserver) {
        for (S registerDataSetObserver : this.mSections) {
            registerDataSetObserver.registerDataSetObserver(dataSetObserver);
        }
        super.registerDataSetObserver(dataSetObserver);
    }

    public boolean requery() {
        for (S requery : this.mSections) {
            if (!requery.requery()) {
                return false;
            }
        }
        return super.requery();
    }

    public void setExtras(Bundle bundle) {
        if (bundle == null) {
            bundle = Bundle.EMPTY;
        }
        this.mExtras = bundle;
    }

    public void unregisterContentObserver(ContentObserver contentObserver) {
        for (S unregisterContentObserver : this.mSections) {
            unregisterContentObserver.unregisterContentObserver(contentObserver);
        }
        super.unregisterContentObserver(contentObserver);
    }

    public void unregisterDataSetObserver(DataSetObserver dataSetObserver) {
        for (S unregisterDataSetObserver : this.mSections) {
            unregisterDataSetObserver.unregisterDataSetObserver(dataSetObserver);
        }
        super.unregisterDataSetObserver(dataSetObserver);
    }
}
