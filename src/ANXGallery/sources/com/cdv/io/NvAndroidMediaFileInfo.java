package com.cdv.io;

import android.content.res.AssetFileDescriptor;
import android.content.res.AssetManager;
import android.media.MediaExtractor;
import android.media.MediaFormat;
import com.nexstreaming.nexeditorsdk.nexExportFormat;

public class NvAndroidMediaFileInfo {

    public static class MediaInfo {
        long audioStreamDurationUs = 0;
        int channelCount = 0;
        int frameRate = 0;
        boolean hasAudioStream = false;
        boolean hasVideoStream = false;
        int height = 0;
        int rotation = 0;
        int sampleRate = 0;
        long videoStreamDurationUs = 0;
        int width = 0;

        MediaInfo() {
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:38:0x00c3  */
    /* JADX WARNING: Removed duplicated region for block: B:42:0x00ca  */
    public static MediaInfo getMediaInfoFromFile(String str, AssetManager assetManager) {
        MediaExtractor mediaExtractor;
        try {
            mediaExtractor = new MediaExtractor();
            if (assetManager == null) {
                try {
                    mediaExtractor.setDataSource(str);
                } catch (Exception e) {
                    e = e;
                    try {
                        e.printStackTrace();
                        if (mediaExtractor != null) {
                            mediaExtractor.release();
                        }
                        return null;
                    } catch (Throwable th) {
                        th = th;
                        if (mediaExtractor != null) {
                            mediaExtractor.release();
                        }
                        throw th;
                    }
                }
            } else {
                AssetFileDescriptor openFd = assetManager.openFd(str);
                mediaExtractor.setDataSource(openFd.getFileDescriptor(), openFd.getStartOffset(), openFd.getLength());
                openFd.close();
            }
            int trackCount = mediaExtractor.getTrackCount();
            int i = -1;
            int i2 = -1;
            for (int i3 = 0; i3 < trackCount; i3++) {
                String string = mediaExtractor.getTrackFormat(i3).getString("mime");
                if (string.startsWith("video/")) {
                    i = i3;
                } else if (string.startsWith("audio/")) {
                    i2 = i3;
                }
            }
            MediaInfo mediaInfo = new MediaInfo();
            if (i >= 0) {
                MediaFormat trackFormat = mediaExtractor.getTrackFormat(i);
                mediaInfo.videoStreamDurationUs = trackFormat.getLong("durationUs");
                mediaInfo.width = trackFormat.getInteger(nexExportFormat.TAG_FORMAT_WIDTH);
                mediaInfo.height = trackFormat.getInteger(nexExportFormat.TAG_FORMAT_HEIGHT);
                if (trackFormat.containsKey("rotation-degrees")) {
                    mediaInfo.rotation = trackFormat.getInteger("rotation-degrees");
                }
                if (trackFormat.containsKey("frame-rate")) {
                    mediaInfo.frameRate = trackFormat.getInteger("frame-rate");
                }
                mediaInfo.hasVideoStream = true;
            }
            if (i2 >= 0) {
                MediaFormat trackFormat2 = mediaExtractor.getTrackFormat(i2);
                mediaInfo.audioStreamDurationUs = trackFormat2.getLong("durationUs");
                mediaInfo.channelCount = trackFormat2.getInteger("channel-count");
                mediaInfo.sampleRate = trackFormat2.getInteger("sample-rate");
                mediaInfo.hasAudioStream = true;
            }
            mediaExtractor.release();
            return mediaInfo;
        } catch (Exception e2) {
            e = e2;
            mediaExtractor = null;
            e.printStackTrace();
            if (mediaExtractor != null) {
            }
            return null;
        } catch (Throwable th2) {
            th = th2;
            mediaExtractor = null;
            if (mediaExtractor != null) {
            }
            throw th;
        }
    }
}
