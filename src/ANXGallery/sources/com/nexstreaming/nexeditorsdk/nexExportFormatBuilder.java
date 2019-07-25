package com.nexstreaming.nexeditorsdk;

import java.util.HashMap;
import java.util.Map;

public final class nexExportFormatBuilder {
    private static String TAG = "nexExportFormatBuilder";
    Map<String, String> formats = new HashMap();

    public static nexExportFormatBuilder Builder() {
        return new nexExportFormatBuilder();
    }

    public nexExportFormat build() {
        nexExportFormat nexexportformat = new nexExportFormat();
        for (String str : this.formats.keySet()) {
            nexexportformat.setString(str, (String) this.formats.get(str));
        }
        return nexexportformat;
    }

    public nexExportFormatBuilder setAudioBitrate(int i) {
        Map<String, String> map = this.formats;
        String str = nexExportFormat.TAG_FORMAT_AUDIO_BITRATE;
        StringBuilder sb = new StringBuilder();
        sb.append("");
        sb.append(i);
        map.put(str, sb.toString());
        return this;
    }

    public nexExportFormatBuilder setAudioCodec(int i) {
        Map<String, String> map = this.formats;
        String str = nexExportFormat.TAG_FORMAT_AUDIO_CODEC;
        StringBuilder sb = new StringBuilder();
        sb.append("");
        sb.append(i);
        map.put(str, sb.toString());
        return this;
    }

    public nexExportFormatBuilder setAudioSampleRate(int i) {
        Map<String, String> map = this.formats;
        String str = nexExportFormat.TAG_FORMAT_AUDIO_SAMPLERATE;
        StringBuilder sb = new StringBuilder();
        sb.append("");
        sb.append(i);
        map.put(str, sb.toString());
        return this;
    }

    public nexExportFormatBuilder setEndTime(int i) {
        Map<String, String> map = this.formats;
        String str = nexExportFormat.TAG_FORMAT_END_TIME;
        StringBuilder sb = new StringBuilder();
        sb.append("");
        sb.append(i);
        map.put(str, sb.toString());
        return this;
    }

    public nexExportFormatBuilder setHeight(int i) {
        Map<String, String> map = this.formats;
        String str = nexExportFormat.TAG_FORMAT_HEIGHT;
        StringBuilder sb = new StringBuilder();
        sb.append("");
        sb.append(i);
        map.put(str, sb.toString());
        return this;
    }

    public nexExportFormatBuilder setIntervalTime(int i) {
        Map<String, String> map = this.formats;
        String str = nexExportFormat.TAG_FORMAT_INTERVAL_TIME;
        StringBuilder sb = new StringBuilder();
        sb.append("");
        sb.append(i);
        map.put(str, sb.toString());
        return this;
    }

    public nexExportFormatBuilder setMaxFileSize(long j) {
        Map<String, String> map = this.formats;
        String str = nexExportFormat.TAG_FORMAT_MAX_FILESIZE;
        StringBuilder sb = new StringBuilder();
        sb.append("");
        sb.append(j);
        map.put(str, sb.toString());
        return this;
    }

    public nexExportFormatBuilder setPath(String str) {
        this.formats.put(nexExportFormat.TAG_FORMAT_PATH, str);
        return this;
    }

    public nexExportFormatBuilder setQuality(int i) {
        Map<String, String> map = this.formats;
        String str = nexExportFormat.TAG_FORMAT_QUALITY;
        StringBuilder sb = new StringBuilder();
        sb.append("");
        sb.append(i);
        map.put(str, sb.toString());
        return this;
    }

    public nexExportFormatBuilder setStartTime(int i) {
        Map<String, String> map = this.formats;
        String str = nexExportFormat.TAG_FORMAT_START_TIME;
        StringBuilder sb = new StringBuilder();
        sb.append("");
        sb.append(i);
        map.put(str, sb.toString());
        return this;
    }

    public nexExportFormatBuilder setTagID(int i) {
        Map<String, String> map = this.formats;
        String str = nexExportFormat.TAG_FORMAT_TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("");
        sb.append(i);
        map.put(str, sb.toString());
        return this;
    }

    public nexExportFormatBuilder setType(String str) {
        this.formats.put(nexExportFormat.TAG_FORMAT_TYPE, str);
        return this;
    }

    public nexExportFormatBuilder setUUID(String str) {
        this.formats.put(nexExportFormat.TAG_FORMAT_UUID, str);
        return this;
    }

    public nexExportFormatBuilder setUserField(String str, String str2) {
        this.formats.put(str, str2);
        return this;
    }

    public nexExportFormatBuilder setVideoBitrate(int i) {
        Map<String, String> map = this.formats;
        String str = nexExportFormat.TAG_FORMAT_VIDEO_BITRATE;
        StringBuilder sb = new StringBuilder();
        sb.append("");
        sb.append(i);
        map.put(str, sb.toString());
        return this;
    }

    public nexExportFormatBuilder setVideoCodec(int i) {
        Map<String, String> map = this.formats;
        String str = nexExportFormat.TAG_FORMAT_VIDEO_CODEC;
        StringBuilder sb = new StringBuilder();
        sb.append("");
        sb.append(i);
        map.put(str, sb.toString());
        return this;
    }

    public nexExportFormatBuilder setVideoFPS(int i) {
        Map<String, String> map = this.formats;
        String str = nexExportFormat.TAG_FORMAT_VIDEO_FPS;
        StringBuilder sb = new StringBuilder();
        sb.append("");
        sb.append(i);
        map.put(str, sb.toString());
        return this;
    }

    public nexExportFormatBuilder setVideoLevel(int i) {
        Map<String, String> map = this.formats;
        String str = nexExportFormat.TAG_FORMAT_VIDEO_LEVEL;
        StringBuilder sb = new StringBuilder();
        sb.append("");
        sb.append(i);
        map.put(str, sb.toString());
        return this;
    }

    public nexExportFormatBuilder setVideoProfile(int i) {
        Map<String, String> map = this.formats;
        String str = nexExportFormat.TAG_FORMAT_VIDEO_PROFILE;
        StringBuilder sb = new StringBuilder();
        sb.append("");
        sb.append(i);
        map.put(str, sb.toString());
        return this;
    }

    public nexExportFormatBuilder setVideoRotate(int i) {
        Map<String, String> map = this.formats;
        String str = nexExportFormat.TAG_FORMAT_VIDEO_ROTATE;
        StringBuilder sb = new StringBuilder();
        sb.append("");
        sb.append(i);
        map.put(str, sb.toString());
        return this;
    }

    public nexExportFormatBuilder setWidth(int i) {
        Map<String, String> map = this.formats;
        String str = nexExportFormat.TAG_FORMAT_WIDTH;
        StringBuilder sb = new StringBuilder();
        sb.append("");
        sb.append(i);
        map.put(str, sb.toString());
        return this;
    }
}
