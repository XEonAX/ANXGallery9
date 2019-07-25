package com.miui.gallery.search.statistics;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.miui.gallery.search.utils.SearchLog;
import com.miui.gallery.util.MediaFileUtils;
import com.miui.gallery.util.StorageUtils;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.Reader;
import java.util.ArrayList;

public class SearchStatStorageHelper {
    public static void clearSavedLogs() {
        File file = new File(getLogFilePath());
        if (file.exists() && file.delete()) {
            SearchLog.i("SearchStatStorageHelper", "Delete statistic log file");
        }
    }

    private static String getLogFilePath() {
        return String.format("%s/%s", new Object[]{StorageUtils.getCacheDirectory(), "search_log.json"});
    }

    public static ArrayList<SearchStatLogItem> getSavedLogs() {
        InputStreamReader inputStreamReader;
        try {
            inputStreamReader = new InputStreamReader(new FileInputStream(getLogFilePath()));
            try {
                ArrayList<SearchStatLogItem> arrayList = (ArrayList) new Gson().fromJson((Reader) inputStreamReader, new TypeToken<ArrayList<SearchStatLogItem>>() {
                }.getType());
                try {
                    inputStreamReader.close();
                } catch (Exception unused) {
                }
                return arrayList;
            } catch (Exception unused2) {
                try {
                    SearchLog.e("SearchStatStorageHelper", "Read saved logs from cache failed!");
                    try {
                        inputStreamReader.close();
                    } catch (Exception unused3) {
                    }
                    return null;
                } catch (Throwable th) {
                    th = th;
                    try {
                        inputStreamReader.close();
                    } catch (Exception unused4) {
                    }
                    throw th;
                }
            }
        } catch (Exception unused5) {
            inputStreamReader = null;
            SearchLog.e("SearchStatStorageHelper", "Read saved logs from cache failed!");
            inputStreamReader.close();
            return null;
        } catch (Throwable th2) {
            Throwable th3 = th2;
            inputStreamReader = null;
            th = th3;
            inputStreamReader.close();
            throw th;
        }
    }

    public static int saveLogItem(SearchStatLogItem searchStatLogItem) {
        File file = new File(getLogFilePath());
        try {
            if (file.exists() && file.length() > 1048576) {
                MediaFileUtils.deleteFile(file);
                SearchLog.i("SearchStatStorageHelper", "Clear former log file due to too many logs");
            }
        } catch (Exception e) {
            SearchLog.e("SearchStatStorageHelper", (Throwable) e);
        }
        OutputStreamWriter outputStreamWriter = null;
        try {
            ArrayList savedLogs = getSavedLogs();
            if (savedLogs == null) {
                savedLogs = new ArrayList(1);
            }
            savedLogs.add(searchStatLogItem);
            String json = new Gson().toJson((Object) savedLogs);
            OutputStreamWriter outputStreamWriter2 = new OutputStreamWriter(new FileOutputStream(file));
            try {
                outputStreamWriter2.write(json);
                SearchLog.i("SearchStatStorageHelper", "Insert item [%s] succeed, now total %d items", searchStatLogItem, Integer.valueOf(savedLogs.size()));
                int size = savedLogs.size();
                try {
                    outputStreamWriter2.close();
                } catch (Exception unused) {
                }
                return size;
            } catch (Exception unused2) {
                outputStreamWriter = outputStreamWriter2;
                try {
                    SearchLog.i("SearchStatStorageHelper", "Insert item [%s] failed");
                    try {
                        outputStreamWriter.close();
                    } catch (Exception unused3) {
                    }
                    return 0;
                } catch (Throwable th) {
                    th = th;
                    try {
                        outputStreamWriter.close();
                    } catch (Exception unused4) {
                    }
                    throw th;
                }
            } catch (Throwable th2) {
                th = th2;
                outputStreamWriter = outputStreamWriter2;
                outputStreamWriter.close();
                throw th;
            }
        } catch (Exception unused5) {
            SearchLog.i("SearchStatStorageHelper", "Insert item [%s] failed");
            outputStreamWriter.close();
            return 0;
        }
    }
}
