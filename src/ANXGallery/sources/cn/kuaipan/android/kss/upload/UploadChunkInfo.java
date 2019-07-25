package cn.kuaipan.android.kss.upload;

import cn.kuaipan.android.kss.KssDef;
import cn.kuaipan.android.utils.ApiDataHelper;
import java.util.HashSet;
import java.util.Map;

class UploadChunkInfo implements KssDef {
    private static final HashSet<String> sReRequestSet = new HashSet<>();
    private static final HashSet<String> sReTrySet = new HashSet<>();
    public final String commit_meta;
    public ServerExpect expect_info;
    public long left_bytes;
    public long next_pos;
    public final String stat;
    public final String upload_id;

    static {
        sReRequestSet.add("ERR_INVALID_FILE_META");
        sReRequestSet.add("ERR_INVALID_BLOCK_META");
        sReRequestSet.add("ERR_INVALID_UPLOAD_ID");
        sReRequestSet.add("ERR_INVALID_CHUNK_POS");
        sReRequestSet.add("ERR_INVALID_CHUNK_SIZE");
        sReRequestSet.add("ERR_CHUNK_OUT_OF_RANGE");
        sReTrySet.add("ERR_CHUNK_CORRUPTED");
        sReTrySet.add("ERR_SERVER_EXCEPTION");
        sReTrySet.add("ERR_STORAGE_REQUEST_ERROR");
        sReTrySet.add("ERR_STORAGE_REQUEST_FAILED");
    }

    public UploadChunkInfo(long j, long j2, String str) {
        this.stat = "CONTINUE_UPLOAD";
        this.next_pos = j;
        this.left_bytes = j2;
        this.upload_id = str;
        this.commit_meta = null;
    }

    public UploadChunkInfo(Map<String, Object> map) {
        this.stat = ApiDataHelper.asString(map, "stat");
        this.next_pos = ApiDataHelper.asNumber(map.get("next_pos"), Integer.valueOf(-1)).longValue();
        this.left_bytes = ApiDataHelper.asNumber(map.get("left_bytes"), Integer.valueOf(-1)).longValue();
        this.upload_id = ApiDataHelper.asString(map, "upload_id");
        this.commit_meta = ApiDataHelper.asString(map, "commit_meta");
    }

    public boolean canRetry() {
        return sReTrySet.contains(this.stat == null ? null : this.stat.toUpperCase());
    }

    public boolean isComplete() {
        return "BLOCK_COMPLETED".equalsIgnoreCase(this.stat);
    }

    public boolean isContinue() {
        return "CONTINUE_UPLOAD".equalsIgnoreCase(this.stat);
    }

    public boolean needBlockRetry() {
        return "ERR_BLOCK_CORRUPTED".equalsIgnoreCase(this.stat);
    }
}
