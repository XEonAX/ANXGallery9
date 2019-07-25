package com.miui.gallery.provider.cache;

import android.database.CursorWindow;
import com.miui.gallery.provider.cache.CacheItem.ColumnMapper;
import com.miui.gallery.util.Log;
import java.util.List;

class DataResult implements ResultSet {
    private String[] mColumns;
    private List<? extends CacheItem> mContents;
    private int[] mIndexes;

    public DataResult(String[] strArr, List<? extends CacheItem> list, ColumnMapper columnMapper) {
        this.mContents = list;
        this.mColumns = strArr;
        this.mIndexes = buildIndex(this.mColumns, columnMapper);
    }

    private static int[] buildIndex(String[] strArr, ColumnMapper columnMapper) {
        int[] iArr = new int[strArr.length];
        for (int i = 0; i < strArr.length; i++) {
            iArr[i] = columnMapper.getIndex(strArr[i]);
        }
        return iArr;
    }

    public void close() {
        this.mContents = null;
        this.mColumns = null;
        this.mIndexes = null;
    }

    public int fillWindow(CursorWindow cursorWindow) {
        int startPosition = cursorWindow.getStartPosition();
        int i = 0;
        while (true) {
            if (startPosition >= this.mContents.size()) {
                break;
            } else if (!cursorWindow.allocRow()) {
                Log.w(".provider.cache.DataResult", "window can not allocate a new row, break.");
                break;
            } else {
                for (int i2 = 0; i2 < this.mColumns.length; i2++) {
                    if (!((CacheItem) this.mContents.get(startPosition)).fillWindow(cursorWindow, startPosition, i2, this.mIndexes[i2])) {
                        Log.e(".provider.cache.DataResult", "fill window[%s] failed: %s, %s", cursorWindow, this.mContents.get(startPosition), this.mColumns[i2]);
                    }
                }
                i++;
                startPosition++;
            }
        }
        Log.w(".provider.cache.DataResult", "window[%s] filled: %s", cursorWindow, Integer.valueOf(i));
        return i;
    }

    public String[] getColumnNames() {
        return this.mColumns;
    }

    public int getCount() {
        return this.mContents.size();
    }
}
