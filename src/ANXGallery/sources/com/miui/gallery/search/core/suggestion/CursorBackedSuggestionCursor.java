package com.miui.gallery.search.core.suggestion;

import android.database.Cursor;
import android.database.CursorWrapper;
import android.os.Bundle;
import android.util.SparseArray;
import com.miui.gallery.search.core.QueryInfo;
import com.miui.gallery.search.core.result.ErrorInfo;
import com.miui.gallery.search.core.source.Source;
import java.util.Collection;
import java.util.HashMap;

public class CursorBackedSuggestionCursor<C extends Cursor> extends CursorWrapper implements SuggestionCursor {
    private static final SuggestionExtras EMPTY_EXTRA = new SuggestionExtras() {
        public String getExtra(String str) {
            return null;
        }

        public Collection<String> getExtraColumnNames() {
            return null;
        }
    };
    protected int mActionURIIdx;
    private Bundle mExtras;
    protected int mIconIdx;
    protected final QueryInfo mQueryInfo;
    protected int mSubTitleIdx;
    private SparseArray<SuggestionExtras> mSuggestionExtrasArray;
    protected final Source mSuggestionSource;
    protected int mTitleIdx;

    public CursorBackedSuggestionCursor(QueryInfo queryInfo, C c) {
        this(queryInfo, c, null);
    }

    public CursorBackedSuggestionCursor(QueryInfo queryInfo, C c, Source source) {
        this(queryInfo, c, source, null);
    }

    public CursorBackedSuggestionCursor(QueryInfo queryInfo, C c, Source source, ErrorInfo errorInfo) {
        super(c);
        this.mExtras = Bundle.EMPTY;
        this.mQueryInfo = queryInfo;
        this.mSuggestionSource = source;
        updateIndexes();
    }

    private boolean isExtraIndex(int i) {
        return (i == this.mIconIdx || i == this.mActionURIIdx || i == this.mTitleIdx || i == this.mSubTitleIdx) ? false : true;
    }

    public Suggestion getCurrent() {
        return this;
    }

    public Bundle getExtras() {
        return getWrappedCursor().getExtras() == null ? this.mExtras : getWrappedCursor().getExtras();
    }

    public String getIntentActionURI() {
        return getStringOrNull(this.mActionURIIdx);
    }

    public QueryInfo getQueryInfo() {
        return this.mQueryInfo;
    }

    /* access modifiers changed from: protected */
    public String getStringOrNull(int i) {
        if (i == -1) {
            return null;
        }
        return getWrappedCursor().getString(i);
    }

    public SuggestionExtras getSuggestionExtras() {
        HashMap hashMap = null;
        if (getWrappedCursor() == null) {
            return null;
        }
        if (this.mSuggestionExtrasArray == null) {
            this.mSuggestionExtrasArray = new SparseArray<>(getCount());
        }
        SuggestionExtras suggestionExtras = (SuggestionExtras) this.mSuggestionExtrasArray.get(getWrappedCursor().getPosition());
        if (suggestionExtras == EMPTY_EXTRA) {
            return EMPTY_EXTRA;
        }
        if (suggestionExtras == null) {
            String[] columnNames = getWrappedCursor().getColumnNames();
            for (int i = 0; i < columnNames.length; i++) {
                if (isExtraIndex(i) && columnNames[i] != null) {
                    String stringOrNull = getStringOrNull(i);
                    if (stringOrNull != null) {
                        if (hashMap == null) {
                            hashMap = new HashMap();
                        }
                        hashMap.put(columnNames[i], stringOrNull);
                    }
                }
            }
            if (hashMap != null) {
                this.mSuggestionExtrasArray.put(getPosition(), new MapBackedSuggestionExtras(hashMap));
            } else {
                this.mSuggestionExtrasArray.put(getPosition(), EMPTY_EXTRA);
            }
        }
        return (SuggestionExtras) this.mSuggestionExtrasArray.get(getPosition());
    }

    public String getSuggestionIcon() {
        return getStringOrNull(this.mIconIdx);
    }

    public Source getSuggestionSource() {
        return this.mSuggestionSource;
    }

    public String getSuggestionSubTitle() {
        return getStringOrNull(this.mSubTitleIdx);
    }

    public String getSuggestionTitle() {
        return getStringOrNull(this.mTitleIdx);
    }

    public void setExtras(Bundle bundle) {
        if (bundle == null) {
            bundle = Bundle.EMPTY;
        }
        this.mExtras = bundle;
    }

    /* access modifiers changed from: protected */
    public void updateIndexes() {
        this.mTitleIdx = getColumnIndex("title");
        this.mSubTitleIdx = getColumnIndex("subTitle");
        this.mIconIdx = getColumnIndex("icon");
        this.mActionURIIdx = getColumnIndex("actionUri");
    }
}
