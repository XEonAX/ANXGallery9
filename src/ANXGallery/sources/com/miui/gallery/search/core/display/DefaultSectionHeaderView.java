package com.miui.gallery.search.core.display;

import android.content.Context;
import android.view.View;
import com.miui.gallery.R;
import com.miui.gallery.search.core.QueryInfo;
import com.miui.gallery.search.core.suggestion.Suggestion;
import com.miui.gallery.search.core.suggestion.SuggestionCursor;
import com.miui.gallery.search.core.suggestion.SuggestionSection;

public class DefaultSectionHeaderView extends View {

    public static class Factory extends SingleViewTypeFactory {
        public Factory(Context context) {
            super("section", R.layout.section_suggestion_item, context);
        }

        public void bindViewHolder(QueryInfo queryInfo, Suggestion suggestion, int i, BaseSuggestionViewHolder baseSuggestionViewHolder, OnActionClickListener onActionClickListener) {
            SuggestionSection suggestionSection = (SuggestionSection) suggestion;
            if (baseSuggestionViewHolder.getTitle() != null) {
                baseSuggestionViewHolder.getTitle().setText(suggestionSection.getSectionTitle());
            }
            if (baseSuggestionViewHolder.getSubTitle() != null) {
                baseSuggestionViewHolder.getSubTitle().setText(suggestionSection.getSectionSubTitle());
            }
        }

        public String getViewType(QueryInfo queryInfo, SuggestionCursor suggestionCursor, int i) {
            if (!(suggestionCursor instanceof SuggestionSection) || i != -1) {
                return null;
            }
            return "section";
        }
    }
}
