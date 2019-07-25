package com.xiaomi.mipush.sdk.stat.db.base;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.text.TextUtils;
import com.xiaomi.channel.commonutils.file.FileLockerWorker;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.channel.commonutils.misc.ScheduledJobManager;
import com.xiaomi.channel.commonutils.misc.ScheduledJobManager.Job;
import com.xiaomi.channel.commonutils.string.MD5;
import com.xiaomi.push.service.OnlineConfig;
import com.xiaomi.xmpush.thrift.ConfigKey;
import java.io.File;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

public class DbManager {
    private static volatile DbManager sDbManager;
    private BaseDbHelperFactory mBaseDbHelperFactory;
    private Context mContext;
    private final HashMap<String, BaseDbHelper> mDbHelperMap = new HashMap<>();
    /* access modifiers changed from: private */
    public final ArrayList<BaseJob> mPendingList;
    private ThreadPoolExecutor mPool;

    public static abstract class BaseJob implements Runnable {
        private String mDataPath;
        protected BaseDbHelper mDbHelper = null;
        private BaseJob mNextJob;
        private Random mRandom = new Random();
        private int mRetryCount = 0;
        protected String mTableName;
        private WeakReference<Context> mWRContext;

        public BaseJob(String str) {
            this.mDataPath = str;
        }

        public void append(BaseJob baseJob) {
            this.mNextJob = baseJob;
        }

        /* access modifiers changed from: 0000 */
        public void attachInfo(BaseDbHelper baseDbHelper, Context context) {
            this.mDbHelper = baseDbHelper;
            this.mTableName = this.mDbHelper.getTableName();
            this.mWRContext = new WeakReference<>(context);
        }

        public abstract void doRun(Context context, SQLiteDatabase sQLiteDatabase) throws Exception;

        /* access modifiers changed from: 0000 */
        public void finish(Context context) {
            if (this.mNextJob != null) {
                this.mNextJob.input(context, output());
            }
            onFinish(context);
        }

        public String getDataPath() {
            return this.mDataPath;
        }

        public SQLiteDatabase getDatabase() {
            return this.mDbHelper.getWritableDatabase();
        }

        public void input(Context context, Object obj) {
            DbManager.getInstance(context).exec(this);
        }

        public boolean needAttachInfo() {
            return this.mDbHelper == null || TextUtils.isEmpty(this.mTableName) || this.mWRContext == null;
        }

        public void onFinish(Context context) {
        }

        public Object output() {
            return null;
        }

        public final void run() {
            if (this.mWRContext != null) {
                final Context context = (Context) this.mWRContext.get();
                if (context != null && context.getFilesDir() != null && this.mDbHelper != null && !TextUtils.isEmpty(this.mDataPath)) {
                    File file = new File(this.mDataPath);
                    FileLockerWorker.runMutiProcessJob(context, new File(file.getParentFile(), MD5.MD5_16(file.getAbsolutePath())), new Runnable() {
                        /* JADX WARNING: Removed duplicated region for block: B:24:0x0043 A[SYNTHETIC, Splitter:B:24:0x0043] */
                        /* JADX WARNING: Removed duplicated region for block: B:30:0x004f A[Catch:{ Exception -> 0x0047 }] */
                        /* JADX WARNING: Removed duplicated region for block: B:36:0x0065 A[SYNTHETIC, Splitter:B:36:0x0065] */
                        /* JADX WARNING: Removed duplicated region for block: B:42:0x0071 A[Catch:{ Exception -> 0x0069 }] */
                        public void run() {
                            SQLiteDatabase sQLiteDatabase;
                            Throwable e;
                            try {
                                sQLiteDatabase = BaseJob.this.getDatabase();
                                if (sQLiteDatabase != null) {
                                    try {
                                        if (sQLiteDatabase.isOpen()) {
                                            sQLiteDatabase.beginTransaction();
                                            BaseJob.this.doRun(context, sQLiteDatabase);
                                            sQLiteDatabase.setTransactionSuccessful();
                                        }
                                    } catch (Exception e2) {
                                        e = e2;
                                        try {
                                            MyLog.e(e);
                                            if (sQLiteDatabase != null) {
                                                try {
                                                    sQLiteDatabase.endTransaction();
                                                } catch (Exception e3) {
                                                    e = e3;
                                                    MyLog.e((Throwable) e);
                                                    BaseJob.this.finish(context);
                                                }
                                            }
                                            if (BaseJob.this.mDbHelper != null) {
                                                BaseJob.this.mDbHelper.close();
                                            }
                                            BaseJob.this.finish(context);
                                        } catch (Throwable th) {
                                            th = th;
                                            if (sQLiteDatabase != null) {
                                                try {
                                                    sQLiteDatabase.endTransaction();
                                                } catch (Exception e4) {
                                                    MyLog.e((Throwable) e4);
                                                    BaseJob.this.finish(context);
                                                    throw th;
                                                }
                                            }
                                            if (BaseJob.this.mDbHelper != null) {
                                                BaseJob.this.mDbHelper.close();
                                            }
                                            BaseJob.this.finish(context);
                                            throw th;
                                        }
                                    }
                                }
                                if (sQLiteDatabase != null) {
                                    try {
                                        sQLiteDatabase.endTransaction();
                                    } catch (Exception e5) {
                                        e = e5;
                                        MyLog.e((Throwable) e);
                                        BaseJob.this.finish(context);
                                    }
                                }
                                if (BaseJob.this.mDbHelper != null) {
                                    BaseJob.this.mDbHelper.close();
                                }
                            } catch (Exception e6) {
                                Throwable th2 = e6;
                                sQLiteDatabase = null;
                                e = th2;
                                MyLog.e(e);
                                if (sQLiteDatabase != null) {
                                }
                                if (BaseJob.this.mDbHelper != null) {
                                }
                                BaseJob.this.finish(context);
                            } catch (Throwable th3) {
                                Throwable th4 = th3;
                                sQLiteDatabase = null;
                                th = th4;
                                if (sQLiteDatabase != null) {
                                }
                                if (BaseJob.this.mDbHelper != null) {
                                }
                                BaseJob.this.finish(context);
                                throw th;
                            }
                            BaseJob.this.finish(context);
                        }
                    });
                }
            }
        }
    }

    public static abstract class BaseQueryJob<T> extends BaseJob {
        private List<String> mBackRows;
        private String mGroupBy;
        private String mHaving;
        private int mLimit;
        private String mOrderBy;
        private List<T> mResults = new ArrayList();
        private String mWhereClause;
        private String[] mWhereValues;

        public BaseQueryJob(String str, List<String> list, String str2, String[] strArr, String str3, String str4, String str5, int i) {
            super(str);
            this.mBackRows = list;
            this.mWhereClause = str2;
            this.mWhereValues = strArr;
            this.mGroupBy = str3;
            this.mHaving = str4;
            this.mOrderBy = str5;
            this.mLimit = i;
        }

        public void doRun(Context context, SQLiteDatabase sQLiteDatabase) throws Exception {
            String[] strArr;
            this.mResults.clear();
            String str = null;
            if (this.mBackRows == null || this.mBackRows.size() <= 0) {
                strArr = null;
            } else {
                String[] strArr2 = new String[this.mBackRows.size()];
                this.mBackRows.toArray(strArr2);
                strArr = strArr2;
            }
            if (this.mLimit > 0) {
                str = String.valueOf(this.mLimit);
            }
            Cursor query = sQLiteDatabase.query(this.mTableName, strArr, this.mWhereClause, this.mWhereValues, this.mGroupBy, this.mHaving, this.mOrderBy, str);
            if (query != null && query.moveToFirst()) {
                do {
                    Object processOneData = processOneData(context, query);
                    if (processOneData != null) {
                        this.mResults.add(processOneData);
                    }
                } while (query.moveToNext());
                query.close();
            }
            notifyResult(context, this.mResults);
        }

        public SQLiteDatabase getDatabase() {
            return this.mDbHelper.getReadableDatabase();
        }

        public abstract void notifyResult(Context context, List<T> list);

        public abstract T processOneData(Context context, Cursor cursor);
    }

    public static class BatchJob extends BaseJob {
        private ArrayList<BaseJob> mJobs = new ArrayList<>();

        public BatchJob(String str, ArrayList<BaseJob> arrayList) {
            super(str);
            this.mJobs.addAll(arrayList);
        }

        public void doRun(Context context, SQLiteDatabase sQLiteDatabase) throws Exception {
            Iterator it = this.mJobs.iterator();
            while (it.hasNext()) {
                BaseJob baseJob = (BaseJob) it.next();
                if (baseJob != null) {
                    baseJob.doRun(context, sQLiteDatabase);
                }
            }
        }

        public final void finish(Context context) {
            super.finish(context);
            Iterator it = this.mJobs.iterator();
            while (it.hasNext()) {
                BaseJob baseJob = (BaseJob) it.next();
                if (baseJob != null) {
                    baseJob.finish(context);
                }
            }
        }
    }

    public static class DeleteJob extends BaseJob {
        private String mWhereClause;
        protected String[] mWhereValues;

        public DeleteJob(String str, String str2, String[] strArr) {
            super(str);
            this.mWhereClause = str2;
            this.mWhereValues = strArr;
        }

        public void doRun(Context context, SQLiteDatabase sQLiteDatabase) throws Exception {
            sQLiteDatabase.delete(this.mTableName, this.mWhereClause, this.mWhereValues);
        }
    }

    public static class InsertJob extends BaseJob {
        private ContentValues mContentValues;

        public InsertJob(String str, ContentValues contentValues) {
            super(str);
            this.mContentValues = contentValues;
        }

        public void doRun(Context context, SQLiteDatabase sQLiteDatabase) throws Exception {
            sQLiteDatabase.insert(this.mTableName, null, this.mContentValues);
        }
    }

    private DbManager(Context context) {
        ThreadPoolExecutor threadPoolExecutor = new ThreadPoolExecutor(1, 1, 15, TimeUnit.SECONDS, new LinkedBlockingQueue());
        this.mPool = threadPoolExecutor;
        this.mPendingList = new ArrayList<>();
        this.mContext = context;
    }

    private BaseDbHelper getDbHelper(String str) {
        BaseDbHelper baseDbHelper = (BaseDbHelper) this.mDbHelperMap.get(str);
        if (baseDbHelper == null) {
            synchronized (this.mDbHelperMap) {
                if (baseDbHelper == null) {
                    try {
                        baseDbHelper = this.mBaseDbHelperFactory.getDbHelper(this.mContext, str);
                        this.mDbHelperMap.put(str, baseDbHelper);
                    } catch (Throwable th) {
                        throw th;
                    }
                }
            }
        }
        return baseDbHelper;
    }

    public static DbManager getInstance(Context context) {
        if (sDbManager == null) {
            synchronized (DbManager.class) {
                if (sDbManager == null) {
                    sDbManager = new DbManager(context);
                }
            }
        }
        return sDbManager;
    }

    private void sendExecCmd() {
        ScheduledJobManager.getInstance(this.mContext).addOneShootJob((Job) new Job() {
            public int getJobId() {
                return 100957;
            }

            public void run() {
                synchronized (DbManager.this.mPendingList) {
                    if (DbManager.this.mPendingList.size() > 0) {
                        if (DbManager.this.mPendingList.size() > 1) {
                            DbManager.this.exec(DbManager.this.mPendingList);
                        } else {
                            DbManager.this.execNow((BaseJob) DbManager.this.mPendingList.get(0));
                        }
                        DbManager.this.mPendingList.clear();
                        System.gc();
                    }
                }
            }
        }, OnlineConfig.getInstance(this.mContext).getIntValue(ConfigKey.StatDataProcessFrequency.getValue(), 5));
    }

    public void exec(BaseJob baseJob) {
        BaseDbHelper baseDbHelper;
        if (baseJob != null) {
            if (this.mBaseDbHelperFactory != null) {
                String dataPath = baseJob.getDataPath();
                synchronized (this.mDbHelperMap) {
                    baseDbHelper = (BaseDbHelper) this.mDbHelperMap.get(dataPath);
                    if (baseDbHelper == null) {
                        baseDbHelper = this.mBaseDbHelperFactory.getDbHelper(this.mContext, dataPath);
                        this.mDbHelperMap.put(dataPath, baseDbHelper);
                    }
                }
                if (!this.mPool.isShutdown()) {
                    baseJob.attachInfo(baseDbHelper, this.mContext);
                    synchronized (this.mPendingList) {
                        this.mPendingList.add(baseJob);
                        sendExecCmd();
                    }
                }
                return;
            }
            throw new IllegalStateException("should exec init method first!");
        }
    }

    public void exec(ArrayList<BaseJob> arrayList) {
        if (this.mBaseDbHelperFactory != null) {
            HashMap hashMap = new HashMap();
            if (!this.mPool.isShutdown()) {
                Iterator it = arrayList.iterator();
                while (it.hasNext()) {
                    BaseJob baseJob = (BaseJob) it.next();
                    if (baseJob.needAttachInfo()) {
                        baseJob.attachInfo(getDbHelper(baseJob.getDataPath()), this.mContext);
                    }
                    ArrayList arrayList2 = (ArrayList) hashMap.get(baseJob.getDataPath());
                    if (arrayList2 == null) {
                        arrayList2 = new ArrayList();
                        hashMap.put(baseJob.getDataPath(), arrayList2);
                    }
                    arrayList2.add(baseJob);
                }
                for (String str : hashMap.keySet()) {
                    ArrayList arrayList3 = (ArrayList) hashMap.get(str);
                    if (arrayList3 != null && arrayList3.size() > 0) {
                        BatchJob batchJob = new BatchJob(str, arrayList3);
                        batchJob.attachInfo(((BaseJob) arrayList3.get(0)).mDbHelper, this.mContext);
                        this.mPool.execute(batchJob);
                    }
                }
                return;
            }
            return;
        }
        throw new IllegalStateException("should exec setDbHelperFactory method first!");
    }

    public void execNow(BaseJob baseJob) {
        BaseDbHelper baseDbHelper;
        if (baseJob != null) {
            if (this.mBaseDbHelperFactory != null) {
                String dataPath = baseJob.getDataPath();
                synchronized (this.mDbHelperMap) {
                    baseDbHelper = (BaseDbHelper) this.mDbHelperMap.get(dataPath);
                    if (baseDbHelper == null) {
                        baseDbHelper = this.mBaseDbHelperFactory.getDbHelper(this.mContext, dataPath);
                        this.mDbHelperMap.put(dataPath, baseDbHelper);
                    }
                }
                if (!this.mPool.isShutdown()) {
                    baseJob.attachInfo(baseDbHelper, this.mContext);
                    execR(baseJob);
                }
                return;
            }
            throw new IllegalStateException("should exec init method first!");
        }
    }

    public void execR(Runnable runnable) {
        if (!this.mPool.isShutdown()) {
            this.mPool.execute(runnable);
        }
    }

    public String getTableName(String str) {
        return getDbHelper(str).getTableName();
    }
}
