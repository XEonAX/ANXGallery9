package org.jcodec.containers.mp4.demuxer;

import android.support.annotation.Keep;
import java.nio.ByteBuffer;
import org.jcodec.common.Fourcc;
import org.jcodec.common.io.NIOUtils;
import org.jcodec.platform.Platform;

public class MP4Demuxer {
    @Keep
    public static int probe(ByteBuffer byteBuffer) {
        ByteBuffer duplicate = byteBuffer.duplicate();
        int i = 0;
        int i2 = 0;
        while (true) {
            int i3 = 8;
            if (duplicate.remaining() < 8) {
                break;
            }
            long unsignedInt = Platform.unsignedInt(duplicate.getInt());
            int i4 = duplicate.getInt();
            if (unsignedInt != 1) {
                if (unsignedInt < 8) {
                    break;
                }
            } else {
                unsignedInt = duplicate.getLong();
                i3 = 16;
            }
            if ((i4 == Fourcc.ftyp && unsignedInt < 64) || ((i4 == Fourcc.moov && unsignedInt < 104857600) || i4 == Fourcc.free || i4 == Fourcc.mdat || i4 == Fourcc.wide)) {
                i++;
            }
            i2++;
            if (unsignedInt >= 2147483647L) {
                break;
            }
            NIOUtils.skip(duplicate, (int) (unsignedInt - ((long) i3)));
        }
        if (i2 == 0) {
            return 0;
        }
        return (i * 100) / i2;
    }
}
