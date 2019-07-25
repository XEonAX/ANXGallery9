package com.miui.gallery.util;

import android.content.Context;
import android.media.MediaExtractor;
import android.media.MediaFormat;
import android.os.Build;
import android.text.TextUtils;
import android.util.Log;
import com.miui.extraphoto.sdk.ExtraPhotoSDK;
import com.miui.gallery.R;
import com.miui.gallery.cloudcontrol.CloudControlStrategyHelper;
import com.miui.gallery.cloudcontrol.strategies.ScannerStrategy.SpecialTypeMediaStrategy;
import com.miui.gallery3d.exif.ExifInterface;
import java.io.File;
import java.io.IOException;
import java.util.Map;
import miui.util.SoftReferenceSingleton;
import org.jcodec.containers.mp4.boxes.MetaValue;
import org.jcodec.movtool.MetadataEditor;

public class SpecialTypeMediaUtils {
    /* access modifiers changed from: private */
    public static final boolean DEBUG_ENABLE = Log.isLoggable("SpecialTypeMedia", 3);
    private static final SoftReferenceSingleton<SpecialTypeMediaStrategy> SPECIAL_TYPE_MEDIA_STRATEGY = new SoftReferenceSingleton<SpecialTypeMediaStrategy>() {
        /* access modifiers changed from: protected */
        public SpecialTypeMediaStrategy createInstance() {
            SpecialTypeMediaStrategy specialTypeMediaStrategy = CloudControlStrategyHelper.getSpecialTypeMediaStrategy();
            if (SpecialTypeMediaUtils.DEBUG_ENABLE) {
                Log.d("SpecialTypeMediaUtils", (Object) specialTypeMediaStrategy);
            }
            return specialTypeMediaStrategy;
        }
    };

    private static int extractFrameRate(String str) {
        int i = 0;
        if (TextUtils.isEmpty(str)) {
            return 0;
        }
        MediaExtractor mediaExtractor = new MediaExtractor();
        try {
            mediaExtractor.setDataSource(str);
            int trackCount = mediaExtractor.getTrackCount();
            int i2 = 0;
            while (true) {
                if (i2 >= trackCount) {
                    break;
                }
                MediaFormat trackFormat = mediaExtractor.getTrackFormat(i2);
                String string = trackFormat.getString("mime");
                if (!TextUtils.isEmpty(string) && string.startsWith("video/") && trackFormat.containsKey("frame-rate")) {
                    i = trackFormat.getInteger("frame-rate");
                    break;
                }
                i2++;
            }
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Throwable th) {
            mediaExtractor.release();
            throw th;
        }
        mediaExtractor.release();
        if (DEBUG_ENABLE) {
            Log.d("SpecialTypeMediaUtils", "path [%s] frameRate [%d]", str, Integer.valueOf(i));
        }
        return i;
    }

    private static boolean is960FpsVideo(String str) {
        boolean z = false;
        try {
            Map keyedMeta = MetadataEditor.createFrom(new File(str)).getKeyedMeta();
            if (keyedMeta != null) {
                MetaValue metaValue = (MetaValue) keyedMeta.get("com.xiaomi.capture_framerate");
                if (metaValue != null && metaValue.getInt() == 960) {
                    z = true;
                }
                return z;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static boolean is960VideoEditable(String str) {
        boolean z = false;
        try {
            Map keyedMeta = MetadataEditor.createFrom(new File(str)).getKeyedMeta();
            if (keyedMeta != null) {
                MetaValue metaValue = (MetaValue) keyedMeta.get("com.xiaomi.capture_origin_track");
                if (metaValue != null && metaValue.getInt() >= 0) {
                    z = true;
                }
                return z;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static boolean isBurstPhoto(long j) {
        return (j & 64) != 0;
    }

    public static boolean isMTSpecialAITypeSupport() {
        return Build.DEVICE.equalsIgnoreCase("vela");
    }

    public static boolean isMotionPhoto(Context context, long j) {
        return (j & 32) != 0 && ExtraPhotoSDK.isDeviceSupportMotionPhoto(context);
    }

    public static boolean isRefocusSupported(Context context, long j) {
        return (j & 1) != 0 && ExtraPhotoSDK.isDeviceSupportRefocus(context);
    }

    public static long parseFlagsForImage(String str) {
        long currentTimeMillis = System.currentTimeMillis();
        long j = 0;
        if (!TextUtils.isEmpty(str) && FileMimeUtil.hasExif(str)) {
            try {
                ExifInterface exifInterface = new ExifInterface();
                exifInterface.readExif(str);
                if (ExifUtil.supportRefocus(exifInterface)) {
                    j = 1;
                } else if (ExifUtil.isMotionPhoto(exifInterface)) {
                    j = 32;
                }
                int mTSpecialAITypeValue = ExifUtil.getMTSpecialAITypeValue(exifInterface);
                if (mTSpecialAITypeValue > 0) {
                    j |= parseMTSpecialAITypeByValue(mTSpecialAITypeValue);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if (DEBUG_ENABLE) {
            Log.d("SpecialTypeMediaUtils", "parseFlagsForImage costs [%dms], path [%s]", Long.valueOf(System.currentTimeMillis() - currentTimeMillis), str);
        }
        return j;
    }

    /* JADX WARNING: Removed duplicated region for block: B:22:0x005a  */
    public static long parseFlagsForVideo(String str) {
        long j;
        long currentTimeMillis = System.currentTimeMillis();
        if (!TextUtils.isEmpty(str)) {
            SpecialTypeMediaStrategy specialTypeMediaStrategy = (SpecialTypeMediaStrategy) SPECIAL_TYPE_MEDIA_STRATEGY.get();
            long extractFrameRate = (long) extractFrameRate(str);
            if (extractFrameRate >= specialTypeMediaStrategy.getHfr120FpsLowerBound() && extractFrameRate <= specialTypeMediaStrategy.getHfr120FpsUpperBound()) {
                j = 4;
                if (DEBUG_ENABLE) {
                }
                return j;
            } else if (extractFrameRate < specialTypeMediaStrategy.getHfr240FpsLowerBound() || extractFrameRate > specialTypeMediaStrategy.getHfr240FpsUpperBound()) {
                String mimeTypeByParseFile = FileMimeUtil.getMimeTypeByParseFile(str);
                if (mimeTypeByParseFile != null && "video/mp4".equals(mimeTypeByParseFile) && is960FpsVideo(str)) {
                    j = 16;
                    if (DEBUG_ENABLE) {
                        Log.d("SpecialTypeMediaUtils", "parseFlagsForVideo costs [%dms], flags [%d], path [%s]", Long.valueOf(System.currentTimeMillis() - currentTimeMillis), Long.valueOf(j), str);
                    }
                    return j;
                }
            } else {
                j = 8;
                if (DEBUG_ENABLE) {
                }
                return j;
            }
        }
        j = 0;
        if (DEBUG_ENABLE) {
        }
        return j;
    }

    public static long parseMTSpecialAITypeByValue(int i) {
        if (i == 5) {
            return 128;
        }
        switch (i) {
            case 9:
                return 256;
            case 10:
                return 512;
            default:
                switch (i) {
                    case 13:
                        return 1024;
                    case 14:
                        return 2048;
                    case 15:
                        return 4096;
                    default:
                        return 0;
                }
        }
    }

    public static int parseMTSpecialAITypeDescriptionRes(long j) {
        if (j == 0 || !isMTSpecialAITypeSupport()) {
            return 0;
        }
        if ((128 & j) != 0) {
            return R.string.special_type_hdr;
        }
        if ((256 & j) != 0) {
            return R.string.special_type_night_beauty;
        }
        if ((512 & j) != 0) {
            return R.string.special_type_night_mode;
        }
        if ((1024 & j) != 0) {
            return R.string.special_type_portrait;
        }
        if ((2048 & j) != 0) {
            return R.string.special_type_eye_repair;
        }
        if ((j & 4096) != 0) {
            return R.string.special_type_wide_angle;
        }
        return 0;
    }

    public static int tryGetHFRIndicatorResId(long j) {
        if ((4 & j) != 0 || (8 & j) != 0) {
            return R.drawable.type_indicator_hfr;
        }
        if ((j & 16) != 0) {
            return R.drawable.type_indicator_extra_hfr;
        }
        return 0;
    }
}
