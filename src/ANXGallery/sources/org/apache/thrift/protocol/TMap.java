package org.apache.thrift.protocol;

public final class TMap {
    public final byte keyType;
    public final int size;
    public final byte valueType;

    public TMap() {
        this(0, 0, 0);
    }

    public TMap(byte b, byte b2, int i) {
        this.keyType = b;
        this.valueType = b2;
        this.size = i;
    }
}
