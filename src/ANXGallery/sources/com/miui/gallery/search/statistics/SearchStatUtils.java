package com.miui.gallery.search.statistics;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.util.Pair;
import com.google.gson.Gson;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.search.utils.SearchLog;
import com.miui.gallery.util.BackgroundServiceHelper;
import com.miui.os.Rom;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Stack;

public class SearchStatUtils {
    private static final double POW = Math.pow(10.0d, 8.0d);
    private static SearchStatLogItem sCachedLog = null;
    private static final Object sCachedLogLock = new Object();
    private static Gson sGson = new Gson();
    private static final Object sSerialLock = new Object();
    private static Random sSerialRandom = null;
    private static Stack<Pair<String, String>> sSerialStack;

    public static Bundle buildSearchEventExtras(Bundle bundle, String[] strArr, String[] strArr2) {
        if (strArr == null || strArr2 == null || strArr.length != strArr2.length) {
            return bundle;
        }
        if (bundle == null || bundle == Bundle.EMPTY) {
            bundle = new Bundle();
        }
        bundle.putStringArray("search_event_keys", strArr);
        bundle.putStringArray("search_event_values", strArr2);
        return bundle;
    }

    public static Map<String, String> buildSearchEventParams(Bundle bundle) {
        if (bundle == null) {
            return null;
        }
        String[] stringArray = bundle.getStringArray("search_event_keys");
        String[] stringArray2 = bundle.getStringArray("search_event_values");
        if (stringArray == null || stringArray2 == null || stringArray.length != stringArray2.length) {
            return null;
        }
        HashMap hashMap = new HashMap();
        int i = 0;
        while (i < stringArray.length) {
            try {
                hashMap.put(stringArray[i], stringArray2[i]);
                i++;
            } catch (Exception e) {
                SearchLog.e("SearchStatUtils", "Error occurred while build search event extras %s", e);
            }
        }
        return hashMap;
    }

    public static void cacheEvent(String str, String str2, Map<String, String> map) {
        SearchStatLogItem searchStatLogItem;
        SearchStatLogItem formLogItem = formLogItem(str, str2, map);
        synchronized (sCachedLogLock) {
            searchStatLogItem = sCachedLog != null ? sCachedLog : null;
            sCachedLog = formLogItem;
        }
        if (searchStatLogItem != null) {
            reportEvent(searchStatLogItem);
        }
    }

    public static String createNewSerial(String str) {
        if (sSerialStack == null) {
            synchronized (sSerialLock) {
                if (sSerialStack == null) {
                    sSerialStack = new Stack<>();
                }
            }
        }
        String createNewSerialId = createNewSerialId();
        synchronized (sSerialLock) {
            sSerialStack.push(new Pair(str, createNewSerialId));
        }
        return createNewSerialId;
    }

    private static String createNewSerialId() {
        if (sSerialRandom == null) {
            sSerialRandom = new Random();
        }
        return String.valueOf((int) ((sSerialRandom.nextDouble() + 1.0d) * POW)).substring(1);
    }

    private static SearchStatLogItem formLogItem(String str, String str2, Map<String, String> map) {
        if (map == null) {
            map = new HashMap<>();
        }
        map.put("isInternational", String.valueOf(Rom.IS_INTERNATIONAL));
        if (str != null) {
            map.put("from", str);
        }
        Pair serialStackHead = getSerialStackHead();
        return new SearchStatLogItem(serialStackHead == null ? null : (String) serialStackHead.second, str2, map);
    }

    public static String getCurrentSerial() {
        Pair serialStackHead = getSerialStackHead();
        if (serialStackHead != null) {
            return (String) serialStackHead.second;
        }
        return null;
    }

    public static String getDataJson(SearchStatLogItem searchStatLogItem) {
        return sGson.toJson((Object) searchStatLogItem);
    }

    public static String getDataJson(List<SearchStatLogItem> list) {
        HashMap hashMap = new HashMap();
        hashMap.put("items", list);
        return sGson.toJson((Object) hashMap);
    }

    /* JADX WARNING: Code restructure failed: missing block: B:12:0x001b, code lost:
        return null;
     */
    private static Pair<String, String> getSerialStackHead() {
        synchronized (sSerialLock) {
            if (sSerialStack != null && !sSerialStack.empty()) {
                Pair<String, String> pair = (Pair) sSerialStack.peek();
                return pair;
            }
        }
    }

    public static String onCompleteSerial(String str) {
        Pair serialStackHead;
        if (sSerialStack == null) {
            return null;
        }
        synchronized (sSerialLock) {
            serialStackHead = getSerialStackHead();
            if (!(serialStackHead == null || serialStackHead.first == null || !((String) serialStackHead.first).contentEquals(str))) {
                sSerialStack.pop();
            }
        }
        if (serialStackHead != null) {
            return (String) serialStackHead.second;
        }
        SearchLog.e("SearchStatUtils", "Current serial stack empty or head is not from %s, stack size %d!", str, Integer.valueOf(sSerialStack.size()));
        return null;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:10:0x0012, code lost:
        r2 = getDataJson(r1);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:11:0x0016, code lost:
        return r2;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:9:0x000f, code lost:
        if (r1 != null) goto L_0x0012;
     */
    public static String pullCachedEvent() {
        synchronized (sCachedLogLock) {
            String str = null;
            if (sCachedLog == null) {
                return null;
            }
            SearchStatLogItem searchStatLogItem = sCachedLog;
            sCachedLog = null;
        }
    }

    private static void reportEvent(SearchStatLogItem searchStatLogItem) {
        Context sGetAndroidContext = GalleryApp.sGetAndroidContext();
        Intent intent = new Intent(sGetAndroidContext, SearchStatReportService.class);
        intent.putExtra(SearchStatReportService.EXTRA_LOG_ITEM, searchStatLogItem);
        intent.putExtra(SearchStatReportService.EXTRA_UPLOAD, true);
        BackgroundServiceHelper.startForegroundServiceIfNeed(sGetAndroidContext, intent);
    }

    public static void reportEvent(String str, String str2) {
        reportEvent(str, str2, null);
    }

    public static void reportEvent(String str, String str2, String str3, String str4) {
        reportEvent(str, str2, str3, str4, null, null);
    }

    public static void reportEvent(String str, String str2, String str3, String str4, String str5, String str6) {
        HashMap hashMap = new HashMap();
        if (!(str3 == null || str4 == null)) {
            hashMap.put(str3, str4);
        }
        if (!(str5 == null || str6 == null)) {
            hashMap.put(str5, str6);
        }
        reportEvent(str, str2, hashMap);
    }

    public static void reportEvent(String str, String str2, Map<String, String> map) {
        reportEvent(formLogItem(str, str2, map));
    }
}
