package com.xiaomi.smack.packet;

import android.os.Bundle;
import com.xiaomi.smack.util.StringUtils;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

public class IQ extends Packet {
    private final Map<String, String> attributes = new HashMap();
    private Type type = Type.GET;

    public static class Type {
        public static final Type COMMAND = new Type("command");
        public static final Type ERROR = new Type("error");
        public static final Type GET = new Type("get");
        public static final Type RESULT = new Type("result");
        public static final Type SET = new Type("set");
        private String value;

        private Type(String str) {
            this.value = str;
        }

        public static Type fromString(String str) {
            if (str == null) {
                return null;
            }
            String lowerCase = str.toLowerCase();
            if (GET.toString().equals(lowerCase)) {
                return GET;
            }
            if (SET.toString().equals(lowerCase)) {
                return SET;
            }
            if (ERROR.toString().equals(lowerCase)) {
                return ERROR;
            }
            if (RESULT.toString().equals(lowerCase)) {
                return RESULT;
            }
            if (COMMAND.toString().equals(lowerCase)) {
                return COMMAND;
            }
            return null;
        }

        public String toString() {
            return this.value;
        }
    }

    public IQ() {
    }

    public IQ(Bundle bundle) {
        super(bundle);
        if (bundle.containsKey("ext_iq_type")) {
            this.type = Type.fromString(bundle.getString("ext_iq_type"));
        }
    }

    public String getChildElementXML() {
        return null;
    }

    public Type getType() {
        return this.type;
    }

    public synchronized void setAttributes(Map<String, String> map) {
        this.attributes.putAll(map);
    }

    public void setType(Type type2) {
        if (type2 == null) {
            this.type = Type.GET;
        } else {
            this.type = type2;
        }
    }

    public Bundle toBundle() {
        Bundle bundle = super.toBundle();
        if (this.type != null) {
            bundle.putString("ext_iq_type", this.type.toString());
        }
        return bundle;
    }

    public String toXML() {
        StringBuilder sb = new StringBuilder();
        sb.append("<iq ");
        if (getPacketID() != null) {
            StringBuilder sb2 = new StringBuilder();
            sb2.append("id=\"");
            sb2.append(getPacketID());
            sb2.append("\" ");
            sb.append(sb2.toString());
        }
        if (getTo() != null) {
            sb.append("to=\"");
            sb.append(StringUtils.escapeForXML(getTo()));
            sb.append("\" ");
        }
        if (getFrom() != null) {
            sb.append("from=\"");
            sb.append(StringUtils.escapeForXML(getFrom()));
            sb.append("\" ");
        }
        if (getChannelId() != null) {
            sb.append("chid=\"");
            sb.append(StringUtils.escapeForXML(getChannelId()));
            sb.append("\" ");
        }
        for (Entry entry : this.attributes.entrySet()) {
            sb.append(StringUtils.escapeForXML((String) entry.getKey()));
            sb.append("=\"");
            sb.append(StringUtils.escapeForXML((String) entry.getValue()));
            sb.append("\" ");
        }
        if (this.type == null) {
            sb.append("type=\"get\">");
        } else {
            sb.append("type=\"");
            sb.append(getType());
            sb.append("\">");
        }
        String childElementXML = getChildElementXML();
        if (childElementXML != null) {
            sb.append(childElementXML);
        }
        sb.append(getExtensionsXML());
        XMPPError error = getError();
        if (error != null) {
            sb.append(error.toXML());
        }
        sb.append("</iq>");
        return sb.toString();
    }
}
