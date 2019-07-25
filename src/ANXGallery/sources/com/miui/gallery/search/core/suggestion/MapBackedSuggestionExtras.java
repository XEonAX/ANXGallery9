package com.miui.gallery.search.core.suggestion;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

public class MapBackedSuggestionExtras implements SuggestionExtras {
    private Map<String, String> mExtras;

    public MapBackedSuggestionExtras(String str, String str2) {
        this.mExtras = new HashMap(1);
        this.mExtras.put(str, str2);
    }

    public MapBackedSuggestionExtras(Map<String, String> map) {
        this.mExtras = map;
    }

    public boolean equals(Object obj) {
        if (obj == null || !(obj instanceof SuggestionExtras)) {
            return false;
        }
        if (obj == this || (getExtraColumnNames() == null && ((SuggestionExtras) obj).getExtraColumnNames() == null)) {
            return true;
        }
        SuggestionExtras suggestionExtras = (SuggestionExtras) obj;
        if (getExtraColumnNames() == null || suggestionExtras.getExtraColumnNames() == null) {
            return false;
        }
        for (String str : getExtraColumnNames()) {
            if (!getExtra(str).equals(suggestionExtras.getExtra(str))) {
                return false;
            }
        }
        return true;
    }

    public String getExtra(String str) {
        if (this.mExtras != null) {
            return (String) this.mExtras.get(str);
        }
        return null;
    }

    public Collection<String> getExtraColumnNames() {
        if (this.mExtras != null) {
            return this.mExtras.keySet();
        }
        return null;
    }

    public void putExtra(String str, String str2) {
        if (this.mExtras == null) {
            this.mExtras = new HashMap(1);
        }
        this.mExtras.put(str, str2);
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(super.toString());
        sb.append(", data:");
        sb.append(this.mExtras);
        return sb.toString();
    }
}
