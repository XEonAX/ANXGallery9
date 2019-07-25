package com.nexstreaming.kminternal.kinemaster.codeccolorformat;

import android.media.MediaCodec;
import android.media.MediaCodec.BufferInfo;
import android.media.MediaFormat;
import android.util.Log;
import java.io.IOException;
import java.nio.ByteBuffer;

/* compiled from: WrapMediaEncoder */
public class c extends a {
    private d a;
    private MediaCodec b = MediaCodec.createEncoderByType("video/avc");
    private byte[] c;
    private byte[] d;
    private ByteBuffer[] e;
    private ByteBuffer[] f;

    public c() throws IOException {
        MediaFormat createVideoFormat = MediaFormat.createVideoFormat("video/avc", 1280, 720);
        createVideoFormat.setInteger("bitrate", 125000);
        createVideoFormat.setInteger("frame-rate", 30);
        createVideoFormat.setInteger("color-format", 21);
        createVideoFormat.setInteger("i-frame-interval", 5);
        this.b.configure(createVideoFormat, null, null, 1);
        this.b.start();
        this.e = this.b.getInputBuffers();
        this.f = this.b.getOutputBuffers();
    }

    public c(int i, int i2) throws IOException {
        MediaFormat createVideoFormat = MediaFormat.createVideoFormat("video/avc", i, i2);
        createVideoFormat.setInteger("bitrate", 125000);
        createVideoFormat.setInteger("frame-rate", 30);
        createVideoFormat.setInteger("color-format", 21);
        createVideoFormat.setInteger("i-frame-interval", 5);
        this.b.configure(createVideoFormat, null, null, 1);
        this.b.start();
        this.e = this.b.getInputBuffers();
        this.f = this.b.getOutputBuffers();
    }

    public void a() throws IOException {
        this.b.stop();
        this.b.release();
    }

    public void a(d dVar) {
        this.a = dVar;
    }

    public boolean a(byte[] bArr, long j) {
        byte[] bArr2 = bArr;
        if (this.b == null || this.e == null || this.f == null || this.a == null) {
            Log.w("WrapMediaEncoder", "Media codec did not initailize");
            return false;
        }
        ByteBuffer[] inputBuffers = this.b.getInputBuffers();
        ByteBuffer[] outputBuffers = this.b.getOutputBuffers();
        int dequeueInputBuffer = this.b.dequeueInputBuffer(-1);
        if (dequeueInputBuffer >= 0) {
            ByteBuffer byteBuffer = inputBuffers[dequeueInputBuffer];
            byteBuffer.clear();
            if (bArr2 != null) {
                byteBuffer.put(bArr2);
                this.b.queueInputBuffer(dequeueInputBuffer, 0, bArr2.length, j, 0);
            } else {
                this.b.queueInputBuffer(dequeueInputBuffer, 0, 0, j, 4);
            }
        }
        BufferInfo bufferInfo = new BufferInfo();
        int dequeueOutputBuffer = this.b.dequeueOutputBuffer(bufferInfo, 10000);
        switch (dequeueOutputBuffer) {
            case -3:
                Log.d("WrapMediaEncoder", "INFO_OUTPUT_BUFFERS_CHANGED");
                this.b.getOutputBuffers();
                this.a.a(1);
                break;
            case -2:
                StringBuilder sb = new StringBuilder();
                sb.append("New format ");
                sb.append(this.b.getOutputFormat());
                Log.d("WrapMediaEncoder", sb.toString());
                this.a.a(2);
                break;
            case -1:
                Log.d("WrapMediaEncoder", "dequeueOutputBuffer timed out!");
                this.a.a(3);
                break;
            default:
                while (true) {
                    if (dequeueOutputBuffer < 0) {
                        break;
                    } else {
                        if ((bufferInfo.flags & 4) != 0) {
                            Log.d("WrapMediaEncoder", "OutputBuffer BUFFER_FLAG_END_OF_STREAM");
                            this.a.a(4);
                        }
                        ByteBuffer byteBuffer2 = outputBuffers[dequeueOutputBuffer];
                        if (byteBuffer2 == null) {
                            Log.w("WrapMediaEncoder", "Output buffer is null!");
                            break;
                        } else if (bufferInfo.size <= 0) {
                            Log.w("WrapMediaEncoder", "Output was not available!");
                            break;
                        } else {
                            Log.d("WrapMediaEncoder", String.format("Output was available Falg:%d Size:%d", new Object[]{Integer.valueOf(bufferInfo.flags), Integer.valueOf(bufferInfo.size)}));
                            byteBuffer2.position(bufferInfo.offset);
                            byteBuffer2.limit(bufferInfo.offset + bufferInfo.size);
                            if ((bufferInfo.flags & 2) != 0) {
                                Log.d("WrapMediaEncoder", "OutputBuffer BUFFER_FLAG_CODEC_CONFIG");
                                byte[] bArr3 = new byte[bufferInfo.size];
                                byteBuffer2.get(bArr3);
                                ByteBuffer wrap = ByteBuffer.wrap(bArr3);
                                if (wrap.getInt() == 1) {
                                    System.out.println("parsing sps/pps");
                                } else {
                                    System.out.println("something is amiss?");
                                }
                                while (true) {
                                    if (wrap.get() == 0 && wrap.get() == 0 && wrap.get() == 0 && wrap.get() == 1) {
                                        int position = wrap.position();
                                        this.c = new byte[((position - 8) + 4)];
                                        this.c[0] = 0;
                                        this.c[1] = 0;
                                        this.c[2] = 0;
                                        this.c[3] = 1;
                                        System.arraycopy(bArr3, 4, this.c, 4, this.c.length - 4);
                                        this.d = new byte[((bArr3.length - position) + 4)];
                                        this.d[0] = 0;
                                        this.d[1] = 0;
                                        this.d[2] = 0;
                                        this.d[3] = 1;
                                        System.arraycopy(bArr3, position, this.d, 4, this.d.length - 4);
                                        this.a.a(this.c, this.d);
                                        this.b.releaseOutputBuffer(dequeueOutputBuffer, false);
                                        dequeueOutputBuffer = this.b.dequeueOutputBuffer(bufferInfo, 10000);
                                    }
                                }
                            } else {
                                byte[] bArr4 = new byte[bufferInfo.size];
                                byteBuffer2.get(bArr4);
                                this.a.a(bArr4, 0, bArr4.length, bufferInfo.presentationTimeUs);
                                this.b.releaseOutputBuffer(dequeueOutputBuffer, false);
                                dequeueOutputBuffer = this.b.dequeueOutputBuffer(bufferInfo, 10000);
                            }
                        }
                    }
                }
                break;
        }
        return true;
    }
}
