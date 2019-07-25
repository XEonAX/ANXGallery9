package com.miui.gallery.search.navigationpage;

import android.content.Context;
import android.view.View;
import android.view.View.OnClickListener;
import com.miui.gallery.R;
import com.miui.gallery.search.SearchConfig;
import com.miui.gallery.search.SearchConstants.SearchType;
import com.miui.gallery.search.SearchConstants.SectionType;
import com.miui.gallery.search.core.QueryInfo;
import com.miui.gallery.search.core.context.SearchContext;
import com.miui.gallery.search.core.display.AbstractSuggestionViewFactory;
import com.miui.gallery.search.core.display.BaseSuggestionViewHolder;
import com.miui.gallery.search.core.display.OnActionClickListener;
import com.miui.gallery.search.core.suggestion.Suggestion;
import com.miui.gallery.search.core.suggestion.SuggestionCursor;
import com.miui.gallery.search.core.suggestion.SuggestionSection;
import com.miui.gallery.search.statistics.SearchStatUtils;
import com.miui.gallery.search.utils.SearchLog;
import com.miui.gallery.search.widget.RoundedCornerRectBitmapDisplayer;
import com.miui.gallery.util.face.PeopleItemBitmapDisplayer;
import com.nostra13.universalimageloader.core.DisplayImageOptions;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

public class NavigationPageViewFactory extends AbstractSuggestionViewFactory {
    private static Map<String, Integer> sViewTypes = new HashMap();
    private DisplayImageOptions mPeopleItemDisplayImageOptions;
    private DisplayImageOptions mRecommendItemDisplayImageOptions;

    static {
        sViewTypes.put("navigation_section_header", Integer.valueOf(R.layout.navigation_section_header));
        sViewTypes.put("navigation_recommend", Integer.valueOf(R.layout.navigation_recommend_section_content));
        sViewTypes.put("navigation_recommend_item", Integer.valueOf(R.layout.navigation_recommend_item));
        sViewTypes.put("navigation_people", Integer.valueOf(R.layout.navigation_people_section_content));
        sViewTypes.put("navigation_people_item", Integer.valueOf(R.layout.navigation_people_item));
        sViewTypes.put("navigation_people_more_item", Integer.valueOf(R.layout.navigation_people_more_item));
        sViewTypes.put("navigation_tag", Integer.valueOf(R.layout.navigation_tag_section_content));
        sViewTypes.put("navigation_tag_item", Integer.valueOf(R.layout.navigation_tag_item));
        sViewTypes.put("navigation_location_item", Integer.valueOf(R.layout.navigation_location_item));
        sViewTypes.put("navigation_section_content", Integer.valueOf(R.layout.navigation_default_section_content));
        sViewTypes.put("navigation_warning_header", Integer.valueOf(R.layout.navigation_warning_section_header));
    }

    public NavigationPageViewFactory(Context context) {
        super(context);
    }

    public void bindViewHolder(QueryInfo queryInfo, Suggestion suggestion, int i, BaseSuggestionViewHolder baseSuggestionViewHolder, final OnActionClickListener onActionClickListener) {
        SuggestionSection suggestionSection = (SuggestionSection) suggestion;
        switch (i) {
            case -3:
                super.bindViewHolder(queryInfo, suggestionSection.moveToMore(), i, baseSuggestionViewHolder, onActionClickListener);
                if (suggestionSection.getSectionType() == SectionType.SECTION_TYPE_PEOPLE && suggestionSection.moveToPosition(SearchConfig.get().getNavigationConfig().getSectionMaxItemCount(suggestionSection.getSectionType())) && suggestionSection.getIntentActionURI() != null && baseSuggestionViewHolder.getIconView() != null) {
                    bindIcon(baseSuggestionViewHolder.getIconView(), suggestionSection.getSuggestionIcon(), getDisplayImageOptionsForViewType(baseSuggestionViewHolder.getViewType()));
                    return;
                }
                return;
            case -2:
                NavigationSectionAdapter contentAdapter = ((NavigationSectionContentView) baseSuggestionViewHolder.itemView).getContentAdapter();
                if (contentAdapter != null) {
                    contentAdapter.changeSectionData(suggestionSection);
                    return;
                }
                NavigationSectionAdapter createContentAdapter = createContentAdapter(suggestionSection);
                createContentAdapter.setActionClickListener(onActionClickListener);
                ((NavigationSectionContentView) baseSuggestionViewHolder.itemView).setContentAdapter(createContentAdapter);
                return;
            case -1:
                if (suggestionSection.getSectionType() != SectionType.SECTION_TYPE_WARNING) {
                    if (!(suggestionSection.getSectionType() != SectionType.SECTION_TYPE_HISTORY || baseSuggestionViewHolder.getSubTitle() == null || onActionClickListener == null)) {
                        baseSuggestionViewHolder.getSubTitle().setOnClickListener(new OnClickListener() {
                            public void onClick(View view) {
                                onActionClickListener.onClick(view, 2, null, SearchStatUtils.buildSearchEventExtras(null, new String[]{"from"}, new String[]{"from_navigation_history"}));
                            }
                        });
                    }
                    if (baseSuggestionViewHolder.getTitle() != null) {
                        baseSuggestionViewHolder.getTitle().setText(suggestionSection.getSectionTitle());
                    }
                    if (baseSuggestionViewHolder.getSubTitle() != null) {
                        baseSuggestionViewHolder.getSubTitle().setText(suggestionSection.getSectionSubTitle());
                        return;
                    }
                    return;
                } else if (baseSuggestionViewHolder.getTitle() == null) {
                    return;
                } else {
                    if (suggestionSection.moveToFirst()) {
                        baseSuggestionViewHolder.getTitle().setText(suggestionSection.getSuggestionTitle());
                        return;
                    } else {
                        baseSuggestionViewHolder.getTitle().setText(suggestionSection.getSectionTitle());
                        return;
                    }
                }
            default:
                super.bindViewHolder(queryInfo, suggestion, i, baseSuggestionViewHolder, onActionClickListener);
                return;
        }
    }

    /* access modifiers changed from: protected */
    public NavigationSectionAdapter createContentAdapter(SuggestionSection suggestionSection) {
        NavigationSectionAdapter navigationSectionAdapter = new NavigationSectionAdapter(getContext(), SearchContext.getInstance().getSuggestionViewFactory(), suggestionSection, suggestionSection.getSectionType() == SectionType.SECTION_TYPE_HISTORY ? "from_navigation_history" : "from_navigation", suggestionSection.getSectionType() == SectionType.SECTION_TYPE_PEOPLE || suggestionSection.getSectionType() == SectionType.SECTION_TYPE_FEATURE);
        return navigationSectionAdapter;
    }

    /* access modifiers changed from: protected */
    public DisplayImageOptions getDisplayImageOptionsForViewType(String str) {
        if (str != null) {
            return str.equals("navigation_recommend_item") ? this.mRecommendItemDisplayImageOptions : (str.equals("navigation_people_item") || str.equals("navigation_people_more_item")) ? this.mPeopleItemDisplayImageOptions : super.getDisplayImageOptionsForViewType(str);
        }
        SearchLog.e("Error", "empty view type");
        return super.getDisplayImageOptionsForViewType(null);
    }

    /* access modifiers changed from: protected */
    public int getLayoutIdForViewType(String str) {
        return ((Integer) sViewTypes.get(str)).intValue();
    }

    public Collection<String> getSuggestionViewTypes() {
        return sViewTypes.keySet();
    }

    public String getViewType(QueryInfo queryInfo, SuggestionCursor suggestionCursor, int i) {
        if (queryInfo.getSearchType() != SearchType.SEARCH_TYPE_NAVIGATION || !(suggestionCursor instanceof SuggestionSection)) {
            return null;
        }
        SectionType sectionType = ((SuggestionSection) suggestionCursor).getSectionType();
        switch (i) {
            case -3:
                switch (sectionType) {
                    case SECTION_TYPE_RECOMMEND:
                        return "navigation_recommend_item";
                    case SECTION_TYPE_PEOPLE:
                        return "navigation_people_more_item";
                    default:
                        return "navigation_tag_item";
                }
            case -2:
                switch (sectionType) {
                    case SECTION_TYPE_RECOMMEND:
                        return "navigation_recommend";
                    case SECTION_TYPE_PEOPLE:
                        return "navigation_people";
                    case SECTION_TYPE_LOCATION:
                    case SECTION_TYPE_TAG:
                        return "navigation_tag";
                    default:
                        return "navigation_section_content";
                }
            case -1:
                return AnonymousClass2.$SwitchMap$com$miui$gallery$search$SearchConstants$SectionType[sectionType.ordinal()] != 1 ? "navigation_section_header" : "navigation_warning_header";
            default:
                if (i < 0 || !SearchConfig.get().getNavigationConfig().useBatchContent(sectionType)) {
                    return null;
                }
                switch (sectionType) {
                    case SECTION_TYPE_RECOMMEND:
                        return "navigation_recommend_item";
                    case SECTION_TYPE_PEOPLE:
                        return "navigation_people_item";
                    case SECTION_TYPE_LOCATION:
                        return "navigation_location_item";
                    default:
                        return "navigation_tag_item";
                }
        }
    }

    /* access modifiers changed from: protected */
    public void initDisplayImageOptions(Context context) {
        super.initDisplayImageOptions(context);
        int dimensionPixelSize = context.getResources().getDimensionPixelSize(R.dimen.search_radius_large);
        this.mRecommendItemDisplayImageOptions = this.mDisplayImageOptionBuilder.displayer(new RoundedCornerRectBitmapDisplayer(new int[]{dimensionPixelSize, 0, 0, dimensionPixelSize})).build();
        this.mPeopleItemDisplayImageOptions = this.mDisplayImageOptionBuilder.showImageOnLoading((int) R.drawable.default_face_cover).showImageOnFail(R.drawable.default_face_cover).showImageForEmptyUri(R.drawable.default_face_cover).displayer(new PeopleItemBitmapDisplayer(true)).usingRegionDecoderFace(true).build();
    }
}
