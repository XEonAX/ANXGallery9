package cn.kuaipan.android.kss.upload;

import android.annotation.SuppressLint;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.os.HandlerThread;
import android.os.Looper;
import android.text.TextUtils;
import android.util.Log;
import cn.kuaipan.android.exception.KscException;
import cn.kuaipan.android.exception.KscRuntimeException;
import cn.kuaipan.android.kss.IDataFactory;
import cn.kuaipan.android.kss.KssDef;
import cn.kuaipan.android.kss.KssMaster;
import cn.kuaipan.android.utils.OAuthTimeUtils;
import cn.kuaipan.android.utils.SQLUtility;
import cn.kuaipan.android.utils.SyncAccessor;

public class UploadTaskStore implements KssDef {
    private static volatile Looper sLooper;
    private final SyncAccessor mAccessor = new SyncAccessor(getCommonLooper()) {
        public Object handleAccess(int i, Object... objArr) {
            switch (i) {
                case 0:
                    UploadTaskStore.this.mDBHelper.update(objArr[0].intValue(), objArr[1], objArr[2]);
                    break;
                case 1:
                    UploadTaskStore.this.mDBHelper.delete(objArr[0].intValue());
                    break;
                case 2:
                    return UploadTaskStore.this.mDBHelper.queryPos(objArr[0].intValue());
                case 3:
                    int intValue = objArr[0].intValue();
                    UploadTaskStore.this.mDBHelper.deleteBefore(OAuthTimeUtils.currentTime() - 85376000);
                    try {
                        return UploadTaskStore.this.mDBHelper.queryKss(intValue, UploadTaskStore.this.mDataFactory);
                    } catch (Throwable th) {
                        Log.w("UploadTaskStore", "Meet exception when parser kss from db", th);
                        break;
                    }
                default:
                    return super.handleAccess(i, objArr);
            }
            return null;
        }
    };
    /* access modifiers changed from: private */
    public final DBHelper mDBHelper;
    /* access modifiers changed from: private */
    public final IDataFactory mDataFactory;

    private static class DBHelper extends SQLiteOpenHelper {
        private static final String[] QUERY_KSS = {"kss_request", "kss_file_info", "kss_upload_id", "gen_time"};
        private static final String[] QUERY_POS = {"chunk_pos", "upload_id"};
        private static final String WHERE_DEL = SQLUtility.getSelectionWithTemplete("%s<?", "gen_time");
        private static final String WHERE_QUERY = SQLUtility.getSelection("task_hash");
        private static volatile DBHelper sInstance;

        private DBHelper(Context context) {
            super(context, "ksssdk_infos.db", null, 4);
        }

        public static DBHelper getInstance(Context context) {
            DBHelper dBHelper = sInstance;
            if (dBHelper == null) {
                synchronized (DBHelper.class) {
                    dBHelper = sInstance;
                    if (dBHelper == null) {
                        if (context != null) {
                            dBHelper = new DBHelper(context);
                            sInstance = dBHelper;
                        } else {
                            throw new NullPointerException("Context should not be null.");
                        }
                    }
                }
            }
            return dBHelper;
        }

        public void delete(int i) {
            getWritableDatabase().delete("upload_chunks", WHERE_QUERY, new String[]{String.valueOf(i)});
        }

        public void deleteBefore(long j) {
            getWritableDatabase().delete("upload_chunks", WHERE_DEL, new String[]{String.valueOf(j)});
        }

        public void onCreate(SQLiteDatabase sQLiteDatabase) {
            StringBuilder sb = new StringBuilder();
            sb.append("_id");
            sb.append(" INTEGER PRIMARY KEY AUTOINCREMENT, ");
            sb.append("task_hash");
            sb.append(" INTEGER NOT NULL UNIQUE, ");
            sb.append("kss_request");
            sb.append(" STRING NOT NULL, ");
            sb.append("kss_file_info");
            sb.append(" STRING NOT NULL, ");
            sb.append("kss_upload_id");
            sb.append(" STRING NOT NULL, ");
            sb.append("chunk_pos");
            sb.append(" LONG NOT NULL DEFAULT 0, ");
            sb.append("upload_id");
            sb.append(" STRING NOT NULL, ");
            sb.append("gen_time");
            sb.append(" LONG NOT NULL DEFAULT 0");
            SQLUtility.createTable(sQLiteDatabase, "upload_chunks", sb.toString());
        }

        public void onUpgrade(SQLiteDatabase sQLiteDatabase, int i, int i2) {
            if (i != 4) {
                Log.w("DBHelper", "Destroying all old data.");
                sQLiteDatabase.execSQL("DROP TABLE IF EXISTS upload_chunks");
                onCreate(sQLiteDatabase);
            }
        }

        /* JADX INFO: finally extract failed */
        public KssUploadInfo queryKss(int i, IDataFactory iDataFactory) throws KscException {
            Cursor query = getReadableDatabase().query("upload_chunks", QUERY_KSS, WHERE_QUERY, new String[]{String.valueOf(i)}, null, null, null);
            KssUploadInfo kssUploadInfo = null;
            if (query != null) {
                try {
                    if (query.moveToFirst()) {
                        String string = query.getString(query.getColumnIndex("kss_request"));
                        String string2 = query.getString(query.getColumnIndex("kss_file_info"));
                        long j = query.getLong(query.getColumnIndex("gen_time"));
                        if (!TextUtils.isEmpty(string)) {
                            if (!TextUtils.isEmpty(string2)) {
                                KssUploadInfo kssUploadInfo2 = new KssUploadInfo(new UploadFileInfo(string2), iDataFactory.createUploadRequestResult(string), j);
                                kssUploadInfo2.setUploadId(query.getString(query.getColumnIndex("kss_upload_id")));
                                kssUploadInfo = kssUploadInfo2;
                            }
                        }
                        if (query != null) {
                            query.close();
                        }
                        return null;
                    }
                } catch (Throwable th) {
                    if (query != null) {
                        query.close();
                    }
                    throw th;
                }
            }
            if (query != null) {
                query.close();
            }
            return kssUploadInfo;
        }

        /* JADX INFO: finally extract failed */
        public UploadChunkInfoPersist queryPos(int i) {
            Cursor query = getReadableDatabase().query("upload_chunks", QUERY_POS, WHERE_QUERY, new String[]{String.valueOf(i)}, null, null, null);
            try {
                UploadChunkInfoPersist uploadChunkInfoPersist = new UploadChunkInfoPersist();
                if (query != null && query.moveToFirst()) {
                    long j = (long) query.getInt(query.getColumnIndex("chunk_pos"));
                    String string = query.getString(query.getColumnIndex("upload_id"));
                    if (!TextUtils.isEmpty(string)) {
                        uploadChunkInfoPersist.pos = j;
                        uploadChunkInfoPersist.upload_id = string;
                    }
                }
                if (query != null) {
                    query.close();
                }
                return uploadChunkInfoPersist;
            } catch (Throwable th) {
                if (query != null) {
                    query.close();
                }
                throw th;
            }
        }

        public void update(int i, KssUploadInfo kssUploadInfo, UploadChunkInfoPersist uploadChunkInfoPersist) {
            if (kssUploadInfo != null) {
                ContentValues contentValues = new ContentValues();
                contentValues.put("task_hash", Integer.valueOf(i));
                contentValues.put("kss_file_info", kssUploadInfo.getFileInfo().toString());
                contentValues.put("kss_request", kssUploadInfo.getRequestResult().toString());
                if (TextUtils.isEmpty(kssUploadInfo.getUploadId())) {
                    contentValues.put("kss_upload_id", "");
                } else {
                    contentValues.put("kss_upload_id", kssUploadInfo.getUploadId());
                }
                contentValues.put("chunk_pos", Long.valueOf(uploadChunkInfoPersist.pos));
                if (TextUtils.isEmpty(uploadChunkInfoPersist.upload_id)) {
                    contentValues.put("upload_id", "");
                } else {
                    contentValues.put("upload_id", uploadChunkInfoPersist.upload_id);
                }
                contentValues.put("gen_time", Long.valueOf(kssUploadInfo.getGenerateTime()));
                getWritableDatabase().replace("upload_chunks", null, contentValues);
            }
        }
    }

    public UploadTaskStore(Context context, IDataFactory iDataFactory) {
        if (context == null || iDataFactory == null) {
            throw new KscRuntimeException(500002, "context and dataFactory can't be null");
        }
        this.mDBHelper = DBHelper.getInstance(context);
        this.mDataFactory = iDataFactory;
    }

    @SuppressLint({"NewApi"})
    private static Looper getCommonLooper() {
        Looper looper;
        Looper looper2 = sLooper;
        Thread thread = looper2 == null ? null : looper2.getThread();
        if (thread == null || !thread.isAlive()) {
            looper2 = null;
        }
        if (looper == null) {
            synchronized (KssMaster.class) {
                looper = sLooper;
                Thread thread2 = looper == null ? null : looper.getThread();
                if (thread2 == null || !thread2.isAlive()) {
                    looper = null;
                }
                if (looper == null) {
                    HandlerThread handlerThread = new HandlerThread("KssMaster - UploadRecorder", 10);
                    handlerThread.start();
                    looper = handlerThread.getLooper();
                }
            }
        }
        return looper;
    }

    public KssUploadInfo getUploadInfo(int i) throws InterruptedException {
        return (KssUploadInfo) this.mAccessor.access(3, Integer.valueOf(i));
    }

    public UploadChunkInfoPersist getUploadPos(int i) throws InterruptedException {
        return (UploadChunkInfoPersist) this.mAccessor.access(2, Integer.valueOf(i));
    }

    public void putUploadInfo(int i, KssUploadInfo kssUploadInfo) throws InterruptedException {
        this.mAccessor.access(0, Integer.valueOf(i), kssUploadInfo, new UploadChunkInfoPersist());
    }

    public void removeUploadInfo(int i) throws InterruptedException {
        this.mAccessor.access(1, Integer.valueOf(i));
    }

    public void updateUploadInfo(int i, KssUploadInfo kssUploadInfo, UploadChunkInfoPersist uploadChunkInfoPersist) {
        this.mDBHelper.update(i, kssUploadInfo, uploadChunkInfoPersist);
    }
}
