package com.miui.gallery.video.editor;

import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.media.MediaCodecInfo;
import android.media.MediaCodecInfo.VideoCapabilities;
import android.media.MediaCodecList;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Build;
import android.os.Build.VERSION;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import android.view.View;
import com.miui.gallery.assistant.jni.filter.BaiduSceneResult;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.UriUtils;
import com.miui.gallery.video.editor.VideoEditor.EnocdeStateInterface;
import com.miui.gallery.video.editor.VideoEditor.NotSupportVideoException;
import com.miui.gallery.video.editor.VideoEditor.OnCompletedListener;
import com.miui.gallery.video.editor.VideoEditor.OnGetVideoThumbnailListener;
import com.miui.gallery.video.editor.VideoEditor.TrimStateInterface;
import com.miui.gallery.video.editor.manager.NexAssetTemplateManager;
import com.miui.gallery.video.editor.util.FileHelper;
import com.miui.gallery.video.editor.util.IntentUtil;
import com.nexstreaming.nexeditorsdk.exception.ExpiredTimeException;
import com.nexstreaming.nexeditorsdk.nexAnimate;
import com.nexstreaming.nexeditorsdk.nexApplicationConfig;
import com.nexstreaming.nexeditorsdk.nexAspectProfile;
import com.nexstreaming.nexeditorsdk.nexClip;
import com.nexstreaming.nexeditorsdk.nexColorEffect;
import com.nexstreaming.nexeditorsdk.nexCrop.CropMode;
import com.nexstreaming.nexeditorsdk.nexEngine;
import com.nexstreaming.nexeditorsdk.nexEngine.FastPreviewOption;
import com.nexstreaming.nexeditorsdk.nexEngine.OnAutoTrimResultListener;
import com.nexstreaming.nexeditorsdk.nexEngine.OnCompletionListener;
import com.nexstreaming.nexeditorsdk.nexEngineListener;
import com.nexstreaming.nexeditorsdk.nexEngineView;
import com.nexstreaming.nexeditorsdk.nexOverlayImage;
import com.nexstreaming.nexeditorsdk.nexOverlayItem;
import com.nexstreaming.nexeditorsdk.nexOverlayKineMasterText;
import com.nexstreaming.nexeditorsdk.nexOverlayPreset;
import com.nexstreaming.nexeditorsdk.nexProject;
import com.nexstreaming.nexeditorsdk.nexTemplateManager.Template;
import com.nostra13.universalimageloader.core.ImageLoader;
import com.nostra13.universalimageloader.core.assist.FailReason;
import com.nostra13.universalimageloader.core.download.ImageDownloader.Scheme;
import com.nostra13.universalimageloader.core.listener.ImageLoadingListener;
import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map.Entry;

public class NexVideoEditor extends VideoEditor implements nexEngineListener {
    private static final String[] sWhiteList = {"riva", "pine", "cereus"};
    /* access modifiers changed from: private */
    public HashMap<String, Change> mApplyedEditValue = new HashMap<>();
    /* access modifiers changed from: private */
    public nexProject mCloneProject;
    /* access modifiers changed from: private */
    public Context mContext;
    private EnocdeStateInterface mCurrentEnocdeStateInterface;
    /* access modifiers changed from: private */
    public TextClip mEndClip;
    /* access modifiers changed from: private */
    public nexEngine mEngin;
    private int mEngineState = -1;
    /* access modifiers changed from: private */
    public Handler mHandler = new Handler(Looper.getMainLooper());
    /* access modifiers changed from: private */
    public boolean mHasApplyedSmartEffect = false;
    /* access modifiers changed from: private */
    public boolean mHasUsingAutoTrim = false;
    /* access modifiers changed from: private */
    public boolean mIsDestroy;
    /* access modifiers changed from: private */
    public nexClip mMainVideoClip;
    /* access modifiers changed from: private */
    public nexProject mNexProject;
    /* access modifiers changed from: private */
    public TextClip mOpenClip;
    private OnCompletedListener mPauseOnCompletedListener;
    /* access modifiers changed from: private */
    public float mRatio;
    private HashMap<String, Change> mSavedEditValue = new HashMap<>();
    private int mSeekTarget = -1;
    /* access modifiers changed from: private */
    public HashMap<String, Change> mTempEditValue = new HashMap<>();
    private int mThumbnailPickCursor = 0;
    /* access modifiers changed from: private */
    public TrimStateInterface mTrimStateInterface;
    private int mVideoBitrate;
    private int mVideoFrames;
    /* access modifiers changed from: private */
    public int mVideoHeight;
    private String mVideoPath;
    /* access modifiers changed from: private */
    public int mVideoRotation;
    /* access modifiers changed from: private */
    public int mVideoWidth;
    /* access modifiers changed from: private */
    public List<VideoThumbnail> preLoadVideoThumbnails = new ArrayList();
    private OnCompletedListener seekOnCompletedListener;
    private boolean setTimeSuccess = false;

    /* renamed from: com.miui.gallery.video.editor.NexVideoEditor$18 reason: invalid class name */
    static /* synthetic */ class AnonymousClass18 {
        static final /* synthetic */ int[] $SwitchMap$com$nostra13$universalimageloader$core$download$ImageDownloader$Scheme = new int[Scheme.values().length];

        static {
            try {
                $SwitchMap$com$nostra13$universalimageloader$core$download$ImageDownloader$Scheme[Scheme.FILE.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
        }
    }

    private class ApplyTask extends AsyncTask<Change, Void, Boolean> {
        private OnCompletedListener mOnCompletedListener;

        public ApplyTask(OnCompletedListener onCompletedListener) {
            this.mOnCompletedListener = onCompletedListener;
        }

        /* access modifiers changed from: protected */
        public Boolean doInBackground(Change... changeArr) {
            if (changeArr != null) {
                for (Change applyChange : changeArr) {
                    applyChange.applyChange();
                }
            }
            NexVideoEditor.this.mEngin.updateProject();
            return Boolean.valueOf(true);
        }

        /* access modifiers changed from: protected */
        public void onPostExecute(Boolean bool) {
            super.onPostExecute(bool);
            NexVideoEditor.this.mTempEditValue.clear();
            NexVideoEditor.this.setEngineState(0);
            if (this.mOnCompletedListener != null) {
                this.mOnCompletedListener.onCompleted();
                this.mOnCompletedListener = null;
            }
        }
    }

    private class BGMEdit implements Change {
        /* access modifiers changed from: private */
        public String mBGMUri;

        public BGMEdit(String str) {
            this.mBGMUri = str;
        }

        public void applyChange() {
            if (TextUtils.isEmpty(this.mBGMUri)) {
                if (!NexVideoEditor.this.mHasApplyedSmartEffect || NexVideoEditor.this.mCloneProject == null) {
                    NexVideoEditor.this.mNexProject.setBackgroundMusicPath(this.mBGMUri);
                } else {
                    SmartEffectTemplate smartEffectTemplate = (SmartEffectTemplate) NexVideoEditor.this.mApplyedEditValue.get("edit_type_smart_effect_template");
                    if (smartEffectTemplate != null) {
                        smartEffectTemplate.applyChange();
                    }
                }
                NexVideoEditor.this.mApplyedEditValue.remove("bg_audio");
                return;
            }
            String crop = AnonymousClass18.$SwitchMap$com$nostra13$universalimageloader$core$download$ImageDownloader$Scheme[Scheme.ofUri(this.mBGMUri).ordinal()] != 1 ? this.mBGMUri : Scheme.FILE.crop(this.mBGMUri);
            if (!NexVideoEditor.this.mHasApplyedSmartEffect || NexVideoEditor.this.mCloneProject == null) {
                NexVideoEditor.this.mNexProject.setBackgroundMusicPath(crop);
            } else {
                NexVideoEditor.this.mCloneProject.setBackgroundMusicPath(crop);
            }
            NexVideoEditor.this.mApplyedEditValue.put("bg_audio", this);
            if (!new File(this.mBGMUri).exists()) {
                HashMap hashMap = new HashMap();
                hashMap.put("manufacturer", Build.MANUFACTURER);
                hashMap.put("model", Build.MODEL);
                GallerySamplingStatHelper.recordCountEvent("video_editor", "video_editor_bgm_empty_file_error", hashMap);
            }
        }
    }

    private interface Change {
        void applyChange();
    }

    private class FilterEffect implements Change {
        /* access modifiers changed from: private */
        public Filter mFilter;

        public FilterEffect(Filter filter) {
            this.mFilter = filter;
        }

        public void applyChange() {
            if (this.mFilter != null) {
                if (!NexVideoEditor.this.mHasApplyedSmartEffect || NexVideoEditor.this.mCloneProject == null) {
                    NexVideoEditor.this.mMainVideoClip.setColorEffect(NexVideoEditor.this.finEffect(this.mFilter.getFilterId()));
                } else {
                    int totalClipCount = NexVideoEditor.this.mCloneProject.getTotalClipCount(true);
                    nexColorEffect access$2800 = NexVideoEditor.this.finEffect(this.mFilter.getFilterId());
                    for (int i = 0; i < totalClipCount; i++) {
                        NexVideoEditor.this.mCloneProject.getClip(i, true).setColorEffect(access$2800);
                    }
                }
                if ("NONE".equals(this.mFilter.getFilterId())) {
                    NexVideoEditor.this.mApplyedEditValue.remove("filter");
                } else {
                    NexVideoEditor.this.mApplyedEditValue.put("filter", this);
                }
            } else {
                NexVideoEditor.this.mMainVideoClip.setColorEffect(null);
                NexVideoEditor.this.mApplyedEditValue.remove("filter");
            }
        }
    }

    class SmartEffectTemplate implements Change {
        private int mLimitTime;
        private Template template;

        public SmartEffectTemplate(SmartEffect smartEffect) {
            if (smartEffect != null) {
                this.template = smartEffect.getTemplate();
                this.mLimitTime = smartEffect.getLongTime();
            }
        }

        private String checkTemplate() {
            String str = "";
            if (NexVideoEditor.this.mNexProject.getTotalTime() <= 0) {
                return "Project is empty";
            }
            if (this.template == null) {
                return "Template did not selected";
            }
            if (NexVideoEditor.this.mCloneProject != null) {
                NexVideoEditor.this.mCloneProject.allClear(true);
            }
            NexVideoEditor.this.mCloneProject = nexProject.clone(NexVideoEditor.this.mNexProject);
            if (this.mLimitTime > 0 && this.mLimitTime < NexVideoEditor.this.getVideoTotalTime()) {
                int totalClipCount = NexVideoEditor.this.mCloneProject.getTotalClipCount(true);
                for (int i = 0; i < totalClipCount; i++) {
                    NexVideoEditor.this.mCloneProject.getClip(i, true).getVideoClipEdit().setTrim(0, this.mLimitTime);
                }
            }
            NexVideoEditor.this.mEngin.setProject(NexVideoEditor.this.mCloneProject);
            try {
                if (!NexAssetTemplateManager.getInstance().getKmTemplateManager().applyTemplateToProjectById(NexVideoEditor.this.mCloneProject, this.template.id())) {
                    str = "Fail to apply template on project";
                }
            } catch (ExpiredTimeException unused) {
                str = "This is expired asset!";
            } catch (Exception e) {
                str = e.getMessage();
            }
            Log.d("NexVideoEditor", "check template info : %s ", (Object) str);
            return str;
        }

        private void delete() {
            NexVideoEditor.this.mHasApplyedSmartEffect = false;
            NexVideoEditor.this.mApplyedEditValue.remove("edit_type_smart_effect_template");
        }

        public void applyChange() {
            if (this.template == null || !TextUtils.isEmpty(checkTemplate())) {
                NexVideoEditor.this.mCloneProject = null;
                NexVideoEditor.this.mEngin.setProject(NexVideoEditor.this.mNexProject);
                delete();
                return;
            }
            delete();
            NexVideoEditor.this.mApplyedEditValue.put("edit_type_smart_effect_template", this);
            NexVideoEditor.this.mHasApplyedSmartEffect = true;
        }
    }

    private class SourceAudioChange implements Change {
        private boolean mEnable;

        public SourceAudioChange(boolean z) {
            this.mEnable = z;
        }

        public void applyChange() {
            if (NexVideoEditor.this.mMainVideoClip == null) {
                return;
            }
            if (this.mEnable) {
                NexVideoEditor.this.mMainVideoClip.setClipVolume(100);
                NexVideoEditor.this.mApplyedEditValue.remove("source_audio");
                return;
            }
            NexVideoEditor.this.mMainVideoClip.setClipVolume(0);
            NexVideoEditor.this.mApplyedEditValue.put("source_audio", this);
        }
    }

    private class TextClip implements Change {
        private int mShowTime;
        private nexOverlayItem mTextOverLayItem;
        private int x;
        private int y;

        private TextClip() {
            this.mShowTime = 0;
        }

        private TextClip(String str, int i) {
            this.mShowTime = 0;
            if (!TextUtils.isEmpty(str)) {
                this.mShowTime = i;
                initXY();
                this.mTextOverLayItem = createTextNexOverLayItem(str);
            }
        }

        private nexOverlayItem createTextNexOverLayItem(String str) {
            nexOverlayKineMasterText nexoverlaykinemastertext = new nexOverlayKineMasterText(NexVideoEditor.this.mContext, str, 59);
            nexoverlaykinemastertext.setTextColor(-1);
            nexoverlaykinemastertext.setFontId(null);
            int projectTotalTime = NexVideoEditor.this.getProjectTotalTime();
            if (this.mShowTime == 0) {
                nexOverlayItem nexoverlayitem = new nexOverlayItem(nexoverlaykinemastertext, this.x, this.y, 0, projectTotalTime);
                nexoverlayitem.addAnimate(nexAnimate.getAlpha(nexProject.kAutoThemeTransitionDuration, 400, 1.0f, 0.0f));
                return nexoverlayitem;
            } else if (this.mShowTime == 1) {
                nexOverlayItem nexoverlayitem2 = new nexOverlayItem(nexoverlaykinemastertext, this.x, this.y, (projectTotalTime - 2000) - 400, projectTotalTime);
                nexoverlayitem2.addAnimate(nexAnimate.getAlpha(nexProject.kAutoThemeTransitionDuration, 400, 1.0f, 0.0f));
                return nexoverlayitem2;
            } else if (this.mShowTime != 2) {
                return null;
            } else {
                nexOverlayItem nexoverlayitem3 = new nexOverlayItem(nexoverlaykinemastertext, this.x, this.y, 0, projectTotalTime);
                return nexoverlayitem3;
            }
        }

        private void delete(TextClip textClip) {
            if (textClip != null && textClip.getTextOverLayItem() != null) {
                NexVideoEditor.this.mNexProject.removeOverlay(textClip.getTextOverLayItem().getId());
                NexVideoEditor.this.mApplyedEditValue.remove("edit_type_auto_water_mark_text");
            }
        }

        private nexOverlayItem getTextOverLayItem() {
            return this.mTextOverLayItem;
        }

        private void initXY() {
            int access$2900 = NexVideoEditor.this.mVideoRotation % nexClip.kClip_Rotate_180 == 0 ? NexVideoEditor.this.mVideoWidth : NexVideoEditor.this.mVideoHeight;
            int access$3000 = NexVideoEditor.this.mVideoRotation % nexClip.kClip_Rotate_180 == 0 ? NexVideoEditor.this.mVideoHeight : NexVideoEditor.this.mVideoWidth;
            if (access$2900 > access$3000) {
                this.x = Math.round((((float) access$2900) / ((float) access$3000)) * 720.0f) / 2;
                this.y = 360;
            } else if (access$2900 == access$3000) {
                this.x = 360;
                this.y = 360;
            } else {
                int round = Math.round((((float) access$3000) / ((float) access$2900)) * 720.0f);
                this.x = 360;
                this.y = round / 2;
            }
        }

        public void applyChange() {
            delete((TextClip) NexVideoEditor.this.mApplyedEditValue.get("edit_type_auto_water_mark_text"));
            if (this.mTextOverLayItem != null) {
                NexVideoEditor.this.mApplyedEditValue.put("edit_type_auto_water_mark_text", this);
                NexVideoEditor.this.mNexProject.addOverlay(this.mTextOverLayItem);
            }
            SmartEffectTemplate smartEffectTemplate = (SmartEffectTemplate) NexVideoEditor.this.mApplyedEditValue.get("edit_type_smart_effect_template");
            if (smartEffectTemplate != null) {
                smartEffectTemplate.applyChange();
            }
        }
    }

    private class TrimInfo implements Change {
        private int end;
        private int start;

        TrimInfo(int i, int i2) {
            this.start = i;
            this.end = i2;
        }

        public void applyChange() {
            if (NexVideoEditor.this.mMainVideoClip != null) {
                if (this.start >= this.end || this.end > NexVideoEditor.this.getVideoTotalTime()) {
                    Log.d("NexVideoEditor", "TrimInfo: end time is lower than start time ");
                    return;
                }
                NexVideoEditor.this.mMainVideoClip.getVideoClipEdit().setTrim(this.start, this.end);
                if (this.start == 0 && this.end == NexVideoEditor.this.getVideoTotalTime()) {
                    NexVideoEditor.this.mApplyedEditValue.remove("trim");
                } else {
                    NexVideoEditor.this.mApplyedEditValue.put("trim", this);
                }
                if (NexVideoEditor.this.mEndClip != null) {
                    NexVideoEditor.this.mEndClip.applyChange();
                }
            }
            SmartEffectTemplate smartEffectTemplate = (SmartEffectTemplate) NexVideoEditor.this.mApplyedEditValue.get("edit_type_smart_effect_template");
            if (smartEffectTemplate != null) {
                smartEffectTemplate.applyChange();
            }
        }
    }

    class VideoEditorAdjust implements Change {
        boolean mAdjust;

        public VideoEditorAdjust(boolean z) {
            this.mAdjust = z;
        }

        private void delete() {
            NexVideoEditor.this.mApplyedEditValue.remove("edit_type_adjust");
        }

        public void applyChange() {
            if (!this.mAdjust) {
                delete();
            }
        }
    }

    class WaterMark implements Change {
        private int anchorPoint = 0;
        private int mAlphaDurationTime = 400;
        private int mEndTime = 0;
        private int mStartTime = 0;
        private String mTemplateId;
        private nexOverlayImage mWaterMarkOverlay;
        private nexOverlayItem mWaterMarkOverlayItem;
        private float scale = 0.0f;
        private int timeType = 0;
        private int x;
        private int y;

        public WaterMark() {
        }

        public WaterMark(int i, String str) {
            this.timeType = i;
            this.mTemplateId = str;
            initOverLayItemParams();
            initOverLayItem();
        }

        private void delete(WaterMark waterMark) {
            if (waterMark != null && waterMark.mWaterMarkOverlayItem != null) {
                NexVideoEditor.this.mNexProject.removeOverlay(waterMark.mWaterMarkOverlayItem.getId());
                NexVideoEditor.this.mApplyedEditValue.remove("edit_type_water_mark");
            }
        }

        private void initOverLayItem() {
            this.mEndTime = NexVideoEditor.this.getProjectTotalTime();
            if (!TextUtils.isEmpty(this.mTemplateId) && this.mEndTime > 0) {
                if (this.timeType == 0) {
                    this.mStartTime = 0;
                    this.mWaterMarkOverlay = nexOverlayPreset.getOverlayPreset(NexVideoEditor.this.mContext.getApplicationContext()).getOverlayImage(this.mTemplateId);
                    nexOverlayItem nexoverlayitem = new nexOverlayItem(this.mWaterMarkOverlay, this.anchorPoint, false, (float) this.x, (float) this.y, this.mStartTime, this.mEndTime);
                    this.mWaterMarkOverlayItem = nexoverlayitem;
                    if (this.mWaterMarkOverlay != null) {
                        this.mWaterMarkOverlayItem.addAnimate(nexAnimate.getAlpha(this.mWaterMarkOverlay.getDefaultDuration() + 1500, this.mAlphaDurationTime, 1.0f, 0.0f));
                    }
                } else if (this.timeType == 2) {
                    this.mStartTime = 0;
                    this.mWaterMarkOverlay = nexOverlayPreset.getOverlayPreset(NexVideoEditor.this.mContext.getApplicationContext()).getOverlayImage(this.mTemplateId);
                    nexOverlayItem nexoverlayitem2 = new nexOverlayItem(this.mWaterMarkOverlay, this.anchorPoint, false, (float) this.x, (float) this.y, this.mStartTime, this.mEndTime);
                    this.mWaterMarkOverlayItem = nexoverlayitem2;
                } else if (this.timeType == 1) {
                    this.mWaterMarkOverlay = nexOverlayPreset.getOverlayPreset(NexVideoEditor.this.mContext.getApplicationContext()).getOverlayImage(this.mTemplateId);
                    this.mStartTime = ((this.mEndTime - 800) - this.mWaterMarkOverlay.getDefaultDuration()) - 1000;
                    nexOverlayItem nexoverlayitem3 = new nexOverlayItem(this.mWaterMarkOverlay, this.anchorPoint, false, (float) this.x, (float) this.y, this.mStartTime, this.mEndTime);
                    this.mWaterMarkOverlayItem = nexoverlayitem3;
                    this.mWaterMarkOverlayItem.addAnimate(nexAnimate.getAlpha(this.mWaterMarkOverlay.getDefaultDuration() + 500, 800, 1.0f, 0.0f));
                }
                this.mWaterMarkOverlayItem.setScale(this.scale, this.scale);
            }
        }

        private void initOverLayItemParams() {
            int access$2900 = NexVideoEditor.this.mVideoRotation % nexClip.kClip_Rotate_180 == 0 ? NexVideoEditor.this.mVideoWidth : NexVideoEditor.this.mVideoHeight;
            int access$3000 = NexVideoEditor.this.mVideoRotation % nexClip.kClip_Rotate_180 == 0 ? NexVideoEditor.this.mVideoHeight : NexVideoEditor.this.mVideoWidth;
            if (access$2900 > access$3000) {
                int round = Math.round((((float) access$2900) / ((float) access$3000)) * 720.0f);
                this.x = round / 2;
                this.y = 360;
                this.scale = 970.0f / ((float) round);
            } else if (access$2900 == access$3000) {
                this.x = 360;
                this.y = 360;
                this.scale = 0.576f;
            } else {
                int round2 = Math.round((((float) access$3000) / ((float) access$2900)) * 720.0f);
                this.x = 360;
                this.y = round2 / 2;
                this.scale = 0.576f;
            }
        }

        public void applyChange() {
            delete((WaterMark) NexVideoEditor.this.mApplyedEditValue.get("edit_type_water_mark"));
            if (this.mWaterMarkOverlayItem != null) {
                NexVideoEditor.this.mApplyedEditValue.put("edit_type_water_mark", this);
                NexVideoEditor.this.mNexProject.addOverlay(this.mWaterMarkOverlayItem);
            }
            SmartEffectTemplate smartEffectTemplate = (SmartEffectTemplate) NexVideoEditor.this.mApplyedEditValue.get("edit_type_smart_effect_template");
            if (smartEffectTemplate != null) {
                smartEffectTemplate.applyChange();
                Log.d("NexVideoEditor", "WaterMark change: have  smartEffect;");
            }
            BGMEdit bGMEdit = (BGMEdit) NexVideoEditor.this.mApplyedEditValue.get("bg_audio");
            if (bGMEdit != null) {
                bGMEdit.applyChange();
                Log.d("NexVideoEditor", "WaterMark change: have  audio;");
            }
            FilterEffect filterEffect = (FilterEffect) NexVideoEditor.this.mApplyedEditValue.get("filter");
            if (filterEffect != null) {
                filterEffect.applyChange();
                Log.d("NexVideoEditor", "WaterMark change: have  filter;");
            }
        }
    }

    public NexVideoEditor(Context context) {
        this.mContext = context;
    }

    private boolean addChange(final Change change, final OnCompletedListener onCompletedListener) {
        switch (this.mEngineState) {
            case 0:
            case 2:
                change.applyChange();
                this.mEngin.updateProject();
                setEngineState(0);
                if (onCompletedListener != null) {
                    onCompletedListener.onCompleted();
                }
                return true;
            case 1:
                setEngineState(BaiduSceneResult.SHOOTING);
                if (this.mEngin != null) {
                    this.mEngin.stop(new OnCompletionListener() {
                        public void onComplete(int i) {
                            change.applyChange();
                            if (NexVideoEditor.this.mEngin != null) {
                                NexVideoEditor.this.mEngin.updateProject();
                            }
                            NexVideoEditor.this.setEngineState(0);
                            if (onCompletedListener != null) {
                                onCompletedListener.onCompleted();
                            }
                        }
                    });
                }
                return true;
            default:
                StringBuilder sb = new StringBuilder();
                sb.append("addChange is not allowed at EngineState :");
                sb.append(this.mEngineState);
                Log.e("NexVideoEditor", sb.toString());
                return false;
        }
    }

    /* access modifiers changed from: private */
    public void configEngine() {
        nexApplicationConfig.setAspectProfile(this.mVideoRotation % nexClip.kClip_Rotate_180 == 0 ? new nexAspectProfile(this.mVideoWidth, this.mVideoHeight) : new nexAspectProfile(this.mVideoHeight, this.mVideoWidth));
    }

    private nexProject createProject(nexClip nexclip) {
        if (this.mNexProject != null) {
            this.mNexProject.allClear(true);
            this.mNexProject = null;
        }
        if (nexclip == null) {
            return null;
        }
        nexclip.setRotateDegree(this.mVideoRotation);
        nexProject nexproject = new nexProject();
        nexproject.add(nexclip);
        nexclip.getCrop().randomizeStartEndPosition(true, CropMode.FIT);
        return nexproject;
    }

    /* access modifiers changed from: private */
    public void doSeek(int i) {
        int i2 = this.mEngineState;
        if (i2 == 0 || i2 == 2) {
            this.setTimeSuccess = false;
            setEngineState(BaiduSceneResult.SPORTS_OTHER);
            this.mEngin.seek(i);
        } else if (i2 != 104) {
            StringBuilder sb = new StringBuilder();
            sb.append("setFilter is not allowed at EngineState :");
            sb.append(this.mEngineState);
            Log.e("NexVideoEditor", sb.toString());
        } else {
            this.mSeekTarget = i;
            updataSeek();
        }
    }

    /* access modifiers changed from: private */
    public nexColorEffect finEffect(String str) {
        if (str != null) {
            for (nexColorEffect nexcoloreffect : nexColorEffect.getPresetList()) {
                if (str.equals(nexcoloreffect.getPresetName())) {
                    return nexcoloreffect;
                }
            }
        }
        return null;
    }

    /* access modifiers changed from: private */
    public void handleHardwareSupport() throws NotSupportVideoException {
        MediaCodecInfo[] codecInfos;
        if (Arrays.asList(sWhiteList).contains(Build.DEVICE) && VERSION.SDK_INT >= 21) {
            int width = this.mVideoRotation % nexClip.kClip_Rotate_180 == 0 ? this.mMainVideoClip.getWidth() : this.mMainVideoClip.getHeight();
            int height = this.mVideoRotation % nexClip.kClip_Rotate_180 == 0 ? this.mMainVideoClip.getHeight() : this.mMainVideoClip.getWidth();
            String videoCodecType = this.mMainVideoClip.getVideoCodecType();
            Log.d("NexVideoEditor", "videoCodecType: %s", (Object) videoCodecType);
            for (MediaCodecInfo mediaCodecInfo : new MediaCodecList(0).getCodecInfos()) {
                if (!mediaCodecInfo.isEncoder()) {
                    String[] supportedTypes = mediaCodecInfo.getSupportedTypes();
                    int i = 0;
                    while (supportedTypes != null && i < supportedTypes.length) {
                        if (!TextUtils.isEmpty(supportedTypes[i]) && supportedTypes[i].contains("video/") && (supportedTypes[i].contains(videoCodecType) || ((videoCodecType.equalsIgnoreCase("video/h264") && supportedTypes[i].equalsIgnoreCase("video/avc")) || (videoCodecType.equalsIgnoreCase("video/avc") && supportedTypes[i].equalsIgnoreCase("video/h264"))))) {
                            VideoCapabilities videoCapabilities = mediaCodecInfo.getCapabilitiesForType(supportedTypes[i]).getVideoCapabilities();
                            if (videoCapabilities != null && videoCapabilities.areSizeAndRateSupported(width, height, (double) this.mMainVideoClip.getFramesPerSecond())) {
                                Log.d("NexVideoEditor", String.format("the MediaCodecInfo name is: %s, and the  phone is supported to edit:  %s", new Object[]{mediaCodecInfo.getName(), "true"}));
                                return;
                            }
                        }
                        i++;
                    }
                }
            }
            Log.e("NexVideoEditor", "the device can not support to edit the video.");
            throw new NotSupportVideoException();
        }
    }

    private boolean haveChange(String str) {
        Object obj = this.mSavedEditValue.get(str);
        Object obj2 = this.mApplyedEditValue.get(str);
        if (obj == null && obj2 == null) {
            return false;
        }
        return obj == null || !obj.equals(obj2);
    }

    private void loadMainThumbnail(String str) {
        ImageLoader.getInstance().loadImage(UriUtils.toSafeString(Uri.fromFile(new File(str))), new ImageLoadingListener() {
            public void onLoadingCancelled(String str, View view) {
            }

            public void onLoadingComplete(String str, View view, Bitmap bitmap) {
                if (bitmap != null) {
                    NexVideoEditor.this.mDisplayWrapper.showThumbnail(bitmap);
                    if (NexVideoEditor.this.preLoadVideoThumbnails.size() == 0) {
                        if (NexVideoEditor.this.mVideoRotation % nexClip.kClip_Rotate_180 == 0) {
                            NexVideoEditor.this.preLoadVideoThumbnails.add(new VideoThumbnail(0, 0, 0, Bitmap.createScaledBitmap(bitmap, 160, 90, false)));
                        } else {
                            NexVideoEditor.this.preLoadVideoThumbnails.add(new VideoThumbnail(0, 0, 0, Bitmap.createScaledBitmap(bitmap, 90, 160, false)));
                        }
                        NexVideoEditor.this.notifyThumbnailChanged();
                    }
                }
            }

            public void onLoadingFailed(String str, View view, FailReason failReason) {
            }

            public void onLoadingStarted(String str, View view) {
            }
        });
    }

    /* access modifiers changed from: private */
    public void loadProject() {
        this.mNexProject = createProject(this.mMainVideoClip);
        this.mNexProject.getLastPrimaryClip().setRotateDegree(this.mMainVideoClip.getRotateInMeta());
        this.mNexProject.getLastPrimaryClip().getCrop().randomizeStartEndPosition(false, CropMode.FIT);
        this.mEngin.setProject(this.mNexProject);
        this.mEngin.updateProject();
    }

    /* access modifiers changed from: private */
    public void loadThumbnail(final OnCompletedListener onCompletedListener) {
        this.mMainVideoClip.getVideoClipDetailThumbnails(this.mVideoRotation % nexClip.kClip_Rotate_180 == 0 ? 160 : 90, this.mVideoRotation % nexClip.kClip_Rotate_180 == 0 ? 90 : 160, 0, this.mMainVideoClip.getTotalTime(), 50, this.mVideoRotation, new NexOnGetVideoClipDetailThumbnailsListener(new OnGetVideoThumbnailListener() {
            public void onGetVideoThumbnailCompleted(List<VideoThumbnail> list) {
                if (!NexVideoEditor.this.mIsDestroy) {
                    if (list != null && list.size() > 0) {
                        NexVideoEditor.this.preLoadVideoThumbnails.clear();
                        NexVideoEditor.this.preLoadVideoThumbnails.addAll(list);
                        NexVideoEditor.this.notifyThumbnailChanged();
                    }
                    NexVideoEditor.this.setDisplayView(NexVideoEditor.this.mDisplayWrapper.getDisplayView());
                    NexVideoEditor.this.setEngineState(0);
                    onCompletedListener.onCompleted();
                }
            }
        }));
    }

    /* access modifiers changed from: private */
    public void loadVideo(String str) throws NotSupportVideoException {
        nexClip supportedClip = nexClip.getSupportedClip(str, true);
        if (supportedClip != null) {
            this.mVideoWidth = supportedClip.getWidth();
            this.mVideoHeight = supportedClip.getHeight();
            this.mVideoRotation = supportedClip.getRotateInMeta();
            this.mVideoBitrate = supportedClip.getVideoBitrate();
            this.mVideoFrames = supportedClip.getFramesPerSecond();
            this.mMainVideoClip = supportedClip;
            if (this.mVideoRotation % nexClip.kClip_Rotate_180 == 0) {
                this.mRatio = ((float) this.mVideoWidth) / ((float) this.mVideoHeight);
            } else {
                this.mRatio = ((float) this.mVideoHeight) / ((float) this.mVideoWidth);
            }
        } else {
            throw new NotSupportVideoException();
        }
    }

    private void pause(OnCompletedListener onCompletedListener) {
        if (this.mEngineState != 1 || this.mEngin == null) {
            StringBuilder sb = new StringBuilder();
            sb.append("pause is not allowed at EngineState :");
            sb.append(this.mEngineState);
            Log.e("NexVideoEditor", sb.toString());
            return;
        }
        this.mPauseOnCompletedListener = onCompletedListener;
        setEngineState(BaiduSceneResult.TAEKWONDO);
        this.mEngin.pause();
    }

    /* access modifiers changed from: private */
    public void setEngineState(int i) {
        if (i == -500) {
            setState(-500);
        } else if (i != 500) {
            switch (i) {
                case 0:
                    setState(0);
                    keepScreenOn(false);
                    break;
                case 1:
                    setState(1);
                    keepScreenOn(true);
                    this.mDisplayWrapper.hideThumbnail();
                    break;
                case 2:
                    setState(2);
                    keepScreenOn(false);
                    break;
                default:
                    switch (i) {
                        case 100:
                        case BaiduSceneResult.SHOOTING /*101*/:
                        case BaiduSceneResult.TAEKWONDO /*102*/:
                        case BaiduSceneResult.MOUNTAINEERING /*103*/:
                        case BaiduSceneResult.GARDEN /*107*/:
                            setState(200);
                            break;
                        case BaiduSceneResult.SPORTS_OTHER /*104*/:
                            setState(3);
                            this.mDisplayWrapper.hideThumbnail();
                            break;
                        case BaiduSceneResult.TEMPLE /*105*/:
                        case BaiduSceneResult.PALACE /*106*/:
                            keepScreenOn(true);
                            setState(200);
                            break;
                    }
            }
        } else {
            setState(500);
            keepScreenOn(false);
        }
        this.mEngineState = i;
    }

    private void setTrimInfo(TrimInfo trimInfo) {
        this.mTempEditValue.put("trim", trimInfo);
    }

    private void updataSeek() {
        if (this.mEngineState != 104) {
            return;
        }
        if (this.mSeekTarget != -1) {
            if (Math.abs(this.mEngin.getCurrentPlayTimeTime() - this.mSeekTarget) > 150) {
                this.mEngin.seekIDROnly(this.mSeekTarget);
                StringBuilder sb = new StringBuilder();
                sb.append("SEEK IDR progress :");
                sb.append(this.mSeekTarget);
                Log.d("NexVideoEditor", sb.toString());
            } else {
                this.mEngin.seek(this.mSeekTarget);
                StringBuilder sb2 = new StringBuilder();
                sb2.append("progress :");
                sb2.append(this.mSeekTarget);
                Log.d("NexVideoEditor", sb2.toString());
            }
            this.mSeekTarget = -1;
            return;
        }
        if (this.setTimeSuccess) {
            setEngineState(2);
        } else {
            setEngineState(0);
        }
        if (this.seekOnCompletedListener != null) {
            this.seekOnCompletedListener.onCompleted();
        }
    }

    public void adjustBrightness(int i) {
        if (this.mEngineState == 0 || this.mEngineState == 2) {
            apply(new OnCompletedListener() {
                public void onCompleted() {
                    NexVideoEditor.this.play();
                }
            });
        }
        this.mEngin.setBrightness(i);
        this.mEngin.fastPreview(FastPreviewOption.adj_brightness, i);
    }

    public void adjustContrast(int i) {
        if (this.mEngineState == 0 || this.mEngineState == 2) {
            apply(new OnCompletedListener() {
                public void onCompleted() {
                    NexVideoEditor.this.play();
                }
            });
        }
        this.mEngin.setContrast(i);
        this.mEngin.fastPreview(FastPreviewOption.adj_contrast, i);
    }

    public void adjustSaturation(int i) {
        if (this.mEngineState == 0 || this.mEngineState == 2) {
            apply(new OnCompletedListener() {
                public void onCompleted() {
                    NexVideoEditor.this.play();
                }
            });
        }
        this.mEngin.setSaturation(i);
        this.mEngin.fastPreview(FastPreviewOption.adj_saturation, i);
    }

    public void adjustSharpness(int i) {
        if (this.mEngineState == 0 || this.mEngineState == 2) {
            apply(new OnCompletedListener() {
                public void onCompleted() {
                    NexVideoEditor.this.play();
                }
            });
        }
        this.mEngin.setSharpness(i);
        this.mEngin.fastPreview(FastPreviewOption.adj_sharpness, i);
    }

    public void adjustVignetteRange(int i) {
        if (this.mEngineState == 0 || this.mEngineState == 2) {
            apply(new OnCompletedListener() {
                public void onCompleted() {
                    NexVideoEditor.this.play();
                }
            });
        }
        this.mEngin.setVignetteRange(i);
        this.mEngin.fastPreview(FastPreviewOption.adj_vignetteRange, i);
    }

    public boolean apply(OnCompletedListener onCompletedListener) {
        return applyAsync(onCompletedListener);
    }

    public boolean applyAsync(final OnCompletedListener onCompletedListener) {
        if (this.mTempEditValue.size() == 0) {
            onCompletedListener.onCompleted();
            return true;
        }
        final Change[] changeArr = new Change[this.mTempEditValue.size()];
        this.mTempEditValue.values().toArray(changeArr);
        this.mTempEditValue.clear();
        switch (this.mEngineState) {
            case 0:
            case 2:
                setEngineState(100);
                new ApplyTask(onCompletedListener).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, changeArr);
                return true;
            case 1:
                setEngineState(BaiduSceneResult.SHOOTING);
                this.mEngin.stop(new OnCompletionListener() {
                    public void onComplete(int i) {
                        NexVideoEditor.this.setEngineState(100);
                        new ApplyTask(onCompletedListener).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, changeArr);
                    }
                });
                return true;
            default:
                return false;
        }
    }

    public void autoTrim(final int i, TrimStateInterface trimStateInterface) {
        if (this.mEngineState == 0 && isSupportAutoTrim() && i < this.mMainVideoClip.getTotalTime()) {
            this.mTrimStateInterface = trimStateInterface;
            setEngineState(BaiduSceneResult.PALACE);
            this.mEngin.autoTrim(this.mMainVideoClip.getPath(), true, i / 5, 5, 0, new OnAutoTrimResultListener() {
                public void onAutoTrimResult(int i, int[] iArr) {
                    if (iArr != null && iArr.length != 0) {
                        NexVideoEditor.this.mNexProject.allClear(true);
                        int totalTime = NexVideoEditor.this.mMainVideoClip.getTotalTime();
                        for (int i2 = 0; i2 < iArr.length; i2++) {
                            nexClip dup = nexClip.dup(NexVideoEditor.this.mMainVideoClip);
                            NexVideoEditor.this.mNexProject.add(dup);
                            int i3 = iArr[i2];
                            dup.getVideoClipEdit().setTrim(i3, i3 >= totalTime ? iArr[i2] + (i / 5) : Math.min(iArr[i2] + (i / 5), totalTime));
                            dup.setRotateDegree(NexVideoEditor.this.mVideoRotation);
                            NexVideoEditor.this.mEngin.setProject(NexVideoEditor.this.mNexProject);
                        }
                        final String generateOutputFilePath = FileHelper.generateOutputFilePath(NexVideoEditor.this.mMainVideoClip.getPath(), true);
                        if (NexVideoEditor.this.mTrimStateInterface != null) {
                            NexVideoEditor.this.mTrimStateInterface.onTrimEnd(generateOutputFilePath);
                        }
                        NexVideoEditor.this.setEngineState(0);
                        NexVideoEditor.this.mHandler.post(new Runnable() {
                            public void run() {
                                NexVideoEditor.this.export(generateOutputFilePath, new EnocdeStateInterface() {
                                    public void onEncodeEnd(boolean z, int i, int i2) {
                                        if (z) {
                                            NexVideoEditor.this.mHasUsingAutoTrim = true;
                                        }
                                        if (NexVideoEditor.this.mTrimStateInterface != null) {
                                            NexVideoEditor.this.mTrimStateInterface.onEncodeEnd(z, i, i2);
                                        }
                                    }

                                    public void onEncodeProgress(int i) {
                                        if (NexVideoEditor.this.mTrimStateInterface != null) {
                                            NexVideoEditor.this.mTrimStateInterface.onEncodeProgress(i);
                                        }
                                    }

                                    public void onEncodeStart() {
                                        if (NexVideoEditor.this.mTrimStateInterface != null) {
                                            NexVideoEditor.this.mTrimStateInterface.onEncodeStart();
                                        }
                                    }
                                });
                            }
                        });
                    }
                }
            });
            if (this.mTrimStateInterface != null) {
                this.mTrimStateInterface.onTrimStart();
            }
        }
    }

    public void cancelExport(final OnCompletedListener onCompletedListener) {
        if (this.mEngineState == 105) {
            this.mEngin.stop(new OnCompletionListener() {
                public void onComplete(int i) {
                    NexVideoEditor.this.setEngineState(0);
                    if (onCompletedListener != null) {
                        onCompletedListener.onCompleted();
                    }
                }
            });
        }
    }

    public boolean checkIDRSupport() {
        long currentTimeMillis = System.currentTimeMillis();
        boolean z = this.mMainVideoClip != null && this.mMainVideoClip.getSeekPointCount() > 0 && this.mMainVideoClip.getSeekPointInterval() <= 4000;
        Log.d("NexVideoEditor", "get interval costs %dms", (Object) Long.valueOf(System.currentTimeMillis() - currentTimeMillis));
        return z;
    }

    public void destroy() {
        if (this.mEngin != null) {
            this.mEngin.setView((nexEngineView) null);
            this.mEngin.stop();
            nexApplicationConfig.releaseNativeEngine(this.mEngin);
            keepScreenOn(false);
        }
        this.mIsDestroy = true;
    }

    public void export(final String str, final EnocdeStateInterface enocdeStateInterface) {
        Log.d("NexVideoEditor", "export engine state: %d ", (Object) Integer.valueOf(this.mEngineState));
        switch (this.mEngineState) {
            case 0:
            case 2:
                setEngineState(BaiduSceneResult.TEMPLE);
                this.mCurrentEnocdeStateInterface = enocdeStateInterface;
                this.mEngin.export(str, this.mVideoRotation % nexClip.kClip_Rotate_180 == 0 ? this.mVideoWidth : this.mVideoHeight, this.mVideoRotation % nexClip.kClip_Rotate_180 == 0 ? this.mVideoHeight : this.mVideoWidth, this.mVideoBitrate, Long.MAX_VALUE, 0);
                enocdeStateInterface.onEncodeStart();
                return;
            case 1:
                setEngineState(BaiduSceneResult.SHOOTING);
                this.mEngin.stop(new OnCompletionListener() {
                    public void onComplete(int i) {
                        NexVideoEditor.this.setEngineState(0);
                        NexVideoEditor.this.mHandler.post(new Runnable() {
                            public void run() {
                                NexVideoEditor.this.export(str, enocdeStateInterface);
                            }
                        });
                    }
                });
                return;
            default:
                StringBuilder sb = new StringBuilder();
                sb.append("export is not allowed at EngineState :");
                sb.append(this.mEngineState);
                Log.e("NexVideoEditor", sb.toString());
                enocdeStateInterface.onEncodeEnd(false, -1, -1);
                return;
        }
    }

    public float getCurrentDisplayRatio() {
        return this.mRatio;
    }

    public int getProjectTotalTime() {
        if (this.mEngin != null) {
            nexProject project = this.mEngin.getProject();
            if (project != null) {
                return project.getTotalTime();
            }
        }
        return 0;
    }

    public int getVideoFrames() {
        return this.mVideoFrames;
    }

    public String getVideoPath() {
        return TextUtils.isEmpty(this.mVideoPath) ? "" : this.mVideoPath;
    }

    public int getVideoStartTime() {
        if (this.mMainVideoClip != null) {
            return this.mMainVideoClip.getProjectStartTime();
        }
        return 0;
    }

    public int getVideoTotalTime() {
        if (this.mMainVideoClip != null) {
            return this.mMainVideoClip.getTotalTime();
        }
        if (this.mNexProject != null) {
            return this.mNexProject.getTotalTime();
        }
        return 0;
    }

    public boolean hasEdit() {
        return this.mApplyedEditValue.size() > 0 || this.mHasUsingAutoTrim;
    }

    public boolean haveSavedEditState() {
        return !this.mSavedEditValue.isEmpty();
    }

    public boolean isSourceAudioEnable() {
        return this.mMainVideoClip == null || this.mMainVideoClip.getClipVolume() == 100;
    }

    public boolean isSupportAutoTrim() {
        return this.mMainVideoClip != null && getProjectTotalTime() > 30000 && !this.mHasApplyedSmartEffect;
    }

    public void keepScreenOn(boolean z) {
        if (this.mDisplayWrapper != null) {
            this.mDisplayWrapper.setKeepScreenOn(z);
        }
    }

    public void load(String str, OnCompletedListener onCompletedListener) {
        this.mVideoPath = str;
        loadMainThumbnail(str);
        final long currentTimeMillis = System.currentTimeMillis();
        setEngineState(100);
        Context context = this.mContext;
        final String str2 = str;
        final OnCompletedListener onCompletedListener2 = onCompletedListener;
        AnonymousClass2 r0 = new Runnable() {
            public void run() {
                long currentTimeMillis = System.currentTimeMillis();
                StringBuilder sb = new StringBuilder();
                sb.append("sdk init using :");
                sb.append(currentTimeMillis - currentTimeMillis);
                sb.append("ms");
                Log.d("NexVideoEditor", sb.toString());
                NexVideoEditor.this.mIsInit = true;
                try {
                    NexVideoEditor.this.mEngin = NexEngine.getEngine(NexVideoEditor.this.mContext);
                    NexVideoEditor.this.mEngin.setEventHandler(NexVideoEditor.this);
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("engine create time :");
                    sb2.append(System.currentTimeMillis() - currentTimeMillis);
                    sb2.append("ms");
                    Log.d("NexVideoEditor", sb2.toString());
                    new AsyncTask<Void, Void, Boolean>() {
                        /* access modifiers changed from: protected */
                        public Boolean doInBackground(Void... voidArr) {
                            try {
                                long currentTimeMillis = System.currentTimeMillis();
                                NexVideoEditor.this.loadVideo(str2);
                                NexVideoEditor.this.handleHardwareSupport();
                                NexVideoEditor.this.configEngine();
                                NexVideoEditor.this.loadProject();
                                StringBuilder sb = new StringBuilder();
                                sb.append("load project using :");
                                sb.append(System.currentTimeMillis() - currentTimeMillis);
                                sb.append("ms");
                                Log.d("NexVideoEditor", sb.toString());
                                return Boolean.valueOf(true);
                            } catch (Exception e) {
                                StringBuilder sb2 = new StringBuilder();
                                sb2.append("doInBackground: e");
                                sb2.append(e.toString());
                                Log.d("NexVideoEditor", sb2.toString());
                                return Boolean.valueOf(false);
                            }
                        }

                        /* access modifiers changed from: protected */
                        public void onPostExecute(Boolean bool) {
                            super.onPostExecute(bool);
                            if (!NexVideoEditor.this.mIsDestroy) {
                                NexVideoEditor.this.mDisplayWrapper.getDisplayView().requestLayout();
                                NexVideoEditor.this.mDisplayWrapper.setAspectRatio(NexVideoEditor.this.mRatio);
                                if (bool.booleanValue()) {
                                    NexVideoEditor.this.loadThumbnail(onCompletedListener2);
                                    NexVideoEditor.this.mEngin.updateScreenMode();
                                    return;
                                }
                                NexVideoEditor.this.setEngineState(500);
                            }
                        }
                    }.executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, new Void[0]);
                } catch (Exception e) {
                    Log.e("NexVideoEditor", "sdk init error: %s .", (Object) e.getMessage());
                    NexVideoEditor.this.setEngineState(-500);
                    StringBuilder sb3 = new StringBuilder();
                    sb3.append("build manufacturer :");
                    sb3.append(Build.MANUFACTURER);
                    Log.e("NexVideoEditor", sb3.toString());
                    StringBuilder sb4 = new StringBuilder();
                    sb4.append("build model :");
                    sb4.append(Build.MODEL);
                    Log.e("NexVideoEditor", sb4.toString());
                    HashMap hashMap = new HashMap();
                    hashMap.put("manufacturer", Build.MANUFACTURER);
                    hashMap.put("model", Build.MODEL);
                    GallerySamplingStatHelper.recordCountEvent("video_editor", "video_editor_sdk_init_error", hashMap);
                }
            }
        };
        NexEngine.init(context, 1, r0);
    }

    public void onCheckDirectExport(int i) {
    }

    public void onClipInfoDone() {
    }

    public void onEncodingDone(boolean z, int i) {
        if (this.mCurrentEnocdeStateInterface != null) {
            this.mCurrentEnocdeStateInterface.onEncodeEnd(!z, i, 0);
        }
        setEngineState(0);
        Log.i("NexVideoEditor", "onEncodingDone errorCode : %s", (Object) Integer.valueOf(i));
        if (this.mApplyedEditValue.size() > 0) {
            HashMap hashMap = new HashMap();
            for (Entry entry : this.mApplyedEditValue.entrySet()) {
                String str = (String) entry.getKey();
                if ("bg_audio".equals(str)) {
                    hashMap.put("usingBGM", String.valueOf(((BGMEdit) entry.getValue()).mBGMUri));
                } else if ("filter".equals(str)) {
                    hashMap.put("usingFilter", String.valueOf(((FilterEffect) entry.getValue()).mFilter.getFilterId()));
                } else if ("source_audio".equals(str)) {
                    hashMap.put("disable_source_audio", "true");
                } else if ("trim".equals(str)) {
                    hashMap.put("usingTRIM", "trim");
                } else if ("edit_type_auto_water_mark_text".equals(str)) {
                    hashMap.put("usingText", "text");
                }
            }
            GallerySamplingStatHelper.recordCountEvent("video_editor", "video_editor_using_effect", hashMap);
        }
    }

    public void onEncodingProgress(int i) {
        if (this.mCurrentEnocdeStateInterface != null) {
            this.mCurrentEnocdeStateInterface.onEncodeProgress(i);
        }
        StringBuilder sb = new StringBuilder();
        sb.append("engine encoding : ");
        sb.append(i);
        Log.i("NexVideoEditor", sb.toString());
    }

    public void onFastPreviewStartDone(int i, int i2, int i3) {
    }

    public void onFastPreviewStopDone(int i) {
    }

    public void onFastPreviewTimeDone(int i) {
    }

    public void onPlayEnd() {
        if (this.mEngineState != 105) {
            setEngineState(0);
            seek(0, null);
            Log.i("NexVideoEditor", "onPlayEnd");
        }
    }

    public void onPlayFail(int i, int i2) {
        StringBuilder sb = new StringBuilder();
        sb.append("onPlayFail : error code :");
        sb.append(i);
        String sb2 = sb.toString();
        StringBuilder sb3 = new StringBuilder();
        sb3.append("clipId");
        sb3.append(i2);
        Log.e("NexVideoEditor", sb2, (Object) sb3.toString());
        HashMap hashMap = new HashMap();
        hashMap.put("errorcofr", String.valueOf(i));
        hashMap.put("state", String.valueOf(this.mEngineState));
        GallerySamplingStatHelper.recordCountEvent("video_editor", "video_editor_play_failed", hashMap);
        int i3 = this.mEngineState;
        if (!(i3 == 1 || i3 != 105 || this.mCurrentEnocdeStateInterface == null)) {
            this.mCurrentEnocdeStateInterface.onEncodeEnd(false, -1, -1);
        }
        setEngineState(0);
    }

    public void onPlayStart() {
        if (this.mEngineState != 105) {
            setEngineState(1);
            Log.i("NexVideoEditor", "onPlayStart");
        }
    }

    public void onPreviewPeakMeter(int i, int i2) {
    }

    public void onProgressThumbnailCaching(int i, int i2) {
        if (this.mTrimStateInterface != null) {
            this.mTrimStateInterface.onTrimProgress(i);
        }
        StringBuilder sb = new StringBuilder();
        sb.append("engine onProgressThumbnailCaching : ");
        sb.append(i);
        sb.append("/");
        sb.append(i2);
        Log.i("NexVideoEditor", sb.toString());
    }

    public void onSeekStateChanged(boolean z) {
        StringBuilder sb = new StringBuilder();
        sb.append("onSeekStateChanged ");
        sb.append(z);
        Log.e("NexVideoEditor", sb.toString());
    }

    public void onSetTimeDone(int i) {
        this.setTimeSuccess = true;
        updataSeek();
        StringBuilder sb = new StringBuilder();
        sb.append("onSetTimeDone : ");
        sb.append(i);
        Log.d("NexVideoEditor", sb.toString());
    }

    public void onSetTimeFail(int i) {
        updataSeek();
        Log.d("NexVideoEditor", "onSetTimeFail");
    }

    public void onSetTimeIgnored() {
        updataSeek();
        Log.d("NexVideoEditor", "onSetTimeIgnored");
    }

    public void onStateChange(int i, int i2) {
        if (i == 2 && i2 == 1 && this.mEngineState == 102) {
            setEngineState(2);
            if (this.mPauseOnCompletedListener != null) {
                this.mPauseOnCompletedListener.onCompleted();
                this.mPauseOnCompletedListener = null;
            }
        }
        StringBuilder sb = new StringBuilder();
        sb.append("nexEngineState : old state :");
        sb.append(i);
        sb.append(" new state :");
        sb.append(i2);
        Log.d("NexVideoEditor", sb.toString());
    }

    public void onTimeChange(int i) {
        if (this.mEngineState == 1) {
            onTimeChanged(i);
        }
    }

    public void pause() {
        pause(null);
    }

    public Bitmap pickThumbnail(int i) {
        this.mThumbnailPickCursor = 0;
        return pickThumbnailSerial(i);
    }

    public Bitmap pickThumbnailSerial(int i) {
        Bitmap bitmap = null;
        if (this.preLoadVideoThumbnails != null && this.preLoadVideoThumbnails.size() > 0) {
            int size = this.preLoadVideoThumbnails.size();
            int i2 = Integer.MAX_VALUE;
            for (int i3 = this.mThumbnailPickCursor; i3 < size; i3++) {
                VideoThumbnail videoThumbnail = (VideoThumbnail) this.preLoadVideoThumbnails.get(i3);
                if (Math.abs(videoThumbnail.getIntrinsicTime() - i) >= i2) {
                    break;
                }
                i2 = Math.abs(videoThumbnail.getIntrinsicTime() - i);
                this.mThumbnailPickCursor = i3;
                bitmap = videoThumbnail.getThumbnail();
            }
        }
        return bitmap;
    }

    public void play() {
        if (this.mEngineState != 0) {
            StringBuilder sb = new StringBuilder();
            sb.append("play is not allowed at EngineState :");
            sb.append(this.mEngineState);
            Log.d("NexVideoEditor", sb.toString());
        } else if (this.mEngin != null) {
            setEngineState(BaiduSceneResult.MOUNTAINEERING);
            this.mEngin.play();
        }
    }

    public void release() {
        destroy();
        NexEngine.releaseEngine();
    }

    public boolean resetProject(OnCompletedListener onCompletedListener) {
        return addChange(new Change() {
            public void applyChange() {
                NexVideoEditor.this.mMainVideoClip = nexClip.dup(NexVideoEditor.this.mMainVideoClip);
                NexVideoEditor.this.mMainVideoClip.setRotateDegree(NexVideoEditor.this.mVideoRotation);
                NexVideoEditor.this.mNexProject = new nexProject();
                NexVideoEditor.this.mNexProject.add(NexVideoEditor.this.mMainVideoClip);
                NexVideoEditor.this.mEngin.setProject(NexVideoEditor.this.mNexProject);
                NexVideoEditor.this.mApplyedEditValue.clear();
                NexVideoEditor.this.mOpenClip = null;
                NexVideoEditor.this.mEndClip = null;
            }
        }, onCompletedListener);
    }

    public void restoreEditState() {
        if (haveChange("filter")) {
            FilterEffect filterEffect = (FilterEffect) this.mSavedEditValue.get("filter");
            if (filterEffect == null) {
                filterEffect = new FilterEffect(null);
            }
            this.mTempEditValue.put("filter", filterEffect);
        }
        if (haveChange("bg_audio")) {
            BGMEdit bGMEdit = (BGMEdit) this.mSavedEditValue.get("bg_audio");
            if (bGMEdit == null) {
                bGMEdit = new BGMEdit(null);
            }
            this.mTempEditValue.put("bg_audio", bGMEdit);
        }
        if (haveChange("source_audio")) {
            SourceAudioChange sourceAudioChange = (SourceAudioChange) this.mSavedEditValue.get("source_audio");
            if (sourceAudioChange == null) {
                sourceAudioChange = new SourceAudioChange(true);
            }
            this.mTempEditValue.put("source_audio", sourceAudioChange);
        }
        if (haveChange("edit_type_water_mark")) {
            WaterMark waterMark = (WaterMark) this.mSavedEditValue.get("edit_type_water_mark");
            if (waterMark == null) {
                waterMark = new WaterMark();
            }
            this.mTempEditValue.put("edit_type_water_mark", waterMark);
        }
        if (haveChange("edit_type_auto_water_mark_text")) {
            TextClip textClip = (TextClip) this.mSavedEditValue.get("edit_type_auto_water_mark_text");
            if (textClip == null) {
                textClip = new TextClip();
            }
            this.mTempEditValue.put("edit_type_auto_water_mark_text", textClip);
        }
        if (haveChange("edit_type_adjust")) {
            VideoEditorAdjust videoEditorAdjust = (VideoEditorAdjust) this.mSavedEditValue.get("edit_type_adjust");
            if (videoEditorAdjust == null) {
                videoEditorAdjust = new VideoEditorAdjust(false);
            }
            this.mTempEditValue.put("edit_type_adjust", videoEditorAdjust);
        }
        if (haveChange("edit_type_smart_effect_template")) {
            SmartEffectTemplate smartEffectTemplate = (SmartEffectTemplate) this.mSavedEditValue.get("edit_type_smart_effect_template");
            if (smartEffectTemplate == null) {
                smartEffectTemplate = new SmartEffectTemplate(null);
            }
            this.mTempEditValue.put("edit_type_smart_effect_template", smartEffectTemplate);
        }
    }

    public void resume() {
        if (this.mEngineState != 2) {
            StringBuilder sb = new StringBuilder();
            sb.append("resume is not allowed at EngineState :");
            sb.append(this.mEngineState);
            Log.e("NexVideoEditor", sb.toString());
        } else if (this.mEngin != null) {
            setEngineState(BaiduSceneResult.GARDEN);
            this.mEngin.resume();
        }
    }

    public void saveEditState() {
        this.mSavedEditValue.clear();
        this.mSavedEditValue.putAll(this.mApplyedEditValue);
    }

    public void seek(final int i, OnCompletedListener onCompletedListener) {
        this.seekOnCompletedListener = onCompletedListener;
        int i2 = this.mEngineState;
        if (i2 != 104) {
            switch (i2) {
                case 0:
                case 2:
                    break;
                case 1:
                    pause(new OnCompletedListener() {
                        public void onCompleted() {
                            NexVideoEditor.this.doSeek(i);
                        }
                    });
                    return;
                default:
                    StringBuilder sb = new StringBuilder();
                    sb.append("seek is not allowed at EngineState :");
                    sb.append(this.mEngineState);
                    Log.e("NexVideoEditor", sb.toString());
                    return;
            }
        }
        doSeek(i);
    }

    public boolean setAutoWaterMark(String str, int i) {
        this.mTempEditValue.put("edit_type_auto_water_mark_text", new TextClip(str, i));
        return false;
    }

    public void setBackgroundMusic(String str) {
        this.mTempEditValue.put("bg_audio", new BGMEdit(str));
    }

    /* access modifiers changed from: protected */
    public void setDisplayView(View view) {
        this.mEngin.setView((nexEngineView) view);
    }

    public void setFilter(Filter filter) {
        this.mTempEditValue.put("filter", new FilterEffect(filter));
    }

    public boolean setSmartEffectTemplate(SmartEffect smartEffect) {
        this.mTempEditValue.put("edit_type_smart_effect_template", new SmartEffectTemplate(smartEffect));
        return false;
    }

    public void setSourceAudioEnable(Boolean bool) {
        this.mTempEditValue.put("source_audio", new SourceAudioChange(bool.booleanValue()));
    }

    public void setTrimInfo(int i, int i2) {
        setTrimInfo(new TrimInfo(i, i2));
    }

    public void setVideoEditorAdjust(boolean z) {
        this.mApplyedEditValue.put("edit_type_adjust", new VideoEditorAdjust(z));
    }

    public boolean setWarterMark(int i, String str) {
        this.mTempEditValue.put("edit_type_water_mark", new WaterMark(i, str));
        return false;
    }

    public void startPreview() {
        startPreview(null);
    }

    public void startPreview(OnCompletedListener onCompletedListener) {
        int i = this.mEngineState;
        if ((i == 0 || i == 2) && this.mEngin != null) {
            int currentPlayTimeTime = this.mEngin.getCurrentPlayTimeTime();
            if (currentPlayTimeTime == 0) {
                currentPlayTimeTime = 100;
            }
            seek(currentPlayTimeTime, onCompletedListener);
        }
    }

    public void toThirdEditor(Context context) {
        if (this.mEngineState == 1 || this.mEngineState == 2 || this.mEngineState == 0) {
            try {
                if (this.mNexProject != null) {
                    try {
                        Intent makeKineMasterIntent = this.mNexProject.makeKineMasterIntent();
                        if (makeKineMasterIntent != null) {
                            context.startActivity(makeKineMasterIntent);
                            GallerySamplingStatHelper.recordCountEvent("video_editor", "video_editor_to_3rd_exitor");
                        }
                    } catch (Exception unused) {
                    }
                }
            } catch (ActivityNotFoundException unused2) {
                try {
                    context.startActivity(IntentUtil.makeMarketIntent("com.nexstreaming.app.kinemasterfree", true));
                    GallerySamplingStatHelper.recordCountEvent("video_editor", "video_editor_to_market");
                } catch (ActivityNotFoundException unused3) {
                    Log.e("NexVideoEditor", "no market found !!!!");
                }
            }
        }
    }
}
