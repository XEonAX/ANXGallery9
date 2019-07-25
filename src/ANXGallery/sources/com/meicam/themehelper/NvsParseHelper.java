package com.meicam.themehelper;

import android.content.Context;
import android.media.ExifInterface;
import android.os.Build.VERSION;
import android.util.Log;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class NvsParseHelper {
    private static final String TAG = "NvsParseHelper";

    public static NvsMusicPointDesc GetDescFromJsonObject(JSONObject jSONObject) throws JSONException {
        NvsMusicPointDesc nvsMusicPointDesc = new NvsMusicPointDesc();
        nvsMusicPointDesc.cutPoint = jSONObject.getInt("cutPoint");
        nvsMusicPointDesc.transLen = jSONObject.getInt("transLen");
        if (jSONObject.has("transName")) {
            JSONArray jSONArray = jSONObject.getJSONArray("transName");
            for (int i = 0; i < jSONArray.length(); i++) {
                nvsMusicPointDesc.transNames.add(jSONArray.getJSONObject(i).getString("id"));
            }
        }
        if (jSONObject.has("fxName")) {
            JSONArray jSONArray2 = jSONObject.getJSONArray("fxName");
            for (int i2 = 0; i2 < jSONArray2.length(); i2++) {
                nvsMusicPointDesc.fxNames.add(jSONArray2.getJSONObject(i2).getString("id"));
            }
        }
        return nvsMusicPointDesc;
    }

    public static NvsMusicFileDesc GetMusicFileFromJsonObject(JSONObject jSONObject, String str) {
        NvsMusicFileDesc nvsMusicFileDesc;
        try {
            nvsMusicFileDesc = new NvsMusicFileDesc();
            try {
                nvsMusicFileDesc.id = str;
                nvsMusicFileDesc.displayName = jSONObject.getString("name");
                StringBuilder sb = new StringBuilder();
                sb.append(str);
                sb.append("/");
                sb.append(jSONObject.getString("json id"));
                sb.append(".json");
                nvsMusicFileDesc.jsonFile = sb.toString();
                StringBuilder sb2 = new StringBuilder();
                sb2.append(str);
                sb2.append("/");
                sb2.append(jSONObject.getString("json id10s"));
                sb2.append(".json");
                nvsMusicFileDesc.jsonFile10s = sb2.toString();
                StringBuilder sb3 = new StringBuilder();
                sb3.append(str);
                sb3.append("/");
                sb3.append(jSONObject.getString("music id"));
                nvsMusicFileDesc.musicFile = sb3.toString();
                StringBuilder sb4 = new StringBuilder();
                sb4.append(str);
                sb4.append("/");
                sb4.append(jSONObject.getString("music id10s"));
                nvsMusicFileDesc.musicFile10s = sb4.toString();
            } catch (JSONException e) {
                e = e;
            }
        } catch (JSONException e2) {
            e = e2;
            nvsMusicFileDesc = null;
            e.printStackTrace();
            return nvsMusicFileDesc;
        }
        return nvsMusicFileDesc;
    }

    public static long getFileLastTime(String str) {
        ExifInterface exifInterface;
        Date date = null;
        try {
            exifInterface = new ExifInterface(str);
        } catch (IOException e) {
            e.printStackTrace();
            exifInterface = null;
        }
        if (exifInterface != null) {
            String attribute = exifInterface.getAttribute("DateTime");
            if (attribute != null) {
                try {
                    date = new SimpleDateFormat("yyyy:MM:dd HH:mm:ss").parse(attribute);
                } catch (ParseException e2) {
                    e2.printStackTrace();
                }
                if (date != null) {
                    return date.getTime();
                }
                try {
                    return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(attribute).getTime();
                } catch (ParseException e3) {
                    e3.printStackTrace();
                }
            }
        }
        try {
            return new File(str).lastModified();
        } catch (Exception e4) {
            e4.printStackTrace();
            return 0;
        }
    }

    private static void getTransByType(JSONObject jSONObject, String str, ArrayList<String> arrayList) throws JSONException {
        JSONArray jSONArray = jSONObject.getJSONArray(str);
        if (jSONArray == null) {
            Log.d(TAG, "getTransByType error!");
            return;
        }
        for (int i = 0; i < jSONArray.length(); i++) {
            try {
                arrayList.add(jSONArray.getJSONObject(i).getString("transName"));
            } catch (JSONException e) {
                e.printStackTrace();
            }
        }
    }

    private static void getTransFxByType(JSONObject jSONObject, String str, ArrayList<String> arrayList) throws JSONException {
        JSONArray jSONArray = jSONObject.getJSONArray(str);
        if (jSONArray == null) {
            Log.d(TAG, "getTransFxByType error!");
            return;
        }
        for (int i = 0; i < jSONArray.length(); i++) {
            try {
                arrayList.add(jSONArray.getJSONObject(i).getString("fxName"));
            } catch (JSONException e) {
                e.printStackTrace();
            }
        }
    }

    public static ArrayList<NvsMusicFileDesc> readMusicFileList(Context context, String str) {
        StringBuilder sb = new StringBuilder();
        sb.append(str);
        sb.append("/info.json");
        String readFile = Utils.readFile(sb.toString(), context.getAssets());
        if (readFile == null) {
            Log.d(TAG, "read music info json error!");
            return new ArrayList<>();
        }
        ArrayList<NvsMusicFileDesc> arrayList = new ArrayList<>();
        try {
            JSONArray jSONArray = new JSONObject(readFile).getJSONArray("musicfiles");
            for (int i = 0; i < jSONArray.length(); i++) {
                arrayList.add(GetMusicFileFromJsonObject(jSONArray.getJSONObject(i), str));
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return arrayList;
    }

    public static long readMusicPoint(String str, ArrayList<NvsMusicPointDesc> arrayList, NvsTransDesc nvsTransDesc) {
        arrayList.clear();
        long j = -1;
        try {
            JSONObject jSONObject = new JSONObject(str);
            j = 1000 * jSONObject.getLong("music duration");
            JSONArray jSONArray = jSONObject.getJSONArray("points");
            for (int i = 0; i < jSONArray.length(); i++) {
                try {
                    arrayList.add(GetDescFromJsonObject(jSONArray.getJSONObject(i)));
                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }
            if (nvsTransDesc != null) {
                if (jSONObject.has("fullSizeTrans")) {
                    nvsTransDesc.m_fulltransList = new ArrayList<>();
                    getTransByType(jSONObject, "fullSizeTrans", nvsTransDesc.m_fulltransList);
                }
                if (jSONObject.has("halfSizeTrans")) {
                    nvsTransDesc.m_halftransList = new ArrayList<>();
                    getTransByType(jSONObject, "halfSizeTrans", nvsTransDesc.m_halftransList);
                }
                if (jSONObject.has("h-fSizeTrans")) {
                    nvsTransDesc.m_hftransList = new ArrayList<>();
                    getTransByType(jSONObject, "h-fSizeTrans", nvsTransDesc.m_hftransList);
                }
                if (jSONObject.has("fullFx")) {
                    nvsTransDesc.m_fulltransFxList = new ArrayList<>();
                    getTransFxByType(jSONObject, "fullFx", nvsTransDesc.m_fulltransFxList);
                }
                if (jSONObject.has("halfFx")) {
                    nvsTransDesc.m_halftransFxList = new ArrayList<>();
                    getTransFxByType(jSONObject, "halfFx", nvsTransDesc.m_halftransFxList);
                }
                if (jSONObject.has("h-fFx")) {
                    nvsTransDesc.m_hftransFxList = new ArrayList<>();
                    getTransFxByType(jSONObject, "h-fFx", nvsTransDesc.m_hftransFxList);
                }
                if (jSONObject.has("f-hFx")) {
                    nvsTransDesc.m_fhtransFxList = new ArrayList<>();
                    getTransFxByType(jSONObject, "f-hFx", nvsTransDesc.m_fhtransFxList);
                }
            }
            return j;
        } catch (JSONException e2) {
            e2.printStackTrace();
            return j;
        }
    }

    public static void sortFileByModifyTime(ArrayList<NvsImageFileDesc> arrayList) {
        Collections.sort(arrayList, new Comparator<NvsImageFileDesc>() {
            public int compare(NvsImageFileDesc nvsImageFileDesc, NvsImageFileDesc nvsImageFileDesc2) {
                if (nvsImageFileDesc.fileLastTime < 0) {
                    nvsImageFileDesc.fileLastTime = NvsParseHelper.getFileLastTime(nvsImageFileDesc.filePath);
                }
                if (nvsImageFileDesc2.fileLastTime < 0) {
                    nvsImageFileDesc2.fileLastTime = NvsParseHelper.getFileLastTime(nvsImageFileDesc2.filePath);
                }
                if (VERSION.SDK_INT >= 19) {
                    return Long.compare(nvsImageFileDesc.fileLastTime, nvsImageFileDesc2.fileLastTime);
                }
                if (nvsImageFileDesc.fileLastTime > nvsImageFileDesc2.fileLastTime) {
                    return 1;
                }
                return nvsImageFileDesc.fileLastTime == nvsImageFileDesc2.fileLastTime ? 0 : -1;
            }
        });
    }

    public static void sortFileByName(ArrayList<NvsImageFileDesc> arrayList) {
        Collections.sort(arrayList, new Comparator<NvsImageFileDesc>() {
            public int compare(NvsImageFileDesc nvsImageFileDesc, NvsImageFileDesc nvsImageFileDesc2) {
                return nvsImageFileDesc2.filePath.compareTo(nvsImageFileDesc.filePath);
            }
        });
    }

    public static void sortFileByScore(ArrayList<NvsImageFileDesc> arrayList) {
        Collections.sort(arrayList, new Comparator<NvsImageFileDesc>() {
            public int compare(NvsImageFileDesc nvsImageFileDesc, NvsImageFileDesc nvsImageFileDesc2) {
                if (VERSION.SDK_INT >= 19) {
                    return Float.compare(nvsImageFileDesc.score, nvsImageFileDesc2.score);
                }
                if (nvsImageFileDesc.score > nvsImageFileDesc2.score) {
                    return -1;
                }
                return nvsImageFileDesc.score == nvsImageFileDesc2.score ? 0 : 1;
            }
        });
    }
}
