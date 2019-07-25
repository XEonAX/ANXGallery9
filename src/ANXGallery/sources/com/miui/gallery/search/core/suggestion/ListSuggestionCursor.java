package com.miui.gallery.search.core.suggestion;

import android.database.AbstractCursor;
import android.os.Bundle;
import com.miui.gallery.search.core.QueryInfo;
import com.miui.gallery.search.core.source.Source;
import com.miui.gallery.search.core.suggestion.Suggestion;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;

public class ListSuggestionCursor<S extends Suggestion> extends AbstractCursor implements SuggestionCursor {
    protected static final String[] COLUMNS = {"title", "subTitle", "actionUri", "icon"};
    private ArrayList<String> EMPTY_COLUMNS;
    private ArrayList<String> mExtraColumns;
    private Bundle mExtras;
    protected final QueryInfo mQueryInfo;
    protected final List<S> mSuggestions;

    public ListSuggestionCursor(QueryInfo queryInfo, List<S> list) {
        this(queryInfo, list, null);
    }

    public ListSuggestionCursor(QueryInfo queryInfo, List<S> list, Bundle bundle) {
        this.mSuggestions = new ArrayList();
        this.EMPTY_COLUMNS = new ArrayList<>(0);
        this.mExtras = Bundle.EMPTY;
        this.mQueryInfo = queryInfo;
        if (list != null) {
            this.mSuggestions.addAll(list);
            setExtras(bundle);
        }
    }

    private ArrayList<String> getExtraColumns() {
        if (this.mExtraColumns == null) {
            Collection extraColumnNames = getSuggestionExtras() != null ? getSuggestionExtras().getExtraColumnNames() : null;
            if (extraColumnNames == null || extraColumnNames.size() <= 0) {
                this.mExtraColumns = this.EMPTY_COLUMNS;
            } else {
                this.mExtraColumns = new ArrayList<>(extraColumnNames);
            }
        }
        return this.mExtraColumns;
    }

    public int getColumnIndex(String str) {
        if ("title".equals(str)) {
            return 0;
        }
        if ("subTitle".equals(str)) {
            return 1;
        }
        if ("actionUri".equals(str)) {
            return 2;
        }
        if ("icon".equals(str)) {
            return 3;
        }
        return getExtraColumns().indexOf(str) + COLUMNS.length;
    }

    public String[] getColumnNames() {
        if (getExtraColumns() == this.EMPTY_COLUMNS) {
            return COLUMNS;
        }
        ArrayList arrayList = new ArrayList(COLUMNS.length + getExtraColumns().size());
        arrayList.addAll(Arrays.asList(COLUMNS));
        arrayList.addAll(getExtraColumns());
        return (String[]) arrayList.toArray(new String[arrayList.size()]);
    }

    public int getCount() {
        return this.mSuggestions.size();
    }

    public S getCurrent() {
        if (getPosition() < 0 || getPosition() >= getCount()) {
            return null;
        }
        return (Suggestion) this.mSuggestions.get(getPosition());
    }

    public double getDouble(int i) {
        return 0.0d;
    }

    public Bundle getExtras() {
        return this.mExtras;
    }

    public float getFloat(int i) {
        return 0.0f;
    }

    public int getInt(int i) {
        return 0;
    }

    public String getIntentActionURI() {
        if (getCurrent() == null) {
            return null;
        }
        return getCurrent().getIntentActionURI();
    }

    public long getLong(int i) {
        return 0;
    }

    public QueryInfo getQueryInfo() {
        return this.mQueryInfo;
    }

    public short getShort(int i) {
        return 0;
    }

    public String getString(int i) {
        switch (i) {
            case 0:
                return getSuggestionTitle();
            case 1:
                return getSuggestionSubTitle();
            case 2:
                return getIntentActionURI();
            case 3:
                return getSuggestionIcon();
            default:
                if (getSuggestionExtras() == null) {
                    return null;
                }
                return getSuggestionExtras().getExtra((String) getExtraColumns().get(i - COLUMNS.length));
        }
    }

    public SuggestionExtras getSuggestionExtras() {
        if (getCurrent() == null) {
            return null;
        }
        return getCurrent().getSuggestionExtras();
    }

    public String getSuggestionIcon() {
        if (getCurrent() == null) {
            return null;
        }
        return getCurrent().getSuggestionIcon();
    }

    public Source getSuggestionSource() {
        if (getCurrent() == null) {
            return null;
        }
        return getCurrent().getSuggestionSource();
    }

    public String getSuggestionSubTitle() {
        if (getCurrent() == null) {
            return null;
        }
        return getCurrent().getSuggestionSubTitle();
    }

    public String getSuggestionTitle() {
        if (getCurrent() == null) {
            return null;
        }
        return getCurrent().getSuggestionTitle();
    }

    public boolean isNull(int i) {
        return getString(i) == null;
    }

    public boolean onMove(int i, int i2) {
        this.mExtraColumns = null;
        return super.onMove(i, i2);
    }

    public void setExtras(Bundle bundle) {
        if (bundle == null) {
            bundle = Bundle.EMPTY;
        }
        this.mExtras = bundle;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(super.toString());
        sb.append(String.format("Suggestions = %s;", new Object[]{this.mSuggestions}));
        return sb.toString();
    }
}
