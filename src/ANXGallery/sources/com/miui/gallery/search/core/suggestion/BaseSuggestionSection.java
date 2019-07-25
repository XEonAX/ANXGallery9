package com.miui.gallery.search.core.suggestion;

import android.content.ContentResolver;
import android.database.CharArrayBuffer;
import android.database.ContentObserver;
import android.database.DataSetObserver;
import android.net.Uri;
import android.os.Bundle;
import android.text.TextUtils;
import com.miui.gallery.search.SearchConstants.SectionType;
import com.miui.gallery.search.core.QueryInfo;
import com.miui.gallery.search.core.source.Source;
import java.util.ArrayList;
import java.util.List;

public class BaseSuggestionSection implements SuggestionSection {
    protected String mDataURI;
    protected final SuggestionCursor mItems;
    protected Suggestion mMoreItem;
    protected final QueryInfo mQueryInfo;
    private List<RankInfo> mRankInfos;
    private SuggestionExtras mSectionExtras;
    private String mSectionSubTitle;
    private String mSectionTitle;
    protected final String mSectionTypeString;

    public BaseSuggestionSection(QueryInfo queryInfo, SectionType sectionType, SuggestionCursor suggestionCursor, String str, String str2, String str3, Suggestion suggestion) {
        this(queryInfo, sectionType != null ? sectionType.getName() : SectionType.SECTION_TYPE_DEFAULT.getName(), suggestionCursor, str, str2, str3, suggestion, null, null);
    }

    public BaseSuggestionSection(QueryInfo queryInfo, String str, SuggestionCursor suggestionCursor) {
        this(queryInfo, str, suggestionCursor, null, null, null, null, null, null);
    }

    public BaseSuggestionSection(QueryInfo queryInfo, String str, SuggestionCursor suggestionCursor, String str2, String str3, String str4, Suggestion suggestion, List<RankInfo> list, Bundle bundle) {
        this.mQueryInfo = queryInfo;
        this.mItems = suggestionCursor;
        if (TextUtils.isEmpty(str)) {
            this.mSectionTypeString = SectionType.SECTION_TYPE_DEFAULT.getName();
        } else {
            this.mSectionTypeString = str;
        }
        this.mDataURI = str2;
        this.mSectionTitle = str3;
        this.mSectionSubTitle = str4;
        this.mMoreItem = suggestion;
        if (list != null && list.size() > 0) {
            this.mRankInfos = new ArrayList(list);
        }
        if (bundle != null && bundle != Bundle.EMPTY) {
            setExtras(bundle);
        }
    }

    public void close() {
        if (this.mItems != null) {
            this.mItems.close();
        }
    }

    public void copyStringToBuffer(int i, CharArrayBuffer charArrayBuffer) {
        if (this.mItems != null) {
            this.mItems.copyStringToBuffer(i, charArrayBuffer);
        }
    }

    public void deactivate() {
        if (this.mItems != null) {
            this.mItems.deactivate();
        }
    }

    public byte[] getBlob(int i) {
        return this.mItems.getBlob(i);
    }

    public int getColumnCount() {
        if (this.mItems == null) {
            return 0;
        }
        return this.mItems.getColumnCount();
    }

    public int getColumnIndex(String str) {
        if (this.mItems == null) {
            return -1;
        }
        return this.mItems.getColumnIndex(str);
    }

    public int getColumnIndexOrThrow(String str) throws IllegalArgumentException {
        if (this.mItems != null) {
            return this.mItems.getColumnIndexOrThrow(str);
        }
        StringBuilder sb = new StringBuilder();
        sb.append("column '");
        sb.append(str);
        sb.append("' does not exist");
        throw new IllegalArgumentException(sb.toString());
    }

    public String getColumnName(int i) {
        if (this.mItems == null) {
            return null;
        }
        return this.mItems.getColumnName(i);
    }

    public String[] getColumnNames() {
        return this.mItems == null ? new String[0] : this.mItems.getColumnNames();
    }

    public int getCount() {
        if (this.mItems == null) {
            return 0;
        }
        return this.mItems.getCount();
    }

    public Suggestion getCurrent() {
        return this.mItems.getCurrent();
    }

    public String getDataURI() {
        return this.mDataURI;
    }

    public double getDouble(int i) {
        return this.mItems.getDouble(i);
    }

    public Bundle getExtras() {
        if (this.mItems == null) {
            return null;
        }
        return this.mItems.getExtras();
    }

    public float getFloat(int i) {
        return this.mItems.getFloat(i);
    }

    public int getInt(int i) {
        return this.mItems.getInt(i);
    }

    public String getIntentActionURI() {
        return this.mItems.getIntentActionURI();
    }

    public long getLong(int i) {
        return this.mItems.getLong(i);
    }

    public Uri getNotificationUri() {
        if (this.mItems == null) {
            return null;
        }
        return this.mItems.getNotificationUri();
    }

    public int getPosition() {
        if (this.mItems == null) {
            return -1;
        }
        return this.mItems.getPosition();
    }

    public QueryInfo getQueryInfo() {
        return this.mQueryInfo;
    }

    public List<RankInfo> getRankInfos() {
        return this.mRankInfos;
    }

    public SuggestionExtras getSectionExtras() {
        return this.mSectionExtras;
    }

    public String getSectionSubTitle() {
        return this.mSectionSubTitle;
    }

    public String getSectionTitle() {
        return this.mSectionTitle;
    }

    public SectionType getSectionType() {
        return SectionType.fromName(this.mSectionTypeString);
    }

    public String getSectionTypeString() {
        return this.mSectionTypeString;
    }

    public short getShort(int i) {
        return this.mItems.getShort(i);
    }

    public String getString(int i) {
        return this.mItems.getString(i);
    }

    public SuggestionExtras getSuggestionExtras() {
        return this.mItems.getSuggestionExtras();
    }

    public String getSuggestionIcon() {
        return this.mItems.getSuggestionIcon();
    }

    public Source getSuggestionSource() {
        return this.mItems.getSuggestionSource();
    }

    public String getSuggestionSubTitle() {
        return this.mItems.getSuggestionSubTitle();
    }

    public String getSuggestionTitle() {
        return this.mItems.getSuggestionTitle();
    }

    public int getType(int i) {
        return this.mItems.getType(i);
    }

    public boolean getWantsAllOnMoveCalls() {
        return this.mItems != null && this.mItems.getWantsAllOnMoveCalls();
    }

    public boolean isAfterLast() {
        return this.mItems.isAfterLast();
    }

    public boolean isBeforeFirst() {
        return this.mItems.isBeforeFirst();
    }

    public boolean isClosed() {
        return this.mItems != null && this.mItems.isClosed();
    }

    public boolean isFirst() {
        return this.mItems.isFirst();
    }

    public boolean isLast() {
        return this.mItems.isLast();
    }

    public boolean isNull(int i) {
        return this.mItems.isNull(i);
    }

    public boolean move(int i) {
        return this.mItems != null && this.mItems.move(i);
    }

    public boolean moveToFirst() {
        return this.mItems != null && this.mItems.moveToFirst();
    }

    public boolean moveToLast() {
        return this.mItems != null && this.mItems.moveToLast();
    }

    public Suggestion moveToMore() {
        return this.mMoreItem;
    }

    public boolean moveToNext() {
        return this.mItems != null && this.mItems.moveToNext();
    }

    public boolean moveToPosition(int i) {
        return this.mItems != null && this.mItems.moveToPosition(i);
    }

    public boolean moveToPrevious() {
        return this.mItems != null && this.mItems.moveToPrevious();
    }

    public void registerContentObserver(ContentObserver contentObserver) {
        if (this.mItems != null) {
            this.mItems.registerContentObserver(contentObserver);
        }
    }

    public void registerDataSetObserver(DataSetObserver dataSetObserver) {
        if (this.mItems != null) {
            this.mItems.registerDataSetObserver(dataSetObserver);
        }
    }

    public boolean requery() {
        return this.mItems != null && this.mItems.requery();
    }

    public Bundle respond(Bundle bundle) {
        if (this.mItems == null) {
            return null;
        }
        return this.mItems.respond(bundle);
    }

    public void setExtras(Bundle bundle) {
        if (this.mItems != null) {
            this.mItems.setExtras(bundle);
        }
    }

    public void setNotificationUri(ContentResolver contentResolver, Uri uri) {
        if (this.mItems != null) {
            this.mItems.setNotificationUri(contentResolver, uri);
        }
    }

    public void setSectionExtras(SuggestionExtras suggestionExtras) {
        this.mSectionExtras = suggestionExtras;
    }

    public void setSectionMoreItem(Suggestion suggestion) {
        this.mMoreItem = suggestion;
    }

    public void unregisterContentObserver(ContentObserver contentObserver) {
        if (this.mItems != null) {
            this.mItems.unregisterContentObserver(contentObserver);
        }
    }

    public void unregisterDataSetObserver(DataSetObserver dataSetObserver) {
        if (this.mItems != null) {
            this.mItems.unregisterDataSetObserver(dataSetObserver);
        }
    }
}
