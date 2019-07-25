.class public Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;
.super Ljava/lang/Object;
.source "nexAudioEdit.java"

# interfaces
.implements Ljava/lang/Cloneable;


# static fields
.field private static final TAG:Ljava/lang/String; = "nexAudioEdit"

.field public static final kMusicEffect_LIVE_CONCERT:I = 0x1

.field public static final kMusicEffect_MUSIC_ENHANCER:I = 0x3

.field public static final kMusicEffect_NONE:I = 0x0

.field public static final kMusicEffect_STEREO_CHORUS:I = 0x2

.field public static final kVoiceFactor_CHIPMUNK:I = 0x1

.field public static final kVoiceFactor_DEEP:I = 0x3

.field public static final kVoiceFactor_MODULATION:I = 0x4

.field public static final kVoiceFactor_NONE:I = 0x0

.field public static final kVoiceFactor_ROBOT:I = 0x2


# instance fields
.field private VCfactor:I

.field private mBassStrength:I

.field private mClip:Lcom/nexstreaming/nexeditorsdk/nexClip;

.field private mCompressor:I

.field private mEnhancedAudioFilter:Ljava/lang/String;

.field private mMusicEffect:I

.field private mPanLeft:I

.field private mPanRight:I

.field private mPitch:I

.field private mProcessorStrength:I


# direct methods
.method private constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->VCfactor:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->mPitch:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->mCompressor:I

    const/4 v1, -0x1

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->mProcessorStrength:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->mBassStrength:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->mMusicEffect:I

    const/16 v0, -0x6f

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->mPanLeft:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->mPanRight:I

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->mEnhancedAudioFilter:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>(Lcom/nexstreaming/nexeditorsdk/nexClip;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->VCfactor:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->mPitch:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->mCompressor:I

    const/4 v1, -0x1

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->mProcessorStrength:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->mBassStrength:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->mMusicEffect:I

    const/16 v0, -0x6f

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->mPanLeft:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->mPanRight:I

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->mEnhancedAudioFilter:Ljava/lang/String;

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->mClip:Lcom/nexstreaming/nexeditorsdk/nexClip;

    return-void
.end method

.method constructor <init>(Lcom/nexstreaming/nexeditorsdk/nexClip;Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexAudioEditOf;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->VCfactor:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->mPitch:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->mCompressor:I

    const/4 v1, -0x1

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->mProcessorStrength:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->mBassStrength:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->mMusicEffect:I

    const/16 v0, -0x6f

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->mPanLeft:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->mPanRight:I

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->mEnhancedAudioFilter:Ljava/lang/String;

    iget v0, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexAudioEditOf;->VCfactor:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->VCfactor:I

    iget v0, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexAudioEditOf;->mPitch:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->mPitch:I

    iget v0, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexAudioEditOf;->mCompressor:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->mCompressor:I

    iget v0, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexAudioEditOf;->mProcessorStrength:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->mProcessorStrength:I

    iget v0, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexAudioEditOf;->mBassStrength:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->mBassStrength:I

    iget v0, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexAudioEditOf;->mMusicEffect:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->mMusicEffect:I

    iget v0, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexAudioEditOf;->mPanLeft:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->mPanLeft:I

    iget p2, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexAudioEditOf;->mPanRight:I

    iput p2, p0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->mPanRight:I

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->mClip:Lcom/nexstreaming/nexeditorsdk/nexClip;

    return-void
.end method

.method protected static clone(Lcom/nexstreaming/nexeditorsdk/nexClip;Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;)Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;
    .locals 1

    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;
    :try_end_0
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_0} :catch_1

    :try_start_1
    iput-object p0, p1, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->mClip:Lcom/nexstreaming/nexeditorsdk/nexClip;
    :try_end_1
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    :catch_0
    move-exception p0

    goto :goto_0

    :catch_1
    move-exception p0

    move-object p1, v0

    :goto_0
    invoke-virtual {p0}, Ljava/lang/CloneNotSupportedException;->printStackTrace()V

    :goto_1
    return-object p1
.end method

.method static getnexAudioEdit(Lcom/nexstreaming/nexeditorsdk/nexClip;)Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;
    .locals 2

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getClipType()I

    move-result v0

    const/4 v1, 0x4

    if-eq v0, v1, :cond_0

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getClipType()I

    move-result v0

    const/4 v1, 0x3

    if-eq v0, v1, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    new-instance v0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;

    invoke-direct {v0, p0}, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;-><init>(Lcom/nexstreaming/nexeditorsdk/nexClip;)V

    return-object v0
.end method


# virtual methods
.method public getBassStrength()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->mBassStrength:I

    return v0
.end method

.method public getCompressor()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->mCompressor:I

    return v0
.end method

.method public getEnhancedAudioFilter()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->mEnhancedAudioFilter:Ljava/lang/String;

    return-object v0
.end method

.method public getMusicEffect()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->mMusicEffect:I

    return v0
.end method

.method public getPanLeft()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->mPanLeft:I

    return v0
.end method

.method public getPanRight()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->mPanRight:I

    return v0
.end method

.method public getPitch()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->mPitch:I

    return v0
.end method

.method public getProcessorStrength()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->mProcessorStrength:I

    return v0
.end method

.method getSaveData()Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexAudioEditOf;
    .locals 2

    new-instance v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexAudioEditOf;

    invoke-direct {v0}, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexAudioEditOf;-><init>()V

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->VCfactor:I

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexAudioEditOf;->VCfactor:I

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->mPitch:I

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexAudioEditOf;->mPitch:I

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->mCompressor:I

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexAudioEditOf;->mCompressor:I

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->mProcessorStrength:I

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexAudioEditOf;->mProcessorStrength:I

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->mBassStrength:I

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexAudioEditOf;->mBassStrength:I

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->mMusicEffect:I

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexAudioEditOf;->mMusicEffect:I

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->mPanLeft:I

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexAudioEditOf;->mPanLeft:I

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->mPanRight:I

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexAudioEditOf;->mPanRight:I

    return-object v0
.end method

.method public getVoiceChangerFactor()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->VCfactor:I

    return v0
.end method

.method public setBassStrength(I)V
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->mClip:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getAttachmentState()Z

    move-result v0

    if-nez v0, :cond_0

    const-string p1, "nexAudioEdit"

    const-string v0, "setBassStrength getInfo fail!"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->mBassStrength:I

    return-void
.end method

.method public setCompressor(I)V
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->mClip:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getAttachmentState()Z

    move-result v0

    if-nez v0, :cond_0

    const-string p1, "nexAudioEdit"

    const-string v0, "setCompressor getInfo fail!"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->mCompressor:I

    return-void
.end method

.method public setEnhancedAudioFilter(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->mEnhancedAudioFilter:Ljava/lang/String;

    return-void
.end method

.method public setMusicEffect(I)V
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->mClip:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getAttachmentState()Z

    move-result v0

    if-nez v0, :cond_0

    const-string p1, "nexAudioEdit"

    const-string v0, "setMusicEffect getInfo fail!"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->mMusicEffect:I

    return-void
.end method

.method public setPanLeft(I)V
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->mClip:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getAttachmentState()Z

    move-result v0

    if-nez v0, :cond_0

    const-string p1, "nexAudioEdit"

    const-string v0, "setPanleft getInfo fail!"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->mPanLeft:I

    return-void
.end method

.method public setPanRight(I)V
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->mClip:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getAttachmentState()Z

    move-result v0

    if-nez v0, :cond_0

    const-string p1, "nexAudioEdit"

    const-string v0, "setPanRight getInfo fail!"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->mPanRight:I

    return-void
.end method

.method public setPitch(I)V
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->mClip:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getAttachmentState()Z

    move-result v0

    if-nez v0, :cond_0

    const-string p1, "nexAudioEdit"

    const-string v0, "setPitch getInfo fail!"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->mPitch:I

    return-void
.end method

.method public setProcessorStrength(I)V
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->mClip:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getAttachmentState()Z

    move-result v0

    if-nez v0, :cond_0

    const-string p1, "nexAudioEdit"

    const-string v0, "setProcessorStrength getInfo fail!"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->mProcessorStrength:I

    return-void
.end method

.method public setVoiceChangerFactor(I)V
    .locals 0

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->VCfactor:I

    return-void
.end method
