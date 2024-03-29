package com.miui.gallery.cloudcontrol.strategies;

import android.text.TextUtils;
import com.google.gson.annotations.SerializedName;
import com.miui.gallery.util.MiscUtil;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

public class UploadSupportedFileTypeStrategy extends BaseStrategy {
    @SerializedName("image")
    private List<FileType> mImageFileTypes;
    @SerializedName("video")
    private List<FileType> mVideoFileTypes;

    static class FileType {
        @SerializedName("extension")
        public String extension;
        @SerializedName("mime-type")
        public String mimeType;

        public FileType(String str, String str2) {
            this.extension = str;
            this.mimeType = str2;
        }
    }

    public static UploadSupportedFileTypeStrategy createDefault() {
        UploadSupportedFileTypeStrategy uploadSupportedFileTypeStrategy = new UploadSupportedFileTypeStrategy();
        uploadSupportedFileTypeStrategy.mImageFileTypes = Arrays.asList(new FileType[]{new FileType("JPG", "image/jpeg"), new FileType("JPEG", "image/jpeg"), new FileType("GIF", "image/gif"), new FileType("PNG", "image/png"), new FileType("BMP", "image/x-ms-bmp"), new FileType("WEBP", "image/webp"), new FileType("WBMP", "image/vnd.wap.wbmp")});
        uploadSupportedFileTypeStrategy.mVideoFileTypes = Arrays.asList(new FileType[]{new FileType("MP4", "video/mp4"), new FileType("MOV", "video/quicktime"), new FileType("3GP", "video/3gpp")});
        return uploadSupportedFileTypeStrategy;
    }

    public HashMap<String, String> getSupportedFileTypeMap() {
        HashMap<String, String> hashMap = new HashMap<>();
        if (MiscUtil.isValid(this.mImageFileTypes)) {
            for (FileType fileType : this.mImageFileTypes) {
                if (!TextUtils.isEmpty(fileType.extension) && !TextUtils.isEmpty(fileType.mimeType)) {
                    hashMap.put(fileType.extension, fileType.mimeType);
                }
            }
        }
        if (MiscUtil.isValid(this.mVideoFileTypes)) {
            for (FileType fileType2 : this.mVideoFileTypes) {
                if (!TextUtils.isEmpty(fileType2.extension) && !TextUtils.isEmpty(fileType2.mimeType)) {
                    hashMap.put(fileType2.extension, fileType2.mimeType);
                }
            }
        }
        return hashMap;
    }
}
