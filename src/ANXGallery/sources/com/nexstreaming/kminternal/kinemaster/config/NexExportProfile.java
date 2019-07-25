package com.nexstreaming.kminternal.kinemaster.config;

import android.content.res.Resources;
import android.media.CamcorderProfile;
import com.nexstreaming.nexeditorsdk.nexClip;
import com.nexstreaming.nexeditorsdk.nexEngine;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class NexExportProfile implements Serializable {
    public static final NexExportProfile EXPORT_1080P;
    public static final NexExportProfile EXPORT_1088P;
    public static final NexExportProfile EXPORT_320_180;
    public static final NexExportProfile EXPORT_320_192;
    public static final NexExportProfile EXPORT_400_240;
    public static final NexExportProfile EXPORT_640_352;
    public static final NexExportProfile EXPORT_640_360;
    public static final NexExportProfile EXPORT_640_368;
    public static final NexExportProfile EXPORT_640_480;
    public static final NexExportProfile EXPORT_720P;
    public static final NexExportProfile EXPORT_736P;
    public static final NexExportProfile EXPORT_800_480;
    public static final NexExportProfile EXPORT_864_480;
    public static final NexExportProfile EXPORT_960_540;
    public static final NexExportProfile EXPORT_960_544;
    private static final long serialVersionUID = 1;
    private final int m_bitrate;
    private final int m_displayHeight;
    private final String m_full_hd = "Full HD";
    private final String m_hd = "High Definition";
    private final int m_height;
    private final int m_labelResource;
    private final String m_low_quality = "Low Quality";
    private final String m_med_quality = "Medium Quality";
    private final int m_width;

    static {
        NexExportProfile nexExportProfile = new NexExportProfile(1920, 1080, 1080, 12582912, 1);
        EXPORT_1080P = nexExportProfile;
        NexExportProfile nexExportProfile2 = new NexExportProfile(1920, 1088, 1080, 12582912, 1);
        EXPORT_1088P = nexExportProfile2;
        NexExportProfile nexExportProfile3 = new NexExportProfile(1280, 720, 720, 6291456, 2);
        EXPORT_720P = nexExportProfile3;
        NexExportProfile nexExportProfile4 = new NexExportProfile(1280, 736, 720, 6291456, 2);
        EXPORT_736P = nexExportProfile4;
        NexExportProfile nexExportProfile5 = new NexExportProfile(960, 540, 540, 3145728, 3);
        EXPORT_960_540 = nexExportProfile5;
        NexExportProfile nexExportProfile6 = new NexExportProfile(960, 544, 540, 3145728, 3);
        EXPORT_960_544 = nexExportProfile6;
        NexExportProfile nexExportProfile7 = new NexExportProfile(800, 480, 480, 1572864, 3);
        EXPORT_800_480 = nexExportProfile7;
        NexExportProfile nexExportProfile8 = new NexExportProfile(864, 480, 480, nexEngine.ExportHEVCHighTierLevel6, 3);
        EXPORT_864_480 = nexExportProfile8;
        NexExportProfile nexExportProfile9 = new NexExportProfile(640, 480, 480, 1572864, 4);
        EXPORT_640_480 = nexExportProfile9;
        NexExportProfile nexExportProfile10 = new NexExportProfile(640, 360, 360, nexEngine.ExportHEVCHighTierLevel6, 4);
        EXPORT_640_360 = nexExportProfile10;
        NexExportProfile nexExportProfile11 = new NexExportProfile(640, 368, 360, nexEngine.ExportHEVCHighTierLevel6, 4);
        EXPORT_640_368 = nexExportProfile11;
        NexExportProfile nexExportProfile12 = new NexExportProfile(640, 352, 360, nexEngine.ExportHEVCHighTierLevel6, 4);
        EXPORT_640_352 = nexExportProfile12;
        NexExportProfile nexExportProfile13 = new NexExportProfile(400, 240, 240, nexEngine.ExportHEVCHighTierLevel52, 4);
        EXPORT_400_240 = nexExportProfile13;
        NexExportProfile nexExportProfile14 = new NexExportProfile(320, nexClip.kClip_Rotate_180, nexClip.kClip_Rotate_180, nexEngine.ExportHEVCHighTierLevel52, 4);
        EXPORT_320_180 = nexExportProfile14;
        NexExportProfile nexExportProfile15 = new NexExportProfile(320, 192, nexClip.kClip_Rotate_180, nexEngine.ExportHEVCHighTierLevel52, 4);
        EXPORT_320_192 = nexExportProfile15;
    }

    public NexExportProfile(int i, int i2, int i3, int i4, int i5) {
        this.m_width = i;
        this.m_height = i2;
        this.m_bitrate = i4;
        this.m_displayHeight = i3;
        this.m_labelResource = i5;
    }

    public static NexExportProfile getExportProfiles(int i, int i2) {
        NexExportProfile nexExportProfile;
        int[] iArr = {6, 5, 4, 3, 7};
        int i3 = 0;
        while (true) {
            if (i3 >= iArr.length) {
                nexExportProfile = null;
                break;
            }
            if (CamcorderProfile.hasProfile(iArr[i3])) {
                CamcorderProfile camcorderProfile = CamcorderProfile.get(iArr[i3]);
                if (camcorderProfile != null) {
                    int abs = Math.abs(camcorderProfile.videoFrameWidth - i);
                    int abs2 = Math.abs(camcorderProfile.videoFrameHeight - i2);
                    if (abs < 32 && abs2 < 32) {
                        nexExportProfile = new NexExportProfile(camcorderProfile.videoFrameWidth, camcorderProfile.videoFrameHeight, camcorderProfile.videoFrameHeight, camcorderProfile.videoBitRate, getLabelResource(camcorderProfile.videoFrameWidth, camcorderProfile.videoFrameHeight));
                        break;
                    }
                } else {
                    continue;
                }
            }
            i3++;
        }
        if (nexExportProfile != null) {
            return nexExportProfile;
        }
        NexExportProfile nexExportProfile2 = new NexExportProfile(i, i2, i2, i * i2 * 6, getLabelResource(i, i2));
        return nexExportProfile2;
    }

    public static List<NexExportProfile> getExportProfiles(int i) {
        int[] iArr = {6, 5, 4};
        ArrayList arrayList = new ArrayList();
        for (int i2 = 0; i2 < iArr.length; i2++) {
            if (CamcorderProfile.hasProfile(iArr[i2])) {
                CamcorderProfile camcorderProfile = CamcorderProfile.get(iArr[i2]);
                if (camcorderProfile != null && camcorderProfile.videoFrameHeight * camcorderProfile.videoFrameWidth <= i) {
                    NexExportProfile nexExportProfile = new NexExportProfile(camcorderProfile.videoFrameWidth, camcorderProfile.videoFrameHeight, camcorderProfile.videoFrameHeight, camcorderProfile.videoBitRate, getLabelResource(camcorderProfile.videoFrameWidth, camcorderProfile.videoFrameHeight));
                    arrayList.add(nexExportProfile);
                }
            }
        }
        return arrayList;
    }

    public static int getLabelResource(int i, int i2) {
        if (i2 > 1000) {
            return 1;
        }
        if (i2 > 700) {
            return 2;
        }
        return i2 > 450 ? 3 : 4;
    }

    public static NexExportProfile[] supportedProfiles() {
        return new NexExportProfile[]{EXPORT_1080P, EXPORT_720P, EXPORT_960_540, EXPORT_640_360};
    }

    public int bitrate() {
        return this.m_bitrate;
    }

    public int displayHeight() {
        return this.m_displayHeight;
    }

    public int height() {
        return this.m_height;
    }

    public String label(Resources resources) {
        if (!(resources == null || this.m_labelResource == 0)) {
            switch (this.m_labelResource) {
                case 1:
                    return "Full HD";
                case 2:
                    return "High Definition";
                case 3:
                    return "Medium Quality";
                case 4:
                    return "Low Quality";
            }
        }
        StringBuilder sb = new StringBuilder();
        sb.append(this.m_width);
        sb.append(" x ");
        sb.append(this.m_height);
        return sb.toString();
    }

    public int labelResource() {
        return this.m_labelResource;
    }

    public int width() {
        return this.m_width;
    }
}
