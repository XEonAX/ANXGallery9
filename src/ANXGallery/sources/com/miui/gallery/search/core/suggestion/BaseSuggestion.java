package com.miui.gallery.search.core.suggestion;

import com.miui.gallery.search.core.source.Source;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.StringUtils;

public class BaseSuggestion implements Suggestion {
    protected String mIcon;
    protected String mIntentActionURI;
    protected String mSubTitle;
    protected SuggestionExtras mSuggestionExtras;
    protected Source mSuggestionSource;
    protected String mTitle;

    public BaseSuggestion() {
    }

    public BaseSuggestion(String str, String str2, String str3, String str4, SuggestionExtras suggestionExtras, Source source) {
        this.mTitle = str;
        this.mIcon = str3;
        this.mIntentActionURI = str4;
        this.mSubTitle = str2;
        this.mSuggestionExtras = suggestionExtras;
        this.mSuggestionSource = source;
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !(obj instanceof Suggestion)) {
            return false;
        }
        Suggestion suggestion = (Suggestion) obj;
        return StringUtils.nullToEmpty(this.mTitle).equals(StringUtils.nullToEmpty(suggestion.getSuggestionTitle())) && StringUtils.nullToEmpty(this.mSubTitle).equals(StringUtils.nullToEmpty(suggestion.getSuggestionSubTitle())) && StringUtils.nullToEmpty(this.mIcon).equals(StringUtils.nullToEmpty(suggestion.getSuggestionIcon())) && StringUtils.nullToEmpty(this.mIntentActionURI).equals(StringUtils.nullToEmpty(suggestion.getIntentActionURI())) && MiscUtil.equals(this.mSuggestionExtras, suggestion.getSuggestionExtras());
    }

    public String getIntentActionURI() {
        return this.mIntentActionURI;
    }

    public SuggestionExtras getSuggestionExtras() {
        return this.mSuggestionExtras;
    }

    public String getSuggestionIcon() {
        return this.mIcon;
    }

    public Source getSuggestionSource() {
        return this.mSuggestionSource;
    }

    public String getSuggestionSubTitle() {
        return this.mSubTitle;
    }

    public String getSuggestionTitle() {
        return this.mTitle;
    }

    public void setIntentActionURI(String str) {
        this.mIntentActionURI = str;
    }

    public void setSuggestionExtras(SuggestionExtras suggestionExtras) {
        this.mSuggestionExtras = suggestionExtras;
    }

    public void setSuggestionIcon(String str) {
        this.mIcon = str;
    }

    public void setSuggestionSource(Source source) {
        this.mSuggestionSource = source;
    }

    public void setSuggestionSubTitle(String str) {
        this.mSubTitle = str;
    }

    public void setSuggestionTitle(String str) {
        this.mTitle = str;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("BaseSuggestion [title:");
        sb.append(this.mTitle);
        sb.append(",");
        sb.append("mSubTitle:");
        sb.append(this.mSubTitle);
        sb.append(",");
        sb.append("mIntentActionURI:");
        sb.append(this.mIntentActionURI);
        sb.append(",");
        sb.append("mIcon:");
        sb.append(this.mIcon);
        sb.append(",");
        sb.append("mSuggestionExtras:");
        sb.append(this.mSuggestionExtras);
        sb.append(",");
        sb.append("]");
        return sb.toString();
    }
}
