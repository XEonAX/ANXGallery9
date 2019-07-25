package com.xiaomi.xmpush.thrift;

public enum RegistrationReason {
    RegIdExpired(0),
    PackageUnregistered(1),
    Init(2);
    
    private final int value;

    private RegistrationReason(int i) {
        this.value = i;
    }

    public static RegistrationReason findByValue(int i) {
        switch (i) {
            case 0:
                return RegIdExpired;
            case 1:
                return PackageUnregistered;
            case 2:
                return Init;
            default:
                return null;
        }
    }

    public int getValue() {
        return this.value;
    }
}
