package com.xiaomi.slim;

import android.os.Build;
import android.os.Build.VERSION;
import com.miui.gallery.assistant.jni.filter.BaiduSceneResult;
import com.xiaomi.channel.commonutils.android.SystemUtils;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.push.protobuf.ChannelMessage.PushServiceConfigMsg;
import com.xiaomi.push.protobuf.ChannelMessage.XMMsgConn;
import com.xiaomi.push.service.RC4Cryption;
import com.xiaomi.push.service.ServiceConfig;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.ByteBuffer;
import java.util.Locale;
import java.util.TimeZone;
import java.util.zip.Adler32;

public class BlobWriter {
    ByteBuffer mBuffer = ByteBuffer.allocate(2048);
    private ByteBuffer mCRCBuf = ByteBuffer.allocate(4);
    private Adler32 mChecksumTool = new Adler32();
    private SlimConnection mConnection;
    private int mDSTSavings;
    private byte[] mKey;
    private OutputStream mOut;
    private int mTimeZone;

    BlobWriter(OutputStream outputStream, SlimConnection slimConnection) {
        this.mOut = new BufferedOutputStream(outputStream);
        this.mConnection = slimConnection;
        TimeZone timeZone = TimeZone.getDefault();
        this.mTimeZone = timeZone.getRawOffset() / 3600000;
        this.mDSTSavings = timeZone.useDaylightTime() ? 1 : 0;
    }

    public void openStream() throws IOException {
        XMMsgConn xMMsgConn = new XMMsgConn();
        xMMsgConn.setVersion(BaiduSceneResult.PALACE);
        xMMsgConn.setModel(Build.MODEL);
        xMMsgConn.setOs(SystemUtils.getManufacturerOSVersion());
        xMMsgConn.setUdid(ServiceConfig.getDeviceUUID());
        xMMsgConn.setSdk(38);
        xMMsgConn.setConnpt(this.mConnection.getConnectionPoint());
        xMMsgConn.setHost(this.mConnection.getHost());
        xMMsgConn.setLocale(Locale.getDefault().toString());
        xMMsgConn.setAndver(VERSION.SDK_INT);
        byte[] connectionBlob = this.mConnection.getConfiguration().getConnectionBlob();
        if (connectionBlob != null) {
            xMMsgConn.setPsc(PushServiceConfigMsg.parseFrom(connectionBlob));
        }
        Blob blob = new Blob();
        blob.setChannelId(0);
        blob.setCmd("CONN", null);
        blob.setFrom(0, "xiaomi.com", null);
        blob.setPayload(xMMsgConn.toByteArray(), null);
        write(blob);
        StringBuilder sb = new StringBuilder();
        sb.append("[slim] open conn: andver=");
        sb.append(VERSION.SDK_INT);
        sb.append(" sdk=");
        sb.append(38);
        sb.append(" hash=");
        sb.append(ServiceConfig.getDeviceUUID());
        sb.append(" tz=");
        sb.append(this.mTimeZone);
        sb.append(":");
        sb.append(this.mDSTSavings);
        sb.append(" Model=");
        sb.append(Build.MODEL);
        sb.append(" os=");
        sb.append(VERSION.INCREMENTAL);
        MyLog.w(sb.toString());
    }

    public void shutdown() throws IOException {
        Blob blob = new Blob();
        blob.setCmd("CLOSE", null);
        write(blob);
        this.mOut.close();
    }

    public int write(Blob blob) throws IOException {
        int serializedSize = blob.getSerializedSize();
        if (serializedSize > 32768) {
            StringBuilder sb = new StringBuilder();
            sb.append("Blob size=");
            sb.append(serializedSize);
            sb.append(" should be less than ");
            sb.append(32768);
            sb.append(" Drop blob chid=");
            sb.append(blob.getChannelId());
            sb.append(" id=");
            sb.append(blob.getPacketID());
            MyLog.w(sb.toString());
            return 0;
        }
        this.mBuffer.clear();
        int i = serializedSize + 8 + 4;
        if (i > this.mBuffer.capacity() || this.mBuffer.capacity() > 4096) {
            this.mBuffer = ByteBuffer.allocate(i);
        }
        this.mBuffer.putShort(-15618);
        this.mBuffer.putShort(5);
        this.mBuffer.putInt(serializedSize);
        int position = this.mBuffer.position();
        this.mBuffer = blob.toByteArray(this.mBuffer);
        if (!"CONN".equals(blob.getCmd())) {
            if (this.mKey == null) {
                this.mKey = this.mConnection.getKey();
            }
            RC4Cryption.encrypt(this.mKey, this.mBuffer.array(), true, position, serializedSize);
        }
        this.mChecksumTool.reset();
        this.mChecksumTool.update(this.mBuffer.array(), 0, this.mBuffer.position());
        this.mCRCBuf.putInt(0, (int) this.mChecksumTool.getValue());
        this.mOut.write(this.mBuffer.array(), 0, this.mBuffer.position());
        this.mOut.write(this.mCRCBuf.array(), 0, 4);
        this.mOut.flush();
        int position2 = this.mBuffer.position() + 4;
        StringBuilder sb2 = new StringBuilder();
        sb2.append("[Slim] Wrote {cmd=");
        sb2.append(blob.getCmd());
        sb2.append(";chid=");
        sb2.append(blob.getChannelId());
        sb2.append(";len=");
        sb2.append(position2);
        sb2.append("}");
        MyLog.v(sb2.toString());
        return position2;
    }
}
