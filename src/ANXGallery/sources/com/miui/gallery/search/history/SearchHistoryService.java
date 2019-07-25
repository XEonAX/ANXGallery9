package com.miui.gallery.search.history;

import android.app.IntentService;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.text.TextUtils;
import com.miui.gallery.search.SearchContract.History;
import com.miui.gallery.search.core.suggestion.Suggestion;
import com.miui.gallery.search.utils.SearchLog;

public class SearchHistoryService extends IntentService {
    public static String EXTRA_HISTORY_ITEM = "history_item";
    public static String EXTRA_OPERATION = "operation";

    public SearchHistoryService() {
        super("SearchHistoryService");
    }

    public static void addHistory(Context context, Suggestion suggestion) {
        if (context != null && suggestion != null) {
            Intent intent = new Intent(context, SearchHistoryService.class);
            intent.putExtra(EXTRA_OPERATION, 0);
            intent.putExtra(EXTRA_HISTORY_ITEM, toContentValues(suggestion));
            context.startService(intent);
        }
    }

    public static void clearHistory(Context context) {
        Intent intent = new Intent(context, SearchHistoryService.class);
        intent.putExtra(EXTRA_OPERATION, 2);
        context.startService(intent);
    }

    protected static ContentValues toContentValues(Suggestion suggestion) {
        ContentValues contentValues = new ContentValues();
        String suggestionTitle = suggestion.getSuggestionTitle();
        String intentActionURI = suggestion.getIntentActionURI();
        if (suggestionTitle != null) {
            if (intentActionURI != null) {
                String queryParameter = Uri.parse(intentActionURI).getQueryParameter("title");
                if (!TextUtils.isEmpty(queryParameter)) {
                    suggestionTitle = queryParameter;
                }
            }
            contentValues.put("title", suggestionTitle);
        }
        if (suggestion.getSuggestionSubTitle() != null) {
            contentValues.put("subTitle", suggestion.getSuggestionSubTitle());
        }
        if (intentActionURI != null) {
            contentValues.put("actionUri", suggestion.getIntentActionURI());
        }
        if (suggestion.getSuggestionIcon() != null) {
            contentValues.put("icon", suggestion.getSuggestionIcon());
        }
        return contentValues;
    }

    /* access modifiers changed from: protected */
    public void onHandleIntent(Intent intent) {
        int intExtra = intent.getIntExtra(EXTRA_OPERATION, -1);
        switch (intExtra) {
            case 0:
                ContentValues contentValues = (ContentValues) intent.getParcelableExtra(EXTRA_HISTORY_ITEM);
                if (contentValues != null) {
                    getContentResolver().insert(History.URI, contentValues);
                    break;
                } else {
                    SearchLog.w("SearchHistoryService", "No history item found for operation add");
                    return;
                }
            case 1:
                break;
            case 2:
                getContentResolver().delete(History.URI, null, null);
                break;
            default:
                SearchLog.w("SearchHistoryService", "Invalid history operation type: %d", Integer.valueOf(intExtra));
                break;
        }
    }
}
