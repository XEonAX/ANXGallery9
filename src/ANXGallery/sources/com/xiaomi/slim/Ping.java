package com.xiaomi.slim;

import com.miui.gallery.movie.utils.MovieStatUtils;
import java.nio.ByteBuffer;

public final class Ping extends Blob {
    public Ping() {
        setCmd("PING", null);
        setPacketID(MovieStatUtils.DOWNLOAD_SUCCESS);
        setChannelId(0);
    }

    public int getSerializedSize() {
        if (getPayload().length == 0) {
            return 0;
        }
        return super.getSerializedSize();
    }

    /* access modifiers changed from: 0000 */
    public ByteBuffer toByteArray(ByteBuffer byteBuffer) {
        return getPayload().length == 0 ? byteBuffer : super.toByteArray(byteBuffer);
    }
}
