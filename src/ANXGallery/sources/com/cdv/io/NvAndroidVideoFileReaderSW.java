package com.cdv.io;

import android.content.res.AssetFileDescriptor;
import android.content.res.AssetManager;
import android.media.MediaCodec;
import android.media.MediaCodec.BufferInfo;
import android.media.MediaExtractor;
import android.media.MediaFormat;
import android.os.Build.VERSION;
import android.util.Log;
import com.miui.gallery.assistant.jni.filter.BaiduSceneResult;
import com.nexstreaming.nexeditorsdk.nexExportFormat;
import java.nio.ByteBuffer;

public class NvAndroidVideoFileReaderSW {
    private static final int ERROR_EOF = 1;
    private static final int ERROR_FAIL = 2;
    private static final int ERROR_OK = 0;
    private static final String TAG = "NvAndroidVideoFileReaderSW";
    private static final boolean m_verbose = false;
    private BufferInfo m_bufferInfo = null;
    private MediaCodec m_decoder = null;
    ByteBuffer[] m_decoderInputBuffers = null;
    ByteBuffer[] m_decoderOutputBuffers = null;
    private boolean m_decoderSetupFailed = false;
    private boolean m_decoderStarted = false;
    private long m_duration = 0;
    private MediaExtractor m_extractor = null;
    private boolean m_extractorInOriginalState = true;
    private MediaFormat m_format = null;
    private boolean m_inputBufferQueued = false;
    private long m_lastSeekActualTimestamp = Long.MIN_VALUE;
    private long m_lastSeekTimestamp = Long.MIN_VALUE;
    private long m_owner = 0;
    private int m_pendingInputFrameCount = 0;
    private boolean m_sawInputEOS = false;
    private boolean m_sawOutputEOS = false;
    private long m_timestampOfLastCopiedFrame = Long.MIN_VALUE;
    private long m_timestampOfLastDecodedFrame = Long.MIN_VALUE;
    private int m_videoTrackIndex = -1;

    NvAndroidVideoFileReaderSW(long j) {
        this.m_owner = j;
        this.m_bufferInfo = new BufferInfo();
    }

    /* JADX WARNING: Can't wrap try/catch for region: R(4:12|13|14|15) */
    /* JADX WARNING: Missing exception handler attribute for start block: B:14:0x001e */
    private void CleanupDecoder() {
        if (this.m_decoder != null) {
            if (this.m_decoderStarted) {
                try {
                    if (this.m_sawInputEOS && !this.m_sawOutputEOS) {
                        DrainOutputBuffers();
                    }
                    if (this.m_inputBufferQueued) {
                        this.m_decoder.flush();
                        this.m_inputBufferQueued = false;
                    }
                    this.m_decoder.stop();
                } catch (Exception e) {
                    String str = TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("");
                    sb.append(e.getMessage());
                    Log.e(str, sb.toString());
                    e.printStackTrace();
                }
                this.m_decoderStarted = false;
                this.m_decoderInputBuffers = null;
            }
            this.m_decoder.release();
            this.m_decoder = null;
        }
        this.m_timestampOfLastDecodedFrame = Long.MIN_VALUE;
        this.m_timestampOfLastCopiedFrame = Long.MIN_VALUE;
        this.m_pendingInputFrameCount = 0;
        this.m_sawInputEOS = false;
        this.m_sawOutputEOS = false;
    }

    private int DecodeToFrame(long j, long j2) {
        try {
            return DoDecodeToFrame(j, j2);
        } catch (Exception e) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("");
            sb.append(e.getMessage());
            Log.e(str, sb.toString());
            e.printStackTrace();
            CleanupDecoder();
            return 2;
        }
    }

    private int DoDecodeToFrame(long j, long j2) {
        int i;
        boolean z;
        boolean z2;
        int max = Math.max(this.m_decoderInputBuffers.length / 3, 2);
        int i2 = 0;
        while (!this.m_sawOutputEOS) {
            if (!this.m_sawInputEOS) {
                int dequeueInputBuffer = this.m_decoder.dequeueInputBuffer(4000);
                if (dequeueInputBuffer >= 0) {
                    int readSampleData = this.m_extractor.readSampleData(this.m_decoderInputBuffers[dequeueInputBuffer], 0);
                    if (readSampleData < 0) {
                        this.m_decoder.queueInputBuffer(dequeueInputBuffer, 0, 0, 0, 4);
                        this.m_sawInputEOS = true;
                    } else {
                        if (this.m_extractor.getSampleTrackIndex() != this.m_videoTrackIndex) {
                            String str = TAG;
                            StringBuilder sb = new StringBuilder();
                            sb.append("WEIRD: got sample from track ");
                            sb.append(this.m_extractor.getSampleTrackIndex());
                            sb.append(", expected ");
                            sb.append(this.m_videoTrackIndex);
                            Log.w(str, sb.toString());
                        }
                        this.m_decoder.queueInputBuffer(dequeueInputBuffer, 0, readSampleData, this.m_extractor.getSampleTime(), 0);
                        this.m_inputBufferQueued = true;
                        this.m_pendingInputFrameCount++;
                        this.m_extractor.advance();
                        this.m_extractorInOriginalState = false;
                    }
                }
            }
            int dequeueOutputBuffer = this.m_decoder.dequeueOutputBuffer(this.m_bufferInfo, (long) ((this.m_pendingInputFrameCount > max || this.m_sawInputEOS) ? 4000 : 0));
            i2++;
            if (dequeueOutputBuffer != -1) {
                if (dequeueOutputBuffer == -3) {
                    this.m_decoderOutputBuffers = this.m_decoder.getOutputBuffers();
                } else if (dequeueOutputBuffer == -2) {
                    ParseMediaFormat(this.m_decoder.getOutputFormat());
                } else if (dequeueOutputBuffer < 0) {
                    String str2 = TAG;
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("Unexpected result from decoder.dequeueOutputBuffer: ");
                    sb2.append(dequeueOutputBuffer);
                    Log.e(str2, sb2.toString());
                    return 2;
                } else {
                    if ((this.m_bufferInfo.flags & 4) != 0) {
                        this.m_sawOutputEOS = true;
                    }
                    if (this.m_bufferInfo.size != 0) {
                        this.m_timestampOfLastDecodedFrame = this.m_bufferInfo.presentationTimeUs;
                        this.m_pendingInputFrameCount--;
                        if (j != Long.MIN_VALUE) {
                            boolean z3 = this.m_timestampOfLastDecodedFrame >= j - j2;
                            if (z3 || this.m_timestampOfLastDecodedFrame < this.m_duration - 100000) {
                                z2 = z3;
                            } else {
                                z2 = true;
                                z = true;
                                i = 0;
                            }
                        } else {
                            z2 = true;
                        }
                        z = false;
                        i = 0;
                    } else {
                        i = i2;
                        z2 = false;
                        z = false;
                    }
                    if (z2) {
                        nativeCopyVideoFrame(this.m_owner, this.m_decoderOutputBuffers[dequeueOutputBuffer], this.m_bufferInfo.offset, this.m_bufferInfo.size, this.m_timestampOfLastDecodedFrame);
                        this.m_timestampOfLastCopiedFrame = this.m_timestampOfLastDecodedFrame;
                    }
                    this.m_decoder.releaseOutputBuffer(dequeueOutputBuffer, false);
                    if (z2 && !z) {
                        return 0;
                    }
                    i2 = i;
                }
            }
            if (i2 > 100) {
                Log.e(TAG, "We have tried too many times and can't decode a frame!");
                return 2;
            }
        }
        return (j == Long.MIN_VALUE || this.m_timestampOfLastCopiedFrame == Long.MIN_VALUE || this.m_timestampOfLastCopiedFrame < this.m_duration - 100000) ? 1 : 0;
    }

    private void DrainOutputBuffers() {
        if (this.m_sawInputEOS && !this.m_sawOutputEOS) {
            int i = 0;
            while (!this.m_sawOutputEOS) {
                int dequeueOutputBuffer = this.m_decoder.dequeueOutputBuffer(this.m_bufferInfo, 5000);
                i++;
                if (!(dequeueOutputBuffer == -1 || dequeueOutputBuffer == -3 || dequeueOutputBuffer == -2)) {
                    if (dequeueOutputBuffer < 0) {
                        String str = TAG;
                        StringBuilder sb = new StringBuilder();
                        sb.append("DrainDecoderBuffers(): Unexpected result from decoder.dequeueOutputBuffer: ");
                        sb.append(dequeueOutputBuffer);
                        Log.e(str, sb.toString());
                        return;
                    }
                    if ((this.m_bufferInfo.flags & 4) != 0) {
                        this.m_sawOutputEOS = true;
                    }
                    this.m_decoder.releaseOutputBuffer(dequeueOutputBuffer, false);
                    i = 0;
                }
                if (i > 100) {
                    Log.e(TAG, "DrainDecoderBuffers(): We have tried too many times and can't decode a frame!");
                    return;
                }
            }
        }
    }

    private void InvalidLastSeekTimestamp() {
        this.m_lastSeekTimestamp = Long.MIN_VALUE;
        this.m_lastSeekActualTimestamp = Long.MIN_VALUE;
    }

    private boolean IsValid() {
        return this.m_decoder != null;
    }

    /* JADX WARNING: Removed duplicated region for block: B:16:0x0052  */
    /* JADX WARNING: Removed duplicated region for block: B:24:0x0073  */
    /* JADX WARNING: Removed duplicated region for block: B:27:0x0079  */
    /* JADX WARNING: Removed duplicated region for block: B:36:0x00a2  */
    /* JADX WARNING: Removed duplicated region for block: B:37:0x00aa  */
    /* JADX WARNING: Removed duplicated region for block: B:40:0x00b3  */
    /* JADX WARNING: Removed duplicated region for block: B:42:0x00bb  */
    /* JADX WARNING: Removed duplicated region for block: B:45:0x00c6  */
    /* JADX WARNING: Removed duplicated region for block: B:46:0x00ce  */
    /* JADX WARNING: Removed duplicated region for block: B:49:0x00d7  */
    /* JADX WARNING: Removed duplicated region for block: B:50:0x00df  */
    private void ParseMediaFormat(MediaFormat mediaFormat) {
        int i;
        int i2;
        int i3;
        int i4;
        int i5;
        if (mediaFormat.containsKey(nexExportFormat.TAG_FORMAT_WIDTH) && mediaFormat.containsKey(nexExportFormat.TAG_FORMAT_HEIGHT) && mediaFormat.containsKey("color-format")) {
            int integer = mediaFormat.getInteger(nexExportFormat.TAG_FORMAT_WIDTH);
            int integer2 = mediaFormat.getInteger(nexExportFormat.TAG_FORMAT_HEIGHT);
            int integer3 = mediaFormat.getInteger("color-format");
            if (VERSION.SDK_INT >= 18) {
                String name = this.m_decoder.getName();
                if (integer3 == 25 && name.equals("OMX.k3.video.decoder.avc")) {
                    i = 2130706688;
                    if (VERSION.SDK_INT < 23) {
                        i3 = mediaFormat.containsKey("slice-height") ? mediaFormat.getInteger("slice-height") : integer2;
                        i2 = mediaFormat.containsKey("stride") ? mediaFormat.getInteger("stride") : integer;
                    } else {
                        i2 = integer;
                        i3 = integer2;
                    }
                    if (VERSION.SDK_INT >= 18) {
                        String name2 = this.m_decoder.getName();
                        if (name2.startsWith("OMX.Nvidia.")) {
                            i3 = (i3 + 15) & -16;
                        } else if (name2.startsWith("OMX.SEC.avc.dec")) {
                            i4 = integer;
                            i5 = integer2;
                            int integer4 = mediaFormat.containsKey("crop-left") ? mediaFormat.getInteger("crop-left") : 0;
                            int integer5 = mediaFormat.containsKey("crop-right") ? mediaFormat.getInteger("crop-right") : integer - 1;
                            int integer6 = mediaFormat.containsKey("crop-top") ? mediaFormat.getInteger("crop-top") : 0;
                            int integer7 = mediaFormat.containsKey("crop-bottom") ? mediaFormat.getInteger("crop-bottom") : integer2 - 1;
                            nativeSetFormatInfo(this.m_owner, (integer5 + 1) - integer4, (integer7 + 1) - integer6, i, i5, i4, integer4, integer5, integer6, integer7);
                        }
                    }
                    i5 = i3;
                    i4 = i2;
                    if (mediaFormat.containsKey("crop-left")) {
                    }
                    int integer52 = mediaFormat.containsKey("crop-right") ? mediaFormat.getInteger("crop-right") : integer - 1;
                    if (mediaFormat.containsKey("crop-top")) {
                    }
                    if (mediaFormat.containsKey("crop-bottom")) {
                    }
                    nativeSetFormatInfo(this.m_owner, (integer52 + 1) - integer4, (integer7 + 1) - integer6, i, i5, i4, integer4, integer52, integer6, integer7);
                }
            }
            i = integer3;
            if (VERSION.SDK_INT < 23) {
            }
            if (VERSION.SDK_INT >= 18) {
            }
            i5 = i3;
            i4 = i2;
            if (mediaFormat.containsKey("crop-left")) {
            }
            int integer522 = mediaFormat.containsKey("crop-right") ? mediaFormat.getInteger("crop-right") : integer - 1;
            if (mediaFormat.containsKey("crop-top")) {
            }
            if (mediaFormat.containsKey("crop-bottom")) {
            }
            nativeSetFormatInfo(this.m_owner, (integer522 + 1) - integer4, (integer7 + 1) - integer6, i, i5, i4, integer4, integer522, integer6, integer7);
        }
    }

    /* JADX WARNING: Can't wrap try/catch for region: R(4:21|22|23|24) */
    /* JADX WARNING: Missing exception handler attribute for start block: B:23:0x003f */
    private int SeekInternal(long j, long j2) {
        boolean z = true;
        if ((this.m_timestampOfLastDecodedFrame == Long.MIN_VALUE || j <= this.m_timestampOfLastDecodedFrame || j >= this.m_timestampOfLastDecodedFrame + 1000000) && (!this.m_extractorInOriginalState || j >= 1000000)) {
            z = false;
        }
        if (!z) {
            try {
                this.m_extractor.seekTo(j, 0);
                if (!this.m_sawInputEOS) {
                    if (!this.m_sawOutputEOS) {
                        if (this.m_inputBufferQueued) {
                            this.m_decoder.flush();
                            this.m_inputBufferQueued = false;
                            this.m_pendingInputFrameCount = 0;
                        }
                    }
                }
                CleanupDecoder();
                if (!SetupDecoder(this.m_format.getString("mime"))) {
                    return 2;
                }
            } catch (Exception e) {
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("");
                sb.append(e.getMessage());
                Log.e(str, sb.toString());
                e.printStackTrace();
                return 2;
            }
        }
        return DecodeToFrame(j, j2);
    }

    private boolean SetupDecoder(String str) {
        try {
            this.m_decoder = MediaCodec.createDecoderByType(str);
            this.m_decoder.configure(this.m_format, null, null, 0);
            this.m_decoder.start();
            this.m_decoderStarted = true;
            this.m_decoderInputBuffers = this.m_decoder.getInputBuffers();
            this.m_decoderOutputBuffers = this.m_decoder.getOutputBuffers();
            return true;
        } catch (Exception e) {
            String str2 = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("");
            sb.append(e.getMessage());
            Log.e(str2, sb.toString());
            e.printStackTrace();
            CleanupDecoder();
            return false;
        }
    }

    private native void nativeCopyVideoFrame(long j, ByteBuffer byteBuffer, int i, int i2, long j2);

    private native void nativeSetFormatInfo(long j, int i, int i2, int i3, int i4, int i5, int i6, int i7, int i8, int i9);

    public void CloseFile() {
        InvalidLastSeekTimestamp();
        CleanupDecoder();
        if (this.m_extractor != null) {
            this.m_extractor.release();
            this.m_extractor = null;
            this.m_videoTrackIndex = -1;
            this.m_format = null;
            this.m_duration = 0;
            this.m_extractorInOriginalState = true;
        }
    }

    public int GetNextVideoFrameForPlayback() {
        if (!IsValid()) {
            return 1;
        }
        int DecodeToFrame = DecodeToFrame(Long.MIN_VALUE, 0);
        InvalidLastSeekTimestamp();
        return DecodeToFrame;
    }

    public boolean OpenFile(String str, AssetManager assetManager, int i) {
        if (IsValid()) {
            Log.e(TAG, "You can't call OpenFile() twice!");
            return false;
        }
        try {
            this.m_extractor = new MediaExtractor();
            if (assetManager == null) {
                this.m_extractor.setDataSource(str);
            } else {
                AssetFileDescriptor openFd = assetManager.openFd(str);
                this.m_extractor.setDataSource(openFd.getFileDescriptor(), openFd.getStartOffset(), openFd.getLength());
                openFd.close();
            }
            this.m_extractorInOriginalState = true;
            int trackCount = this.m_extractor.getTrackCount();
            int i2 = 0;
            while (true) {
                if (i2 >= trackCount) {
                    break;
                } else if (this.m_extractor.getTrackFormat(i2).getString("mime").startsWith("video/")) {
                    this.m_videoTrackIndex = i2;
                    break;
                } else {
                    i2++;
                }
            }
            if (this.m_videoTrackIndex < 0) {
                String str2 = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("Failed to find a video track from ");
                sb.append(str);
                Log.e(str2, sb.toString());
                CloseFile();
                return false;
            }
            this.m_extractor.selectTrack(this.m_videoTrackIndex);
            this.m_format = this.m_extractor.getTrackFormat(this.m_videoTrackIndex);
            if (VERSION.SDK_INT == 16) {
                this.m_format.setInteger("max-input-size", 0);
            }
            if (VERSION.SDK_INT >= 23 && i >= 0) {
                MediaFormat mediaFormat = this.m_format;
                String str3 = "operating-rate";
                if (i <= 0) {
                    i = BaiduSceneResult.MOTORCYCLE;
                }
                mediaFormat.setInteger(str3, i);
            }
            this.m_duration = this.m_format.getLong("durationUs");
            String string = this.m_format.getString("mime");
            this.m_decoderSetupFailed = false;
            if (SetupDecoder(string)) {
                return true;
            }
            this.m_decoderSetupFailed = true;
            CloseFile();
            return false;
        } catch (Exception e) {
            String str4 = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("");
            sb2.append(e.getMessage());
            Log.e(str4, sb2.toString());
            e.printStackTrace();
            CloseFile();
            return false;
        }
    }

    public int SeekVideoFrame(long j, long j2) {
        if (!IsValid()) {
            return 1;
        }
        long max = Math.max(j, 0);
        if (max >= this.m_duration) {
            if (max >= this.m_duration + 25000) {
                return 1;
            }
            max = this.m_duration - 1;
        }
        if (this.m_timestampOfLastCopiedFrame != Long.MIN_VALUE && Math.abs(max - this.m_timestampOfLastCopiedFrame) <= j2) {
            return 0;
        }
        int SeekInternal = SeekInternal(max, j2);
        if (SeekInternal == 0) {
            this.m_lastSeekTimestamp = max;
            this.m_lastSeekActualTimestamp = this.m_timestampOfLastCopiedFrame;
        } else {
            InvalidLastSeekTimestamp();
        }
        return SeekInternal;
    }

    public int StartPlayback(long j, long j2) {
        if (!IsValid()) {
            return 1;
        }
        long max = Math.max(j, 0);
        if (max >= this.m_duration) {
            return 1;
        }
        if (!(this.m_lastSeekTimestamp == Long.MIN_VALUE || max != this.m_lastSeekTimestamp || this.m_lastSeekActualTimestamp == Long.MIN_VALUE)) {
            max = this.m_lastSeekActualTimestamp;
        }
        if (max == this.m_timestampOfLastCopiedFrame && this.m_timestampOfLastCopiedFrame == this.m_timestampOfLastDecodedFrame) {
            return 0;
        }
        int SeekInternal = SeekInternal(max, j2);
        InvalidLastSeekTimestamp();
        return SeekInternal;
    }

    public boolean hasDecoderSetupFailed() {
        return this.m_decoderSetupFailed;
    }
}
