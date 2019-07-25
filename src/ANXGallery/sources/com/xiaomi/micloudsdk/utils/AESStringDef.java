package com.xiaomi.micloudsdk.utils;

import android.text.TextUtils;

public class AESStringDef {
    private String IV;
    private String data;
    private String version;

    static class InvalidAESDataException extends Exception {
        InvalidAESDataException(String str) {
            super(str);
        }
    }

    private AESStringDef() {
    }

    public static AESStringDef getInstance(String str) throws InvalidAESDataException {
        String[] split = TextUtils.split(str, ":");
        if (split == null || split.length != 3) {
            StringBuilder sb = new StringBuilder();
            sb.append("invalid encrypt string format,the correct format is version:iv:content but original string is:");
            sb.append(str);
            throw new InvalidAESDataException(sb.toString());
        }
        AESStringDef aESStringDef = new AESStringDef();
        aESStringDef.version = split[0];
        aESStringDef.IV = split[1];
        aESStringDef.data = split[2];
        return aESStringDef;
    }

    public static AESStringDef getInstance(String str, String str2, String str3) throws InvalidAESDataException {
        if (TextUtils.isEmpty(str) || TextUtils.isEmpty(str2) || TextUtils.isEmpty(str3)) {
            throw new InvalidAESDataException("invalid AES data");
        }
        AESStringDef aESStringDef = new AESStringDef();
        aESStringDef.version = str;
        aESStringDef.IV = str2;
        aESStringDef.data = str3;
        return aESStringDef;
    }

    public String getData() {
        return this.data;
    }

    public String getIV() {
        return this.IV;
    }

    public String getVersion() {
        return this.version;
    }

    public String toString() {
        return String.format("%s:%s:%s", new Object[]{this.version, this.IV, this.data});
    }
}
