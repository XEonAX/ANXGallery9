package com.xiaomi.smack.packet;

import android.os.Bundle;
import android.text.TextUtils;
import com.xiaomi.smack.util.StringUtils;

public class Message extends Packet {
    private String fseq = "";
    private String language;
    private String mAppId;
    private String mBody;
    private String mBodyEncoding;
    private boolean mEncrypted = false;
    private String mSubject;
    private boolean mTransient = false;
    private String mseq = "";
    private String seq = "";
    private String status = "";
    private String thread = null;
    private String type = null;

    public Message() {
    }

    public Message(Bundle bundle) {
        super(bundle);
        this.type = bundle.getString("ext_msg_type");
        this.language = bundle.getString("ext_msg_lang");
        this.thread = bundle.getString("ext_msg_thread");
        this.mSubject = bundle.getString("ext_msg_sub");
        this.mBody = bundle.getString("ext_msg_body");
        this.mBodyEncoding = bundle.getString("ext_body_encode");
        this.mAppId = bundle.getString("ext_msg_appid");
        this.mTransient = bundle.getBoolean("ext_msg_trans", false);
        this.mEncrypted = bundle.getBoolean("ext_msg_encrypt", false);
        this.seq = bundle.getString("ext_msg_seq");
        this.mseq = bundle.getString("ext_msg_mseq");
        this.fseq = bundle.getString("ext_msg_fseq");
        this.status = bundle.getString("ext_msg_status");
    }

    public boolean equals(Object obj) {
        boolean z = true;
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        Message message = (Message) obj;
        if (!super.equals(message)) {
            return false;
        }
        if (this.mBody == null ? message.mBody != null : !this.mBody.equals(message.mBody)) {
            return false;
        }
        if (this.language == null ? message.language != null : !this.language.equals(message.language)) {
            return false;
        }
        if (this.mSubject == null ? message.mSubject != null : !this.mSubject.equals(message.mSubject)) {
            return false;
        }
        if (this.thread == null ? message.thread != null : !this.thread.equals(message.thread)) {
            return false;
        }
        if (this.type != message.type) {
            z = false;
        }
        return z;
    }

    public String getAppId() {
        return this.mAppId;
    }

    public String getFSeq() {
        return this.fseq;
    }

    public String getLanguage() {
        return this.language;
    }

    public String getMSeq() {
        return this.mseq;
    }

    public String getSeq() {
        return this.seq;
    }

    public String getStatus() {
        return this.status;
    }

    public String getType() {
        return this.type;
    }

    public int hashCode() {
        int i = 0;
        int hashCode = (((((((this.type != null ? this.type.hashCode() : 0) * 31) + (this.mBody != null ? this.mBody.hashCode() : 0)) * 31) + (this.thread != null ? this.thread.hashCode() : 0)) * 31) + (this.language != null ? this.language.hashCode() : 0)) * 31;
        if (this.mSubject != null) {
            i = this.mSubject.hashCode();
        }
        return hashCode + i;
    }

    public void setAppId(String str) {
        this.mAppId = str;
    }

    public void setBody(String str) {
        this.mBody = str;
    }

    public void setBody(String str, String str2) {
        this.mBody = str;
        this.mBodyEncoding = str2;
    }

    public void setEncrypted(boolean z) {
        this.mEncrypted = z;
    }

    public void setFSeq(String str) {
        this.fseq = str;
    }

    public void setIsTransient(boolean z) {
        this.mTransient = z;
    }

    public void setLanguage(String str) {
        this.language = str;
    }

    public void setMSeq(String str) {
        this.mseq = str;
    }

    public void setSeq(String str) {
        this.seq = str;
    }

    public void setStatus(String str) {
        this.status = str;
    }

    public void setSubject(String str) {
        this.mSubject = str;
    }

    public void setThread(String str) {
        this.thread = str;
    }

    public void setType(String str) {
        this.type = str;
    }

    public Bundle toBundle() {
        Bundle bundle = super.toBundle();
        if (!TextUtils.isEmpty(this.type)) {
            bundle.putString("ext_msg_type", this.type);
        }
        if (this.language != null) {
            bundle.putString("ext_msg_lang", this.language);
        }
        if (this.mSubject != null) {
            bundle.putString("ext_msg_sub", this.mSubject);
        }
        if (this.mBody != null) {
            bundle.putString("ext_msg_body", this.mBody);
        }
        if (!TextUtils.isEmpty(this.mBodyEncoding)) {
            bundle.putString("ext_body_encode", this.mBodyEncoding);
        }
        if (this.thread != null) {
            bundle.putString("ext_msg_thread", this.thread);
        }
        if (this.mAppId != null) {
            bundle.putString("ext_msg_appid", this.mAppId);
        }
        if (this.mTransient) {
            bundle.putBoolean("ext_msg_trans", true);
        }
        if (!TextUtils.isEmpty(this.seq)) {
            bundle.putString("ext_msg_seq", this.seq);
        }
        if (!TextUtils.isEmpty(this.mseq)) {
            bundle.putString("ext_msg_mseq", this.mseq);
        }
        if (!TextUtils.isEmpty(this.fseq)) {
            bundle.putString("ext_msg_fseq", this.fseq);
        }
        if (this.mEncrypted) {
            bundle.putBoolean("ext_msg_encrypt", true);
        }
        if (!TextUtils.isEmpty(this.status)) {
            bundle.putString("ext_msg_status", this.status);
        }
        return bundle;
    }

    public String toXML() {
        StringBuilder sb = new StringBuilder();
        sb.append("<message");
        if (getXmlns() != null) {
            sb.append(" xmlns=\"");
            sb.append(getXmlns());
            sb.append("\"");
        }
        if (this.language != null) {
            sb.append(" xml:lang=\"");
            sb.append(getLanguage());
            sb.append("\"");
        }
        if (getPacketID() != null) {
            sb.append(" id=\"");
            sb.append(getPacketID());
            sb.append("\"");
        }
        if (getTo() != null) {
            sb.append(" to=\"");
            sb.append(StringUtils.escapeForXML(getTo()));
            sb.append("\"");
        }
        if (!TextUtils.isEmpty(getSeq())) {
            sb.append(" seq=\"");
            sb.append(getSeq());
            sb.append("\"");
        }
        if (!TextUtils.isEmpty(getMSeq())) {
            sb.append(" mseq=\"");
            sb.append(getMSeq());
            sb.append("\"");
        }
        if (!TextUtils.isEmpty(getFSeq())) {
            sb.append(" fseq=\"");
            sb.append(getFSeq());
            sb.append("\"");
        }
        if (!TextUtils.isEmpty(getStatus())) {
            sb.append(" status=\"");
            sb.append(getStatus());
            sb.append("\"");
        }
        if (getFrom() != null) {
            sb.append(" from=\"");
            sb.append(StringUtils.escapeForXML(getFrom()));
            sb.append("\"");
        }
        if (getChannelId() != null) {
            sb.append(" chid=\"");
            sb.append(StringUtils.escapeForXML(getChannelId()));
            sb.append("\"");
        }
        if (this.mTransient) {
            sb.append(" transient=\"true\"");
        }
        if (!TextUtils.isEmpty(this.mAppId)) {
            sb.append(" appid=\"");
            sb.append(getAppId());
            sb.append("\"");
        }
        if (!TextUtils.isEmpty(this.type)) {
            sb.append(" type=\"");
            sb.append(this.type);
            sb.append("\"");
        }
        if (this.mEncrypted) {
            sb.append(" s=\"1\"");
        }
        sb.append(">");
        if (this.mSubject != null) {
            sb.append("<subject>");
            sb.append(StringUtils.escapeForXML(this.mSubject));
            sb.append("</subject>");
        }
        if (this.mBody != null) {
            sb.append("<body");
            if (!TextUtils.isEmpty(this.mBodyEncoding)) {
                sb.append(" encode=\"");
                sb.append(this.mBodyEncoding);
                sb.append("\"");
            }
            sb.append(">");
            sb.append(StringUtils.escapeForXML(this.mBody));
            sb.append("</body>");
        }
        if (this.thread != null) {
            sb.append("<thread>");
            sb.append(this.thread);
            sb.append("</thread>");
        }
        if ("error".equalsIgnoreCase(this.type)) {
            XMPPError error = getError();
            if (error != null) {
                sb.append(error.toXML());
            }
        }
        sb.append(getExtensionsXML());
        sb.append("</message>");
        return sb.toString();
    }
}
