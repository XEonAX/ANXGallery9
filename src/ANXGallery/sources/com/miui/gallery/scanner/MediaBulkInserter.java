package com.miui.gallery.scanner;

import android.content.ContentValues;
import android.content.Context;
import android.net.Uri;
import java.util.ArrayList;

public class MediaBulkInserter {
    protected int mBulkCount = 20;
    private Uri mUri;
    protected ArrayList<ContentValues> mValues;

    public MediaBulkInserter(Uri uri) {
        this.mUri = uri;
        this.mValues = new ArrayList<>(this.mBulkCount);
    }

    public void flush(Context context) {
        int size = this.mValues.size();
        if (size > 0) {
            context.getContentResolver().bulkInsert(this.mUri, (ContentValues[]) this.mValues.toArray(new ContentValues[size]));
            this.mValues.clear();
        }
    }

    public void insert(Context context, ContentValues contentValues) {
        if (contentValues != null) {
            this.mValues.add(contentValues);
            if (this.mValues.size() >= this.mBulkCount) {
                flush(context);
            }
        }
    }
}
