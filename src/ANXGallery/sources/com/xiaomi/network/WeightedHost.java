package com.xiaomi.network;

import java.util.Iterator;
import java.util.LinkedList;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

class WeightedHost implements Comparable<WeightedHost> {
    private final LinkedList<AccessHistory> accessHistories;
    String host;
    private long touchedTime;
    protected int weight;

    public WeightedHost() {
        this(null, 0);
    }

    public WeightedHost(String str) {
        this(str, 0);
    }

    public WeightedHost(String str, int i) {
        this.accessHistories = new LinkedList<>();
        this.touchedTime = 0;
        this.host = str;
        this.weight = i;
    }

    /* access modifiers changed from: protected */
    public synchronized void addAccessHistory(AccessHistory accessHistory) {
        if (accessHistory != null) {
            this.accessHistories.add(accessHistory);
            int weight2 = accessHistory.getWeight();
            if (weight2 > 0) {
                this.weight += accessHistory.getWeight();
            } else {
                int i = 0;
                int size = this.accessHistories.size() - 1;
                while (size >= 0 && ((AccessHistory) this.accessHistories.get(size)).getWeight() < 0) {
                    i++;
                    size--;
                }
                this.weight += weight2 * i;
            }
            if (this.accessHistories.size() > 30) {
                this.weight -= ((AccessHistory) this.accessHistories.remove()).getWeight();
            }
        }
    }

    public int compareTo(WeightedHost weightedHost) {
        if (weightedHost == null) {
            return 1;
        }
        return weightedHost.weight - this.weight;
    }

    public synchronized WeightedHost fromJSON(JSONObject jSONObject) throws JSONException {
        this.touchedTime = jSONObject.getLong("tt");
        this.weight = jSONObject.getInt("wt");
        this.host = jSONObject.getString("host");
        JSONArray jSONArray = jSONObject.getJSONArray("ah");
        for (int i = 0; i < jSONArray.length(); i++) {
            this.accessHistories.add(new AccessHistory().fromJSON(jSONArray.getJSONObject(i)));
        }
        return this;
    }

    public synchronized JSONObject toJSON() throws JSONException {
        JSONObject jSONObject;
        jSONObject = new JSONObject();
        jSONObject.put("tt", this.touchedTime);
        jSONObject.put("wt", this.weight);
        jSONObject.put("host", this.host);
        JSONArray jSONArray = new JSONArray();
        Iterator it = this.accessHistories.iterator();
        while (it.hasNext()) {
            jSONArray.put(((AccessHistory) it.next()).toJSON());
        }
        jSONObject.put("ah", jSONArray);
        return jSONObject;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(this.host);
        sb.append(":");
        sb.append(this.weight);
        return sb.toString();
    }
}
