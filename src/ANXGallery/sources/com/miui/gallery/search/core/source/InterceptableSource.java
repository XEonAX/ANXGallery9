package com.miui.gallery.search.core.source;

import android.content.Context;
import android.text.TextUtils;
import com.miui.gallery.cloud.NetworkUtils;
import com.miui.gallery.search.core.QueryInfo;
import com.miui.gallery.search.core.result.BaseSourceResult;
import com.miui.gallery.search.core.result.ErrorInfo;
import com.miui.gallery.search.core.result.SourceResult;
import com.miui.gallery.search.core.suggestion.SuggestionCursor;
import com.miui.gallery.search.utils.SearchUtils;
import com.miui.gallery.ui.AIAlbumStatusHelper;
import com.miui.gallery.util.PrivacyAgreementUtils;
import com.miui.gallery.util.SyncUtil;
import com.miui.gallery.util.deprecated.Preference;

public abstract class InterceptableSource extends AbstractSource {
    protected Context mContext;

    public InterceptableSource(Context context) {
        this.mContext = context;
    }

    /* access modifiers changed from: protected */
    public abstract SourceResult doGetSuggestions(QueryInfo queryInfo);

    /* access modifiers changed from: protected */
    public BaseSourceResult generateDefaultResult(QueryInfo queryInfo, SuggestionCursor suggestionCursor) {
        return new BaseSourceResult(queryInfo, this, suggestionCursor);
    }

    /* access modifiers changed from: protected */
    public SourceResult getPrejudgeResult(QueryInfo queryInfo) {
        if (isFatalCondition(queryInfo, 3) && TextUtils.isEmpty(SearchUtils.getXiaomiId())) {
            BaseSourceResult generateDefaultResult = generateDefaultResult(queryInfo, null);
            generateDefaultResult.setErrorInfo(new ErrorInfo(3));
            return generateDefaultResult;
        } else if (!PrivacyAgreementUtils.isCloudServiceAgreementEnable(this.mContext)) {
            BaseSourceResult generateDefaultResult2 = generateDefaultResult(queryInfo, null);
            generateDefaultResult2.setErrorInfo(new ErrorInfo(4));
            return generateDefaultResult2;
        } else if (!isFatalCondition(queryInfo, 10) || Preference.sIsFirstSynced()) {
            if (isFatalCondition(queryInfo, 12) && !AIAlbumStatusHelper.isLocalSearchOpen(true)) {
                BaseSourceResult generateDefaultResult3 = generateDefaultResult(queryInfo, null);
                generateDefaultResult3.setErrorInfo(new ErrorInfo(12));
                return generateDefaultResult3;
            } else if (isFatalCondition(queryInfo, 13) && !AIAlbumStatusHelper.isCloudControlSearchAIAlbumOpen()) {
                BaseSourceResult generateDefaultResult4 = generateDefaultResult(queryInfo, null);
                generateDefaultResult4.setErrorInfo(new ErrorInfo(13));
                return generateDefaultResult4;
            } else if (!isFatalCondition(queryInfo, 14) || AIAlbumStatusHelper.isCloudControlSearchBarOpen()) {
                return null;
            } else {
                BaseSourceResult generateDefaultResult5 = generateDefaultResult(queryInfo, null);
                generateDefaultResult5.setErrorInfo(new ErrorInfo(14));
                return generateDefaultResult5;
            }
        } else if (!NetworkUtils.isNetworkConnected()) {
            BaseSourceResult generateDefaultResult6 = generateDefaultResult(queryInfo, null);
            generateDefaultResult6.setErrorInfo(new ErrorInfo(1));
            return generateDefaultResult6;
        } else if (SyncUtil.isGalleryCloudSyncable(this.mContext)) {
            BaseSourceResult generateDefaultResult7 = generateDefaultResult(queryInfo, null);
            generateDefaultResult7.setErrorInfo(new ErrorInfo(10));
            return generateDefaultResult7;
        } else {
            BaseSourceResult generateDefaultResult8 = generateDefaultResult(queryInfo, null);
            generateDefaultResult8.setErrorInfo(new ErrorInfo(4));
            return generateDefaultResult8;
        }
    }

    public SourceResult getSuggestions(QueryInfo queryInfo) {
        SourceResult prejudgeResult = getPrejudgeResult(queryInfo);
        return prejudgeResult != null ? prejudgeResult : doGetSuggestions(queryInfo);
    }

    /* access modifiers changed from: protected */
    public boolean isFatalCondition(QueryInfo queryInfo, int i) {
        return i == 12;
    }
}
