package com.xiaomi.opensdk.file.sdk;

import cn.kuaipan.android.exception.KscException;
import cn.kuaipan.android.kss.UploadRequestResult;
import cn.kuaipan.android.utils.ApiDataHelper;
import cn.kuaipan.android.utils.ApiDataHelper.IKscData;
import cn.kuaipan.android.utils.ApiDataHelper.IKscData.Parser;
import cn.kuaipan.android.utils.IObtainable;
import cn.kuaipan.android.utils.JsonUtils;
import java.io.IOException;
import java.io.Reader;
import java.io.StringReader;
import java.util.Map;
import org.json.JSONException;
import org.json.JSONObject;

public class FileUploadRequestResult extends UploadRequestResult implements IKscData {
    public static final Parser<FileUploadRequestResult> PARSER = new Parser<FileUploadRequestResult>() {
    };
    public final String requestId;

    public FileUploadRequestResult(Map<String, Object> map) throws KscException {
        super(map);
        this.requestId = ApiDataHelper.asString(map, "requestId");
    }

    public static FileUploadRequestResult create(String str) throws KscException {
        Map map = null;
        try {
            Map map2 = (Map) JsonUtils.parser((Reader) new StringReader(str));
            try {
                FileUploadRequestResult fileUploadRequestResult = new FileUploadRequestResult(map2);
                if (map2 != null && (map2 instanceof IObtainable)) {
                    ((IObtainable) map2).recycle();
                }
                return fileUploadRequestResult;
            } catch (IOException e) {
                Throwable th = e;
                Map map3 = map2;
                e = th;
                throw new KscException(501004, "kss is null", e);
            } catch (JSONException e2) {
                Throwable th2 = e2;
                map = map2;
                e = th2;
                throw new KscException(501001, "kss is not json", e);
            } catch (Throwable th3) {
                Throwable th4 = th3;
                map = map2;
                th = th4;
                ((IObtainable) map).recycle();
                throw th;
            }
        } catch (IOException e3) {
            e = e3;
            throw new KscException(501004, "kss is null", e);
        } catch (JSONException e4) {
            e = e4;
            throw new KscException(501001, "kss is not json", e);
        } catch (Throwable th5) {
            th = th5;
            if (map != null && (map instanceof IObtainable)) {
                ((IObtainable) map).recycle();
            }
            throw th;
        }
    }

    public String toString() {
        String uploadRequestResult = super.toString();
        try {
            return new JSONObject(uploadRequestResult).put("requestId", this.requestId).toString();
        } catch (JSONException e) {
            e.printStackTrace();
            return uploadRequestResult;
        }
    }
}
