package com.miui.gallery.adapter;

import android.database.Cursor;
import com.miui.gallery.widget.recyclerview.BaseViewHolder;
import java.util.Locale;

public abstract class CursorRecyclerAdapter<VH extends BaseViewHolder> extends BaseRecyclerAdapter<Cursor, VH> {
    protected Cursor mCursor;
    protected boolean mDataValid;
    private int mRowIDColumn;

    public Cursor getCursor() {
        return this.mCursor;
    }

    public Cursor getItem(int i) {
        if (!this.mDataValid || this.mCursor == null) {
            return null;
        }
        this.mCursor.moveToPosition(i);
        return this.mCursor;
    }

    public int getItemCount() {
        if (!this.mDataValid || this.mCursor == null) {
            return 0;
        }
        return this.mCursor.getCount();
    }

    public long getItemId(int i) {
        if (!this.mDataValid || this.mCursor == null || !this.mCursor.moveToPosition(i)) {
            return -1;
        }
        return this.mCursor.getLong(this.mRowIDColumn);
    }

    /* access modifiers changed from: protected */
    public boolean isValidPosition(int i) {
        return i >= 0 && i < getItemCount();
    }

    /* access modifiers changed from: protected */
    public Cursor moveCursorToPosition(int i) {
        if (isValidPosition(i)) {
            return getItem(i);
        }
        throw new IllegalArgumentException(String.format(Locale.US, "Wrong cursor position %d, total count %d", new Object[]{Integer.valueOf(i), Integer.valueOf(getItemCount())}));
    }

    public Cursor swapCursor(Cursor cursor) {
        if (cursor == this.mCursor) {
            return null;
        }
        Cursor cursor2 = this.mCursor;
        this.mCursor = cursor;
        if (cursor != null) {
            this.mDataValid = true;
            this.mRowIDColumn = cursor.getColumnIndexOrThrow("_id");
            notifyDataSetChanged();
        } else {
            this.mDataValid = false;
            this.mRowIDColumn = -1;
            notifyDataSetChanged();
        }
        return cursor2;
    }
}
