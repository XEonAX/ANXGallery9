package com.miui.gallery.search.hint;

import android.view.LayoutInflater;
import android.view.View;
import android.widget.TextView;
import com.miui.gallery.R;
import com.miui.gallery.search.widget.bannerView.BannerView;
import com.miui.gallery.search.widget.bannerView.BaseBannerAdapter;

public class SearchBarHintAdapter extends BaseBannerAdapter<SearchBarHintItem> {
    public SearchBarHintAdapter(SearchBarHintItem[] searchBarHintItemArr) {
        super(searchBarHintItemArr);
    }

    public void bindView(View view, int i) {
        SearchBarHintItem searchBarHintItem = (SearchBarHintItem) getItem(i);
        ((TextView) view.findViewById(R.id.hint_text)).setHint(searchBarHintItem.getHintText());
        if (getOnUpdateTextListener() != null) {
            getOnUpdateTextListener().onUpdateText(null, searchBarHintItem.getHintText());
        }
    }

    public View getView(BannerView bannerView) {
        return LayoutInflater.from(bannerView.getContext()).inflate(R.layout.search_bar_hint_item, null);
    }
}
