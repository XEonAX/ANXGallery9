package cn.kuaipan.android.utils;

import android.util.MalformedJsonException;
import cn.kuaipan.android.exception.KscException;
import cn.kuaipan.android.http.KscHttpResponse;
import java.io.IOException;
import java.io.InputStream;
import java.util.Map;
import org.json.JSONException;

public class ApiDataHelper {

    public interface IKscData {

        public interface Parser<T extends IKscData> {
        }
    }

    public static Number asNumber(Object obj, Number number) {
        Number number2;
        if (obj == null) {
            return number;
        }
        if (obj instanceof Number) {
            number2 = (Number) obj;
        } else {
            String obj2 = obj.toString();
            try {
                number2 = Long.valueOf(Long.parseLong(obj2));
            } catch (NumberFormatException unused) {
                number2 = Double.valueOf(Double.parseDouble(obj2));
            }
        }
        return number2;
    }

    public static String asString(Map<String, Object> map, String str) {
        if (map != null) {
            Object obj = map.get(str);
            if (obj == null) {
                return null;
            }
            return obj.toString();
        }
        throw new IllegalArgumentException("DataMap can't be null when parse.");
    }

    public static Map<String, Object> contentToMap(KscHttpResponse kscHttpResponse) throws KscException, InterruptedException {
        InputStream inputStream = null;
        try {
            InputStream content = kscHttpResponse.getContent();
            if (content != null) {
                try {
                    Map<String, Object> map = (Map) JsonUtils.parser(content);
                    if (map == null || map.isEmpty()) {
                        throw new KscException(501003, kscHttpResponse.dump());
                    }
                    try {
                        content.close();
                    } catch (Throwable unused) {
                    }
                    return map;
                } catch (MalformedJsonException e) {
                    e = e;
                    InputStream inputStream2 = content;
                    throw new KscException(501001, kscHttpResponse.dump(), e);
                } catch (JSONException e2) {
                    e = e2;
                    InputStream inputStream3 = content;
                    throw new KscException(501001, kscHttpResponse.dump(), e);
                } catch (IOException e3) {
                    e = e3;
                    InputStream inputStream4 = content;
                    throw KscException.newException(e, kscHttpResponse.dump());
                } catch (ClassCastException e4) {
                    e = e4;
                    inputStream = content;
                    throw new KscException(501003, kscHttpResponse.dump(), e);
                } catch (Throwable th) {
                    th = th;
                    inputStream = content;
                    try {
                        inputStream.close();
                    } catch (Throwable unused2) {
                    }
                    throw th;
                }
            } else {
                throw new KscException(501001, kscHttpResponse.dump());
            }
        } catch (MalformedJsonException e5) {
            e = e5;
            throw new KscException(501001, kscHttpResponse.dump(), e);
        } catch (JSONException e6) {
            e = e6;
            throw new KscException(501001, kscHttpResponse.dump(), e);
        } catch (IOException e7) {
            e = e7;
            throw KscException.newException(e, kscHttpResponse.dump());
        } catch (ClassCastException e8) {
            e = e8;
            throw new KscException(501003, kscHttpResponse.dump(), e);
        } catch (Throwable th2) {
            th = th2;
            inputStream.close();
            throw th;
        }
    }
}
