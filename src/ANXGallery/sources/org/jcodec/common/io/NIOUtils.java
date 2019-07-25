package org.jcodec.common.io;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.ReadableByteChannel;
import org.jcodec.platform.Platform;

public class NIOUtils {
    public static ByteBuffer fetchFromChannel(ReadableByteChannel readableByteChannel, int i) throws IOException {
        ByteBuffer allocate = ByteBuffer.allocate(i);
        readFromChannel(readableByteChannel, allocate);
        allocate.flip();
        return allocate;
    }

    public static final ByteBuffer read(ByteBuffer byteBuffer, int i) {
        ByteBuffer duplicate = byteBuffer.duplicate();
        int position = byteBuffer.position() + i;
        duplicate.limit(position);
        byteBuffer.position(position);
        return duplicate;
    }

    public static ByteBuffer readBuf(ByteBuffer byteBuffer) {
        ByteBuffer duplicate = byteBuffer.duplicate();
        byteBuffer.position(byteBuffer.limit());
        return duplicate;
    }

    public static int readFromChannel(ReadableByteChannel readableByteChannel, ByteBuffer byteBuffer) throws IOException {
        int position = byteBuffer.position();
        while (readableByteChannel.read(byteBuffer) != -1) {
            if (!byteBuffer.hasRemaining()) {
                break;
            }
        }
        return byteBuffer.position() - position;
    }

    public static String readString(ByteBuffer byteBuffer, int i) {
        return Platform.stringFromBytes(toArray(read(byteBuffer, i)));
    }

    public static FileChannelWrapper readableChannel(File file) throws FileNotFoundException {
        return new FileChannelWrapper(new FileInputStream(file).getChannel());
    }

    public static int skip(ByteBuffer byteBuffer, int i) {
        int min = Math.min(byteBuffer.remaining(), i);
        byteBuffer.position(byteBuffer.position() + min);
        return min;
    }

    public static byte[] toArray(ByteBuffer byteBuffer) {
        byte[] bArr = new byte[byteBuffer.remaining()];
        byteBuffer.duplicate().get(bArr);
        return bArr;
    }

    public static byte[] toArrayL(ByteBuffer byteBuffer, int i) {
        byte[] bArr = new byte[Math.min(byteBuffer.remaining(), i)];
        byteBuffer.duplicate().get(bArr);
        return bArr;
    }

    public static void write(ByteBuffer byteBuffer, ByteBuffer byteBuffer2) {
        if (byteBuffer2.hasArray()) {
            byteBuffer.put(byteBuffer2.array(), byteBuffer2.arrayOffset() + byteBuffer2.position(), Math.min(byteBuffer.remaining(), byteBuffer2.remaining()));
        } else {
            byteBuffer.put(toArrayL(byteBuffer2, byteBuffer.remaining()));
        }
    }
}
