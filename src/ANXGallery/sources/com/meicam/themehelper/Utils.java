package com.meicam.themehelper;

import android.content.Context;
import android.content.res.AssetManager;
import android.graphics.RectF;
import android.util.DisplayMetrics;
import android.view.WindowManager;
import com.meicam.sdk.NvsAVFileInfo;
import com.meicam.sdk.NvsSize;
import com.meicam.sdk.NvsVideoClip;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import org.keyczar.Keyczar;

public class Utils {
    private static int[] motionIdxList = {0, 0, 0, 0};

    private static void LtToRb(RectF rectF, RectF rectF2, float[] fArr, float f) {
        rectF.left = Math.max(-1.0f, fArr[0] - 0.25f);
        rectF.right = Math.min(1.0f, fArr[0] + fArr[2] + 0.35f);
        rectF.top = ((((rectF.right - rectF.left) / NvsThemeHelper.m_timelineRatio) * f) / 2.0f) - 0.05f;
        rectF.bottom = (-rectF.top) - 0.1f;
        rectF2.left = Math.max(-1.0f, rectF.left - 0.1f);
        rectF2.top = Math.min(1.0f, rectF.top + 0.1f);
        rectF2.right = rectF.right - 0.1f;
        rectF2.bottom = rectF2.top - (((rectF2.right - rectF2.left) / NvsThemeHelper.m_timelineRatio) * f);
    }

    private static void RtToLb(RectF rectF, RectF rectF2, float[] fArr, float f) {
        rectF.right = Math.min(1.0f, fArr[0] + fArr[2] + 0.25f);
        rectF.left = Math.max(-1.0f, fArr[0] - 0.35f);
        rectF.top = ((((rectF.right - rectF.left) / NvsThemeHelper.m_timelineRatio) * f) / 2.0f) - 0.05f;
        rectF.bottom = (-rectF.top) - 0.1f;
        rectF2.right = Math.min(1.0f, rectF.right + 0.1f);
        rectF2.top = Math.min(1.0f, rectF.top + 0.1f);
        rectF2.left = rectF.left + 0.1f;
        rectF2.bottom = rectF2.top - (((rectF2.right - rectF2.left) / NvsThemeHelper.m_timelineRatio) * f);
    }

    private static RectF calcLandscapeLeftRec(RectF rectF, float f) {
        rectF.left = -1.0f;
        rectF.top = 1.4f;
        rectF.bottom = -1.4f;
        rectF.right = (((rectF.top - rectF.bottom) / f) * NvsThemeHelper.m_timelineRatio) + rectF.left;
        return rectF;
    }

    private static RectF calcLandscapeRightRec(RectF rectF, float f) {
        rectF.left = -0.8f;
        rectF.top = 1.4f;
        rectF.bottom = -1.4f;
        rectF.right = (((rectF.top - rectF.bottom) / f) * NvsThemeHelper.m_timelineRatio) + rectF.left;
        return rectF;
    }

    public static String changeHoriROI(float f, RectF rectF, String str, NvsVideoClip nvsVideoClip) {
        RectF rectF2 = new RectF();
        RectF rectF3 = new RectF();
        if (rectF != null) {
            upToBottomByFx(rectF2, rectF3, new float[]{rectF.left, rectF.top, rectF.width(), rectF.height()}, f);
        } else {
            normalUpToBottomByFx(rectF2, rectF3, f);
        }
        if (nvsVideoClip != null) {
            nvsVideoClip.setImageMotionROI(rectF2, rectF3);
            return str;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("");
        sb.append(rectF2.left);
        sb.append(",");
        sb.append(rectF2.right);
        sb.append(",");
        sb.append(rectF2.bottom);
        sb.append(",");
        sb.append(rectF2.top);
        String sb2 = sb.toString();
        StringBuilder sb3 = new StringBuilder();
        sb3.append("");
        sb3.append(rectF3.left);
        sb3.append(",");
        sb3.append(rectF3.right);
        sb3.append(",");
        sb3.append(rectF3.bottom);
        sb3.append(",");
        sb3.append(rectF3.top);
        return str.replace("xiaomiEndROI", sb2).replace("xiaomiStartROI", sb3.toString());
    }

    public static String changeHoriROIV3(float f, RectF rectF, String str, boolean z) {
        RectF rectF2 = new RectF();
        RectF rectF3 = new RectF();
        if (rectF != null) {
            upToBottomByFx(rectF2, rectF3, new float[]{rectF.left, rectF.top, rectF.width(), rectF.height()}, f);
        } else {
            normalUpToBottomByFx(rectF2, rectF3, f);
        }
        StringBuilder sb = new StringBuilder();
        sb.append("");
        sb.append(rectF2.left);
        sb.append(",");
        sb.append(rectF2.right);
        sb.append(",");
        sb.append(rectF2.bottom);
        sb.append(",");
        sb.append(rectF2.top);
        String sb2 = sb.toString();
        StringBuilder sb3 = new StringBuilder();
        sb3.append("");
        sb3.append(rectF3.left);
        sb3.append(",");
        sb3.append(rectF3.right);
        sb3.append(",");
        sb3.append(rectF3.bottom);
        sb3.append(",");
        sb3.append(rectF3.top);
        String sb4 = sb3.toString();
        return z ? str.replace("xiaomiStartROI", sb2).replace("xiaomiEndROI", sb4) : str.replace("jieshu", sb2).replace("kaishi", sb4);
    }

    public static String changeROI(float f, RectF rectF, String str) {
        RectF rectF2 = new RectF();
        RectF rectF3 = new RectF();
        setImageROI(rectF2, rectF3, rectF, f);
        StringBuilder sb = new StringBuilder();
        sb.append("");
        sb.append(rectF2.left);
        sb.append(",");
        sb.append(rectF2.right);
        sb.append(",");
        sb.append(rectF2.bottom);
        sb.append(",");
        sb.append(rectF2.top);
        String sb2 = sb.toString();
        StringBuilder sb3 = new StringBuilder();
        sb3.append("");
        sb3.append(rectF3.left);
        sb3.append(",");
        sb3.append(rectF3.right);
        sb3.append(",");
        sb3.append(rectF3.bottom);
        sb3.append(",");
        sb3.append(rectF3.top);
        return str.replace("xiaomiStartROI", sb2).replace("xiaomiEndROI", sb3.toString());
    }

    public static String changeROIV3(float f, RectF rectF, String str, boolean z) {
        RectF rectF2 = new RectF();
        RectF rectF3 = new RectF();
        setImageROI(rectF2, rectF3, rectF, f);
        StringBuilder sb = new StringBuilder();
        sb.append("");
        sb.append(rectF2.left);
        sb.append(",");
        sb.append(rectF2.right);
        sb.append(",");
        sb.append(rectF2.bottom);
        sb.append(",");
        sb.append(rectF2.top);
        String sb2 = sb.toString();
        StringBuilder sb3 = new StringBuilder();
        sb3.append("");
        sb3.append(rectF3.left);
        sb3.append(",");
        sb3.append(rectF3.right);
        sb3.append(",");
        sb3.append(rectF3.bottom);
        sb3.append(",");
        sb3.append(rectF3.top);
        String sb4 = sb3.toString();
        return z ? str.replace("xiaomiStartROI", sb2).replace("xiaomiEndROI", sb4) : str.replace("kaishi", sb2).replace("jieshu", sb4);
    }

    private static float changeROTBottom(RectF rectF, float f) {
        return rectF.left + (((rectF.top - rectF.bottom) / f) * NvsThemeHelper.m_timelineRatio);
    }

    public static String changeVertROI(float f, RectF rectF, String str, NvsVideoClip nvsVideoClip) {
        RectF rectF2 = new RectF();
        RectF rectF3 = new RectF();
        if (rectF != null) {
            leftToRightByFx(rectF2, rectF3, new float[]{rectF.left, rectF.top, rectF.width(), rectF.height()}, f);
        } else {
            normalLeftToRightByFx(rectF2, rectF3, f);
        }
        if (nvsVideoClip != null) {
            nvsVideoClip.setImageMotionROI(rectF2, rectF3);
            return str;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("");
        sb.append(rectF2.left);
        sb.append(",");
        sb.append(rectF2.right);
        sb.append(",");
        sb.append(rectF2.bottom);
        sb.append(",");
        sb.append(rectF2.top);
        String sb2 = sb.toString();
        StringBuilder sb3 = new StringBuilder();
        sb3.append("");
        sb3.append(rectF3.left);
        sb3.append(",");
        sb3.append(rectF3.right);
        sb3.append(",");
        sb3.append(rectF3.bottom);
        sb3.append(",");
        sb3.append(rectF3.top);
        return str.replace("xiaomiEndROI", sb2).replace("xiaomiStartROI", sb3.toString());
    }

    public static String changeVertROIV3(float f, RectF rectF, String str, boolean z) {
        RectF rectF2 = new RectF();
        RectF rectF3 = new RectF();
        if (rectF != null) {
            leftToRightByFx(rectF2, rectF3, new float[]{rectF.left, rectF.top, rectF.width(), rectF.height()}, f);
        } else {
            normalLeftToRightByFx(rectF2, rectF3, f);
        }
        StringBuilder sb = new StringBuilder();
        sb.append("");
        sb.append(rectF2.left);
        sb.append(",");
        sb.append(rectF2.right);
        sb.append(",");
        sb.append(rectF2.bottom);
        sb.append(",");
        sb.append(rectF2.top);
        String sb2 = sb.toString();
        StringBuilder sb3 = new StringBuilder();
        sb3.append("");
        sb3.append(rectF3.left);
        sb3.append(",");
        sb3.append(rectF3.right);
        sb3.append(",");
        sb3.append(rectF3.bottom);
        sb3.append(",");
        sb3.append(rectF3.top);
        String sb4 = sb3.toString();
        return z ? str.replace("xiaomiStartROI", sb2).replace("xiaomiEndROI", sb4) : str.replace("jieshu", sb2).replace("kaishi", sb4);
    }

    public static int dip2px(Context context, float f) {
        return (int) ((f * context.getResources().getDisplayMetrics().density) + 0.5f);
    }

    public static float getImgRatio(NvsAVFileInfo nvsAVFileInfo) {
        NvsSize videoStreamDimension = nvsAVFileInfo.getVideoStreamDimension(0);
        int videoStreamRotation = nvsAVFileInfo.getVideoStreamRotation(0);
        NvsSize nvsSize = new NvsSize(videoStreamDimension.width, videoStreamDimension.height);
        if (videoStreamRotation == 1 || videoStreamRotation == 3) {
            nvsSize.width = videoStreamDimension.height;
            nvsSize.height = videoStreamDimension.width;
        }
        return ((float) nvsSize.width) / ((float) nvsSize.height);
    }

    private static int getMotionIdx(int i, int i2) {
        int nextInt = NvsThemeHelper.rand.nextInt(i);
        if (i2 >= motionIdxList.length) {
            return nextInt;
        }
        if (nextInt == motionIdxList[i2]) {
            nextInt++;
            if (nextInt >= i) {
                nextInt = 0;
            }
        }
        motionIdxList[i2] = nextInt;
        return nextInt;
    }

    public static int getScreenWidth(Context context) {
        DisplayMetrics displayMetrics = new DisplayMetrics();
        ((WindowManager) context.getSystemService("window")).getDefaultDisplay().getMetrics(displayMetrics);
        return displayMetrics.widthPixels;
    }

    private static void leftToRight(RectF rectF, RectF rectF2, float[] fArr, float f) {
        rectF.left = Math.max(-1.0f, fArr[0] - 0.3f);
        rectF.top = 1.4f;
        rectF.bottom = -1.4f;
        rectF.right = (((rectF.top - rectF.bottom) / f) * NvsThemeHelper.m_timelineRatio) + rectF.left;
        rectF2.top = rectF.top;
        rectF2.bottom = rectF.bottom;
        rectF2.right = Math.min(1.0f, rectF.right + 0.15f);
        rectF2.left = (rectF.left + rectF2.right) - rectF.right;
    }

    private static void leftToRightByFx(RectF rectF, RectF rectF2, float[] fArr, float f) {
        if (((double) f) > 1.5d) {
            rectF.top = 1.4f;
            rectF.bottom = -1.4f;
            rectF.left = Math.max(-1.0f, ((-(((rectF.top - rectF.bottom) * NvsThemeHelper.m_timelineRatio) / f)) / 2.0f) - 0.075f);
            rectF.right = (((rectF.top - rectF.bottom) / f) * NvsThemeHelper.m_timelineRatio) + rectF.left;
            rectF2.top = rectF.top;
            rectF2.bottom = rectF.bottom;
            rectF2.right = Math.min(1.0f, rectF.right + 0.15f);
            rectF2.left = (rectF.left + rectF2.right) - rectF.right;
            return;
        }
        float f2 = ((fArr[1] * 2.0f) - fArr[3]) / 2.0f;
        rectF.left = -0.9f;
        rectF.right = 0.7f;
        rectF.top = ((((rectF.right - rectF.left) * f) / NvsThemeHelper.m_timelineRatio) / 2.0f) + f2;
        rectF.bottom = ((((-(rectF.right - rectF.left)) * f) / NvsThemeHelper.m_timelineRatio) / 2.0f) + f2;
        rectF2.left = -0.7f;
        rectF2.right = 0.9f;
        rectF2.top = rectF.top;
        rectF2.bottom = rectF.bottom;
    }

    private static void normalLbToRt(RectF rectF, RectF rectF2, float f) {
        rectF.left = -0.9f;
        rectF.top = 0.9f;
        rectF.right = 0.85f;
        rectF.bottom = rectF.top - ((rectF.width() * f) / NvsThemeHelper.m_timelineRatio);
        if (rectF.bottom < -1.0f) {
            rectF.bottom = -1.0f;
            rectF.right = changeROTBottom(rectF, f);
        }
        rectF2.left = -0.75f;
        rectF2.top = 1.0f;
        rectF2.right = 1.0f;
        rectF2.bottom = rectF2.top - ((rectF2.width() * f) / NvsThemeHelper.m_timelineRatio);
        if (rectF2.bottom < -1.0f) {
            rectF2.bottom = -1.0f;
            rectF2.right = changeROTBottom(rectF2, f);
        }
    }

    public static void normalLeftToRightByFx(RectF rectF, RectF rectF2, float f) {
        if (((double) f) > 1.5d) {
            rectF.top = 1.4f;
            rectF.bottom = -1.4f;
            rectF.left = Math.max(-1.0f, ((-(((rectF.top - rectF.bottom) * NvsThemeHelper.m_timelineRatio) / f)) / 2.0f) - 0.075f);
            rectF.right = (((rectF.top - rectF.bottom) / f) * NvsThemeHelper.m_timelineRatio) + rectF.left;
            rectF2.top = rectF.top;
            rectF2.bottom = rectF.bottom;
            rectF2.right = Math.min(1.0f, rectF.right + 0.15f);
            rectF2.left = (rectF.left + rectF2.right) - rectF.right;
            return;
        }
        rectF.left = -0.8f;
        rectF.right = 0.7f;
        rectF.top = (((rectF.right - rectF.left) * f) / NvsThemeHelper.m_timelineRatio) / 2.0f;
        rectF.bottom = -rectF.top;
        rectF2.left = -0.7f;
        rectF2.right = 0.8f;
        rectF2.top = rectF.top;
        rectF2.bottom = rectF.bottom;
    }

    private static void normalLtToRb(RectF rectF, RectF rectF2, float f) {
        rectF.left = -1.0f;
        rectF.top = 1.0f;
        rectF.right = 0.8f;
        rectF.bottom = rectF.top - ((rectF.width() * f) / NvsThemeHelper.m_timelineRatio);
        if (rectF.bottom < -1.0f) {
            rectF.bottom = -1.0f;
            rectF.right = changeROTBottom(rectF, f);
        }
        rectF2.left = -0.85f;
        rectF2.top = 0.9f;
        rectF2.right = 1.0f;
        rectF2.bottom = rectF2.top - ((rectF2.width() * f) / NvsThemeHelper.m_timelineRatio);
        if (rectF2.bottom < -1.0f) {
            rectF2.bottom = -1.0f;
            rectF2.right = changeROTBottom(rectF2, f);
        }
    }

    public static void normalUpToBottomByFx(RectF rectF, RectF rectF2, float f) {
        rectF.top = 1.0f;
        rectF.bottom = -0.8f;
        rectF.left = (((-(rectF.top - rectF.bottom)) * NvsThemeHelper.m_timelineRatio) / f) / 2.0f;
        rectF.right = -rectF.left;
        rectF2.left = rectF.left;
        rectF2.right = rectF.right;
        rectF2.top = 0.8f;
        rectF2.bottom = -1.0f;
    }

    public static String readFile(String str, AssetManager assetManager) {
        InputStream inputStream;
        if (assetManager == null) {
            try {
                inputStream = new FileInputStream(new File(str));
            } catch (FileNotFoundException e) {
                e.printStackTrace();
                return null;
            } catch (IOException e2) {
                e2.printStackTrace();
                return null;
            }
        } else {
            inputStream = assetManager.open(str);
        }
        byte[] bArr = new byte[inputStream.available()];
        inputStream.read(bArr);
        inputStream.close();
        return new String(bArr, Keyczar.DEFAULT_ENCODING);
    }

    private static void setClipMask(NvsVideoClip nvsVideoClip, boolean z) {
        if (z) {
            nvsVideoClip.setImageMaskROI(new RectF(-1.0f, 1.0f, 1.0f, -1.0f));
            nvsVideoClip.setAttachment("fullscreenMode", "true");
            return;
        }
        float f = NvsThemeHelper.m_timelineRatio;
        nvsVideoClip.setImageMaskROI(new RectF(-1.0f, f, 1.0f, -f));
        nvsVideoClip.setAttachment("fullscreenMode", "false");
    }

    public static void setImageMotion(NvsVideoClip nvsVideoClip, float f, boolean z, RectF rectF) {
        boolean z2 = true;
        if (!z) {
            RectF rectF2 = new RectF();
            RectF rectF3 = new RectF();
            setImageROI(rectF2, rectF3, rectF, f);
            nvsVideoClip.setImageMotionROI(rectF2, rectF3);
        } else if (getMotionIdx(2, 4) == 0) {
            nvsVideoClip.setImageMotionMode(0);
        } else {
            nvsVideoClip.setImageMotionMode(1);
        }
        if (f > 0.75f) {
            z2 = false;
        }
        setClipMask(nvsVideoClip, z2);
    }

    public static void setImageROI(RectF rectF, RectF rectF2, RectF rectF3, float f) {
        boolean z = f < 1.0f;
        if (rectF3 != null) {
            float[] fArr = {rectF3.left, rectF3.top, rectF3.width(), rectF3.height()};
            if (z) {
                setPortraitFaceImgMotion(rectF, rectF2, f, fArr);
            } else {
                setLandscapeFaceImgMotion(rectF, rectF2, f, fArr);
            }
        } else if (z) {
            setPortraitImgMotion(rectF, rectF2, f);
        } else {
            setLandscapeImgMotion(rectF, rectF2, f);
        }
    }

    private static void setLandscapeFaceImgMotion(RectF rectF, RectF rectF2, float f, float[] fArr) {
        switch (getMotionIdx(2, 1)) {
            case 0:
                leftToRight(rectF, rectF2, fArr, f);
                return;
            case 1:
                leftToRight(rectF2, rectF, fArr, f);
                return;
            default:
                return;
        }
    }

    private static void setLandscapeImgMotion(RectF rectF, RectF rectF2, float f) {
        int motionIdx = getMotionIdx(4, 3);
        switch (motionIdx) {
            case 2:
                setZoomIn(rectF, rectF2, f);
                return;
            case 3:
                setZoomIn(rectF2, rectF, f);
                return;
            default:
                if (motionIdx == 0) {
                    calcLandscapeLeftRec(rectF, f);
                    calcLandscapeRightRec(rectF2, f);
                    return;
                }
                calcLandscapeLeftRec(rectF2, f);
                calcLandscapeRightRec(rectF, f);
                return;
        }
    }

    private static void setPortraitFaceImgMotion(RectF rectF, RectF rectF2, float f, float[] fArr) {
        switch (getMotionIdx(2, 0)) {
            case 0:
                upToBottom(rectF, rectF2, fArr, f);
                return;
            case 1:
                upToBottom(rectF2, rectF, fArr, f);
                return;
            default:
                return;
        }
    }

    private static void setPortraitImgMotion(RectF rectF, RectF rectF2, float f) {
        int motionIdx = getMotionIdx(f <= 0.4f ? 4 : 6, 2);
        if (motionIdx == 4) {
            setPortraitZoomin(rectF, rectF2, f);
        } else if (motionIdx == 5) {
            setPortraitZoomin(rectF2, rectF, f);
        } else {
            switch (motionIdx) {
                case 0:
                    normalLtToRb(rectF, rectF2, f);
                    return;
                case 1:
                    normalLtToRb(rectF2, rectF, f);
                    return;
                case 2:
                    normalLbToRt(rectF, rectF2, f);
                    return;
                case 3:
                    normalLbToRt(rectF2, rectF, f);
                    return;
                default:
                    return;
            }
        }
    }

    private static void setPortraitZoomin(RectF rectF, RectF rectF2, float f) {
        if (f >= NvsThemeHelper.m_timelineRatio) {
            rectF.top = 1.0f;
            rectF.bottom = -1.0f;
            rectF.left = (((-(rectF.top - rectF.bottom)) / f) * NvsThemeHelper.m_timelineRatio) / 2.0f;
            rectF.right = -rectF.left;
            rectF2.top = 0.87f;
            rectF2.bottom = -0.87f;
            rectF2.left = (((-(rectF2.top - rectF2.bottom)) / f) * NvsThemeHelper.m_timelineRatio) / 2.0f;
            rectF2.right = -rectF2.left;
            return;
        }
        rectF.left = -1.0f;
        rectF.right = 1.0f;
        rectF.top = (((rectF.right - rectF.left) * f) / NvsThemeHelper.m_timelineRatio) / 2.0f;
        rectF.bottom = -rectF.top;
        rectF2.left = -0.87f;
        rectF2.right = 0.87f;
        rectF2.top = (((rectF2.right - rectF2.left) * f) / NvsThemeHelper.m_timelineRatio) / 2.0f;
        rectF2.bottom = -rectF2.top;
    }

    private static void setZoomIn(RectF rectF, RectF rectF2, float f) {
        rectF.top = 1.4f;
        rectF.bottom = -1.4f;
        rectF.left = (((-(rectF.top - rectF.bottom)) * NvsThemeHelper.m_timelineRatio) / f) / 2.0f;
        rectF.right = -rectF.left;
        rectF2.top = 1.2f;
        rectF2.bottom = -1.2f;
        rectF2.left = (((-(rectF2.top - rectF2.bottom)) / f) * NvsThemeHelper.m_timelineRatio) / 2.0f;
        rectF2.right = -rectF2.left;
    }

    private static void upToBottom(RectF rectF, RectF rectF2, float[] fArr, float f) {
        rectF.left = Math.max(-1.0f, fArr[0] - 0.35f);
        rectF.right = Math.min(1.0f, fArr[0] + fArr[2] + 0.35f);
        rectF.top = Math.min(1.0f, fArr[1] + 0.5f);
        rectF.bottom = rectF.top - (((rectF.right - rectF.left) / NvsThemeHelper.m_timelineRatio) * f);
        if (rectF.bottom < -1.0f) {
            float f2 = -1.0f - rectF.bottom;
            rectF.bottom = -1.0f;
            rectF.top += f2;
            if (rectF.top > 1.0f) {
                setPortraitZoomin(rectF, rectF2, f);
                return;
            }
            float f3 = 1.0f - rectF.top;
            rectF2.top = rectF.top + f3;
            rectF2.bottom = rectF.bottom + f3;
        } else {
            rectF2.bottom = rectF.bottom - 0.13f;
            rectF2.top = rectF.top - 0.13f;
            if (rectF2.bottom < -1.0f) {
                float f4 = -1.0f - rectF2.bottom;
                rectF2.bottom = -1.0f;
                rectF2.top += f4;
            }
        }
        rectF2.left = rectF.left;
        rectF2.right = rectF.right;
    }

    private static void upToBottomByFx(RectF rectF, RectF rectF2, float[] fArr, float f) {
        float f2 = ((fArr[0] * 2.0f) + fArr[2]) / 2.0f;
        rectF.top = 1.0f;
        rectF.bottom = -0.8f;
        rectF.left = ((((-(rectF.top - rectF.bottom)) * NvsThemeHelper.m_timelineRatio) / f) / 2.0f) + f2;
        rectF.right = ((((rectF.top - rectF.bottom) * NvsThemeHelper.m_timelineRatio) / f) / 2.0f) + f2;
        if (rectF.left < -1.0f) {
            rectF.right += -1.0f - rectF.left;
            rectF.left = -1.0f;
        }
        if (rectF.right > 1.0f) {
            rectF.left -= rectF.right - 1.0f;
            rectF.right = 1.0f;
        }
        rectF2.left = rectF.left;
        rectF2.right = rectF.right;
        rectF2.top = 0.8f;
        rectF2.bottom = -1.0f;
    }
}
