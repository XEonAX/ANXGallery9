package com.xiaomi.mipush.sdk;

import java.util.List;

public class MiPushCommandMessage implements PushMessageInterface {
    private static final long serialVersionUID = 1;
    private String category;
    private String command;
    private List<String> commandArguments;
    private String reason;
    private long resultCode;

    public String getCategory() {
        return this.category;
    }

    public String getCommand() {
        return this.command;
    }

    public List<String> getCommandArguments() {
        return this.commandArguments;
    }

    public String getReason() {
        return this.reason;
    }

    public long getResultCode() {
        return this.resultCode;
    }

    public void setCategory(String str) {
        this.category = str;
    }

    public void setCommand(String str) {
        this.command = str;
    }

    public void setCommandArguments(List<String> list) {
        this.commandArguments = list;
    }

    public void setReason(String str) {
        this.reason = str;
    }

    public void setResultCode(long j) {
        this.resultCode = j;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("command={");
        sb.append(this.command);
        sb.append("}, resultCode={");
        sb.append(this.resultCode);
        sb.append("}, reason={");
        sb.append(this.reason);
        sb.append("}, category={");
        sb.append(this.category);
        sb.append("}, commandArguments={");
        sb.append(this.commandArguments);
        sb.append("}");
        return sb.toString();
    }
}
