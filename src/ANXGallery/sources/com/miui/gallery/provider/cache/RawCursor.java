package com.miui.gallery.provider.cache;

import android.database.AbstractCursor;
import com.miui.gallery.provider.cache.CacheItem.ColumnMapper;
import java.util.List;

public class RawCursor extends AbstractCursor {
    private String[] mColumns;
    private List<? extends CacheItem> mContents;
    private int[] mIndexes;

    public RawCursor(List<? extends CacheItem> list, String[] strArr, ColumnMapper columnMapper) {
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

    public byte[] getBlob(int i) {
        checkPosition();
        Object obj = ((CacheItem) this.mContents.get(this.mPos)).get(this.mIndexes[i], false);
        if (obj == null) {
            return null;
        }
        if (obj instanceof byte[]) {
            return (byte[]) obj;
        }
        throw new IllegalArgumentException("not a blob");
    }

    public String getColumnName(int i) {
        return this.mColumns[i];
    }

    public String[] getColumnNames() {
        return (String[]) this.mColumns.clone();
    }

    public int getCount() {
        return this.mContents.size();
    }

    public double getDouble(int i) {
        checkPosition();
        Object obj = ((CacheItem) this.mContents.get(this.mPos)).get(this.mIndexes[i], false);
        if (obj == null) {
            return 0.0d;
        }
        return obj instanceof Number ? ((Number) obj).doubleValue() : Double.parseDouble(obj.toString());
    }

    public float getFloat(int i) {
        checkPosition();
        Object obj = ((CacheItem) this.mContents.get(this.mPos)).get(this.mIndexes[i], false);
        if (obj == null) {
            return 0.0f;
        }
        return obj instanceof Number ? ((Number) obj).floatValue() : Float.parseFloat(obj.toString());
    }

    public int getInt(int i) {
        checkPosition();
        Object obj = ((CacheItem) this.mContents.get(this.mPos)).get(this.mIndexes[i], false);
        if (obj == null) {
            return 0;
        }
        return obj instanceof Number ? ((Number) obj).intValue() : Integer.parseInt(obj.toString());
    }

    public long getLong(int i) {
        checkPosition();
        Object obj = ((CacheItem) this.mContents.get(this.mPos)).get(this.mIndexes[i], false);
        if (obj == null) {
            return 0;
        }
        return obj instanceof Number ? ((Number) obj).longValue() : Long.parseLong(obj.toString());
    }

    public short getShort(int i) {
        checkPosition();
        Object obj = ((CacheItem) this.mContents.get(this.mPos)).get(this.mIndexes[i], false);
        if (obj == null) {
            return 0;
        }
        return obj instanceof Number ? ((Number) obj).shortValue() : Short.parseShort(obj.toString());
    }

    public String getString(int i) {
        checkPosition();
        Object obj = ((CacheItem) this.mContents.get(this.mPos)).get(this.mIndexes[i], false);
        if (obj == null) {
            return null;
        }
        return obj.toString();
    }

    public int getType(int i) {
        checkPosition();
        return ((CacheItem) this.mContents.get(this.mPos)).getType(this.mIndexes[i]);
    }

    public boolean isNull(int i) {
        checkPosition();
        return ((CacheItem) this.mContents.get(this.mPos)).get(this.mIndexes[i], false) == null;
    }
}
