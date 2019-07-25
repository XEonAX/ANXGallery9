package com.nexstreaming.nexeditorsdk;

import android.graphics.Rect;
import android.util.Log;
import java.util.List;

public class nexDrawInfo {
    private static String TAG = "nexDrawInfo";
    private int mBrightness;
    private int mClipID;
    private int mContrast;
    private int mCustomLUT_A;
    private int mCustomLUT_B;
    private int mCustomLUT_Power;
    private String mEffectID;
    private Rect mEndRect = new Rect();
    private int mEndTime;
    private Rect mFaceRect = new Rect();
    private int mID;
    private int mIsTransition;
    private int mLUT;
    private float mRatio = 1.7777778f;
    private float mRealScale = 1.0f;
    private int mRotateState;
    private int mSaturation;
    private Rect mStartRect = new Rect();
    private int mStartTime;
    private int mSubEffectID;
    private int mTintcolor;
    private String mTitle;
    private int mTopEffectID;
    private String mUserLUT;
    private int mUserRotateState;
    private int mUserTranslateX;
    private int mUserTranslateY;
    List<d> subTemplateDrawInfos;

    public int getBrightness() {
        return this.mBrightness;
    }

    public int getClipID() {
        return this.mClipID;
    }

    public int getContrast() {
        return this.mContrast;
    }

    public int getCustomLUTA() {
        return this.mCustomLUT_A;
    }

    public int getCustomLUTB() {
        return this.mCustomLUT_B;
    }

    public int getCustomLUTPower() {
        return this.mCustomLUT_Power;
    }

    public String getEffectID() {
        return this.mEffectID;
    }

    public Rect getEndRect() {
        return this.mEndRect;
    }

    public int getEndTime() {
        return this.mEndTime;
    }

    public Rect getFaceRect() {
        return this.mFaceRect;
    }

    public int getID() {
        return this.mID;
    }

    public int getIsTransition() {
        return this.mIsTransition;
    }

    public int getLUT() {
        return this.mLUT;
    }

    public float getRatio() {
        return this.mRatio;
    }

    public float getRealScale() {
        return this.mRealScale;
    }

    public int getRotateState() {
        return this.mRotateState;
    }

    public int getSaturation() {
        return this.mSaturation;
    }

    public Rect getStartRect() {
        return this.mStartRect;
    }

    public int getStartTime() {
        return this.mStartTime;
    }

    public int getSubEffectID() {
        return this.mSubEffectID;
    }

    public List<d> getSubTemplateDrawInfos() {
        return this.subTemplateDrawInfos;
    }

    public int getTintcolor() {
        return this.mTintcolor;
    }

    public String getTitle() {
        return this.mTitle;
    }

    public int getTopEffectID() {
        return this.mTopEffectID;
    }

    public String getUserLUT() {
        return this.mUserLUT;
    }

    public int getUserRotateState() {
        return this.mUserRotateState;
    }

    public int getUserTranslateX() {
        return this.mUserTranslateX;
    }

    public int getUserTranslateY() {
        return this.mUserTranslateY;
    }

    public void print() {
        Log.d(TAG, String.format("nexDrawInfo id : %d", new Object[]{Integer.valueOf(this.mID)}));
        Log.d(TAG, String.format("nexDrawInfo clip : %d", new Object[]{Integer.valueOf(this.mClipID)}));
        Log.d(TAG, String.format("nexDrawInfo subID : %d", new Object[]{Integer.valueOf(this.mSubEffectID)}));
        Log.d(TAG, String.format("nexDrawInfo start : %d", new Object[]{Integer.valueOf(this.mStartTime)}));
        Log.d(TAG, String.format("nexDrawInfo end : %d", new Object[]{Integer.valueOf(this.mEndTime)}));
        String str = TAG;
        String str2 = "nexDrawInfo effect : %s";
        Object[] objArr = new Object[1];
        objArr[0] = this.mEffectID == null ? "" : this.mEffectID;
        Log.d(str, String.format(str2, objArr));
        Log.d(TAG, String.format("nexDrawInfo istransition : %d", new Object[]{Integer.valueOf(this.mIsTransition)}));
        Log.d(TAG, String.format("nexDrawInfo color : %d %d %d", new Object[]{Integer.valueOf(this.mBrightness), Integer.valueOf(this.mContrast), Integer.valueOf(this.mSaturation)}));
        Log.d(TAG, String.format("nexDrawInfo lut : %d", new Object[]{Integer.valueOf(this.mLUT)}));
        Log.d(TAG, String.format("nexDrawInfo start rect : %d %d %d %d", new Object[]{Integer.valueOf(this.mStartRect.left), Integer.valueOf(this.mStartRect.top), Integer.valueOf(this.mStartRect.right), Integer.valueOf(this.mStartRect.bottom)}));
        Log.d(TAG, String.format("nexDrawInfo end rect : %d %d %d %d", new Object[]{Integer.valueOf(this.mEndRect.left), Integer.valueOf(this.mEndRect.top), Integer.valueOf(this.mEndRect.right), Integer.valueOf(this.mEndRect.bottom)}));
        Log.d(TAG, String.format("nexDrawInfo face rect : %d %d %d %d", new Object[]{Integer.valueOf(this.mEndRect.left), Integer.valueOf(this.mEndRect.top), Integer.valueOf(this.mEndRect.right), Integer.valueOf(this.mEndRect.bottom)}));
        Log.d(TAG, String.format("nexDrawInfo ratio : %f", new Object[]{Float.valueOf(this.mRatio)}));
        Log.d(TAG, "---------------------------------------------------");
    }

    public void setBrightness(int i) {
        this.mBrightness = i;
    }

    public void setClipID(int i) {
        this.mClipID = i;
    }

    public void setContrast(int i) {
        this.mContrast = i;
    }

    public void setCustomLUTA(int i) {
        this.mCustomLUT_A = i;
    }

    public void setCustomLUTB(int i) {
        this.mCustomLUT_B = i;
    }

    public void setCustomLUTPower(int i) {
        this.mCustomLUT_Power = i;
    }

    public void setEffectID(String str) {
        this.mEffectID = str;
    }

    public void setEndRect(Rect rect) {
        this.mEndRect.set(rect.left, rect.top, rect.right, rect.bottom);
    }

    public void setEndTime(int i) {
        this.mEndTime = i;
    }

    public void setFaceRect(Rect rect) {
        this.mFaceRect.set(rect.left, rect.top, rect.right, rect.bottom);
    }

    public void setID(int i) {
        this.mID = i;
    }

    public void setIsTransition(int i) {
        this.mIsTransition = i;
    }

    public void setLUT(int i) {
        this.mLUT = i;
    }

    public void setRatio(float f) {
        this.mRatio = f;
    }

    public void setRealScale(float f) {
        this.mRealScale = f;
    }

    public void setRotateState(int i) {
        this.mRotateState = i;
    }

    public void setSaturation(int i) {
        this.mSaturation = i;
    }

    public void setStartRect(Rect rect) {
        this.mStartRect.set(rect.left, rect.top, rect.right, rect.bottom);
    }

    public void setStartTime(int i) {
        this.mStartTime = i;
    }

    public void setSubEffectID(int i) {
        this.mSubEffectID = i;
    }

    public void setSubTemplateDrawInfos(List<d> list) {
        this.subTemplateDrawInfos = list;
    }

    public void setTintcolor(int i) {
        this.mTintcolor = i;
    }

    public void setTitle(String str) {
        this.mTitle = str;
    }

    public void setTopEffectID(int i) {
        this.mTopEffectID = i;
    }

    public void setUserLUT(String str) {
        this.mUserLUT = str;
    }

    public void setUserRotateState(int i) {
        this.mUserRotateState = i;
    }

    public void setUserTranslate(int i, int i2) {
        this.mUserTranslateX = i;
        this.mUserTranslateY = i2;
    }
}
