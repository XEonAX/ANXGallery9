package com.miui.gallery.search.resultpage;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import com.miui.gallery.R;
import com.miui.gallery.activity.BaseActivity;
import com.miui.gallery.search.statistics.SearchStatUtils;
import com.miui.gallery.search.utils.SearchLog;
import com.nexstreaming.nexeditorsdk.nexExportFormat;
import java.util.HashMap;
import java.util.Map;
import miui.app.Fragment;

public class SearchResultActivity extends BaseActivity {
    private Fragment mFragment;

    /* access modifiers changed from: protected */
    public int getFragmentContainerId() {
        return R.id.content;
    }

    public void onActivityResult(int i, int i2, Intent intent) {
        this.mFragment.onActivityResult(i, i2, intent);
    }

    /* access modifiers changed from: protected */
    public void onCreate(Bundle bundle) {
        String str;
        super.onCreate(bundle);
        setContentView(R.layout.search_result_activity);
        Intent intent = getIntent();
        if (intent.getData() == null) {
            SearchLog.e("SearchResultActivity", "No extra data fount!");
            finish();
            return;
        }
        Uri data = intent.getData();
        String str2 = null;
        if (data.getLastPathSegment().equals("result")) {
            str2 = data.getQueryParameter(nexExportFormat.TAG_FORMAT_TYPE);
            str = "client_enter_image_result_page";
        } else {
            str = null;
        }
        if (data.getLastPathSegment().equals("tags") || "tagList".equals(str2)) {
            str2 = "tagList";
            str = "client_enter_tag_list_page";
        } else if (data.getLastPathSegment().equals("locations") || "locationList".equals(str2)) {
            str2 = "locationList";
            str = "client_enter_location_list_page";
        } else if (data.getLastPathSegment().equals("likelyResults") || "likelyImage".equals(str2)) {
            str2 = "likelyImage";
            str = "client_enter_likely_image_list_page";
        }
        if (str2 == null) {
            SearchLog.e("SearchResultActivity", "Invalid action uri, no result type specified!");
            finish();
            return;
        }
        Map buildSearchEventParams = SearchStatUtils.buildSearchEventParams(intent.getExtras());
        if (buildSearchEventParams == null) {
            buildSearchEventParams = new HashMap();
        }
        for (String str3 : data.getQueryParameterNames()) {
            buildSearchEventParams.put(str3, data.getQueryParameter(str3));
        }
        SearchStatUtils.cacheEvent(intent.getStringExtra("from"), str, buildSearchEventParams);
        this.mFragment = getFragmentManager().findFragmentByTag("RootFragment");
        if (this.mFragment == null) {
            getIntent().setData(data.buildUpon().appendQueryParameter(nexExportFormat.TAG_FORMAT_TYPE, str2).build());
            if (str2.equals("imageList")) {
                this.mFragment = new SearchImageResultFragment();
            } else if (str2.equals("locationList")) {
                this.mFragment = new LocationListFragment();
            } else if (str2.equals("tagList")) {
                this.mFragment = new TagListFragment();
            } else if (str2.equals("likelyImage")) {
                this.mFragment = new SearchFeedbackLikelyResultFragment();
            } else {
                this.mFragment = new SearchResultFragment();
            }
            startFragment(this.mFragment, "RootFragment", false, false);
        }
    }
}
