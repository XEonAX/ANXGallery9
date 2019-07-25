package com.xiaomi.network;

import android.text.TextUtils;
import java.util.ArrayList;
import java.util.Iterator;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

class Fallbacks {
    private String host;
    private final ArrayList<Fallback> mFallbacks = new ArrayList<>();

    public Fallbacks() {
    }

    public Fallbacks(String str) {
        if (!TextUtils.isEmpty(str)) {
            this.host = str;
            return;
        }
        throw new IllegalArgumentException("the host is empty");
    }

    public synchronized void addFallback(Fallback fallback) {
        int i = 0;
        while (true) {
            if (i >= this.mFallbacks.size()) {
                break;
            } else if (((Fallback) this.mFallbacks.get(i)).match(fallback)) {
                this.mFallbacks.set(i, fallback);
                break;
            } else {
                i++;
            }
        }
        if (i >= this.mFallbacks.size()) {
            this.mFallbacks.add(fallback);
        }
    }

    public synchronized Fallbacks fromJSON(JSONObject jSONObject) throws JSONException {
        this.host = jSONObject.getString("host");
        JSONArray jSONArray = jSONObject.getJSONArray("fbs");
        for (int i = 0; i < jSONArray.length(); i++) {
            this.mFallbacks.add(new Fallback(this.host).fromJSON(jSONArray.getJSONObject(i)));
        }
        return this;
    }

    public synchronized Fallback getFallback() {
        for (int size = this.mFallbacks.size() - 1; size >= 0; size--) {
            Fallback fallback = (Fallback) this.mFallbacks.get(size);
            if (fallback.match()) {
                HostManager.getInstance().setCurrentISP(fallback.getISP());
                return fallback;
            }
        }
        return null;
    }

    public ArrayList<Fallback> getFallbacks() {
        return this.mFallbacks;
    }

    public String getHost() {
        return this.host;
    }

    public synchronized void purge(boolean z) {
        for (int size = this.mFallbacks.size() - 1; size >= 0; size--) {
            Fallback fallback = (Fallback) this.mFallbacks.get(size);
            if (z) {
                if (fallback.isExpired()) {
                    this.mFallbacks.remove(size);
                }
            } else if (!fallback.isEffective()) {
                this.mFallbacks.remove(size);
            }
        }
    }

    public synchronized JSONObject toJSON() throws JSONException {
        JSONObject jSONObject;
        jSONObject = new JSONObject();
        jSONObject.put("host", this.host);
        JSONArray jSONArray = new JSONArray();
        Iterator it = this.mFallbacks.iterator();
        while (it.hasNext()) {
            jSONArray.put(((Fallback) it.next()).toJSON());
        }
        jSONObject.put("fbs", jSONArray);
        return jSONObject;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(this.host);
        sb.append("\n");
        Iterator it = this.mFallbacks.iterator();
        while (it.hasNext()) {
            sb.append((Fallback) it.next());
        }
        return sb.toString();
    }
}
