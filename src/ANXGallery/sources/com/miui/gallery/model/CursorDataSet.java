package com.miui.gallery.model;

import android.database.Cursor;
import com.miui.gallery.util.BurstFilterCursor;
import com.miui.gallery.util.BurstKeyFilterCursor;
import com.miui.gallery.util.MiscUtil;

public abstract class CursorDataSet extends BaseDataSet {
    protected Cursor mCursor;

    public CursorDataSet(Cursor cursor) {
        if (foldBurst()) {
            this.mCursor = getBurstCursor(cursor);
        } else {
            this.mCursor = cursor;
        }
    }

    public CursorDataSet(Cursor cursor, int i) {
        super(i);
        if (!foldBurst() || cursor == null) {
            this.mCursor = cursor;
        } else {
            this.mCursor = getBurstCursor(cursor);
        }
    }

    private Cursor getBurstCursor(Cursor cursor) {
        if (cursor == null) {
            return null;
        }
        return cursor.getColumnIndex("burst_group_id") > 0 ? new BurstFilterCursor(cursor) : new BurstKeyFilterCursor(cursor) {
            /* access modifiers changed from: protected */
            public int getBurstKeyIndex() {
                return CursorDataSet.this.burstKeyIndex();
            }
        };
    }

    /* access modifiers changed from: protected */
    public int burstKeyIndex() {
        return 0;
    }

    /* access modifiers changed from: protected */
    public BaseDataItem createItem(int i) {
        if (!isValidate(i)) {
            return null;
        }
        CloudItem cloudItem = new CloudItem();
        bindItem(cloudItem, i);
        return cloudItem;
    }

    public int getCount() {
        if (isValidate()) {
            return this.mCursor.getCount();
        }
        return 0;
    }

    /* access modifiers changed from: protected */
    public boolean isValidate() {
        return this.mCursor != null && !this.mCursor.isClosed();
    }

    /* access modifiers changed from: protected */
    public boolean isValidate(int i) {
        return isValidate() && i >= 0 && i < this.mCursor.getCount();
    }

    /* access modifiers changed from: protected */
    public boolean moveToPosition(int i) {
        return isValidate(i) && this.mCursor.moveToPosition(i);
    }

    public void onRelease() {
        MiscUtil.closeSilently(this.mCursor);
    }
}
