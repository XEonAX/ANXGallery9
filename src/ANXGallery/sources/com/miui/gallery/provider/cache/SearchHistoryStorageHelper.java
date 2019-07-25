package com.miui.gallery.provider.cache;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.miui.gallery.search.utils.SearchLog;
import com.miui.gallery.util.StorageUtils;
import com.miui.gallery.util.StringUtils;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.Reader;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class SearchHistoryStorageHelper {
    public static int addHistoryItem(SearchHistoryItem searchHistoryItem, List<SearchHistoryItem> list) {
        List savedHistories = getSavedHistories();
        if (savedHistories == null || savedHistories.isEmpty()) {
            savedHistories = new ArrayList(1);
        } else {
            removeDupHistoryItem(savedHistories, searchHistoryItem);
        }
        savedHistories.add(0, searchHistoryItem);
        list.addAll(savedHistories);
        return saveHistories(savedHistories);
    }

    public static int clearSavedHistories() {
        File file = new File(getHistoryFilePath());
        if (!file.exists() || !file.delete()) {
            return 0;
        }
        SearchLog.i("SearchHistoryStorageHelper", "Delete history log file");
        return 1;
    }

    private static String getHistoryFilePath() {
        return String.format("%s/%s", new Object[]{StorageUtils.getCacheDirectory(), "search_histories.json"});
    }

    public static List<SearchHistoryItem> getSavedHistories() {
        InputStreamReader inputStreamReader;
        try {
            inputStreamReader = new InputStreamReader(new FileInputStream(getHistoryFilePath()));
            try {
                ArrayList arrayList = (ArrayList) new Gson().fromJson((Reader) inputStreamReader, new TypeToken<ArrayList<SearchHistoryItem>>() {
                }.getType());
                try {
                    inputStreamReader.close();
                } catch (Exception unused) {
                }
                return arrayList;
            } catch (Exception unused2) {
                try {
                    SearchLog.e("SearchHistoryStorageHelper", "Read saved logs from cache failed!");
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
            SearchLog.e("SearchHistoryStorageHelper", "Read saved logs from cache failed!");
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

    public static int removeDupHistoryItem(List<SearchHistoryItem> list, SearchHistoryItem searchHistoryItem) {
        SearchHistoryItem searchHistoryItem2;
        Iterator it = list.iterator();
        while (true) {
            if (!it.hasNext()) {
                searchHistoryItem2 = null;
                break;
            }
            searchHistoryItem2 = (SearchHistoryItem) it.next();
            if (StringUtils.nullToEmpty(searchHistoryItem2.intentActionURI).equals(StringUtils.nullToEmpty(searchHistoryItem.intentActionURI))) {
                break;
            }
        }
        if (searchHistoryItem2 != null) {
            return list.remove(searchHistoryItem2) ? 1 : 0;
        }
        return 0;
    }

    private static int saveHistories(List<SearchHistoryItem> list) {
        if (list == null || list.isEmpty()) {
            return 0;
        }
        OutputStreamWriter outputStreamWriter = null;
        try {
            String json = new Gson().toJson((Object) list);
            OutputStreamWriter outputStreamWriter2 = new OutputStreamWriter(new FileOutputStream(getHistoryFilePath()));
            try {
                outputStreamWriter2.write(json);
                SearchLog.i("SearchHistoryStorageHelper", "Save histories [%s] succeed", list);
                try {
                    outputStreamWriter2.close();
                } catch (Exception unused) {
                }
                return 1;
            } catch (Exception unused2) {
                outputStreamWriter = outputStreamWriter2;
                try {
                    SearchLog.i("SearchHistoryStorageHelper", "Save histories [%s] failed", list);
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
            SearchLog.i("SearchHistoryStorageHelper", "Save histories [%s] failed", list);
            outputStreamWriter.close();
            return 0;
        }
    }
}
