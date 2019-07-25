package com.nexstreaming.app.common.util;

import android.util.Log;
import com.miui.gallery.assistant.jni.filter.BaiduSceneResult;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

public enum FileType {
    JPEG((String) FileCategory.Image, (int) new String[]{"jpeg", "jpg"}, (FileCategory) new int[][]{new int[]{255, 216, 255}}),
    PNG((String) FileCategory.Image, (int) new String[]{"png"}, (FileCategory) new int[][]{new int[]{BaiduSceneResult.JEWELRY, 80, 78, 71, 13, 10, 26, 10}}),
    SVG((String) FileCategory.Image, (int) new String[]{"svg"}, (FileCategory) new int[][]{new int[]{60, BaiduSceneResult.BUILDING_OTHER, BaiduSceneResult.SUBWAY, BaiduSceneResult.MOUNTAINEERING}, new int[]{60, 83, 86, 71}}),
    WEBP((String) FileCategory.Image, (int) new String[]{"webp"}, (FileCategory) new int[][]{new int[]{82, 73, 70, 70, -1, -1, -1, -1, 87, 69, 66, 80}}),
    GIF((String) FileCategory.Image, (int) new String[]{"gif"}, (FileCategory) new int[][]{new int[]{71, 73, 70, 56, 55, 97}, new int[]{71, 73, 70, 56, 57, 97}}),
    M4A((String) FileCategory.Audio, (int) new String[]{"m4a"}, (FileCategory) new int[][]{new int[]{0, 0, 0, 32, BaiduSceneResult.TAEKWONDO, BaiduSceneResult.CAR, BaiduSceneResult.STATION, BaiduSceneResult.STREET_VIEW, 77, 52, 65, 32}, new int[]{-1, -1, -1, -1, BaiduSceneResult.TAEKWONDO, BaiduSceneResult.CAR, BaiduSceneResult.STATION, BaiduSceneResult.STREET_VIEW, 77, 52, 65, 32}}),
    M4V((String) FileCategory.Video, (int) new String[]{"m4v"}, (FileCategory) new int[][]{new int[]{0, 0, 0, 24, BaiduSceneResult.TAEKWONDO, BaiduSceneResult.CAR, BaiduSceneResult.STATION, BaiduSceneResult.STREET_VIEW, BaiduSceneResult.CHURCH, BaiduSceneResult.STREET_VIEW, 52, 50}, new int[]{-1, -1, -1, -1, BaiduSceneResult.TAEKWONDO, BaiduSceneResult.CAR, BaiduSceneResult.STATION, BaiduSceneResult.STREET_VIEW, BaiduSceneResult.CHURCH, BaiduSceneResult.STREET_VIEW, 52, 50}}),
    MP4((String) FileCategory.Video, (int) new String[]{"mp4"}, (FileCategory) new int[][]{new int[]{0, 0, 0, 20, BaiduSceneResult.TAEKWONDO, BaiduSceneResult.CAR, BaiduSceneResult.STATION, BaiduSceneResult.STREET_VIEW, BaiduSceneResult.TEMPLE, BaiduSceneResult.BUILDING_OTHER, BaiduSceneResult.WESTERN_ARCHITECTURE, BaiduSceneResult.CHURCH}, new int[]{0, 0, 0, 24, BaiduSceneResult.TAEKWONDO, BaiduSceneResult.CAR, BaiduSceneResult.STATION, BaiduSceneResult.STREET_VIEW, BaiduSceneResult.TEMPLE, BaiduSceneResult.BUILDING_OTHER, BaiduSceneResult.WESTERN_ARCHITECTURE, BaiduSceneResult.CHURCH}, new int[]{0, 0, 0, 24, BaiduSceneResult.TAEKWONDO, BaiduSceneResult.CAR, BaiduSceneResult.STATION, BaiduSceneResult.STREET_VIEW, 51, BaiduSceneResult.MOUNTAINEERING, BaiduSceneResult.STREET_VIEW, 53}, new int[]{0, 0, 0, 28, BaiduSceneResult.TAEKWONDO, BaiduSceneResult.CAR, BaiduSceneResult.STATION, BaiduSceneResult.STREET_VIEW, 77, 83, 78, 86, 1, 41, 0, 70, 77, 83, 78, 86, BaiduSceneResult.CHURCH, BaiduSceneResult.STREET_VIEW, 52, 50}, new int[]{-1, -1, -1, -1, BaiduSceneResult.TAEKWONDO, BaiduSceneResult.CAR, BaiduSceneResult.STATION, BaiduSceneResult.STREET_VIEW, 51, BaiduSceneResult.MOUNTAINEERING, BaiduSceneResult.STREET_VIEW, 53}, new int[]{-1, -1, -1, -1, BaiduSceneResult.TAEKWONDO, BaiduSceneResult.CAR, BaiduSceneResult.STATION, BaiduSceneResult.STREET_VIEW, 77, 83, 78, 86}, new int[]{-1, -1, -1, -1, BaiduSceneResult.TAEKWONDO, BaiduSceneResult.CAR, BaiduSceneResult.STATION, BaiduSceneResult.STREET_VIEW, BaiduSceneResult.TEMPLE, BaiduSceneResult.BUILDING_OTHER, BaiduSceneResult.WESTERN_ARCHITECTURE, BaiduSceneResult.CHURCH}, new int[]{0, 0, 0, 24, BaiduSceneResult.TAEKWONDO, BaiduSceneResult.CAR, BaiduSceneResult.STATION, BaiduSceneResult.STREET_VIEW, BaiduSceneResult.CHURCH, BaiduSceneResult.STREET_VIEW, 52, 49}}),
    F_3GP((String) FileCategory.VideoOrAudio, (int) new String[]{"3gp", "3gpp", "3g2"}, (FileCategory) new int[][]{new int[]{0, 0, 0, -1, BaiduSceneResult.TAEKWONDO, BaiduSceneResult.CAR, BaiduSceneResult.STATION, BaiduSceneResult.STREET_VIEW, 51, BaiduSceneResult.MOUNTAINEERING, BaiduSceneResult.STREET_VIEW}, new int[]{0, 0, 0, -1, BaiduSceneResult.TAEKWONDO, BaiduSceneResult.CAR, BaiduSceneResult.STATION, BaiduSceneResult.STREET_VIEW, 51, BaiduSceneResult.MOUNTAINEERING, 50}}),
    K3G(FileCategory.Video, new String[]{"k3g"}),
    ACC(FileCategory.Video, new String[]{"acc"}),
    AVI((String) FileCategory.Video, (int) new String[]{"avi"}, (FileCategory) new int[][]{new int[]{82, 73, 70, 70, -1, -1, -1, -1, 65, 86, 73, 32, 76, 73, 83, 84}}),
    MOV((String) FileCategory.Video, (int) new String[]{"mov"}, (FileCategory) new int[][]{new int[]{0, 0, 0, 20, BaiduSceneResult.TAEKWONDO, BaiduSceneResult.CAR, BaiduSceneResult.STATION, BaiduSceneResult.STREET_VIEW, BaiduSceneResult.FOUNTAIN, BaiduSceneResult.CAR, 32, 32}, new int[]{BaiduSceneResult.TAEKWONDO, BaiduSceneResult.CAR, BaiduSceneResult.STATION, BaiduSceneResult.STREET_VIEW, BaiduSceneResult.FOUNTAIN, BaiduSceneResult.CAR, 32, 32}, new int[]{-1, -1, -1, -1, BaiduSceneResult.CHURCH, BaiduSceneResult.WESTERN_ARCHITECTURE, BaiduSceneResult.WESTERN_ARCHITECTURE, BaiduSceneResult.SUBWAY}}),
    WMV((String) FileCategory.Video, (int) new String[]{"wmv"}, (FileCategory) new int[][]{new int[]{48, 38, 178, BaiduSceneResult.FERRY, BaiduSceneResult.DIGITAL_PRODUCT, BaiduSceneResult.TAEKWONDO, 207, 17, 166, 217, 0, 170, 0, 98, 206, BaiduSceneResult.ANCIENT_CHINESE_ARCHITECTURE}}),
    MP3((String) FileCategory.Audio, (int) new String[]{"mp3"}, (FileCategory) new int[][]{new int[]{73, 68, 51}, new int[]{255, 251}}),
    AAC((String) FileCategory.Audio, (int) new String[]{"aac"}, (FileCategory) new int[][]{new int[]{255, 241}, new int[]{255, 249}}),
    BMP((String) FileCategory.Image, (int) new String[]{"bmp"}, (FileCategory) new int[][]{new int[]{66, 77}}),
    TTF(FileCategory.Font, new String[]{"ttf", "otf"}),
    WBMP((String) FileCategory.Image, (int) new String[]{"wbmp"}, (FileCategory) false);
    
    private static final int CHECK_SIZE = 32;
    private static final String LOG_TAG = "FileType";
    private static final byte[] WEBP_HEADER = null;
    private static final Map<String, FileType> extensionMap = null;
    private final FileCategory category;
    private final boolean extensionOnly;
    private final String[] extensions;
    private final a imp;
    private final boolean isSupportedFormat;

    public enum FileCategory {
        private static final /* synthetic */ FileCategory[] $VALUES = null;
        public static final FileCategory Audio = null;
        public static final FileCategory Font = null;
        public static final FileCategory Image = null;
        public static final FileCategory Video = null;
        public static final FileCategory VideoOrAudio = null;

        static {
            Audio = new FileCategory("Audio", 0);
            Video = new FileCategory("Video", 1);
            VideoOrAudio = new FileCategory("VideoOrAudio", 2);
            Image = new FileCategory("Image", 3);
            Font = new FileCategory("Font", 4);
            $VALUES = new FileCategory[]{Audio, Video, VideoOrAudio, Image, Font};
        }

        private FileCategory(String str, int i) {
        }

        public static FileCategory valueOf(String str) {
            return (FileCategory) Enum.valueOf(FileCategory.class, str);
        }

        public static FileCategory[] values() {
            return (FileCategory[]) $VALUES.clone();
        }
    }

    private static abstract class a {
        private a() {
        }

        /* access modifiers changed from: 0000 */
        public abstract boolean a(byte[] bArr);
    }

    static {
        extensionMap = new HashMap();
        WEBP_HEADER = new byte[]{82, 73, 70, 70, 87, 69, 66, 80};
    }

    private FileType(FileCategory fileCategory, String[] strArr) {
        this.imp = new a() {
            /* access modifiers changed from: 0000 */
            public boolean a(byte[] bArr) {
                return false;
            }
        };
        this.category = fileCategory;
        this.extensions = strArr;
        this.extensionOnly = true;
        this.isSupportedFormat = true;
    }

    private FileType(FileCategory fileCategory, String[] strArr, boolean z) {
        this.imp = new a() {
            /* access modifiers changed from: 0000 */
            public boolean a(byte[] bArr) {
                return false;
            }
        };
        this.category = fileCategory;
        this.extensions = strArr;
        this.extensionOnly = false;
        this.isSupportedFormat = z;
    }

    private FileType(FileCategory fileCategory, String[] strArr, final int[]... iArr) {
        this.imp = new a() {
            /* access modifiers changed from: 0000 */
            public boolean a(byte[] bArr) {
                for (int[] iArr : iArr) {
                    if (bArr.length >= iArr.length) {
                        int i = 0;
                        while (i < iArr.length) {
                            if (iArr[i] == -1 || bArr[i] == ((byte) iArr[i])) {
                                i++;
                            }
                        }
                        return true;
                    }
                }
                return false;
            }
        };
        this.category = fileCategory;
        this.extensions = strArr;
        this.extensionOnly = false;
        this.isSupportedFormat = true;
    }

    private static void a() {
        FileType[] values;
        if (extensionMap.isEmpty()) {
            for (FileType fileType : values()) {
                for (String put : fileType.extensions) {
                    extensionMap.put(put, fileType);
                }
            }
        }
    }

    public static FileType fromExtension(File file) {
        if (file == null) {
            return null;
        }
        String name = file.getName();
        int lastIndexOf = name.lastIndexOf(46);
        Object lowerCase = lastIndexOf >= 0 ? name.substring(lastIndexOf + 1).toLowerCase(Locale.US) : null;
        if (lowerCase == null) {
            return null;
        }
        if (extensionMap.isEmpty()) {
            a();
        }
        return (FileType) extensionMap.get(lowerCase);
    }

    public static FileType fromExtension(String str) {
        if (str == null) {
            return null;
        }
        int lastIndexOf = str.lastIndexOf(46);
        if (lastIndexOf < 0 || lastIndexOf < str.lastIndexOf(47)) {
            return null;
        }
        String lowerCase = str.substring(lastIndexOf + 1).toLowerCase(Locale.US);
        if (extensionMap.isEmpty()) {
            a();
        }
        return (FileType) extensionMap.get(lowerCase);
    }

    /* JADX WARNING: Removed duplicated region for block: B:44:0x008d  */
    /* JADX WARNING: Removed duplicated region for block: B:52:0x00da A[RETURN] */
    /* JADX WARNING: Removed duplicated region for block: B:55:0x00de  */
    /* JADX WARNING: Removed duplicated region for block: B:76:0x00d8 A[EDGE_INSN: B:76:0x00d8->B:51:0x00d8 ?: BREAK  
EDGE_INSN: B:76:0x00d8->B:51:0x00d8 ?: BREAK  , SYNTHETIC] */
    public static FileType fromFile(File file) {
        byte[] bArr;
        FileType[] values;
        int i;
        int length;
        FileType fileType;
        int i2;
        FileInputStream fileInputStream;
        FileType[] values2;
        if (file == null) {
            return null;
        }
        String name = file.getName();
        int lastIndexOf = name.lastIndexOf(46);
        String substring = lastIndexOf >= 0 ? name.substring(lastIndexOf + 1) : null;
        if (substring != null) {
            for (FileType fileType2 : values()) {
                String[] strArr = fileType2.extensions;
                int length2 = strArr.length;
                int i3 = 0;
                while (i3 < length2) {
                    String str = strArr[i3];
                    if (!fileType2.extensionOnly || !str.equalsIgnoreCase(substring)) {
                        i3++;
                    } else {
                        String str2 = LOG_TAG;
                        StringBuilder sb = new StringBuilder();
                        sb.append("FileType extension match: ");
                        sb.append(fileType2.name());
                        Log.d(str2, sb.toString());
                        return fileType2;
                    }
                }
            }
        }
        if (!file.exists() || file.length() < 32) {
            bArr = null;
        } else {
            bArr = new byte[32];
            try {
                fileInputStream = new FileInputStream(file);
                i = fileInputStream.read(bArr);
                try {
                    fileInputStream.close();
                } catch (IOException unused) {
                }
            } catch (IOException unused2) {
                i = 0;
                bArr = null;
                FileType[] values3 = values();
                length = values3.length;
                fileType = null;
                i2 = 0;
                while (true) {
                    if (i2 < length) {
                    }
                    i2++;
                }
                if (fileType != null) {
                }
                if (substring != null) {
                }
                return null;
            } catch (Throwable th) {
                fileInputStream.close();
                throw th;
            }
            if (bArr != null && i >= 32) {
                FileType[] values32 = values();
                length = values32.length;
                fileType = null;
                i2 = 0;
                while (true) {
                    if (i2 < length) {
                        break;
                    }
                    FileType fileType3 = values32[i2];
                    if (fileType3.imp.a(bArr)) {
                        String str3 = LOG_TAG;
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("FileType analysis match: ");
                        sb2.append(fileType3.name());
                        Log.d(str3, sb2.toString());
                        if (fileType != null) {
                            String str4 = LOG_TAG;
                            StringBuilder sb3 = new StringBuilder();
                            sb3.append("FileType analysis MULTIPLE match: ");
                            sb3.append(fileType3.name());
                            sb3.append(" (fall back to file extension)");
                            Log.d(str4, sb3.toString());
                            fileType = null;
                            break;
                        }
                        fileType = fileType3;
                    }
                    i2++;
                }
                if (fileType != null) {
                    return fileType;
                }
            }
        }
        if (substring != null) {
            for (FileType fileType4 : values()) {
                for (String equalsIgnoreCase : fileType4.extensions) {
                    if (equalsIgnoreCase.equalsIgnoreCase(substring)) {
                        String str5 = LOG_TAG;
                        StringBuilder sb4 = new StringBuilder();
                        sb4.append("FileType extension match: ");
                        sb4.append(fileType4.name());
                        sb4.append(" [");
                        sb4.append(bArr == null ? "null" : n.a(bArr));
                        sb4.append("]");
                        Log.d(str5, sb4.toString());
                        return fileType4;
                    }
                }
            }
        }
        return null;
    }

    public static FileType fromFile(String str) {
        if (str == null) {
            return null;
        }
        return fromFile(new File(str));
    }

    public FileCategory getCategory() {
        return this.category;
    }

    public boolean isAudio() {
        return this.category == FileCategory.Audio || this.category == FileCategory.VideoOrAudio;
    }

    public boolean isImage() {
        return this.category == FileCategory.Image;
    }

    public boolean isSupportedFormat() {
        return this.isSupportedFormat;
    }

    public boolean isVideo() {
        return this.category == FileCategory.Video || this.category == FileCategory.VideoOrAudio;
    }
}
