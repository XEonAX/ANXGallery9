package com.miui.gallery.search.statistics;

import android.app.Notification;
import android.content.Intent;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.cloud.NetworkUtils;
import com.miui.gallery.search.core.source.server.ServerSearchRequest.Builder;
import com.miui.gallery.search.utils.SearchLog;
import com.miui.gallery.search.utils.SearchUtils;
import com.miui.gallery.service.IntentServiceBase;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.NotificationHelper;
import com.miui.gallery.util.PrivacyAgreementUtils;
import java.util.ArrayList;
import java.util.List;

public class SearchStatReportService extends IntentServiceBase {
    public static String EXTRA_LOG_ITEM = "log_item";
    public static String EXTRA_UPLOAD = "upload";

    private void uploadStatEvents(SearchStatLogItem searchStatLogItem) {
        String xiaomiId = SearchUtils.getXiaomiId();
        if (xiaomiId == null || !PrivacyAgreementUtils.isCloudServiceAgreementEnable(GalleryApp.sGetAndroidContext()) || !NetworkUtils.isNetworkConnected() || NetworkUtils.isActiveNetworkMetered()) {
            if (searchStatLogItem != null) {
                SearchStatStorageHelper.saveLogItem(searchStatLogItem);
            }
            return;
        }
        ArrayList savedLogs = SearchStatStorageHelper.getSavedLogs();
        if ((savedLogs != null && !savedLogs.isEmpty()) || searchStatLogItem != null) {
            if (savedLogs == null) {
                savedLogs = new ArrayList(1);
            }
            if (searchStatLogItem != null) {
                savedLogs.add(searchStatLogItem);
            }
            int i = 0;
            while (i < savedLogs.size()) {
                try {
                    int min = Math.min(savedLogs.size(), i + 10);
                    List subList = savedLogs.subList(i, min);
                    try {
                        SearchLog.d("SearchStatReportService", "uploading batch statistic events [%d-%d][%s]...", Integer.valueOf(i), Integer.valueOf(min), subList);
                        new Builder().setMethod(1002).setUserPath(Builder.getDefaultUserPath(xiaomiId)).setUserId(xiaomiId).setQueryAppendPath("actionlog").addQueryParam("data", SearchStatUtils.getDataJson(subList)).setReportError(false).build().executeSync();
                        SearchLog.d("SearchStatReportService", "Upload batch succeed");
                        SearchStatStorageHelper.clearSavedLogs();
                    } catch (Exception e) {
                        SearchLog.d("SearchStatReportService", "Upload batch failed, %s", e);
                    }
                    i = min;
                } catch (Exception e2) {
                    try {
                        SearchLog.e("SearchStatReportService", (Throwable) e2);
                    } catch (Throwable th) {
                        SearchLog.d("SearchStatReportService", "Done uploading [%d] items, delete uploaded events", Integer.valueOf(savedLogs.size()));
                        SearchStatStorageHelper.clearSavedLogs();
                        throw th;
                    }
                }
            }
            SearchLog.d("SearchStatReportService", "Done uploading [%d] items, delete uploaded events", Integer.valueOf(savedLogs.size()));
            SearchStatStorageHelper.clearSavedLogs();
        }
    }

    /* access modifiers changed from: protected */
    public Notification getNotification() {
        return NotificationHelper.getEmptyNotification(getApplicationContext());
    }

    /* access modifiers changed from: protected */
    public int getNotificationId() {
        return 7;
    }

    /* access modifiers changed from: protected */
    public void onHandleIntent(Intent intent) {
        super.onHandleIntent(intent);
        if (intent == null) {
            Log.w("SearchStatReportService", "Received a NULL intent!");
            return;
        }
        SearchStatLogItem searchStatLogItem = null;
        if (intent.getSerializableExtra(EXTRA_LOG_ITEM) != null) {
            searchStatLogItem = (SearchStatLogItem) intent.getSerializableExtra(EXTRA_LOG_ITEM);
            SearchLog.d("SearchStatReportService", "On log [%s]", searchStatLogItem);
        }
        if (intent.getBooleanExtra(EXTRA_UPLOAD, false)) {
            uploadStatEvents(searchStatLogItem);
        } else if (searchStatLogItem != null) {
            SearchStatStorageHelper.saveLogItem(searchStatLogItem);
        }
    }
}
