package com.miui.gallery.util;

import android.media.MediaMetadataRetriever;
import android.text.TextUtils;
import android.text.format.Time;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

public class VideoAttrsReader {
    private long mDateTaken = -1;
    private long mDuration = -1;
    private int mHeight = -1;
    private final String mPath;
    private String mTitle;
    private int mWidth = -1;

    public static class VideoAttrsUnretrivableException extends RuntimeException {
        public VideoAttrsUnretrivableException(String str, Throwable th) {
            super(str, th);
        }
    }

    private VideoAttrsReader(String str) throws IOException {
        this.mPath = str;
        initByMediaMediaPlayer(this.mPath);
    }

    private long calculateTaken(String str) {
        Date date;
        if (!TextUtils.isEmpty(str)) {
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd'T'HHmmss.SSS'Z'");
            simpleDateFormat.setTimeZone(TimeZone.getTimeZone("UTC"));
            try {
                date = simpleDateFormat.parse(str);
            } catch (Exception unused) {
                Log.i("VideoAttrsReader", "simple format error %s", (Object) str);
                return new Time(str).toMillis(true);
            }
        } else {
            date = null;
        }
        return date == null ? 0 : date.getTime();
    }

    private void dump(String str) {
        StringBuilder sb = new StringBuilder();
        sb.append("msg=");
        sb.append(str);
        sb.append("\r\n");
        sb.append("file=");
        sb.append(this.mPath);
        sb.append("\r\n");
        sb.append("title=");
        sb.append(this.mTitle);
        sb.append("\r\n");
        sb.append("width=");
        sb.append(this.mWidth);
        sb.append("\r\n");
        sb.append("height=");
        sb.append(this.mHeight);
        sb.append("\r\n");
        sb.append("duration=");
        sb.append(this.mDuration);
        sb.append("\r\n");
        sb.append("datataken=");
        sb.append(this.mDateTaken);
        Log.d("VideoAttrsReader", sb.toString());
    }

    /* JADX WARNING: Removed duplicated region for block: B:26:0x007f A[SYNTHETIC, Splitter:B:26:0x007f] */
    private void initByMediaMediaPlayer(String str) throws IOException {
        MediaMetadataRetriever mediaMetadataRetriever;
        Throwable e;
        try {
            mediaMetadataRetriever = new MediaMetadataRetriever();
            try {
                mediaMetadataRetriever.setDataSource(str);
                this.mTitle = mediaMetadataRetriever.extractMetadata(7);
                this.mWidth = parseIntSafely(mediaMetadataRetriever.extractMetadata(18));
                this.mHeight = parseIntSafely(mediaMetadataRetriever.extractMetadata(19));
                this.mDuration = parseLongSafely(mediaMetadataRetriever.extractMetadata(9));
                this.mDateTaken = calculateTaken(mediaMetadataRetriever.extractMetadata(5));
                try {
                    mediaMetadataRetriever.release();
                } catch (RuntimeException unused) {
                }
                if (TextUtils.isEmpty(this.mTitle)) {
                    this.mTitle = FileUtils.getFileTitle(FileUtils.getFileName(str));
                }
                if (this.mDateTaken <= 0) {
                    this.mDateTaken = new File(str).lastModified();
                }
                dump("final result");
            } catch (RuntimeException e2) {
                e = e2;
                try {
                    throw new VideoAttrsUnretrivableException(str, e);
                } catch (Throwable th) {
                    th = th;
                    if (mediaMetadataRetriever != null) {
                        try {
                            mediaMetadataRetriever.release();
                        } catch (RuntimeException unused2) {
                        }
                    }
                    throw th;
                }
            }
        } catch (RuntimeException e3) {
            Throwable th2 = e3;
            mediaMetadataRetriever = null;
            e = th2;
            throw new VideoAttrsUnretrivableException(str, e);
        } catch (Throwable th3) {
            th = th3;
            mediaMetadataRetriever = null;
            if (mediaMetadataRetriever != null) {
            }
            throw th;
        }
    }

    private int parseIntSafely(String str) {
        try {
            return Integer.parseInt(str);
        } catch (NumberFormatException unused) {
            return -1;
        }
    }

    private long parseLongSafely(String str) {
        try {
            return Long.parseLong(str);
        } catch (NumberFormatException unused) {
            return -1;
        }
    }

    public static VideoAttrsReader read(String str) throws IOException {
        return new VideoAttrsReader(str);
    }

    public long getDateTaken() {
        return this.mDateTaken;
    }

    public long getDuration() {
        return this.mDuration;
    }

    public String getTitle() {
        return this.mTitle;
    }

    public int getVideoHeight() {
        return this.mHeight;
    }

    public int getVideoWidth() {
        return this.mWidth;
    }
}
