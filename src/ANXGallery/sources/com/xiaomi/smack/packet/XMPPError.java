package com.xiaomi.smack.packet;

import android.os.Bundle;
import android.os.Parcelable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class XMPPError {
    private List<CommonPacketExtension> applicationExtensions = null;
    private int code;
    private String condition;
    private String message;
    private String reason;
    private String type;

    public static class Condition {
        public static final Condition bad_request = new Condition("bad-request");
        public static final Condition conflict = new Condition("conflict");
        public static final Condition feature_not_implemented = new Condition("feature-not-implemented");
        public static final Condition forbidden = new Condition("forbidden");
        public static final Condition gone = new Condition("gone");
        public static final Condition interna_server_error = new Condition("internal-server-error");
        public static final Condition item_not_found = new Condition("item-not-found");
        public static final Condition jid_malformed = new Condition("jid-malformed");
        public static final Condition no_acceptable = new Condition("not-acceptable");
        public static final Condition not_allowed = new Condition("not-allowed");
        public static final Condition not_authorized = new Condition("not-authorized");
        public static final Condition payment_required = new Condition("payment-required");
        public static final Condition recipient_unavailable = new Condition("recipient-unavailable");
        public static final Condition redirect = new Condition("redirect");
        public static final Condition registration_required = new Condition("registration-required");
        public static final Condition remote_server_error = new Condition("remote-server-error");
        public static final Condition remote_server_not_found = new Condition("remote-server-not-found");
        public static final Condition remote_server_timeout = new Condition("remote-server-timeout");
        public static final Condition request_timeout = new Condition("request-timeout");
        public static final Condition resource_constraint = new Condition("resource-constraint");
        public static final Condition service_unavailable = new Condition("service-unavailable");
        public static final Condition subscription_required = new Condition("subscription-required");
        public static final Condition undefined_condition = new Condition("undefined-condition");
        public static final Condition unexpected_request = new Condition("unexpected-request");
        /* access modifiers changed from: private */
        public String value;

        public Condition(String str) {
            this.value = str;
        }

        public String toString() {
            return this.value;
        }
    }

    public XMPPError(int i, String str, String str2, String str3, String str4, List<CommonPacketExtension> list) {
        this.code = i;
        this.type = str;
        this.reason = str2;
        this.condition = str3;
        this.message = str4;
        this.applicationExtensions = list;
    }

    public XMPPError(Bundle bundle) {
        this.code = bundle.getInt("ext_err_code");
        if (bundle.containsKey("ext_err_type")) {
            this.type = bundle.getString("ext_err_type");
        }
        this.condition = bundle.getString("ext_err_cond");
        this.reason = bundle.getString("ext_err_reason");
        this.message = bundle.getString("ext_err_msg");
        Parcelable[] parcelableArray = bundle.getParcelableArray("ext_exts");
        if (parcelableArray != null) {
            this.applicationExtensions = new ArrayList(parcelableArray.length);
            for (Parcelable parcelable : parcelableArray) {
                CommonPacketExtension parseFromBundle = CommonPacketExtension.parseFromBundle((Bundle) parcelable);
                if (parseFromBundle != null) {
                    this.applicationExtensions.add(parseFromBundle);
                }
            }
        }
    }

    public XMPPError(Condition condition2) {
        init(condition2);
        this.message = null;
    }

    private void init(Condition condition2) {
        this.condition = condition2.value;
    }

    public synchronized List<CommonPacketExtension> getExtensions() {
        if (this.applicationExtensions == null) {
            return Collections.emptyList();
        }
        return Collections.unmodifiableList(this.applicationExtensions);
    }

    public Bundle toBundle() {
        Bundle bundle = new Bundle();
        if (this.type != null) {
            bundle.putString("ext_err_type", this.type);
        }
        bundle.putInt("ext_err_code", this.code);
        if (this.reason != null) {
            bundle.putString("ext_err_reason", this.reason);
        }
        if (this.condition != null) {
            bundle.putString("ext_err_cond", this.condition);
        }
        if (this.message != null) {
            bundle.putString("ext_err_msg", this.message);
        }
        if (this.applicationExtensions != null) {
            Bundle[] bundleArr = new Bundle[this.applicationExtensions.size()];
            int i = 0;
            for (CommonPacketExtension bundle2 : this.applicationExtensions) {
                Bundle bundle3 = bundle2.toBundle();
                if (bundle3 != null) {
                    int i2 = i + 1;
                    bundleArr[i] = bundle3;
                    i = i2;
                }
            }
            bundle.putParcelableArray("ext_exts", bundleArr);
        }
        return bundle;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        if (this.condition != null) {
            sb.append(this.condition);
        }
        sb.append("(");
        sb.append(this.code);
        sb.append(")");
        if (this.message != null) {
            sb.append(" ");
            sb.append(this.message);
        }
        return sb.toString();
    }

    public String toXML() {
        StringBuilder sb = new StringBuilder();
        sb.append("<error code=\"");
        sb.append(this.code);
        sb.append("\"");
        if (this.type != null) {
            sb.append(" type=\"");
            sb.append(this.type);
            sb.append("\"");
        }
        if (this.reason != null) {
            sb.append(" reason=\"");
            sb.append(this.reason);
            sb.append("\"");
        }
        sb.append(">");
        if (this.condition != null) {
            sb.append("<");
            sb.append(this.condition);
            sb.append(" xmlns=\"urn:ietf:params:xml:ns:xmpp-stanzas\"/>");
        }
        if (this.message != null) {
            sb.append("<text xml:lang=\"en\" xmlns=\"urn:ietf:params:xml:ns:xmpp-stanzas\">");
            sb.append(this.message);
            sb.append("</text>");
        }
        for (PacketExtension xml : getExtensions()) {
            sb.append(xml.toXML());
        }
        sb.append("</error>");
        return sb.toString();
    }
}
