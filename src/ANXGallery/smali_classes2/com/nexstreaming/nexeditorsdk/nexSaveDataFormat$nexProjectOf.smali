.class public Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexProjectOf;
.super Ljava/lang/Object;
.source "nexSaveDataFormat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "nexProjectOf"
.end annotation


# instance fields
.field public mAudioFadeInTime:I

.field public mAudioFadeOutTime:I

.field public mBGMTrimEndTime:I

.field public mBGMTrimStartTime:I

.field public mBGMVolumeScale:F

.field public mBackGroundMusic:Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;

.field public mEndingTitle:Ljava/lang/String;

.field public mLoopBGM:Z

.field public mManualVolCtl:I

.field public mOpeningTitle:Ljava/lang/String;

.field public mPrimaryItems:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;",
            ">;"
        }
    .end annotation
.end field

.field public mProjectVolume:I

.field public mSecondaryItems:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexAudioItemOf;",
            ">;"
        }
    .end annotation
.end field

.field public mStartTimeBGM:I

.field public mSubEffectInfo:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;",
            ">;"
        }
    .end annotation
.end field

.field public mTemplateApplyMode:I

.field public mTemplateOverlappedTransition:Z

.field public mTopEffectInfo:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;",
            ">;"
        }
    .end annotation
.end field

.field public mUseThemeMusic2BGM:Z


# direct methods
.method public constructor <init>()V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x64

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexProjectOf;->mProjectVolume:I

    const/4 v0, 0x0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexProjectOf;->mManualVolCtl:I

    const/16 v1, 0xc8

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexProjectOf;->mAudioFadeInTime:I

    const/16 v1, 0x1388

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexProjectOf;->mAudioFadeOutTime:I

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexProjectOf;->mOpeningTitle:Ljava/lang/String;

    iput-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexProjectOf;->mEndingTitle:Ljava/lang/String;

    const/high16 v2, 0x3f000000    # 0.5f

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexProjectOf;->mBGMVolumeScale:F

    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexProjectOf;->mUseThemeMusic2BGM:Z

    iput-boolean v2, p0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexProjectOf;->mLoopBGM:Z

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexProjectOf;->mStartTimeBGM:I

    iput-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexProjectOf;->mBackGroundMusic:Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexClipOf;

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexProjectOf;->mTemplateApplyMode:I

    iput-boolean v2, p0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexProjectOf;->mTemplateOverlappedTransition:Z

    return-void
.end method
