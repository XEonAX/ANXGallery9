package com.cdv.io;

import android.content.res.AssetFileDescriptor;
import android.content.res.AssetManager;
import android.media.MediaCodec;
import android.media.MediaCodec.BufferInfo;
import android.media.MediaExtractor;
import android.media.MediaFormat;
import android.os.Build.VERSION;
import android.util.Log;
import java.nio.ByteBuffer;

public class NvAndroidAudioFileReader {
    private static final int ERROR_EOF = 1;
    private static final int ERROR_FAIL = 2;
    private static final int ERROR_OK = 0;
    private static final String TAG = "NvAndroidAudioFileReader";
    private static final boolean m_verbose = false;
    private int m_audioTrackIndex;
    private BufferInfo m_bufferInfo;
    private int m_channelCount;
    private MediaCodec m_decoder;
    ByteBuffer[] m_decoderInputBuffers;
    ByteBuffer[] m_decoderOutputBuffers;
    private boolean m_decoderSetupFailed;
    private boolean m_decoderStarted;
    private long m_duration;
    private MediaExtractor m_extractor;
    private MediaFormat m_format;
    private boolean m_inputBufferQueued;
    private int m_pendingInputFrameCount;
    private int m_sampleRate;
    private boolean m_sawInputEOS;
    private boolean m_sawOutputEOS;

    public static class AudioFrame {
        ByteBuffer audioFrame;
        int channelCount;
        long pts;
        int retCode;
        int sampleCount;
        int sampleRate;
        int sampleSize;
    }

    NvAndroidAudioFileReader() {
        this.m_extractor = null;
        this.m_audioTrackIndex = -1;
        this.m_format = null;
        this.m_duration = 0;
        this.m_channelCount = 1;
        this.m_sampleRate = 44100;
        this.m_bufferInfo = null;
        this.m_decoder = null;
        this.m_decoderSetupFailed = false;
        this.m_decoderStarted = false;
        this.m_decoderInputBuffers = null;
        this.m_decoderOutputBuffers = null;
        this.m_inputBufferQueued = false;
        this.m_pendingInputFrameCount = 0;
        this.m_sawInputEOS = false;
        this.m_sawOutputEOS = false;
        this.m_bufferInfo = new BufferInfo();
    }

    /* JADX WARNING: Can't wrap try/catch for region: R(4:7|8|9|10) */
    /* JADX WARNING: Missing exception handler attribute for start block: B:9:0x0013 */
    private void cleanupDecoder() {
        if (this.m_decoder != null) {
            if (this.m_decoderStarted) {
                try {
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
        this.m_pendingInputFrameCount = 0;
        this.m_sawInputEOS = false;
        this.m_sawOutputEOS = false;
    }

    private AudioFrame decodeNextFrame() {
        int max = Math.max(this.m_decoderInputBuffers.length / 3, 2);
        AudioFrame audioFrame = new AudioFrame();
        int i = 0;
        while (true) {
            boolean z = true;
            if (!this.m_sawOutputEOS) {
                if (!this.m_sawInputEOS) {
                    int dequeueInputBuffer = this.m_decoder.dequeueInputBuffer(500);
                    if (dequeueInputBuffer >= 0) {
                        int readSampleData = this.m_extractor.readSampleData(this.m_decoderInputBuffers[dequeueInputBuffer], 0);
                        if (readSampleData < 0) {
                            this.m_decoder.queueInputBuffer(dequeueInputBuffer, 0, 0, 0, 4);
                            this.m_sawInputEOS = true;
                        } else {
                            if (this.m_extractor.getSampleTrackIndex() != this.m_audioTrackIndex) {
                                String str = TAG;
                                StringBuilder sb = new StringBuilder();
                                sb.append("WEIRD: got sample from track ");
                                sb.append(this.m_extractor.getSampleTrackIndex());
                                sb.append(", expected ");
                                sb.append(this.m_audioTrackIndex);
                                Log.w(str, sb.toString());
                            }
                            this.m_decoder.queueInputBuffer(dequeueInputBuffer, 0, readSampleData, this.m_extractor.getSampleTime(), 0);
                            this.m_inputBufferQueued = true;
                            this.m_pendingInputFrameCount++;
                            this.m_extractor.advance();
                        }
                    }
                }
                int dequeueOutputBuffer = this.m_decoder.dequeueOutputBuffer(this.m_bufferInfo, (long) ((this.m_pendingInputFrameCount > max || this.m_sawInputEOS) ? 500 : 0));
                int i2 = i + 1;
                if (dequeueOutputBuffer != -1) {
                    if (dequeueOutputBuffer == -3) {
                        this.m_decoderOutputBuffers = this.m_decoder.getOutputBuffers();
                    } else if (dequeueOutputBuffer == -2) {
                        parseMediaFormat(this.m_decoder.getOutputFormat());
                    } else if (dequeueOutputBuffer < 0) {
                        String str2 = TAG;
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("Unexpected result from decoder.dequeueOutputBuffer: ");
                        sb2.append(dequeueOutputBuffer);
                        Log.e(str2, sb2.toString());
                        return null;
                    } else {
                        if ((this.m_bufferInfo.flags & 4) != 0) {
                            this.m_sawOutputEOS = true;
                        } else {
                            this.m_pendingInputFrameCount--;
                        }
                        if (this.m_bufferInfo.size == 0) {
                            z = false;
                        }
                        if (z) {
                            audioFrame.channelCount = this.m_channelCount;
                            audioFrame.sampleRate = this.m_sampleRate;
                            audioFrame.sampleSize = 16;
                            audioFrame.sampleCount = this.m_bufferInfo.size / ((audioFrame.sampleSize / 8) * audioFrame.channelCount);
                            try {
                                ByteBuffer byteBuffer = this.m_decoderOutputBuffers[dequeueOutputBuffer];
                                byteBuffer.position(0);
                                byteBuffer.limit(this.m_bufferInfo.size);
                                ByteBuffer allocateDirect = ByteBuffer.allocateDirect(this.m_bufferInfo.size);
                                allocateDirect.put(byteBuffer);
                                audioFrame.audioFrame = allocateDirect;
                                audioFrame.pts = this.m_bufferInfo.presentationTimeUs;
                                audioFrame.retCode = 0;
                            } catch (Exception e) {
                                e.printStackTrace();
                                audioFrame.retCode = 2;
                                z = false;
                            }
                        }
                        this.m_decoder.releaseOutputBuffer(dequeueOutputBuffer, false);
                        if (z) {
                            return audioFrame;
                        }
                    }
                }
                if (i2 > 100) {
                    Log.e(TAG, "We have tried too many times and can't decode a frame!");
                    return null;
                }
                i = i2;
            } else {
                audioFrame.retCode = 1;
                return audioFrame;
            }
        }
    }

    private boolean isValid() {
        return this.m_decoder != null;
    }

    private void parseMediaFormat(MediaFormat mediaFormat) {
        if (mediaFormat.containsKey("channel-count")) {
            this.m_channelCount = mediaFormat.getInteger("channel-count");
        }
        if (mediaFormat.containsKey("sample-rate")) {
            this.m_sampleRate = mediaFormat.getInteger("sample-rate");
        }
    }

    private boolean setupDecoder(String str) {
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
            cleanupDecoder();
            return false;
        }
    }

    public void closeFile() {
        cleanupDecoder();
        if (this.m_extractor != null) {
            this.m_extractor.release();
            this.m_extractor = null;
            this.m_audioTrackIndex = -1;
            this.m_format = null;
            this.m_duration = 0;
        }
    }

    public AudioFrame getNextAudioFrameForPlayback() {
        if (!isValid()) {
            AudioFrame audioFrame = new AudioFrame();
            audioFrame.retCode = 1;
            return audioFrame;
        }
        try {
            return decodeNextFrame();
        } catch (Exception e) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("");
            sb.append(e.getMessage());
            Log.e(str, sb.toString());
            e.printStackTrace();
            cleanupDecoder();
            return null;
        }
    }

    public boolean hasDecoderSetupFailed() {
        return this.m_decoderSetupFailed;
    }

    public boolean openFile(String str, AssetManager assetManager) {
        if (isValid()) {
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
            int trackCount = this.m_extractor.getTrackCount();
            int i = 0;
            while (true) {
                if (i >= trackCount) {
                    break;
                } else if (this.m_extractor.getTrackFormat(i).getString("mime").startsWith("audio/")) {
                    this.m_audioTrackIndex = i;
                    break;
                } else {
                    i++;
                }
            }
            if (this.m_audioTrackIndex < 0) {
                String str2 = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("Failed to find a audio track from ");
                sb.append(str);
                Log.e(str2, sb.toString());
                closeFile();
                return false;
            }
            this.m_extractor.selectTrack(this.m_audioTrackIndex);
            this.m_format = this.m_extractor.getTrackFormat(this.m_audioTrackIndex);
            int i2 = VERSION.SDK_INT;
            this.m_duration = this.m_format.getLong("durationUs");
            String string = this.m_format.getString("mime");
            this.m_decoderSetupFailed = false;
            if (setupDecoder(string)) {
                return true;
            }
            this.m_decoderSetupFailed = true;
            closeFile();
            return false;
        } catch (Exception e) {
            String str3 = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("");
            sb2.append(e.getMessage());
            Log.e(str3, sb2.toString());
            e.printStackTrace();
            closeFile();
            return false;
        }
    }

    /* JADX WARNING: Can't wrap try/catch for region: R(4:15|16|17|18) */
    /* JADX WARNING: Missing exception handler attribute for start block: B:17:0x002e */
    public int startPlayback(long j) {
        if (!isValid()) {
            return 1;
        }
        long max = Math.max(j, 0);
        if (max >= this.m_duration) {
            return 1;
        }
        try {
            this.m_extractor.seekTo(max, 0);
            if (!this.m_sawInputEOS) {
                if (!this.m_sawOutputEOS) {
                    if (this.m_inputBufferQueued) {
                        this.m_decoder.flush();
                        this.m_inputBufferQueued = false;
                        this.m_pendingInputFrameCount = 0;
                    }
                }
            }
            cleanupDecoder();
            return !setupDecoder(this.m_format.getString("mime")) ? 2 : 0;
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
}
