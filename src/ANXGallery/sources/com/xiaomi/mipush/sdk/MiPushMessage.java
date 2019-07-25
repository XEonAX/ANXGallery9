package com.xiaomi.mipush.sdk;

import java.util.HashMap;
import java.util.Map;

public class MiPushMessage implements PushMessageInterface {
    private static final long serialVersionUID = 1;
    private String alias;
    private boolean arrived = false;
    private String category;
    private String content;
    private String description;
    private HashMap<String, String> extra = new HashMap<>();
    private boolean isNotified;
    private String messageId;
    private int messageType;
    private int notifyId;
    private int notifyType;
    private int passThrough;
    private String title;
    private String topic;
    private String userAccount;

    public String getAlias() {
        return this.alias;
    }

    public String getCategory() {
        return this.category;
    }

    public String getContent() {
        return this.content;
    }

    public Map<String, String> getExtra() {
        return this.extra;
    }

    public String getMessageId() {
        return this.messageId;
    }

    public int getPassThrough() {
        return this.passThrough;
    }

    public String getTopic() {
        return this.topic;
    }

    public String getUserAccount() {
        return this.userAccount;
    }

    public boolean isArrivedMessage() {
        return this.arrived;
    }

    public boolean isNotified() {
        return this.isNotified;
    }

    public void setAlias(String str) {
        this.alias = str;
    }

    public void setArrivedMessage(boolean z) {
        this.arrived = z;
    }

    public void setCategory(String str) {
        this.category = str;
    }

    public void setContent(String str) {
        this.content = str;
    }

    public void setDescription(String str) {
        this.description = str;
    }

    public void setExtra(Map<String, String> map) {
        this.extra.clear();
        if (map != null) {
            this.extra.putAll(map);
        }
    }

    public void setMessageId(String str) {
        this.messageId = str;
    }

    public void setMessageType(int i) {
        this.messageType = i;
    }

    public void setNotified(boolean z) {
        this.isNotified = z;
    }

    public void setNotifyId(int i) {
        this.notifyId = i;
    }

    public void setNotifyType(int i) {
        this.notifyType = i;
    }

    public void setPassThrough(int i) {
        this.passThrough = i;
    }

    public void setTitle(String str) {
        this.title = str;
    }

    public void setTopic(String str) {
        this.topic = str;
    }

    public void setUserAccount(String str) {
        this.userAccount = str;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("messageId={");
        sb.append(this.messageId);
        sb.append("},passThrough={");
        sb.append(this.passThrough);
        sb.append("},alias={");
        sb.append(this.alias);
        sb.append("},topic={");
        sb.append(this.topic);
        sb.append("},userAccount={");
        sb.append(this.userAccount);
        sb.append("},content={");
        sb.append(this.content);
        sb.append("},description={");
        sb.append(this.description);
        sb.append("},title={");
        sb.append(this.title);
        sb.append("},isNotified={");
        sb.append(this.isNotified);
        sb.append("},notifyId={");
        sb.append(this.notifyId);
        sb.append("},notifyType={");
        sb.append(this.notifyType);
        sb.append("}, category={");
        sb.append(this.category);
        sb.append("}, extra={");
        sb.append(this.extra);
        sb.append("}");
        return sb.toString();
    }
}
