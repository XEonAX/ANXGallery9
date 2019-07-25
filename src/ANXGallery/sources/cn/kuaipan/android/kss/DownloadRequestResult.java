package cn.kuaipan.android.kss;

import android.util.Log;
import cn.kuaipan.android.exception.KscException;
import cn.kuaipan.android.kss.IKssDownloadRequestResult.Block;
import cn.kuaipan.android.utils.ApiDataHelper;
import cn.kuaipan.android.utils.Encode;
import java.util.Arrays;
import java.util.Collection;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class DownloadRequestResult implements IKssDownloadRequestResult, KssDef {
    private Block[] blocks;
    private byte[] secure_key;
    private final String stat;

    public DownloadRequestResult(Map<String, Object> map) throws KscException {
        this.stat = ApiDataHelper.asString(map, "stat");
        if ("OK".equalsIgnoreCase(this.stat)) {
            this.secure_key = Encode.hexStringToByteArray(ApiDataHelper.asString(map, "secure_key"));
            Collection<Map> collection = (Collection) map.get("blocks");
            if (collection != null) {
                this.blocks = new Block[collection.size()];
                int i = 0;
                for (Map map2 : collection) {
                    String asString = ApiDataHelper.asString(map2, "sha1");
                    long longValue = ApiDataHelper.asNumber(map2.get("size"), Integer.valueOf(0)).longValue();
                    String[] strArr = null;
                    Collection<String> collection2 = (Collection) map2.get("urls");
                    if (collection2 != null) {
                        strArr = new String[collection2.size()];
                        int i2 = 0;
                        for (String str : collection2) {
                            int i3 = i2 + 1;
                            strArr[i2] = str;
                            i2 = i3;
                        }
                    }
                    Block block = new Block(asString, strArr, longValue);
                    int i4 = i + 1;
                    this.blocks[i] = block;
                    i = i4;
                }
            }
        }
    }

    public Block getBlock(int i) {
        return this.blocks[i];
    }

    public int getBlockCount() {
        if (this.blocks == null) {
            return -1;
        }
        return this.blocks.length;
    }

    public String[] getBlockUrls(long j) {
        long j2 = 0;
        String[] strArr = null;
        if (j < 0 || this.blocks == null) {
            return null;
        }
        int i = 0;
        while (true) {
            if (i >= this.blocks.length) {
                break;
            }
            long j3 = this.blocks[i].size + j2;
            if (j >= j2 && j < j3) {
                strArr = this.blocks[i].urls;
                break;
            }
            i++;
            j2 = j3;
        }
        return strArr;
    }

    public String getHash() {
        StringBuilder sb = new StringBuilder();
        sb.append(this.blocks == null ? 0 : this.blocks.length);
        sb.append(':');
        sb.append(getTotalSize());
        sb.append(':');
        StringBuilder sb2 = new StringBuilder();
        if (this.blocks != null) {
            for (Block block : this.blocks) {
                sb2.append(block.sha1);
            }
        }
        sb.append(Encode.MD5Encode(sb2.toString().getBytes()));
        return sb.toString();
    }

    public String getMessage() {
        return this.stat;
    }

    public long getModifyTime() {
        return -1;
    }

    public byte[] getSecureKey() {
        return this.secure_key;
    }

    public int getStatus() {
        return "OK".equalsIgnoreCase(this.stat) ? 0 : -1;
    }

    public long getTotalSize() {
        long j = 0;
        if (this.blocks == null) {
            return 0;
        }
        for (Block block : this.blocks) {
            j += block.size;
        }
        return j;
    }

    public String toString() {
        JSONObject jSONObject;
        Block[] blockArr;
        try {
            jSONObject = new JSONObject();
            jSONObject.put("stat", this.stat);
            jSONObject.put("secure_key", Encode.byteArrayToHexString(this.secure_key));
            JSONArray jSONArray = new JSONArray();
            if (this.blocks != null) {
                for (Block block : this.blocks) {
                    JSONObject jSONObject2 = new JSONObject();
                    jSONObject2.put("sha1", block.sha1);
                    jSONObject2.put("size", block.size);
                    jSONObject2.put("urls", block.urls != null ? new JSONArray(Arrays.asList(block.urls)) : new JSONArray());
                    jSONArray.put(jSONObject2);
                }
            }
            jSONObject.put("blocks", jSONArray);
        } catch (JSONException unused) {
            Log.w("DownloadRequestResult", "Failed generate Json String for UploadRequestResult");
            jSONObject = null;
        }
        return String.valueOf(jSONObject);
    }
}
