package com.nexstreaming.nexeditorsdk;

import com.nexstreaming.nexeditorsdk.exception.InvalidRangeException;
import com.nexstreaming.nexeditorsdk.nexSaveDataFormat.nexAudioItemOf;

public final class nexAudioItem implements Cloneable {
    private static int sLastId = 1;
    protected nexClip mClip;
    private int mId;
    private int mSpeedControl = 100;
    protected int mTrimEndDuration;
    protected int mTrimStartDuration;

    nexAudioItem(b bVar, nexAudioItemOf nexaudioitemof) {
        this.mId = nexaudioitemof.mId;
        this.mClip = new nexClip(bVar, nexaudioitemof.mClip);
        this.mTrimStartDuration = nexaudioitemof.mTrimStartDuration;
        this.mTrimEndDuration = nexaudioitemof.mTrimEndDuration;
        this.mSpeedControl = nexaudioitemof.mSpeedControl;
    }

    protected nexAudioItem(nexClip nexclip, int i, int i2) {
        if (i2 > i) {
            this.mClip = nexclip;
            this.mClip.mStartTime = i;
            this.mClip.mEndTime = i2;
            this.mId = sLastId;
            sLastId++;
            return;
        }
        throw new InvalidRangeException(i, i2);
    }

    protected static nexAudioItem clone(nexAudioItem nexaudioitem) {
        nexAudioItem nexaudioitem2;
        try {
            nexaudioitem2 = (nexAudioItem) nexaudioitem.clone();
            try {
                nexaudioitem2.mClip = nexClip.clone(nexaudioitem.mClip);
            } catch (CloneNotSupportedException e) {
                e = e;
            }
        } catch (CloneNotSupportedException e2) {
            e = e2;
            nexaudioitem2 = null;
            e.printStackTrace();
            return nexaudioitem2;
        }
        return nexaudioitem2;
    }

    public nexClip getClip() {
        return this.mClip;
    }

    public int getEndTime() {
        return this.mClip.mEndTime;
    }

    public int getEndTrimTime() {
        return this.mClip.getTotalTime() - this.mTrimEndDuration;
    }

    public int getId() {
        return this.mId;
    }

    /* access modifiers changed from: 0000 */
    public nexAudioItemOf getSaveData() {
        nexAudioItemOf nexaudioitemof = new nexAudioItemOf();
        nexaudioitemof.mId = this.mId;
        nexaudioitemof.mClip = this.mClip.getSaveData();
        nexaudioitemof.mTrimStartDuration = this.mTrimStartDuration;
        nexaudioitemof.mTrimEndDuration = this.mTrimEndDuration;
        nexaudioitemof.mSpeedControl = this.mSpeedControl;
        return nexaudioitemof;
    }

    public int getSpeedControl() {
        return this.mSpeedControl;
    }

    public int getStartTime() {
        return this.mClip.mStartTime;
    }

    public int getStartTrimTime() {
        return this.mTrimStartDuration;
    }

    public void removeTrim() {
        this.mTrimStartDuration = 0;
        this.mTrimEndDuration = 0;
        this.mClip.getAudioEnvelop().updateTrimTime(0, this.mClip.getTotalTime());
        this.mClip.mEndTime = this.mClip.mStartTime + this.mClip.getTotalTime();
        this.mClip.setProjectUpdateSignal(true);
    }

    /* access modifiers changed from: protected */
    public void setProjectTime(int i, int i2) {
        if (i2 <= i) {
            throw new InvalidRangeException(i, i2);
        } else if (i >= 0) {
            this.mClip.mStartTime = i;
            this.mClip.mEndTime = i2;
            this.mClip.setProjectUpdateSignal(true);
        } else {
            throw new InvalidRangeException(0, this.mClip.mEndTime, i);
        }
    }

    public void setSpeedControl(int i) {
        this.mSpeedControl = i;
    }

    public void setTrim(int i, int i2) {
        if (i2 <= i) {
            throw new InvalidRangeException(i, i2);
        } else if (i > this.mClip.getTotalTime()) {
            throw new InvalidRangeException(0, this.mClip.getTotalTime(), i);
        } else if (i2 <= this.mClip.getTotalTime()) {
            this.mTrimStartDuration = i;
            this.mTrimEndDuration = this.mClip.getTotalTime() - i2;
            this.mClip.getAudioEnvelop().updateTrimTime(i, i2);
            this.mClip.setProjectUpdateSignal(true);
        } else {
            throw new InvalidRangeException(0, this.mClip.getTotalTime(), i2);
        }
    }
}
