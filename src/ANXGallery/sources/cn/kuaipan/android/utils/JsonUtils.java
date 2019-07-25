package cn.kuaipan.android.utils;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import org.json.JSONException;

public class JsonUtils {
    public static Object parser(JsonReader jsonReader) throws IOException, JSONException {
        switch (jsonReader.peek()) {
            case BEGIN_ARRAY:
                return parserArray(jsonReader);
            case BEGIN_OBJECT:
                return parserObject(jsonReader);
            case BOOLEAN:
                return Boolean.valueOf(jsonReader.nextBoolean());
            case NUMBER:
                return parserNumber(jsonReader);
            case STRING:
                return jsonReader.nextString();
            case NULL:
                jsonReader.nextNull();
                return null;
            case NAME:
            case END_ARRAY:
            case END_DOCUMENT:
            case END_OBJECT:
                throw new JSONException("Meet EOF when json not end.");
            default:
                return null;
        }
    }

    public static Object parser(InputStream inputStream) throws IOException, JSONException {
        JsonReader jsonReader = new JsonReader(new InputStreamReader(inputStream));
        Object parser = parser(jsonReader);
        if (jsonReader.peek() == JsonToken.END_DOCUMENT) {
            return parser;
        }
        throw new JSONException("Document not end of EOF");
    }

    public static Object parser(Reader reader) throws IOException, JSONException {
        JsonReader jsonReader = new JsonReader(reader);
        Object parser = parser(jsonReader);
        if (jsonReader.peek() == JsonToken.END_DOCUMENT) {
            return parser;
        }
        throw new JSONException("Document not end of EOF");
    }

    private static Object parserArray(JsonReader jsonReader) throws IOException, JSONException {
        jsonReader.beginArray();
        ObtainabelList obtain = ObtainabelList.obtain();
        try {
            JsonToken peek = jsonReader.peek();
            while (peek != JsonToken.END_ARRAY) {
                obtain.add(parser(jsonReader));
                peek = jsonReader.peek();
            }
            jsonReader.endArray();
            return obtain;
        } catch (IOException e) {
            obtain.recycle();
            throw e;
        } catch (JSONException e2) {
            obtain.recycle();
            throw e2;
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:6:?, code lost:
        return java.lang.Double.valueOf(r2.nextDouble());
     */
    /* JADX WARNING: Code restructure failed: missing block: B:8:?, code lost:
        return java.lang.Long.valueOf(r2.nextLong());
     */
    /* JADX WARNING: Failed to process nested try/catch */
    /* JADX WARNING: Missing exception handler attribute for start block: B:2:0x0009 */
    private static Object parserNumber(JsonReader jsonReader) throws IOException {
        return Integer.valueOf(jsonReader.nextInt());
    }

    private static Object parserObject(JsonReader jsonReader) throws IOException, JSONException {
        jsonReader.beginObject();
        ObtainabelHashMap obtain = ObtainabelHashMap.obtain();
        try {
            JsonToken peek = jsonReader.peek();
            while (peek != JsonToken.END_OBJECT) {
                obtain.put(jsonReader.nextName(), parser(jsonReader));
                peek = jsonReader.peek();
            }
            jsonReader.endObject();
            return obtain;
        } catch (IOException e) {
            obtain.recycle();
            throw e;
        } catch (JSONException e2) {
            obtain.recycle();
            throw e2;
        }
    }
}
