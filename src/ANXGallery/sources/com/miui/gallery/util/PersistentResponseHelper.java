package com.miui.gallery.util;

import android.text.TextUtils;
import com.miui.gallery.dao.GalleryEntityManager;
import com.miui.gallery.model.PersistentResponse;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.threadpool.ThreadPool;
import com.miui.gallery.threadpool.ThreadPool.Job;
import com.miui.gallery.threadpool.ThreadPool.JobContext;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Map;
import java.util.Map.Entry;
import java.util.TreeMap;
import org.keyczar.Keyczar;

public class PersistentResponseHelper {
    private static String appendUrlParams(String str, Map<String, String> map) {
        if (str == null || map == null || map.isEmpty()) {
            return str;
        }
        TreeMap treeMap = new TreeMap();
        treeMap.putAll(map);
        StringBuilder sb = new StringBuilder(str);
        if (str.indexOf(63) > 0) {
            if (!str.endsWith("?") && !str.endsWith("&")) {
                sb.append("&");
            }
            sb.append(encodeParameters(treeMap, Keyczar.DEFAULT_ENCODING));
            return sb.toString();
        }
        sb.append("?");
        sb.append(encodeParameters(treeMap, Keyczar.DEFAULT_ENCODING));
        return sb.toString();
    }

    public static void cleanupInvalidRecords() {
        GalleryEntityManager.getInstance().delete(PersistentResponse.class, "lastVisitTime <= ? ", new String[]{String.valueOf(System.currentTimeMillis() - 2592000000L)});
    }

    public static void clearData() {
        GalleryEntityManager.getInstance().delete(PersistentResponse.class, "", null);
    }

    private static String encodeParameters(Map<String, String> map, String str) {
        StringBuilder sb = new StringBuilder();
        try {
            for (Entry entry : map.entrySet()) {
                if (entry.getKey() != null) {
                    if (entry.getValue() != null) {
                        sb.append(URLEncoder.encode((String) entry.getKey(), str));
                        sb.append('=');
                        sb.append(URLEncoder.encode((String) entry.getValue(), str));
                        sb.append('&');
                    }
                }
            }
            return sb.toString();
        } catch (UnsupportedEncodingException e) {
            StringBuilder sb2 = new StringBuilder();
            sb2.append("Encoding not supported: ");
            sb2.append(str);
            throw new RuntimeException(sb2.toString(), e);
        }
    }

    public static PersistentResponse find(String str, Map<String, String> map) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        String appendUrlParams = appendUrlParams(str, map);
        long currentTimeMillis = System.currentTimeMillis();
        PersistentResponse persistentResponse = (PersistentResponse) GalleryEntityManager.getInstance().find(PersistentResponse.class, "url = ?", new String[]{appendUrlParams});
        if (persistentResponse != null) {
            persistentResponse.setLastVisitTime(currentTimeMillis);
            GalleryEntityManager.getInstance().update(persistentResponse);
        }
        return persistentResponse;
    }

    public static void save(String str, Map<String, String> map, String str2, long j) {
        if (!TextUtils.isEmpty(str) && !TextUtils.isEmpty(str2)) {
            String appendUrlParams = appendUrlParams(str, map);
            long currentTimeMillis = System.currentTimeMillis();
            GalleryEntityManager instance = GalleryEntityManager.getInstance();
            PersistentResponse persistentResponse = new PersistentResponse(appendUrlParams, str2, currentTimeMillis, currentTimeMillis, j);
            instance.insertWithOnConflict(persistentResponse, 5);
        }
    }

    public static void saveAsync(String str, Map<String, String> map, String str2, long j) {
        ThreadPool miscPool = ThreadManager.getMiscPool();
        final String str3 = str;
        final Map<String, String> map2 = map;
        final String str4 = str2;
        final long j2 = j;
        AnonymousClass1 r1 = new Job<Object>() {
            public Object run(JobContext jobContext) {
                PersistentResponseHelper.save(str3, map2, str4, j2);
                return null;
            }
        };
        miscPool.submit(r1);
    }
}
