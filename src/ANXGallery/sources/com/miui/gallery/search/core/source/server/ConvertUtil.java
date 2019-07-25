package com.miui.gallery.search.core.source.server;

import com.miui.gallery.search.SearchConstants;
import com.miui.gallery.search.SearchConstants.SectionType;
import com.miui.gallery.search.core.QueryInfo;
import com.miui.gallery.search.core.source.Source;
import com.miui.gallery.search.core.suggestion.BaseSuggestion;
import com.miui.gallery.search.core.suggestion.BaseSuggestionSection;
import com.miui.gallery.search.core.suggestion.ListSuggestionCursor;
import com.miui.gallery.search.core.suggestion.MapBackedSuggestionExtras;
import com.miui.gallery.search.core.suggestion.RankInfo;
import com.miui.gallery.search.core.suggestion.Suggestion;
import com.miui.gallery.search.core.suggestion.SuggestionCursor;
import com.miui.gallery.search.core.suggestion.SuggestionExtras;
import com.miui.gallery.search.core.suggestion.SuggestionSection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

class ConvertUtil {
    public static RankInfo createRankInfo(ItemRankInfo itemRankInfo) {
        String str = null;
        if (itemRankInfo == null) {
            return null;
        }
        if ("ASC".equalsIgnoreCase(itemRankInfo.order)) {
            str = "ASC";
        } else if ("DESC".equalsIgnoreCase(itemRankInfo.order)) {
            str = "DESC";
        } else if (itemRankInfo.name != null) {
            str = SearchConstants.getDefaultOrder(itemRankInfo.name);
        }
        return new RankInfo(itemRankInfo.title, itemRankInfo.name, itemRankInfo.style, str);
    }

    public static List<RankInfo> createRankInfos(List<ItemRankInfo> list) {
        if (list == null || list.isEmpty()) {
            return null;
        }
        ArrayList arrayList = new ArrayList(list.size());
        for (ItemRankInfo createRankInfo : list) {
            arrayList.add(createRankInfo(createRankInfo));
        }
        return arrayList;
    }

    public static Suggestion createSuggestion(ItemSuggestion itemSuggestion, Source source) {
        return createSuggestion(itemSuggestion, null, source);
    }

    public static Suggestion createSuggestion(ItemSuggestion itemSuggestion, Map<String, String> map, Source source) {
        if (itemSuggestion == null) {
            return createSuggestion(map, source);
        }
        if (itemSuggestion.extraInfo != null) {
            if (map == null) {
                map = itemSuggestion.extraInfo;
            } else {
                Map<String, String> hashMap = new HashMap<>();
                hashMap.putAll(itemSuggestion.extraInfo);
                hashMap.putAll(map);
                map = hashMap;
            }
        }
        BaseSuggestion baseSuggestion = new BaseSuggestion(itemSuggestion.title, itemSuggestion.resultCount > 0 ? String.valueOf(itemSuggestion.resultCount) : null, itemSuggestion.icon, itemSuggestion.intentActionURI, createSuggestionExtras(map), source);
        return baseSuggestion;
    }

    public static Suggestion createSuggestion(Map<String, String> map, Source source) {
        SuggestionExtras createSuggestionExtras = createSuggestionExtras(map);
        if (createSuggestionExtras == null) {
            return null;
        }
        BaseSuggestion baseSuggestion = new BaseSuggestion();
        baseSuggestion.setSuggestionExtras(createSuggestionExtras);
        baseSuggestion.setSuggestionSource(source);
        return baseSuggestion;
    }

    public static SuggestionCursor createSuggestionCursor(List<Suggestion> list, QueryInfo queryInfo) {
        return new ListSuggestionCursor(queryInfo, list);
    }

    public static SuggestionCursor createSuggestionCursor(List<ItemSuggestion> list, Source source, QueryInfo queryInfo) {
        if (list == null || list.size() <= 0) {
            return null;
        }
        ArrayList arrayList = new ArrayList(list.size());
        for (ItemSuggestion createSuggestion : list) {
            arrayList.add(createSuggestion(createSuggestion, source));
        }
        return createSuggestionCursor(arrayList, queryInfo);
    }

    public static SuggestionExtras createSuggestionExtras(Map<String, String> map) {
        if (map == null || map.size() <= 0) {
            return null;
        }
        return new MapBackedSuggestionExtras(map);
    }

    public static SuggestionSection createSuggestionSection(QueryInfo queryInfo, SectionedSuggestion sectionedSuggestion, Source source) {
        if (sectionedSuggestion == null) {
            return null;
        }
        String str = sectionedSuggestion.sectionType;
        int indexOf = str.indexOf("_");
        if (indexOf > 0) {
            str = str.substring(0, indexOf);
        }
        if ("recommand".equals(str)) {
            str = SectionType.SECTION_TYPE_RECOMMEND.getName();
        }
        BaseSuggestionSection baseSuggestionSection = new BaseSuggestionSection(queryInfo, str, createSuggestionCursor(sectionedSuggestion.items, source, queryInfo), sectionedSuggestion.dataUrl, sectionedSuggestion.title, null, createSuggestion(sectionedSuggestion.moreItem, source), createRankInfos(sectionedSuggestion.rankInfos), null);
        return baseSuggestionSection;
    }
}
