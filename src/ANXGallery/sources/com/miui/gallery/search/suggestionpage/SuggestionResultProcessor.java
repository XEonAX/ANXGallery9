package com.miui.gallery.search.suggestionpage;

import android.os.Bundle;
import android.os.SystemClock;
import android.text.TextUtils;
import com.miui.gallery.search.SearchConfig;
import com.miui.gallery.search.SearchConfig.SuggestionConfig;
import com.miui.gallery.search.SearchConstants.SectionType;
import com.miui.gallery.search.core.QueryInfo;
import com.miui.gallery.search.core.resultprocessor.SectionedResultProcessor;
import com.miui.gallery.search.core.suggestion.BaseSuggestion;
import com.miui.gallery.search.core.suggestion.BaseSuggestionSection;
import com.miui.gallery.search.core.suggestion.GroupedSuggestionCursor;
import com.miui.gallery.search.core.suggestion.ListSuggestionCursor;
import com.miui.gallery.search.core.suggestion.Suggestion;
import com.miui.gallery.search.core.suggestion.SuggestionSection;
import com.miui.gallery.search.utils.SearchLog;
import com.miui.gallery.util.MiscUtil;
import java.util.ArrayList;
import java.util.List;

public class SuggestionResultProcessor extends SectionedResultProcessor {
    public SuggestionResultProcessor() {
        super(true);
    }

    private String getShortcutUri(List<SuggestionSection> list) {
        if (MiscUtil.isValid(list)) {
            SuggestionConfig suggestionConfig = SearchConfig.get().getSuggestionConfig();
            for (SuggestionSection suggestionSection : list) {
                if (suggestionConfig.supportShortcut(suggestionSection.getSectionType()) && suggestionSection.moveToFirst() && !TextUtils.isEmpty(suggestionSection.getIntentActionURI())) {
                    return suggestionSection.getIntentActionURI();
                }
            }
        }
        return null;
    }

    /* access modifiers changed from: protected */
    public boolean acceptEmptySection(SuggestionSection suggestionSection) {
        return suggestionSection.getSectionType() == SectionType.SECTION_TYPE_NO_RESULT || super.acceptEmptySection(suggestionSection);
    }

    /* access modifiers changed from: protected */
    public GroupedSuggestionCursor<SuggestionSection> packData(QueryInfo queryInfo, List<SuggestionSection> list, Bundle bundle) {
        QueryInfo queryInfo2 = queryInfo;
        List<SuggestionSection> list2 = list;
        long elapsedRealtime = SystemClock.elapsedRealtime();
        try {
            if (list.size() > 1) {
                if (((SuggestionSection) list2.get(0)).getSectionType() == SectionType.SECTION_TYPE_NO_RESULT) {
                    ArrayList arrayList = new ArrayList(list.size());
                    ArrayList arrayList2 = new ArrayList();
                    SuggestionConfig suggestionConfig = SearchConfig.get().getSuggestionConfig();
                    for (SuggestionSection suggestionSection : list) {
                        if (!suggestionConfig.shouldDrawSectionHeader(suggestionSection.getSectionType())) {
                            for (int i = 0; i < suggestionSection.getCount(); i++) {
                                suggestionSection.moveToPosition(i);
                                arrayList2.add(suggestionSection.getCurrent());
                            }
                        } else {
                            arrayList.add(suggestionSection);
                        }
                    }
                    if (!arrayList2.isEmpty()) {
                        SectionType sectionType = SectionType.SECTION_TYPE_SUGGESTION;
                        BaseSuggestionSection baseSuggestionSection = new BaseSuggestionSection(queryInfo, sectionType, new ListSuggestionCursor(queryInfo2, arrayList2), null, SearchConfig.get().getTitleForSection(sectionType), null, null);
                        arrayList.add(baseSuggestionSection);
                    }
                    GroupedSuggestionCursor<SuggestionSection> packData = super.packData(queryInfo2, arrayList, bundle);
                    SearchLog.d("SuggestionResultProcessor", "Pack data cost %d", Long.valueOf(SystemClock.elapsedRealtime() - elapsedRealtime));
                    return packData;
                }
            }
            Bundle bundle2 = bundle;
            GroupedSuggestionCursor<SuggestionSection> packData2 = super.packData(queryInfo, list, bundle);
            if (packData2 != null && !TextUtils.isEmpty(queryInfo2.getParam("enableShortcut")) && Boolean.valueOf(queryInfo2.getParam("enableShortcut")).booleanValue()) {
                String shortcutUri = getShortcutUri(list2);
                if (!TextUtils.isEmpty(shortcutUri)) {
                    Bundle extras = packData2.getExtras();
                    if (extras == null || extras == Bundle.EMPTY) {
                        extras = new Bundle();
                    }
                    extras.putString("short_cut_uri", shortcutUri);
                    packData2.setExtras(extras);
                }
            }
            SearchLog.d("SuggestionResultProcessor", "Pack data cost %d", Long.valueOf(SystemClock.elapsedRealtime() - elapsedRealtime));
            return packData2;
        } catch (Throwable th) {
            SearchLog.d("SuggestionResultProcessor", "Pack data cost %d", Long.valueOf(SystemClock.elapsedRealtime() - elapsedRealtime));
            throw th;
        }
    }

    /* access modifiers changed from: protected */
    public BaseSuggestion toSuggestion(SuggestionSection suggestionSection, Suggestion suggestion) {
        BaseSuggestion suggestion2 = super.toSuggestion(suggestionSection, suggestion);
        if (!(suggestionSection == null || suggestion2 == null || !TextUtils.isEmpty(suggestion2.getSuggestionSubTitle()) || suggestionSection.getSectionType() == SectionType.SECTION_TYPE_OTHER || suggestionSection.getSectionType() == SectionType.SECTION_TYPE_GUIDE)) {
            suggestion2.setSuggestionSubTitle(suggestionSection.getSectionTitle());
        }
        return suggestion2;
    }
}
