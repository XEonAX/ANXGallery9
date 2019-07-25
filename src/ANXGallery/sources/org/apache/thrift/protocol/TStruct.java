package org.apache.thrift.protocol;

public final class TStruct {
    public final String name;

    public TStruct() {
        this("");
    }

    public TStruct(String str) {
        this.name = str;
    }
}
