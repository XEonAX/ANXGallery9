package org.apache.thrift.protocol;

public final class TSet {
    public final byte elemType;
    public final int size;

    public TSet() {
        this(0, 0);
    }

    public TSet(byte b, int i) {
        this.elemType = b;
        this.size = i;
    }
}
