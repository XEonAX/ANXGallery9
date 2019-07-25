package org.jcodec.containers.mp4.boxes;

import java.nio.ByteBuffer;
import org.jcodec.common.JCodecUtil2;
import org.jcodec.common.io.NIOUtils;
import org.jcodec.platform.Platform;

public class Header {
    public static final byte[] FOURCC_FREE = {102, 114, 101, 101};
    private String fourcc;
    private boolean lng;
    private long size;

    public Header(String str) {
        this.fourcc = str;
    }

    public static Header createHeader(String str, long j) {
        Header header = new Header(str);
        header.size = j;
        return header;
    }

    public static int estimateHeaderSize(int i) {
        return ((long) (i + 8)) > 4294967296L ? 16 : 8;
    }

    public static Header newHeader(String str, long j, boolean z) {
        Header header = new Header(str);
        header.size = j;
        header.lng = z;
        return header;
    }

    public static Header read(ByteBuffer byteBuffer) {
        long j = 0;
        while (byteBuffer.remaining() >= 4) {
            j = Platform.unsignedInt(byteBuffer.getInt());
            if (j != 0) {
                break;
            }
        }
        if (byteBuffer.remaining() < 4 || (j < 8 && j != 1)) {
            return null;
        }
        String readString = NIOUtils.readString(byteBuffer, 4);
        boolean z = false;
        if (j == 1) {
            if (byteBuffer.remaining() < 8) {
                return null;
            }
            z = true;
            j = byteBuffer.getLong();
        }
        return newHeader(readString, j, z);
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        Header header = (Header) obj;
        if (this.fourcc == null) {
            if (header.fourcc != null) {
                return false;
            }
        } else if (!this.fourcc.equals(header.fourcc)) {
            return false;
        }
        return true;
    }

    public long getBodySize() {
        return this.size - headerSize();
    }

    public String getFourcc() {
        return this.fourcc;
    }

    public long getSize() {
        return this.size;
    }

    public int hashCode() {
        return 31 + (this.fourcc == null ? 0 : this.fourcc.hashCode());
    }

    public long headerSize() {
        return (this.lng || this.size > 4294967296L) ? 16 : 8;
    }

    public void setBodySize(int i) {
        this.size = ((long) i) + headerSize();
    }

    public void write(ByteBuffer byteBuffer) {
        if (this.size > 4294967296L) {
            byteBuffer.putInt(1);
        } else {
            byteBuffer.putInt((int) this.size);
        }
        byte[] asciiString = JCodecUtil2.asciiString(this.fourcc);
        if (asciiString == null || asciiString.length != 4) {
            byteBuffer.put(FOURCC_FREE);
        } else {
            byteBuffer.put(asciiString);
        }
        if (this.size > 4294967296L) {
            byteBuffer.putLong(this.size);
        }
    }
}
