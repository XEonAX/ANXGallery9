package com.xiaomi.metoknlp.devicediscover;

import android.content.Context;
import android.os.Handler;
import android.os.Message;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.lang.ref.WeakReference;
import java.util.HashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

/* compiled from: Scanner */
public class l extends Thread {
    private WeakReference T;
    private WeakReference U;
    private final int mWhat;

    public l(Handler handler, Context context, int i) {
        this.T = new WeakReference(handler);
        this.U = new WeakReference(context);
        this.mWhat = i;
        start();
    }

    private HashMap L() {
        HashMap hashMap = new HashMap();
        String c = i.c(getContext());
        if (c != null) {
            String substring = c.substring(0, c.lastIndexOf("."));
            ExecutorService newFixedThreadPool = Executors.newFixedThreadPool(40);
            try {
                Runnable[] runnableArr = new Runnable[255];
                for (int i = 1; i < 255; i++) {
                    StringBuilder sb = new StringBuilder();
                    sb.append(substring);
                    sb.append(".");
                    sb.append(i);
                    runnableArr[i] = new d(this, sb.toString());
                }
                for (int i2 = 1; i2 < 255; i2++) {
                    newFixedThreadPool.execute(runnableArr[i2]);
                }
            } catch (Exception unused) {
            } finally {
                newFixedThreadPool.shutdown();
                try {
                    newFixedThreadPool.awaitTermination(10000, TimeUnit.MILLISECONDS);
                } catch (Exception unused2) {
                }
            }
            try {
                newFixedThreadPool.awaitTermination(10000, TimeUnit.MILLISECONDS);
            } catch (Exception unused3) {
            }
            a(substring, 1, 255, hashMap);
        }
        return hashMap;
    }

    public static void a(Context context, Handler handler, int i) {
        new l(handler, context, i);
    }

    /* JADX WARNING: Removed duplicated region for block: B:28:0x0074 A[SYNTHETIC, Splitter:B:28:0x0074] */
    /* JADX WARNING: Removed duplicated region for block: B:50:? A[RETURN, SYNTHETIC] */
    /* JADX WARNING: Removed duplicated region for block: B:51:? A[RETURN, SYNTHETIC] */
    private void a(String str, int i, int i2, HashMap hashMap) {
        BufferedReader bufferedReader;
        try {
            bufferedReader = new BufferedReader(new FileReader("/proc/net/arp"));
            try {
                bufferedReader.readLine();
                int i3 = (i2 - i) + 1;
                String[] strArr = new String[i3];
                for (int i4 = 0; i4 < i3; i4++) {
                    StringBuilder sb = new StringBuilder();
                    sb.append(str);
                    sb.append(".");
                    sb.append(i4);
                    strArr[i4] = sb.toString();
                }
                while (true) {
                    String readLine = bufferedReader.readLine();
                    if (readLine != null) {
                        String[] split = readLine.split("[ ]+");
                        if (split.length >= 6) {
                            String str2 = split[0];
                            String str3 = split[3];
                            for (String equals : strArr) {
                                if (equals.equals(str2) && str3.matches("..:..:..:..:..:..") && !"00:00:00:00:00:00".equals(str3)) {
                                    hashMap.put(str2, str3);
                                }
                            }
                        }
                    }
                    try {
                        break;
                    } catch (IOException unused) {
                        return;
                    }
                }
            } catch (FileNotFoundException unused2) {
                if (bufferedReader == null) {
                }
                break;
                bufferedReader.close();
            } catch (IOException unused3) {
                if (bufferedReader == null) {
                }
                break;
                bufferedReader.close();
            } catch (Throwable th) {
                th = th;
                if (bufferedReader != null) {
                }
                throw th;
            }
        } catch (FileNotFoundException unused4) {
            bufferedReader = null;
            if (bufferedReader == null) {
                return;
            }
            break;
            bufferedReader.close();
        } catch (IOException unused5) {
            bufferedReader = null;
            if (bufferedReader == null) {
                return;
            }
            break;
            bufferedReader.close();
        } catch (Throwable th2) {
            th = th2;
            bufferedReader = null;
            if (bufferedReader != null) {
                try {
                    bufferedReader.close();
                } catch (IOException unused6) {
                }
            }
            throw th;
        }
        bufferedReader.close();
    }

    private void a(HashMap hashMap) {
        Handler handler = getHandler();
        Message obtainMessage = handler.obtainMessage(this.mWhat);
        obtainMessage.obj = hashMap;
        handler.sendMessage(obtainMessage);
    }

    private Context getContext() {
        if (this.T == null) {
            return null;
        }
        return (Context) this.U.get();
    }

    private Handler getHandler() {
        if (this.T == null) {
            return null;
        }
        return (Handler) this.T.get();
    }

    public void run() {
        a(L());
    }
}
