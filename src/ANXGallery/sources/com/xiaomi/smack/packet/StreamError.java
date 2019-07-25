package com.xiaomi.smack.packet;

public class StreamError {
    private String code;

    public StreamError(String str) {
        this.code = str;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("stream:error (");
        sb.append(this.code);
        sb.append(")");
        return sb.toString();
    }
}
