package com.miui.gallery.editor.photo.sdk;

import android.app.job.JobInfo;
import android.app.job.JobInfo.Builder;
import android.app.job.JobParameters;
import android.app.job.JobScheduler;
import android.app.job.JobService;
import android.content.ComponentName;
import android.content.Context;
import android.database.Cursor;
import android.os.AsyncTask;
import android.os.AsyncTask.Status;
import android.os.PersistableBundle;
import android.provider.MediaStore.Files;
import android.text.TextUtils;
import android.util.ArraySet;
import com.miui.gallery.util.Log;
import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

public class CleanService extends JobService {
    /* access modifiers changed from: private */
    public CleanTask mCleanTask;

    private class CleanTask extends AsyncTask<JobParameters, Void, Void> {
        private CleanTask() {
        }

        private boolean delete(File file) {
            long j;
            File[] listFiles;
            if (file != null) {
                boolean z = true;
                if (file.isFile()) {
                    if (file.exists() && !file.delete()) {
                        z = false;
                    }
                    Log.d("CleanService.CleanTask", "deleting file: %s. deleted: %b", file, Boolean.valueOf(z));
                    return z;
                } else if (!file.isDirectory()) {
                    return false;
                } else {
                    Cursor query = CleanService.this.getContentResolver().query(Files.getContentUri("external"), new String[]{"_id"}, "_data=?", new String[]{file.getAbsolutePath()}, null);
                    if (query != null) {
                        try {
                            j = query.moveToFirst() ? query.getLong(0) : -1;
                        } finally {
                            query.close();
                        }
                    } else {
                        j = -1;
                    }
                    Log.d("CleanService.CleanTask", "cleaning directory(%d)", (Object) Long.valueOf(j));
                    ArraySet arraySet = new ArraySet();
                    if (j != -1) {
                        Cursor query2 = CleanService.this.getContentResolver().query(Files.getContentUri("external"), new String[]{"_data"}, "parent=?", new String[]{String.valueOf(j)}, null);
                        Log.d("CleanService.CleanTask", "mark children of %d, count: %d", Long.valueOf(j), Integer.valueOf(query2 == null ? -1 : query2.getCount()));
                        if (query2 != null) {
                            while (query2.moveToNext()) {
                                try {
                                    arraySet.add(query2.getString(0));
                                } finally {
                                    query2.close();
                                }
                            }
                        }
                    }
                    boolean z2 = true;
                    for (File file2 : file.listFiles()) {
                        String absolutePath = file2.getAbsolutePath();
                        if (arraySet.contains(absolutePath)) {
                            int delete = CleanService.this.getContentResolver().delete(Files.getContentUri("external"), "_data=?", new String[]{absolutePath});
                            Log.d("CleanService.CleanTask", "deleted %d item from MediaProvider", (Object) Integer.valueOf(delete));
                            if (delete > 0) {
                                arraySet.remove(absolutePath);
                                z2 &= delete(file2);
                            } else {
                                z2 = false;
                            }
                        } else {
                            z2 &= delete(file2);
                        }
                    }
                    return z2;
                }
            } else {
                throw new NullPointerException("file can't be null");
            }
        }

        /* access modifiers changed from: protected */
        public Void doInBackground(JobParameters... jobParametersArr) {
            List<File> access$100 = CleanService.this.parse(jobParametersArr[0]);
            Log.d("CleanService.CleanTask", "start clean files: %s", (Object) access$100);
            boolean z = false;
            for (File file : access$100) {
                if (file.exists()) {
                    z |= !delete(file);
                }
            }
            Log.d("CleanService.CleanTask", "job finish, reschedule ? %b", (Object) Boolean.valueOf(z));
            CleanService.this.jobFinished(jobParametersArr[0], z);
            return null;
        }

        /* access modifiers changed from: protected */
        public void onPostExecute(Void voidR) {
            super.onPostExecute(voidR);
            CleanService.this.mCleanTask = null;
        }
    }

    /* access modifiers changed from: private */
    public List<File> parse(JobParameters jobParameters) {
        String[] stringArray = (jobParameters == null || jobParameters.getExtras() == null) ? null : jobParameters.getExtras().getStringArray("extra_file_paths");
        if (stringArray == null || stringArray.length < 1) {
            return null;
        }
        ArrayList arrayList = new ArrayList((stringArray.length / 2) + 1);
        for (String file : stringArray) {
            File file2 = new File(file);
            if (file2.exists()) {
                arrayList.add(file2);
            }
        }
        return arrayList;
    }

    public static void schedule(Context context, String str) {
        if (context == null) {
            throw new NullPointerException("context can't be null");
        } else if (!TextUtils.isEmpty(str)) {
            Log.d("CleanService", "received file: %s", (Object) str);
            JobScheduler jobScheduler = (JobScheduler) context.getSystemService("jobscheduler");
            List allPendingJobs = jobScheduler.getAllPendingJobs();
            JobInfo jobInfo = null;
            if (allPendingJobs != null && !allPendingJobs.isEmpty()) {
                Iterator it = allPendingJobs.iterator();
                while (true) {
                    if (!it.hasNext()) {
                        break;
                    }
                    JobInfo jobInfo2 = (JobInfo) it.next();
                    if (jobInfo2.getId() == 999) {
                        jobInfo = jobInfo2;
                        break;
                    }
                }
            }
            PersistableBundle persistableBundle = new PersistableBundle();
            if (jobInfo == null) {
                Log.d("CleanService", "non job exists, create one");
                persistableBundle.putStringArray("extra_file_paths", new String[]{str});
            } else {
                String[] stringArray = jobInfo.getExtras().getStringArray("extra_file_paths");
                ArraySet arraySet = new ArraySet(stringArray.length + 1);
                arraySet.addAll(Arrays.asList(stringArray));
                arraySet.add(str);
                String[] strArr = new String[arraySet.size()];
                arraySet.toArray(strArr);
                Log.d("CleanService", "append, current files: %s", (Object) Arrays.toString(strArr));
                persistableBundle.putStringArray("extra_file_paths", strArr);
                jobScheduler.cancel(999);
            }
            jobScheduler.schedule(new Builder(999, new ComponentName(context, CleanService.class)).setPersisted(false).setRequiresDeviceIdle(true).setExtras(persistableBundle).build());
        } else {
            throw new IllegalArgumentException("illegal path");
        }
    }

    public boolean onStartJob(JobParameters jobParameters) {
        List parse = parse(jobParameters);
        if (parse == null || parse.isEmpty()) {
            return false;
        }
        this.mCleanTask = new CleanTask();
        this.mCleanTask.executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, new JobParameters[]{jobParameters});
        return true;
    }

    public boolean onStopJob(JobParameters jobParameters) {
        boolean z = true;
        if (!(this.mCleanTask == null || this.mCleanTask.getStatus() == Status.FINISHED)) {
            this.mCleanTask.cancel(true);
            this.mCleanTask = null;
        }
        List parse = parse(jobParameters);
        if (parse == null || parse.isEmpty()) {
            z = false;
        }
        Log.d("CleanService", "onStopJob: %b", (Object) Boolean.valueOf(z));
        return z;
    }
}
