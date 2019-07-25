package com.nexstreaming.nexeditorsdk;

import android.content.Intent;
import android.graphics.Rect;
import android.util.Log;
import com.google.gson_nex.Gson;
import com.miui.gallery.assistant.jni.filter.BaiduSceneResult;
import com.nexstreaming.kminternal.kinemaster.editorwrapper.a.e;
import com.nexstreaming.kminternal.kinemaster.editorwrapper.a.f;
import com.nexstreaming.kminternal.kinemaster.editorwrapper.a.g;
import com.nexstreaming.nexeditorsdk.exception.ProjectAlreadyAttachedException;
import com.nexstreaming.nexeditorsdk.nexSaveDataFormat.nexAudioItemOf;
import com.nexstreaming.nexeditorsdk.nexSaveDataFormat.nexClipOf;
import com.nexstreaming.nexeditorsdk.nexSaveDataFormat.nexProjectOf;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class nexProject extends b {
    private static String TAG = "nexProject";
    public static final int kAutoThemeClipDuration = 6000;
    public static final int kAutoThemeTransitionDuration = 2000;
    private static int sNextId = 1;
    private int mAudioFadeInTime;
    private int mAudioFadeOutTime;
    int mBGMTrimEndTime;
    int mBGMTrimStartTime;
    private float mBGMVolumeScale;
    private nexClip mBackGroundMusic;
    private boolean mEmptyTheme;
    private String mEndingTitle;
    private int mId;
    private String mLetterbox;
    boolean mLoopBGM;
    private int mManualVolCtl;
    private String mOpeningTitle;
    private List<nexOverlayItem> mOverlayItems;
    private List<nexClip> mPrimaryItems;
    private int mProjectVolume;
    private List<nexAudioItem> mSecondaryItems;
    int mStartTimeBGM;
    private List<nexDrawInfo> mSubEffectInfo;
    private int mTemplateApplyMode;
    private boolean mTemplateOverlappedTransition;
    private nexTheme mTheme;
    private String mThemeId;
    private List<nexDrawInfo> mTopEffectInfo;
    boolean mUseThemeMusic2BGM;
    private List<nexOverlayItem> m_externalView_overlayItems;
    private List<nexClip> m_externalView_primaryItems;
    private List<nexAudioItem> m_externalView_secondaryItems;

    private static class a implements Comparator<nexAudioItem> {
        private a() {
        }

        /* renamed from: a */
        public int compare(nexAudioItem nexaudioitem, nexAudioItem nexaudioitem2) {
            if (nexaudioitem.getStartTime() > nexaudioitem2.getStartTime()) {
                return -1;
            }
            return nexaudioitem.getStartTime() < nexaudioitem2.getStartTime() ? 1 : 0;
        }
    }

    private class b implements Comparator<nexOverlayItem> {
        private b() {
        }

        /* renamed from: a */
        public int compare(nexOverlayItem nexoverlayitem, nexOverlayItem nexoverlayitem2) {
            if (nexoverlayitem.mStartTime > nexoverlayitem2.mStartTime) {
                return -1;
            }
            return nexoverlayitem.mStartTime < nexoverlayitem2.mStartTime ? 1 : 0;
        }
    }

    public nexProject() {
        this.mThemeId = "com.nexstreaming.kinemaster.basic";
        this.mLetterbox = nexApplicationConfig.getDefaultLetterboxEffect();
        this.mTheme = null;
        this.mEmptyTheme = false;
        this.mProjectVolume = 100;
        this.mManualVolCtl = 0;
        this.mAudioFadeInTime = 200;
        this.mAudioFadeOutTime = 5000;
        this.mOpeningTitle = null;
        this.mEndingTitle = null;
        this.mBGMVolumeScale = 0.5f;
        this.mUseThemeMusic2BGM = true;
        this.mLoopBGM = true;
        this.mStartTimeBGM = 0;
        this.mBackGroundMusic = null;
        this.mTemplateApplyMode = 0;
        this.mTemplateOverlappedTransition = true;
        this.mOverlayItems = new ArrayList();
        this.m_externalView_overlayItems = null;
        this.mPrimaryItems = new ArrayList();
        this.m_externalView_primaryItems = null;
        this.mSecondaryItems = new ArrayList();
        this.m_externalView_secondaryItems = null;
        this.mTopEffectInfo = new ArrayList();
        this.mSubEffectInfo = new ArrayList();
        this.mThemeId = null;
        this.mEmptyTheme = true;
        int i = sNextId;
        sNextId = i + 1;
        this.mId = i;
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("[");
        sb.append(this.mId);
        sb.append("] nexProject create");
        Log.d(str, sb.toString());
    }

    nexProject(nexProjectOf nexprojectof) {
        this.mThemeId = "com.nexstreaming.kinemaster.basic";
        this.mLetterbox = nexApplicationConfig.getDefaultLetterboxEffect();
        this.mTheme = null;
        this.mEmptyTheme = false;
        this.mProjectVolume = 100;
        this.mManualVolCtl = 0;
        this.mAudioFadeInTime = 200;
        this.mAudioFadeOutTime = 5000;
        this.mOpeningTitle = null;
        this.mEndingTitle = null;
        this.mBGMVolumeScale = 0.5f;
        this.mUseThemeMusic2BGM = true;
        this.mLoopBGM = true;
        this.mStartTimeBGM = 0;
        this.mBackGroundMusic = null;
        this.mTemplateApplyMode = 0;
        this.mTemplateOverlappedTransition = true;
        this.mOverlayItems = new ArrayList();
        this.m_externalView_overlayItems = null;
        this.mPrimaryItems = new ArrayList();
        this.m_externalView_primaryItems = null;
        this.mSecondaryItems = new ArrayList();
        this.m_externalView_secondaryItems = null;
        this.mTopEffectInfo = new ArrayList();
        this.mSubEffectInfo = new ArrayList();
        this.mProjectVolume = nexprojectof.mProjectVolume;
        this.mManualVolCtl = nexprojectof.mManualVolCtl;
        this.mAudioFadeInTime = nexprojectof.mAudioFadeInTime;
        this.mAudioFadeOutTime = nexprojectof.mAudioFadeOutTime;
        this.mOpeningTitle = nexprojectof.mOpeningTitle;
        this.mEndingTitle = nexprojectof.mEndingTitle;
        this.mBGMVolumeScale = nexprojectof.mBGMVolumeScale;
        int i = sNextId;
        sNextId = i + 1;
        this.mId = i;
        this.mUseThemeMusic2BGM = nexprojectof.mUseThemeMusic2BGM;
        this.mLoopBGM = nexprojectof.mLoopBGM;
        this.mStartTimeBGM = nexprojectof.mStartTimeBGM;
        if (nexprojectof.mBackGroundMusic == null) {
            this.mBackGroundMusic = null;
        } else {
            this.mBackGroundMusic = new nexClip((b) null, nexprojectof.mBackGroundMusic);
        }
        this.mBGMTrimStartTime = nexprojectof.mBGMTrimStartTime;
        this.mBGMTrimEndTime = nexprojectof.mBGMTrimEndTime;
        this.mTemplateApplyMode = nexprojectof.mTemplateApplyMode;
        this.mTemplateOverlappedTransition = nexprojectof.mTemplateOverlappedTransition;
        if (nexprojectof.mPrimaryItems != null) {
            for (nexClipOf nexclip : nexprojectof.mPrimaryItems) {
                this.mPrimaryItems.add(new nexClip((b) this, nexclip));
            }
        }
        if (nexprojectof.mSecondaryItems != null) {
            for (nexAudioItemOf nexaudioitem : nexprojectof.mSecondaryItems) {
                this.mSecondaryItems.add(new nexAudioItem(this, nexaudioitem));
            }
        }
        if (nexprojectof.mTopEffectInfo != null) {
            this.mTopEffectInfo = nexprojectof.mTopEffectInfo;
        }
        if (nexprojectof.mSubEffectInfo != null) {
            this.mSubEffectInfo = nexprojectof.mSubEffectInfo;
        }
        this.mClipTimeUpdated = true;
    }

    @Deprecated
    public nexProject(nexTheme nextheme) {
        this.mThemeId = "com.nexstreaming.kinemaster.basic";
        this.mLetterbox = nexApplicationConfig.getDefaultLetterboxEffect();
        this.mTheme = null;
        this.mEmptyTheme = false;
        this.mProjectVolume = 100;
        this.mManualVolCtl = 0;
        this.mAudioFadeInTime = 200;
        this.mAudioFadeOutTime = 5000;
        this.mOpeningTitle = null;
        this.mEndingTitle = null;
        this.mBGMVolumeScale = 0.5f;
        this.mUseThemeMusic2BGM = true;
        this.mLoopBGM = true;
        this.mStartTimeBGM = 0;
        this.mBackGroundMusic = null;
        this.mTemplateApplyMode = 0;
        this.mTemplateOverlappedTransition = true;
        this.mOverlayItems = new ArrayList();
        this.m_externalView_overlayItems = null;
        this.mPrimaryItems = new ArrayList();
        this.m_externalView_primaryItems = null;
        this.mSecondaryItems = new ArrayList();
        this.m_externalView_secondaryItems = null;
        this.mTopEffectInfo = new ArrayList();
        this.mSubEffectInfo = new ArrayList();
        this.mThemeId = null;
        this.mEmptyTheme = true;
        int i = sNextId;
        sNextId = i + 1;
        this.mId = i;
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("[");
        sb.append(this.mId);
        sb.append("] nexProject create");
        Log.d(str, sb.toString());
    }

    @Deprecated
    public nexProject(String str) {
        this.mThemeId = "com.nexstreaming.kinemaster.basic";
        this.mLetterbox = nexApplicationConfig.getDefaultLetterboxEffect();
        this.mTheme = null;
        this.mEmptyTheme = false;
        this.mProjectVolume = 100;
        this.mManualVolCtl = 0;
        this.mAudioFadeInTime = 200;
        this.mAudioFadeOutTime = 5000;
        this.mOpeningTitle = null;
        this.mEndingTitle = null;
        this.mBGMVolumeScale = 0.5f;
        this.mUseThemeMusic2BGM = true;
        this.mLoopBGM = true;
        this.mStartTimeBGM = 0;
        this.mBackGroundMusic = null;
        this.mTemplateApplyMode = 0;
        this.mTemplateOverlappedTransition = true;
        this.mOverlayItems = new ArrayList();
        this.m_externalView_overlayItems = null;
        this.mPrimaryItems = new ArrayList();
        this.m_externalView_primaryItems = null;
        this.mSecondaryItems = new ArrayList();
        this.m_externalView_secondaryItems = null;
        this.mTopEffectInfo = new ArrayList();
        this.mSubEffectInfo = new ArrayList();
        this.mThemeId = null;
        this.mEmptyTheme = true;
        int i = sNextId;
        sNextId = i + 1;
        this.mId = i;
        String str2 = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("[");
        sb.append(this.mId);
        sb.append("] nexProject create");
        Log.d(str2, sb.toString());
    }

    @Deprecated
    public nexProject(String str, String str2, String str3) {
        this.mThemeId = "com.nexstreaming.kinemaster.basic";
        this.mLetterbox = nexApplicationConfig.getDefaultLetterboxEffect();
        this.mTheme = null;
        this.mEmptyTheme = false;
        this.mProjectVolume = 100;
        this.mManualVolCtl = 0;
        this.mAudioFadeInTime = 200;
        this.mAudioFadeOutTime = 5000;
        this.mOpeningTitle = null;
        this.mEndingTitle = null;
        this.mBGMVolumeScale = 0.5f;
        this.mUseThemeMusic2BGM = true;
        this.mLoopBGM = true;
        this.mStartTimeBGM = 0;
        this.mBackGroundMusic = null;
        this.mTemplateApplyMode = 0;
        this.mTemplateOverlappedTransition = true;
        this.mOverlayItems = new ArrayList();
        this.m_externalView_overlayItems = null;
        this.mPrimaryItems = new ArrayList();
        this.m_externalView_primaryItems = null;
        this.mSecondaryItems = new ArrayList();
        this.m_externalView_secondaryItems = null;
        this.mTopEffectInfo = new ArrayList();
        this.mSubEffectInfo = new ArrayList();
        this.mThemeId = null;
        this.mEmptyTheme = true;
        int i = sNextId;
        sNextId = i + 1;
        this.mId = i;
        String str4 = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("[");
        sb.append(this.mId);
        sb.append("] nexProject create");
        Log.d(str4, sb.toString());
    }

    private int addClone(int i, nexClip nexclip) {
        updateTimeLine(false);
        nexclip.setAttachmentState(true, this);
        this.mPrimaryItems.add(i, nexclip);
        return 0;
    }

    private int addCloneAudio(int i, nexAudioItem nexaudioitem) {
        updateTimeLine(false);
        nexaudioitem.getClip().setAttachmentState(true, this);
        this.mSecondaryItems.add(i, nexaudioitem);
        return 0;
    }

    private boolean checkAudioTime(int i, int i2) {
        ArrayList arrayList = new ArrayList();
        for (nexAudioItem nexaudioitem : this.mSecondaryItems) {
            if (nexaudioitem.getEndTime() > i && nexaudioitem.getStartTime() < i2) {
                arrayList.add(nexaudioitem);
            }
        }
        int i3 = 0;
        int i4 = 0;
        while (i3 < arrayList.size() - 1) {
            int i5 = i3 + 1;
            if (((nexAudioItem) arrayList.get(i3)).getEndTime() > ((nexAudioItem) arrayList.get(i5)).getStartTime() && ((nexAudioItem) arrayList.get(i3)).getStartTime() < ((nexAudioItem) arrayList.get(i5)).getEndTime()) {
                i4++;
            }
            i3 = i5;
        }
        return i4 < 2;
    }

    public static nexProject clone(nexProject nexproject) {
        nexProject nexproject2 = nexproject.mEmptyTheme ? new nexProject() : new nexProject(nexproject.mThemeId);
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("clone src project[");
        sb.append(nexproject.mId);
        sb.append("] to dest project[");
        sb.append(nexproject2.mId);
        sb.append("]");
        Log.d(str, sb.toString());
        nexproject2.mThemeId = nexproject.mThemeId;
        nexproject2.mTheme = nexproject.mTheme;
        nexproject2.mEmptyTheme = nexproject.mEmptyTheme;
        nexproject2.mAudioFadeInTime = nexproject.mAudioFadeInTime;
        nexproject2.mAudioFadeOutTime = nexproject.mAudioFadeOutTime;
        nexproject2.mOpeningTitle = nexproject.mOpeningTitle;
        nexproject2.mEndingTitle = nexproject.mEndingTitle;
        nexproject2.mBGMVolumeScale = nexproject.mBGMVolumeScale;
        nexproject2.mUseThemeMusic2BGM = nexproject.mUseThemeMusic2BGM;
        nexproject2.mLoopBGM = nexproject.mLoopBGM;
        nexproject2.mStartTimeBGM = nexproject.mStartTimeBGM;
        nexproject2.mClipTimeUpdated = nexproject.mClipTimeUpdated;
        nexproject2.mNeedLoadList = nexproject.mNeedLoadList;
        for (nexOverlayItem clone : nexproject.getOverlayItems()) {
            nexproject2.addOverlay(nexOverlayItem.clone(clone));
        }
        if (nexproject.mBackGroundMusic != null) {
            nexproject2.mBackGroundMusic = nexClip.clone(nexproject.mBackGroundMusic);
        }
        for (nexClip clone2 : nexproject.getPrimaryItems()) {
            nexproject2.addClone(nexproject2.getTotalClipCount(true), nexClip.clone(clone2));
        }
        int i = 0;
        for (nexAudioItem clone3 : nexproject.getAudioItems()) {
            nexproject2.addCloneAudio(i, nexAudioItem.clone(clone3));
            i++;
        }
        return nexproject2;
    }

    public static nexProject createFromSaveString(String str) {
        return new nexProject(((nexSaveDataFormat) new Gson().fromJson(str, nexSaveDataFormat.class)).project);
    }

    private int getClipTimeGuideLine(int i) {
        int i2 = i - 1;
        int i3 = 0;
        if (i >= this.mPrimaryItems.size() || i < 0) {
            return 0;
        }
        if (i2 >= 0) {
            int offset = ((nexClip) this.mPrimaryItems.get(i2)).getTransitionEffect(true).getOffset();
            int overlap = ((nexClip) this.mPrimaryItems.get(i2)).getTransitionEffect(true).getOverlap();
            int duration = ((nexClip) this.mPrimaryItems.get(i2)).getTransitionEffect(true).getDuration();
            i3 = (duration - ((offset * duration) / 100)) + ((duration * overlap) / 100);
        }
        int offset2 = ((nexClip) this.mPrimaryItems.get(i)).getTransitionEffect(true).getOffset();
        int duration2 = ((nexClip) this.mPrimaryItems.get(i)).getTransitionEffect(true).getDuration();
        return ((i3 + (duration2 - ((offset2 * duration2) / 100))) / 500) * 500;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:13:0x0070, code lost:
        if (r3 > r10) goto L_0x0074;
     */
    private int getTransitionTimeGuideLine(int i, int i2) {
        int i3;
        int i4 = i - 1;
        int i5 = i + 1;
        if (i5 >= this.mPrimaryItems.size()) {
            return 0;
        }
        if (i2 < 0) {
            i2 = 500;
        }
        int projectDuration = ((nexClip) this.mPrimaryItems.get(i)).getProjectDuration();
        if (i4 >= 0) {
            int offset = ((nexClip) this.mPrimaryItems.get(i4)).getTransitionEffect(true).getOffset();
            int overlap = ((nexClip) this.mPrimaryItems.get(i4)).getTransitionEffect(true).getOverlap();
            int duration = ((nexClip) this.mPrimaryItems.get(i4)).getTransitionEffect(true).getDuration();
            projectDuration = (projectDuration - (duration - ((offset * duration) / 100))) - ((duration * overlap) / 100);
        }
        int i6 = projectDuration - i2;
        if (i5 > 0) {
            i3 = ((nexClip) this.mPrimaryItems.get(i5)).getProjectDuration() / 3;
        }
        i3 = i6;
        int offset2 = ((nexClip) this.mPrimaryItems.get(i)).getTransitionEffect(true).getOffset();
        int i7 = i3 * 2;
        if (offset2 > 0) {
            i7 = (i3 * 100) / offset2;
        }
        return (i7 / 500) * 500;
    }

    private int isPrimaryItem(nexClip nexclip) {
        if (nexclip.getClipType() == 3) {
            return 0;
        }
        return (nexclip.getClipType() == 4 || nexclip.getClipType() == 1) ? 1 : -1;
    }

    private static void logClipOf(int i, nexClipOf nexclipof) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("[");
        sb.append(i);
        sb.append("]nexClipOf.m_BGMVolume=");
        sb.append(nexclipof.m_BGMVolume);
        Log.d(str, sb.toString());
        String str2 = TAG;
        StringBuilder sb2 = new StringBuilder();
        sb2.append("[");
        sb2.append(i);
        sb2.append("]nexClipOf.mCollageDrawInfoID=");
        sb2.append(nexclipof.mCollageDrawInfoID);
        Log.d(str2, sb2.toString());
        String str3 = TAG;
        StringBuilder sb3 = new StringBuilder();
        sb3.append("[");
        sb3.append(i);
        sb3.append("]nexClipOf.mPath=");
        sb3.append(nexclipof.mPath);
        Log.d(str3, sb3.toString());
        String str4 = TAG;
        StringBuilder sb4 = new StringBuilder();
        sb4.append("[");
        sb4.append(i);
        sb4.append("]nexClipOf.mTransCodingPath=");
        sb4.append(nexclipof.mTransCodingPath);
        Log.d(str4, sb4.toString());
        String str5 = TAG;
        StringBuilder sb5 = new StringBuilder();
        sb5.append("[");
        sb5.append(i);
        sb5.append("]nexClipOf.m_Brightness=");
        sb5.append(nexclipof.m_Brightness);
        Log.d(str5, sb5.toString());
        String str6 = TAG;
        StringBuilder sb6 = new StringBuilder();
        sb6.append("[");
        sb6.append(i);
        sb6.append("]nexClipOf.m_ClipVolume=");
        sb6.append(nexclipof.m_ClipVolume);
        Log.d(str6, sb6.toString());
        String str7 = TAG;
        StringBuilder sb7 = new StringBuilder();
        sb7.append("[");
        sb7.append(i);
        sb7.append("]nexClipOf.m_Contrast=");
        sb7.append(nexclipof.m_Contrast);
        Log.d(str7, sb7.toString());
        String str8 = TAG;
        StringBuilder sb8 = new StringBuilder();
        sb8.append("[");
        sb8.append(i);
        sb8.append("]nexClipOf.m_Saturation=");
        sb8.append(nexclipof.m_Saturation);
        Log.d(str8, sb8.toString());
        String str9 = TAG;
        StringBuilder sb9 = new StringBuilder();
        sb9.append("[");
        sb9.append(i);
        sb9.append("]nexClipOf.mAudioOnOff=");
        sb9.append(nexclipof.mAudioOnOff);
        Log.d(str9, sb9.toString());
        String str10 = TAG;
        StringBuilder sb10 = new StringBuilder();
        sb10.append("[");
        sb10.append(i);
        sb10.append("]nexClipOf.mAVSyncAudioStartTime=");
        sb10.append(nexclipof.mAVSyncAudioStartTime);
        Log.d(str10, sb10.toString());
        String str11 = TAG;
        StringBuilder sb11 = new StringBuilder();
        sb11.append("[");
        sb11.append(i);
        sb11.append("]nexClipOf.mCustomLUT_A=");
        sb11.append(nexclipof.mCustomLUT_A);
        Log.d(str11, sb11.toString());
        String str12 = TAG;
        StringBuilder sb12 = new StringBuilder();
        sb12.append("[");
        sb12.append(i);
        sb12.append("]nexClipOf.mCustomLUT_B=");
        sb12.append(nexclipof.mCustomLUT_B);
        Log.d(str12, sb12.toString());
        String str13 = TAG;
        StringBuilder sb13 = new StringBuilder();
        sb13.append("[");
        sb13.append(i);
        sb13.append("]nexClipOf.mCustomLUT_Power=");
        sb13.append(nexclipof.mCustomLUT_Power);
        Log.d(str13, sb13.toString());
        String str14 = TAG;
        StringBuilder sb14 = new StringBuilder();
        sb14.append("[");
        sb14.append(i);
        sb14.append("]nexClipOf.mDuration=");
        sb14.append(nexclipof.mDuration);
        Log.d(str14, sb14.toString());
        String str15 = TAG;
        StringBuilder sb15 = new StringBuilder();
        sb15.append("[");
        sb15.append(i);
        sb15.append("]nexClipOf.mEndTime=");
        sb15.append(nexclipof.mEndTime);
        Log.d(str15, sb15.toString());
        String str16 = TAG;
        StringBuilder sb16 = new StringBuilder();
        sb16.append("[");
        sb16.append(i);
        sb16.append("]nexClipOf.mFaceDetected=");
        sb16.append(nexclipof.mFaceDetected);
        Log.d(str16, sb16.toString());
        String str17 = TAG;
        StringBuilder sb17 = new StringBuilder();
        sb17.append("[");
        sb17.append(i);
        sb17.append("]nexClipOf.mFacedetectProcessed=");
        sb17.append(nexclipof.mFacedetectProcessed);
        Log.d(str17, sb17.toString());
        String str18 = TAG;
        StringBuilder sb18 = new StringBuilder();
        sb18.append("[");
        sb18.append(i);
        sb18.append("]nexClipOf.misMustDownSize=");
        sb18.append(nexclipof.misMustDownSize);
        Log.d(str18, sb18.toString());
        String str19 = TAG;
        StringBuilder sb19 = new StringBuilder();
        sb19.append("[");
        sb19.append(i);
        sb19.append("]nexClipOf.mMediaInfoUseCache=");
        sb19.append(nexclipof.mMediaInfoUseCache);
        Log.d(str19, sb19.toString());
        String str20 = TAG;
        StringBuilder sb20 = new StringBuilder();
        sb20.append("[");
        sb20.append(i);
        sb20.append("]nexClipOf.mOverlappedTransition=");
        sb20.append(nexclipof.mOverlappedTransition);
        Log.d(str20, sb20.toString());
        String str21 = TAG;
        StringBuilder sb21 = new StringBuilder();
        sb21.append("[");
        sb21.append(i);
        sb21.append("]nexClipOf.mPropertySlowVideoMode=");
        sb21.append(nexclipof.mPropertySlowVideoMode);
        Log.d(str21, sb21.toString());
        String str22 = TAG;
        StringBuilder sb22 = new StringBuilder();
        sb22.append("[");
        sb22.append(i);
        sb22.append("]nexClipOf.mStartTime=");
        sb22.append(nexclipof.mStartTime);
        Log.d(str22, sb22.toString());
        String str23 = TAG;
        StringBuilder sb23 = new StringBuilder();
        sb23.append("[");
        sb23.append(i);
        sb23.append("]nexClipOf.mTemplateAudioPos=");
        sb23.append(nexclipof.mTemplateAudioPos);
        Log.d(str23, sb23.toString());
        String str24 = TAG;
        StringBuilder sb24 = new StringBuilder();
        sb24.append("[");
        sb24.append(i);
        sb24.append("]nexClipOf.mTemplateEffectID=");
        sb24.append(nexclipof.mTemplateEffectID);
        Log.d(str24, sb24.toString());
        String str25 = TAG;
        StringBuilder sb25 = new StringBuilder();
        sb25.append("[");
        sb25.append(i);
        sb25.append("]nexClipOf.mTitleEffectEndTime=");
        sb25.append(nexclipof.mTitleEffectEndTime);
        Log.d(str25, sb25.toString());
        String str26 = TAG;
        StringBuilder sb26 = new StringBuilder();
        sb26.append("[");
        sb26.append(i);
        sb26.append("]nexClipOf.mTitleEffectStartTime=");
        sb26.append(nexclipof.mTitleEffectStartTime);
        Log.d(str26, sb26.toString());
        String str27 = TAG;
        StringBuilder sb27 = new StringBuilder();
        sb27.append("[");
        sb27.append(i);
        sb27.append("]nexClipOf.mInfo.mExistAudio=");
        sb27.append(nexclipof.mInfo.mExistAudio);
        Log.d(str27, sb27.toString());
        String str28 = TAG;
        StringBuilder sb28 = new StringBuilder();
        sb28.append("[");
        sb28.append(i);
        sb28.append("]nexClipOf.mInfo.mVideoTotalTime=");
        sb28.append(nexclipof.mInfo.mVideoTotalTime);
        Log.d(str28, sb28.toString());
        String str29 = TAG;
        StringBuilder sb29 = new StringBuilder();
        sb29.append("[");
        sb29.append(i);
        sb29.append("]nexClipOf.mInfo.mSeekPointCount=");
        sb29.append(nexclipof.mInfo.mSeekPointCount);
        Log.d(str29, sb29.toString());
        String str30 = TAG;
        StringBuilder sb30 = new StringBuilder();
        sb30.append("[");
        sb30.append(i);
        sb30.append("]nexClipOf.mInfo.mFramesPerSecond=");
        sb30.append(nexclipof.mInfo.mFramesPerSecond);
        Log.d(str30, sb30.toString());
        String str31 = TAG;
        StringBuilder sb31 = new StringBuilder();
        sb31.append("[");
        sb31.append(i);
        sb31.append("]nexClipOf.mInfo.mAudioCodecType=");
        sb31.append(nexclipof.mInfo.mAudioCodecType);
        Log.d(str31, sb31.toString());
        String str32 = TAG;
        StringBuilder sb32 = new StringBuilder();
        sb32.append("[");
        sb32.append(i);
        sb32.append("]nexClipOf.mInfo.mMimeType=");
        sb32.append(nexclipof.mInfo.mMimeType);
        Log.d(str32, sb32.toString());
        String str33 = TAG;
        StringBuilder sb33 = new StringBuilder();
        sb33.append("[");
        sb33.append(i);
        sb33.append("]nexClipOf.mInfo.mVideoCodecType=");
        sb33.append(nexclipof.mInfo.mVideoCodecType);
        Log.d(str33, sb33.toString());
        String str34 = TAG;
        StringBuilder sb34 = new StringBuilder();
        sb34.append("[");
        sb34.append(i);
        sb34.append("]nexClipOf.mInfo.mAudioBitrate=");
        sb34.append(nexclipof.mInfo.mAudioBitrate);
        Log.d(str34, sb34.toString());
        String str35 = TAG;
        StringBuilder sb35 = new StringBuilder();
        sb35.append("[");
        sb35.append(i);
        sb35.append("]nexClipOf.mInfo.mAudioTotalTime=");
        sb35.append(nexclipof.mInfo.mAudioTotalTime);
        Log.d(str35, sb35.toString());
        String str36 = TAG;
        StringBuilder sb36 = new StringBuilder();
        sb36.append("[");
        sb36.append(i);
        sb36.append("]nexClipOf.mInfo.mClipType=");
        sb36.append(nexclipof.mInfo.mClipType);
        Log.d(str36, sb36.toString());
        String str37 = TAG;
        StringBuilder sb37 = new StringBuilder();
        sb37.append("[");
        sb37.append(i);
        sb37.append("]nexClipOf.mInfo.mDisplayHeight=");
        sb37.append(nexclipof.mInfo.mDisplayHeight);
        Log.d(str37, sb37.toString());
        String str38 = TAG;
        StringBuilder sb38 = new StringBuilder();
        sb38.append("[");
        sb38.append(i);
        sb38.append("]nexClipOf.mInfo.mDisplayWidth=");
        sb38.append(nexclipof.mInfo.mDisplayWidth);
        Log.d(str38, sb38.toString());
        String str39 = TAG;
        StringBuilder sb39 = new StringBuilder();
        sb39.append("[");
        sb39.append(i);
        sb39.append("]nexClipOf.mInfo.mExistVideo=");
        sb39.append(nexclipof.mInfo.mExistVideo);
        Log.d(str39, sb39.toString());
        String str40 = TAG;
        StringBuilder sb40 = new StringBuilder();
        sb40.append("[");
        sb40.append(i);
        sb40.append("]nexClipOf.mInfo.mH264Level=");
        sb40.append(nexclipof.mInfo.mH264Level);
        Log.d(str40, sb40.toString());
        String str41 = TAG;
        StringBuilder sb41 = new StringBuilder();
        sb41.append("[");
        sb41.append(i);
        sb41.append("]nexClipOf.mInfo.mH264Profile=");
        sb41.append(nexclipof.mInfo.mH264Profile);
        Log.d(str41, sb41.toString());
        String str42 = TAG;
        StringBuilder sb42 = new StringBuilder();
        sb42.append("[");
        sb42.append(i);
        sb42.append("]nexClipOf.mInfo.mHeight=");
        sb42.append(nexclipof.mInfo.mHeight);
        Log.d(str42, sb42.toString());
        String str43 = TAG;
        StringBuilder sb43 = new StringBuilder();
        sb43.append("[");
        sb43.append(i);
        sb43.append("]nexClipOf.mInfo.mRotateDegreeInMeta=");
        sb43.append(nexclipof.mInfo.mRotateDegreeInMeta);
        Log.d(str43, sb43.toString());
        String str44 = TAG;
        StringBuilder sb44 = new StringBuilder();
        sb44.append("[");
        sb44.append(i);
        sb44.append("]nexClipOf.mInfo.mSuppertedResult=");
        sb44.append(nexclipof.mInfo.mSuppertedResult);
        Log.d(str44, sb44.toString());
        String str45 = TAG;
        StringBuilder sb45 = new StringBuilder();
        sb45.append("[");
        sb45.append(i);
        sb45.append("]nexClipOf.mInfo.mTotalTime=");
        sb45.append(nexclipof.mInfo.mTotalTime);
        Log.d(str45, sb45.toString());
        String str46 = TAG;
        StringBuilder sb46 = new StringBuilder();
        sb46.append("[");
        sb46.append(i);
        sb46.append("]nexClipOf.mInfo.mVideoBitrate=");
        sb46.append(nexclipof.mInfo.mVideoBitrate);
        Log.d(str46, sb46.toString());
        String str47 = TAG;
        StringBuilder sb47 = new StringBuilder();
        sb47.append("[");
        sb47.append(i);
        sb47.append("]nexClipOf.mInfo.mVideoRenderMode=");
        sb47.append(nexclipof.mInfo.mVideoRenderMode);
        Log.d(str47, sb47.toString());
        String str48 = TAG;
        StringBuilder sb48 = new StringBuilder();
        sb48.append("[");
        sb48.append(i);
        sb48.append("]nexClipOf.mInfo.mVideoHDRType=");
        sb48.append(nexclipof.mInfo.mVideoHDRType);
        Log.d(str48, sb48.toString());
        String str49 = TAG;
        StringBuilder sb49 = new StringBuilder();
        sb49.append("[");
        sb49.append(i);
        sb49.append("]nexClipOf.mInfo.mVideoTotalTime=");
        sb49.append(nexclipof.mInfo.mVideoTotalTime);
        Log.d(str49, sb49.toString());
        String str50 = TAG;
        StringBuilder sb50 = new StringBuilder();
        sb50.append("[");
        sb50.append(i);
        sb50.append("]nexClipOf.mInfo.mWidth=");
        sb50.append(nexclipof.mInfo.mWidth);
        Log.d(str50, sb50.toString());
        if (nexclipof.mClipEffect == null) {
            String str51 = TAG;
            StringBuilder sb51 = new StringBuilder();
            sb51.append("[");
            sb51.append(i);
            sb51.append("]nexClipOf.mClipEffect= null");
            Log.d(str51, sb51.toString());
        } else {
            String str52 = TAG;
            StringBuilder sb52 = new StringBuilder();
            sb52.append("[");
            sb52.append(i);
            sb52.append("]nexClipOf.mClipEffect.mAutoID=");
            sb52.append(nexclipof.mClipEffect.mAutoID);
            Log.d(str52, sb52.toString());
            String str53 = TAG;
            StringBuilder sb53 = new StringBuilder();
            sb53.append("[");
            sb53.append(i);
            sb53.append("]nexClipOf.mClipEffect.mID=");
            sb53.append(nexclipof.mClipEffect.mID);
            Log.d(str53, sb53.toString());
            String str54 = TAG;
            StringBuilder sb54 = new StringBuilder();
            sb54.append("[");
            sb54.append(i);
            sb54.append("]nexClipOf.mClipEffect.mName=");
            sb54.append(nexclipof.mClipEffect.mName);
            Log.d(str54, sb54.toString());
            String str55 = TAG;
            StringBuilder sb55 = new StringBuilder();
            sb55.append("[");
            sb55.append(i);
            sb55.append("]nexClipOf.mClipEffect.mID=");
            sb55.append(nexclipof.mClipEffect.mDuration);
            Log.d(str55, sb55.toString());
            String str56 = TAG;
            StringBuilder sb56 = new StringBuilder();
            sb56.append("[");
            sb56.append(i);
            sb56.append("]nexClipOf.mClipEffect.mEffectOffset=");
            sb56.append(nexclipof.mClipEffect.mEffectOffset);
            Log.d(str56, sb56.toString());
            String str57 = TAG;
            StringBuilder sb57 = new StringBuilder();
            sb57.append("[");
            sb57.append(i);
            sb57.append("]nexClipOf.mClipEffect.mEffectOverlap=");
            sb57.append(nexclipof.mClipEffect.mEffectOverlap);
            Log.d(str57, sb57.toString());
            String str58 = TAG;
            StringBuilder sb58 = new StringBuilder();
            sb58.append("[");
            sb58.append(i);
            sb58.append("]nexClipOf.mClipEffect.mIsResolveOptions=");
            sb58.append(nexclipof.mClipEffect.mIsResolveOptions);
            Log.d(str58, sb58.toString());
            String str59 = TAG;
            StringBuilder sb59 = new StringBuilder();
            sb59.append("[");
            sb59.append(i);
            sb59.append("]nexClipOf.mClipEffect.mMaxDuration=");
            sb59.append(nexclipof.mClipEffect.mMaxDuration);
            Log.d(str59, sb59.toString());
            String str60 = TAG;
            StringBuilder sb60 = new StringBuilder();
            sb60.append("[");
            sb60.append(i);
            sb60.append("]nexClipOf.mClipEffect.mMinDuration=");
            sb60.append(nexclipof.mClipEffect.mMinDuration);
            Log.d(str60, sb60.toString());
            String str61 = TAG;
            StringBuilder sb61 = new StringBuilder();
            sb61.append("[");
            sb61.append(i);
            sb61.append("]nexClipOf.mClipEffect.mOptionsUpdate=");
            sb61.append(nexclipof.mClipEffect.mOptionsUpdate);
            Log.d(str61, sb61.toString());
            String str62 = TAG;
            StringBuilder sb62 = new StringBuilder();
            sb62.append("[");
            sb62.append(i);
            sb62.append("]nexClipOf.mClipEffect.mShowEndTime=");
            sb62.append(nexclipof.mClipEffect.mShowEndTime);
            Log.d(str62, sb62.toString());
            String str63 = TAG;
            StringBuilder sb63 = new StringBuilder();
            sb63.append("[");
            sb63.append(i);
            sb63.append("]nexClipOf.mClipEffect.mShowStartTime=");
            sb63.append(nexclipof.mClipEffect.mShowStartTime);
            Log.d(str63, sb63.toString());
            String str64 = TAG;
            StringBuilder sb64 = new StringBuilder();
            sb64.append("[");
            sb64.append(i);
            sb64.append("]nexClipOf.mClipEffect.mType=");
            sb64.append(nexclipof.mClipEffect.mType);
            Log.d(str64, sb64.toString());
            String str65 = TAG;
            StringBuilder sb65 = new StringBuilder();
            sb65.append("[");
            sb65.append(i);
            sb65.append("]nexClipOf.mClipEffect.itemMethodType=");
            sb65.append(nexclipof.mClipEffect.itemMethodType);
            Log.d(str65, sb65.toString());
        }
        if (nexclipof.mTransitionEffect == null) {
            String str66 = TAG;
            StringBuilder sb66 = new StringBuilder();
            sb66.append("[");
            sb66.append(i);
            sb66.append("]nexClipOf.mTransitionEffect= null");
            Log.d(str66, sb66.toString());
        } else {
            String str67 = TAG;
            StringBuilder sb67 = new StringBuilder();
            sb67.append("[");
            sb67.append(i);
            sb67.append("]nexClipOf.mTransitionEffect.mAutoID=");
            sb67.append(nexclipof.mClipEffect.mAutoID);
            Log.d(str67, sb67.toString());
            String str68 = TAG;
            StringBuilder sb68 = new StringBuilder();
            sb68.append("[");
            sb68.append(i);
            sb68.append("]nexClipOf.mTransitionEffect.mID=");
            sb68.append(nexclipof.mClipEffect.mID);
            Log.d(str68, sb68.toString());
            String str69 = TAG;
            StringBuilder sb69 = new StringBuilder();
            sb69.append("[");
            sb69.append(i);
            sb69.append("]nexClipOf.mTransitionEffect.mName=");
            sb69.append(nexclipof.mClipEffect.mName);
            Log.d(str69, sb69.toString());
            String str70 = TAG;
            StringBuilder sb70 = new StringBuilder();
            sb70.append("[");
            sb70.append(i);
            sb70.append("]nexClipOf.mTransitionEffect.mID=");
            sb70.append(nexclipof.mClipEffect.mDuration);
            Log.d(str70, sb70.toString());
            String str71 = TAG;
            StringBuilder sb71 = new StringBuilder();
            sb71.append("[");
            sb71.append(i);
            sb71.append("]nexClipOf.mTransitionEffect.mEffectOffset=");
            sb71.append(nexclipof.mClipEffect.mEffectOffset);
            Log.d(str71, sb71.toString());
            String str72 = TAG;
            StringBuilder sb72 = new StringBuilder();
            sb72.append("[");
            sb72.append(i);
            sb72.append("]nexClipOf.mTransitionEffect.mEffectOverlap=");
            sb72.append(nexclipof.mClipEffect.mEffectOverlap);
            Log.d(str72, sb72.toString());
            String str73 = TAG;
            StringBuilder sb73 = new StringBuilder();
            sb73.append("[");
            sb73.append(i);
            sb73.append("]nexClipOf.mTransitionEffect.mIsResolveOptions=");
            sb73.append(nexclipof.mClipEffect.mIsResolveOptions);
            Log.d(str73, sb73.toString());
            String str74 = TAG;
            StringBuilder sb74 = new StringBuilder();
            sb74.append("[");
            sb74.append(i);
            sb74.append("]nexClipOf.mTransitionEffect.mMaxDuration=");
            sb74.append(nexclipof.mClipEffect.mMaxDuration);
            Log.d(str74, sb74.toString());
            String str75 = TAG;
            StringBuilder sb75 = new StringBuilder();
            sb75.append("[");
            sb75.append(i);
            sb75.append("]nexClipOf.mTransitionEffect.mMinDuration=");
            sb75.append(nexclipof.mClipEffect.mMinDuration);
            Log.d(str75, sb75.toString());
            String str76 = TAG;
            StringBuilder sb76 = new StringBuilder();
            sb76.append("[");
            sb76.append(i);
            sb76.append("]nexClipOf.mTransitionEffect.mOptionsUpdate=");
            sb76.append(nexclipof.mClipEffect.mOptionsUpdate);
            Log.d(str76, sb76.toString());
            String str77 = TAG;
            StringBuilder sb77 = new StringBuilder();
            sb77.append("[");
            sb77.append(i);
            sb77.append("]nexClipOf.mTransitionEffect.mShowEndTime=");
            sb77.append(nexclipof.mClipEffect.mShowEndTime);
            Log.d(str77, sb77.toString());
            String str78 = TAG;
            StringBuilder sb78 = new StringBuilder();
            sb78.append("[");
            sb78.append(i);
            sb78.append("]nexClipOf.mTransitionEffect.mShowStartTime=");
            sb78.append(nexclipof.mClipEffect.mShowStartTime);
            Log.d(str78, sb78.toString());
            String str79 = TAG;
            StringBuilder sb79 = new StringBuilder();
            sb79.append("[");
            sb79.append(i);
            sb79.append("]nexClipOf.mTransitionEffect.mType=");
            sb79.append(nexclipof.mClipEffect.mType);
            Log.d(str79, sb79.toString());
            String str80 = TAG;
            StringBuilder sb80 = new StringBuilder();
            sb80.append("[");
            sb80.append(i);
            sb80.append("]nexClipOf.mTransitionEffect.itemMethodType=");
            sb80.append(nexclipof.mClipEffect.itemMethodType);
            Log.d(str80, sb80.toString());
        }
        if (nexclipof.mCrop == null) {
            String str81 = TAG;
            StringBuilder sb81 = new StringBuilder();
            sb81.append("[");
            sb81.append(i);
            sb81.append("]nexClipOf.mCrop= null");
            Log.d(str81, sb81.toString());
        } else {
            String str82 = TAG;
            StringBuilder sb82 = new StringBuilder();
            sb82.append("[");
            sb82.append(i);
            sb82.append("]nexClipOf.mCrop.m_endPositionBottom=");
            sb82.append(nexclipof.mCrop.m_endPositionBottom);
            Log.d(str82, sb82.toString());
            String str83 = TAG;
            StringBuilder sb83 = new StringBuilder();
            sb83.append("[");
            sb83.append(i);
            sb83.append("]nexClipOf.mCrop.m_endPositionLeft=");
            sb83.append(nexclipof.mCrop.m_endPositionLeft);
            Log.d(str83, sb83.toString());
            String str84 = TAG;
            StringBuilder sb84 = new StringBuilder();
            sb84.append("[");
            sb84.append(i);
            sb84.append("]nexClipOf.mCrop.m_endPositionRight=");
            sb84.append(nexclipof.mCrop.m_endPositionRight);
            Log.d(str84, sb84.toString());
            String str85 = TAG;
            StringBuilder sb85 = new StringBuilder();
            sb85.append("[");
            sb85.append(i);
            sb85.append("]nexClipOf.mCrop.m_endPositionTop=");
            sb85.append(nexclipof.mCrop.m_endPositionTop);
            Log.d(str85, sb85.toString());
            String str86 = TAG;
            StringBuilder sb86 = new StringBuilder();
            sb86.append("[");
            sb86.append(i);
            sb86.append("]nexClipOf.mCrop.m_startPositionBottom=");
            sb86.append(nexclipof.mCrop.m_startPositionBottom);
            Log.d(str86, sb86.toString());
            String str87 = TAG;
            StringBuilder sb87 = new StringBuilder();
            sb87.append("[");
            sb87.append(i);
            sb87.append("]nexClipOf.mCrop.m_startPositionLeft=");
            sb87.append(nexclipof.mCrop.m_startPositionLeft);
            Log.d(str87, sb87.toString());
            String str88 = TAG;
            StringBuilder sb88 = new StringBuilder();
            sb88.append("[");
            sb88.append(i);
            sb88.append("]nexClipOf.mCrop.m_startPositionLeft=");
            sb88.append(nexclipof.mCrop.m_startPositionRight);
            Log.d(str88, sb88.toString());
            String str89 = TAG;
            StringBuilder sb89 = new StringBuilder();
            sb89.append("[");
            sb89.append(i);
            sb89.append("]nexClipOf.mCrop.m_startPositionLeft=");
            sb89.append(nexclipof.mCrop.m_startPositionTop);
            Log.d(str89, sb89.toString());
            String str90 = TAG;
            StringBuilder sb90 = new StringBuilder();
            sb90.append("[");
            sb90.append(i);
            sb90.append("]nexClipOf.mCrop.m_faceBounds_bottom=");
            sb90.append(nexclipof.mCrop.m_faceBounds_bottom);
            Log.d(str90, sb90.toString());
            String str91 = TAG;
            StringBuilder sb91 = new StringBuilder();
            sb91.append("[");
            sb91.append(i);
            sb91.append("]nexClipOf.mCrop.m_faceBounds_left=");
            sb91.append(nexclipof.mCrop.m_faceBounds_left);
            Log.d(str91, sb91.toString());
            String str92 = TAG;
            StringBuilder sb92 = new StringBuilder();
            sb92.append("[");
            sb92.append(i);
            sb92.append("]nexClipOf.mCrop.m_faceBounds_right=");
            sb92.append(nexclipof.mCrop.m_faceBounds_right);
            Log.d(str92, sb92.toString());
            String str93 = TAG;
            StringBuilder sb93 = new StringBuilder();
            sb93.append("[");
            sb93.append(i);
            sb93.append("]nexClipOf.mCrop.m_faceBounds_set=");
            sb93.append(nexclipof.mCrop.m_faceBounds_set);
            Log.d(str93, sb93.toString());
            String str94 = TAG;
            StringBuilder sb94 = new StringBuilder();
            sb94.append("[");
            sb94.append(i);
            sb94.append("]nexClipOf.mCrop.m_faceBounds_top=");
            sb94.append(nexclipof.mCrop.m_faceBounds_top);
            Log.d(str94, sb94.toString());
            String str95 = TAG;
            StringBuilder sb95 = new StringBuilder();
            sb95.append("[");
            sb95.append(i);
            sb95.append("]nexClipOf.mCrop.m_facePositionBottom=");
            sb95.append(nexclipof.mCrop.m_facePositionBottom);
            Log.d(str95, sb95.toString());
            String str96 = TAG;
            StringBuilder sb96 = new StringBuilder();
            sb96.append("[");
            sb96.append(i);
            sb96.append("]nexClipOf.mCrop.m_facePositionLeft=");
            sb96.append(nexclipof.mCrop.m_facePositionLeft);
            Log.d(str96, sb96.toString());
            String str97 = TAG;
            StringBuilder sb97 = new StringBuilder();
            sb97.append("[");
            sb97.append(i);
            sb97.append("]nexClipOf.mCrop.m_facePositionRight=");
            sb97.append(nexclipof.mCrop.m_facePositionRight);
            Log.d(str97, sb97.toString());
            String str98 = TAG;
            StringBuilder sb98 = new StringBuilder();
            sb98.append("[");
            sb98.append(i);
            sb98.append("]nexClipOf.mCrop.m_facePositionTop=");
            sb98.append(nexclipof.mCrop.m_facePositionTop);
            Log.d(str98, sb98.toString());
            String str99 = TAG;
            StringBuilder sb99 = new StringBuilder();
            sb99.append("[");
            sb99.append(i);
            sb99.append("]nexClipOf.mCrop.m_height=");
            sb99.append(nexclipof.mCrop.m_height);
            Log.d(str99, sb99.toString());
            String str100 = TAG;
            StringBuilder sb100 = new StringBuilder();
            sb100.append("[");
            sb100.append(i);
            sb100.append("]nexClipOf.mCrop.m_height=");
            sb100.append(nexclipof.mCrop.m_width);
            Log.d(str100, sb100.toString());
            String str101 = TAG;
            StringBuilder sb101 = new StringBuilder();
            sb101.append("[");
            sb101.append(i);
            sb101.append("]nexClipOf.mCrop.m_rotatedEndPositionBottom=");
            sb101.append(nexclipof.mCrop.m_rotatedEndPositionBottom);
            Log.d(str101, sb101.toString());
            String str102 = TAG;
            StringBuilder sb102 = new StringBuilder();
            sb102.append("[");
            sb102.append(i);
            sb102.append("]nexClipOf.mCrop.m_rotatedEndPositionLeft=");
            sb102.append(nexclipof.mCrop.m_rotatedEndPositionLeft);
            Log.d(str102, sb102.toString());
            String str103 = TAG;
            StringBuilder sb103 = new StringBuilder();
            sb103.append("[");
            sb103.append(i);
            sb103.append("]nexClipOf.mCrop.m_rotatedEndPositionRight=");
            sb103.append(nexclipof.mCrop.m_rotatedEndPositionRight);
            Log.d(str103, sb103.toString());
            String str104 = TAG;
            StringBuilder sb104 = new StringBuilder();
            sb104.append("[");
            sb104.append(i);
            sb104.append("]nexClipOf.mCrop.m_rotatedEndPositionTop=");
            sb104.append(nexclipof.mCrop.m_rotatedEndPositionTop);
            Log.d(str104, sb104.toString());
            String str105 = TAG;
            StringBuilder sb105 = new StringBuilder();
            sb105.append("[");
            sb105.append(i);
            sb105.append("]nexClipOf.mCrop.m_rotation=");
            sb105.append(nexclipof.mCrop.m_rotation);
            Log.d(str105, sb105.toString());
            String str106 = TAG;
            StringBuilder sb106 = new StringBuilder();
            sb106.append("[");
            sb106.append(i);
            sb106.append("]nexClipOf.mCrop.m_rotatedStartPositionBottom=");
            sb106.append(nexclipof.mCrop.m_rotatedStartPositionBottom);
            Log.d(str106, sb106.toString());
            String str107 = TAG;
            StringBuilder sb107 = new StringBuilder();
            sb107.append("[");
            sb107.append(i);
            sb107.append("]nexClipOf.mCrop.m_rotatedStartPositionBottom=");
            sb107.append(nexclipof.mCrop.m_rotatedStartPositionLeft);
            Log.d(str107, sb107.toString());
            String str108 = TAG;
            StringBuilder sb108 = new StringBuilder();
            sb108.append("[");
            sb108.append(i);
            sb108.append("]nexClipOf.mCrop.m_rotatedStartPositionBottom=");
            sb108.append(nexclipof.mCrop.m_rotatedStartPositionRight);
            Log.d(str108, sb108.toString());
            String str109 = TAG;
            StringBuilder sb109 = new StringBuilder();
            sb109.append("[");
            sb109.append(i);
            sb109.append("]nexClipOf.mCrop.m_rotatedStartPositionBottom=");
            sb109.append(nexclipof.mCrop.m_rotatedStartPositionTop);
            Log.d(str109, sb109.toString());
        }
        if (nexclipof.mDrawInfos != null) {
            for (nexDrawInfo nexdrawinfo : nexclipof.mDrawInfos) {
                String str110 = TAG;
                StringBuilder sb110 = new StringBuilder();
                sb110.append("[");
                sb110.append(i);
                sb110.append("]nexClipOf.mDrawInfos.getCustomLUTA=");
                sb110.append(nexdrawinfo.getCustomLUTA());
                Log.d(str110, sb110.toString());
                String str111 = TAG;
                StringBuilder sb111 = new StringBuilder();
                sb111.append("[");
                sb111.append(i);
                sb111.append("]nexClipOf.mDrawInfos.getCustomLUTB=");
                sb111.append(nexdrawinfo.getCustomLUTB());
                Log.d(str111, sb111.toString());
                String str112 = TAG;
                StringBuilder sb112 = new StringBuilder();
                sb112.append("[");
                sb112.append(i);
                sb112.append("]nexClipOf.mDrawInfos.getEffectID=");
                sb112.append(nexdrawinfo.getEffectID());
                Log.d(str112, sb112.toString());
                String str113 = TAG;
                StringBuilder sb113 = new StringBuilder();
                sb113.append("[");
                sb113.append(i);
                sb113.append("]nexClipOf.mDrawInfos.getTitle=");
                sb113.append(nexdrawinfo.getTitle());
                Log.d(str113, sb113.toString());
                String str114 = TAG;
                StringBuilder sb114 = new StringBuilder();
                sb114.append("[");
                sb114.append(i);
                sb114.append("]nexClipOf.mDrawInfos.getBrightness=");
                sb114.append(nexdrawinfo.getBrightness());
                Log.d(str114, sb114.toString());
                String str115 = TAG;
                StringBuilder sb115 = new StringBuilder();
                sb115.append("[");
                sb115.append(i);
                sb115.append("]nexClipOf.mDrawInfos.getClipID=");
                sb115.append(nexdrawinfo.getClipID());
                Log.d(str115, sb115.toString());
                String str116 = TAG;
                StringBuilder sb116 = new StringBuilder();
                sb116.append("[");
                sb116.append(i);
                sb116.append("]nexClipOf.mDrawInfos.getEndRect=");
                sb116.append(nexdrawinfo.getEndRect().toString());
                Log.d(str116, sb116.toString());
                String str117 = TAG;
                StringBuilder sb117 = new StringBuilder();
                sb117.append("[");
                sb117.append(i);
                sb117.append("]nexClipOf.mDrawInfos.getStartRect=");
                sb117.append(nexdrawinfo.getStartRect().toString());
                Log.d(str117, sb117.toString());
                String str118 = TAG;
                StringBuilder sb118 = new StringBuilder();
                sb118.append("[");
                sb118.append(i);
                sb118.append("]nexClipOf.mDrawInfos.getContrast=");
                sb118.append(nexdrawinfo.getContrast());
                Log.d(str118, sb118.toString());
                String str119 = TAG;
                StringBuilder sb119 = new StringBuilder();
                sb119.append("[");
                sb119.append(i);
                sb119.append("]nexClipOf.mDrawInfos.getSubEffectID=");
                sb119.append(nexdrawinfo.getSubEffectID());
                Log.d(str119, sb119.toString());
                String str120 = TAG;
                StringBuilder sb120 = new StringBuilder();
                sb120.append("[");
                sb120.append(i);
                sb120.append("]nexClipOf.mDrawInfos.getTranslateX=");
                sb120.append(nexdrawinfo.getUserTranslateX());
                Log.d(str120, sb120.toString());
                String str121 = TAG;
                StringBuilder sb121 = new StringBuilder();
                sb121.append("[");
                sb121.append(i);
                sb121.append("]nexClipOf.mDrawInfos.getTranslateX=");
                sb121.append(nexdrawinfo.getUserTranslateY());
                Log.d(str121, sb121.toString());
                String str122 = TAG;
                StringBuilder sb122 = new StringBuilder();
                sb122.append("[");
                sb122.append(i);
                sb122.append("]nexClipOf.mDrawInfos.getRotateState=");
                sb122.append(nexdrawinfo.getRotateState());
                Log.d(str122, sb122.toString());
                String str123 = TAG;
                StringBuilder sb123 = new StringBuilder();
                sb123.append("[");
                sb123.append(i);
                sb123.append("]nexClipOf.mDrawInfos.getUserRotateState=");
                sb123.append(nexdrawinfo.getUserRotateState());
                Log.d(str123, sb123.toString());
                String str124 = TAG;
                StringBuilder sb124 = new StringBuilder();
                sb124.append("[");
                sb124.append(i);
                sb124.append("]nexClipOf.mDrawInfos.getEndTime=");
                sb124.append(nexdrawinfo.getEndTime());
                Log.d(str124, sb124.toString());
            }
        }
    }

    static int logFromString(String str) {
        nexSaveDataFormat nexsavedataformat = (nexSaveDataFormat) new Gson().fromJson(str, nexSaveDataFormat.class);
        String str2 = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("nexSaveDataFormatVersion=");
        sb.append(nexsavedataformat.nexSaveDataFormatVersion);
        Log.d(str2, sb.toString());
        String str3 = TAG;
        StringBuilder sb2 = new StringBuilder();
        sb2.append("project.mEndingTitle=");
        sb2.append(nexsavedataformat.project.mEndingTitle);
        Log.d(str3, sb2.toString());
        String str4 = TAG;
        StringBuilder sb3 = new StringBuilder();
        sb3.append("project.mOpeningTitle=");
        sb3.append(nexsavedataformat.project.mOpeningTitle);
        Log.d(str4, sb3.toString());
        String str5 = TAG;
        StringBuilder sb4 = new StringBuilder();
        sb4.append("project.mAudioFadeInTime=");
        sb4.append(nexsavedataformat.project.mAudioFadeInTime);
        Log.d(str5, sb4.toString());
        String str6 = TAG;
        StringBuilder sb5 = new StringBuilder();
        sb5.append("project.mAudioFadeOutTime=");
        sb5.append(nexsavedataformat.project.mAudioFadeOutTime);
        Log.d(str6, sb5.toString());
        if (nexsavedataformat.project.mBackGroundMusic == null) {
            Log.d(TAG, "project.mBackGroundMusic= null");
        } else {
            Log.d(TAG, "project.mBackGroundMusic= set");
        }
        String str7 = TAG;
        StringBuilder sb6 = new StringBuilder();
        sb6.append("project.mBGMTrimEndTime=");
        sb6.append(nexsavedataformat.project.mBGMTrimEndTime);
        Log.d(str7, sb6.toString());
        String str8 = TAG;
        StringBuilder sb7 = new StringBuilder();
        sb7.append("project.mBGMTrimStartTime=");
        sb7.append(nexsavedataformat.project.mBGMTrimStartTime);
        Log.d(str8, sb7.toString());
        String str9 = TAG;
        StringBuilder sb8 = new StringBuilder();
        sb8.append("project.mBGMVolumeScale=");
        sb8.append(nexsavedataformat.project.mBGMVolumeScale);
        Log.d(str9, sb8.toString());
        String str10 = TAG;
        StringBuilder sb9 = new StringBuilder();
        sb9.append("project.mLoopBGM=");
        sb9.append(nexsavedataformat.project.mLoopBGM);
        Log.d(str10, sb9.toString());
        String str11 = TAG;
        StringBuilder sb10 = new StringBuilder();
        sb10.append("project.mManualVolCtl=");
        sb10.append(nexsavedataformat.project.mManualVolCtl);
        Log.d(str11, sb10.toString());
        String str12 = TAG;
        StringBuilder sb11 = new StringBuilder();
        sb11.append("project.mProjectVolume=");
        sb11.append(nexsavedataformat.project.mProjectVolume);
        Log.d(str12, sb11.toString());
        String str13 = TAG;
        StringBuilder sb12 = new StringBuilder();
        sb12.append("project.mStartTimeBGM=");
        sb12.append(nexsavedataformat.project.mStartTimeBGM);
        Log.d(str13, sb12.toString());
        String str14 = TAG;
        StringBuilder sb13 = new StringBuilder();
        sb13.append("project.mTemplateOverlappedTransition=");
        sb13.append(nexsavedataformat.project.mTemplateOverlappedTransition);
        Log.d(str14, sb13.toString());
        String str15 = TAG;
        StringBuilder sb14 = new StringBuilder();
        sb14.append("project.mUseThemeMusic2BGM=");
        sb14.append(nexsavedataformat.project.mUseThemeMusic2BGM);
        Log.d(str15, sb14.toString());
        if (nexsavedataformat.project.mPrimaryItems == null) {
            Log.d(TAG, "project.mPrimaryItems=null");
        } else {
            int i = 1;
            for (nexClipOf logClipOf : nexsavedataformat.project.mPrimaryItems) {
                logClipOf(i, logClipOf);
                i++;
            }
        }
        return 0;
    }

    public int add(int i, boolean z, nexClip nexclip) {
        if (!nexclip.getAttachmentState()) {
            updateTimeLine(false);
            nexclip.setAttachmentState(true, this);
            if (z) {
                if (this.mEmptyTheme) {
                    nexclip.isFaceDetectProcessed();
                    nexclip.getClipEffect(true).setEffectNone();
                    nexclip.getTransitionEffect(true).setEffectNone();
                    nexclip.getTransitionEffect(true).setDuration(0);
                }
                this.mPrimaryItems.add(i, nexclip);
            } else {
                addAudio(nexclip, i, nexclip.getTotalTime() + i);
            }
            return 0;
        }
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("[");
        sb.append(this.mId);
        sb.append("] add() ProjectAlreadyAttachedException index=");
        sb.append(i);
        Log.e(str, sb.toString());
        throw new ProjectAlreadyAttachedException();
    }

    public int add(nexClip nexclip) {
        int isPrimaryItem = isPrimaryItem(nexclip);
        return isPrimaryItem < 0 ? isPrimaryItem : isPrimaryItem == 1 ? add(this.mPrimaryItems.size(), true, nexclip) : add(this.mSecondaryItems.size(), false, nexclip);
    }

    public int addAudio(nexClip nexclip, int i, int i2) {
        if (!checkAudioTime(i, i2)) {
            return -1;
        }
        nexclip.setAttachmentState(true, this);
        nexAudioItem nexaudioitem = new nexAudioItem(nexclip, i, i2);
        int id = nexaudioitem.getId();
        this.mSecondaryItems.add(nexaudioitem);
        Collections.sort(this.mSecondaryItems, new a());
        this.mNeedLoadList = true;
        return id;
    }

    public boolean addOverlay(nexOverlayItem nexoverlayitem) {
        if (nexoverlayitem.getId() == 0) {
            return false;
        }
        this.mOverlayItems.add(nexoverlayitem);
        Collections.sort(this.mOverlayItems, new b());
        return true;
    }

    /* access modifiers changed from: 0000 */
    public int adjustmentEffectTime(int i, int i2, int i3, int i4) {
        nexClip clip = getClip(i2, true);
        int projectEndTime = clip.getProjectEndTime() - ((clip.getTransitionEffect().getDuration() * clip.getTransitionEffect().getOffset()) / 100);
        int duration = clip.getTransitionEffect().getDuration() + projectEndTime;
        int projectStartTime = getClip(i, true).getProjectStartTime();
        int projectEndTime2 = getClip(i2, true).getProjectEndTime();
        for (int i5 = 0; i5 < getTotalClipCount(false); i5++) {
            nexClip clip2 = getClip(i5, false);
            if (clip2.getTemplateEffectID() == (-251658241 & i4) && projectStartTime <= clip2.getProjectStartTime() && projectEndTime2 > clip2.getProjectStartTime()) {
                remove(clip2);
                int templateAudioPos = (((projectEndTime - i3) * clip2.getTemplateAudioPos()) / 100) + i3;
                addAudio(clip2, templateAudioPos, clip2.getTotalTime() + templateAudioPos);
            }
        }
        while (i <= i2) {
            nexClip clip3 = getClip(i, true);
            clip3.mTitleEffectStartTime = i3;
            clip3.mTitleEffectEndTime = projectEndTime;
            clip3.getClipEffect().setEffectShowTime(0, 0);
            i++;
        }
        return duration;
    }

    public void allClear(boolean z) {
        if (z) {
            int size = this.mPrimaryItems.size();
            for (int i = 0; i < size; i++) {
                ((nexClip) this.mPrimaryItems.get(i)).setAttachmentState(false, null);
            }
            this.mPrimaryItems.clear();
        } else {
            int size2 = this.mSecondaryItems.size();
            for (int i2 = 0; i2 < size2; i2++) {
                ((nexAudioItem) this.mSecondaryItems.get(i2)).mClip.setAttachmentState(false, null);
            }
            this.mSecondaryItems.clear();
        }
        this.mClipTimeUpdated = false;
        this.mTopEffectInfo.clear();
        this.mSubEffectInfo.clear();
    }

    public int changeAudio(nexAudioItem nexaudioitem, int i, int i2) {
        remove(nexaudioitem.getClip());
        if (!checkAudioTime(i, i2)) {
            this.mSecondaryItems.add(nexaudioitem);
            nexaudioitem.getClip().setAttachmentState(true, this);
            Collections.sort(this.mSecondaryItems, new a());
            return -1;
        }
        nexaudioitem.setProjectTime(i, i2);
        this.mSecondaryItems.add(nexaudioitem);
        nexaudioitem.getClip().setAttachmentState(true, this);
        Collections.sort(this.mSecondaryItems, new a());
        this.mNeedLoadList = true;
        return 0;
    }

    /* access modifiers changed from: protected */
    public void clearDrawInfo() {
        if (this.mTopEffectInfo != null) {
            this.mTopEffectInfo.clear();
        }
        if (this.mSubEffectInfo != null) {
            this.mSubEffectInfo.clear();
        }
        for (nexClip drawInfos : this.mPrimaryItems) {
            drawInfos.getDrawInfos().clear();
        }
    }

    public void clearFaceDetectInfo() {
        int size = this.mPrimaryItems.size();
        for (int i = 0; i < size; i++) {
            nexClip nexclip = (nexClip) this.mPrimaryItems.get(i);
            if (nexclip.getClipType() == 1) {
                nexclip.resetFaceDetectProcessed();
            }
        }
    }

    public void clearOverlay() {
        this.mOverlayItems.clear();
    }

    public nexAudioItem findAudioItem(int i) {
        for (nexAudioItem nexaudioitem : this.mSecondaryItems) {
            if (nexaudioitem.getId() == i) {
                return nexaudioitem;
            }
        }
        return null;
    }

    public nexAudioItem getAudioItem(int i) {
        return (nexAudioItem) this.mSecondaryItems.get(i);
    }

    public List<nexAudioItem> getAudioItems() {
        if (this.m_externalView_secondaryItems == null) {
            this.m_externalView_secondaryItems = Collections.unmodifiableList(this.mSecondaryItems);
        }
        return this.m_externalView_secondaryItems;
    }

    public float getBGMMasterVolumeScale() {
        return this.mBGMVolumeScale;
    }

    public nexClip getBackgroundMusic() {
        return this.mBackGroundMusic;
    }

    public String getBackgroundMusicPath() {
        if (this.mBackGroundMusic != null) {
            return this.mBackGroundMusic.getPath();
        }
        return null;
    }

    public nexClip getClip(int i, boolean z) {
        return z ? (nexClip) this.mPrimaryItems.get(i) : ((nexAudioItem) this.mSecondaryItems.get(i)).mClip;
    }

    public int[] getClipDurationTimeGuideLine(int i) {
        int clipTimeGuideLine = getClipTimeGuideLine(i);
        int i2 = 10000;
        if (((nexClip) this.mPrimaryItems.get(i)).getClipType() == 4) {
            i2 = ((nexClip) this.mPrimaryItems.get(i)).getProjectDuration();
            if (clipTimeGuideLine > i2) {
                return new int[]{0, 0};
            }
        } else if (clipTimeGuideLine > 10000) {
            return new int[]{clipTimeGuideLine, clipTimeGuideLine + 1000};
        }
        return new int[]{clipTimeGuideLine, i2};
    }

    public int getClipMaxSpeedControlList(int i) {
        int i2 = 0;
        if (((nexClip) this.mPrimaryItems.get(i)).getClipType() != 4) {
            return 0;
        }
        int totalTime = ((nexClip) this.mPrimaryItems.get(i)).getTotalTime();
        if (!(((nexClip) this.mPrimaryItems.get(i)).getVideoClipEdit().mTrimStartDuration == 0 && ((nexClip) this.mPrimaryItems.get(i)).getVideoClipEdit().mTrimEndDuration == 0)) {
            totalTime = (((nexClip) this.mPrimaryItems.get(i)).getTotalTime() - ((nexClip) this.mPrimaryItems.get(i)).getVideoClipEdit().mTrimStartDuration) - ((nexClip) this.mPrimaryItems.get(i)).getVideoClipEdit().mTrimEndDuration;
        }
        int i3 = i - 1;
        int i4 = i + 1;
        int projectEndTime = (i3 >= 0 ? ((nexClip) this.mPrimaryItems.get(i3)).getProjectEndTime() - ((nexClip) this.mPrimaryItems.get(i)).getProjectStartTime() : 0) + (i4 < this.mPrimaryItems.size() ? ((nexClip) this.mPrimaryItems.get(i)).getProjectEndTime() - ((nexClip) this.mPrimaryItems.get(i4)).getProjectStartTime() : 0) + 500;
        int[] iArr = {13, 25, 50, 75, 100, BaiduSceneResult.TRAVEL_OTHER, 150, 175, 200, 400};
        int i5 = 0;
        while (i2 < iArr.length && projectEndTime <= Math.round((float) ((totalTime * 100) / iArr[i2]))) {
            i5 = iArr[i2];
            i2++;
        }
        return i5;
    }

    public int getClipPosition(int i) {
        for (int i2 = 0; i2 < getTotalClipCount(true); i2++) {
            if (((nexClip) this.mPrimaryItems.get(i2)).getProjectStartTime() <= i && i < ((nexClip) this.mPrimaryItems.get(i2)).getProjectEndTime()) {
                return i2;
            }
        }
        return -1;
    }

    public int[] getClipPositionTime(int i) {
        updateProject();
        return new int[]{((nexClip) this.mPrimaryItems.get(i)).getProjectStartTime(), ((nexClip) this.mPrimaryItems.get(i)).getProjectEndTime()};
    }

    public String getEndingTitle() {
        return this.mEndingTitle;
    }

    /* access modifiers changed from: 0000 */
    public int getId() {
        return this.mId;
    }

    /* access modifiers changed from: 0000 */
    public int getLastClipIndexWithEffectID(int i, int i2) {
        if ((i2 & nexEngine.ExportHEVCMainTierLevel62) == 16777216) {
            return i;
        }
        while (i < getTotalClipCount(true)) {
            if ((getClip(i, true).getTemplateEffectID() & -251658241) != i2) {
                return i - 1;
            }
            i++;
        }
        return getTotalClipCount(true) - 1;
    }

    public nexClip getLastPrimaryClip() {
        return (nexClip) this.mPrimaryItems.get(this.mPrimaryItems.size() - 1);
    }

    public String getLetterboxEffect() {
        return this.mLetterbox;
    }

    public int getManualVolumeControl() {
        return this.mManualVolCtl;
    }

    public nexClip getNextClip(nexClip nexclip) {
        int indexOf = this.mPrimaryItems.indexOf(nexclip);
        if (indexOf == this.mPrimaryItems.size() || indexOf == -1) {
            return null;
        }
        return (nexClip) this.mPrimaryItems.get(indexOf);
    }

    public String getOpeningTitle() {
        return this.mOpeningTitle;
    }

    public nexOverlayItem getOverlay(int i) {
        for (nexOverlayItem nexoverlayitem : this.mOverlayItems) {
            if (nexoverlayitem.getId() == i) {
                return nexoverlayitem;
            }
        }
        return null;
    }

    public List<nexOverlayItem> getOverlayItems() {
        if (this.m_externalView_overlayItems == null) {
            this.m_externalView_overlayItems = Collections.unmodifiableList(this.mOverlayItems);
        }
        return this.m_externalView_overlayItems;
    }

    public List<nexClip> getPrimaryItems() {
        if (this.m_externalView_primaryItems == null) {
            this.m_externalView_primaryItems = Collections.unmodifiableList(this.mPrimaryItems);
        }
        return this.m_externalView_primaryItems;
    }

    public int getProjectAudioFadeInTime() {
        return this.mAudioFadeInTime;
    }

    public int getProjectAudioFadeOutTime() {
        return this.mAudioFadeOutTime;
    }

    public int getProjectTime2ClipTimePosition(int i, int i2) {
        int i3 = -1;
        if (i < 0 || i >= this.mPrimaryItems.size()) {
            return -1;
        }
        int projectStartTime = ((nexClip) this.mPrimaryItems.get(i)).getProjectStartTime();
        int projectEndTime = ((nexClip) this.mPrimaryItems.get(i)).getProjectEndTime();
        if (projectStartTime <= i2 && i2 < projectEndTime) {
            i3 = i2 - projectStartTime;
            if (((nexClip) this.mPrimaryItems.get(i)).getClipType() == 4) {
                int startTrimTime = ((nexClip) this.mPrimaryItems.get(i)).getVideoClipEdit().getStartTrimTime();
                int speedControl = ((nexClip) this.mPrimaryItems.get(i)).getVideoClipEdit().getSpeedControl();
                if (speedControl != 100) {
                    if (speedControl == 12) {
                        speedControl = 25;
                        i3 /= 2;
                    }
                    i3 = Math.round((float) ((i3 * speedControl) / 100));
                }
                i3 += startTrimTime;
            }
        }
        return i3;
    }

    public int getProjectVolume() {
        return this.mProjectVolume;
    }

    /* access modifiers changed from: 0000 */
    public nexProjectOf getSaveData() {
        nexProjectOf nexprojectof = new nexProjectOf();
        nexprojectof.mProjectVolume = this.mProjectVolume;
        nexprojectof.mManualVolCtl = this.mManualVolCtl;
        nexprojectof.mAudioFadeInTime = this.mAudioFadeInTime;
        nexprojectof.mAudioFadeOutTime = this.mAudioFadeOutTime;
        nexprojectof.mOpeningTitle = this.mOpeningTitle;
        nexprojectof.mEndingTitle = this.mEndingTitle;
        nexprojectof.mBGMVolumeScale = this.mBGMVolumeScale;
        nexprojectof.mUseThemeMusic2BGM = this.mUseThemeMusic2BGM;
        nexprojectof.mLoopBGM = this.mLoopBGM;
        nexprojectof.mStartTimeBGM = this.mStartTimeBGM;
        if (this.mBackGroundMusic == null) {
            nexprojectof.mBackGroundMusic = null;
        } else {
            nexprojectof.mBackGroundMusic = this.mBackGroundMusic.getSaveData();
        }
        nexprojectof.mBGMTrimStartTime = this.mBGMTrimStartTime;
        nexprojectof.mBGMTrimEndTime = this.mBGMTrimEndTime;
        nexprojectof.mTemplateApplyMode = this.mTemplateApplyMode;
        nexprojectof.mTemplateOverlappedTransition = this.mTemplateOverlappedTransition;
        if (this.mPrimaryItems.size() == 0) {
            nexprojectof.mPrimaryItems = null;
        } else {
            nexprojectof.mPrimaryItems = new ArrayList();
            for (nexClip nexclip : this.mPrimaryItems) {
                if (!nexclip.isMotionTrackedVideo()) {
                    nexprojectof.mPrimaryItems.add(nexclip.getSaveData());
                }
            }
        }
        if (this.mSecondaryItems.size() == 0) {
            nexprojectof.mSecondaryItems = null;
        } else {
            nexprojectof.mSecondaryItems = new ArrayList();
            for (nexAudioItem saveData : this.mSecondaryItems) {
                nexprojectof.mSecondaryItems.add(saveData.getSaveData());
            }
        }
        if (this.mTopEffectInfo.size() == 0) {
            nexprojectof.mTopEffectInfo = null;
        } else {
            nexprojectof.mTopEffectInfo = this.mTopEffectInfo;
        }
        if (this.mSubEffectInfo.size() == 0) {
            nexprojectof.mSubEffectInfo = null;
        } else {
            nexprojectof.mSubEffectInfo = this.mSubEffectInfo;
        }
        return nexprojectof;
    }

    @Deprecated
    public List<nexClip> getSecondaryItems() {
        return null;
    }

    public boolean getTemplageOverlappedTransitionMode() {
        return this.mTemplateOverlappedTransition;
    }

    public int getTemplateApplyMode() {
        return this.mTemplateApplyMode;
    }

    public String getThemeId() {
        return this.mThemeId;
    }

    public List<nexDrawInfo> getTopDrawInfo() {
        return this.mTopEffectInfo;
    }

    public int getTotalClipCount(boolean z) {
        return z ? this.mPrimaryItems.size() : this.mSecondaryItems.size();
    }

    public int getTotalTime() {
        if (this.mTemplateApplyMode == 3) {
            int i = 0;
            for (int i2 = 0; i2 < this.mPrimaryItems.size(); i2++) {
                nexClip nexclip = (nexClip) this.mPrimaryItems.get(i2);
                if (i < nexclip.mEndTime) {
                    i = nexclip.mEndTime;
                }
            }
            return i;
        }
        int size = this.mPrimaryItems.size();
        if (size == 0) {
            return 0;
        }
        updateProject();
        return ((nexClip) this.mPrimaryItems.get(size - 1)).mEndTime;
    }

    @Deprecated
    public int getTotalVisualClipCount() {
        int size = this.mPrimaryItems.size();
        int i = 0;
        for (int i2 = 0; i2 < size; i2++) {
            nexClip nexclip = (nexClip) this.mPrimaryItems.get(i2);
            if (nexclip.getClipType() == 4) {
                int trimCount = nexclip.getVideoClipEdit().getTrimCount();
                if (trimCount == 0) {
                    trimCount = 1;
                }
                i += trimCount;
            } else if (nexclip.getClipType() == 1) {
                i++;
            }
        }
        return i;
    }

    public int[] getTransitionDurationTimeGuideLine(int i, int i2) {
        int transitionTimeGuideLine = getTransitionTimeGuideLine(i, i2);
        if (500 > transitionTimeGuideLine) {
            return new int[]{0, 0};
        }
        return new int[]{500, transitionTimeGuideLine};
    }

    public int indexOf(nexClip nexclip) {
        return this.mPrimaryItems.indexOf(nexclip);
    }

    @Deprecated
    public Intent makeKineMasterIntent() {
        updateProject();
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("[");
        sb.append(this.mId);
        sb.append("] make intent start");
        Log.d(str, sb.toString());
        com.nexstreaming.kminternal.kinemaster.editorwrapper.a aVar = new com.nexstreaming.kminternal.kinemaster.editorwrapper.a();
        for (nexClip nexclip : this.mPrimaryItems) {
            Rect rect = new Rect();
            Rect rect2 = new Rect();
            nexclip.getCrop().getStartPositionRaw(rect);
            nexclip.getCrop().getEndPositionRaw(rect2);
            int clipType = nexclip.getClipType();
            if (clipType != 1) {
                if (clipType == 4) {
                    ((g) ((g) ((g) ((g) ((g) ((g) ((g) ((g) ((g) ((g) ((g) aVar.a().a(nexclip.getPath()).e(nexclip.getVideoClipEdit().getDuration())).a((float) rect.left, (float) rect.top, (float) rect.right, (float) rect.bottom, (float) rect2.left, (float) rect2.top, (float) rect2.right, (float) rect2.bottom).c(nexclip.getVideoClipEdit().getSpeedControl()).a(nexclip.getVideoClipEdit().getStartTrimTime()).d(nexclip.getRotateDegree()).a(!nexclip.getAudioOnOff())).g(nexclip.getClipVolume())).h(nexclip.getBrightness())).i(nexclip.getContrast())).j(nexclip.getSaturation())).d(nexclip.getColorEffectID())).b(nexclip.getClipEffect(true).getId())).c(nexclip.getTransitionEffect(true).getId())).f(nexclip.getTransitionEffect(true).getDuration())).b(nexclip.getVignetteEffect())).a();
                }
            } else if (nexclip.isSolid()) {
                ((e) ((e) ((e) ((e) ((e) ((e) ((e) ((e) ((e) ((e) aVar.c().a(nexclip.getSolidColor()).e(nexclip.getImageClipDuration())).h(nexclip.getBrightness())).d(nexclip.getRotateDegree())).i(nexclip.getContrast())).j(nexclip.getSaturation())).d(nexclip.getColorEffectID())).b(nexclip.getClipEffect(true).getId())).c(nexclip.getTransitionEffect(true).getId())).f(nexclip.getTransitionEffect(true).getDuration())).b(nexclip.getVignetteEffect())).a();
            } else {
                ((com.nexstreaming.kminternal.kinemaster.editorwrapper.a.b) ((com.nexstreaming.kminternal.kinemaster.editorwrapper.a.b) ((com.nexstreaming.kminternal.kinemaster.editorwrapper.a.b) ((com.nexstreaming.kminternal.kinemaster.editorwrapper.a.b) ((com.nexstreaming.kminternal.kinemaster.editorwrapper.a.b) ((com.nexstreaming.kminternal.kinemaster.editorwrapper.a.b) ((com.nexstreaming.kminternal.kinemaster.editorwrapper.a.b) ((com.nexstreaming.kminternal.kinemaster.editorwrapper.a.b) ((com.nexstreaming.kminternal.kinemaster.editorwrapper.a.b) ((com.nexstreaming.kminternal.kinemaster.editorwrapper.a.b) aVar.b().a(nexclip.getPath()).a((float) rect.left, (float) rect.top, (float) rect.right, (float) rect.bottom, (float) rect2.left, (float) rect2.top, (float) rect2.right, (float) rect2.bottom).e(nexclip.getImageClipDuration())).h(nexclip.getBrightness())).d(nexclip.getRotateDegree())).i(nexclip.getContrast())).j(nexclip.getSaturation())).d(nexclip.getColorEffectID())).b(nexclip.getClipEffect(true).getId())).c(nexclip.getTransitionEffect(true).getId())).f(nexclip.getTransitionEffect(true).getDuration())).b(nexclip.getVignetteEffect())).a();
            }
        }
        for (nexAudioItem nexaudioitem : this.mSecondaryItems) {
            aVar.d().a(nexaudioitem.getClip().getPath()).c(nexaudioitem.getStartTime()).d(nexaudioitem.getEndTime()).b(false).a(false).a(nexaudioitem.getStartTrimTime()).b(nexaudioitem.getEndTrimTime()).c(!nexaudioitem.getClip().getAudioOnOff()).e(nexaudioitem.getClip().getClipVolume()).a();
        }
        if (this.mBackGroundMusic != null) {
            aVar.d().a(this.mBackGroundMusic.getPath()).c(this.mStartTimeBGM).d(getTotalTime()).b(true).a(this.mLoopBGM).a(this.mBGMTrimStartTime).b(this.mBGMTrimEndTime).e((int) (getBGMMasterVolumeScale() * 200.0f)).a();
        }
        for (nexOverlayItem nexoverlayitem : this.mOverlayItems) {
            if (nexoverlayitem.getOverlayImage() instanceof nexOverlayKineMasterText) {
                nexOverlayKineMasterText nexoverlaykinemastertext = (nexOverlayKineMasterText) nexoverlayitem.getOverlayImage();
                ((f) ((f) ((f) ((f) ((f) ((f) ((f) ((f) aVar.e().d(nexoverlaykinemastertext.getText()).a(nexoverlaykinemastertext.getTextSize()).e(nexoverlaykinemastertext.getTextColor()).g(nexoverlaykinemastertext.getGlowColor(false)).h(nexoverlaykinemastertext.getOutlineColor(false)).f(nexoverlaykinemastertext.getShadowColor(false)).e(nexoverlaykinemastertext.getFontId()).a(nexoverlayitem.getStartTime())).b(nexoverlayitem.getEndTime())).a().a(0.0f).a((float) ((nexoverlayitem.getPositionX() * 1280) / nexApplicationConfig.getAspectProfile().getWidth()), (float) ((nexoverlayitem.getPositionY() * 720) / nexApplicationConfig.getAspectProfile().getHeight())).c(nexoverlayitem.getAlpha()).b((float) nexoverlayitem.getRotate()).d(nexoverlayitem.getScaledX()).a()).a(nexoverlayitem.getLayerExpression().getNames(0))).c(nexoverlayitem.getLayerExpressionDuration())).b(nexoverlayitem.getLayerExpression().getNames(1))).d(nexoverlayitem.getLayerExpressionDuration())).c(nexoverlayitem.getLayerExpression().getNames(2))).b();
            }
        }
        return aVar.f();
    }

    public void move(int i, nexClip nexclip) {
        int indexOf = this.mPrimaryItems.indexOf(nexclip);
        if (indexOf >= 0 && i != indexOf && this.mPrimaryItems.remove(nexclip)) {
            updateTimeLine(false);
            this.mPrimaryItems.add(i, nexclip);
        }
    }

    public int remove(nexClip nexclip) {
        int isPrimaryItem = isPrimaryItem(nexclip);
        if (isPrimaryItem < 0) {
            return isPrimaryItem;
        }
        if (isPrimaryItem == 1) {
            this.mPrimaryItems.remove(nexclip);
        } else {
            int i = 0;
            while (true) {
                if (i >= this.mSecondaryItems.size()) {
                    break;
                } else if (((nexAudioItem) this.mSecondaryItems.get(i)).mClip == nexclip) {
                    this.mSecondaryItems.remove(i);
                    break;
                } else {
                    i++;
                }
            }
        }
        nexclip.setAttachmentState(false, null);
        updateTimeLine(false);
        return 0;
    }

    public boolean removeOverlay(int i) {
        for (nexOverlayItem nexoverlayitem : this.mOverlayItems) {
            if (nexoverlayitem.getId() == i) {
                this.mOverlayItems.remove(nexoverlayitem);
                return true;
            }
        }
        return false;
    }

    public String saveToString() {
        Gson gson = new Gson();
        nexSaveDataFormat nexsavedataformat = new nexSaveDataFormat();
        nexsavedataformat.project = getSaveData();
        return gson.toJson((Object) nexsavedataformat);
    }

    public void setBGMMasterVolumeScale(float f) {
        if (f < 0.0f) {
            this.mBGMVolumeScale = 0.0f;
        } else if (f > 1.0f) {
            this.mBGMVolumeScale = 1.0f;
        } else {
            this.mBGMVolumeScale = f;
        }
        this.mNeedLoadList = true;
    }

    public void setBackgroundConfig(int i, boolean z, boolean z2) {
        this.mUseThemeMusic2BGM = z;
        this.mLoopBGM = z2;
        this.mStartTimeBGM = i;
        this.mNeedLoadList = true;
    }

    public boolean setBackgroundMusicPath(String str) {
        if (str == null) {
            if (this.mBackGroundMusic != null) {
                this.mNeedLoadList = true;
            }
            this.mBackGroundMusic = null;
            return true;
        }
        nexClip supportedClip = nexClip.getSupportedClip(str);
        if (supportedClip == null || supportedClip.getClipType() != 3) {
            return false;
        }
        this.mBackGroundMusic = supportedClip;
        this.mNeedLoadList = true;
        return true;
    }

    public void setBackgroundTrim(int i, int i2) {
        this.mBGMTrimStartTime = i;
        this.mBGMTrimEndTime = i2;
        this.mNeedLoadList = true;
    }

    public void setLetterboxEffect(String str) {
        this.mLetterbox = str;
    }

    public void setManualVolumeControl(int i) {
        this.mManualVolCtl = i;
    }

    public void setProjectAudioFadeInTime(int i) {
        this.mAudioFadeInTime = i;
        this.mNeedLoadList = true;
    }

    public void setProjectAudioFadeOutTime(int i) {
        this.mAudioFadeOutTime = i;
        this.mNeedLoadList = true;
    }

    public void setProjectVolume(int i) {
        this.mProjectVolume = i;
    }

    public void setTemplageOverlappedTransitionMode(boolean z) {
        this.mTemplateOverlappedTransition = z;
    }

    public void setTemplateApplyMode(int i) {
        this.mTemplateApplyMode = i;
    }

    @Deprecated
    public void setThemeId(String str) {
        this.mEmptyTheme = true;
        this.mThemeId = null;
    }

    public void setTitle(String str, String str2) {
        this.mOpeningTitle = str;
        this.mEndingTitle = str2;
        updateTimeLine(false);
        this.mNeedLoadList = true;
    }

    public void swap(nexClip nexclip, nexClip nexclip2) {
        int indexOf = this.mPrimaryItems.indexOf(nexclip);
        int indexOf2 = this.mPrimaryItems.indexOf(nexclip2);
        if (indexOf >= 0 && indexOf2 >= 0) {
            Collections.swap(this.mPrimaryItems, indexOf, indexOf2);
        }
    }

    public boolean updateProject() {
        int i;
        int i2;
        int totalClipCount = getTotalClipCount(true);
        int i3 = 0;
        if (!this.mClipTimeUpdated) {
            return false;
        }
        this.mClipTimeUpdated = false;
        if (totalClipCount == 0) {
            return false;
        }
        if (getTemplateApplyMode() == 3) {
            return true;
        }
        int i4 = 0;
        int i5 = 0;
        int i6 = 0;
        for (int i7 = 0; i7 < totalClipCount; i7++) {
            nexClip clip = getClip(i7, true);
            clip.mStartTime = i4;
            int clipType = clip.getClipType();
            if (clipType == 1) {
                i5 = clip.getImageClipDuration();
            } else if (clipType == 4) {
                i5 = !clip.getTemplateOverlappedTransition() ? clip.getVideoClipEdit().getDuration() + clip.getTransitionEffect().getDuration() : clip.getVideoClipEdit().getDuration();
            }
            int i8 = i4 + i5;
            int duration = (clip.getTransitionEffect(true).getType() == 0 || clip.getTransitionEffect(true).getOverlap() == 0) ? 0 : (clip.getTransitionEffect(true).getDuration() * 100) / clip.getTransitionEffect(true).getOverlap();
            if (getTemplateApplyMode() == 2) {
                clip.mTitleEffectStartTime = clip.getClipEffect().getShowStartTime();
                clip.mTitleEffectEndTime = clip.getClipEffect().getShowEndTime();
                i2 = i8 - duration;
                i = clip.getTransitionEffect(true).getDuration();
            } else {
                clip.mTitleEffectStartTime = i6;
                i2 = i8 - duration;
                clip.mTitleEffectEndTime = i2;
                i = clip.getTransitionEffect(true).getDuration();
            }
            i6 = i2 + i;
            clip.mEndTime = i8;
            i4 = i8 - duration;
        }
        if (getTemplateApplyMode() == 2) {
            int i9 = 0;
            while (i3 < totalClipCount) {
                nexClip clip2 = getClip(i3, true);
                if (clip2 == null) {
                    i3++;
                } else {
                    int lastClipIndexWithEffectID = getLastClipIndexWithEffectID(i3, clip2.getTemplateEffectID());
                    i9 = adjustmentEffectTime(i3, lastClipIndexWithEffectID, i9, clip2.getTemplateEffectID());
                    i3 = lastClipIndexWithEffectID + 1;
                }
            }
        }
        return true;
    }
}
