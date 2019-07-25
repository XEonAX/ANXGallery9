.class public Lcom/miui/gallery/video/editor/NexVideoEditor;
.super Lcom/miui/gallery/video/editor/VideoEditor;
.source "NexVideoEditor.java"

# interfaces
.implements Lcom/nexstreaming/nexeditorsdk/nexEngineListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/video/editor/NexVideoEditor$SmartEffectTemplate;,
        Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;,
        Lcom/miui/gallery/video/editor/NexVideoEditor$Change;,
        Lcom/miui/gallery/video/editor/NexVideoEditor$VideoEditorAdjust;,
        Lcom/miui/gallery/video/editor/NexVideoEditor$TextClip;,
        Lcom/miui/gallery/video/editor/NexVideoEditor$TrimInfo;,
        Lcom/miui/gallery/video/editor/NexVideoEditor$FilterEffect;,
        Lcom/miui/gallery/video/editor/NexVideoEditor$SourceAudioChange;,
        Lcom/miui/gallery/video/editor/NexVideoEditor$BGMEdit;,
        Lcom/miui/gallery/video/editor/NexVideoEditor$ApplyTask;
    }
.end annotation


# static fields
.field private static final sWhiteList:[Ljava/lang/String;


# instance fields
.field private mApplyedEditValue:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/miui/gallery/video/editor/NexVideoEditor$Change;",
            ">;"
        }
    .end annotation
.end field

.field private mCloneProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

.field private mContext:Landroid/content/Context;

.field private mCurrentEnocdeStateInterface:Lcom/miui/gallery/video/editor/VideoEditor$EnocdeStateInterface;

.field private mEndClip:Lcom/miui/gallery/video/editor/NexVideoEditor$TextClip;

.field private mEngin:Lcom/nexstreaming/nexeditorsdk/nexEngine;

.field private mEngineState:I

.field private mHandler:Landroid/os/Handler;

.field private mHasApplyedSmartEffect:Z

.field private mHasUsingAutoTrim:Z

.field private mIsDestroy:Z

.field private mMainVideoClip:Lcom/nexstreaming/nexeditorsdk/nexClip;

.field private mNexProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

.field private mOpenClip:Lcom/miui/gallery/video/editor/NexVideoEditor$TextClip;

.field private mPauseOnCompletedListener:Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;

.field private mRatio:F

.field private mSavedEditValue:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/miui/gallery/video/editor/NexVideoEditor$Change;",
            ">;"
        }
    .end annotation
.end field

.field private mSeekTarget:I

.field private mTempEditValue:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/miui/gallery/video/editor/NexVideoEditor$Change;",
            ">;"
        }
    .end annotation
.end field

.field private mThumbnailPickCursor:I

.field private mTrimStateInterface:Lcom/miui/gallery/video/editor/VideoEditor$TrimStateInterface;

.field private mVideoBitrate:I

.field private mVideoFrames:I

.field private mVideoHeight:I

.field private mVideoPath:Ljava/lang/String;

.field private mVideoRotation:I

.field private mVideoWidth:I

.field private preLoadVideoThumbnails:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/video/editor/VideoThumbnail;",
            ">;"
        }
    .end annotation
.end field

.field private seekOnCompletedListener:Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;

.field private setTimeSuccess:Z


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const-string v0, "riva"

    const-string v1, "pine"

    const-string v2, "cereus"

    filled-new-array {v0, v1, v2}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/video/editor/NexVideoEditor;->sWhiteList:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/VideoEditor;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngineState:I

    iput v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mSeekTarget:I

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mThumbnailPickCursor:I

    new-instance v1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mHandler:Landroid/os/Handler;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->preLoadVideoThumbnails:Ljava/util/List;

    iput-boolean v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mHasUsingAutoTrim:Z

    iput-boolean v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mHasApplyedSmartEffect:Z

    iput-boolean v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->setTimeSuccess:Z

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mTempEditValue:Ljava/util/HashMap;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mApplyedEditValue:Ljava/util/HashMap;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mSavedEditValue:Ljava/util/HashMap;

    iput-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mContext:Landroid/content/Context;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/video/editor/NexVideoEditor;)Ljava/util/List;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->preLoadVideoThumbnails:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/video/editor/NexVideoEditor;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mVideoRotation:I

    return p0
.end method

.method static synthetic access$1000(Lcom/miui/gallery/video/editor/NexVideoEditor;)F
    .locals 0

    iget p0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mRatio:F

    return p0
.end method

.method static synthetic access$1100(Lcom/miui/gallery/video/editor/NexVideoEditor;Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/video/editor/NexVideoEditor;->loadThumbnail(Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;)V

    return-void
.end method

.method static synthetic access$1300(Lcom/miui/gallery/video/editor/NexVideoEditor;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/video/editor/NexVideoEditor;->doSeek(I)V

    return-void
.end method

.method static synthetic access$1400(Lcom/miui/gallery/video/editor/NexVideoEditor;)Lcom/nexstreaming/nexeditorsdk/nexClip;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mMainVideoClip:Lcom/nexstreaming/nexeditorsdk/nexClip;

    return-object p0
.end method

.method static synthetic access$1402(Lcom/miui/gallery/video/editor/NexVideoEditor;Lcom/nexstreaming/nexeditorsdk/nexClip;)Lcom/nexstreaming/nexeditorsdk/nexClip;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mMainVideoClip:Lcom/nexstreaming/nexeditorsdk/nexClip;

    return-object p1
.end method

.method static synthetic access$1500(Lcom/miui/gallery/video/editor/NexVideoEditor;)Lcom/nexstreaming/nexeditorsdk/nexProject;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mNexProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    return-object p0
.end method

.method static synthetic access$1502(Lcom/miui/gallery/video/editor/NexVideoEditor;Lcom/nexstreaming/nexeditorsdk/nexProject;)Lcom/nexstreaming/nexeditorsdk/nexProject;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mNexProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    return-object p1
.end method

.method static synthetic access$1600(Lcom/miui/gallery/video/editor/NexVideoEditor;)Ljava/util/HashMap;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mApplyedEditValue:Ljava/util/HashMap;

    return-object p0
.end method

.method static synthetic access$1702(Lcom/miui/gallery/video/editor/NexVideoEditor;Lcom/miui/gallery/video/editor/NexVideoEditor$TextClip;)Lcom/miui/gallery/video/editor/NexVideoEditor$TextClip;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mOpenClip:Lcom/miui/gallery/video/editor/NexVideoEditor$TextClip;

    return-object p1
.end method

.method static synthetic access$1800(Lcom/miui/gallery/video/editor/NexVideoEditor;)Lcom/miui/gallery/video/editor/NexVideoEditor$TextClip;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEndClip:Lcom/miui/gallery/video/editor/NexVideoEditor$TextClip;

    return-object p0
.end method

.method static synthetic access$1802(Lcom/miui/gallery/video/editor/NexVideoEditor;Lcom/miui/gallery/video/editor/NexVideoEditor$TextClip;)Lcom/miui/gallery/video/editor/NexVideoEditor$TextClip;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEndClip:Lcom/miui/gallery/video/editor/NexVideoEditor$TextClip;

    return-object p1
.end method

.method static synthetic access$1900(Lcom/miui/gallery/video/editor/NexVideoEditor;)Ljava/util/HashMap;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mTempEditValue:Ljava/util/HashMap;

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/video/editor/NexVideoEditor;)Lcom/nexstreaming/nexeditorsdk/nexEngine;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngin:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    return-object p0
.end method

.method static synthetic access$202(Lcom/miui/gallery/video/editor/NexVideoEditor;Lcom/nexstreaming/nexeditorsdk/nexEngine;)Lcom/nexstreaming/nexeditorsdk/nexEngine;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngin:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    return-object p1
.end method

.method static synthetic access$2100(Lcom/miui/gallery/video/editor/NexVideoEditor;)Lcom/miui/gallery/video/editor/VideoEditor$TrimStateInterface;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mTrimStateInterface:Lcom/miui/gallery/video/editor/VideoEditor$TrimStateInterface;

    return-object p0
.end method

.method static synthetic access$2202(Lcom/miui/gallery/video/editor/NexVideoEditor;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mHasUsingAutoTrim:Z

    return p1
.end method

.method static synthetic access$2300(Lcom/miui/gallery/video/editor/NexVideoEditor;)Landroid/os/Handler;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mHandler:Landroid/os/Handler;

    return-object p0
.end method

.method static synthetic access$2600(Lcom/miui/gallery/video/editor/NexVideoEditor;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mHasApplyedSmartEffect:Z

    return p0
.end method

.method static synthetic access$2602(Lcom/miui/gallery/video/editor/NexVideoEditor;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mHasApplyedSmartEffect:Z

    return p1
.end method

.method static synthetic access$2700(Lcom/miui/gallery/video/editor/NexVideoEditor;)Lcom/nexstreaming/nexeditorsdk/nexProject;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mCloneProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    return-object p0
.end method

.method static synthetic access$2702(Lcom/miui/gallery/video/editor/NexVideoEditor;Lcom/nexstreaming/nexeditorsdk/nexProject;)Lcom/nexstreaming/nexeditorsdk/nexProject;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mCloneProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    return-object p1
.end method

.method static synthetic access$2800(Lcom/miui/gallery/video/editor/NexVideoEditor;Ljava/lang/String;)Lcom/nexstreaming/nexeditorsdk/nexColorEffect;
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/video/editor/NexVideoEditor;->finEffect(Ljava/lang/String;)Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$2900(Lcom/miui/gallery/video/editor/NexVideoEditor;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mVideoWidth:I

    return p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/video/editor/NexVideoEditor;)Landroid/content/Context;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mContext:Landroid/content/Context;

    return-object p0
.end method

.method static synthetic access$3000(Lcom/miui/gallery/video/editor/NexVideoEditor;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mVideoHeight:I

    return p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/video/editor/NexVideoEditor;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/video/editor/NexVideoEditor;->setEngineState(I)V

    return-void
.end method

.method static synthetic access$500(Lcom/miui/gallery/video/editor/NexVideoEditor;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/miui/gallery/video/editor/VideoEditor$NotSupportVideoException;
        }
    .end annotation

    invoke-direct {p0, p1}, Lcom/miui/gallery/video/editor/NexVideoEditor;->loadVideo(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$600(Lcom/miui/gallery/video/editor/NexVideoEditor;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/miui/gallery/video/editor/VideoEditor$NotSupportVideoException;
        }
    .end annotation

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->handleHardwareSupport()V

    return-void
.end method

.method static synthetic access$700(Lcom/miui/gallery/video/editor/NexVideoEditor;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->configEngine()V

    return-void
.end method

.method static synthetic access$800(Lcom/miui/gallery/video/editor/NexVideoEditor;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->loadProject()V

    return-void
.end method

.method static synthetic access$900(Lcom/miui/gallery/video/editor/NexVideoEditor;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mIsDestroy:Z

    return p0
.end method

.method private addChange(Lcom/miui/gallery/video/editor/NexVideoEditor$Change;Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;)Z
    .locals 3

    iget v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngineState:I

    const/4 v1, 0x1

    const/4 v2, 0x0

    packed-switch v0, :pswitch_data_0

    const-string p1, "NexVideoEditor"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "addChange is not allowed at EngineState :"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngineState:I

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return v2

    :pswitch_0
    const/16 v0, 0x65

    invoke-direct {p0, v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->setEngineState(I)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngin:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngin:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    new-instance v2, Lcom/miui/gallery/video/editor/NexVideoEditor$12;

    invoke-direct {v2, p0, p1, p2}, Lcom/miui/gallery/video/editor/NexVideoEditor$12;-><init>(Lcom/miui/gallery/video/editor/NexVideoEditor;Lcom/miui/gallery/video/editor/NexVideoEditor$Change;Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;)V

    invoke-virtual {v0, v2}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->stop(Lcom/nexstreaming/nexeditorsdk/nexEngine$OnCompletionListener;)V

    :cond_0
    return v1

    :pswitch_1
    invoke-interface {p1}, Lcom/miui/gallery/video/editor/NexVideoEditor$Change;->applyChange()V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngin:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->updateProject()V

    invoke-direct {p0, v2}, Lcom/miui/gallery/video/editor/NexVideoEditor;->setEngineState(I)V

    if-eqz p2, :cond_1

    invoke-interface {p2}, Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;->onCompleted()V

    :cond_1
    return v1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private configEngine()V
    .locals 3

    iget v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mVideoRotation:I

    rem-int/lit16 v0, v0, 0xb4

    if-nez v0, :cond_0

    new-instance v0, Lcom/nexstreaming/nexeditorsdk/nexAspectProfile;

    iget v1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mVideoWidth:I

    iget v2, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mVideoHeight:I

    invoke-direct {v0, v1, v2}, Lcom/nexstreaming/nexeditorsdk/nexAspectProfile;-><init>(II)V

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/nexstreaming/nexeditorsdk/nexAspectProfile;

    iget v1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mVideoHeight:I

    iget v2, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mVideoWidth:I

    invoke-direct {v0, v1, v2}, Lcom/nexstreaming/nexeditorsdk/nexAspectProfile;-><init>(II)V

    :goto_0
    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexApplicationConfig;->setAspectProfile(Lcom/nexstreaming/nexeditorsdk/nexAspectProfile;)V

    return-void
.end method

.method private createProject(Lcom/nexstreaming/nexeditorsdk/nexClip;)Lcom/nexstreaming/nexeditorsdk/nexProject;
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mNexProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mNexProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    invoke-virtual {v0, v2}, Lcom/nexstreaming/nexeditorsdk/nexProject;->allClear(Z)V

    iput-object v1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mNexProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    :cond_0
    if-eqz p1, :cond_1

    iget v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mVideoRotation:I

    invoke-virtual {p1, v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setRotateDegree(I)V

    new-instance v0, Lcom/nexstreaming/nexeditorsdk/nexProject;

    invoke-direct {v0}, Lcom/nexstreaming/nexeditorsdk/nexProject;-><init>()V

    invoke-virtual {v0, p1}, Lcom/nexstreaming/nexeditorsdk/nexProject;->add(Lcom/nexstreaming/nexeditorsdk/nexClip;)I

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object p1

    sget-object v1, Lcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;->FIT:Lcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;

    invoke-virtual {p1, v2, v1}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->randomizeStartEndPosition(ZLcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;)V

    return-object v0

    :cond_1
    return-object v1
.end method

.method private doSeek(I)V
    .locals 3

    iget v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngineState:I

    const/16 v1, 0x68

    if-eqz v0, :cond_1

    const/4 v2, 0x2

    if-eq v0, v2, :cond_1

    if-eq v0, v1, :cond_0

    const-string p1, "NexVideoEditor"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "setFilter is not allowed at EngineState :"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngineState:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    iput p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mSeekTarget:I

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->updataSeek()V

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->setTimeSuccess:Z

    invoke-direct {p0, v1}, Lcom/miui/gallery/video/editor/NexVideoEditor;->setEngineState(I)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngin:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-virtual {v0, p1}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->seek(I)V

    :goto_0
    return-void
.end method

.method private finEffect(Ljava/lang/String;)Lcom/nexstreaming/nexeditorsdk/nexColorEffect;
    .locals 3

    if-eqz p1, :cond_1

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexColorEffect;->getPresetList()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexColorEffect;->getPresetName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    return-object v1

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method private handleHardwareSupport()V
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/miui/gallery/video/editor/VideoEditor$NotSupportVideoException;
        }
    .end annotation

    sget-object v0, Lcom/miui/gallery/video/editor/NexVideoEditor;->sWhiteList:[Ljava/lang/String;

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sget-object v1, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-ge v0, v1, :cond_1

    return-void

    :cond_1
    iget v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mVideoRotation:I

    rem-int/lit16 v0, v0, 0xb4

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mMainVideoClip:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getWidth()I

    move-result v0

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mMainVideoClip:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getHeight()I

    move-result v0

    :goto_0
    iget v1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mVideoRotation:I

    rem-int/lit16 v1, v1, 0xb4

    if-nez v1, :cond_3

    iget-object v1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mMainVideoClip:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getHeight()I

    move-result v1

    goto :goto_1

    :cond_3
    iget-object v1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mMainVideoClip:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getWidth()I

    move-result v1

    :goto_1
    iget-object v2, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mMainVideoClip:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getVideoCodecType()Ljava/lang/String;

    move-result-object v2

    const-string v3, "NexVideoEditor"

    const-string v4, "videoCodecType: %s"

    invoke-static {v3, v4, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v3, Landroid/media/MediaCodecList;

    const/4 v4, 0x0

    invoke-direct {v3, v4}, Landroid/media/MediaCodecList;-><init>(I)V

    invoke-virtual {v3}, Landroid/media/MediaCodecList;->getCodecInfos()[Landroid/media/MediaCodecInfo;

    move-result-object v3

    array-length v5, v3

    const/4 v6, 0x0

    :goto_2
    if-ge v6, v5, :cond_b

    aget-object v7, v3, v6

    invoke-virtual {v7}, Landroid/media/MediaCodecInfo;->isEncoder()Z

    move-result v8

    if-eqz v8, :cond_4

    goto/16 :goto_5

    :cond_4
    invoke-virtual {v7}, Landroid/media/MediaCodecInfo;->getSupportedTypes()[Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x0

    :goto_3
    if-eqz v8, :cond_a

    array-length v10, v8

    if-ge v9, v10, :cond_a

    aget-object v10, v8, v9

    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-nez v10, :cond_9

    aget-object v10, v8, v9

    const-string v11, "video/"

    invoke-virtual {v10, v11}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v10

    if-nez v10, :cond_5

    goto :goto_4

    :cond_5
    aget-object v10, v8, v9

    invoke-virtual {v10, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v10

    if-nez v10, :cond_7

    const-string v10, "video/h264"

    invoke-virtual {v2, v10}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_6

    aget-object v10, v8, v9

    const-string v11, "video/avc"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v10

    if-nez v10, :cond_7

    :cond_6
    const-string v10, "video/avc"

    invoke-virtual {v2, v10}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_9

    aget-object v10, v8, v9

    const-string v11, "video/h264"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_9

    :cond_7
    aget-object v10, v8, v9

    invoke-virtual {v7, v10}, Landroid/media/MediaCodecInfo;->getCapabilitiesForType(Ljava/lang/String;)Landroid/media/MediaCodecInfo$CodecCapabilities;

    move-result-object v10

    invoke-virtual {v10}, Landroid/media/MediaCodecInfo$CodecCapabilities;->getVideoCapabilities()Landroid/media/MediaCodecInfo$VideoCapabilities;

    move-result-object v10

    if-nez v10, :cond_8

    goto :goto_4

    :cond_8
    iget-object v11, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mMainVideoClip:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v11}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getFramesPerSecond()I

    move-result v11

    int-to-double v11, v11

    invoke-virtual {v10, v0, v1, v11, v12}, Landroid/media/MediaCodecInfo$VideoCapabilities;->areSizeAndRateSupported(IID)Z

    move-result v10

    if-eqz v10, :cond_9

    const-string v0, "NexVideoEditor"

    const-string v1, "the MediaCodecInfo name is: %s, and the  phone is supported to edit:  %s"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v7}, Landroid/media/MediaCodecInfo;->getName()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v4

    const-string v3, "true"

    const/4 v4, 0x1

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_9
    :goto_4
    add-int/lit8 v9, v9, 0x1

    goto :goto_3

    :cond_a
    :goto_5
    add-int/lit8 v6, v6, 0x1

    goto/16 :goto_2

    :cond_b
    const-string v0, "NexVideoEditor"

    const-string v1, "the device can not support to edit the video."

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Lcom/miui/gallery/video/editor/VideoEditor$NotSupportVideoException;

    invoke-direct {v0, p0}, Lcom/miui/gallery/video/editor/VideoEditor$NotSupportVideoException;-><init>(Lcom/miui/gallery/video/editor/VideoEditor;)V

    throw v0
.end method

.method private haveChange(Ljava/lang/String;)Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mSavedEditValue:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mApplyedEditValue:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    const/4 v1, 0x0

    if-nez v0, :cond_0

    if-nez p1, :cond_0

    return v1

    :cond_0
    if-eqz v0, :cond_1

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    return v1

    :cond_1
    const/4 p1, 0x1

    return p1
.end method

.method private loadMainThumbnail(Ljava/lang/String;)V
    .locals 2

    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v0

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/UriUtils;->toSafeString(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object p1

    new-instance v1, Lcom/miui/gallery/video/editor/NexVideoEditor$1;

    invoke-direct {v1, p0}, Lcom/miui/gallery/video/editor/NexVideoEditor$1;-><init>(Lcom/miui/gallery/video/editor/NexVideoEditor;)V

    invoke-virtual {v0, p1, v1}, Lcom/nostra13/universalimageloader/core/ImageLoader;->loadImage(Ljava/lang/String;Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;)V

    return-void
.end method

.method private loadProject()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mMainVideoClip:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-direct {p0, v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->createProject(Lcom/nexstreaming/nexeditorsdk/nexClip;)Lcom/nexstreaming/nexeditorsdk/nexProject;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mNexProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mNexProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getLastPrimaryClip()Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mMainVideoClip:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getRotateInMeta()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setRotateDegree(I)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mNexProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getLastPrimaryClip()Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v0

    sget-object v1, Lcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;->FIT:Lcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->randomizeStartEndPosition(ZLcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngin:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    iget-object v1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mNexProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    invoke-virtual {v0, v1}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->setProject(Lcom/nexstreaming/nexeditorsdk/nexProject;)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngin:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->updateProject()V

    return-void
.end method

.method private loadThumbnail(Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;)V
    .locals 11

    iget v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mVideoRotation:I

    rem-int/lit16 v0, v0, 0xb4

    const/16 v1, 0x5a

    const/16 v2, 0xa0

    if-nez v0, :cond_0

    const/16 v4, 0xa0

    goto :goto_0

    :cond_0
    const/16 v4, 0x5a

    :goto_0
    iget v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mVideoRotation:I

    rem-int/lit16 v0, v0, 0xb4

    if-nez v0, :cond_1

    const/16 v5, 0x5a

    goto :goto_1

    :cond_1
    const/16 v5, 0xa0

    :goto_1
    iget-object v3, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mMainVideoClip:Lcom/nexstreaming/nexeditorsdk/nexClip;

    const/4 v6, 0x0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mMainVideoClip:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getTotalTime()I

    move-result v7

    const/16 v8, 0x32

    iget v9, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mVideoRotation:I

    new-instance v10, Lcom/miui/gallery/video/editor/NexOnGetVideoClipDetailThumbnailsListener;

    new-instance v0, Lcom/miui/gallery/video/editor/NexVideoEditor$3;

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/video/editor/NexVideoEditor$3;-><init>(Lcom/miui/gallery/video/editor/NexVideoEditor;Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;)V

    invoke-direct {v10, v0}, Lcom/miui/gallery/video/editor/NexOnGetVideoClipDetailThumbnailsListener;-><init>(Lcom/miui/gallery/video/editor/VideoEditor$OnGetVideoThumbnailListener;)V

    invoke-virtual/range {v3 .. v10}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getVideoClipDetailThumbnails(IIIIIILcom/nexstreaming/nexeditorsdk/nexClip$OnGetVideoClipDetailThumbnailsListener;)I

    return-void
.end method

.method private loadVideo(Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/miui/gallery/video/editor/VideoEditor$NotSupportVideoException;
        }
    .end annotation

    const/4 v0, 0x1

    invoke-static {p1, v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getSupportedClip(Ljava/lang/String;Z)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object p1

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getWidth()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mVideoWidth:I

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getHeight()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mVideoHeight:I

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getRotateInMeta()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mVideoRotation:I

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getVideoBitrate()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mVideoBitrate:I

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getFramesPerSecond()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mVideoFrames:I

    iput-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mMainVideoClip:Lcom/nexstreaming/nexeditorsdk/nexClip;

    iget p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mVideoRotation:I

    rem-int/lit16 p1, p1, 0xb4

    if-nez p1, :cond_0

    iget p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mVideoWidth:I

    int-to-float p1, p1

    iget v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mVideoHeight:I

    int-to-float v0, v0

    div-float/2addr p1, v0

    iput p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mRatio:F

    goto :goto_0

    :cond_0
    iget p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mVideoHeight:I

    int-to-float p1, p1

    iget v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mVideoWidth:I

    int-to-float v0, v0

    div-float/2addr p1, v0

    iput p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mRatio:F

    :goto_0
    return-void

    :cond_1
    new-instance p1, Lcom/miui/gallery/video/editor/VideoEditor$NotSupportVideoException;

    invoke-direct {p1, p0}, Lcom/miui/gallery/video/editor/VideoEditor$NotSupportVideoException;-><init>(Lcom/miui/gallery/video/editor/VideoEditor;)V

    throw p1
.end method

.method private pause(Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;)V
    .locals 2

    iget v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngineState:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngin:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    if-eqz v0, :cond_0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mPauseOnCompletedListener:Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;

    const/16 p1, 0x66

    invoke-direct {p0, p1}, Lcom/miui/gallery/video/editor/NexVideoEditor;->setEngineState(I)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngin:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->pause()V

    goto :goto_0

    :cond_0
    const-string p1, "NexVideoEditor"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "pause is not allowed at EngineState :"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngineState:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method private setEngineState(I)V
    .locals 2

    const/16 v0, -0x1f4

    if-eq p1, v0, :cond_1

    const/16 v0, 0x1f4

    const/4 v1, 0x0

    if-eq p1, v0, :cond_0

    const/4 v0, 0x1

    packed-switch p1, :pswitch_data_0

    const/16 v1, 0xc8

    packed-switch p1, :pswitch_data_1

    goto :goto_0

    :pswitch_0
    invoke-virtual {p0, v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->keepScreenOn(Z)V

    invoke-virtual {p0, v1}, Lcom/miui/gallery/video/editor/NexVideoEditor;->setState(I)V

    goto :goto_0

    :pswitch_1
    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->setState(I)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mDisplayWrapper:Lcom/miui/gallery/video/editor/widget/DisplayWrapper;

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/widget/DisplayWrapper;->hideThumbnail()V

    goto :goto_0

    :pswitch_2
    invoke-virtual {p0, v1}, Lcom/miui/gallery/video/editor/NexVideoEditor;->setState(I)V

    goto :goto_0

    :pswitch_3
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->setState(I)V

    invoke-virtual {p0, v1}, Lcom/miui/gallery/video/editor/NexVideoEditor;->keepScreenOn(Z)V

    goto :goto_0

    :pswitch_4
    invoke-virtual {p0, v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->setState(I)V

    invoke-virtual {p0, v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->keepScreenOn(Z)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mDisplayWrapper:Lcom/miui/gallery/video/editor/widget/DisplayWrapper;

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/widget/DisplayWrapper;->hideThumbnail()V

    goto :goto_0

    :pswitch_5
    invoke-virtual {p0, v1}, Lcom/miui/gallery/video/editor/NexVideoEditor;->setState(I)V

    invoke-virtual {p0, v1}, Lcom/miui/gallery/video/editor/NexVideoEditor;->keepScreenOn(Z)V

    goto :goto_0

    :cond_0
    invoke-virtual {p0, v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->setState(I)V

    invoke-virtual {p0, v1}, Lcom/miui/gallery/video/editor/NexVideoEditor;->keepScreenOn(Z)V

    goto :goto_0

    :cond_1
    invoke-virtual {p0, v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->setState(I)V

    :goto_0
    iput p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngineState:I

    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x64
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method private setTrimInfo(Lcom/miui/gallery/video/editor/NexVideoEditor$TrimInfo;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mTempEditValue:Ljava/util/HashMap;

    const-string v1, "trim"

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private updataSeek()V
    .locals 4

    iget v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngineState:I

    const/16 v1, 0x68

    if-ne v0, v1, :cond_3

    iget v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mSeekTarget:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngin:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->getCurrentPlayTimeTime()I

    move-result v0

    iget v2, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mSeekTarget:I

    sub-int/2addr v0, v2

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v0

    const/16 v2, 0x96

    if-le v0, v2, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngin:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    iget v2, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mSeekTarget:I

    invoke-virtual {v0, v2}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->seekIDROnly(I)V

    const-string v0, "NexVideoEditor"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "SEEK IDR progress :"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mSeekTarget:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngin:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    iget v2, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mSeekTarget:I

    invoke-virtual {v0, v2}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->seek(I)V

    const-string v0, "NexVideoEditor"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "progress :"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mSeekTarget:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    iput v1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mSeekTarget:I

    goto :goto_2

    :cond_1
    iget-boolean v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->setTimeSuccess:Z

    if-eqz v0, :cond_2

    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->setEngineState(I)V

    goto :goto_1

    :cond_2
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->setEngineState(I)V

    :goto_1
    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->seekOnCompletedListener:Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->seekOnCompletedListener:Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;

    invoke-interface {v0}, Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;->onCompleted()V

    :cond_3
    :goto_2
    return-void
.end method


# virtual methods
.method public adjustBrightness(I)V
    .locals 2

    iget v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngineState:I

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngineState:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    :cond_0
    new-instance v0, Lcom/miui/gallery/video/editor/NexVideoEditor$13;

    invoke-direct {v0, p0}, Lcom/miui/gallery/video/editor/NexVideoEditor$13;-><init>(Lcom/miui/gallery/video/editor/NexVideoEditor;)V

    invoke-virtual {p0, v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->apply(Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;)Z

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngin:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-virtual {v0, p1}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->setBrightness(I)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngin:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    sget-object v1, Lcom/nexstreaming/nexeditorsdk/nexEngine$FastPreviewOption;->adj_brightness:Lcom/nexstreaming/nexeditorsdk/nexEngine$FastPreviewOption;

    invoke-virtual {v0, v1, p1}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->fastPreview(Lcom/nexstreaming/nexeditorsdk/nexEngine$FastPreviewOption;I)V

    return-void
.end method

.method public adjustContrast(I)V
    .locals 2

    iget v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngineState:I

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngineState:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    :cond_0
    new-instance v0, Lcom/miui/gallery/video/editor/NexVideoEditor$15;

    invoke-direct {v0, p0}, Lcom/miui/gallery/video/editor/NexVideoEditor$15;-><init>(Lcom/miui/gallery/video/editor/NexVideoEditor;)V

    invoke-virtual {p0, v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->apply(Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;)Z

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngin:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-virtual {v0, p1}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->setContrast(I)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngin:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    sget-object v1, Lcom/nexstreaming/nexeditorsdk/nexEngine$FastPreviewOption;->adj_contrast:Lcom/nexstreaming/nexeditorsdk/nexEngine$FastPreviewOption;

    invoke-virtual {v0, v1, p1}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->fastPreview(Lcom/nexstreaming/nexeditorsdk/nexEngine$FastPreviewOption;I)V

    return-void
.end method

.method public adjustSaturation(I)V
    .locals 2

    iget v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngineState:I

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngineState:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    :cond_0
    new-instance v0, Lcom/miui/gallery/video/editor/NexVideoEditor$14;

    invoke-direct {v0, p0}, Lcom/miui/gallery/video/editor/NexVideoEditor$14;-><init>(Lcom/miui/gallery/video/editor/NexVideoEditor;)V

    invoke-virtual {p0, v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->apply(Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;)Z

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngin:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-virtual {v0, p1}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->setSaturation(I)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngin:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    sget-object v1, Lcom/nexstreaming/nexeditorsdk/nexEngine$FastPreviewOption;->adj_saturation:Lcom/nexstreaming/nexeditorsdk/nexEngine$FastPreviewOption;

    invoke-virtual {v0, v1, p1}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->fastPreview(Lcom/nexstreaming/nexeditorsdk/nexEngine$FastPreviewOption;I)V

    return-void
.end method

.method public adjustSharpness(I)V
    .locals 2

    iget v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngineState:I

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngineState:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    :cond_0
    new-instance v0, Lcom/miui/gallery/video/editor/NexVideoEditor$17;

    invoke-direct {v0, p0}, Lcom/miui/gallery/video/editor/NexVideoEditor$17;-><init>(Lcom/miui/gallery/video/editor/NexVideoEditor;)V

    invoke-virtual {p0, v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->apply(Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;)Z

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngin:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-virtual {v0, p1}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->setSharpness(I)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngin:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    sget-object v1, Lcom/nexstreaming/nexeditorsdk/nexEngine$FastPreviewOption;->adj_sharpness:Lcom/nexstreaming/nexeditorsdk/nexEngine$FastPreviewOption;

    invoke-virtual {v0, v1, p1}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->fastPreview(Lcom/nexstreaming/nexeditorsdk/nexEngine$FastPreviewOption;I)V

    return-void
.end method

.method public adjustVignetteRange(I)V
    .locals 2

    iget v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngineState:I

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngineState:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    :cond_0
    new-instance v0, Lcom/miui/gallery/video/editor/NexVideoEditor$16;

    invoke-direct {v0, p0}, Lcom/miui/gallery/video/editor/NexVideoEditor$16;-><init>(Lcom/miui/gallery/video/editor/NexVideoEditor;)V

    invoke-virtual {p0, v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->apply(Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;)Z

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngin:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-virtual {v0, p1}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->setVignetteRange(I)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngin:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    sget-object v1, Lcom/nexstreaming/nexeditorsdk/nexEngine$FastPreviewOption;->adj_vignetteRange:Lcom/nexstreaming/nexeditorsdk/nexEngine$FastPreviewOption;

    invoke-virtual {v0, v1, p1}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->fastPreview(Lcom/nexstreaming/nexeditorsdk/nexEngine$FastPreviewOption;I)V

    return-void
.end method

.method public apply(Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;)Z
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/video/editor/NexVideoEditor;->applyAsync(Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;)Z

    move-result p1

    return p1
.end method

.method public applyAsync(Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;)Z
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mTempEditValue:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_0

    invoke-interface {p1}, Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;->onCompleted()V

    return v1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mTempEditValue:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result v0

    new-array v0, v0, [Lcom/miui/gallery/video/editor/NexVideoEditor$Change;

    iget-object v2, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mTempEditValue:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2, v0}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    iget-object v2, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mTempEditValue:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->clear()V

    iget v2, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngineState:I

    packed-switch v2, :pswitch_data_0

    const/4 p1, 0x0

    return p1

    :pswitch_0
    const/16 v2, 0x65

    invoke-direct {p0, v2}, Lcom/miui/gallery/video/editor/NexVideoEditor;->setEngineState(I)V

    iget-object v2, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngin:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    new-instance v3, Lcom/miui/gallery/video/editor/NexVideoEditor$9;

    invoke-direct {v3, p0, p1, v0}, Lcom/miui/gallery/video/editor/NexVideoEditor$9;-><init>(Lcom/miui/gallery/video/editor/NexVideoEditor;Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;[Lcom/miui/gallery/video/editor/NexVideoEditor$Change;)V

    invoke-virtual {v2, v3}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->stop(Lcom/nexstreaming/nexeditorsdk/nexEngine$OnCompletionListener;)V

    return v1

    :pswitch_1
    const/16 v2, 0x64

    invoke-direct {p0, v2}, Lcom/miui/gallery/video/editor/NexVideoEditor;->setEngineState(I)V

    new-instance v2, Lcom/miui/gallery/video/editor/NexVideoEditor$ApplyTask;

    invoke-direct {v2, p0, p1}, Lcom/miui/gallery/video/editor/NexVideoEditor$ApplyTask;-><init>(Lcom/miui/gallery/video/editor/NexVideoEditor;Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;)V

    sget-object p1, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    invoke-virtual {v2, p1, v0}, Lcom/miui/gallery/video/editor/NexVideoEditor$ApplyTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    return v1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public autoTrim(ILcom/miui/gallery/video/editor/VideoEditor$TrimStateInterface;)V
    .locals 7

    iget v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngineState:I

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->isSupportAutoTrim()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mMainVideoClip:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getTotalTime()I

    move-result v0

    if-ge p1, v0, :cond_0

    iput-object p2, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mTrimStateInterface:Lcom/miui/gallery/video/editor/VideoEditor$TrimStateInterface;

    const/16 p2, 0x6a

    invoke-direct {p0, p2}, Lcom/miui/gallery/video/editor/NexVideoEditor;->setEngineState(I)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngin:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    iget-object p2, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mMainVideoClip:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {p2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getPath()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    div-int/lit8 v3, p1, 0x5

    const/4 v4, 0x5

    const/4 v5, 0x0

    new-instance v6, Lcom/miui/gallery/video/editor/NexVideoEditor$10;

    invoke-direct {v6, p0, p1}, Lcom/miui/gallery/video/editor/NexVideoEditor$10;-><init>(Lcom/miui/gallery/video/editor/NexVideoEditor;I)V

    invoke-virtual/range {v0 .. v6}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->autoTrim(Ljava/lang/String;ZIIILcom/nexstreaming/nexeditorsdk/nexEngine$OnAutoTrimResultListener;)I

    iget-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mTrimStateInterface:Lcom/miui/gallery/video/editor/VideoEditor$TrimStateInterface;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mTrimStateInterface:Lcom/miui/gallery/video/editor/VideoEditor$TrimStateInterface;

    invoke-interface {p1}, Lcom/miui/gallery/video/editor/VideoEditor$TrimStateInterface;->onTrimStart()V

    :cond_0
    return-void
.end method

.method public cancelExport(Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;)V
    .locals 2

    iget v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngineState:I

    const/16 v1, 0x69

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngin:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    new-instance v1, Lcom/miui/gallery/video/editor/NexVideoEditor$5;

    invoke-direct {v1, p0, p1}, Lcom/miui/gallery/video/editor/NexVideoEditor$5;-><init>(Lcom/miui/gallery/video/editor/NexVideoEditor;Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;)V

    invoke-virtual {v0, v1}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->stop(Lcom/nexstreaming/nexeditorsdk/nexEngine$OnCompletionListener;)V

    :cond_0
    return-void
.end method

.method public checkIDRSupport()Z
    .locals 7

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mMainVideoClip:Lcom/nexstreaming/nexeditorsdk/nexClip;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mMainVideoClip:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getSeekPointCount()I

    move-result v2

    if-lez v2, :cond_0

    iget-object v2, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mMainVideoClip:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getSeekPointInterval()I

    move-result v2

    const/16 v3, 0xfa0

    if-gt v2, v3, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    const-string v3, "NexVideoEditor"

    const-string v4, "get interval costs %dms"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    sub-long/2addr v5, v0

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {v3, v4, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return v2
.end method

.method public destroy()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngin:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngin:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    const/4 v1, 0x0

    check-cast v1, Lcom/nexstreaming/nexeditorsdk/nexEngineView;

    invoke-virtual {v0, v1}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->setView(Lcom/nexstreaming/nexeditorsdk/nexEngineView;)I

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngin:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->stop()V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngin:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexApplicationConfig;->releaseNativeEngine(Lcom/nexstreaming/nexeditorsdk/nexEngine;)V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->keepScreenOn(Z)V

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mIsDestroy:Z

    return-void
.end method

.method public export(Ljava/lang/String;Lcom/miui/gallery/video/editor/VideoEditor$EnocdeStateInterface;)V
    .locals 9

    const-string v0, "NexVideoEditor"

    const-string v1, "export engine state: %d "

    iget v2, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngineState:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngineState:I

    packed-switch v0, :pswitch_data_0

    const-string p1, "NexVideoEditor"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "export is not allowed at EngineState :"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngineState:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x0

    const/4 v0, -0x1

    invoke-interface {p2, p1, v0, v0}, Lcom/miui/gallery/video/editor/VideoEditor$EnocdeStateInterface;->onEncodeEnd(ZII)V

    goto :goto_4

    :pswitch_0
    const/16 v0, 0x65

    invoke-direct {p0, v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->setEngineState(I)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngin:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    new-instance v1, Lcom/miui/gallery/video/editor/NexVideoEditor$11;

    invoke-direct {v1, p0, p1, p2}, Lcom/miui/gallery/video/editor/NexVideoEditor$11;-><init>(Lcom/miui/gallery/video/editor/NexVideoEditor;Ljava/lang/String;Lcom/miui/gallery/video/editor/VideoEditor$EnocdeStateInterface;)V

    invoke-virtual {v0, v1}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->stop(Lcom/nexstreaming/nexeditorsdk/nexEngine$OnCompletionListener;)V

    goto :goto_4

    :pswitch_1
    const/16 v0, 0x69

    invoke-direct {p0, v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->setEngineState(I)V

    iput-object p2, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mCurrentEnocdeStateInterface:Lcom/miui/gallery/video/editor/VideoEditor$EnocdeStateInterface;

    iget-object v1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngin:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    iget v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mVideoRotation:I

    rem-int/lit16 v0, v0, 0xb4

    if-nez v0, :cond_0

    iget v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mVideoWidth:I

    :goto_0
    move v3, v0

    goto :goto_1

    :cond_0
    iget v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mVideoHeight:I

    goto :goto_0

    :goto_1
    iget v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mVideoRotation:I

    rem-int/lit16 v0, v0, 0xb4

    if-nez v0, :cond_1

    iget v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mVideoHeight:I

    :goto_2
    move v4, v0

    goto :goto_3

    :cond_1
    iget v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mVideoWidth:I

    goto :goto_2

    :goto_3
    iget v5, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mVideoBitrate:I

    const-wide v6, 0x7fffffffffffffffL

    const/4 v8, 0x0

    move-object v2, p1

    invoke-virtual/range {v1 .. v8}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->export(Ljava/lang/String;IIIJI)I

    invoke-interface {p2}, Lcom/miui/gallery/video/editor/VideoEditor$EnocdeStateInterface;->onEncodeStart()V

    :goto_4
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public getCurrentDisplayRatio()F
    .locals 1

    iget v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mRatio:F

    return v0
.end method

.method public getProjectTotalTime()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngin:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngin:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->getProject()Lcom/nexstreaming/nexeditorsdk/nexProject;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalTime()I

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public getVideoFrames()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mVideoFrames:I

    return v0
.end method

.method public getVideoPath()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mVideoPath:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, ""

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mVideoPath:Ljava/lang/String;

    return-object v0
.end method

.method public getVideoStartTime()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mMainVideoClip:Lcom/nexstreaming/nexeditorsdk/nexClip;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mMainVideoClip:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getProjectStartTime()I

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public getVideoTotalTime()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mMainVideoClip:Lcom/nexstreaming/nexeditorsdk/nexClip;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mMainVideoClip:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getTotalTime()I

    move-result v0

    return v0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mNexProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mNexProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalTime()I

    move-result v0

    return v0

    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method public hasEdit()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mApplyedEditValue:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result v0

    if-gtz v0, :cond_1

    iget-boolean v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mHasUsingAutoTrim:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public haveSavedEditState()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mSavedEditValue:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->isEmpty()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public isSourceAudioEnable()Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mMainVideoClip:Lcom/nexstreaming/nexeditorsdk/nexClip;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mMainVideoClip:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getClipVolume()I

    move-result v0

    const/16 v1, 0x64

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public isSupportAutoTrim()Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mMainVideoClip:Lcom/nexstreaming/nexeditorsdk/nexClip;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->getProjectTotalTime()I

    move-result v0

    const/16 v1, 0x7530

    if-le v0, v1, :cond_0

    iget-boolean v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mHasApplyedSmartEffect:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public keepScreenOn(Z)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mDisplayWrapper:Lcom/miui/gallery/video/editor/widget/DisplayWrapper;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mDisplayWrapper:Lcom/miui/gallery/video/editor/widget/DisplayWrapper;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/video/editor/widget/DisplayWrapper;->setKeepScreenOn(Z)V

    :cond_0
    return-void
.end method

.method public load(Ljava/lang/String;Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;)V
    .locals 8

    iput-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mVideoPath:Ljava/lang/String;

    invoke-direct {p0, p1}, Lcom/miui/gallery/video/editor/NexVideoEditor;->loadMainThumbnail(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    const/16 v0, 0x64

    invoke-direct {p0, v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->setEngineState(I)V

    iget-object v6, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mContext:Landroid/content/Context;

    new-instance v7, Lcom/miui/gallery/video/editor/NexVideoEditor$2;

    move-object v0, v7

    move-object v1, p0

    move-object v4, p1

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/miui/gallery/video/editor/NexVideoEditor$2;-><init>(Lcom/miui/gallery/video/editor/NexVideoEditor;JLjava/lang/String;Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;)V

    const/4 p1, 0x1

    invoke-static {v6, p1, v7}, Lcom/miui/gallery/video/editor/NexEngine;->init(Landroid/content/Context;ILjava/lang/Runnable;)V

    return-void
.end method

.method public onCheckDirectExport(I)V
    .locals 0

    return-void
.end method

.method public onClipInfoDone()V
    .locals 0

    return-void
.end method

.method public onEncodingDone(ZI)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mCurrentEnocdeStateInterface:Lcom/miui/gallery/video/editor/VideoEditor$EnocdeStateInterface;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mCurrentEnocdeStateInterface:Lcom/miui/gallery/video/editor/VideoEditor$EnocdeStateInterface;

    xor-int/lit8 p1, p1, 0x1

    invoke-interface {v0, p1, p2, v1}, Lcom/miui/gallery/video/editor/VideoEditor$EnocdeStateInterface;->onEncodeEnd(ZII)V

    :cond_0
    invoke-direct {p0, v1}, Lcom/miui/gallery/video/editor/NexVideoEditor;->setEngineState(I)V

    const-string p1, "NexVideoEditor"

    const-string v0, "onEncodingDone errorCode : %s"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-static {p1, v0, p2}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mApplyedEditValue:Ljava/util/HashMap;

    invoke-virtual {p1}, Ljava/util/HashMap;->size()I

    move-result p1

    if-lez p1, :cond_7

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iget-object p2, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mApplyedEditValue:Ljava/util/HashMap;

    invoke-virtual {p2}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_1
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const-string v2, "bg_audio"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/video/editor/NexVideoEditor$BGMEdit;

    const-string v1, "usingBGM"

    invoke-static {v0}, Lcom/miui/gallery/video/editor/NexVideoEditor$BGMEdit;->access$2400(Lcom/miui/gallery/video/editor/NexVideoEditor$BGMEdit;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_2
    const-string v2, "filter"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/video/editor/NexVideoEditor$FilterEffect;

    const-string v1, "usingFilter"

    invoke-static {v0}, Lcom/miui/gallery/video/editor/NexVideoEditor$FilterEffect;->access$2500(Lcom/miui/gallery/video/editor/NexVideoEditor$FilterEffect;)Lcom/miui/gallery/video/editor/Filter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/Filter;->getFilterId()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_3
    const-string v0, "source_audio"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    const-string v0, "disable_source_audio"

    const-string v1, "true"

    invoke-virtual {p1, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_4
    const-string v0, "trim"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    const-string v0, "usingTRIM"

    const-string v1, "trim"

    invoke-virtual {p1, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_5
    const-string v0, "edit_type_auto_water_mark_text"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "usingText"

    const-string v1, "text"

    invoke-virtual {p1, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_6
    const-string p2, "video_editor"

    const-string v0, "video_editor_using_effect"

    invoke-static {p2, v0, p1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    :cond_7
    return-void
.end method

.method public onEncodingProgress(I)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mCurrentEnocdeStateInterface:Lcom/miui/gallery/video/editor/VideoEditor$EnocdeStateInterface;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mCurrentEnocdeStateInterface:Lcom/miui/gallery/video/editor/VideoEditor$EnocdeStateInterface;

    invoke-interface {v0, p1}, Lcom/miui/gallery/video/editor/VideoEditor$EnocdeStateInterface;->onEncodeProgress(I)V

    :cond_0
    const-string v0, "NexVideoEditor"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "engine encoding : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onFastPreviewStartDone(III)V
    .locals 0

    return-void
.end method

.method public onFastPreviewStopDone(I)V
    .locals 0

    return-void
.end method

.method public onFastPreviewTimeDone(I)V
    .locals 0

    return-void
.end method

.method public onPlayEnd()V
    .locals 2

    iget v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngineState:I

    const/16 v1, 0x69

    if-eq v0, v1, :cond_0

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->setEngineState(I)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/video/editor/NexVideoEditor;->seek(ILcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;)V

    const-string v0, "NexVideoEditor"

    const-string v1, "onPlayEnd"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public onPlayFail(II)V
    .locals 4

    const-string v0, "NexVideoEditor"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onPlayFail : error code :"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "clipId"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v0, v1, p2}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    const-string v0, "errorcofr"

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, v0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "state"

    iget v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngineState:I

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "video_editor"

    const-string v0, "video_editor_play_failed"

    invoke-static {p1, v0, p2}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    iget p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngineState:I

    const/4 p2, 0x1

    const/4 v0, 0x0

    if-eq p1, p2, :cond_1

    const/16 p2, 0x69

    if-eq p1, p2, :cond_0

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mCurrentEnocdeStateInterface:Lcom/miui/gallery/video/editor/VideoEditor$EnocdeStateInterface;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mCurrentEnocdeStateInterface:Lcom/miui/gallery/video/editor/VideoEditor$EnocdeStateInterface;

    const/4 p2, -0x1

    invoke-interface {p1, v0, p2, p2}, Lcom/miui/gallery/video/editor/VideoEditor$EnocdeStateInterface;->onEncodeEnd(ZII)V

    :cond_1
    :goto_0
    invoke-direct {p0, v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->setEngineState(I)V

    return-void
.end method

.method public onPlayStart()V
    .locals 2

    iget v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngineState:I

    const/16 v1, 0x69

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->setEngineState(I)V

    const-string v0, "NexVideoEditor"

    const-string v1, "onPlayStart"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public onPreviewPeakMeter(II)V
    .locals 0

    return-void
.end method

.method public onProgressThumbnailCaching(II)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mTrimStateInterface:Lcom/miui/gallery/video/editor/VideoEditor$TrimStateInterface;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mTrimStateInterface:Lcom/miui/gallery/video/editor/VideoEditor$TrimStateInterface;

    invoke-interface {v0, p1}, Lcom/miui/gallery/video/editor/VideoEditor$TrimStateInterface;->onTrimProgress(I)V

    :cond_0
    const-string v0, "NexVideoEditor"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "engine onProgressThumbnailCaching : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, "/"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onSeekStateChanged(Z)V
    .locals 3

    const-string v0, "NexVideoEditor"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onSeekStateChanged "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onSetTimeDone(I)V
    .locals 3

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->setTimeSuccess:Z

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->updataSeek()V

    const-string v0, "NexVideoEditor"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onSetTimeDone : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onSetTimeFail(I)V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->updataSeek()V

    const-string p1, "NexVideoEditor"

    const-string v0, "onSetTimeFail"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onSetTimeIgnored()V
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->updataSeek()V

    const-string v0, "NexVideoEditor"

    const-string v1, "onSetTimeIgnored"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onStateChange(II)V
    .locals 3

    const/4 v0, 0x2

    if-ne p1, v0, :cond_0

    const/4 v1, 0x1

    if-ne p2, v1, :cond_0

    iget v1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngineState:I

    const/16 v2, 0x66

    if-ne v1, v2, :cond_0

    invoke-direct {p0, v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->setEngineState(I)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mPauseOnCompletedListener:Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mPauseOnCompletedListener:Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;

    invoke-interface {v0}, Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;->onCompleted()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mPauseOnCompletedListener:Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;

    :cond_0
    const-string v0, "NexVideoEditor"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "nexEngineState : old state :"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " new state :"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onTimeChange(I)V
    .locals 2

    iget v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngineState:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/video/editor/NexVideoEditor;->onTimeChanged(I)V

    :cond_0
    return-void
.end method

.method public pause()V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->pause(Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;)V

    return-void
.end method

.method public pickThumbnail(I)Landroid/graphics/Bitmap;
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mThumbnailPickCursor:I

    invoke-virtual {p0, p1}, Lcom/miui/gallery/video/editor/NexVideoEditor;->pickThumbnailSerial(I)Landroid/graphics/Bitmap;

    move-result-object p1

    return-object p1
.end method

.method public pickThumbnailSerial(I)Landroid/graphics/Bitmap;
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->preLoadVideoThumbnails:Ljava/util/List;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->preLoadVideoThumbnails:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->preLoadVideoThumbnails:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const v2, 0x7fffffff

    iget v3, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mThumbnailPickCursor:I

    :goto_0
    if-ge v3, v0, :cond_0

    iget-object v4, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->preLoadVideoThumbnails:Ljava/util/List;

    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/miui/gallery/video/editor/VideoThumbnail;

    invoke-virtual {v4}, Lcom/miui/gallery/video/editor/VideoThumbnail;->getIntrinsicTime()I

    move-result v5

    sub-int/2addr v5, p1

    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    move-result v5

    if-ge v5, v2, :cond_0

    invoke-virtual {v4}, Lcom/miui/gallery/video/editor/VideoThumbnail;->getIntrinsicTime()I

    move-result v1

    sub-int/2addr v1, p1

    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    move-result v2

    iput v3, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mThumbnailPickCursor:I

    invoke-virtual {v4}, Lcom/miui/gallery/video/editor/VideoThumbnail;->getThumbnail()Landroid/graphics/Bitmap;

    move-result-object v1

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    return-object v1
.end method

.method public play()V
    .locals 3

    iget v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngineState:I

    if-eqz v0, :cond_0

    const-string v0, "NexVideoEditor"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "play is not allowed at EngineState :"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngineState:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngin:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    if-eqz v0, :cond_1

    const/16 v0, 0x67

    invoke-direct {p0, v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->setEngineState(I)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngin:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->play()V

    :cond_1
    :goto_0
    return-void
.end method

.method public release()V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->destroy()V

    invoke-static {}, Lcom/miui/gallery/video/editor/NexEngine;->releaseEngine()V

    return-void
.end method

.method public resetProject(Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;)Z
    .locals 1

    new-instance v0, Lcom/miui/gallery/video/editor/NexVideoEditor$8;

    invoke-direct {v0, p0}, Lcom/miui/gallery/video/editor/NexVideoEditor$8;-><init>(Lcom/miui/gallery/video/editor/NexVideoEditor;)V

    invoke-direct {p0, v0, p1}, Lcom/miui/gallery/video/editor/NexVideoEditor;->addChange(Lcom/miui/gallery/video/editor/NexVideoEditor$Change;Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;)Z

    move-result p1

    return p1
.end method

.method public restoreEditState()V
    .locals 4

    const-string v0, "filter"

    invoke-direct {p0, v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->haveChange(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mSavedEditValue:Ljava/util/HashMap;

    const-string v2, "filter"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/video/editor/NexVideoEditor$FilterEffect;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/video/editor/NexVideoEditor$FilterEffect;

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/video/editor/NexVideoEditor$FilterEffect;-><init>(Lcom/miui/gallery/video/editor/NexVideoEditor;Lcom/miui/gallery/video/editor/Filter;)V

    :cond_0
    iget-object v2, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mTempEditValue:Ljava/util/HashMap;

    const-string v3, "filter"

    invoke-virtual {v2, v3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    const-string v0, "bg_audio"

    invoke-direct {p0, v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->haveChange(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mSavedEditValue:Ljava/util/HashMap;

    const-string v2, "bg_audio"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/video/editor/NexVideoEditor$BGMEdit;

    if-nez v0, :cond_2

    new-instance v0, Lcom/miui/gallery/video/editor/NexVideoEditor$BGMEdit;

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/video/editor/NexVideoEditor$BGMEdit;-><init>(Lcom/miui/gallery/video/editor/NexVideoEditor;Ljava/lang/String;)V

    :cond_2
    iget-object v2, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mTempEditValue:Ljava/util/HashMap;

    const-string v3, "bg_audio"

    invoke-virtual {v2, v3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_3
    const-string v0, "source_audio"

    invoke-direct {p0, v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->haveChange(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mSavedEditValue:Ljava/util/HashMap;

    const-string v2, "source_audio"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/video/editor/NexVideoEditor$SourceAudioChange;

    if-nez v0, :cond_4

    new-instance v0, Lcom/miui/gallery/video/editor/NexVideoEditor$SourceAudioChange;

    const/4 v2, 0x1

    invoke-direct {v0, p0, v2}, Lcom/miui/gallery/video/editor/NexVideoEditor$SourceAudioChange;-><init>(Lcom/miui/gallery/video/editor/NexVideoEditor;Z)V

    :cond_4
    iget-object v2, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mTempEditValue:Ljava/util/HashMap;

    const-string v3, "source_audio"

    invoke-virtual {v2, v3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_5
    const-string v0, "edit_type_water_mark"

    invoke-direct {p0, v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->haveChange(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mSavedEditValue:Ljava/util/HashMap;

    const-string v2, "edit_type_water_mark"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;

    if-nez v0, :cond_6

    new-instance v0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;

    invoke-direct {v0, p0}, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;-><init>(Lcom/miui/gallery/video/editor/NexVideoEditor;)V

    :cond_6
    iget-object v2, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mTempEditValue:Ljava/util/HashMap;

    const-string v3, "edit_type_water_mark"

    invoke-virtual {v2, v3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_7
    const-string v0, "edit_type_auto_water_mark_text"

    invoke-direct {p0, v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->haveChange(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mSavedEditValue:Ljava/util/HashMap;

    const-string v2, "edit_type_auto_water_mark_text"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/video/editor/NexVideoEditor$TextClip;

    if-nez v0, :cond_8

    new-instance v0, Lcom/miui/gallery/video/editor/NexVideoEditor$TextClip;

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/video/editor/NexVideoEditor$TextClip;-><init>(Lcom/miui/gallery/video/editor/NexVideoEditor;Lcom/miui/gallery/video/editor/NexVideoEditor$1;)V

    :cond_8
    iget-object v2, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mTempEditValue:Ljava/util/HashMap;

    const-string v3, "edit_type_auto_water_mark_text"

    invoke-virtual {v2, v3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_9
    const-string v0, "edit_type_adjust"

    invoke-direct {p0, v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->haveChange(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_b

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mSavedEditValue:Ljava/util/HashMap;

    const-string v2, "edit_type_adjust"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/video/editor/NexVideoEditor$VideoEditorAdjust;

    if-nez v0, :cond_a

    new-instance v0, Lcom/miui/gallery/video/editor/NexVideoEditor$VideoEditorAdjust;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v2}, Lcom/miui/gallery/video/editor/NexVideoEditor$VideoEditorAdjust;-><init>(Lcom/miui/gallery/video/editor/NexVideoEditor;Z)V

    :cond_a
    iget-object v2, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mTempEditValue:Ljava/util/HashMap;

    const-string v3, "edit_type_adjust"

    invoke-virtual {v2, v3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_b
    const-string v0, "edit_type_smart_effect_template"

    invoke-direct {p0, v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->haveChange(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_d

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mSavedEditValue:Ljava/util/HashMap;

    const-string v2, "edit_type_smart_effect_template"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/video/editor/NexVideoEditor$SmartEffectTemplate;

    if-nez v0, :cond_c

    new-instance v0, Lcom/miui/gallery/video/editor/NexVideoEditor$SmartEffectTemplate;

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/video/editor/NexVideoEditor$SmartEffectTemplate;-><init>(Lcom/miui/gallery/video/editor/NexVideoEditor;Lcom/miui/gallery/video/editor/SmartEffect;)V

    :cond_c
    iget-object v1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mTempEditValue:Ljava/util/HashMap;

    const-string v2, "edit_type_smart_effect_template"

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_d
    return-void
.end method

.method public resume()V
    .locals 3

    iget v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngineState:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    const-string v0, "NexVideoEditor"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "resume is not allowed at EngineState :"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngineState:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngin:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    if-eqz v0, :cond_1

    const/16 v0, 0x6b

    invoke-direct {p0, v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->setEngineState(I)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngin:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->resume()V

    :cond_1
    :goto_0
    return-void
.end method

.method public saveEditState()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mSavedEditValue:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mSavedEditValue:Ljava/util/HashMap;

    iget-object v1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mApplyedEditValue:Ljava/util/HashMap;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    return-void
.end method

.method public seek(ILcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;)V
    .locals 1

    iput-object p2, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->seekOnCompletedListener:Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;

    iget p2, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngineState:I

    const/16 v0, 0x68

    if-eq p2, v0, :cond_0

    packed-switch p2, :pswitch_data_0

    const-string p1, "NexVideoEditor"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "seek is not allowed at EngineState :"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngineState:I

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :pswitch_0
    new-instance p2, Lcom/miui/gallery/video/editor/NexVideoEditor$7;

    invoke-direct {p2, p0, p1}, Lcom/miui/gallery/video/editor/NexVideoEditor$7;-><init>(Lcom/miui/gallery/video/editor/NexVideoEditor;I)V

    invoke-direct {p0, p2}, Lcom/miui/gallery/video/editor/NexVideoEditor;->pause(Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;)V

    goto :goto_0

    :cond_0
    :pswitch_1
    invoke-direct {p0, p1}, Lcom/miui/gallery/video/editor/NexVideoEditor;->doSeek(I)V

    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public setAutoWaterMark(Ljava/lang/String;I)Z
    .locals 2

    new-instance v0, Lcom/miui/gallery/video/editor/NexVideoEditor$TextClip;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, p2, v1}, Lcom/miui/gallery/video/editor/NexVideoEditor$TextClip;-><init>(Lcom/miui/gallery/video/editor/NexVideoEditor;Ljava/lang/String;ILcom/miui/gallery/video/editor/NexVideoEditor$1;)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mTempEditValue:Ljava/util/HashMap;

    const-string p2, "edit_type_auto_water_mark_text"

    invoke-virtual {p1, p2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 p1, 0x0

    return p1
.end method

.method public setBackgroundMusic(Ljava/lang/String;)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mTempEditValue:Ljava/util/HashMap;

    const-string v1, "bg_audio"

    new-instance v2, Lcom/miui/gallery/video/editor/NexVideoEditor$BGMEdit;

    invoke-direct {v2, p0, p1}, Lcom/miui/gallery/video/editor/NexVideoEditor$BGMEdit;-><init>(Lcom/miui/gallery/video/editor/NexVideoEditor;Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method protected setDisplayView(Landroid/view/View;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngin:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    check-cast p1, Lcom/nexstreaming/nexeditorsdk/nexEngineView;

    invoke-virtual {v0, p1}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->setView(Lcom/nexstreaming/nexeditorsdk/nexEngineView;)I

    return-void
.end method

.method public setFilter(Lcom/miui/gallery/video/editor/Filter;)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mTempEditValue:Ljava/util/HashMap;

    const-string v1, "filter"

    new-instance v2, Lcom/miui/gallery/video/editor/NexVideoEditor$FilterEffect;

    invoke-direct {v2, p0, p1}, Lcom/miui/gallery/video/editor/NexVideoEditor$FilterEffect;-><init>(Lcom/miui/gallery/video/editor/NexVideoEditor;Lcom/miui/gallery/video/editor/Filter;)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public setSmartEffectTemplate(Lcom/miui/gallery/video/editor/SmartEffect;)Z
    .locals 2

    new-instance v0, Lcom/miui/gallery/video/editor/NexVideoEditor$SmartEffectTemplate;

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/video/editor/NexVideoEditor$SmartEffectTemplate;-><init>(Lcom/miui/gallery/video/editor/NexVideoEditor;Lcom/miui/gallery/video/editor/SmartEffect;)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mTempEditValue:Ljava/util/HashMap;

    const-string v1, "edit_type_smart_effect_template"

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 p1, 0x0

    return p1
.end method

.method public setSourceAudioEnable(Ljava/lang/Boolean;)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mTempEditValue:Ljava/util/HashMap;

    const-string v1, "source_audio"

    new-instance v2, Lcom/miui/gallery/video/editor/NexVideoEditor$SourceAudioChange;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-direct {v2, p0, p1}, Lcom/miui/gallery/video/editor/NexVideoEditor$SourceAudioChange;-><init>(Lcom/miui/gallery/video/editor/NexVideoEditor;Z)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public setTrimInfo(II)V
    .locals 1

    new-instance v0, Lcom/miui/gallery/video/editor/NexVideoEditor$TrimInfo;

    invoke-direct {v0, p0, p1, p2}, Lcom/miui/gallery/video/editor/NexVideoEditor$TrimInfo;-><init>(Lcom/miui/gallery/video/editor/NexVideoEditor;II)V

    invoke-direct {p0, v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->setTrimInfo(Lcom/miui/gallery/video/editor/NexVideoEditor$TrimInfo;)V

    return-void
.end method

.method public setVideoEditorAdjust(Z)V
    .locals 2

    new-instance v0, Lcom/miui/gallery/video/editor/NexVideoEditor$VideoEditorAdjust;

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/video/editor/NexVideoEditor$VideoEditorAdjust;-><init>(Lcom/miui/gallery/video/editor/NexVideoEditor;Z)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mApplyedEditValue:Ljava/util/HashMap;

    const-string v1, "edit_type_adjust"

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public setWarterMark(ILjava/lang/String;)Z
    .locals 1

    new-instance v0, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;

    invoke-direct {v0, p0, p1, p2}, Lcom/miui/gallery/video/editor/NexVideoEditor$WaterMark;-><init>(Lcom/miui/gallery/video/editor/NexVideoEditor;ILjava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mTempEditValue:Ljava/util/HashMap;

    const-string p2, "edit_type_water_mark"

    invoke-virtual {p1, p2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 p1, 0x0

    return p1
.end method

.method public startPreview()V
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->startPreview(Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;)V

    return-void
.end method

.method public startPreview(Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;)V
    .locals 2

    iget v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngineState:I

    if-eqz v0, :cond_0

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngin:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngin:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->getCurrentPlayTimeTime()I

    move-result v0

    if-nez v0, :cond_1

    const/16 v0, 0x64

    :cond_1
    invoke-virtual {p0, v0, p1}, Lcom/miui/gallery/video/editor/NexVideoEditor;->seek(ILcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;)V

    :cond_2
    :goto_0
    return-void
.end method

.method public toThirdEditor(Landroid/content/Context;)V
    .locals 3

    iget v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngineState:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    iget v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngineState:I

    const/4 v2, 0x2

    if-eq v0, v2, :cond_0

    iget v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mEngineState:I

    if-nez v0, :cond_1

    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mNexProject:Lcom/nexstreaming/nexeditorsdk/nexProject;
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_1

    if-eqz v0, :cond_1

    :try_start_1
    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mNexProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexProject;->makeKineMasterIntent()Landroid/content/Intent;

    move-result-object v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    if-eqz v0, :cond_1

    :try_start_2
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    const-string v0, "video_editor"

    const-string v2, "video_editor_to_3rd_exitor"

    invoke-static {v0, v2}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catch Landroid/content/ActivityNotFoundException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    :catch_0
    return-void

    :catch_1
    :try_start_3
    const-string v0, "com.nexstreaming.app.kinemasterfree"

    invoke-static {v0, v1}, Lcom/miui/gallery/video/editor/util/IntentUtil;->makeMarketIntent(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    const-string p1, "video_editor"

    const-string v0, "video_editor_to_market"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catch Landroid/content/ActivityNotFoundException; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_0

    :catch_2
    const-string p1, "NexVideoEditor"

    const-string v0, "no market found !!!!"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    :goto_0
    return-void
.end method
