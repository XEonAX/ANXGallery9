package com.meicam.sdk;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Map;
import java.util.Map.Entry;

public class NvsHttpsRequest {
    public String httpsRequest(String str, Map<String, String> map) {
        StringBuffer stringBuffer = new StringBuffer();
        StringBuilder sb = new StringBuilder();
        sb.append(str);
        sb.append("?");
        String sb2 = sb.toString();
        int size = map.size();
        int i = 0;
        for (Entry entry : map.entrySet()) {
            StringBuilder sb3 = new StringBuilder();
            sb3.append(sb2);
            sb3.append((String) entry.getKey());
            sb3.append("=");
            sb3.append((String) entry.getValue());
            sb2 = sb3.toString();
            i++;
            if (i < size) {
                StringBuilder sb4 = new StringBuilder();
                sb4.append(sb2);
                sb4.append("&");
                sb2 = sb4.toString();
            }
        }
        try {
            HttpURLConnection httpURLConnection = (HttpURLConnection) new URL(sb2).openConnection();
            httpURLConnection.setRequestMethod("GET");
            httpURLConnection.setUseCaches(false);
            httpURLConnection.setConnectTimeout(5000);
            httpURLConnection.connect();
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(httpURLConnection.getInputStream()));
            while (true) {
                String readLine = bufferedReader.readLine();
                if (readLine == null) {
                    break;
                }
                stringBuffer.append(readLine);
            }
            bufferedReader.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return stringBuffer.toString();
    }
}
