package com.nexstreaming.nexeditorsdk;

import android.util.Log;
import com.miui.gallery.assistant.jni.filter.BaiduSceneResult;
import com.nexstreaming.nexeditorsdk.exception.InvalidRangeException;
import com.nexstreaming.nexeditorsdk.nexSaveDataFormat.nexVideoClipEditOf;

public final class nexVideoClipEdit implements Cloneable {
    @Deprecated
    public static int kAutoTrim_Divided = 1;
    @Deprecated
    public static int kAutoTrim_Interval = 2;
    public static final int kSpeedControl_MaxValue = 1600;
    public static final int kSpeedControl_MinValue = 3;
    private nexClip mClip;
    int mFreezeDuration = 0;
    private int mMasterSpeedControl = 100;
    int mTrimEndDuration;
    int mTrimStartDuration;
    boolean mUpdated;

    private nexVideoClipEdit() {
    }

    private nexVideoClipEdit(nexClip nexclip) {
        this.mClip = nexclip;
    }

    nexVideoClipEdit(nexClip nexclip, nexVideoClipEditOf nexvideoclipeditof) {
        this.mTrimStartDuration = nexvideoclipeditof.mTrimStartDuration;
        this.mTrimEndDuration = nexvideoclipeditof.mTrimEndDuration;
        this.mMasterSpeedControl = nexvideoclipeditof.mMasterSpeedControl;
        this.mClip = nexclip;
    }

    protected static nexVideoClipEdit clone(nexVideoClipEdit nexvideoclipedit) {
        try {
            return (nexVideoClipEdit) nexvideoclipedit.clone();
        } catch (CloneNotSupportedException e) {
            e.printStackTrace();
            return null;
        }
    }

    static nexVideoClipEdit getnexVideoClipEdit(nexClip nexclip) {
        if (nexclip.getClipType() != 4) {
            return null;
        }
        return new nexVideoClipEdit(nexclip);
    }

    private int speedControlTab(int i) {
        boolean equals = BuildConfig.KM_PROJECT.equals("Gionee");
        int i2 = kSpeedControl_MaxValue;
        if (equals) {
            if (i < 13) {
                i = 13;
            } else if (i > 1600) {
                i = kSpeedControl_MaxValue;
            }
            return i;
        }
        int[] iArr = {3, 6, 13, 25, 50, 75, 100, BaiduSceneResult.TRAVEL_OTHER, 150, 175, 200, 400, 800, kSpeedControl_MaxValue};
        int i3 = 0;
        while (true) {
            if (i3 >= iArr.length) {
                break;
            } else if (iArr[i3] >= i) {
                i2 = iArr[i3];
                break;
            } else {
                i3++;
            }
        }
        return i2;
    }

    @Deprecated
    public void addTrim(int i, int i2, int i3) {
    }

    public void clearTrim() {
        this.mTrimStartDuration = 0;
        this.mTrimEndDuration = 0;
        this.mUpdated = true;
        this.mClip.setProjectUpdateSignal(false);
    }

    public int getDuration() {
        int totalTime = (this.mTrimStartDuration == 0 && this.mTrimEndDuration == 0) ? this.mClip.getTotalTime() : (this.mClip.getTotalTime() - this.mTrimStartDuration) - this.mTrimEndDuration;
        if (this.mMasterSpeedControl != 100) {
            totalTime = this.mMasterSpeedControl == 2 ? totalTime * 50 : this.mMasterSpeedControl == 3 ? totalTime * 32 : this.mMasterSpeedControl == 6 ? totalTime * 16 : this.mMasterSpeedControl == 13 ? totalTime * 8 : Math.round((float) ((totalTime * 100) / this.mMasterSpeedControl));
        }
        if (totalTime < 500) {
            StringBuilder sb = new StringBuilder();
            sb.append("clip duration under 500! duration=");
            sb.append(totalTime);
            sb.append(", speed=");
            sb.append(this.mMasterSpeedControl);
            sb.append(", trim_start=");
            sb.append(this.mTrimStartDuration);
            sb.append(", trim_end=");
            sb.append(this.mTrimEndDuration);
            Log.w("nexVideoClipEdit", sb.toString());
        }
        return totalTime + this.mFreezeDuration;
    }

    public int getEndTrimTime() {
        return this.mClip.getTotalTime() - this.mTrimEndDuration;
    }

    /* access modifiers changed from: 0000 */
    public nexVideoClipEditOf getSaveData() {
        nexVideoClipEditOf nexvideoclipeditof = new nexVideoClipEditOf();
        nexvideoclipeditof.mTrimStartDuration = this.mTrimStartDuration;
        nexvideoclipeditof.mTrimEndDuration = this.mTrimEndDuration;
        nexvideoclipeditof.mMasterSpeedControl = this.mMasterSpeedControl;
        return nexvideoclipeditof;
    }

    public int getSpeedControl() {
        return this.mMasterSpeedControl;
    }

    public int getStartTrimTime() {
        return this.mTrimStartDuration;
    }

    @Deprecated
    public int getTrimCount() {
        return 0;
    }

    @Deprecated
    public int removeTrim(int i) {
        return -1;
    }

    @Deprecated
    public int setAutoTrim(int i, int i2) {
        return 0;
    }

    /* access modifiers changed from: protected */
    public void setFreezeDuration(int i) {
        this.mFreezeDuration = i;
    }

    public void setSpeedControl(int i) {
        if (this.mClip.getAudioOnOff()) {
            i = speedControlTab(i);
        }
        if (this.mMasterSpeedControl != i) {
            this.mUpdated = true;
            this.mClip.setProjectUpdateSignal(false);
            this.mMasterSpeedControl = i;
        }
    }

    public void setTrim(int i, int i2) {
        if (i2 > i) {
            this.mTrimStartDuration = i;
            this.mTrimEndDuration = this.mClip.getTotalTime() - i2;
            if (this.mTrimEndDuration < 0 || this.mTrimStartDuration < 0) {
                throw new InvalidRangeException(this.mTrimStartDuration, this.mTrimEndDuration);
            }
            this.mUpdated = true;
            this.mClip.setProjectUpdateSignal(false);
            return;
        }
        throw new InvalidRangeException(i, i2);
    }
}
