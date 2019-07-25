package com.xiaomi.network;

import java.net.InetSocketAddress;

public final class Host {
    private String hostAddress;
    private int port;

    public Host(String str, int i) {
        this.hostAddress = str;
        this.port = i;
    }

    public static InetSocketAddress from(String str, int i) {
        Host parse = parse(str, i);
        return new InetSocketAddress(parse.getHost(), parse.getPort());
    }

    public static Host parse(String str, int i) {
        String str2;
        int lastIndexOf = str.lastIndexOf(":");
        if (lastIndexOf != -1) {
            str2 = str.substring(0, lastIndexOf);
            try {
                int parseInt = Integer.parseInt(str.substring(lastIndexOf + 1));
                if (parseInt > 0) {
                    i = parseInt;
                }
            } catch (NumberFormatException unused) {
            }
        } else {
            str2 = str;
        }
        return new Host(str2, i);
    }

    public String getHost() {
        return this.hostAddress;
    }

    public int getPort() {
        return this.port;
    }

    public String toString() {
        if (this.port <= 0) {
            return this.hostAddress;
        }
        StringBuilder sb = new StringBuilder();
        sb.append(this.hostAddress);
        sb.append(":");
        sb.append(this.port);
        return sb.toString();
    }
}
