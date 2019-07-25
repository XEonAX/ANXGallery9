package com.xiaomi.metoknlp.devicediscover;

import android.os.AsyncTask;
import com.xiaomi.metoknlp.a.b;
import org.json.JSONException;
import org.json.JSONObject;

/* compiled from: DiscoverService */
class j extends AsyncTask {
    final /* synthetic */ m a;
    private boolean mRunning;

    private j(m mVar) {
        this.a = mVar;
        this.mRunning = true;
    }

    /* synthetic */ j(m mVar, a aVar) {
        this(mVar);
    }

    private String n(String str) {
        String a2 = b.a(str, null);
        if (a2 != null) {
            try {
                return new JSONObject(a2).getString("real-ip");
            } catch (JSONException unused) {
            }
        }
        return null;
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public String doInBackground(String... strArr) {
        if (this.mRunning) {
            try {
                return n(strArr[0]);
            } catch (Exception unused) {
            }
        }
        return null;
    }

    /* access modifiers changed from: protected */
    /* renamed from: m */
    public void onPostExecute(String str) {
        if (this.mRunning) {
            this.a.mHandler.sendMessage(this.a.mHandler.obtainMessage(3, str));
        }
    }

    /* access modifiers changed from: protected */
    public void onCancelled() {
        this.mRunning = false;
    }
}
