package org.apache.thrift.protocol;

public final class TList {
    public final byte elemType;
    public final int size;

    public TList() {
        this(0, 0);
    }

    public TList(byte b, int i) {
        this.elemType = b;
        this.size = i;
    }
}
