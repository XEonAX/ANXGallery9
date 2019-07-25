package com.miui.gallery.search.core.source.server;

import android.content.Context;
import android.os.Bundle;
import android.text.TextUtils;
import com.miui.gallery.cloud.NetworkUtils;
import com.miui.gallery.model.PersistentResponse;
import com.miui.gallery.net.base.ErrorCode;
import com.miui.gallery.net.base.RequestError;
import com.miui.gallery.search.core.QueryInfo;
import com.miui.gallery.search.core.result.BaseSourceResult;
import com.miui.gallery.search.core.result.ErrorInfo;
import com.miui.gallery.search.core.result.SourceResult;
import com.miui.gallery.search.core.source.InterceptableSource;
import com.miui.gallery.search.core.source.server.ServerSearchRequest.Builder;
import com.miui.gallery.search.statistics.SearchStatUtils;
import com.miui.gallery.search.utils.SearchLog;
import com.miui.gallery.search.utils.SearchUtils;
import com.miui.gallery.util.PersistentResponseHelper;
import java.lang.reflect.Type;
import java.util.HashMap;
import java.util.Map;

public abstract class ServerSource extends InterceptableSource {
    public ServerSource(Context context) {
        super(context);
    }

    /* access modifiers changed from: protected */
    public boolean canCarryLog() {
        return false;
    }

    /* access modifiers changed from: protected */
    public SourceResult doGetSuggestions(QueryInfo queryInfo) {
        ServerSearchRequest build = getRequestBuilder(queryInfo).build();
        if (canCarryLog()) {
            String pullCachedEvent = SearchStatUtils.pullCachedEvent();
            if (pullCachedEvent != null) {
                build.addParam("logData", pullCachedEvent);
            }
        }
        try {
            Object[] executeSync = build.executeSync();
            String str = null;
            if (executeSync == null || executeSync.length <= 0) {
                throw new RequestError(ErrorCode.BODY_EMPTY, "Execute result should not be null", null);
            }
            if (isPersistable(queryInfo)) {
                long j = -1;
                if (build.getResponseData() instanceof Cacheable) {
                    j = ((Cacheable) build.getResponseData()).getExpireMills();
                }
                Map params = build.getParams();
                SearchUtils.removeExtraParamsForPersistence(params);
                PersistentResponseHelper.saveAsync(build.getUrl(), params, build.getResponseRawData(), j);
                str = SearchUtils.generateResultHashCode(build.getResponseRawData());
            }
            SourceResult onResponse = onResponse(queryInfo, build, executeSync[0]);
            if (!(str == null || onResponse == null)) {
                Bundle resultExtras = onResponse.getResultExtras();
                if (resultExtras == null || resultExtras == Bundle.EMPTY) {
                    resultExtras = new Bundle();
                    onResponse.setResultExtras(resultExtras);
                }
                resultExtras.putString("result_hash_code", str);
            }
            return onResponse;
        } catch (RequestError e) {
            return onResponseError(queryInfo, build, e);
        } catch (Exception unused) {
            return onResponseError(queryInfo, new ErrorInfo(7));
        }
    }

    /* access modifiers changed from: protected */
    public SourceResult getPrejudgeResult(QueryInfo queryInfo) {
        SourceResult prejudgeResult = super.getPrejudgeResult(queryInfo);
        if (prejudgeResult != null) {
            return prejudgeResult;
        }
        boolean z = false;
        boolean z2 = !NetworkUtils.isNetworkConnected() && isFatalCondition(queryInfo, 1);
        boolean z3 = queryInfo != null && Boolean.valueOf(queryInfo.getParam("use_persistent_response")).booleanValue();
        if ((z2 || z3) && isPersistable(queryInfo)) {
            try {
                ServerSearchRequest build = getRequestBuilder(queryInfo).build();
                Map params = build.getParams();
                SearchUtils.removeExtraParamsForPersistence(params);
                PersistentResponse find = PersistentResponseHelper.find(build.getUrl(), params);
                if (find != null && !TextUtils.isEmpty(find.getResponse())) {
                    Object fromJson = HttpUtils.createGson().fromJson(find.getResponse(), getResponseDataType(queryInfo));
                    if (fromJson != null) {
                        SourceResult onResponse = onResponse(queryInfo, build, fromJson);
                        if (onResponse != null) {
                            boolean z4 = find.getUpdateTime() + find.getExpireMillis() < System.currentTimeMillis();
                            Bundle resultExtras = onResponse.getResultExtras();
                            if (resultExtras == null || resultExtras == Bundle.EMPTY) {
                                resultExtras = new Bundle();
                                onResponse.setResultExtras(resultExtras);
                            }
                            String str = "need_requery";
                            if (!z2 && z4) {
                                z = true;
                            }
                            resultExtras.putBoolean(str, z);
                            resultExtras.putString("result_hash_code", SearchUtils.generateResultHashCode(find.getResponse()));
                        }
                        return onResponse;
                    }
                }
            } catch (Exception e) {
                SearchLog.e("ServerSource", (Throwable) e);
            }
        }
        if (!z2) {
            return prejudgeResult;
        }
        BaseSourceResult generateDefaultResult = generateDefaultResult(queryInfo, null);
        generateDefaultResult.setErrorInfo(new ErrorInfo(1));
        return generateDefaultResult;
    }

    public int getPriority(QueryInfo queryInfo) {
        return 2;
    }

    /* access modifiers changed from: protected */
    public abstract String getQueryAppendPath(QueryInfo queryInfo);

    /* access modifiers changed from: protected */
    public Map<String, String> getQueryParams(QueryInfo queryInfo) {
        return new HashMap(queryInfo.getParams());
    }

    /* access modifiers changed from: protected */
    public String getQueryUserPath(String str) {
        return Builder.getDefaultUserPath(str);
    }

    /* access modifiers changed from: protected */
    public Builder getRequestBuilder(QueryInfo queryInfo) {
        String xiaomiId = SearchUtils.getXiaomiId();
        return new Builder().setResultDataType(getResponseDataType(queryInfo)).setMethod(1001).setUserPath(getQueryUserPath(xiaomiId)).setUserId(xiaomiId).setQueryAppendPath(getQueryAppendPath(queryInfo)).addQueryParams(getQueryParams(queryInfo)).setUseCache(useCache(queryInfo));
    }

    /* access modifiers changed from: protected */
    public Type getResponseDataType(QueryInfo queryInfo) {
        return SectionedResponseData.class;
    }

    /* access modifiers changed from: protected */
    public int getSearchErrorCodeFromNetErrorCode(ErrorCode errorCode) {
        switch (errorCode) {
            case NETWORK_NOT_CONNECTED:
                return 1;
            case SERVER_ERROR:
                return 6;
            case NET_ERROR:
            case BODY_EMPTY:
                return 5;
            case PARSE_ERROR:
            case HANDLE_ERROR:
            case DATA_BIND_ERROR:
                return 7;
            default:
                return 9;
        }
    }

    /* access modifiers changed from: protected */
    public boolean isFatalCondition(QueryInfo queryInfo, int i) {
        if (i == 1 || i == 3 || i == 10 || i == 13) {
            return true;
        }
        return super.isFatalCondition(queryInfo, i);
    }

    /* access modifiers changed from: protected */
    public boolean isPersistable(QueryInfo queryInfo) {
        return false;
    }

    /* access modifiers changed from: protected */
    public abstract SourceResult onResponse(QueryInfo queryInfo, ServerSearchRequest serverSearchRequest, Object obj);

    /* access modifiers changed from: protected */
    public SourceResult onResponseError(QueryInfo queryInfo, ErrorInfo errorInfo) {
        SearchLog.w("ServerSource", "onResponseError for query %s, error %s", queryInfo, errorInfo);
        BaseSourceResult generateDefaultResult = generateDefaultResult(queryInfo, null);
        generateDefaultResult.setErrorInfo(errorInfo);
        return generateDefaultResult;
    }

    /* access modifiers changed from: protected */
    public SourceResult onResponseError(QueryInfo queryInfo, ServerSearchRequest serverSearchRequest, RequestError requestError) {
        return onResponseError(queryInfo, new ErrorInfo(getSearchErrorCodeFromNetErrorCode(requestError.getErrorCode()), requestError.getMessage()));
    }

    /* access modifiers changed from: protected */
    public boolean useCache(QueryInfo queryInfo) {
        return false;
    }
}
