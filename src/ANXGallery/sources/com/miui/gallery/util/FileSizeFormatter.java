package com.miui.gallery.util;

import android.content.Context;
import android.content.res.Resources;
import android.os.Build.VERSION;
import android.text.BidiFormatter;
import android.text.TextUtils;
import com.miui.gallery.R;
import java.util.Locale;

public final class FileSizeFormatter {

    public static class BytesResult {
        public final long roundedBytes;
        public final String units;
        public final String value;

        public BytesResult(String str, String str2, long j) {
            this.value = str;
            this.units = str2;
            this.roundedBytes = j;
        }
    }

    private static String bidiWrap(Context context, String str) {
        return TextUtils.getLayoutDirectionFromLocale(localeFromContext(context)) == 1 ? BidiFormatter.getInstance(true).unicodeWrap(str) : str;
    }

    /* JADX WARNING: Removed duplicated region for block: B:46:0x0097  */
    /* JADX WARNING: Removed duplicated region for block: B:49:0x00b0  */
    /* JADX WARNING: Removed duplicated region for block: B:57:0x00cf  */
    /* JADX WARNING: Removed duplicated region for block: B:64:0x00e6  */
    /* JADX WARNING: Removed duplicated region for block: B:66:0x00ea  */
    public static BytesResult formatBytes(Resources resources, long j, int i) {
        long j2;
        String str;
        int length;
        long j3 = j;
        int i2 = (i & 8) != 0 ? 1024 : 1000;
        boolean z = j3 < 0;
        if (z) {
            j3 = -j3;
        }
        float f = (float) j3;
        int i3 = R.string.byteShort;
        if (f > 900.0f) {
            i3 = R.string.kilobyteShort;
            j2 = (long) i2;
            f /= (float) i2;
        } else {
            j2 = 1;
        }
        if (f > 900.0f) {
            i3 = R.string.megabyteShort;
            j2 *= (long) i2;
            f /= (float) i2;
        }
        if (f > 900.0f) {
            i3 = R.string.gigabyteShort;
            j2 *= (long) i2;
            f /= (float) i2;
        }
        if (f > 900.0f) {
            i3 = R.string.terabyteShort;
            j2 *= (long) i2;
            f /= (float) i2;
        }
        if (f > 900.0f) {
            i3 = R.string.petabyteShort;
            j2 *= (long) i2;
            f /= (float) i2;
        }
        int i4 = 100;
        if (j2 == 1 || f >= 100.0f) {
            str = "%.0f";
        } else {
            if (f < 1.0f) {
                str = "%.2f";
            } else if (f < 10.0f) {
                if ((i & 1) != 0) {
                    str = "%.1f";
                    i4 = 10;
                } else {
                    str = "%.2f";
                }
            } else if ((i & 1) != 0) {
                str = "%.0f";
            } else {
                str = "%.2f";
            }
            if (z) {
                f = -f;
            }
            String format = String.format(str, new Object[]{Float.valueOf(f)});
            length = format.length();
            if (length > 3) {
                int i5 = length - 3;
                if (format.charAt(i5) == '.' && format.charAt(length - 2) == '0' && format.charAt(length - 1) == '0') {
                    format = format.substring(0, i5);
                    long round = (i & 2) == 0 ? 0 : (((long) Math.round(f * ((float) i4))) * j2) / ((long) i4);
                    Resources resources2 = resources;
                    return new BytesResult(format, resources.getString(i3), round);
                }
            }
            if (length > 2) {
                int i6 = length - 2;
                if (format.charAt(i6) == '.' && format.charAt(length - 1) == '0') {
                    format = format.substring(0, i6);
                }
            }
            if ((i & 2) == 0) {
            }
            Resources resources22 = resources;
            return new BytesResult(format, resources.getString(i3), round);
        }
        i4 = 1;
        if (z) {
        }
        String format2 = String.format(str, new Object[]{Float.valueOf(f)});
        length = format2.length();
        if (length > 3) {
        }
        if (length > 2) {
        }
        if ((i & 2) == 0) {
        }
        Resources resources222 = resources;
        return new BytesResult(format2, resources.getString(i3), round);
    }

    public static String formatShortFileSize(Context context, long j) {
        if (context == null) {
            return "";
        }
        BytesResult formatBytes = formatBytes(context.getResources(), j, 9);
        return bidiWrap(context, context.getString(R.string.fileSizeSuffix, new Object[]{formatBytes.value, formatBytes.units}));
    }

    private static Locale localeFromContext(Context context) {
        return VERSION.SDK_INT >= 24 ? context.getResources().getConfiguration().getLocales().get(0) : context.getResources().getConfiguration().locale;
    }
}
