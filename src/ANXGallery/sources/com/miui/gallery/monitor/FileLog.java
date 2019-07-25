package com.miui.gallery.monitor;

import android.os.Environment;
import android.text.TextUtils;
import android.util.Log;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.LinkedList;

public class FileLog {
    /* access modifiers changed from: private */
    public int mActiveCache;
    /* access modifiers changed from: private */
    public final LinkedList<String> mCache0;
    /* access modifiers changed from: private */
    public final LinkedList<String> mCache1;
    /* access modifiers changed from: private */
    public final Object mLock;
    private final LogTask mTask;

    private class LogTask extends Thread {
        private volatile boolean mActive = true;
        private final String mLogPath;
        private BufferedWriter mWriter;

        public LogTask(String str) {
            this.mLogPath = str;
        }

        private String getDefaultLogPath() {
            return new File(Environment.getExternalStorageDirectory(), String.format("blog_%s", new Object[]{new SimpleDateFormat("yyyy_MM_dd").format(new Date())})).getAbsolutePath();
        }

        private String getLogPath() {
            return TextUtils.isEmpty(this.mLogPath) ? getDefaultLogPath() : this.mLogPath;
        }

        public void active() {
            synchronized (this) {
                notifyAll();
            }
        }

        public void run() {
            LinkedList access$200;
            try {
                this.mWriter = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(getLogPath(), true)));
            } catch (IOException e) {
                this.mWriter = null;
                e.printStackTrace();
            }
            if (this.mWriter != null) {
                while (this.mActive) {
                    try {
                        synchronized (FileLog.this.mLock) {
                            access$200 = FileLog.this.mActiveCache == 0 ? FileLog.this.mCache0 : FileLog.this.mCache1;
                            StringBuilder sb = new StringBuilder();
                            sb.append("write active cache: ");
                            sb.append(FileLog.this.mActiveCache);
                            Log.d("FileLog", sb.toString());
                            FileLog.this.mActiveCache = 1 - FileLog.this.mActiveCache;
                        }
                        Iterator it = access$200.iterator();
                        while (it.hasNext()) {
                            this.mWriter.write((String) it.next());
                            this.mWriter.write("\n");
                        }
                        this.mWriter.flush();
                        access$200.clear();
                        LinkedList access$2002 = FileLog.this.mActiveCache == 0 ? FileLog.this.mCache0 : FileLog.this.mCache1;
                        synchronized (this) {
                            while (access$2002.size() <= 0) {
                                StringBuilder sb2 = new StringBuilder();
                                sb2.append("wait cache: ");
                                sb2.append(FileLog.this.mActiveCache);
                                Log.d("FileLog", sb2.toString());
                                wait();
                            }
                        }
                    } catch (Throwable th) {
                        try {
                            th.printStackTrace();
                            return;
                        } finally {
                            try {
                                this.mWriter.close();
                                this.mWriter = null;
                            } catch (IOException e2) {
                                e2.printStackTrace();
                            }
                        }
                    }
                }
                try {
                    this.mWriter.close();
                    this.mWriter = null;
                } catch (IOException e3) {
                    e3.printStackTrace();
                }
            }
        }
    }

    public FileLog() {
        this(null);
    }

    public FileLog(String str) {
        this.mLock = new Object();
        this.mTask = new LogTask(str);
        this.mCache0 = new LinkedList<>();
        this.mCache1 = new LinkedList<>();
        this.mTask.setPriority(4);
        this.mTask.start();
    }

    public void log(String str) {
        LinkedList<String> linkedList;
        long currentTimeMillis = System.currentTimeMillis();
        synchronized (this.mLock) {
            linkedList = this.mActiveCache == 0 ? this.mCache0 : this.mCache1;
        }
        linkedList.add(str);
        this.mTask.active();
        StringBuilder sb = new StringBuilder();
        sb.append("log cost: ");
        sb.append(System.currentTimeMillis() - currentTimeMillis);
        Log.d("FileLog", sb.toString());
    }
}
