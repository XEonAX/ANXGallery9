package com.miui.gallery.search.utils;

import android.accounts.Account;
import android.os.Bundle;
import com.miui.gallery.cloud.AccountCache;
import com.miui.gallery.search.SearchConstants;
import com.miui.gallery.search.core.result.SourceResult;
import com.miui.gallery.search.core.result.SuggestionResult;
import com.miui.gallery.search.core.suggestion.RankInfo;
import com.miui.gallery.search.core.suggestion.SuggestionCursor;
import java.util.Map;

public class SearchUtils {
    public static boolean compareResultHashCode(SourceResult sourceResult, SourceResult sourceResult2) {
        String resultHashCode = getResultHashCode(sourceResult);
        return resultHashCode != null && resultHashCode.equals(getResultHashCode(sourceResult2));
    }

    public static String generateResultHashCode(Object obj) {
        if (obj instanceof String) {
            return String.valueOf(obj.hashCode());
        }
        if (obj != null) {
            return String.valueOf(obj.toString().hashCode());
        }
        return null;
    }

    public static int getErrorStatus(SuggestionResult suggestionResult) {
        if (suggestionResult == null || suggestionResult.getErrorInfo() == null) {
            return -1;
        }
        return suggestionResult.getErrorInfo().getErrorStatus();
    }

    public static RankInfo getRankInfo(SuggestionCursor suggestionCursor) {
        if (suggestionCursor == null || suggestionCursor.getExtras() == null) {
            return null;
        }
        return (RankInfo) suggestionCursor.getExtras().getSerializable("rankInfo");
    }

    public static String getResultHashCode(SourceResult sourceResult) {
        if (sourceResult == null || sourceResult.getResultExtras() == null || sourceResult.getResultExtras() == Bundle.EMPTY) {
            return null;
        }
        return sourceResult.getResultExtras().getString("result_hash_code");
    }

    public static String getXiaomiId() {
        Account account = AccountCache.getAccount();
        if (account != null) {
            return account.name;
        }
        return null;
    }

    public static boolean isErrorResult(SuggestionResult suggestionResult) {
        return SearchConstants.isErrorStatus(getErrorStatus(suggestionResult));
    }

    public static void removeExtraParamsForPersistence(Map<String, String> map) {
        if (map != null && !map.isEmpty()) {
            map.remove("use_persistent_response");
            map.remove("serialId");
            map.remove("logData");
        }
    }
}
