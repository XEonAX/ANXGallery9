package com.miui.gallery.search.core.source.server;

import android.content.Context;
import android.text.TextUtils;
import com.google.gson.annotations.SerializedName;
import com.miui.gallery.movie.utils.MovieStatUtils;
import com.miui.gallery.net.base.ErrorCode;
import com.miui.gallery.net.base.RequestError;
import com.miui.gallery.search.SearchConstants.SearchType;
import com.miui.gallery.search.core.QueryInfo;
import com.miui.gallery.search.core.QueryInfo.Builder;
import com.miui.gallery.search.core.result.BaseSourceResult;
import com.miui.gallery.search.core.result.ErrorInfo;
import com.miui.gallery.search.core.result.SourceResult;
import com.miui.gallery.search.core.suggestion.SuggestionCursor;
import com.miui.gallery.search.resultpage.DataListSourceResult;
import com.miui.gallery.search.utils.SearchLog;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class DataListSource extends ServerSource {
    private static final SearchType[] SUPPORT_SEARCH_TYPE = {SearchType.SEARCH_TYPE_RESULT_LIST, SearchType.SEARCH_TYPE_FILTER};

    private static class DataListResponseData {
        @SerializedName("indexHash")
        public long indexHash;
        @SerializedName("isLastPage")
        public boolean isLastPage;
        @SerializedName("items")
        public List<ItemSuggestion> items;
        @SerializedName("nextPos")
        public int nextPosition;

        private DataListResponseData() {
            this.nextPosition = 0;
            this.isLastPage = false;
            this.indexHash = -1;
        }
    }

    public DataListSource(Context context) {
        super(context);
    }

    /* access modifiers changed from: protected */
    public boolean canCarryLog() {
        return true;
    }

    /* access modifiers changed from: protected */
    public BaseSourceResult generateDefaultResult(QueryInfo queryInfo, SuggestionCursor suggestionCursor) {
        DataListSourceResult dataListSourceResult = new DataListSourceResult(queryInfo, this, suggestionCursor, 0, true, -1);
        return dataListSourceResult;
    }

    public String getName() {
        return "server_controlled_data_list";
    }

    public int getPriority(QueryInfo queryInfo) {
        if (queryInfo.getSearchType() == SearchType.SEARCH_TYPE_FILTER) {
            return 3;
        }
        return super.getPriority(queryInfo);
    }

    /* access modifiers changed from: protected */
    public String getQueryAppendPath(QueryInfo queryInfo) {
        return "list";
    }

    /* access modifiers changed from: protected */
    public Map<String, String> getQueryParams(QueryInfo queryInfo) {
        Map<String, String> queryParams = super.getQueryParams(queryInfo);
        if (queryParams != null && !queryParams.isEmpty()) {
            String str = (String) queryParams.get("rankName");
            queryParams.remove("rankName");
            String str2 = (String) queryParams.get("rankOrder");
            queryParams.remove("rankOrder");
            if (!TextUtils.isEmpty(str) && !TextUtils.isEmpty(str2)) {
                ItemRankInfo itemRankInfo = new ItemRankInfo();
                itemRankInfo.name = str;
                itemRankInfo.order = str2;
                queryParams.put("rankInfo", HttpUtils.createGson().toJson((Object) itemRankInfo));
            }
        }
        return queryParams;
    }

    /* access modifiers changed from: protected */
    public Type getResponseDataType(QueryInfo queryInfo) {
        return DataListResponseData.class;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:41:0x00f6, code lost:
        return onResponse(r14, null, r4);
     */
    /* JADX WARNING: Missing exception handler attribute for start block: B:34:0x00e1 */
    public SourceResult getSuggestions(QueryInfo queryInfo) {
        try {
            int intValue = Integer.valueOf(queryInfo.getParam("num")).intValue();
            if (intValue <= 100) {
                return super.getSuggestions(queryInfo);
            }
            int intValue2 = Integer.valueOf(queryInfo.getParam("pos")).intValue();
            int i = (intValue + intValue2) - 1;
            DataListResponseData dataListResponseData = new DataListResponseData();
            dataListResponseData.items = new ArrayList();
            while (true) {
                if (intValue2 > i || dataListResponseData.isLastPage) {
                    break;
                }
                QueryInfo build = new Builder().cloneFrom(queryInfo).addParam("num", String.valueOf(Math.min(100, (i - intValue2) + 1))).addParam("pos", String.valueOf(intValue2)).build();
                SearchLog.d("DataListSource", "Start batch request [%s]", queryInfo);
                ServerSearchRequest build2 = getRequestBuilder(build).build();
                try {
                    Object[] executeSync = build2.executeSync();
                    if (executeSync != null && executeSync.length > 0 && (executeSync[0] instanceof DataListResponseData)) {
                        DataListResponseData dataListResponseData2 = (DataListResponseData) executeSync[0];
                        if (dataListResponseData.indexHash <= 0) {
                            dataListResponseData.indexHash = dataListResponseData2.indexHash;
                        } else if (dataListResponseData.indexHash != dataListResponseData2.indexHash) {
                            throw new RequestError(ErrorCode.DATA_BIND_ERROR, "Index hash changed!", null);
                        }
                        if (dataListResponseData2.items == null || dataListResponseData2.items.size() <= 0 || dataListResponseData2.nextPosition <= intValue2) {
                            dataListResponseData.isLastPage = true;
                        } else {
                            dataListResponseData.items.addAll(dataListResponseData2.items);
                            dataListResponseData.nextPosition = dataListResponseData2.nextPosition;
                            SearchLog.d("DataListSource", "On add batch request result [%d]", Integer.valueOf(dataListResponseData2.items.size()));
                            dataListResponseData.isLastPage = dataListResponseData2.isLastPage;
                            intValue2 = dataListResponseData2.nextPosition;
                        }
                    }
                } catch (RequestError e) {
                    return onResponseError(queryInfo, build2, e);
                } catch (Exception ) {
                    return onResponseError(queryInfo, new ErrorInfo(7));
                }
            }
            throw new RequestError(ErrorCode.BODY_EMPTY, "Execute result should not be null", null);
        } catch (Exception unused) {
            return super.getSuggestions(queryInfo);
        }
    }

    public SearchType[] getSupportSearchTypes() {
        return SUPPORT_SEARCH_TYPE;
    }

    /* access modifiers changed from: protected */
    public boolean isPersistable(QueryInfo queryInfo) {
        return queryInfo != null && MovieStatUtils.DOWNLOAD_SUCCESS.equals(queryInfo.getParam("pos"));
    }

    /* access modifiers changed from: protected */
    public SourceResult onResponse(QueryInfo queryInfo, ServerSearchRequest serverSearchRequest, Object obj) {
        if (!(obj instanceof DataListResponseData)) {
            SearchLog.e("DataListSource", "Not supported response data type");
            return null;
        }
        DataListResponseData dataListResponseData = (DataListResponseData) obj;
        DataListSourceResult dataListSourceResult = new DataListSourceResult(queryInfo, this, ConvertUtil.createSuggestionCursor(dataListResponseData.items, this, queryInfo), dataListResponseData.nextPosition, dataListResponseData.isLastPage, dataListResponseData.indexHash);
        return dataListSourceResult;
    }
}
