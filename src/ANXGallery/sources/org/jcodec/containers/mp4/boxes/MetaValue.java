package org.jcodec.containers.mp4.boxes;

import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import org.jcodec.platform.Platform;
import org.keyczar.Keyczar;

public class MetaValue {
    private byte[] data;
    private int locale;
    private int type;

    private MetaValue(int i, int i2, byte[] bArr) {
        this.type = i;
        this.locale = i2;
        this.data = bArr;
    }

    public static MetaValue createOtherWithLocale(int i, int i2, byte[] bArr) {
        return new MetaValue(i, i2, bArr);
    }

    private double toDouble(byte[] bArr) {
        ByteBuffer wrap = ByteBuffer.wrap(bArr);
        wrap.order(ByteOrder.BIG_ENDIAN);
        return wrap.getDouble();
    }

    private float toFloat(byte[] bArr) {
        ByteBuffer wrap = ByteBuffer.wrap(bArr);
        wrap.order(ByteOrder.BIG_ENDIAN);
        return wrap.getFloat();
    }

    private int toInt16(byte[] bArr) {
        ByteBuffer wrap = ByteBuffer.wrap(bArr);
        wrap.order(ByteOrder.BIG_ENDIAN);
        return wrap.getShort();
    }

    private int toInt24(byte[] bArr) {
        ByteBuffer wrap = ByteBuffer.wrap(bArr);
        wrap.order(ByteOrder.BIG_ENDIAN);
        return (wrap.get() & 255) | ((wrap.getShort() & 65535) << 8);
    }

    private int toInt32(byte[] bArr) {
        ByteBuffer wrap = ByteBuffer.wrap(bArr);
        wrap.order(ByteOrder.BIG_ENDIAN);
        return wrap.getInt();
    }

    public byte[] getData() {
        return this.data;
    }

    public double getFloat() {
        if (this.type == 23) {
            return (double) toFloat(this.data);
        }
        if (this.type == 24) {
            return toDouble(this.data);
        }
        return 0.0d;
    }

    public int getInt() {
        if (this.type == 21 || this.type == 22) {
            switch (this.data.length) {
                case 1:
                    return this.data[0];
                case 2:
                    return toInt16(this.data);
                case 3:
                    return toInt24(this.data);
                case 4:
                    return toInt32(this.data);
            }
        }
        if (this.type == 65) {
            return this.data[0];
        }
        if (this.type == 66) {
            return toInt16(this.data);
        }
        if (this.type == 67) {
            return toInt32(this.data);
        }
        return 0;
    }

    public int getLocale() {
        return this.locale;
    }

    public String getString() {
        if (this.type == 1) {
            return Platform.stringFromCharset(this.data, Keyczar.DEFAULT_ENCODING);
        }
        if (this.type == 2) {
            return Platform.stringFromCharset(this.data, "UTF-16BE");
        }
        return null;
    }

    public int getType() {
        return this.type;
    }

    public boolean isFloat() {
        return this.type == 23 || this.type == 24;
    }

    public boolean isInt() {
        return this.type == 21 || this.type == 22 || this.type == 65 || this.type == 66 || this.type == 67;
    }

    public boolean isString() {
        return this.type == 1 || this.type == 2;
    }

    public String toString() {
        return isInt() ? String.valueOf(getInt()) : isFloat() ? String.valueOf(getFloat()) : isString() ? String.valueOf(getString()) : "BLOB";
    }
}
