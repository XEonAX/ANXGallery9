package com.miui.gallery.scanner;

import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.text.TextUtils;
import com.miui.gallery.provider.GalleryContract.Cloud;
import com.miui.gallery.provider.RecentDiscoveryMediaManager;
import com.miui.gallery.provider.RecentDiscoveryMediaManager.RecentMediaEntry;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import java.util.ArrayList;

public class CloudMediaBulkInserter extends MediaBulkInserter {
    private static final String[] PROJECTION = {"_id", "localGroupId", "localFile", "dateModified"};
    private ArrayList<String> mWhereArgs = new ArrayList<>(this.mBulkCount);
    private StringBuilder mWhereClause = new StringBuilder();

    public CloudMediaBulkInserter(boolean z) {
        super(Cloud.CLOUD_URI.buildUpon().appendQueryParameter("URI_PARAM_REQUEST_SYNC", String.valueOf(z)).build());
    }

    public void flush(Context context) {
        super.flush(context);
        int size = this.mWhereArgs.size();
        if (size > 0) {
            String[] strArr = (String[]) this.mWhereArgs.toArray(new String[size]);
            Cursor cursor = null;
            try {
                ContentResolver contentResolver = context.getContentResolver();
                Uri uri = Cloud.CLOUD_URI;
                String[] strArr2 = PROJECTION;
                StringBuilder sb = new StringBuilder();
                sb.append("localFile IN (");
                sb.append(this.mWhereClause.toString());
                sb.append(")");
                Cursor query = contentResolver.query(uri, strArr2, sb.toString(), strArr, "dateModified DESC ");
                if (query != null) {
                    try {
                        if (query.getCount() > 0) {
                            RecentMediaEntry[] recentMediaEntryArr = new RecentMediaEntry[query.getCount()];
                            query.moveToFirst();
                            int i = 0;
                            while (!query.isAfterLast()) {
                                RecentMediaEntry recentMediaEntry = new RecentMediaEntry(query.getLong(1), query.getLong(0), query.getString(2), query.getLong(3));
                                recentMediaEntryArr[i] = recentMediaEntry;
                                query.moveToNext();
                                i++;
                            }
                            RecentDiscoveryMediaManager.insertToRecent(context, recentMediaEntryArr);
                        }
                    } catch (Exception e) {
                        e = e;
                        cursor = query;
                        try {
                            Log.e("CloudMediaBulkInserter", (Throwable) e);
                            MiscUtil.closeSilently(cursor);
                            this.mWhereClause.setLength(0);
                            this.mWhereArgs.clear();
                        } catch (Throwable th) {
                            th = th;
                            MiscUtil.closeSilently(cursor);
                            throw th;
                        }
                    } catch (Throwable th2) {
                        th = th2;
                        cursor = query;
                        MiscUtil.closeSilently(cursor);
                        throw th;
                    }
                }
                MiscUtil.closeSilently(query);
            } catch (Exception e2) {
                e = e2;
                Log.e("CloudMediaBulkInserter", (Throwable) e);
                MiscUtil.closeSilently(cursor);
                this.mWhereClause.setLength(0);
                this.mWhereArgs.clear();
            }
            this.mWhereClause.setLength(0);
            this.mWhereArgs.clear();
        }
    }

    public void insert(Context context, ContentValues contentValues) {
        if (contentValues != null) {
            String asString = contentValues.getAsString("localFile");
            if (!TextUtils.isEmpty(asString)) {
                if (this.mWhereClause.length() != 0) {
                    this.mWhereClause.append(",");
                }
                this.mWhereClause.append("?");
                this.mWhereArgs.add(asString);
            }
        }
        super.insert(context, contentValues);
    }
}
