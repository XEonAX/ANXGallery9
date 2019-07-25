package cn.kuaipan.android.kss;

import android.util.Log;
import cn.kuaipan.android.exception.KscException;
import cn.kuaipan.android.kss.IKssUploadRequestResult.Block;
import cn.kuaipan.android.utils.ApiDataHelper;
import cn.kuaipan.android.utils.Encode;
import java.util.Arrays;
import java.util.Collection;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class UploadRequestResult implements IKssUploadRequestResult, KssDef {
    private Block[] blocks;
    private final String file_meta;
    private String[] node_urls;
    private final byte[] secure_key;

    public UploadRequestResult(Map<String, Object> map) throws KscException {
        this.secure_key = Encode.hexStringToByteArray(ApiDataHelper.asString(map, "secure_key"));
        this.file_meta = ApiDataHelper.asString(map, "file_meta");
        Collection<Map> collection = (Collection) map.get("block_metas");
        int i = 0;
        if (collection != null) {
            this.blocks = new Block[collection.size()];
            int i2 = 0;
            for (Map map2 : collection) {
                boolean z = ApiDataHelper.asNumber(map2.get("is_existed"), Integer.valueOf(0)).intValue() != 0;
                Block block = new Block(ApiDataHelper.asString(map2, z ? "commit_meta" : "block_meta"), z);
                int i3 = i2 + 1;
                this.blocks[i2] = block;
                i2 = i3;
            }
        }
        Collection<String> collection2 = (Collection) map.get("node_urls");
        if (collection2 != null) {
            this.node_urls = new String[collection2.size()];
            for (String str : collection2) {
                int i4 = i + 1;
                this.node_urls[i] = str;
                i = i4;
            }
        }
    }

    public Block getBlock(int i) {
        if (this.blocks == null || i >= this.blocks.length) {
            return null;
        }
        return this.blocks[i];
    }

    public int getBlockCount() {
        if (this.blocks == null) {
            return 0;
        }
        return this.blocks.length;
    }

    public String getFileMeta() {
        return this.file_meta;
    }

    public String[] getNodeUrls() {
        return this.node_urls;
    }

    public byte[] getSecureKey() {
        return this.secure_key;
    }

    public boolean isCompleted() {
        if (this.blocks == null) {
            return true;
        }
        for (Block block : this.blocks) {
            if (!block.exist) {
                return false;
            }
        }
        return true;
    }

    public String toString() {
        JSONObject jSONObject;
        Block[] blockArr;
        try {
            jSONObject = new JSONObject();
            jSONObject.put("secure_key", Encode.byteArrayToHexString(this.secure_key));
            jSONObject.put("file_meta", this.file_meta);
            jSONObject.put("node_urls", this.node_urls != null ? new JSONArray(Arrays.asList(this.node_urls)) : new JSONArray());
            JSONArray jSONArray = new JSONArray();
            if (this.blocks != null) {
                for (Block block : this.blocks) {
                    JSONObject jSONObject2 = new JSONObject();
                    jSONObject2.put("is_existed", block.exist ? 1 : 0);
                    if (block.exist) {
                        jSONObject2.put("commit_meta", block.meta);
                    } else {
                        jSONObject2.put("block_meta", block.meta);
                    }
                    jSONArray.put(jSONObject2);
                }
            }
            jSONObject.put("block_metas", jSONArray);
        } catch (JSONException unused) {
            Log.w("UploadRequestResult", "Failed generate Json String for UploadRequestResult");
            jSONObject = null;
        }
        return String.valueOf(jSONObject);
    }
}
