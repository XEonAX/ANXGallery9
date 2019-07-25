package com.xiaomi.xmpush.thrift;

public enum ConfigListType {
    MISC_CONFIG(1),
    PLUGIN_CONFIG(2);
    
    private final int value;

    private ConfigListType(int i) {
        this.value = i;
    }

    public static ConfigListType findByValue(int i) {
        switch (i) {
            case 1:
                return MISC_CONFIG;
            case 2:
                return PLUGIN_CONFIG;
            default:
                return null;
        }
    }

    public int getValue() {
        return this.value;
    }
}
