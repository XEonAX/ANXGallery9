package com.nexstreaming.kminternal.nexvideoeditor;

import java.util.Arrays;
import java.util.Vector;

public final class NexVisualClip {
    Vector<NexAudioClip> mAudioClipVec = new Vector<>();
    public int mAudioOnOff = 0;
    public int mBGMVolume = 0;
    public int mBassStrength = -1;
    public int mBrightness = 0;
    public String mClipEffectID;
    public int mClipID = 0;
    public String mClipPath;
    public int mClipType = 0;
    public int mClipVolume = 0;
    public int mCompressor = 0;
    public int mContrast = 0;
    public int mCustomLUT_A = 0;
    public int mCustomLUT_B = 0;
    public int mCustomLUT_Power = 0;
    public NexRectangle mDestRect = new NexRectangle(0, 0, 0, 0);
    public int mEffectDuration = 0;
    public int mEffectOffset = 0;
    public int mEffectOverlap = 0;
    public float[] mEndMatrix = null;
    public NexRectangle mEndRect = new NexRectangle(0, 0, 0, 0);
    public int mEndTime = 0;
    public int mEndTrimTime = 0;
    public String mEnhancedAudioFilter;
    public int mExistAudio = 0;
    public int mExistVideo = 0;
    public String mFilterID;
    public int mFreezeDuration = 0;
    public int mHeight = 0;
    public int mLUT = 0;
    public int mManualVolumeControl;
    public int mMotionTracked = 0;
    public int mMusicEffector = 0;
    public int mPanLeft = -111;
    public int mPanRight = -111;
    public int mPitchFactor = 0;
    public int mProcessorStrength = -1;
    public int mRotateState = 0;
    public int mSaturation = 0;
    public int mSlowMotion = 0;
    public int mSpeedControl = 0;
    public float[] mStartMatrix = null;
    public NexRectangle mStartRect = new NexRectangle(0, 0, 0, 0);
    public int mStartTime = 0;
    public int mStartTrimTime = 0;
    public String mThumbnailPath;
    public int mTintcolor = 0;
    public String mTitle;
    public String mTitleEffectID;
    public int mTitleEndTime = 0;
    public int mTitleStartTime = 0;
    public int mTitleStyle = 0;
    public int mTotalAudioTime = 0;
    public int mTotalTime = 0;
    public int mTotalVideoTime = 0;
    public int mVignette = 0;
    public int mVoiceChanger = 0;
    public int[] mVolumeEnvelopeLevel = null;
    public int[] mVolumeEnvelopeTime = null;
    public int mWidth = 0;

    public int addAudioClip(NexAudioClip nexAudioClip) {
        this.mAudioClipVec.add(nexAudioClip);
        return 0;
    }

    public void clearAudioClips() {
        this.mAudioClipVec.clear();
    }

    public void deleteAudioClip(int i) {
        for (int i2 = 0; i2 < this.mAudioClipVec.size(); i2++) {
            if (((NexAudioClip) this.mAudioClipVec.get(i2)).mClipID == i) {
                this.mAudioClipVec.remove(i2);
            }
        }
    }

    public boolean equals(Object obj) {
        boolean z = true;
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        NexVisualClip nexVisualClip = (NexVisualClip) obj;
        if (this.mClipID != nexVisualClip.mClipID || this.mClipType != nexVisualClip.mClipType || this.mTotalAudioTime != nexVisualClip.mTotalAudioTime || this.mTotalVideoTime != nexVisualClip.mTotalVideoTime || this.mTotalTime != nexVisualClip.mTotalTime || this.mStartTime != nexVisualClip.mStartTime || this.mEndTime != nexVisualClip.mEndTime || this.mStartTrimTime != nexVisualClip.mStartTrimTime || this.mEndTrimTime != nexVisualClip.mEndTrimTime || this.mWidth != nexVisualClip.mWidth || this.mHeight != nexVisualClip.mHeight || this.mExistVideo != nexVisualClip.mExistVideo || this.mExistAudio != nexVisualClip.mExistAudio || this.mTitleStyle != nexVisualClip.mTitleStyle || this.mTitleStartTime != nexVisualClip.mTitleStartTime || this.mTitleEndTime != nexVisualClip.mTitleEndTime || this.mAudioOnOff != nexVisualClip.mAudioOnOff || this.mClipVolume != nexVisualClip.mClipVolume || this.mBGMVolume != nexVisualClip.mBGMVolume || this.mRotateState != nexVisualClip.mRotateState || this.mBrightness != nexVisualClip.mBrightness || this.mContrast != nexVisualClip.mContrast || this.mSaturation != nexVisualClip.mSaturation || this.mTintcolor != nexVisualClip.mTintcolor || this.mLUT != nexVisualClip.mLUT || this.mCustomLUT_A != nexVisualClip.mCustomLUT_A || this.mCustomLUT_B != nexVisualClip.mCustomLUT_B || this.mCustomLUT_Power != nexVisualClip.mCustomLUT_Power || this.mVignette != nexVisualClip.mVignette || this.mSpeedControl != nexVisualClip.mSpeedControl || this.mVoiceChanger != nexVisualClip.mVoiceChanger || this.mEffectDuration != nexVisualClip.mEffectDuration || this.mEffectOffset != nexVisualClip.mEffectOffset || this.mEffectOverlap != nexVisualClip.mEffectOverlap || this.mCompressor != nexVisualClip.mCompressor || this.mPitchFactor != nexVisualClip.mPitchFactor || this.mMusicEffector != nexVisualClip.mMusicEffector || this.mProcessorStrength != nexVisualClip.mProcessorStrength || this.mBassStrength != nexVisualClip.mBassStrength || this.mManualVolumeControl != nexVisualClip.mManualVolumeControl || this.mPanLeft != nexVisualClip.mPanLeft || this.mPanRight != nexVisualClip.mPanRight || this.mSlowMotion != nexVisualClip.mSlowMotion || this.mMotionTracked != nexVisualClip.mMotionTracked) {
            return false;
        }
        if (this.mTitle == null ? nexVisualClip.mTitle != null : !this.mTitle.equals(nexVisualClip.mTitle)) {
            return false;
        }
        if (this.mClipEffectID == null ? nexVisualClip.mClipEffectID != null : !this.mClipEffectID.equals(nexVisualClip.mClipEffectID)) {
            return false;
        }
        if (this.mTitleEffectID == null ? nexVisualClip.mTitleEffectID != null : !this.mTitleEffectID.equals(nexVisualClip.mTitleEffectID)) {
            return false;
        }
        if (this.mFilterID == null ? nexVisualClip.mFilterID != null : !this.mFilterID.equals(nexVisualClip.mFilterID)) {
            return false;
        }
        if (this.mStartRect == null ? nexVisualClip.mStartRect != null : !this.mStartRect.equals(nexVisualClip.mStartRect)) {
            return false;
        }
        if (this.mEndRect == null ? nexVisualClip.mEndRect != null : !this.mEndRect.equals(nexVisualClip.mEndRect)) {
            return false;
        }
        if (this.mDestRect == null ? nexVisualClip.mDestRect != null : !this.mDestRect.equals(nexVisualClip.mDestRect)) {
            return false;
        }
        if (!Arrays.equals(this.mStartMatrix, nexVisualClip.mStartMatrix) || !Arrays.equals(this.mEndMatrix, nexVisualClip.mEndMatrix) || !this.mClipPath.equals(nexVisualClip.mClipPath)) {
            return false;
        }
        if (this.mThumbnailPath == null ? nexVisualClip.mThumbnailPath != null : !this.mThumbnailPath.equals(nexVisualClip.mThumbnailPath)) {
            return false;
        }
        if (!Arrays.equals(this.mVolumeEnvelopeLevel, nexVisualClip.mVolumeEnvelopeLevel) || !Arrays.equals(this.mVolumeEnvelopeTime, nexVisualClip.mVolumeEnvelopeTime) || this.mFreezeDuration != nexVisualClip.mFreezeDuration) {
            return false;
        }
        if (this.mEnhancedAudioFilter == null ? nexVisualClip.mEnhancedAudioFilter != null : !this.mEnhancedAudioFilter.equals(nexVisualClip.mEnhancedAudioFilter)) {
            return false;
        }
        if (this.mAudioClipVec == null ? nexVisualClip.mAudioClipVec != null : !this.mAudioClipVec.equals(nexVisualClip.mAudioClipVec)) {
            z = false;
        }
        return z;
    }

    public int hashCode() {
        int i = 0;
        int hashCode = ((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((this.mClipID * 31) + this.mClipType) * 31) + this.mTotalAudioTime) * 31) + this.mTotalVideoTime) * 31) + this.mTotalTime) * 31) + this.mStartTime) * 31) + this.mEndTime) * 31) + this.mStartTrimTime) * 31) + this.mEndTrimTime) * 31) + this.mWidth) * 31) + this.mHeight) * 31) + this.mExistVideo) * 31) + this.mExistAudio) * 31) + (this.mTitle != null ? this.mTitle.hashCode() : 0)) * 31) + this.mTitleStyle) * 31) + this.mTitleStartTime) * 31) + this.mTitleEndTime) * 31) + this.mAudioOnOff) * 31) + this.mClipVolume) * 31) + this.mBGMVolume) * 31) + this.mRotateState) * 31) + this.mBrightness) * 31) + this.mContrast) * 31) + this.mSaturation) * 31) + this.mTintcolor) * 31) + this.mLUT) * 31) + this.mCustomLUT_A) * 31) + this.mCustomLUT_B) * 31) + this.mCustomLUT_Power) * 31) + this.mVignette) * 31) + this.mSpeedControl) * 31) + this.mVoiceChanger) * 31) + this.mEffectDuration) * 31) + this.mEffectOffset) * 31) + this.mEffectOverlap) * 31) + (this.mClipEffectID != null ? this.mClipEffectID.hashCode() : 0)) * 31) + (this.mTitleEffectID != null ? this.mTitleEffectID.hashCode() : 0)) * 31) + (this.mFilterID != null ? this.mFilterID.hashCode() : 0)) * 31) + (this.mStartRect != null ? this.mStartRect.hashCode() : 0)) * 31) + (this.mEndRect != null ? this.mEndRect.hashCode() : 0)) * 31) + (this.mDestRect != null ? this.mDestRect.hashCode() : 0)) * 31) + (this.mStartMatrix != null ? Arrays.hashCode(this.mStartMatrix) : 0)) * 31) + (this.mEndMatrix != null ? Arrays.hashCode(this.mEndMatrix) : 0)) * 31) + this.mClipPath.hashCode()) * 31) + (this.mThumbnailPath != null ? this.mThumbnailPath.hashCode() : 0)) * 31) + (this.mVolumeEnvelopeLevel != null ? Arrays.hashCode(this.mVolumeEnvelopeLevel) : 0)) * 31) + (this.mVolumeEnvelopeTime != null ? Arrays.hashCode(this.mVolumeEnvelopeTime) : 0)) * 31) + (this.mEnhancedAudioFilter != null ? this.mEnhancedAudioFilter.hashCode() : 0)) * 31) + this.mCompressor) * 31) + this.mPitchFactor) * 31) + this.mMusicEffector) * 31) + this.mProcessorStrength) * 31) + this.mBassStrength) * 31) + this.mManualVolumeControl) * 31) + this.mPanLeft) * 31) + this.mPanRight) * 31) + this.mSlowMotion) * 31) + this.mMotionTracked) * 31;
        if (this.mAudioClipVec != null) {
            i = this.mAudioClipVec.hashCode();
        }
        return ((hashCode + i) * 31) + this.mFreezeDuration;
    }

    public void setDestRect(int i, int i2, int i3, int i4) {
        this.mDestRect.setRect(i, i2, i3, i4);
    }

    public void setEndRect(int i, int i2, int i3, int i4) {
        this.mEndRect.setRect(i, i2, i3, i4);
    }

    public void setStartRect(int i, int i2, int i3, int i4) {
        this.mStartRect.setRect(i, i2, i3, i4);
    }
}
