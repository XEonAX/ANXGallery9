package com.xiaomi.xmpush.thrift;

public enum BootModeType {
    START(0),
    BIND(1);
    
    private final int value;

    private BootModeType(int i) {
        this.value = i;
    }

    public int getValue() {
        return this.value;
    }
}
