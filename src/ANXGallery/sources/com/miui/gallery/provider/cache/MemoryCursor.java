package com.miui.gallery.provider.cache;

import android.database.AbstractWindowedCursor;
import android.database.CursorWindow;
import com.miui.gallery.util.Log;
import java.util.HashMap;
import java.util.Map;

class MemoryCursor extends AbstractWindowedCursor {
    private Map<String, Integer> mColumnMap;
    private String[] mColumns = this.mQuery.getColumnNames();
    private int mCount = this.mQuery.getCount();
    private String mName;
    private ResultSet mQuery;

    public MemoryCursor(ResultSet resultSet, String str) {
        this.mQuery = resultSet;
        this.mName = str;
    }

    private void doClearOrCreateWindow(String str) {
        if (this.mWindow == null) {
            this.mWindow = new CursorWindow(str);
        } else {
            this.mWindow.clear();
        }
    }

    private void fillWindow(int i) {
        doClearOrCreateWindow(this.mName);
        try {
            this.mWindow.acquireReference();
            this.mWindow.setNumColumns(this.mQuery.getColumnNames().length);
            this.mWindow.setStartPosition(i);
            this.mQuery.fillWindow(this.mWindow);
            if (this.mCount == -1) {
                this.mCount = this.mQuery.getCount();
            }
        } finally {
            this.mWindow.releaseReference();
        }
    }

    public void close() {
        super.close();
        synchronized (this) {
            this.mQuery.close();
        }
    }

    /* access modifiers changed from: protected */
    public void finalize() {
        try {
            if (this.mWindow != null) {
                close();
                StringBuilder sb = new StringBuilder();
                sb.append("Finalizing cursor ");
                sb.append(this.mName);
                sb.append(", which has not been deactived or closed");
                Log.w(".provider.cache.MemoryCursor", sb.toString());
            }
        } finally {
            super.finalize();
        }
    }

    public int getColumnIndex(String str) {
        if (this.mColumnMap == null) {
            String[] strArr = this.mColumns;
            int length = strArr.length;
            HashMap hashMap = new HashMap(length, 1.0f);
            for (int i = 0; i < length; i++) {
                hashMap.put(strArr[i], Integer.valueOf(i));
            }
            this.mColumnMap = hashMap;
        }
        Integer num = (Integer) this.mColumnMap.get(str);
        if (num != null) {
            return num.intValue();
        }
        return -1;
    }

    public String[] getColumnNames() {
        return this.mColumns;
    }

    public int getCount() {
        if (this.mCount == -1) {
            fillWindow(0);
        }
        return this.mCount;
    }

    public boolean onMove(int i, int i2) {
        if (this.mWindow == null || i2 < this.mWindow.getStartPosition() || i2 >= this.mWindow.getStartPosition() + this.mWindow.getNumRows()) {
            fillWindow(i2);
        }
        return true;
    }

    public boolean requery() {
        if (isClosed()) {
            return false;
        }
        synchronized (this) {
            if (this.mWindow != null) {
                this.mWindow.clear();
            }
            this.mPos = -1;
            this.mCount = -1;
        }
        try {
            return super.requery();
        } catch (IllegalStateException e) {
            StringBuilder sb = new StringBuilder();
            sb.append("requery() failed ");
            sb.append(e.getMessage());
            Log.w(".provider.cache.MemoryCursor", sb.toString(), e);
            return false;
        }
    }

    public void setWindow(CursorWindow cursorWindow) {
        super.setWindow(cursorWindow);
        this.mCount = -1;
    }
}
