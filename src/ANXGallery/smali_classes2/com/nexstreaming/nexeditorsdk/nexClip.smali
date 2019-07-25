.class public Lcom/nexstreaming/nexeditorsdk/nexClip;
.super Ljava/lang/Object;
.source "nexClip.java"

# interfaces
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/nexstreaming/nexeditorsdk/nexClip$OnGetAudioPcmLevelsResultListener;,
        Lcom/nexstreaming/nexeditorsdk/nexClip$OnGetVideoClipIDR2YOnlyThumbnailsListener;,
        Lcom/nexstreaming/nexeditorsdk/nexClip$OnGetVideoClipDetailThumbnailsListener;,
        Lcom/nexstreaming/nexeditorsdk/nexClip$OnLoadVideoClipThumbnailListener;,
        Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;
    }
.end annotation


# static fields
.field public static final AVC_Profile_Baseline:I = 0x42

.field public static final AVC_Profile_Extended:I = 0x58

.field public static final AVC_Profile_High:I = 0x64

.field public static final AVC_Profile_High10:I = 0x64

.field public static final AVC_Profile_High422:I = 0x7a

.field public static final AVC_Profile_High444:I = 0xf4

.field public static final AVC_Profile_Main:I = 0x4d

.field public static final AVC_Profile_Unknown:I = 0x0

.field public static final HDR_TYPE_10HLG:I = 0x12

.field public static final HDR_TYPE_10PQ:I = 0x10

.field private static final TAG:Ljava/lang/String; = "nexClip"

.field public static final kCLIP_Supported:I = 0x0

.field public static final kCLIP_TYPE_AUDIO:I = 0x3

.field public static final kCLIP_TYPE_IMAGE:I = 0x1

.field public static final kCLIP_TYPE_NONE:I = 0x0

.field public static final kCLIP_TYPE_VIDEO:I = 0x4

.field public static final kCLIP_VIDEORENDERMODE_360VIDE:I = 0x1

.field public static final kCLIP_VIDEORENDERMODE_NORMAL:I = 0x0

.field public static final kClip_NotSupported:I = 0xc

.field public static final kClip_NotSupported_AudioCodec:I = 0x2

.field public static final kClip_NotSupported_AudioProfile:I = 0x3

.field public static final kClip_NotSupported_Container:I = 0x4

.field public static final kClip_NotSupported_DurationTooShort:I = 0x6

.field public static final kClip_NotSupported_ResolutionTooHigh:I = 0x5

.field public static final kClip_NotSupported_ResolutionTooLow:I = 0x7

.field public static final kClip_NotSupported_VideoCodec:I = 0x9

.field public static final kClip_NotSupported_VideoFPS:I = 0xa

.field public static final kClip_NotSupported_VideoLevel:I = 0xb

.field public static final kClip_NotSupported_VideoProfile:I = 0x8

.field public static final kClip_Rotate_0:I = 0x0

.field public static final kClip_Rotate_180:I = 0xb4

.field public static final kClip_Rotate_270:I = 0x10e

.field public static final kClip_Rotate_90:I = 0x5a

.field public static final kClip_Supported_NeedFPSTranscoding:I = 0xe

.field public static final kClip_Supported_NeedResolutionTranscoding:I = 0xd

.field public static final kClip_Supported_Unknown:I = 0x1

.field private static sVideoClipDetailThumbnailsDiskLimitSize:J = 0x5f5e100L


# instance fields
.field private count:I

.field private index:I

.field private isMotionTrackedVideo:Z

.field private mAVSyncAudioStartTime:I

.field private mAudioEdit:Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;

.field private mAudioEnvelop:Lcom/nexstreaming/nexeditorsdk/nexAudioEnvelop;

.field private mAudioOnOff:Z

.field private mClipEffect:Lcom/nexstreaming/nexeditorsdk/nexClipEffect;

.field private mCollageDrawInfoID:Ljava/lang/String;

.field private mColorEffect:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

.field private mCrop:Lcom/nexstreaming/nexeditorsdk/nexCrop;

.field private mCustomLUT_A:I

.field private mCustomLUT_B:I

.field private mCustomLUT_Power:I

.field private mDrawInfos:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;",
            ">;"
        }
    .end annotation
.end field

.field protected mDuration:I

.field protected mEndTime:I

.field private mFaceDetected:I

.field private mFaceRect:Landroid/graphics/Rect;

.field private mFacedetectProcessed:Z

.field private mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

.field private mIsAssetResource:Z

.field private mMediaInfoUseCache:Z

.field private mObserver:Lcom/nexstreaming/nexeditorsdk/b;

.field private mOverlappedTransition:Z

.field private mPath:Ljava/lang/String;

.field private mProjectAttachment:Z

.field mPropertySlowVideoMode:Z

.field private mRotate:I

.field private transient mSingleThumbnail:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field protected mStartTime:I

.field private mTemplateAudioPos:I

.field private mTemplateEffectID:I

.field private mThumbnails:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/h;

.field protected mTitleEffectEndTime:I

.field protected mTitleEffectStartTime:I

.field private mTransCodingPath:Ljava/lang/String;

.field private mTransitionEffect:Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;

.field private mVideoEdit:Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

.field private mVignette:Z

.field private m_BGMVolume:I

.field private m_Brightness:I

.field private m_ClipVolume:I

.field private m_Contrast:I

.field private m_Saturation:I

.field private m_getThumbnailsFailed:Z

.field private transient m_gettingPcmData:Z

.field private m_gettingThumbnails:Z

.field private mediainfo:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;

.field private misMustDownSize:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>()V
    .locals 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mPath:Ljava/lang/String;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTransCodingPath:Ljava/lang/String;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mClipEffect:Lcom/nexstreaming/nexeditorsdk/nexClipEffect;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTransitionEffect:Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mSingleThumbnail:Ljava/lang/ref/WeakReference;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mThumbnails:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/h;

    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_gettingThumbnails:Z

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_getThumbnailsFailed:Z

    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mAudioOnOff:Z

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mFacedetectProcessed:Z

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mFaceDetected:I

    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    iput-object v3, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mFaceRect:Landroid/graphics/Rect;

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->index:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->count:I

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mAudioEnvelop:Lcom/nexstreaming/nexeditorsdk/nexAudioEnvelop;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mediainfo:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTemplateEffectID:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTemplateAudioPos:I

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mDrawInfos:Ljava/util/List;

    iput-boolean v2, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mOverlappedTransition:Z

    iput-boolean v2, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mMediaInfoUseCache:Z

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mStartTime:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mEndTime:I

    const/16 v0, 0x1770

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mDuration:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mCustomLUT_A:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mCustomLUT_B:I

    const v0, 0x186a0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mCustomLUT_Power:I

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexColorEffect;->NONE:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mColorEffect:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mAVSyncAudioStartTime:I

    const/16 v0, 0x64

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_ClipVolume:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_BGMVolume:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mRotate:I

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->isMotionTrackedVideo:Z

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mIsAssetResource:Z

    return-void
.end method

.method constructor <init>(Lcom/nexstreaming/nexeditorsdk/b;Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;)V
    .locals 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mPath:Ljava/lang/String;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTransCodingPath:Ljava/lang/String;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mClipEffect:Lcom/nexstreaming/nexeditorsdk/nexClipEffect;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTransitionEffect:Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mSingleThumbnail:Ljava/lang/ref/WeakReference;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mThumbnails:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/h;

    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_gettingThumbnails:Z

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_getThumbnailsFailed:Z

    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mAudioOnOff:Z

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mFacedetectProcessed:Z

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mFaceDetected:I

    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    iput-object v3, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mFaceRect:Landroid/graphics/Rect;

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->index:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->count:I

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mAudioEnvelop:Lcom/nexstreaming/nexeditorsdk/nexAudioEnvelop;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mediainfo:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTemplateEffectID:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTemplateAudioPos:I

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mDrawInfos:Ljava/util/List;

    iput-boolean v2, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mOverlappedTransition:Z

    iput-boolean v2, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mMediaInfoUseCache:Z

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mStartTime:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mEndTime:I

    const/16 v3, 0x1770

    iput v3, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mDuration:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mCustomLUT_A:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mCustomLUT_B:I

    const v3, 0x186a0

    iput v3, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mCustomLUT_Power:I

    sget-object v3, Lcom/nexstreaming/nexeditorsdk/nexColorEffect;->NONE:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    iput-object v3, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mColorEffect:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mAVSyncAudioStartTime:I

    const/16 v3, 0x64

    iput v3, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_ClipVolume:I

    iput v3, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_BGMVolume:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mRotate:I

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->isMotionTrackedVideo:Z

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mIsAssetResource:Z

    iget v1, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->m_BGMVolume:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_BGMVolume:I

    iget-object v1, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mPath:Ljava/lang/String;

    iput-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mPath:Ljava/lang/String;

    iget-object v1, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mTransCodingPath:Ljava/lang/String;

    iput-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTransCodingPath:Ljava/lang/String;

    iput-boolean v2, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mProjectAttachment:Z

    iget-object v1, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mClipEffect:Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexEffectOf;

    if-nez v1, :cond_0

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mClipEffect:Lcom/nexstreaming/nexeditorsdk/nexClipEffect;

    goto :goto_0

    :cond_0
    new-instance v1, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;

    iget-object v2, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mClipEffect:Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexEffectOf;

    invoke-direct {v1, v2}, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;-><init>(Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexEffectOf;)V

    iput-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mClipEffect:Lcom/nexstreaming/nexeditorsdk/nexClipEffect;

    :goto_0
    iget-object v1, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mTransitionEffect:Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexEffectOf;

    if-nez v1, :cond_1

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTransitionEffect:Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;

    goto :goto_1

    :cond_1
    new-instance v1, Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;

    iget-object v2, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mTransitionEffect:Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexEffectOf;

    invoke-direct {v1, p1, v2}, Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;-><init>(Lcom/nexstreaming/nexeditorsdk/b;Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexEffectOf;)V

    iput-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTransitionEffect:Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;

    :goto_1
    iget-boolean v1, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->misMustDownSize:Z

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->misMustDownSize:Z

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mObserver:Lcom/nexstreaming/nexeditorsdk/b;

    iget-boolean p1, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mAudioOnOff:Z

    iput-boolean p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mAudioOnOff:Z

    iget p1, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->m_Brightness:I

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_Brightness:I

    iget p1, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->m_Contrast:I

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_Contrast:I

    iget p1, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->m_Saturation:I

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_Saturation:I

    iget-boolean p1, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mVignette:Z

    iput-boolean p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mVignette:Z

    iget-boolean p1, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mFacedetectProcessed:Z

    iput-boolean p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mFacedetectProcessed:Z

    iget p1, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mFaceDetected:I

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mFaceDetected:I

    iget-object p1, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mFaceRect:Landroid/graphics/Rect;

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mFaceRect:Landroid/graphics/Rect;

    iget-object p1, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mCrop:Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;

    if-nez p1, :cond_2

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mCrop:Lcom/nexstreaming/nexeditorsdk/nexCrop;

    goto :goto_2

    :cond_2
    new-instance p1, Lcom/nexstreaming/nexeditorsdk/nexCrop;

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mPath:Ljava/lang/String;

    iget-object v2, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mCrop:Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;

    invoke-direct {p1, v1, v2}, Lcom/nexstreaming/nexeditorsdk/nexCrop;-><init>(Ljava/lang/String;Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;)V

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mCrop:Lcom/nexstreaming/nexeditorsdk/nexCrop;

    :goto_2
    iget p1, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mTitleEffectStartTime:I

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTitleEffectStartTime:I

    iget p1, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mTitleEffectEndTime:I

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTitleEffectStartTime:I

    iget-object p1, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mAudioEnvelop:Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexAudioEnvelopOf;

    if-nez p1, :cond_3

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mAudioEnvelop:Lcom/nexstreaming/nexeditorsdk/nexAudioEnvelop;

    goto :goto_3

    :cond_3
    new-instance p1, Lcom/nexstreaming/nexeditorsdk/nexAudioEnvelop;

    iget-object v1, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mAudioEnvelop:Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexAudioEnvelopOf;

    invoke-direct {p1, v1}, Lcom/nexstreaming/nexeditorsdk/nexAudioEnvelop;-><init>(Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexAudioEnvelopOf;)V

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mAudioEnvelop:Lcom/nexstreaming/nexeditorsdk/nexAudioEnvelop;

    :goto_3
    iget p1, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mTemplateEffectID:I

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTemplateEffectID:I

    iget-object p1, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mCollageDrawInfoID:Ljava/lang/String;

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mCollageDrawInfoID:Ljava/lang/String;

    iget p1, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mTemplateAudioPos:I

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTemplateAudioPos:I

    iget-object p1, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mDrawInfos:Ljava/util/List;

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mDrawInfos:Ljava/util/List;

    iget-boolean p1, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mOverlappedTransition:Z

    iput-boolean p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mOverlappedTransition:Z

    iget-boolean p1, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mMediaInfoUseCache:Z

    iput-boolean p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mMediaInfoUseCache:Z

    iget p1, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mStartTime:I

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mStartTime:I

    iget p1, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mEndTime:I

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mEndTime:I

    iget p1, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mDuration:I

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mDuration:I

    iget-object p1, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget p1, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mCustomLUT_A:I

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mCustomLUT_A:I

    iget p1, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mCustomLUT_B:I

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mCustomLUT_B:I

    iget p1, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mCustomLUT_Power:I

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mCustomLUT_Power:I

    iget p1, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mRotate:I

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mRotate:I

    iget-object p1, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mColorEffect:Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexColorEffectOf;

    if-nez p1, :cond_4

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mColorEffect:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    goto :goto_4

    :cond_4
    new-instance p1, Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    iget-object v1, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mColorEffect:Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexColorEffectOf;

    invoke-direct {p1, v1}, Lcom/nexstreaming/nexeditorsdk/nexColorEffect;-><init>(Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexColorEffectOf;)V

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mColorEffect:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    :goto_4
    iget-boolean p1, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mPropertySlowVideoMode:Z

    iput-boolean p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mPropertySlowVideoMode:Z

    iget p1, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mAVSyncAudioStartTime:I

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mAVSyncAudioStartTime:I

    iget p1, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->m_ClipVolume:I

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_ClipVolume:I

    iget p1, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->m_BGMVolume:I

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_BGMVolume:I

    iget-object p1, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mVideoEdit:Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexVideoClipEditOf;

    if-nez p1, :cond_5

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mVideoEdit:Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    goto :goto_5

    :cond_5
    new-instance p1, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    iget-object v1, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mVideoEdit:Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexVideoClipEditOf;

    invoke-direct {p1, p0, v1}, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;-><init>(Lcom/nexstreaming/nexeditorsdk/nexClip;Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexVideoClipEditOf;)V

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mVideoEdit:Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    :goto_5
    iget-object p1, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mAudioEdit:Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexAudioEditOf;

    if-nez p1, :cond_6

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mAudioEdit:Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;

    goto :goto_6

    :cond_6
    new-instance p1, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;

    iget-object p2, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mAudioEdit:Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexAudioEditOf;

    invoke-direct {p1, p0, p2}, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;-><init>(Lcom/nexstreaming/nexeditorsdk/nexClip;Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexAudioEditOf;)V

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mAudioEdit:Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;

    :goto_6
    return-void
.end method

.method protected constructor <init>(Lcom/nexstreaming/nexeditorsdk/nexClip;)V
    .locals 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mPath:Ljava/lang/String;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTransCodingPath:Ljava/lang/String;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mClipEffect:Lcom/nexstreaming/nexeditorsdk/nexClipEffect;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTransitionEffect:Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mSingleThumbnail:Ljava/lang/ref/WeakReference;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mThumbnails:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/h;

    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_gettingThumbnails:Z

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_getThumbnailsFailed:Z

    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mAudioOnOff:Z

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mFacedetectProcessed:Z

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mFaceDetected:I

    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    iput-object v3, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mFaceRect:Landroid/graphics/Rect;

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->index:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->count:I

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mAudioEnvelop:Lcom/nexstreaming/nexeditorsdk/nexAudioEnvelop;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mediainfo:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTemplateEffectID:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTemplateAudioPos:I

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mDrawInfos:Ljava/util/List;

    iput-boolean v2, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mOverlappedTransition:Z

    iput-boolean v2, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mMediaInfoUseCache:Z

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mStartTime:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mEndTime:I

    const/16 v0, 0x1770

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mDuration:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mCustomLUT_A:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mCustomLUT_B:I

    const v0, 0x186a0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mCustomLUT_Power:I

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexColorEffect;->NONE:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mColorEffect:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mAVSyncAudioStartTime:I

    const/16 v0, 0x64

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_ClipVolume:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_BGMVolume:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mRotate:I

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->isMotionTrackedVideo:Z

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mIsAssetResource:Z

    iget-object v0, p1, Lcom/nexstreaming/nexeditorsdk/nexClip;->mPath:Ljava/lang/String;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mPath:Ljava/lang/String;

    iget-object v0, p1, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTransCodingPath:Ljava/lang/String;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTransCodingPath:Ljava/lang/String;

    iget-boolean v0, p1, Lcom/nexstreaming/nexeditorsdk/nexClip;->misMustDownSize:Z

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->misMustDownSize:Z

    iget-boolean v0, p1, Lcom/nexstreaming/nexeditorsdk/nexClip;->mMediaInfoUseCache:Z

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mMediaInfoUseCache:Z

    iget-boolean v0, p1, Lcom/nexstreaming/nexeditorsdk/nexClip;->mPropertySlowVideoMode:Z

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mPropertySlowVideoMode:Z

    iget-object v0, p1, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    if-nez v0, :cond_0

    new-instance v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    invoke-direct {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;-><init>()V

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget-object v2, p1, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget-object v2, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mMimeType:Ljava/lang/String;

    iput-object v2, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mMimeType:Ljava/lang/String;

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget-object v2, p1, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v2, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mClipType:I

    iput v2, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mClipType:I

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget-object v2, p1, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v2, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mWidth:I

    iput v2, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mWidth:I

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget-object v2, p1, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v2, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mHeight:I

    iput v2, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mHeight:I

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget-object v2, p1, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v2, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mDisplayWidth:I

    iput v2, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mDisplayWidth:I

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget-object v2, p1, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v2, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mDisplayHeight:I

    iput v2, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mDisplayHeight:I

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget-object v2, p1, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget-boolean v2, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mExistVideo:Z

    iput-boolean v2, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mExistVideo:Z

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget-object v2, p1, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget-boolean v2, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mExistAudio:Z

    iput-boolean v2, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mExistAudio:Z

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget-object v2, p1, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v2, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mTotalTime:I

    iput v2, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mTotalTime:I

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget-object v2, p1, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v2, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mFramesPerSecond:I

    iput v2, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mFramesPerSecond:I

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget-object v2, p1, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v2, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mRotateDegreeInMeta:I

    iput v2, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mRotateDegreeInMeta:I

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget-object v2, p1, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v2, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mH264Profile:I

    iput v2, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mH264Profile:I

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget-object v2, p1, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v2, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mH264Level:I

    iput v2, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mH264Level:I

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget-object v2, p1, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v2, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mSuppertedResult:I

    iput v2, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mSuppertedResult:I

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget-object v2, p1, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v2, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mVideoBitrate:I

    iput v2, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mVideoBitrate:I

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget-object v2, p1, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v2, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mAudioBitrate:I

    iput v2, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mAudioBitrate:I

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget-object v2, p1, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v2, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mVideoTotalTime:I

    iput v2, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mVideoTotalTime:I

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget-object v2, p1, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v2, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mAudioTotalTime:I

    iput v2, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mAudioTotalTime:I

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget-object v2, p1, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v2, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mSeekPointCount:I

    iput v2, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mSeekPointCount:I

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget-object v2, p1, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v2, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mVideoRenderMode:I

    iput v2, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mVideoRenderMode:I

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget-object v2, p1, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v2, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mVideoHDRType:I

    iput v2, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mVideoHDRType:I

    iget-object v0, p1, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget-object v0, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mAudioCodecType:Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    new-instance v2, Ljava/lang/String;

    iget-object v3, p1, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget-object v3, v3, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mAudioCodecType:Ljava/lang/String;

    invoke-direct {v2, v3}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    iput-object v2, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mAudioCodecType:Ljava/lang/String;

    :cond_1
    iget-object v0, p1, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget-object v0, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mVideoCodecType:Ljava/lang/String;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    new-instance v2, Ljava/lang/String;

    iget-object v3, p1, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget-object v3, v3, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mVideoCodecType:Ljava/lang/String;

    invoke-direct {v2, v3}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    iput-object v2, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mVideoCodecType:Ljava/lang/String;

    :cond_2
    iget-object v0, p1, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget-object v0, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mVideoUUID:[B

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget-object v2, p1, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget-object v2, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mVideoUUID:[B

    array-length v2, v2

    new-array v2, v2, [B

    iput-object v2, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mVideoUUID:[B

    iget-object v0, p1, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget-object v0, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mVideoUUID:[B

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget-object v2, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mVideoUUID:[B

    iget-object v3, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget-object v3, v3, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mVideoUUID:[B

    array-length v3, v3

    invoke-static {v0, v1, v2, v1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_3
    iget-object v0, p1, Lcom/nexstreaming/nexeditorsdk/nexClip;->mediainfo:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;

    if-eqz v0, :cond_4

    iget-object p1, p1, Lcom/nexstreaming/nexeditorsdk/nexClip;->mediainfo:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mediainfo:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;

    :cond_4
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mPath:Ljava/lang/String;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTransCodingPath:Ljava/lang/String;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mClipEffect:Lcom/nexstreaming/nexeditorsdk/nexClipEffect;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTransitionEffect:Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mSingleThumbnail:Ljava/lang/ref/WeakReference;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mThumbnails:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/h;

    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_gettingThumbnails:Z

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_getThumbnailsFailed:Z

    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mAudioOnOff:Z

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mFacedetectProcessed:Z

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mFaceDetected:I

    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    iput-object v3, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mFaceRect:Landroid/graphics/Rect;

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->index:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->count:I

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mAudioEnvelop:Lcom/nexstreaming/nexeditorsdk/nexAudioEnvelop;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mediainfo:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTemplateEffectID:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTemplateAudioPos:I

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mDrawInfos:Ljava/util/List;

    iput-boolean v2, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mOverlappedTransition:Z

    iput-boolean v2, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mMediaInfoUseCache:Z

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mStartTime:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mEndTime:I

    const/16 v0, 0x1770

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mDuration:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mCustomLUT_A:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mCustomLUT_B:I

    const v0, 0x186a0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mCustomLUT_Power:I

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexColorEffect;->NONE:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mColorEffect:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mAVSyncAudioStartTime:I

    const/16 v0, 0x64

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_ClipVolume:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_BGMVolume:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mRotate:I

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->isMotionTrackedVideo:Z

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mIsAssetResource:Z

    const-string v0, "@assetItem:"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 v0, 0xb

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mPath:Ljava/lang/String;

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTransCodingPath:Ljava/lang/String;

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mMediaInfoUseCache:Z

    new-instance p1, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    invoke-direct {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;-><init>()V

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iput v2, p1, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mClipType:I

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mPath:Ljava/lang/String;

    invoke-static {p1}, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager;->getAssetPackageMediaOptions(Ljava/lang/String;)Landroid/graphics/Rect;

    move-result-object p1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v1

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mWidth:I

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result p1

    iput p1, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mHeight:I

    goto :goto_0

    :cond_0
    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mPath:Ljava/lang/String;

    invoke-static {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->transCodingPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTransCodingPath:Ljava/lang/String;

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTransCodingPath:Ljava/lang/String;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTransCodingPath:Ljava/lang/String;

    const-string v0, "@assetItem:"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mMediaInfoUseCache:Z

    new-instance p1, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    invoke-direct {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;-><init>()V

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iput v2, p1, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mClipType:I

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mPath:Ljava/lang/String;

    invoke-static {p1}, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager;->getAssetPackageMediaOptions(Ljava/lang/String;)Landroid/graphics/Rect;

    move-result-object p1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v1

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mWidth:I

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result p1

    iput p1, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mHeight:I

    return-void

    :cond_1
    iput-boolean v2, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mMediaInfoUseCache:Z

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getRealPath()Ljava/lang/String;

    move-result-object p1

    iget-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mMediaInfoUseCache:Z

    invoke-static {p1, v0}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->a(Ljava/lang/String;Z)Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setMediaInfo(Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;)I

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getRealPath()Ljava/lang/String;

    move-result-object p1

    iget-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mMediaInfoUseCache:Z

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getMediaInfo()Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;

    move-result-object v2

    invoke-static {p1, v0, v2, v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->resolveClip(Ljava/lang/String;ZLcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;Z)Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    move-result-object p1

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    :goto_0
    return-void
.end method

.method constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mPath:Ljava/lang/String;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTransCodingPath:Ljava/lang/String;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mClipEffect:Lcom/nexstreaming/nexeditorsdk/nexClipEffect;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTransitionEffect:Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mSingleThumbnail:Ljava/lang/ref/WeakReference;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mThumbnails:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/h;

    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_gettingThumbnails:Z

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_getThumbnailsFailed:Z

    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mAudioOnOff:Z

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mFacedetectProcessed:Z

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mFaceDetected:I

    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    iput-object v3, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mFaceRect:Landroid/graphics/Rect;

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->index:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->count:I

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mAudioEnvelop:Lcom/nexstreaming/nexeditorsdk/nexAudioEnvelop;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mediainfo:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTemplateEffectID:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTemplateAudioPos:I

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mDrawInfos:Ljava/util/List;

    iput-boolean v2, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mOverlappedTransition:Z

    iput-boolean v2, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mMediaInfoUseCache:Z

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mStartTime:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mEndTime:I

    const/16 v0, 0x1770

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mDuration:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mCustomLUT_A:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mCustomLUT_B:I

    const v0, 0x186a0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mCustomLUT_Power:I

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexColorEffect;->NONE:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mColorEffect:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mAVSyncAudioStartTime:I

    const/16 v0, 0x64

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_ClipVolume:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_BGMVolume:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mRotate:I

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->isMotionTrackedVideo:Z

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mIsAssetResource:Z

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mPath:Ljava/lang/String;

    iput-object p2, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTransCodingPath:Ljava/lang/String;

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mMediaInfoUseCache:Z

    new-instance p1, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    invoke-direct {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;-><init>()V

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iput v2, p1, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mClipType:I

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mPath:Ljava/lang/String;

    invoke-static {p1}, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager;->getAssetPackageMediaOptions(Ljava/lang/String;)Landroid/graphics/Rect;

    move-result-object p1

    iget-object p2, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v0

    iput v0, p2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mWidth:I

    iget-object p2, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result p1

    iput p1, p2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mHeight:I

    const-string p1, "nexClip"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "@assetItem: w="

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v0, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mWidth:I

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ", h="

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v0, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mHeight:I

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;ZLcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;)V
    .locals 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mPath:Ljava/lang/String;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTransCodingPath:Ljava/lang/String;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mClipEffect:Lcom/nexstreaming/nexeditorsdk/nexClipEffect;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTransitionEffect:Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mSingleThumbnail:Ljava/lang/ref/WeakReference;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mThumbnails:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/h;

    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_gettingThumbnails:Z

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_getThumbnailsFailed:Z

    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mAudioOnOff:Z

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mFacedetectProcessed:Z

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mFaceDetected:I

    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    iput-object v3, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mFaceRect:Landroid/graphics/Rect;

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->index:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->count:I

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mAudioEnvelop:Lcom/nexstreaming/nexeditorsdk/nexAudioEnvelop;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mediainfo:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTemplateEffectID:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTemplateAudioPos:I

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mDrawInfos:Ljava/util/List;

    iput-boolean v2, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mOverlappedTransition:Z

    iput-boolean v2, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mMediaInfoUseCache:Z

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mStartTime:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mEndTime:I

    const/16 v0, 0x1770

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mDuration:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mCustomLUT_A:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mCustomLUT_B:I

    const v0, 0x186a0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mCustomLUT_Power:I

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexColorEffect;->NONE:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mColorEffect:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mAVSyncAudioStartTime:I

    const/16 v0, 0x64

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_ClipVolume:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_BGMVolume:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mRotate:I

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->isMotionTrackedVideo:Z

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mIsAssetResource:Z

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mPath:Ljava/lang/String;

    iput-object p3, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    invoke-virtual {p1, p2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result p1

    if-eqz p1, :cond_0

    iput-object p2, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTransCodingPath:Ljava/lang/String;

    :cond_0
    iput-boolean p4, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mMediaInfoUseCache:Z

    if-eqz p5, :cond_1

    invoke-direct {p0, p5}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setMediaInfo(Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;)I

    goto :goto_0

    :cond_1
    iget-boolean p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mMediaInfoUseCache:Z

    invoke-static {p2, p1}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->a(Ljava/lang/String;Z)Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setMediaInfo(Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;)I

    :goto_0
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Z)V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p2, 0x0

    iput-object p2, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mPath:Ljava/lang/String;

    iput-object p2, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTransCodingPath:Ljava/lang/String;

    iput-object p2, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mClipEffect:Lcom/nexstreaming/nexeditorsdk/nexClipEffect;

    iput-object p2, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTransitionEffect:Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;

    iput-object p2, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mSingleThumbnail:Ljava/lang/ref/WeakReference;

    iput-object p2, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mThumbnails:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/h;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_gettingThumbnails:Z

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_getThumbnailsFailed:Z

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mAudioOnOff:Z

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mFacedetectProcessed:Z

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mFaceDetected:I

    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    iput-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mFaceRect:Landroid/graphics/Rect;

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->index:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->count:I

    iput-object p2, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mAudioEnvelop:Lcom/nexstreaming/nexeditorsdk/nexAudioEnvelop;

    iput-object p2, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mediainfo:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTemplateEffectID:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTemplateAudioPos:I

    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mDrawInfos:Ljava/util/List;

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mOverlappedTransition:Z

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mMediaInfoUseCache:Z

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mStartTime:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mEndTime:I

    const/16 p2, 0x1770

    iput p2, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mDuration:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mCustomLUT_A:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mCustomLUT_B:I

    const p2, 0x186a0

    iput p2, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mCustomLUT_Power:I

    sget-object p2, Lcom/nexstreaming/nexeditorsdk/nexColorEffect;->NONE:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    iput-object p2, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mColorEffect:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mAVSyncAudioStartTime:I

    const/16 p2, 0x64

    iput p2, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_ClipVolume:I

    iput p2, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_BGMVolume:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mRotate:I

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->isMotionTrackedVideo:Z

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mIsAssetResource:Z

    const-string p2, "@assetItem:"

    invoke-virtual {p1, p2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_0

    const/16 p2, 0xb

    invoke-virtual {p1, p2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mPath:Ljava/lang/String;

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTransCodingPath:Ljava/lang/String;

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mMediaInfoUseCache:Z

    new-instance p1, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    invoke-direct {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;-><init>()V

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iput v1, p1, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mClipType:I

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mPath:Ljava/lang/String;

    invoke-static {p1}, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager;->getAssetPackageMediaOptions(Ljava/lang/String;)Landroid/graphics/Rect;

    move-result-object p1

    iget-object p2, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v0

    iput v0, p2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mWidth:I

    iget-object p2, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result p1

    iput p1, p2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mHeight:I

    goto :goto_0

    :cond_0
    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mPath:Ljava/lang/String;

    invoke-static {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->transCodingPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTransCodingPath:Ljava/lang/String;

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTransCodingPath:Ljava/lang/String;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTransCodingPath:Ljava/lang/String;

    const-string p2, "@assetItem:"

    invoke-virtual {p1, p2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mMediaInfoUseCache:Z

    new-instance p1, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    invoke-direct {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;-><init>()V

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iput v1, p1, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mClipType:I

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mPath:Ljava/lang/String;

    invoke-static {p1}, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager;->getAssetPackageMediaOptions(Ljava/lang/String;)Landroid/graphics/Rect;

    move-result-object p1

    iget-object p2, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v0

    iput v0, p2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mWidth:I

    iget-object p2, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result p1

    iput p1, p2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mHeight:I

    return-void

    :cond_1
    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mMediaInfoUseCache:Z

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getRealPath()Ljava/lang/String;

    move-result-object p1

    iget-boolean p2, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mMediaInfoUseCache:Z

    invoke-static {p1, p2}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->a(Ljava/lang/String;Z)Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setMediaInfo(Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;)I

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getRealPath()Ljava/lang/String;

    move-result-object p1

    iget-boolean p2, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mMediaInfoUseCache:Z

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getMediaInfo()Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;

    move-result-object v1

    invoke-static {p1, p2, v1, v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->resolveClip(Ljava/lang/String;ZLcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;Z)Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    move-result-object p1

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    :goto_0
    return-void
.end method

.method static synthetic access$002(Lcom/nexstreaming/nexeditorsdk/nexClip;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_gettingThumbnails:Z

    return p1
.end method

.method static synthetic access$100(Lcom/nexstreaming/nexeditorsdk/nexClip;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_getThumbnailsFailed:Z

    return p0
.end method

.method static synthetic access$102(Lcom/nexstreaming/nexeditorsdk/nexClip;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_getThumbnailsFailed:Z

    return p1
.end method

.method static synthetic access$202(Lcom/nexstreaming/nexeditorsdk/nexClip;Lcom/nexstreaming/kminternal/kinemaster/mediainfo/h;)Lcom/nexstreaming/kminternal/kinemaster/mediainfo/h;
    .locals 0

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mThumbnails:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/h;

    return-object p1
.end method

.method static synthetic access$300(Lcom/nexstreaming/nexeditorsdk/nexClip;[III)I
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getIndexSeekTabNearTimeStamp([III)I

    move-result p0

    return p0
.end method

.method static synthetic access$402(Lcom/nexstreaming/nexeditorsdk/nexClip;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_gettingPcmData:Z

    return p1
.end method

.method public static cancelThumbnails()Z
    .locals 1

    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->a()Z

    move-result v0

    return v0
.end method

.method protected static clone(Lcom/nexstreaming/nexeditorsdk/nexClip;)Lcom/nexstreaming/nexeditorsdk/nexClip;
    .locals 2

    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/nexstreaming/nexeditorsdk/nexClip;
    :try_end_0
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_0} :catch_1

    :try_start_1
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mClipEffect:Lcom/nexstreaming/nexeditorsdk/nexClipEffect;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mClipEffect:Lcom/nexstreaming/nexeditorsdk/nexClipEffect;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->clone(Lcom/nexstreaming/nexeditorsdk/nexClipEffect;)Lcom/nexstreaming/nexeditorsdk/nexClipEffect;

    move-result-object v0

    iput-object v0, v1, Lcom/nexstreaming/nexeditorsdk/nexClip;->mClipEffect:Lcom/nexstreaming/nexeditorsdk/nexClipEffect;

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTransitionEffect:Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTransitionEffect:Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;->clone(Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;)Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;

    move-result-object v0

    iput-object v0, v1, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTransitionEffect:Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;

    :cond_1
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mCrop:Lcom/nexstreaming/nexeditorsdk/nexCrop;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mCrop:Lcom/nexstreaming/nexeditorsdk/nexCrop;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->clone(Lcom/nexstreaming/nexeditorsdk/nexCrop;)Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v0

    iput-object v0, v1, Lcom/nexstreaming/nexeditorsdk/nexClip;->mCrop:Lcom/nexstreaming/nexeditorsdk/nexCrop;

    :cond_2
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mVideoEdit:Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mVideoEdit:Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;->clone(Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;)Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    move-result-object v0

    iput-object v0, v1, Lcom/nexstreaming/nexeditorsdk/nexClip;->mVideoEdit:Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    :cond_3
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mColorEffect:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mColorEffect:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexColorEffect;->clone(Lcom/nexstreaming/nexeditorsdk/nexColorEffect;)Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    move-result-object v0

    iput-object v0, v1, Lcom/nexstreaming/nexeditorsdk/nexClip;->mColorEffect:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    :cond_4
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->clone(Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;)Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    move-result-object v0

    iput-object v0, v1, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    :cond_5
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mAudioEnvelop:Lcom/nexstreaming/nexeditorsdk/nexAudioEnvelop;

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mAudioEnvelop:Lcom/nexstreaming/nexeditorsdk/nexAudioEnvelop;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexAudioEnvelop;->clone(Lcom/nexstreaming/nexeditorsdk/nexAudioEnvelop;)Lcom/nexstreaming/nexeditorsdk/nexAudioEnvelop;

    move-result-object v0

    iput-object v0, v1, Lcom/nexstreaming/nexeditorsdk/nexClip;->mAudioEnvelop:Lcom/nexstreaming/nexeditorsdk/nexAudioEnvelop;

    :cond_6
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mAudioEdit:Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mAudioEdit:Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;

    invoke-static {v1, v0}, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->clone(Lcom/nexstreaming/nexeditorsdk/nexClip;Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;)Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;

    move-result-object v0

    iput-object v0, v1, Lcom/nexstreaming/nexeditorsdk/nexClip;->mAudioEdit:Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;

    :cond_7
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTransCodingPath:Ljava/lang/String;

    iput-object v0, v1, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTransCodingPath:Ljava/lang/String;

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mSingleThumbnail:Ljava/lang/ref/WeakReference;

    iput-object v0, v1, Lcom/nexstreaming/nexeditorsdk/nexClip;->mSingleThumbnail:Ljava/lang/ref/WeakReference;

    iget-object p0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mThumbnails:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/h;

    iput-object p0, v1, Lcom/nexstreaming/nexeditorsdk/nexClip;->mThumbnails:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/h;
    :try_end_1
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    :catch_0
    move-exception p0

    goto :goto_0

    :catch_1
    move-exception p0

    move-object v1, v0

    :goto_0
    invoke-virtual {p0}, Ljava/lang/CloneNotSupportedException;->printStackTrace()V

    :goto_1
    return-object v1
.end method

.method public static dup(Lcom/nexstreaming/nexeditorsdk/nexClip;)Lcom/nexstreaming/nexeditorsdk/nexClip;
    .locals 1

    new-instance v0, Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-direct {v0, p0}, Lcom/nexstreaming/nexeditorsdk/nexClip;-><init>(Lcom/nexstreaming/nexeditorsdk/nexClip;)V

    return-object v0
.end method

.method private getIndexSeekTabNearTimeStamp([III)I
    .locals 2

    :goto_0
    array-length v0, p1

    if-ge p2, v0, :cond_4

    aget v0, p1, p2

    if-ne v0, p3, :cond_0

    return p2

    :cond_0
    aget v0, p1, p2

    if-le v0, p3, :cond_3

    if-nez p2, :cond_1

    return p2

    :cond_1
    aget v0, p1, p2

    sub-int/2addr v0, p3

    add-int/lit8 v1, p2, -0x1

    aget p1, p1, v1

    sub-int/2addr p3, p1

    if-le v0, p3, :cond_2

    return v1

    :cond_2
    return p2

    :cond_3
    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_4
    array-length p3, p1

    if-lt p2, p3, :cond_5

    array-length p1, p1

    add-int/lit8 p1, p1, -0x1

    return p1

    :cond_5
    const/4 p1, -0x1

    return p1
.end method

.method public static getSolidClip(I)Lcom/nexstreaming/nexeditorsdk/nexClip;
    .locals 3

    const-string v0, "@solid:%08X.jpg"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    const/4 v2, 0x0

    aput-object p0, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getSolidClip(Ljava/lang/String;)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object p0

    return-object p0
.end method

.method private static getSolidClip(Ljava/lang/String;)Lcom/nexstreaming/nexeditorsdk/nexClip;
    .locals 2

    new-instance v0, Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-direct {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;-><init>()V

    iput-object p0, v0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mPath:Ljava/lang/String;

    new-instance p0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    invoke-direct {p0}, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;-><init>()V

    iput-object p0, v0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget-object p0, v0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    const/4 v1, 0x1

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mClipType:I

    iget-object p0, v0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    const/16 v1, 0x20

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mWidth:I

    iget-object p0, v0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    const/16 v1, 0x12

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mHeight:I

    return-object v0
.end method

.method public static getSupportedClip(Ljava/lang/String;)Lcom/nexstreaming/nexeditorsdk/nexClip;
    .locals 1

    const/4 v0, 0x1

    invoke-static {p0, v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getSupportedClip(Ljava/lang/String;Z)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object p0

    return-object p0
.end method

.method public static getSupportedClip(Ljava/lang/String;Z)Lcom/nexstreaming/nexeditorsdk/nexClip;
    .locals 1

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getSupportedClip(Ljava/lang/String;ZI)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object p0

    return-object p0
.end method

.method public static getSupportedClip(Ljava/lang/String;ZI)Lcom/nexstreaming/nexeditorsdk/nexClip;
    .locals 1

    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getSupportedClip(Ljava/lang/String;ZIZ)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object p0

    return-object p0
.end method

.method public static getSupportedClip(Ljava/lang/String;ZIZ)Lcom/nexstreaming/nexeditorsdk/nexClip;
    .locals 8

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    :cond_0
    const-string v1, "@solid:"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-static {p0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getSolidClip(Ljava/lang/String;)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object p0

    return-object p0

    :cond_1
    const-string v1, "@assetItem:"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    new-instance p1, Lcom/nexstreaming/nexeditorsdk/nexClip;

    const/16 p2, 0xb

    invoke-virtual {p0, p2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2, p0}, Lcom/nexstreaming/nexeditorsdk/nexClip;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object p1

    :cond_2
    invoke-static {p0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->transCodingPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_3

    move-object v4, p0

    goto :goto_0

    :cond_3
    move-object v4, v1

    :goto_0
    const-string v1, "@assetItem:"

    invoke-virtual {v4, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    new-instance p1, Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-direct {p1, p0, v4}, Lcom/nexstreaming/nexeditorsdk/nexClip;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object p1

    :cond_4
    invoke-static {v4, p1}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->a(Ljava/lang/String;Z)Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;

    move-result-object v7

    invoke-static {v4, p1, v7, p3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->resolveClip(Ljava/lang/String;ZLcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;Z)Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    move-result-object v5

    iget p3, v5, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mSuppertedResult:I

    if-nez p3, :cond_a

    iget p3, v5, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mClipType:I

    const/4 v1, 0x1

    if-ne p3, v1, :cond_5

    new-instance p2, Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-object v2, p2

    move-object v3, p0

    move v6, p1

    invoke-direct/range {v2 .. v7}, Lcom/nexstreaming/nexeditorsdk/nexClip;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;ZLcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;)V

    return-object p2

    :cond_5
    iget p3, v5, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mClipType:I

    const/4 v1, 0x4

    if-ne p3, v1, :cond_9

    if-lez p2, :cond_8

    iget p3, v5, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mWidth:I

    iget v1, v5, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mHeight:I

    mul-int p3, p3, v1

    iget v1, v5, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mFramesPerSecond:I

    mul-int p3, p3, v1

    if-le p3, p2, :cond_8

    const-string p2, "Xiaomi"

    const-string p3, "LGE"

    invoke-virtual {p2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_7

    iget-boolean p2, v5, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mExistAudio:Z

    if-eqz p2, :cond_6

    iget-object p2, v5, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mAudioCodecType:Ljava/lang/String;

    const-string p3, "aac"

    invoke-virtual {p2, p3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_6

    return-object v0

    :cond_6
    new-instance p2, Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-object v2, p2

    move-object v3, p0

    move v6, p1

    invoke-direct/range {v2 .. v7}, Lcom/nexstreaming/nexeditorsdk/nexClip;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;ZLcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;)V

    return-object p2

    :cond_7
    return-object v0

    :cond_8
    new-instance p2, Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-object v2, p2

    move-object v3, p0

    move v6, p1

    invoke-direct/range {v2 .. v7}, Lcom/nexstreaming/nexeditorsdk/nexClip;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;ZLcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;)V

    return-object p2

    :cond_9
    iget p2, v5, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mClipType:I

    const/4 p3, 0x3

    if-ne p2, p3, :cond_a

    new-instance p2, Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-object v2, p2

    move-object v3, p0

    move v6, p1

    invoke-direct/range {v2 .. v7}, Lcom/nexstreaming/nexeditorsdk/nexClip;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;ZLcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;)V

    return-object p2

    :cond_a
    iget p0, v5, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mSuppertedResult:I

    const/16 p1, 0xd

    if-eq p0, p1, :cond_b

    iget p0, v5, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mSuppertedResult:I

    :cond_b
    return-object v0
.end method

.method private makeThumbnail(FF)Landroid/graphics/Bitmap;
    .locals 9

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v0, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mClipType:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_3

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->isSolid()Z

    move-result v0

    const/high16 v3, 0x42c80000    # 100.0f

    const/4 v4, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mPath:Ljava/lang/String;

    const/4 v5, 0x7

    const/16 v6, 0xf

    invoke-virtual {v0, v5, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    const/16 v5, 0x10

    invoke-static {v0, v5}, Ljava/lang/Long;->parseLong(Ljava/lang/String;I)J

    move-result-wide v5

    long-to-int v0, v5

    const/16 v5, 0x20

    const/16 v6, 0x12

    const/16 v7, 0x240

    new-array v7, v7, [I

    :goto_0
    array-length v8, v7

    if-ge v4, v8, :cond_0

    aput v0, v7, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_0
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v7, v5, v6, v0}, Landroid/graphics/Bitmap;->createBitmap([IIILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    goto :goto_1

    :cond_1
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    iput-boolean v2, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    iget-object v5, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mPath:Ljava/lang/String;

    invoke-static {v5, v0}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    iput-boolean v4, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    mul-float v4, p2, v3

    float-to-int v4, v4

    iget v5, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    int-to-float v5, v5

    iget v0, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    int-to-float v0, v0

    div-float/2addr v5, v0

    mul-float v5, v5, p1

    float-to-int v0, v5

    invoke-static {v4, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    float-to-int v4, p1

    iget-object v5, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mPath:Ljava/lang/String;

    mul-int/lit8 v0, v0, 0x2

    mul-int/lit8 v4, v4, 0x2

    invoke-static {v5, v0, v4}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->loadBitmap(Ljava/lang/String;II)Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$b;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$b;->a()Landroid/graphics/Bitmap;

    move-result-object v0

    :goto_1
    if-eqz v0, :cond_2

    mul-float p2, p2, v3

    float-to-int p2, p2

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    int-to-float v3, v3

    div-float/2addr v1, v3

    mul-float v1, v1, p1

    float-to-int v1, v1

    invoke-static {p2, v1}, Ljava/lang/Math;->min(II)I

    move-result p2

    float-to-int p1, p1

    invoke-static {v0, p2, p1, v2}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object p1

    return-object p1

    :cond_2
    return-object v1

    :cond_3
    return-object v1
.end method

.method private static resolveClip(Ljava/lang/String;ZLcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;Z)Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;
    .locals 22

    move-object/from16 v0, p0

    new-instance v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    invoke-direct {v2}, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;-><init>()V

    invoke-static/range {p0 .. p0}, Lcom/nexstreaming/app/common/util/FileType;->fromFile(Ljava/lang/String;)Lcom/nexstreaming/app/common/util/FileType;

    move-result-object v3

    const/4 v4, 0x7

    const/16 v5, 0x8

    const/4 v6, 0x6

    const/4 v7, 0x3

    const/16 v8, 0xc

    const/4 v9, 0x1

    const/4 v10, 0x0

    if-eqz v3, :cond_a

    invoke-virtual {v3}, Lcom/nexstreaming/app/common/util/FileType;->isImage()Z

    move-result v11

    if-eqz v11, :cond_a

    invoke-virtual {v3}, Lcom/nexstreaming/app/common/util/FileType;->isSupportedFormat()Z

    move-result v3

    if-nez v3, :cond_0

    iput v8, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mSuppertedResult:I

    iput v9, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mClipType:I

    return-object v2

    :cond_0
    new-instance v3, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v3}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    if-eqz p3, :cond_1

    iput-boolean v10, v3, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    const/16 v11, 0x10

    iput v11, v3, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    goto :goto_0

    :cond_1
    iput-boolean v9, v3, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    :goto_0
    invoke-static {v0, v3}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v11

    iget v12, v3, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    iput v12, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mWidth:I

    iget v3, v3, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    iput v3, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mHeight:I

    if-eqz p3, :cond_2

    if-nez v11, :cond_2

    iput v10, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mClipType:I

    iput v8, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mSuppertedResult:I

    const-string v1, "nexClip"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "error : Image file="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " decode fail!"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    :cond_2
    iget v1, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mWidth:I

    if-le v1, v9, :cond_4

    iget v1, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mHeight:I

    if-gt v1, v9, :cond_3

    goto :goto_1

    :cond_3
    iput v9, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mClipType:I

    iput v10, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mSuppertedResult:I

    goto :goto_2

    :cond_4
    :goto_1
    iput v10, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mClipType:I

    iput v4, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mSuppertedResult:I

    const-string v1, "nexClip"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "error : Image file="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " decoded resolution is too low!"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_2
    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    const-string v3, ".jpeg"

    invoke-virtual {v1, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_6

    const-string v3, ".jpg"

    invoke-virtual {v1, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5

    goto :goto_3

    :catch_0
    :cond_5
    const/4 v0, 0x0

    goto :goto_4

    :cond_6
    :goto_3
    :try_start_0
    new-instance v1, Landroid/media/ExifInterface;

    invoke-direct {v1, v0}, Landroid/media/ExifInterface;-><init>(Ljava/lang/String;)V

    const-string v0, "Orientation"

    invoke-virtual {v1, v0, v10}, Landroid/media/ExifInterface;->getAttributeInt(Ljava/lang/String;I)I

    move-result v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_4
    if-eq v0, v7, :cond_9

    if-eq v0, v6, :cond_8

    if-eq v0, v5, :cond_7

    iput v10, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mRotateDegreeInMeta:I

    goto/16 :goto_b

    :cond_7
    const/16 v0, 0x10e

    iput v0, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mRotateDegreeInMeta:I

    goto/16 :goto_b

    :cond_8
    const/16 v0, 0x5a

    iput v0, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mRotateDegreeInMeta:I

    goto/16 :goto_b

    :cond_9
    const/16 v0, 0xb4

    iput v0, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mRotateDegreeInMeta:I

    goto/16 :goto_b

    :cond_a
    if-nez p2, :cond_b

    invoke-static/range {p0 .. p1}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->a(Ljava/lang/String;Z)Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;

    move-result-object v0

    goto :goto_5

    :cond_b
    move-object/from16 v0, p2

    :goto_5
    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->j()I

    move-result v1

    const/4 v3, -0x1

    const/4 v11, 0x5

    const/4 v12, 0x4

    if-ne v1, v3, :cond_c

    iput v9, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mSuppertedResult:I

    goto :goto_6

    :cond_c
    const/4 v3, -0x2

    if-ne v1, v3, :cond_d

    const/4 v1, 0x2

    iput v1, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mSuppertedResult:I

    goto :goto_6

    :cond_d
    const/4 v3, -0x3

    if-ne v1, v3, :cond_e

    iput v7, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mSuppertedResult:I

    goto :goto_6

    :cond_e
    const/4 v3, -0x4

    if-ne v1, v3, :cond_f

    iput v12, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mSuppertedResult:I

    goto :goto_6

    :cond_f
    const/4 v3, -0x5

    if-ne v1, v3, :cond_10

    iput v11, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mSuppertedResult:I

    goto :goto_6

    :cond_10
    const/4 v3, -0x6

    if-ne v1, v3, :cond_11

    iput v6, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mSuppertedResult:I

    goto :goto_6

    :cond_11
    const/4 v3, -0x7

    if-ne v1, v3, :cond_12

    iput v4, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mSuppertedResult:I

    goto :goto_6

    :cond_12
    const/4 v3, -0x8

    if-ne v1, v3, :cond_13

    iput v5, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mSuppertedResult:I

    goto :goto_6

    :cond_13
    const/16 v3, -0x9

    if-ne v1, v3, :cond_14

    const/16 v1, 0x9

    iput v1, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mSuppertedResult:I

    goto :goto_6

    :cond_14
    const/16 v3, -0xa

    if-ne v1, v3, :cond_15

    const/16 v1, 0xa

    iput v1, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mSuppertedResult:I

    goto :goto_6

    :cond_15
    const/16 v3, -0xb

    if-ne v1, v3, :cond_16

    const/16 v1, 0xb

    iput v1, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mSuppertedResult:I

    goto :goto_6

    :cond_16
    const/16 v3, -0xc

    if-ne v1, v3, :cond_17

    iput v8, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mSuppertedResult:I

    goto :goto_6

    :cond_17
    iput v10, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mSuppertedResult:I

    :goto_6
    iget-boolean v1, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mExistVideo:Z

    if-eqz v1, :cond_18

    iget v1, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mSuppertedResult:I

    if-ne v1, v9, :cond_18

    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/config/EditorGlobal;->a()Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    move-result-object v1

    if-eqz v1, :cond_18

    invoke-virtual {v1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->j()Lcom/nexstreaming/kminternal/nexvideoeditor/d;

    move-result-object v13

    if-eqz v13, :cond_18

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u()I

    move-result v14

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->v()I

    move-result v15

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->n()I

    move-result v16

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->o()I

    move-result v17

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->s()I

    move-result v18

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->w()I

    move-result v19

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->y()I

    move-result v20

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->z()I

    move-result v21

    invoke-virtual/range {v13 .. v21}, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->a(IIIIIIII)I

    move-result v1

    packed-switch v1, :pswitch_data_0

    goto :goto_7

    :pswitch_0
    iput v11, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mSuppertedResult:I

    goto :goto_7

    :pswitch_1
    iput v5, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mSuppertedResult:I

    goto :goto_7

    :pswitch_2
    const/16 v1, 0xe

    iput v1, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mSuppertedResult:I

    goto :goto_7

    :pswitch_3
    const/16 v1, 0xd

    iput v1, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mSuppertedResult:I

    goto :goto_7

    :pswitch_4
    iput v10, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mSuppertedResult:I

    :cond_18
    :goto_7
    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->t()I

    move-result v1

    iput v1, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mRotateDegreeInMeta:I

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->v()I

    move-result v1

    iput v1, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mH264Level:I

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u()I

    move-result v1

    iput v1, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mH264Profile:I

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->s()I

    move-result v1

    iput v1, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mFramesPerSecond:I

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->l()Z

    move-result v1

    iput-boolean v1, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mExistAudio:Z

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->m()Z

    move-result v1

    iput-boolean v1, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mExistVideo:Z

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->p()I

    move-result v1

    iput v1, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mTotalTime:I

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->r()I

    move-result v1

    iput v1, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mVideoTotalTime:I

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->q()I

    move-result v1

    iput v1, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mAudioTotalTime:I

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->f()I

    move-result v1

    iput v1, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mSeekPointCount:I

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->A()I

    move-result v1

    iput v1, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mVideoRenderMode:I

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->D()I

    move-result v1

    iput v1, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mVideoHDRType:I

    iget-boolean v1, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mExistVideo:Z

    if-eqz v1, :cond_19

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->B()I

    move-result v1

    invoke-static {v1}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/nexCodecType;->fromValue(I)Lcom/nexstreaming/kminternal/kinemaster/mediainfo/nexCodecType;

    move-result-object v1

    invoke-virtual {v1}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/nexCodecType;->getType()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mVideoCodecType:Ljava/lang/String;

    goto :goto_8

    :cond_19
    const-string v1, "none"

    iput-object v1, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mVideoCodecType:Ljava/lang/String;

    :goto_8
    iget-boolean v1, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mExistAudio:Z

    if-eqz v1, :cond_1a

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->C()I

    move-result v1

    invoke-static {v1}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/nexCodecType;->fromValue(I)Lcom/nexstreaming/kminternal/kinemaster/mediainfo/nexCodecType;

    move-result-object v1

    invoke-virtual {v1}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/nexCodecType;->getType()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mAudioCodecType:Ljava/lang/String;

    goto :goto_9

    :cond_1a
    const-string v1, "none"

    iput-object v1, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mAudioCodecType:Ljava/lang/String;

    :goto_9
    iget-boolean v1, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mExistVideo:Z

    if-eqz v1, :cond_1f

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->n()I

    move-result v1

    iput v1, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mWidth:I

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->o()I

    move-result v1

    iput v1, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mHeight:I

    iput v12, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mClipType:I

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->w()I

    move-result v1

    iput v1, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mVideoBitrate:I

    iget v1, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mAudioTotalTime:I

    iget v3, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mVideoTotalTime:I

    sub-int/2addr v1, v3

    const/16 v3, 0xc8

    if-gt v1, v3, :cond_1b

    const/16 v3, -0xc8

    if-ge v1, v3, :cond_1c

    :cond_1b
    const-string v3, "nexClip"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "AudioTotalTime="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v5, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mAudioTotalTime:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, ", VideoTotalTime="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v5, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mVideoTotalTime:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, ", diff="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1c
    iget v3, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mTotalTime:I

    if-nez v3, :cond_1d

    iget v3, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mVideoTotalTime:I

    iput v3, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mTotalTime:I

    :cond_1d
    if-lez v1, :cond_1e

    const-string v1, "nexClip"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "different video and audio TotalTime. TotalTime("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v4, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mTotalTime:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, ") was set videoTotalTime="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v4, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mVideoTotalTime:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    iget v1, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mVideoTotalTime:I

    iput v1, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mTotalTime:I

    :cond_1e
    iget-boolean v1, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mExistAudio:Z

    if-eqz v1, :cond_20

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->x()I

    move-result v0

    iput v0, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mAudioBitrate:I

    goto :goto_a

    :cond_1f
    iget-boolean v1, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mExistAudio:Z

    if-eqz v1, :cond_20

    iput v7, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mClipType:I

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->x()I

    move-result v0

    iput v0, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mAudioBitrate:I

    :cond_20
    :goto_a
    iget v0, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mTotalTime:I

    if-gez v0, :cond_21

    iput v6, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mSuppertedResult:I

    :cond_21
    :goto_b
    return-object v2

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private setMediaInfo(Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;)I
    .locals 0

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mediainfo:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;

    const/4 p1, 0x1

    return p1
.end method

.method public static setThumbTempDir(Ljava/lang/String;)V
    .locals 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    if-nez p0, :cond_0

    const/4 p0, 0x0

    invoke-static {p0}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->a(Ljava/io/File;)V

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-static {v0}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->a(Ljava/io/File;)V

    goto :goto_0

    :cond_1
    const-string v0, "nexClip"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setThumbTempDir not dir="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return-void
.end method

.method public static setVideoClipDetailThumbnailsDiskLimit(J)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    sput-wide p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->sVideoClipDetailThumbnailsDiskLimitSize:J

    return-void
.end method

.method private static transCodingPath(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    const/4 v0, 0x0

    if-nez p0, :cond_0

    const-string p0, "nexClip"

    const-string v1, "transCodingPath path null"

    invoke-static {p0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-object v0

    :cond_0
    const-string v1, "nexasset://"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    const-string p0, "nexClip"

    const-string v1, "transCodingPath path asset"

    invoke-static {p0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-object v0

    :cond_1
    const-string v1, "@solid:"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    const-string p0, "nexClip"

    const-string v1, "transCodingPath path solid"

    invoke-static {p0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-object v0

    :cond_2
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->isFile()Z

    move-result v1

    if-eqz v1, :cond_3

    const-string p0, "nexClip"

    const-string v1, "transCodingPath path is file"

    invoke-static {p0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-object v0

    :cond_3
    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/config/a;->a()Lcom/nexstreaming/kminternal/kinemaster/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/kinemaster/config/a;->b()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager;->getAssetPackageMediaPath(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public ableToDecoding()Z
    .locals 5

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->hasVideo()Z

    move-result v0

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->hasAudio()Z

    move-result v1

    const/4 v2, 0x1

    if-nez v0, :cond_0

    if-nez v1, :cond_0

    const-string v0, "nexClip"

    const-string v1, "ableToDecoding video not found!"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v2

    :cond_0
    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getMediaInfo()Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;

    move-result-object v3

    const/4 v4, 0x0

    if-nez v3, :cond_1

    const-string v0, "nexClip"

    const-string v1, "ableToDecoding getMediaInfo fail!"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v4

    :cond_1
    invoke-virtual {v3, v0, v1}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->a(ZZ)Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    move-result-object v0

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->NONE:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    if-ne v0, v1, :cond_2

    return v2

    :cond_2
    const-string v1, "nexClip"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ableToDecoding fail!="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v4
.end method

.method addDrawInfo(Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;)V
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mDrawInfos:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method addDrawInfos(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;",
            ">;)V"
        }
    .end annotation

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mDrawInfos:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    return-void
.end method

.method clearDrawInfos()V
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mDrawInfos:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    return-void
.end method

.method public getAVCLevel()I
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v0, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mH264Level:I

    return v0
.end method

.method public getAVCProfile()I
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v0, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mH264Profile:I

    return v0
.end method

.method public getAVSyncTime()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mAVSyncAudioStartTime:I

    return v0
.end method

.method protected final getAttachmentState()Z
    .locals 1

    iget-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mProjectAttachment:Z

    return v0
.end method

.method public getAudioBitrate()I
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v0, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mAudioBitrate:I

    return v0
.end method

.method public getAudioCodecType()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget-object v0, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mAudioCodecType:Ljava/lang/String;

    return-object v0
.end method

.method public getAudioDuration()I
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v0, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mAudioTotalTime:I

    return v0
.end method

.method public getAudioEdit()Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;
    .locals 2

    iget-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mProjectAttachment:Z

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v0, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mClipType:I

    const/4 v1, 0x4

    if-eq v0, v1, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v0, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mClipType:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    return-object v0

    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mAudioEdit:Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;

    if-nez v0, :cond_2

    invoke-static {p0}, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->getnexAudioEdit(Lcom/nexstreaming/nexeditorsdk/nexClip;)Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;

    move-result-object v0

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mAudioEdit:Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;

    :cond_2
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mAudioEdit:Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;

    return-object v0

    :cond_3
    new-instance v0, Lcom/nexstreaming/nexeditorsdk/exception/ProjectNotAttachedException;

    invoke-direct {v0}, Lcom/nexstreaming/nexeditorsdk/exception/ProjectNotAttachedException;-><init>()V

    throw v0
.end method

.method public getAudioEnvelop()Lcom/nexstreaming/nexeditorsdk/nexAudioEnvelop;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mAudioEnvelop:Lcom/nexstreaming/nexeditorsdk/nexAudioEnvelop;

    if-nez v0, :cond_0

    new-instance v0, Lcom/nexstreaming/nexeditorsdk/nexAudioEnvelop;

    invoke-direct {v0, p0}, Lcom/nexstreaming/nexeditorsdk/nexAudioEnvelop;-><init>(Lcom/nexstreaming/nexeditorsdk/nexClip;)V

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mAudioEnvelop:Lcom/nexstreaming/nexeditorsdk/nexAudioEnvelop;

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mAudioEnvelop:Lcom/nexstreaming/nexeditorsdk/nexAudioEnvelop;

    return-object v0
.end method

.method public getAudioOnOff()Z
    .locals 1

    iget-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mAudioOnOff:Z

    return v0
.end method

.method public getAudioPcmLevels(Lcom/nexstreaming/nexeditorsdk/nexClip$OnGetAudioPcmLevelsResultListener;)Z
    .locals 3

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->hasAudio()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getMediaInfo()Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;

    move-result-object v0

    if-nez v0, :cond_1

    return v1

    :cond_1
    iget-boolean v2, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_gettingPcmData:Z

    if-nez v2, :cond_2

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_gettingPcmData:Z

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->c()Lcom/nexstreaming/app/common/task/ResultTask;

    move-result-object v0

    new-instance v2, Lcom/nexstreaming/nexeditorsdk/nexClip$4;

    invoke-direct {v2, p0, p1}, Lcom/nexstreaming/nexeditorsdk/nexClip$4;-><init>(Lcom/nexstreaming/nexeditorsdk/nexClip;Lcom/nexstreaming/nexeditorsdk/nexClip$OnGetAudioPcmLevelsResultListener;)V

    invoke-virtual {v0, v2}, Lcom/nexstreaming/app/common/task/ResultTask;->onResultAvailable(Lcom/nexstreaming/app/common/task/ResultTask$OnResultAvailableListener;)Lcom/nexstreaming/app/common/task/ResultTask;

    return v1

    :cond_2
    return v1
.end method

.method public getBGMVolume()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_BGMVolume:I

    return v0
.end method

.method public getBrightness()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_Brightness:I

    return v0
.end method

.method public getClipEffect()Lcom/nexstreaming/nexeditorsdk/nexClipEffect;
    .locals 1

    iget-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mProjectAttachment:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mClipEffect:Lcom/nexstreaming/nexeditorsdk/nexClipEffect;

    if-nez v0, :cond_0

    new-instance v0, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;

    invoke-direct {v0}, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;-><init>()V

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mClipEffect:Lcom/nexstreaming/nexeditorsdk/nexClipEffect;

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mClipEffect:Lcom/nexstreaming/nexeditorsdk/nexClipEffect;

    return-object v0

    :cond_1
    new-instance v0, Lcom/nexstreaming/nexeditorsdk/exception/ProjectNotAttachedException;

    invoke-direct {v0}, Lcom/nexstreaming/nexeditorsdk/exception/ProjectNotAttachedException;-><init>()V

    throw v0
.end method

.method public getClipEffect(Z)Lcom/nexstreaming/nexeditorsdk/nexClipEffect;
    .locals 2

    iget-boolean p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mProjectAttachment:Z

    if-nez p1, :cond_0

    const-string p1, "nexClip"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "getClipEffect not project attachment startTime="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mStartTime:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mClipEffect:Lcom/nexstreaming/nexeditorsdk/nexClipEffect;

    if-nez p1, :cond_1

    new-instance p1, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;

    invoke-direct {p1}, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;-><init>()V

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mClipEffect:Lcom/nexstreaming/nexeditorsdk/nexClipEffect;

    :cond_1
    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mClipEffect:Lcom/nexstreaming/nexeditorsdk/nexClipEffect;

    return-object p1
.end method

.method public getClipPropertySlowVideoMode()Z
    .locals 1

    iget-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mPropertySlowVideoMode:Z

    return v0
.end method

.method public getClipType()I
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v0, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mClipType:I

    return v0
.end method

.method public getClipVolume()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_ClipVolume:I

    return v0
.end method

.method getCollageDrawInfoID()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mCollageDrawInfoID:Ljava/lang/String;

    return-object v0
.end method

.method public getColorEffect()Lcom/nexstreaming/nexeditorsdk/nexColorEffect;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mColorEffect:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    return-object v0
.end method

.method getColorEffectID()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mColorEffect:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    if-nez v0, :cond_0

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexColorEffect;->NONE:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexColorEffect;->getKineMasterID()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mColorEffect:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexColorEffect;->getKineMasterID()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getCombinedBrightness()I
    .locals 3

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mColorEffect:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    if-nez v0, :cond_0

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_Brightness:I

    return v0

    :cond_0
    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_Brightness:I

    const/high16 v1, 0x437f0000    # 255.0f

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mColorEffect:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexColorEffect;->getBrightness()F

    move-result v2

    mul-float v2, v2, v1

    float-to-int v1, v2

    add-int/2addr v0, v1

    return v0
.end method

.method protected getCombinedContrast()I
    .locals 3

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mColorEffect:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    if-nez v0, :cond_0

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_Contrast:I

    return v0

    :cond_0
    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_Contrast:I

    const/high16 v1, 0x437f0000    # 255.0f

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mColorEffect:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexColorEffect;->getContrast()F

    move-result v2

    mul-float v2, v2, v1

    float-to-int v1, v2

    add-int/2addr v0, v1

    return v0
.end method

.method protected getCombinedSaturation()I
    .locals 3

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mColorEffect:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    if-nez v0, :cond_0

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_Saturation:I

    return v0

    :cond_0
    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_Saturation:I

    const/high16 v1, 0x437f0000    # 255.0f

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mColorEffect:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexColorEffect;->getSaturation()F

    move-result v2

    mul-float v2, v2, v1

    float-to-int v1, v2

    add-int/2addr v0, v1

    return v0
.end method

.method public getContrast()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_Contrast:I

    return v0
.end method

.method public getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;
    .locals 8

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mCrop:Lcom/nexstreaming/nexeditorsdk/nexCrop;

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v0, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mWidth:I

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v1, v1, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mHeight:I

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v2, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mClipType:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_1

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v2, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mRotateDegreeInMeta:I

    const/16 v3, 0x5a

    if-eq v2, v3, :cond_0

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v2, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mRotateDegreeInMeta:I

    const/16 v3, 0x10e

    if-ne v2, v3, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v0, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mHeight:I

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v1, v1, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mWidth:I

    :cond_1
    move v4, v0

    move v5, v1

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getProjectDuration()I

    move-result v7

    new-instance v0, Lcom/nexstreaming/nexeditorsdk/nexCrop;

    iget-object v3, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mPath:Ljava/lang/String;

    iget v6, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mRotate:I

    move-object v2, v0

    invoke-direct/range {v2 .. v7}, Lcom/nexstreaming/nexeditorsdk/nexCrop;-><init>(Ljava/lang/String;IIII)V

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mCrop:Lcom/nexstreaming/nexeditorsdk/nexCrop;

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mCrop:Lcom/nexstreaming/nexeditorsdk/nexCrop;

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mRotate:I

    invoke-virtual {v0, v1}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setRotate(I)V

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mCrop:Lcom/nexstreaming/nexeditorsdk/nexCrop;

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getProjectDuration()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setClipDuration(I)V

    :goto_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mCrop:Lcom/nexstreaming/nexeditorsdk/nexCrop;

    return-object v0
.end method

.method protected getCustomLUTA()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mCustomLUT_A:I

    return v0
.end method

.method protected getCustomLUTB()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mCustomLUT_B:I

    return v0
.end method

.method protected getCustomLUTPower()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mCustomLUT_Power:I

    return v0
.end method

.method public getDisplayHeight()I
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v0, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mDisplayHeight:I

    return v0
.end method

.method public getDisplayWidth()I
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v0, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mDisplayWidth:I

    return v0
.end method

.method getDrawInfos()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mDrawInfos:Ljava/util/List;

    return-object v0
.end method

.method getFaceRect()Landroid/graphics/Rect;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mFaceRect:Landroid/graphics/Rect;

    return-object v0
.end method

.method public getFramesPerSecond()I
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v0, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mFramesPerSecond:I

    return v0
.end method

.method public getHeight()I
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v0, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mHeight:I

    return v0
.end method

.method public getImageClipDuration()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mDuration:I

    return v0
.end method

.method protected getLUTId()I
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mColorEffect:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mColorEffect:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexColorEffect;->getLUTId()I

    move-result v0

    return v0
.end method

.method public getMainThumbnail(FF)Landroid/graphics/Bitmap;
    .locals 3

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v0, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mClipType:I

    const/4 v1, 0x0

    const/4 v2, 0x4

    if-ne v0, v2, :cond_1

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mThumbnails:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/h;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mThumbnails:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/h;

    iget-object p2, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget p2, p2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mTotalTime:I

    div-int/lit8 p2, p2, 0x2

    const/4 v0, 0x0

    invoke-interface {p1, v0, p2, v0, v0}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/h;->a(IIZZ)Landroid/graphics/Bitmap;

    move-result-object p1

    return-object p1

    :cond_0
    return-object v1

    :cond_1
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mSingleThumbnail:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mSingleThumbnail:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Landroid/graphics/Bitmap;

    :cond_2
    if-nez v1, :cond_3

    invoke-direct {p0, p1, p2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->makeThumbnail(FF)Landroid/graphics/Bitmap;

    move-result-object v1

    if-eqz v1, :cond_3

    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mSingleThumbnail:Ljava/lang/ref/WeakReference;

    :cond_3
    return-object v1
.end method

.method getMediaInfo()Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;
    .locals 2

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mediainfo:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getRealPath()Ljava/lang/String;

    move-result-object v0

    iget-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mMediaInfoUseCache:Z

    invoke-static {v0, v1}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->a(Ljava/lang/String;Z)Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mediainfo:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mediainfo:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;

    return-object v0
.end method

.method public getPath()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mPath:Ljava/lang/String;

    return-object v0
.end method

.method protected getProjectDuration()I
    .locals 3

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v0, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mClipType:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_2

    packed-switch v0, :pswitch_data_0

    const/4 v0, 0x0

    goto :goto_0

    :pswitch_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v0, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mTotalTime:I

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mVideoEdit:Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mVideoEdit:Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    iget v1, v1, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;->mTrimStartDuration:I

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mVideoEdit:Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    iget v1, v1, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;->mTrimEndDuration:I

    if-eqz v1, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v0, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mTotalTime:I

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mVideoEdit:Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    iget v1, v1, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;->mTrimStartDuration:I

    sub-int/2addr v0, v1

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mVideoEdit:Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    iget v1, v1, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;->mTrimEndDuration:I

    sub-int/2addr v0, v1

    :cond_1
    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mVideoEdit:Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;->getSpeedControl()I

    move-result v1

    const/16 v2, 0x64

    if-eq v1, v2, :cond_3

    mul-int/lit8 v0, v0, 0x64

    div-int/2addr v0, v1

    int-to-float v0, v0

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    goto :goto_0

    :pswitch_1
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v0, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mTotalTime:I

    goto :goto_0

    :cond_2
    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mDuration:I

    :cond_3
    :goto_0
    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getProjectEndTime()I
    .locals 1

    iget-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mProjectAttachment:Z

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mEndTime:I

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public getProjectStartTime()I
    .locals 1

    iget-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mProjectAttachment:Z

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mStartTime:I

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method getRealPath()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTransCodingPath:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTransCodingPath:Ljava/lang/String;

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mPath:Ljava/lang/String;

    return-object v0
.end method

.method public getRotateDegree()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mRotate:I

    return v0
.end method

.method public getRotateInMeta()I
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v0, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mRotateDegreeInMeta:I

    return v0
.end method

.method public getSaturation()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_Saturation:I

    return v0
.end method

.method getSaveData()Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;
    .locals 3

    new-instance v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;

    invoke-direct {v0}, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;-><init>()V

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_BGMVolume:I

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->m_BGMVolume:I

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mPath:Ljava/lang/String;

    iput-object v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mPath:Ljava/lang/String;

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTransCodingPath:Ljava/lang/String;

    iput-object v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mTransCodingPath:Ljava/lang/String;

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mClipEffect:Lcom/nexstreaming/nexeditorsdk/nexClipEffect;

    const/4 v2, 0x0

    if-nez v1, :cond_0

    iput-object v2, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mClipEffect:Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexEffectOf;

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mClipEffect:Lcom/nexstreaming/nexeditorsdk/nexClipEffect;

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->getSaveData()Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexEffectOf;

    move-result-object v1

    iput-object v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mClipEffect:Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexEffectOf;

    :goto_0
    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTransitionEffect:Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;

    if-nez v1, :cond_1

    iput-object v2, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mTransitionEffect:Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexEffectOf;

    goto :goto_1

    :cond_1
    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTransitionEffect:Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;->getSaveData()Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexEffectOf;

    move-result-object v1

    iput-object v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mTransitionEffect:Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexEffectOf;

    :goto_1
    iget-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->misMustDownSize:Z

    iput-boolean v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->misMustDownSize:Z

    iget-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mAudioOnOff:Z

    iput-boolean v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mAudioOnOff:Z

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_Brightness:I

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->m_Brightness:I

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_Contrast:I

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->m_Contrast:I

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_Saturation:I

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->m_Saturation:I

    iget-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mVignette:Z

    iput-boolean v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mVignette:Z

    iget-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mFacedetectProcessed:Z

    iput-boolean v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mFacedetectProcessed:Z

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mFaceDetected:I

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mFaceDetected:I

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mFaceRect:Landroid/graphics/Rect;

    iput-object v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mFaceRect:Landroid/graphics/Rect;

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mCrop:Lcom/nexstreaming/nexeditorsdk/nexCrop;

    if-nez v1, :cond_2

    iput-object v2, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mCrop:Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;

    goto :goto_2

    :cond_2
    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mCrop:Lcom/nexstreaming/nexeditorsdk/nexCrop;

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getSaveData()Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;

    move-result-object v1

    iput-object v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mCrop:Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;

    :goto_2
    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTitleEffectStartTime:I

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mTitleEffectStartTime:I

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTitleEffectStartTime:I

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mTitleEffectEndTime:I

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mAudioEnvelop:Lcom/nexstreaming/nexeditorsdk/nexAudioEnvelop;

    if-nez v1, :cond_3

    iput-object v2, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mAudioEnvelop:Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexAudioEnvelopOf;

    goto :goto_3

    :cond_3
    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mAudioEnvelop:Lcom/nexstreaming/nexeditorsdk/nexAudioEnvelop;

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexAudioEnvelop;->getSaveData()Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexAudioEnvelopOf;

    move-result-object v1

    iput-object v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mAudioEnvelop:Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexAudioEnvelopOf;

    :goto_3
    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mAudioEdit:Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;

    if-nez v1, :cond_4

    iput-object v2, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mAudioEdit:Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexAudioEditOf;

    goto :goto_4

    :cond_4
    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mAudioEdit:Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->getSaveData()Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexAudioEditOf;

    move-result-object v1

    iput-object v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mAudioEdit:Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexAudioEditOf;

    :goto_4
    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTemplateEffectID:I

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mTemplateEffectID:I

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mCollageDrawInfoID:Ljava/lang/String;

    iput-object v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mCollageDrawInfoID:Ljava/lang/String;

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTemplateAudioPos:I

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mTemplateAudioPos:I

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mDrawInfos:Ljava/util/List;

    iput-object v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mDrawInfos:Ljava/util/List;

    iget-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mOverlappedTransition:Z

    iput-boolean v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mOverlappedTransition:Z

    iget-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mMediaInfoUseCache:Z

    iput-boolean v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mMediaInfoUseCache:Z

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mStartTime:I

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mStartTime:I

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mEndTime:I

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mEndTime:I

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mDuration:I

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mDuration:I

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iput-object v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mVideoEdit:Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    if-nez v1, :cond_5

    iput-object v2, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mVideoEdit:Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexVideoClipEditOf;

    goto :goto_5

    :cond_5
    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mVideoEdit:Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;->getSaveData()Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexVideoClipEditOf;

    move-result-object v1

    iput-object v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mVideoEdit:Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexVideoClipEditOf;

    :goto_5
    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mCustomLUT_A:I

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mCustomLUT_A:I

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mCustomLUT_B:I

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mCustomLUT_B:I

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mCustomLUT_Power:I

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mCustomLUT_Power:I

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mColorEffect:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    if-nez v1, :cond_6

    iput-object v2, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mColorEffect:Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexColorEffectOf;

    goto :goto_6

    :cond_6
    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mColorEffect:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexColorEffect;->getSaveData()Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexColorEffectOf;

    move-result-object v1

    iput-object v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mColorEffect:Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexColorEffectOf;

    :goto_6
    iget-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mPropertySlowVideoMode:Z

    iput-boolean v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mPropertySlowVideoMode:Z

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mAVSyncAudioStartTime:I

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mAVSyncAudioStartTime:I

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_ClipVolume:I

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->m_ClipVolume:I

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_BGMVolume:I

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->m_BGMVolume:I

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mRotate:I

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mRotate:I

    return-object v0
.end method

.method public getSeekPointCount()I
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v0, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mSeekPointCount:I

    return v0
.end method

.method public getSeekPointInterval()I
    .locals 2

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v0, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mSeekPointCount:I

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v0, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mVideoTotalTime:I

    return v0

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v0, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mVideoTotalTime:I

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v1, v1, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mSeekPointCount:I

    div-int/2addr v0, v1

    return v0
.end method

.method public getSeekPointsSync()[I
    .locals 3

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v0, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mClipType:I

    const/4 v1, 0x0

    const/4 v2, 0x4

    if-eq v0, v2, :cond_0

    return-object v1

    :cond_0
    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getMediaInfo()Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;

    move-result-object v0

    if-nez v0, :cond_1

    return-object v1

    :cond_1
    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->d()[I

    move-result-object v0

    return-object v0
.end method

.method public getSolidColor()I
    .locals 3

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->isSolid()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mPath:Ljava/lang/String;

    const/4 v1, 0x7

    const/16 v2, 0xf

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x10

    invoke-static {v0, v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;I)J

    move-result-wide v0

    long-to-int v0, v0

    return v0
.end method

.method public getSupportedResult()I
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v0, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mSuppertedResult:I

    return v0
.end method

.method getTemplateAudioPos()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTemplateAudioPos:I

    return v0
.end method

.method getTemplateEffectID()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTemplateEffectID:I

    return v0
.end method

.method getTemplateOverlappedTransition()Z
    .locals 1

    iget-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mOverlappedTransition:Z

    return v0
.end method

.method protected getTintColor()I
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mColorEffect:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mColorEffect:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexColorEffect;->getTintColor()I

    move-result v0

    return v0
.end method

.method public getTotalTime()I
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v0, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mTotalTime:I

    return v0
.end method

.method public getTransitionEffect()Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;
    .locals 2

    iget-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mProjectAttachment:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTransitionEffect:Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;

    if-nez v0, :cond_0

    new-instance v0, Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mObserver:Lcom/nexstreaming/nexeditorsdk/b;

    invoke-direct {v0, v1}, Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;-><init>(Lcom/nexstreaming/nexeditorsdk/b;)V

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTransitionEffect:Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTransitionEffect:Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;

    return-object v0

    :cond_1
    new-instance v0, Lcom/nexstreaming/nexeditorsdk/exception/ProjectNotAttachedException;

    invoke-direct {v0}, Lcom/nexstreaming/nexeditorsdk/exception/ProjectNotAttachedException;-><init>()V

    throw v0
.end method

.method public getTransitionEffect(Z)Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;
    .locals 2

    iget-boolean p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mProjectAttachment:Z

    if-nez p1, :cond_0

    const-string p1, "nexClip"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "getTransitionEffect not project attachment startTime="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mStartTime:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTransitionEffect:Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;

    if-nez p1, :cond_1

    new-instance p1, Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mObserver:Lcom/nexstreaming/nexeditorsdk/b;

    invoke-direct {p1, v0}, Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;-><init>(Lcom/nexstreaming/nexeditorsdk/b;)V

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTransitionEffect:Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;

    :cond_1
    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTransitionEffect:Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;

    return-object p1
.end method

.method public getVideoBitrate()I
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v0, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mVideoBitrate:I

    return v0
.end method

.method public getVideoClipDetailThumbnails(IIIIIILcom/nexstreaming/nexeditorsdk/nexClip$OnGetVideoClipDetailThumbnailsListener;)I
    .locals 11

    invoke-static {}, Landroid/os/Environment;->getDataDirectory()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    move-result-object v0

    invoke-static {v0}, Lcom/nexstreaming/app/common/util/e;->a(Ljava/io/File;)J

    move-result-wide v0

    sget-wide v2, Lcom/nexstreaming/nexeditorsdk/nexClip;->sVideoClipDetailThumbnailsDiskLimitSize:J

    cmp-long v4, v0, v2

    if-gez v4, :cond_0

    const-string v2, "nexClip"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "getVideoClipDetailThumbnails() disk low. run no cache mode. disk size="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, ", limit="

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-wide v0, Lcom/nexstreaming/nexeditorsdk/nexClip;->sVideoClipDetailThumbnailsDiskLimitSize:J

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x1

    const/4 v8, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    const/4 v8, 0x0

    :goto_0
    const/4 v9, 0x0

    move-object v1, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move/from16 v6, p5

    move/from16 v7, p6

    move-object/from16 v10, p7

    invoke-virtual/range {v1 .. v10}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getVideoClipDetailThumbnails(IIIIIIZ[ILcom/nexstreaming/nexeditorsdk/nexClip$OnGetVideoClipDetailThumbnailsListener;)I

    move-result v0

    return v0
.end method

.method public getVideoClipDetailThumbnails(IIIIIIZZZZ[ILcom/nexstreaming/nexeditorsdk/nexClip$OnGetVideoClipDetailThumbnailsListener;)I
    .locals 15

    move-object v0, p0

    move/from16 v1, p6

    move-object/from16 v2, p12

    iget-object v3, v0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v3, v3, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mClipType:I

    const/4 v4, -0x1

    const/4 v5, 0x4

    if-eq v3, v5, :cond_0

    return v4

    :cond_0
    if-nez v2, :cond_1

    return v4

    :cond_1
    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getMediaInfo()Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;

    move-result-object v6

    if-nez v6, :cond_3

    if-eqz v2, :cond_2

    sget v1, Lcom/nexstreaming/nexeditorsdk/nexClip$OnGetVideoClipDetailThumbnailsListener;->kEvent_systemError:I

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object/from16 p1, p12

    move/from16 p2, v1

    move-object/from16 p3, v3

    move/from16 p4, v4

    move/from16 p5, v5

    move/from16 p6, v6

    invoke-virtual/range {p1 .. p6}, Lcom/nexstreaming/nexeditorsdk/nexClip$OnGetVideoClipDetailThumbnailsListener;->onGetDetailThumbnailResult(ILandroid/graphics/Bitmap;III)V

    :cond_2
    sget v1, Lcom/nexstreaming/nexeditorsdk/nexClip$OnGetVideoClipDetailThumbnailsListener;->kEvent_systemError:I

    return v1

    :cond_3
    const/16 v3, 0x5a

    const/4 v4, 0x0

    if-eq v1, v3, :cond_6

    const/16 v3, 0xb4

    if-eq v1, v3, :cond_5

    const/16 v3, 0x10e

    if-eq v1, v3, :cond_4

    const/4 v3, 0x0

    goto :goto_0

    :cond_4
    const/16 v1, 0x40

    const/16 v3, 0x40

    goto :goto_0

    :cond_5
    const/16 v1, 0x20

    const/16 v3, 0x20

    goto :goto_0

    :cond_6
    const/16 v1, 0x10

    const/16 v3, 0x10

    :goto_0
    if-eqz p7, :cond_7

    const/high16 v1, 0x40000

    or-int/2addr v3, v1

    :cond_7
    if-eqz p8, :cond_8

    or-int/lit16 v3, v3, 0x100

    const/4 v1, 0x0

    move-object v13, v1

    goto :goto_1

    :cond_8
    move-object/from16 v13, p11

    :goto_1
    if-eqz p9, :cond_9

    const/high16 v1, 0x80000

    or-int/2addr v3, v1

    :cond_9
    if-eqz p10, :cond_a

    const/high16 v1, 0x100000

    or-int/2addr v1, v3

    move v12, v1

    goto :goto_2

    :cond_a
    move v12, v3

    :goto_2
    new-instance v14, Lcom/nexstreaming/nexeditorsdk/nexClip$3;

    invoke-direct {v14, p0, v2}, Lcom/nexstreaming/nexeditorsdk/nexClip$3;-><init>(Lcom/nexstreaming/nexeditorsdk/nexClip;Lcom/nexstreaming/nexeditorsdk/nexClip$OnGetVideoClipDetailThumbnailsListener;)V

    move/from16 v7, p1

    move/from16 v8, p2

    move/from16 v9, p3

    move/from16 v10, p4

    move/from16 v11, p5

    invoke-virtual/range {v6 .. v14}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->a(IIIIII[ILcom/nexstreaming/kminternal/kinemaster/mediainfo/c;)Lcom/nexstreaming/app/common/task/Task;

    move-result-object v1

    new-instance v3, Lcom/nexstreaming/nexeditorsdk/nexClip$2;

    invoke-direct {v3, p0, v2}, Lcom/nexstreaming/nexeditorsdk/nexClip$2;-><init>(Lcom/nexstreaming/nexeditorsdk/nexClip;Lcom/nexstreaming/nexeditorsdk/nexClip$OnGetVideoClipDetailThumbnailsListener;)V

    invoke-virtual {v1, v3}, Lcom/nexstreaming/app/common/task/Task;->onFailure(Lcom/nexstreaming/app/common/task/Task$OnFailListener;)Lcom/nexstreaming/app/common/task/Task;

    move-result-object v1

    new-instance v3, Lcom/nexstreaming/nexeditorsdk/nexClip$12;

    invoke-direct {v3, p0, v2}, Lcom/nexstreaming/nexeditorsdk/nexClip$12;-><init>(Lcom/nexstreaming/nexeditorsdk/nexClip;Lcom/nexstreaming/nexeditorsdk/nexClip$OnGetVideoClipDetailThumbnailsListener;)V

    invoke-virtual {v1, v3}, Lcom/nexstreaming/app/common/task/Task;->onComplete(Lcom/nexstreaming/app/common/task/Task$OnTaskEventListener;)Lcom/nexstreaming/app/common/task/Task;

    return v4
.end method

.method public getVideoClipDetailThumbnails(IIIIIIZZ[ILcom/nexstreaming/nexeditorsdk/nexClip$OnGetVideoClipDetailThumbnailsListener;)I
    .locals 13

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move/from16 v3, p3

    move/from16 v4, p4

    move/from16 v5, p5

    move/from16 v6, p6

    move/from16 v7, p7

    move/from16 v8, p8

    move-object/from16 v12, p10

    invoke-virtual/range {v0 .. v12}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getVideoClipDetailThumbnails(IIIIIIZZZZ[ILcom/nexstreaming/nexeditorsdk/nexClip$OnGetVideoClipDetailThumbnailsListener;)I

    move-result v0

    return v0
.end method

.method public getVideoClipDetailThumbnails(IIIIIIZ[ILcom/nexstreaming/nexeditorsdk/nexClip$OnGetVideoClipDetailThumbnailsListener;)I
    .locals 15

    move-object v0, p0

    move/from16 v1, p6

    move-object/from16 v2, p9

    iget-object v3, v0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v3, v3, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mClipType:I

    const/4 v4, -0x1

    const/4 v5, 0x4

    if-eq v3, v5, :cond_0

    return v4

    :cond_0
    if-nez v2, :cond_1

    return v4

    :cond_1
    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getMediaInfo()Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;

    move-result-object v6

    if-nez v6, :cond_3

    if-eqz v2, :cond_2

    sget v1, Lcom/nexstreaming/nexeditorsdk/nexClip$OnGetVideoClipDetailThumbnailsListener;->kEvent_systemError:I

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object/from16 p1, p9

    move/from16 p2, v1

    move-object/from16 p3, v3

    move/from16 p4, v4

    move/from16 p5, v5

    move/from16 p6, v6

    invoke-virtual/range {p1 .. p6}, Lcom/nexstreaming/nexeditorsdk/nexClip$OnGetVideoClipDetailThumbnailsListener;->onGetDetailThumbnailResult(ILandroid/graphics/Bitmap;III)V

    :cond_2
    sget v1, Lcom/nexstreaming/nexeditorsdk/nexClip$OnGetVideoClipDetailThumbnailsListener;->kEvent_systemError:I

    return v1

    :cond_3
    const/16 v3, 0x5a

    const/4 v4, 0x0

    if-eq v1, v3, :cond_6

    const/16 v3, 0xb4

    if-eq v1, v3, :cond_5

    const/16 v3, 0x10e

    if-eq v1, v3, :cond_4

    const/4 v3, 0x0

    goto :goto_0

    :cond_4
    const/16 v1, 0x40

    const/16 v3, 0x40

    goto :goto_0

    :cond_5
    const/16 v1, 0x20

    const/16 v3, 0x20

    goto :goto_0

    :cond_6
    const/16 v1, 0x10

    const/16 v3, 0x10

    :goto_0
    if-eqz p7, :cond_7

    const/high16 v1, 0x40000

    or-int/2addr v1, v3

    move v12, v1

    goto :goto_1

    :cond_7
    move v12, v3

    :goto_1
    new-instance v14, Lcom/nexstreaming/nexeditorsdk/nexClip$11;

    invoke-direct {v14, p0, v2}, Lcom/nexstreaming/nexeditorsdk/nexClip$11;-><init>(Lcom/nexstreaming/nexeditorsdk/nexClip;Lcom/nexstreaming/nexeditorsdk/nexClip$OnGetVideoClipDetailThumbnailsListener;)V

    move/from16 v7, p1

    move/from16 v8, p2

    move/from16 v9, p3

    move/from16 v10, p4

    move/from16 v11, p5

    move-object/from16 v13, p8

    invoke-virtual/range {v6 .. v14}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->a(IIIIII[ILcom/nexstreaming/kminternal/kinemaster/mediainfo/c;)Lcom/nexstreaming/app/common/task/Task;

    move-result-object v1

    new-instance v3, Lcom/nexstreaming/nexeditorsdk/nexClip$10;

    invoke-direct {v3, p0, v2}, Lcom/nexstreaming/nexeditorsdk/nexClip$10;-><init>(Lcom/nexstreaming/nexeditorsdk/nexClip;Lcom/nexstreaming/nexeditorsdk/nexClip$OnGetVideoClipDetailThumbnailsListener;)V

    invoke-virtual {v1, v3}, Lcom/nexstreaming/app/common/task/Task;->onFailure(Lcom/nexstreaming/app/common/task/Task$OnFailListener;)Lcom/nexstreaming/app/common/task/Task;

    move-result-object v1

    new-instance v3, Lcom/nexstreaming/nexeditorsdk/nexClip$9;

    invoke-direct {v3, p0, v2}, Lcom/nexstreaming/nexeditorsdk/nexClip$9;-><init>(Lcom/nexstreaming/nexeditorsdk/nexClip;Lcom/nexstreaming/nexeditorsdk/nexClip$OnGetVideoClipDetailThumbnailsListener;)V

    invoke-virtual {v1, v3}, Lcom/nexstreaming/app/common/task/Task;->onComplete(Lcom/nexstreaming/app/common/task/Task$OnTaskEventListener;)Lcom/nexstreaming/app/common/task/Task;

    return v4
.end method

.method public getVideoClipDetailThumbnails(II[IILcom/nexstreaming/nexeditorsdk/nexClip$OnGetVideoClipDetailThumbnailsListener;)I
    .locals 10

    invoke-static {}, Landroid/os/Environment;->getDataDirectory()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    move-result-object v0

    invoke-static {v0}, Lcom/nexstreaming/app/common/util/e;->a(Ljava/io/File;)J

    move-result-wide v0

    sget-wide v2, Lcom/nexstreaming/nexeditorsdk/nexClip;->sVideoClipDetailThumbnailsDiskLimitSize:J

    cmp-long v4, v0, v2

    const/4 v2, 0x0

    if-gez v4, :cond_0

    const-string v3, "nexClip"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "getVideoClipDetailThumbnails() disk low. run no cache mode. disk size="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, ", limit="

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-wide v0, Lcom/nexstreaming/nexeditorsdk/nexClip;->sVideoClipDetailThumbnailsDiskLimitSize:J

    invoke-virtual {v4, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x1

    const/4 v7, 0x1

    goto :goto_0

    :cond_0
    const/4 v7, 0x0

    :goto_0
    if-eqz p3, :cond_1

    array-length v0, p3

    move v5, v0

    goto :goto_1

    :cond_1
    const/4 v5, 0x0

    :goto_1
    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v6, p4

    move-object v8, p3

    move-object v9, p5

    invoke-virtual/range {v0 .. v9}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getVideoClipDetailThumbnails(IIIIIIZ[ILcom/nexstreaming/nexeditorsdk/nexClip$OnGetVideoClipDetailThumbnailsListener;)I

    move-result v0

    return v0
.end method

.method public getVideoClipEdit()Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;
    .locals 2

    iget-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mProjectAttachment:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v0, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mClipType:I

    const/4 v1, 0x4

    if-eq v0, v1, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mVideoEdit:Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    if-nez v0, :cond_1

    invoke-static {p0}, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;->getnexVideoClipEdit(Lcom/nexstreaming/nexeditorsdk/nexClip;)Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    move-result-object v0

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mVideoEdit:Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    :cond_1
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mVideoEdit:Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    return-object v0

    :cond_2
    new-instance v0, Lcom/nexstreaming/nexeditorsdk/exception/ProjectNotAttachedException;

    invoke-direct {v0}, Lcom/nexstreaming/nexeditorsdk/exception/ProjectNotAttachedException;-><init>()V

    throw v0
.end method

.method public getVideoClipIDR2YOnlyThumbnails(IIIIILcom/nexstreaming/nexeditorsdk/nexClip$OnGetVideoClipIDR2YOnlyThumbnailsListener;)I
    .locals 14
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    move-object v0, p0

    move-object/from16 v1, p6

    iget-object v2, v0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v2, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mClipType:I

    const/4 v3, -0x1

    const/4 v4, 0x4

    if-eq v2, v4, :cond_0

    return v3

    :cond_0
    if-nez v1, :cond_1

    return v3

    :cond_1
    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getMediaInfo()Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;

    move-result-object v5

    if-nez v5, :cond_3

    if-eqz v1, :cond_2

    sget v2, Lcom/nexstreaming/nexeditorsdk/nexClip$OnGetVideoClipIDR2YOnlyThumbnailsListener;->kEvent_systemError:I

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object/from16 p1, p6

    move/from16 p2, v2

    move-object/from16 p3, v3

    move/from16 p4, v4

    move/from16 p5, v5

    move/from16 p6, v6

    invoke-virtual/range {p1 .. p6}, Lcom/nexstreaming/nexeditorsdk/nexClip$OnGetVideoClipIDR2YOnlyThumbnailsListener;->onGetVideoClipIDR2YOnlyThumbnailsResult(I[BIII)V

    :cond_2
    sget v1, Lcom/nexstreaming/nexeditorsdk/nexClip$OnGetVideoClipIDR2YOnlyThumbnailsListener;->kEvent_systemError:I

    return v1

    :cond_3
    const v11, 0x20002

    invoke-virtual {v5}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->d()[I

    move-result-object v2

    const/4 v12, 0x0

    new-instance v13, Lcom/nexstreaming/nexeditorsdk/nexClip$8;

    invoke-direct {v13, p0, v2, v1}, Lcom/nexstreaming/nexeditorsdk/nexClip$8;-><init>(Lcom/nexstreaming/nexeditorsdk/nexClip;[ILcom/nexstreaming/nexeditorsdk/nexClip$OnGetVideoClipIDR2YOnlyThumbnailsListener;)V

    move v6, p1

    move/from16 v7, p2

    move/from16 v8, p3

    move/from16 v9, p4

    move/from16 v10, p5

    invoke-virtual/range {v5 .. v13}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->a(IIIIII[ILcom/nexstreaming/kminternal/kinemaster/mediainfo/c;)Lcom/nexstreaming/app/common/task/Task;

    move-result-object v2

    new-instance v3, Lcom/nexstreaming/nexeditorsdk/nexClip$7;

    invoke-direct {v3, p0, v1}, Lcom/nexstreaming/nexeditorsdk/nexClip$7;-><init>(Lcom/nexstreaming/nexeditorsdk/nexClip;Lcom/nexstreaming/nexeditorsdk/nexClip$OnGetVideoClipIDR2YOnlyThumbnailsListener;)V

    invoke-virtual {v2, v3}, Lcom/nexstreaming/app/common/task/Task;->onFailure(Lcom/nexstreaming/app/common/task/Task$OnFailListener;)Lcom/nexstreaming/app/common/task/Task;

    move-result-object v2

    new-instance v3, Lcom/nexstreaming/nexeditorsdk/nexClip$6;

    invoke-direct {v3, p0, v1}, Lcom/nexstreaming/nexeditorsdk/nexClip$6;-><init>(Lcom/nexstreaming/nexeditorsdk/nexClip;Lcom/nexstreaming/nexeditorsdk/nexClip$OnGetVideoClipIDR2YOnlyThumbnailsListener;)V

    invoke-virtual {v2, v3}, Lcom/nexstreaming/app/common/task/Task;->onComplete(Lcom/nexstreaming/app/common/task/Task$OnTaskEventListener;)Lcom/nexstreaming/app/common/task/Task;

    const/4 v1, 0x0

    return v1
.end method

.method public getVideoClipIFrameThumbnails(IILcom/nexstreaming/nexeditorsdk/nexClip$OnGetVideoClipDetailThumbnailsListener;)I
    .locals 8
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/16 v5, 0xe10

    const/4 v6, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move-object v7, p3

    invoke-virtual/range {v0 .. v7}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getVideoClipDetailThumbnails(IIIIIILcom/nexstreaming/nexeditorsdk/nexClip$OnGetVideoClipDetailThumbnailsListener;)I

    move-result p1

    return p1
.end method

.method public getVideoClipTimeLineOfThumbnail()[I
    .locals 2

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v0, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mClipType:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mThumbnails:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/h;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mThumbnails:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/h;

    invoke-interface {v0}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/h;->b()[I

    move-result-object v0

    return-object v0

    :cond_0
    new-instance v0, Lcom/nexstreaming/nexeditorsdk/exception/ClipIsNotVideoException;

    invoke-direct {v0}, Lcom/nexstreaming/nexeditorsdk/exception/ClipIsNotVideoException;-><init>()V

    throw v0
.end method

.method public getVideoClipTimeLineThumbnail(IIZZ)Landroid/graphics/Bitmap;
    .locals 2

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v0, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mClipType:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mThumbnails:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/h;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mThumbnails:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/h;

    invoke-interface {v0, p1, p2, p3, p4}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/h;->a(IIZZ)Landroid/graphics/Bitmap;

    move-result-object p1

    return-object p1

    :cond_0
    new-instance p1, Lcom/nexstreaming/nexeditorsdk/exception/ClipIsNotVideoException;

    invoke-direct {p1}, Lcom/nexstreaming/nexeditorsdk/exception/ClipIsNotVideoException;-><init>()V

    throw p1
.end method

.method public getVideoCodecType()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget-object v0, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mVideoCodecType:Ljava/lang/String;

    return-object v0
.end method

.method public getVideoDuration()I
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v0, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mVideoTotalTime:I

    return v0
.end method

.method public getVideoHDRType()I
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v0, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mVideoHDRType:I

    return v0
.end method

.method public getVideoRenderMode()I
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v0, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mVideoRenderMode:I

    return v0
.end method

.method public getVideoUUID()[B
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v0, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mVideoRenderMode:I

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget-object v0, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mVideoUUID:[B

    return-object v0
.end method

.method public getVignetteEffect()Z
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    iget-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mVignette:Z

    return v0
.end method

.method public getVoiceChangerFactor()I
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v0, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mClipType:I

    const/4 v1, 0x4

    if-eq v0, v1, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v0, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mClipType:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    return v0

    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getAudioEdit()Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->getVoiceChangerFactor()I

    move-result v0

    return v0
.end method

.method public getWidth()I
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v0, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mWidth:I

    return v0
.end method

.method public hasAudio()Z
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget-boolean v0, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mExistAudio:Z

    return v0
.end method

.method public hasVideo()Z
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget-boolean v0, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mExistVideo:Z

    return v0
.end method

.method public isAssetResource()Z
    .locals 1

    iget-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mIsAssetResource:Z

    return v0
.end method

.method public isEncryptedAssetClip()Z
    .locals 3

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTransCodingPath:Ljava/lang/String;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTransCodingPath:Ljava/lang/String;

    const-string v2, "@assetItem:"

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    return v0

    :cond_1
    return v1
.end method

.method isFaceDetectProcessed()Z
    .locals 1

    iget-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mFacedetectProcessed:Z

    return v0
.end method

.method isFaceDetected()Z
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mFaceDetected:I

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method protected isMotionTrackedVideo()Z
    .locals 1

    iget-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->isMotionTrackedVideo:Z

    return v0
.end method

.method public isSolid()Z
    .locals 2

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mPath:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mPath:Ljava/lang/String;

    const-string v1, "@solid:"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mPath:Ljava/lang/String;

    const-string v1, ".jpg"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method loadSaveData(Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;)V
    .locals 4

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mPath:Ljava/lang/String;

    iget-object v1, p1, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mPath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "nexClip"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "loadSaveData invaild path="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mPath:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ", input="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p1, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mPath:Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    iget v0, p1, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->m_BGMVolume:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_BGMVolume:I

    iget-object v0, p1, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mClipEffect:Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexEffectOf;

    const/4 v1, 0x0

    if-nez v0, :cond_1

    iput-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mClipEffect:Lcom/nexstreaming/nexeditorsdk/nexClipEffect;

    goto :goto_0

    :cond_1
    new-instance v0, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;

    iget-object v2, p1, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mClipEffect:Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexEffectOf;

    invoke-direct {v0, v2}, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;-><init>(Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexEffectOf;)V

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mClipEffect:Lcom/nexstreaming/nexeditorsdk/nexClipEffect;

    :goto_0
    iget-object v0, p1, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mTransitionEffect:Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexEffectOf;

    if-nez v0, :cond_2

    iput-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTransitionEffect:Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;

    goto :goto_1

    :cond_2
    new-instance v0, Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mObserver:Lcom/nexstreaming/nexeditorsdk/b;

    iget-object v3, p1, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mTransitionEffect:Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexEffectOf;

    invoke-direct {v0, v2, v3}, Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;-><init>(Lcom/nexstreaming/nexeditorsdk/b;Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexEffectOf;)V

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTransitionEffect:Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;

    :goto_1
    iget-boolean v0, p1, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->misMustDownSize:Z

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->misMustDownSize:Z

    iget-boolean v0, p1, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mAudioOnOff:Z

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mAudioOnOff:Z

    iget v0, p1, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->m_Brightness:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_Brightness:I

    iget v0, p1, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->m_Contrast:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_Contrast:I

    iget v0, p1, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->m_Saturation:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_Saturation:I

    iget-boolean v0, p1, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mVignette:Z

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mVignette:Z

    iget-boolean v0, p1, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mFacedetectProcessed:Z

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mFacedetectProcessed:Z

    iget v0, p1, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mFaceDetected:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mFaceDetected:I

    iget-object v0, p1, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mFaceRect:Landroid/graphics/Rect;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mFaceRect:Landroid/graphics/Rect;

    iget-object v0, p1, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mCrop:Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;

    if-nez v0, :cond_3

    iput-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mCrop:Lcom/nexstreaming/nexeditorsdk/nexCrop;

    goto :goto_2

    :cond_3
    new-instance v0, Lcom/nexstreaming/nexeditorsdk/nexCrop;

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mPath:Ljava/lang/String;

    iget-object v3, p1, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mCrop:Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;

    invoke-direct {v0, v2, v3}, Lcom/nexstreaming/nexeditorsdk/nexCrop;-><init>(Ljava/lang/String;Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;)V

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mCrop:Lcom/nexstreaming/nexeditorsdk/nexCrop;

    :goto_2
    iget v0, p1, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mTitleEffectStartTime:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTitleEffectStartTime:I

    iget v0, p1, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mTitleEffectEndTime:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTitleEffectStartTime:I

    iget-object v0, p1, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mAudioEnvelop:Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexAudioEnvelopOf;

    if-nez v0, :cond_4

    iput-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mAudioEnvelop:Lcom/nexstreaming/nexeditorsdk/nexAudioEnvelop;

    goto :goto_3

    :cond_4
    new-instance v0, Lcom/nexstreaming/nexeditorsdk/nexAudioEnvelop;

    iget-object v2, p1, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mAudioEnvelop:Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexAudioEnvelopOf;

    invoke-direct {v0, v2}, Lcom/nexstreaming/nexeditorsdk/nexAudioEnvelop;-><init>(Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexAudioEnvelopOf;)V

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mAudioEnvelop:Lcom/nexstreaming/nexeditorsdk/nexAudioEnvelop;

    :goto_3
    iget v0, p1, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mTemplateEffectID:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTemplateEffectID:I

    iget-object v0, p1, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mCollageDrawInfoID:Ljava/lang/String;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mCollageDrawInfoID:Ljava/lang/String;

    iget v0, p1, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mTemplateAudioPos:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTemplateAudioPos:I

    iget-object v0, p1, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mDrawInfos:Ljava/util/List;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mDrawInfos:Ljava/util/List;

    iget-boolean v0, p1, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mOverlappedTransition:Z

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mOverlappedTransition:Z

    iget-boolean v0, p1, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mMediaInfoUseCache:Z

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mMediaInfoUseCache:Z

    iget v0, p1, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mStartTime:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mStartTime:I

    iget v0, p1, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mEndTime:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mEndTime:I

    iget v0, p1, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mDuration:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mDuration:I

    iget-object v0, p1, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v0, p1, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mCustomLUT_A:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mCustomLUT_A:I

    iget v0, p1, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mCustomLUT_B:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mCustomLUT_B:I

    iget v0, p1, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mCustomLUT_Power:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mCustomLUT_Power:I

    iget v0, p1, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mRotate:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mRotate:I

    iget-object v0, p1, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mColorEffect:Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexColorEffectOf;

    if-nez v0, :cond_5

    iput-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mColorEffect:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    goto :goto_4

    :cond_5
    new-instance v0, Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    iget-object v2, p1, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mColorEffect:Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexColorEffectOf;

    invoke-direct {v0, v2}, Lcom/nexstreaming/nexeditorsdk/nexColorEffect;-><init>(Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexColorEffectOf;)V

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mColorEffect:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    :goto_4
    iget-boolean v0, p1, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mPropertySlowVideoMode:Z

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mPropertySlowVideoMode:Z

    iget v0, p1, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mAVSyncAudioStartTime:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mAVSyncAudioStartTime:I

    iget v0, p1, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->m_ClipVolume:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_ClipVolume:I

    iget v0, p1, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->m_BGMVolume:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_BGMVolume:I

    iget-object v0, p1, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mVideoEdit:Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexVideoClipEditOf;

    if-nez v0, :cond_6

    iput-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mVideoEdit:Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    goto :goto_5

    :cond_6
    new-instance v0, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    iget-object v2, p1, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mVideoEdit:Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexVideoClipEditOf;

    invoke-direct {v0, p0, v2}, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;-><init>(Lcom/nexstreaming/nexeditorsdk/nexClip;Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexVideoClipEditOf;)V

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mVideoEdit:Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    :goto_5
    iget-object v0, p1, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mAudioEdit:Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexAudioEditOf;

    if-nez v0, :cond_7

    iput-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mAudioEdit:Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;

    goto :goto_6

    :cond_7
    new-instance v0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;

    iget-object p1, p1, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mAudioEdit:Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexAudioEditOf;

    invoke-direct {v0, p0, p1}, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;-><init>(Lcom/nexstreaming/nexeditorsdk/nexClip;Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexAudioEditOf;)V

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mAudioEdit:Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;

    :goto_6
    return-void
.end method

.method public loadVideoClipThumbnails(Lcom/nexstreaming/nexeditorsdk/nexClip$OnLoadVideoClipThumbnailListener;)I
    .locals 2

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v0, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mClipType:I

    const/4 v1, 0x4

    if-eq v0, v1, :cond_0

    const/4 p1, -0x1

    return p1

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mThumbnails:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/h;

    if-nez v0, :cond_3

    iget-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_gettingThumbnails:Z

    if-nez v0, :cond_3

    iget-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_getThumbnailsFailed:Z

    if-nez v0, :cond_3

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getMediaInfo()Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;

    move-result-object v0

    if-nez v0, :cond_2

    if-eqz p1, :cond_1

    sget v0, Lcom/nexstreaming/nexeditorsdk/nexClip$OnLoadVideoClipThumbnailListener;->kEvent_systemError:I

    invoke-virtual {p1, v0}, Lcom/nexstreaming/nexeditorsdk/nexClip$OnLoadVideoClipThumbnailListener;->onLoadThumbnailResult(I)V

    :cond_1
    sget p1, Lcom/nexstreaming/nexeditorsdk/nexClip$OnLoadVideoClipThumbnailListener;->kEvent_systemError:I

    return p1

    :cond_2
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_gettingThumbnails:Z

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->b()Lcom/nexstreaming/app/common/task/ResultTask;

    move-result-object v0

    new-instance v1, Lcom/nexstreaming/nexeditorsdk/nexClip$5;

    invoke-direct {v1, p0, p1}, Lcom/nexstreaming/nexeditorsdk/nexClip$5;-><init>(Lcom/nexstreaming/nexeditorsdk/nexClip;Lcom/nexstreaming/nexeditorsdk/nexClip$OnLoadVideoClipThumbnailListener;)V

    invoke-virtual {v0, v1}, Lcom/nexstreaming/app/common/task/ResultTask;->onResultAvailable(Lcom/nexstreaming/app/common/task/ResultTask$OnResultAvailableListener;)Lcom/nexstreaming/app/common/task/ResultTask;

    move-result-object v0

    new-instance v1, Lcom/nexstreaming/nexeditorsdk/nexClip$1;

    invoke-direct {v1, p0, p1}, Lcom/nexstreaming/nexeditorsdk/nexClip$1;-><init>(Lcom/nexstreaming/nexeditorsdk/nexClip;Lcom/nexstreaming/nexeditorsdk/nexClip$OnLoadVideoClipThumbnailListener;)V

    invoke-virtual {v0, v1}, Lcom/nexstreaming/app/common/task/ResultTask;->onFailure(Lcom/nexstreaming/app/common/task/Task$OnFailListener;)Lcom/nexstreaming/app/common/task/ResultTask;

    goto :goto_0

    :cond_3
    iget-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_gettingThumbnails:Z

    if-eqz v0, :cond_5

    if-eqz p1, :cond_4

    sget v0, Lcom/nexstreaming/nexeditorsdk/nexClip$OnLoadVideoClipThumbnailListener;->kEvent_Running:I

    invoke-virtual {p1, v0}, Lcom/nexstreaming/nexeditorsdk/nexClip$OnLoadVideoClipThumbnailListener;->onLoadThumbnailResult(I)V

    :cond_4
    sget p1, Lcom/nexstreaming/nexeditorsdk/nexClip$OnLoadVideoClipThumbnailListener;->kEvent_Running:I

    return p1

    :cond_5
    iget-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_getThumbnailsFailed:Z

    if-eqz v0, :cond_7

    if-eqz p1, :cond_6

    sget v0, Lcom/nexstreaming/nexeditorsdk/nexClip$OnLoadVideoClipThumbnailListener;->kEvent_loadFail:I

    invoke-virtual {p1, v0}, Lcom/nexstreaming/nexeditorsdk/nexClip$OnLoadVideoClipThumbnailListener;->onLoadThumbnailResult(I)V

    :cond_6
    sget p1, Lcom/nexstreaming/nexeditorsdk/nexClip$OnLoadVideoClipThumbnailListener;->kEvent_loadFail:I

    return p1

    :cond_7
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mThumbnails:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/h;

    if-eqz v0, :cond_8

    if-eqz p1, :cond_8

    sget v0, Lcom/nexstreaming/nexeditorsdk/nexClip$OnLoadVideoClipThumbnailListener;->kEvent_loadCompleted:I

    invoke-virtual {p1, v0}, Lcom/nexstreaming/nexeditorsdk/nexClip$OnLoadVideoClipThumbnailListener;->onLoadThumbnailResult(I)V

    :cond_8
    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method removeDrawInfos(I)V
    .locals 3

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mDrawInfos:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getSubEffectID()I

    move-result v2

    if-ne v2, p1, :cond_0

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mDrawInfos:Ljava/util/List;

    invoke-interface {p1, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    return-void

    :cond_1
    return-void
.end method

.method public replaceClip(Ljava/lang/String;)I
    .locals 4

    invoke-static {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->transCodingPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTransCodingPath:Ljava/lang/String;

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTransCodingPath:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTransCodingPath:Ljava/lang/String;

    goto :goto_0

    :cond_0
    move-object v0, p1

    :goto_0
    iget-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mMediaInfoUseCache:Z

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getMediaInfo()Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;

    move-result-object v2

    const/4 v3, 0x0

    invoke-static {v0, v1, v2, v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->resolveClip(Ljava/lang/String;ZLcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;Z)Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    move-result-object v0

    iget v1, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mSuppertedResult:I

    if-eqz v1, :cond_1

    iget p1, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mSuppertedResult:I

    return p1

    :cond_1
    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v1, v1, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mClipType:I

    iget v2, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mClipType:I

    if-eq v1, v2, :cond_2

    const/4 p1, -0x1

    return p1

    :cond_2
    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mPath:Ljava/lang/String;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    invoke-virtual {p0, v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setProjectUpdateSignal(Z)V

    return v3
.end method

.method resetFaceDetectProcessed()V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mFacedetectProcessed:Z

    return-void
.end method

.method protected runDuration()I
    .locals 2

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v0, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mClipType:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mVideoEdit:Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v0, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mTotalTime:I

    return v0

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v0, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mTotalTime:I

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mVideoEdit:Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    iget v1, v1, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;->mTrimStartDuration:I

    sub-int/2addr v0, v1

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mVideoEdit:Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    iget v1, v1, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;->mTrimEndDuration:I

    sub-int/2addr v0, v1

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mVideoEdit:Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;->getSpeedControl()I

    move-result v1

    div-int/lit8 v1, v1, 0x64

    int-to-float v1, v1

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    mul-int v0, v0, v1

    return v0

    :cond_1
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v0, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mClipType:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_2

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mDuration:I

    return v0

    :cond_2
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v0, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mTotalTime:I

    return v0
.end method

.method public setAVSyncTime(I)V
    .locals 2

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getClipType()I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_2

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->hasAudio()Z

    move-result v0

    if-eqz v0, :cond_2

    const/16 v0, -0x1f4

    if-ge p1, v0, :cond_0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mAVSyncAudioStartTime:I

    return-void

    :cond_0
    const/16 v0, 0x1f4

    if-le p1, v0, :cond_1

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mAVSyncAudioStartTime:I

    goto :goto_0

    :cond_1
    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mAVSyncAudioStartTime:I

    :cond_2
    :goto_0
    return-void
.end method

.method protected setAssetResource(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mIsAssetResource:Z

    return-void
.end method

.method protected final setAttachmentState(ZLcom/nexstreaming/nexeditorsdk/b;)V
    .locals 0

    iput-object p2, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mObserver:Lcom/nexstreaming/nexeditorsdk/b;

    iput-boolean p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mProjectAttachment:Z

    iget-boolean p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mProjectAttachment:Z

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTransitionEffect:Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTransitionEffect:Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;->setObserver(Lcom/nexstreaming/nexeditorsdk/b;)V

    :cond_0
    return-void
.end method

.method public setAudioOnOff(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mAudioOnOff:Z

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setProjectUpdateSignal(Z)V

    return-void
.end method

.method public setBGMVolume(I)Z
    .locals 1

    if-ltz p1, :cond_1

    const/16 v0, 0x64

    if-le p1, v0, :cond_0

    goto :goto_0

    :cond_0
    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_BGMVolume:I

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setProjectUpdateSignal(Z)V

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method public setBrightness(I)Z
    .locals 1

    const/16 v0, -0xff

    if-lt p1, v0, :cond_1

    const/16 v0, 0xff

    if-le p1, v0, :cond_0

    goto :goto_0

    :cond_0
    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_Brightness:I

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setProjectUpdateSignal(Z)V

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method public setClipPropertySlowVideoMode(Z)Z
    .locals 4

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v0, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mClipType:I

    const/4 v1, 0x0

    const/4 v2, 0x4

    if-eq v0, v2, :cond_0

    const-string p1, "nexClip"

    const-string v0, "was  not video"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v1

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v0, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mFramesPerSecond:I

    const/16 v2, 0x3c

    if-ge v0, v2, :cond_1

    const-string p1, "nexClip"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "not supported fps="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v2, v2, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mFramesPerSecond:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v1

    :cond_1
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v0, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mSeekPointCount:I

    const/4 v2, 0x1

    if-lez v0, :cond_2

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v0, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mSeekPointCount:I

    goto :goto_0

    :cond_2
    const/4 v0, 0x1

    :goto_0
    iget-object v3, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v3, v3, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mVideoTotalTime:I

    div-int/2addr v3, v0

    const/16 v0, 0x258

    if-le v3, v0, :cond_3

    const-string p1, "nexClip"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "not supported idr dur="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v1

    :cond_3
    iput-boolean p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mPropertySlowVideoMode:Z

    return v2
.end method

.method public setClipVolume(I)Z
    .locals 1

    if-ltz p1, :cond_1

    const/16 v0, 0xc8

    if-le p1, v0, :cond_0

    goto :goto_0

    :cond_0
    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_ClipVolume:I

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setProjectUpdateSignal(Z)V

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method setCollageDrawInfoID(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mCollageDrawInfoID:Ljava/lang/String;

    return-void
.end method

.method public setColorEffect(Lcom/nexstreaming/nexeditorsdk/nexColorEffect;)V
    .locals 0

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mColorEffect:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setProjectUpdateSignal(Z)V

    return-void
.end method

.method public setContrast(I)Z
    .locals 1

    const/16 v0, -0xff

    if-lt p1, v0, :cond_1

    const/16 v0, 0xff

    if-le p1, v0, :cond_0

    goto :goto_0

    :cond_0
    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_Contrast:I

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setProjectUpdateSignal(Z)V

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method public setCustomLUTA(I)V
    .locals 0

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mCustomLUT_A:I

    return-void
.end method

.method public setCustomLUTB(I)V
    .locals 0

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mCustomLUT_B:I

    return-void
.end method

.method public setCustomLUTPower(I)V
    .locals 0

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mCustomLUT_Power:I

    return-void
.end method

.method setFaceDetectProcessed(ZLandroid/graphics/Rect;)V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mFacedetectProcessed:Z

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mFaceDetected:I

    iput-object p2, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mFaceRect:Landroid/graphics/Rect;

    return-void
.end method

.method public setImageClipDuration(I)V
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mDuration:I

    if-eq v0, p1, :cond_0

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setProjectUpdateSignal(Z)V

    :cond_0
    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mDuration:I

    return-void
.end method

.method public setMainThumbnail(Landroid/graphics/Bitmap;)V
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mSingleThumbnail:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mSingleThumbnail:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->clear()V

    :cond_0
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mSingleThumbnail:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method protected setMotionTrackedVideo(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->isMotionTrackedVideo:Z

    return-void
.end method

.method protected setProjectUpdateSignal(Z)V
    .locals 1

    iget-boolean p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mProjectAttachment:Z

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mObserver:Lcom/nexstreaming/nexeditorsdk/b;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mObserver:Lcom/nexstreaming/nexeditorsdk/b;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/nexstreaming/nexeditorsdk/b;->updateTimeLine(Z)V

    :cond_0
    return-void
.end method

.method public setRotateDegree(I)V
    .locals 1

    const/16 v0, 0x168

    if-lt p1, v0, :cond_0

    const/4 p1, 0x0

    :cond_0
    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mRotate:I

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mCrop:Lcom/nexstreaming/nexeditorsdk/nexCrop;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mCrop:Lcom/nexstreaming/nexeditorsdk/nexCrop;

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mRotate:I

    invoke-virtual {p1, v0}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setRotate(I)V

    :cond_1
    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setProjectUpdateSignal(Z)V

    return-void
.end method

.method public setSaturation(I)Z
    .locals 1

    const/16 v0, -0xff

    if-lt p1, v0, :cond_1

    const/16 v0, 0xff

    if-le p1, v0, :cond_0

    goto :goto_0

    :cond_0
    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->m_Saturation:I

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setProjectUpdateSignal(Z)V

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method public setSolidColor(I)Z
    .locals 4

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->isSolid()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    const-string v0, "@solid:%08X.jpg"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v3, v1

    invoke-static {v0, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mPath:Ljava/lang/String;

    return v2

    :cond_0
    return v1
.end method

.method setTemplateAudioPos(I)V
    .locals 0

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTemplateAudioPos:I

    return-void
.end method

.method setTemplateEffectID(I)V
    .locals 0

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTemplateEffectID:I

    return-void
.end method

.method setTemplateOverlappedTransition(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mOverlappedTransition:Z

    return-void
.end method

.method public setVignetteEffect(Z)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    iput-boolean p1, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mVignette:Z

    return-void
.end method

.method public setVoiceChangerFactor(I)V
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v0, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mClipType:I

    const/4 v1, 0x4

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexClip;->mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

    iget v0, v0, Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;->mClipType:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_1

    :cond_0
    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getAudioEdit()Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->setVoiceChangerFactor(I)V

    :cond_1
    return-void
.end method
