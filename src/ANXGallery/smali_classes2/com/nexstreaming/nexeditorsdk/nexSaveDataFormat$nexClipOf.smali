.class public Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;
.super Ljava/lang/Object;
.source "nexSaveDataFormat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "nexClipOf"
.end annotation


# instance fields
.field public mAVSyncAudioStartTime:I

.field public mAudioEdit:Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexAudioEditOf;

.field public mAudioEnvelop:Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexAudioEnvelopOf;

.field public mAudioOnOff:Z

.field public mClipEffect:Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexEffectOf;

.field public mCollageDrawInfoID:Ljava/lang/String;

.field public mColorEffect:Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexColorEffectOf;

.field public mCrop:Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;

.field public mCustomLUT_A:I

.field public mCustomLUT_B:I

.field public mCustomLUT_Power:I

.field public mDrawInfos:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;",
            ">;"
        }
    .end annotation
.end field

.field public mDuration:I

.field public mEndTime:I

.field public mFaceDetected:I

.field public mFaceRect:Landroid/graphics/Rect;

.field public mFacedetectProcessed:Z

.field public mInfo:Lcom/nexstreaming/nexeditorsdk/nexClip$ClipInfo;

.field public mMediaInfoUseCache:Z

.field public mOverlappedTransition:Z

.field public mPath:Ljava/lang/String;

.field public mPropertySlowVideoMode:Z

.field public mRotate:I

.field public mStartTime:I

.field public mTemplateAudioPos:I

.field public mTemplateEffectID:I

.field public mTitleEffectEndTime:I

.field public mTitleEffectStartTime:I

.field public mTransCodingPath:Ljava/lang/String;

.field public mTransitionEffect:Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexEffectOf;

.field public mVideoEdit:Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexVideoClipEditOf;

.field public mVignette:Z

.field public m_BGMVolume:I

.field public m_Brightness:I

.field public m_ClipVolume:I

.field public m_Contrast:I

.field public m_Saturation:I

.field public misMustDownSize:Z


# direct methods
.method public constructor <init>()V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mPath:Ljava/lang/String;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mTransCodingPath:Ljava/lang/String;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mClipEffect:Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexEffectOf;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mTransitionEffect:Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexEffectOf;

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mAudioOnOff:Z

    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mFacedetectProcessed:Z

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mFaceDetected:I

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mAudioEnvelop:Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexAudioEnvelopOf;

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mTemplateEffectID:I

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mTemplateAudioPos:I

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mOverlappedTransition:Z

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mMediaInfoUseCache:Z

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mStartTime:I

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mEndTime:I

    const/16 v0, 0x1770

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mDuration:I

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mCustomLUT_A:I

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mCustomLUT_B:I

    const v0, 0x186a0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mCustomLUT_Power:I

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->mAVSyncAudioStartTime:I

    const/16 v0, 0x64

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->m_ClipVolume:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;->m_BGMVolume:I

    return-void
.end method
