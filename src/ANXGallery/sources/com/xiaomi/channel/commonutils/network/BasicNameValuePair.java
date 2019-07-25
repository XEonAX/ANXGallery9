package com.xiaomi.channel.commonutils.network;

public class BasicNameValuePair implements NameValuePair {
    private final String name;
    private final String value;

    public BasicNameValuePair(String str, String str2) {
        if (str != null) {
            this.name = str;
            this.value = str2;
            return;
        }
        throw new IllegalArgumentException("Name may not be null");
    }

    public String getName() {
        return this.name;
    }

    public String getValue() {
        return this.value;
    }
}
