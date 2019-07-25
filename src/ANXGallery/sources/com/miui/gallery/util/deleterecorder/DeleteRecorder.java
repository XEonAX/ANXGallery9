package com.miui.gallery.util.deleterecorder;

import android.accounts.Account;
import android.database.Cursor;
import android.text.TextUtils;
import com.miui.gallery.cloud.AccountCache;
import com.miui.gallery.dao.GalleryEntityManager;
import com.miui.gallery.dao.base.Entity;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import java.util.Collection;
import java.util.List;

public class DeleteRecorder {

    public interface RecordCallback {
        void onRecord(int i);
    }

    public static boolean clearAllRecords() {
        try {
            GalleryEntityManager.getInstance().deleteAll(DeleteRecord.class);
            return true;
        } catch (Exception e) {
            Log.e("DeleteRecorder", "clearAllRecords occur error %s.", (Object) e);
            return false;
        }
    }

    public static boolean clearExpiredRecords() {
        return clearExpiredRecords(10000, System.currentTimeMillis() - 2592000000L);
    }

    public static boolean clearExpiredRecords(int i, long j) {
        if (queryRecordCount() <= i) {
            Log.d("DeleteRecorder", "Record count doesn't exceed max");
            return false;
        }
        boolean delete = GalleryEntityManager.getInstance().delete(DeleteRecord.class, "timestamp<=?", new String[]{String.valueOf(j)});
        if (!delete) {
            Log.e("DeleteRecorder", "Failed to delete records before %s", (Object) Long.valueOf(j));
        } else {
            Log.d("DeleteRecorder", "Done delete records before %s", (Object) Long.valueOf(j));
        }
        return delete;
    }

    private static String getHashAccount() {
        Account account = AccountCache.getAccount();
        if (account == null || TextUtils.isEmpty(account.name)) {
            return null;
        }
        return String.valueOf(account.name.hashCode());
    }

    public static void onAddAccount() {
        onAddAccount(getHashAccount());
    }

    static void onAddAccount(String str) {
        if (TextUtils.isEmpty(str)) {
            Log.d("DeleteRecorder", "New account is null, skip clean process");
            return;
        }
        String str2 = null;
        List queryRecords = queryRecords("reason=?", new String[]{String.valueOf(91)});
        if (MiscUtil.isValid(queryRecords)) {
            str2 = ((DeleteRecord) queryRecords.get(0)).getFilePath();
        }
        if (TextUtils.isEmpty(str2)) {
            Log.d("DeleteRecorder", "Old account is null, skip clean process");
        } else if (TextUtils.equals(str2, str)) {
            Log.d("DeleteRecorder", "New account is same as old account, skip clean process");
        } else {
            if (!clearAllRecords()) {
                Log.w("DeleteRecorder", "Fail to clear records after logged in with a different account");
            } else {
                Log.d("DeleteRecorder", "Done clearing records after logged in with a different account");
            }
        }
    }

    public static void onDeleteAccount() {
        onDeleteAccount(getHashAccount());
    }

    static void onDeleteAccount(String str) {
        if (!TextUtils.isEmpty(str)) {
            record(new DeleteRecord(91, str, "DeleteRecorder"));
            Log.d("DeleteRecorder", "On record delete account operation, %s", (Object) str);
        }
    }

    private static int queryRecordCount() {
        int i = 0;
        Cursor cursor = null;
        try {
            Cursor rawQuery = GalleryEntityManager.getInstance().rawQuery(DeleteRecord.class, new String[]{"count(*)"}, null, null, null, null, null, null);
            if (rawQuery != null) {
                try {
                    if (rawQuery.moveToFirst()) {
                        i = rawQuery.getInt(0);
                    }
                } catch (Exception e) {
                    Cursor cursor2 = rawQuery;
                    e = e;
                    cursor = cursor2;
                    try {
                        Log.e("DeleteRecorder", (Throwable) e);
                        MiscUtil.closeSilently(cursor);
                        return 0;
                    } catch (Throwable th) {
                        th = th;
                        MiscUtil.closeSilently(cursor);
                        throw th;
                    }
                } catch (Throwable th2) {
                    th = th2;
                    cursor = rawQuery;
                    MiscUtil.closeSilently(cursor);
                    throw th;
                }
            }
            MiscUtil.closeSilently(rawQuery);
            return i;
        } catch (Exception e2) {
            e = e2;
            Log.e("DeleteRecorder", (Throwable) e);
            MiscUtil.closeSilently(cursor);
            return 0;
        }
    }

    public static List<DeleteRecord> queryRecords(String str, String[] strArr) {
        return GalleryEntityManager.getInstance().query(DeleteRecord.class, str, strArr);
    }

    public static void record(DeleteRecord deleteRecord) {
        record(deleteRecord, (RecordCallback) null);
    }

    public static void record(final DeleteRecord deleteRecord, final RecordCallback recordCallback) {
        ThreadManager.getWorkHandler().post(new Runnable() {
            public void run() {
                boolean z;
                if (deleteRecord == null) {
                    Log.w("DeleteRecorder", "illegal record");
                    z = false;
                } else {
                    Log.d("DeleteRecorder", "Start to insert %s", (Object) deleteRecord);
                    z = GalleryEntityManager.getInstance().insert((Entity) deleteRecord);
                    Log.d("DeleteRecorder", "Done inserting operation, result %s", (Object) Boolean.valueOf(z));
                }
                if (recordCallback != null) {
                    recordCallback.onRecord(z ? 1 : 0);
                }
            }
        });
    }

    public static void record(Collection<DeleteRecord> collection) {
        record(collection, (RecordCallback) null);
    }

    public static void record(final Collection<DeleteRecord> collection, final RecordCallback recordCallback) {
        ThreadManager.getWorkHandler().post(new Runnable() {
            public void run() {
                int i;
                if (!MiscUtil.isValid(collection)) {
                    Log.w("DeleteRecorder", "illegal operationRecords");
                    i = 0;
                } else {
                    Log.d("DeleteRecorder", "Start to insert %s", (Object) TextUtils.join("\n", collection));
                    i = GalleryEntityManager.getInstance().insert(collection);
                    Log.d("DeleteRecorder", "Done inserting %d operations, affected %d rows", Integer.valueOf(collection.size()), Integer.valueOf(i));
                }
                if (recordCallback != null) {
                    recordCallback.onRecord(i);
                }
            }
        });
    }
}
