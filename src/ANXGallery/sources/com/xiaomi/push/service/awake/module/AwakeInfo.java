package com.xiaomi.push.service.awake.module;

public class AwakeInfo {
    private String mAction;
    private String mAwakeInfo;
    private String mClassName;
    private String mTargetPackageName;

    public String getAction() {
        return this.mAction;
    }

    public String getAwakeInfo() {
        return this.mAwakeInfo;
    }

    public String getClassName() {
        return this.mClassName;
    }

    public String getTargetPackageName() {
        return this.mTargetPackageName;
    }

    public void setAction(String str) {
        this.mAction = str;
    }

    public void setAwakeInfo(String str) {
        this.mAwakeInfo = str;
    }

    public void setClassName(String str) {
        this.mClassName = str;
    }

    public void setTargetPackageName(String str) {
        this.mTargetPackageName = str;
    }
}
