package com.nexstreaming.nexeditorsdk;

import java.util.Arrays;
import java.util.List;

public class nexAspectProfile {
    public static final int ExportProfileLevel_HIGH = 1;
    public static final int ExportProfileLevel_LOW = 3;
    public static final int ExportProfileLevel_MID = 2;
    public static final int ExportProfileLevel_NONE = 0;
    public static final nexAspectProfile ar16v9 = new nexAspectProfile(1280, 720, 1);
    public static final nexAspectProfile ar1v1 = new nexAspectProfile(720, 720, 2);
    public static final nexAspectProfile ar1v2 = new nexAspectProfile(720, 1440, 5);
    public static final nexAspectProfile ar2v1 = new nexAspectProfile(1440, 720, 4);
    public static final nexAspectProfile ar3v4 = new nexAspectProfile(720, 960, 7);
    public static final nexAspectProfile ar4v3 = new nexAspectProfile(960, 720, 6);
    public static final nexAspectProfile ar9v16 = new nexAspectProfile(720, 1280, 3);
    public static final nexAspectProfile ardef = new nexAspectProfile(1280, 720, 0);
    private static final float[] aspects = {1.7777778f, 1.0f, 0.5625f, 2.0f, 0.5f, 1.3333334f, 0.75f};
    private static final int[] export_land_heights = {1080, 720, 480, 360, 240, 160};
    private static final int export_max = 2073600;
    private static final int[] export_port_heights = {1920, 1280, 640, 640, 320, 240};
    private int aspectMode = 0;
    private float aspectRatio;
    private int height;
    private int width;

    public static class ExportProfile {
        private int bitrate;
        private int height;
        private int level;
        private int width;

        private ExportProfile(int i, int i2, int i3, int i4) {
            this.bitrate = i4;
            this.width = i2;
            this.level = i;
            this.height = i3;
        }

        public int getBitrate() {
            return this.bitrate;
        }

        public int getHeight() {
            return this.height;
        }

        public int getLevel() {
            return this.level;
        }

        public int getWidth() {
            return this.width;
        }
    }

    public nexAspectProfile(int i, int i2) {
        int i3;
        int i4 = 720;
        if (i > i2) {
            i3 = Math.round((((float) i) * 720.0f) / ((float) i2));
        } else {
            i4 = Math.round((((float) i2) * 720.0f) / ((float) i));
            i3 = 720;
        }
        this.width = i3;
        this.height = i4;
        this.aspectRatio = ((float) i3) / ((float) i4);
        this.aspectMode = getAspectMode(true);
    }

    private nexAspectProfile(int i, int i2, int i3) {
        this.width = i;
        this.height = i2;
        this.aspectRatio = ((float) i) / ((float) i2);
        this.aspectMode = i3;
    }

    public static int[] aspect2ReduceFraction(int i, int i2, int i3) {
        return (i3 == 90 || i3 == 270) ? reduceFraction(i2, i) : reduceFraction(i, i2);
    }

    private static int gcd(int i, int i2) {
        while (true) {
            int i3 = i2;
            int i4 = i;
            i = i3;
            if (i == 0) {
                return Math.abs(i4);
            }
            i2 = i4 % i;
        }
    }

    public static nexAspectProfile getAspectProfile(int i) {
        if (i <= 0) {
            return null;
        }
        List presetList = getPresetList();
        if (presetList.size() <= i) {
            return null;
        }
        return (nexAspectProfile) presetList.get(i);
    }

    public static List<nexAspectProfile> getPresetList() {
        return Arrays.asList(new nexAspectProfile[]{ardef, ar16v9, ar1v1, ar9v16, ar2v1, ar1v2, ar4v3, ar3v4});
    }

    public static int getSimilarAspectMode(float f) {
        int i = 1;
        float f2 = 3.0f;
        for (int i2 = 0; i2 < aspects.length; i2++) {
            float f3 = f - aspects[i2];
            if (f3 < 0.0f) {
                f3 *= -1.0f;
            }
            if (f2 > f3) {
                i = i2;
                f2 = f3;
            }
        }
        return i + 1;
    }

    public static int getSimilarAspectMode(int i, int i2, int i3) {
        float f = (float) i;
        float f2 = (float) i2;
        float f3 = f / f2;
        if (i3 == 90 || i3 == 270) {
            f3 = f2 / f;
        }
        int i4 = 1;
        float f4 = 3.0f;
        for (int i5 = 0; i5 < aspects.length; i5++) {
            float f5 = f3 - aspects[i5];
            if (f5 < 0.0f) {
                f5 *= -1.0f;
            }
            if (f4 > f5) {
                i4 = i5;
                f4 = f5;
            }
        }
        return i4 + 1;
    }

    private static int[] reduceFraction(int i, int i2) {
        int[] iArr = {i, i2};
        if (iArr[1] == 0) {
            iArr[0] = 0;
            iArr[1] = 0;
            return iArr;
        }
        int gcd = gcd(iArr[0], iArr[1]);
        iArr[0] = iArr[0] / gcd;
        iArr[1] = iArr[1] / gcd;
        return iArr;
    }

    public int[] aspect2ReduceFraction() {
        return aspect2ReduceFraction(this.width, this.height, 0);
    }

    public int getAspectMode() {
        return this.aspectMode;
    }

    /* access modifiers changed from: 0000 */
    public int getAspectMode(boolean z) {
        float aspectRatio2 = getAspectRatio();
        if (aspectRatio2 == 1.7777778f) {
            return 1;
        }
        if (aspectRatio2 == 0.5625f) {
            return 3;
        }
        if (aspectRatio2 == 2.0f) {
            return 4;
        }
        if (aspectRatio2 == 1.0f) {
            return 2;
        }
        if (aspectRatio2 == 0.5f) {
            return 5;
        }
        if (aspectRatio2 == 0.75f) {
            return 7;
        }
        return aspectRatio2 == 1.3333334f ? 6 : 0;
    }

    public float getAspectRatio() {
        return this.aspectRatio;
    }

    public ExportProfile[] getExportProfiles() {
        ExportProfile[] exportProfileArr = new ExportProfile[3];
        int[] iArr = export_land_heights;
        if (!isLandscapeMode()) {
            iArr = export_port_heights;
        }
        int length = iArr.length;
        int i = 0;
        int i2 = 0;
        while (true) {
            if (i >= length) {
                break;
            }
            int i3 = iArr[i];
            if (2073600.0f >= ((float) (i3 * i3)) * getAspectRatio()) {
                float f = (float) i3;
                if ((getAspectRatio() * f) % 2.0f == 0.0f) {
                    int i4 = i2 + 1;
                    ExportProfile exportProfile = new ExportProfile(i4, (int) (f * getAspectRatio()), i3, 6291456);
                    exportProfileArr[i2] = exportProfile;
                    if (i4 == 3) {
                        i2 = i4;
                        break;
                    }
                    i2 = i4;
                } else {
                    continue;
                }
            }
            i++;
        }
        if (i2 < 3) {
            for (int i5 = i2; i5 < 3; i5++) {
                ExportProfile exportProfile2 = new ExportProfile(0, getWidth(), getHeight(), 6291456);
                exportProfileArr[i2] = exportProfile2;
            }
        }
        return exportProfileArr;
    }

    public int getHeight() {
        return this.height;
    }

    public int getSimilarAspectMode() {
        return getSimilarAspectMode(getAspectRatio());
    }

    public int getWidth() {
        return this.width;
    }

    public boolean isLandscapeMode() {
        return this.width >= this.height;
    }
}
