.class public final Lcom/nexstreaming/nexeditorsdk/nexEngine;
.super Ljava/lang/Object;
.source "nexEngine.java"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/nexstreaming/nexeditorsdk/nexEngine$ExportProfile;,
        Lcom/nexstreaming/nexeditorsdk/nexEngine$ProfileAndLevel;,
        Lcom/nexstreaming/nexeditorsdk/nexEngine$nexUndetectedFaceCrop;,
        Lcom/nexstreaming/nexeditorsdk/nexEngine$OnCaptureListener;,
        Lcom/nexstreaming/nexeditorsdk/nexEngine$OnAutoTrimRatioResultListener;,
        Lcom/nexstreaming/nexeditorsdk/nexEngine$OnAutoTrimResultListener;,
        Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;,
        Lcom/nexstreaming/nexeditorsdk/nexEngine$nexPlayState;,
        Lcom/nexstreaming/nexeditorsdk/nexEngine$FastPreviewOption;,
        Lcom/nexstreaming/nexeditorsdk/nexEngine$OverlayCommand;,
        Lcom/nexstreaming/nexeditorsdk/nexEngine$OverlayPreviewBuilder;,
        Lcom/nexstreaming/nexeditorsdk/nexEngine$a;,
        Lcom/nexstreaming/nexeditorsdk/nexEngine$OnSurfaceChangeListener;,
        Lcom/nexstreaming/nexeditorsdk/nexEngine$OnSeekCompletionListener;,
        Lcom/nexstreaming/nexeditorsdk/nexEngine$OnCompletionListener;
    }
.end annotation


# static fields
.field public static final DirectExportOption_AudioEncode:I = 0x1

.field public static final DirectExportOption_None:I = 0x0

.field public static final ExportAVCLevel1:I = 0x1

.field public static final ExportAVCLevel11:I = 0x4

.field public static final ExportAVCLevel12:I = 0x8

.field public static final ExportAVCLevel13:I = 0x10

.field public static final ExportAVCLevel1b:I = 0x2

.field public static final ExportAVCLevel2:I = 0x20

.field public static final ExportAVCLevel21:I = 0x40

.field public static final ExportAVCLevel22:I = 0x80

.field public static final ExportAVCLevel3:I = 0x100

.field public static final ExportAVCLevel31:I = 0x200

.field public static final ExportAVCLevel32:I = 0x400

.field public static final ExportAVCLevel4:I = 0x800

.field public static final ExportAVCLevel41:I = 0x1000

.field public static final ExportAVCLevel42:I = 0x2000

.field public static final ExportAVCLevel5:I = 0x4000

.field public static final ExportAVCLevel51:I = 0x8000

.field public static final ExportAVCLevel52:I = 0x10000

.field public static final ExportCodec_AVC:I = 0x10010300

.field public static final ExportCodec_HEVC:I = 0x10010400

.field public static final ExportCodec_MPEG4V:I = 0x10020100

.field public static final ExportCropMode_Enhanced:I = 0x1

.field public static final ExportCropMode_Fill:I = 0x2

.field public static final ExportCropMode_None:I = 0x0

.field public static final ExportHEVCHighTierLevel1:I = 0x2

.field public static final ExportHEVCHighTierLevel2:I = 0x8

.field public static final ExportHEVCHighTierLevel21:I = 0x20

.field public static final ExportHEVCHighTierLevel3:I = 0x80

.field public static final ExportHEVCHighTierLevel31:I = 0x200

.field public static final ExportHEVCHighTierLevel4:I = 0x800

.field public static final ExportHEVCHighTierLevel41:I = 0x2000

.field public static final ExportHEVCHighTierLevel5:I = 0x8000

.field public static final ExportHEVCHighTierLevel51:I = 0x20000

.field public static final ExportHEVCHighTierLevel52:I = 0x80000

.field public static final ExportHEVCHighTierLevel6:I = 0x200000

.field public static final ExportHEVCHighTierLevel61:I = 0x800000

.field public static final ExportHEVCHighTierLevel62:I = 0x2000000

.field public static final ExportHEVCMainTierLevel1:I = 0x1

.field public static final ExportHEVCMainTierLevel2:I = 0x4

.field public static final ExportHEVCMainTierLevel21:I = 0x10

.field public static final ExportHEVCMainTierLevel3:I = 0x40

.field public static final ExportHEVCMainTierLevel31:I = 0x100

.field public static final ExportHEVCMainTierLevel4:I = 0x400

.field public static final ExportHEVCMainTierLevel41:I = 0x1000

.field public static final ExportHEVCMainTierLevel5:I = 0x4000

.field public static final ExportHEVCMainTierLevel51:I = 0x10000

.field public static final ExportHEVCMainTierLevel52:I = 0x40000

.field public static final ExportHEVCMainTierLevel6:I = 0x100000

.field public static final ExportHEVCMainTierLevel61:I = 0x400000

.field public static final ExportHEVCMainTierLevel62:I = 0x1000000

.field public static final ExportMPEG4Level0:I = 0x1

.field public static final ExportMPEG4Level0b:I = 0x2

.field public static final ExportMPEG4Level1:I = 0x4

.field public static final ExportMPEG4Level2:I = 0x8

.field public static final ExportMPEG4Level3:I = 0x10

.field public static final ExportMPEG4Level4:I = 0x20

.field public static final ExportMPEG4Level4a:I = 0x40

.field public static final ExportMPEG4Level5:I = 0x80

.field public static final ExportProfile_AVCBaseline:I = 0x1

.field public static final ExportProfile_AVCExtended:I = 0x3

.field public static final ExportProfile_AVCHigh:I = 0x4

.field public static final ExportProfile_AVCHigh10:I = 0x5

.field public static final ExportProfile_AVCHigh422:I = 0x6

.field public static final ExportProfile_AVCHigh444:I = 0x7

.field public static final ExportProfile_AVCMain:I = 0x2

.field public static final ExportProfile_HEVCMain:I = 0x1

.field public static final ExportProfile_HEVCMain10:I = 0x2

.field public static final ExportProfile_MPEG4VASP:I = 0x8000

.field public static final ExportProfile_MPEG4VSimple:I = 0x1

.field private static final PERSIST_INTERVAL:I = 0x1f4

.field private static final PREWAKE_INTERVAL:I = 0x7d0

.field private static final TAG:Ljava/lang/String; = "nexEngine"

.field private static final export_audio_sampling_rate:I = 0xac44

.field private static final export_fps:I = 0xbb8

.field private static final kState_export:I = 0x2

.field private static final kState_idle:I = 0x0

.field private static final kState_load:I = 0x1

.field private static layerZOrderComparator:Ljava/util/Comparator; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;",
            ">;"
        }
    .end annotation
.end field

.field public static final retCheckDirectExport_ClipCountZero:I = 0x3

.field public static final retCheckDirectExport_EncoderDSIMismatch:I = 0xb

.field public static final retCheckDirectExport_FilterApplied:I = 0xf

.field public static final retCheckDirectExport_HasImageClip:I = 0x7

.field public static final retCheckDirectExport_HasSpeedControl:I = 0xc

.field public static final retCheckDirectExport_HasVideoLayer:I = 0x8

.field public static final retCheckDirectExport_InvalidClipList:I = 0x2

.field public static final retCheckDirectExport_InvalidHandle:I = 0x1

.field public static final retCheckDirectExport_InvalidRotate:I = 0xe

.field public static final retCheckDirectExport_InvalidVideoInfo:I = 0x4

.field public static final retCheckDirectExport_NotStartIFrame:I = 0x6

.field public static final retCheckDirectExport_OK:I = 0x0

.field public static final retCheckDirectExport_SetClipEffect:I = 0xa

.field public static final retCheckDirectExport_SetTransitionEffect:I = 0x9

.field public static final retCheckDirectExport_UnmatchedVideoCodec:I = 0x5

.field public static final retCheckDirectExport_UnsupportedCodec:I = 0xd

.field private static sExportVideoTrackUUIDMode:I = 0x0

.field private static sLoadListAsync:Z = true

.field private static sNextId:I = 0x1

.field private static sTranscodeListener:Lcom/nexstreaming/nexeditorsdk/nexEngineListener; = null

.field private static sTranscodeMode:Z = false

.field private static sTranscodeProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

.field private static s_exportProfiles:[Lcom/nexstreaming/nexeditorsdk/nexEngine$ExportProfile;


# instance fields
.field async_facedetect_worker_list_:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/os/AsyncTask<",
            "Ljava/lang/String;",
            "Ljava/lang/Void;",
            "Lcom/nexstreaming/kminternal/kinemaster/utils/facedetect/a;",
            ">;>;"
        }
    .end annotation
.end field

.field private bLetterBox:Z

.field bNeedScaling:Z

.field private cacheSeekMode:Z

.field private externalImageExportProcessing:Z

.field private facedetect_asyncmode:Z

.field private facedetect_syncclip_count:I

.field private facedetect_undetected_clip_cropping_mode:I

.field private lastCheckDirectExportOption:I

.field private lastSeekTime:I

.field private mActiveRenderLayers:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;",
            ">;"
        }
    .end annotation
.end field

.field private mAppContext:Landroid/content/Context;

.field private mCachedNexAudioClips:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;",
            ">;"
        }
    .end annotation
.end field

.field private mCachedNexVisualClips:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;",
            ">;"
        }
    .end annotation
.end field

.field private mCurrentPlayTime:I

.field private mEditorListener:Lcom/nexstreaming/kminternal/nexvideoeditor/c;

.field private mEncodeBitrate:I

.field private mEncodeHeight:I

.field private mEncodeMaxFileSize:J

.field private mEncodeWidth:I

.field private mEnhancedCropMode:I

.field private mEnhancedCropOutputHeight:I

.field private mEnhancedCropOutputWidth:I

.field private mEventListener:Lcom/nexstreaming/nexeditorsdk/nexEngineListener;

.field private mExportFilePath:Ljava/lang/String;

.field private mExportTotalTime:I

.field private mForceMixExportMode:Z

.field private mId:I

.field private mLastManualVolCtl:I

.field private mLastProjectFadeIn:I

.field private mLastProjectFadeOut:I

.field private mLastProjectVolume:I

.field private mPlayState:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$PlayState;

.field private mProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

.field private mRenderInCurrentPass:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;",
            ">;"
        }
    .end annotation
.end field

.field private mState:I

.field private mSurface:Landroid/view/Surface;

.field private mSurfaceView:Landroid/view/SurfaceView;

.field private mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

.field private m_layerLock:Z

.field private m_layerRenderCallback:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$c;

.field private m_layerRenderLock:Ljava/lang/Object;

.field private m_onSurfaceChangeListener:Lcom/nexstreaming/nexeditorsdk/nexEngine$OnSurfaceChangeListener;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/nexstreaming/nexeditorsdk/nexEngine$5;

    invoke-direct {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine$5;-><init>()V

    sput-object v0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->layerZOrderComparator:Ljava/util/Comparator;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mEditorListener:Lcom/nexstreaming/kminternal/nexvideoeditor/c;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->m_onSurfaceChangeListener:Lcom/nexstreaming/nexeditorsdk/nexEngine$OnSurfaceChangeListener;

    const/4 v1, 0x0

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mState:I

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mEventListener:Lcom/nexstreaming/nexeditorsdk/nexEngineListener;

    sget-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$PlayState;->IDLE:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$PlayState;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mPlayState:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$PlayState;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mActiveRenderLayers:Ljava/util/Set;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mRenderInCurrentPass:Ljava/util/List;

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->lastCheckDirectExportOption:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->lastSeekTime:I

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->bLetterBox:Z

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->cacheSeekMode:Z

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->externalImageExportProcessing:Z

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->bNeedScaling:Z

    const/4 v0, -0x1

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mLastProjectFadeIn:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mLastProjectFadeOut:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mLastProjectVolume:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mLastManualVolCtl:I

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->m_layerRenderLock:Ljava/lang/Object;

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->m_layerLock:Z

    new-instance v0, Lcom/nexstreaming/nexeditorsdk/nexEngine$6;

    invoke-direct {v0, p0}, Lcom/nexstreaming/nexeditorsdk/nexEngine$6;-><init>(Lcom/nexstreaming/nexeditorsdk/nexEngine;)V

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->m_layerRenderCallback:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$c;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->facedetect_asyncmode:Z

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->facedetect_syncclip_count:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->facedetect_undetected_clip_cropping_mode:I

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->async_facedetect_worker_list_:Ljava/util/ArrayList;

    sget v2, Lcom/nexstreaming/nexeditorsdk/nexEngine;->sNextId:I

    add-int/lit8 v3, v2, 0x1

    sput v3, Lcom/nexstreaming/nexeditorsdk/nexEngine;->sNextId:I

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mId:I

    const-string v2, "nexEngine"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v4, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mId:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, "] nexEngine create"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mAppContext:Landroid/content/Context;

    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/config/EditorGlobal;->a()Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    move-result-object p1

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexApplicationConfig;->getAspectProfile()Lcom/nexstreaming/nexeditorsdk/nexAspectProfile;

    move-result-object p1

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexAspectProfile;->getWidth()I

    move-result p1

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexApplicationConfig;->getAspectProfile()Lcom/nexstreaming/nexeditorsdk/nexAspectProfile;

    move-result-object v2

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexAspectProfile;->getHeight()I

    move-result v2

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexApplicationConfig;->getOverlayCoordinateMode()I

    move-result v3

    invoke-static {p1, v2, v3}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(III)V

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexApplicationConfig;->getScreenMode()I

    move-result v2

    invoke-virtual {p1, v2}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(I)V

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->m_layerRenderCallback:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$c;

    invoke-virtual {p1, v2}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$c;)V

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->y()I

    move-result p1

    if-ne p1, v0, :cond_0

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {p1, v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->e(Z)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {p1, v1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->e(Z)V

    :goto_0
    return-void
.end method

.method constructor <init>(Landroid/content/Context;Z)V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mEditorListener:Lcom/nexstreaming/kminternal/nexvideoeditor/c;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->m_onSurfaceChangeListener:Lcom/nexstreaming/nexeditorsdk/nexEngine$OnSurfaceChangeListener;

    const/4 v1, 0x0

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mState:I

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mEventListener:Lcom/nexstreaming/nexeditorsdk/nexEngineListener;

    sget-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$PlayState;->IDLE:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$PlayState;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mPlayState:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$PlayState;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mActiveRenderLayers:Ljava/util/Set;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mRenderInCurrentPass:Ljava/util/List;

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->lastCheckDirectExportOption:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->lastSeekTime:I

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->bLetterBox:Z

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->cacheSeekMode:Z

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->externalImageExportProcessing:Z

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->bNeedScaling:Z

    const/4 v0, -0x1

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mLastProjectFadeIn:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mLastProjectFadeOut:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mLastProjectVolume:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mLastManualVolCtl:I

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->m_layerRenderLock:Ljava/lang/Object;

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->m_layerLock:Z

    new-instance v0, Lcom/nexstreaming/nexeditorsdk/nexEngine$6;

    invoke-direct {v0, p0}, Lcom/nexstreaming/nexeditorsdk/nexEngine$6;-><init>(Lcom/nexstreaming/nexeditorsdk/nexEngine;)V

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->m_layerRenderCallback:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$c;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->facedetect_asyncmode:Z

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->facedetect_syncclip_count:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->facedetect_undetected_clip_cropping_mode:I

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->async_facedetect_worker_list_:Ljava/util/ArrayList;

    sget v0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->sNextId:I

    add-int/lit8 v1, v0, 0x1

    sput v1, Lcom/nexstreaming/nexeditorsdk/nexEngine;->sNextId:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mId:I

    const-string v0, "nexEngine"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mId:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "] nexEngine create internal"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mAppContext:Landroid/content/Context;

    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/config/EditorGlobal;->a()Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    move-result-object p1

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexApplicationConfig;->getAspectProfile()Lcom/nexstreaming/nexeditorsdk/nexAspectProfile;

    move-result-object p1

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexAspectProfile;->getWidth()I

    move-result p1

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexApplicationConfig;->getAspectProfile()Lcom/nexstreaming/nexeditorsdk/nexAspectProfile;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexAspectProfile;->getHeight()I

    move-result v0

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexApplicationConfig;->getOverlayCoordinateMode()I

    move-result v1

    invoke-static {p1, v0, v1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(III)V

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexApplicationConfig;->getScreenMode()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(I)V

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->m_layerRenderCallback:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$c;

    invoke-virtual {p1, v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$c;)V

    if-eqz p2, :cond_0

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->setMark()V

    :cond_0
    return-void
.end method

.method static synthetic access$000(Lcom/nexstreaming/nexeditorsdk/nexEngine;)I
    .locals 0

    iget p0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mId:I

    return p0
.end method

.method static synthetic access$100(Lcom/nexstreaming/nexeditorsdk/nexEngine;)I
    .locals 0

    iget p0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mState:I

    return p0
.end method

.method static synthetic access$1002(Lcom/nexstreaming/nexeditorsdk/nexEngine;I)I
    .locals 0

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mCurrentPlayTime:I

    return p1
.end method

.method static synthetic access$102(Lcom/nexstreaming/nexeditorsdk/nexEngine;I)I
    .locals 0

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mState:I

    return p1
.end method

.method static synthetic access$1100(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Lcom/nexstreaming/nexeditorsdk/nexProject;
    .locals 0

    iget-object p0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    return-object p0
.end method

.method static synthetic access$1200(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mForceMixExportMode:Z

    return p0
.end method

.method static synthetic access$1300(Lcom/nexstreaming/nexeditorsdk/nexEngine;ZZ)I
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->resolveProject(ZZ)I

    move-result p0

    return p0
.end method

.method static synthetic access$1400(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Lcom/nexstreaming/nexeditorsdk/nexEngine$OnSurfaceChangeListener;
    .locals 0

    iget-object p0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->m_onSurfaceChangeListener:Lcom/nexstreaming/nexeditorsdk/nexEngine$OnSurfaceChangeListener;

    return-object p0
.end method

.method static synthetic access$1500(Lcom/nexstreaming/nexeditorsdk/nexEngine;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->loadEffectsInEditor(Z)V

    return-void
.end method

.method static synthetic access$1600(Lcom/nexstreaming/nexeditorsdk/nexEngine;)V
    .locals 0

    invoke-direct {p0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->setEditorListener()V

    return-void
.end method

.method static synthetic access$1700(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;
    .locals 0

    iget-object p0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    return-object p0
.end method

.method static synthetic access$1800()I
    .locals 1

    sget v0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->sExportVideoTrackUUIDMode:I

    return v0
.end method

.method static synthetic access$1900(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mExportFilePath:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$200()Z
    .locals 1

    sget-boolean v0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->sTranscodeMode:Z

    return v0
.end method

.method static synthetic access$2000(Lcom/nexstreaming/nexeditorsdk/nexEngine;)I
    .locals 0

    iget p0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mEncodeWidth:I

    return p0
.end method

.method static synthetic access$202(Z)Z
    .locals 0

    sput-boolean p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->sTranscodeMode:Z

    return p0
.end method

.method static synthetic access$2100(Lcom/nexstreaming/nexeditorsdk/nexEngine;)I
    .locals 0

    iget p0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mEncodeHeight:I

    return p0
.end method

.method static synthetic access$2200(Lcom/nexstreaming/nexeditorsdk/nexEngine;)I
    .locals 0

    iget p0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mEncodeBitrate:I

    return p0
.end method

.method static synthetic access$2300(Lcom/nexstreaming/nexeditorsdk/nexEngine;)J
    .locals 2

    iget-wide v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mEncodeMaxFileSize:J

    return-wide v0
.end method

.method static synthetic access$2400(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Lcom/nexstreaming/kminternal/nexvideoeditor/c;
    .locals 0

    iget-object p0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mEditorListener:Lcom/nexstreaming/kminternal/nexvideoeditor/c;

    return-object p0
.end method

.method static synthetic access$2600(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Ljava/lang/Object;
    .locals 0

    iget-object p0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->m_layerRenderLock:Ljava/lang/Object;

    return-object p0
.end method

.method static synthetic access$2700(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->m_layerLock:Z

    return p0
.end method

.method static synthetic access$2800(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Ljava/util/List;
    .locals 0

    iget-object p0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mRenderInCurrentPass:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$2900(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Ljava/util/Set;
    .locals 0

    iget-object p0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mActiveRenderLayers:Ljava/util/Set;

    return-object p0
.end method

.method static synthetic access$3000()Ljava/util/Comparator;
    .locals 1

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->layerZOrderComparator:Ljava/util/Comparator;

    return-object v0
.end method

.method static synthetic access$302(Lcom/nexstreaming/nexeditorsdk/nexEngine;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->cacheSeekMode:Z

    return p1
.end method

.method static synthetic access$3100(Lcom/nexstreaming/nexeditorsdk/nexEngine;Lcom/nexstreaming/nexeditorsdk/nexClip;ILandroid/graphics/RectF;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->updateFaceInfo2Clip(Lcom/nexstreaming/nexeditorsdk/nexClip;ILandroid/graphics/RectF;I)V

    return-void
.end method

.method static synthetic access$400()Lcom/nexstreaming/nexeditorsdk/nexEngineListener;
    .locals 1

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->sTranscodeListener:Lcom/nexstreaming/nexeditorsdk/nexEngineListener;

    return-object v0
.end method

.method static synthetic access$500(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$PlayState;
    .locals 0

    iget-object p0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mPlayState:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$PlayState;

    return-object p0
.end method

.method static synthetic access$502(Lcom/nexstreaming/nexeditorsdk/nexEngine;Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$PlayState;)Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$PlayState;
    .locals 0

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mPlayState:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$PlayState;

    return-object p1
.end method

.method static synthetic access$600(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Lcom/nexstreaming/nexeditorsdk/nexEngineListener;
    .locals 0

    iget-object p0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mEventListener:Lcom/nexstreaming/nexeditorsdk/nexEngineListener;

    return-object p0
.end method

.method static synthetic access$700(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->externalImageExportProcessing:Z

    return p0
.end method

.method static synthetic access$702(Lcom/nexstreaming/nexeditorsdk/nexEngine;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->externalImageExportProcessing:Z

    return p1
.end method

.method static synthetic access$800(Lcom/nexstreaming/nexeditorsdk/nexEngine;)I
    .locals 0

    iget p0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mExportTotalTime:I

    return p0
.end method

.method static synthetic access$802(Lcom/nexstreaming/nexeditorsdk/nexEngine;I)I
    .locals 0

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mExportTotalTime:I

    return p1
.end method

.method static synthetic access$900()Lcom/nexstreaming/nexeditorsdk/nexProject;
    .locals 1

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->sTranscodeProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    return-object v0
.end method

.method private applyCropSpeed()V
    .locals 0

    return-void
.end method

.method private static bsearch([II)I
    .locals 5

    array-length v0, p0

    add-int/lit8 v0, v0, -0x1

    const/4 v1, 0x0

    move v2, v0

    const/4 v0, 0x0

    :goto_0
    if-gt v0, v2, :cond_2

    add-int v3, v0, v2

    div-int/lit8 v3, v3, 0x2

    aget v4, p0, v3

    if-ne v4, p1, :cond_0

    return v3

    :cond_0
    aget v4, p0, v3

    if-ge v4, p1, :cond_1

    add-int/lit8 v0, v3, 0x1

    goto :goto_0

    :cond_1
    add-int/lit8 v2, v3, -0x1

    goto :goto_0

    :cond_2
    if-lez v0, :cond_3

    add-int/lit8 v1, v0, -0x1

    :cond_3
    return v1
.end method

.method private checkUpdateProject(Ljava/util/List;Ljava/util/List;)Z
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;",
            ">;",
            "Ljava/util/List<",
            "Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;",
            ">;)Z"
        }
    .end annotation

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mCachedNexVisualClips:Ljava/util/List;

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mCachedNexVisualClips:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    if-ne v0, v3, :cond_1

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v0, :cond_3

    iget-object v4, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mCachedNexVisualClips:Ljava/util/List;

    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;

    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    const-string v0, "nexEngine"

    const-string v3, "checkUpdateProject video not equals"

    invoke-static {v0, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    const-string v0, "nexEngine"

    const-string v3, "checkUpdateProject video diff size"

    invoke-static {v0, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :goto_1
    const/4 v0, 0x1

    goto :goto_2

    :cond_2
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_3

    goto :goto_1

    :cond_3
    const/4 v0, 0x0

    :goto_2
    if-nez v0, :cond_7

    iget-object v3, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mCachedNexAudioClips:Ljava/util/List;

    if-eqz v3, :cond_6

    iget-object v3, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mCachedNexAudioClips:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v4

    if-ne v3, v4, :cond_5

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v3

    :goto_3
    if-ge v1, v3, :cond_7

    iget-object v4, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mCachedNexAudioClips:Ljava/util/List;

    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;

    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_4

    const-string v0, "nexEngine"

    const-string v1, "checkUpdateProject audio not equals"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_4

    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    :cond_5
    const-string v0, "nexEngine"

    const-string v1, "checkUpdateProject audio diff size"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_4

    :cond_6
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_7

    goto :goto_4

    :cond_7
    move v2, v0

    :goto_4
    if-eqz v2, :cond_8

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mCachedNexVisualClips:Ljava/util/List;

    iput-object p2, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mCachedNexAudioClips:Ljava/util/List;

    :cond_8
    return v2
.end method

.method private clearList()V
    .locals 3

    const-string v0, "nexEngine"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mId:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "]clearList()"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    sget-boolean v0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->sLoadListAsync:Z

    const/4 v1, 0x0

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v0, v2, v2, v1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->b([Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;[Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;I)I

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v0, v2, v2}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->asyncDrawInfoList([Lcom/nexstreaming/kminternal/nexvideoeditor/NexDrawInfo;[Lcom/nexstreaming/kminternal/nexvideoeditor/NexDrawInfo;)I

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v0, v2, v2, v1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a([Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;[Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;I)I

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v0, v2, v2}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->asyncDrawInfoList([Lcom/nexstreaming/kminternal/nexvideoeditor/NexDrawInfo;[Lcom/nexstreaming/kminternal/nexvideoeditor/NexDrawInfo;)I

    :goto_0
    return-void
.end method

.method private defaultFaceDetectSetting()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->facedetect_asyncmode:Z

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->facedetect_syncclip_count:I

    const/4 v0, 0x0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->facedetect_undetected_clip_cropping_mode:I

    return-void
.end method

.method private encodeEffectOptions(Ljava/lang/StringBuilder;Ljava/util/Map;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/StringBuilder;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    :try_start_0
    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p2

    const/4 v0, 0x1

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    goto :goto_1

    :cond_0
    const/16 v2, 0x26

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :goto_1
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    const-string v3, "UTF-8"

    invoke-static {v2, v3}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "="

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const-string v2, "UTF-8"

    invoke-static {v1, v2}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :cond_1
    return-void

    :catch_0
    move-exception p1

    new-instance p2, Ljava/lang/IllegalStateException;

    invoke-direct {p2, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw p2
.end method

.method private fastPreviewStart(IIII)Z
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->fastPreviewStart(IIII)I

    const/4 p1, 0x1

    return p1
.end method

.method private fastPreviewStop()Z
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->fastPreviewStop()I

    const/4 v0, 0x1

    return v0
.end method

.method private fastPreviewTime(I)Z
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v0, p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->fastPreviewTime(I)I

    const/4 p1, 0x1

    return p1
.end method

.method public static getExportProfile()[Lcom/nexstreaming/nexeditorsdk/nexEngine$ExportProfile;
    .locals 17

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v1, 0x0

    const/16 v2, 0x15

    if-ge v0, v2, :cond_0

    new-array v0, v1, [Lcom/nexstreaming/nexeditorsdk/nexEngine$ExportProfile;

    return-object v0

    :cond_0
    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->s_exportProfiles:[Lcom/nexstreaming/nexeditorsdk/nexEngine$ExportProfile;

    if-nez v0, :cond_12

    new-instance v0, Landroid/media/MediaCodecList;

    invoke-direct {v0, v1}, Landroid/media/MediaCodecList;-><init>(I)V

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0}, Landroid/media/MediaCodecList;->getCodecInfos()[Landroid/media/MediaCodecInfo;

    move-result-object v3

    array-length v4, v3

    const/4 v5, 0x0

    :goto_0
    if-ge v5, v4, :cond_11

    aget-object v6, v3, v5

    invoke-virtual {v6}, Landroid/media/MediaCodecInfo;->isEncoder()Z

    move-result v0

    if-nez v0, :cond_2

    :cond_1
    move-object/from16 v16, v3

    goto/16 :goto_a

    :cond_2
    invoke-virtual {v6}, Landroid/media/MediaCodecInfo;->getSupportedTypes()[Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x0

    :goto_1
    array-length v0, v7

    if-ge v8, v0, :cond_1

    aget-object v0, v7, v8

    const-string v9, "video/avc"

    invoke-virtual {v0, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_4

    aget-object v0, v7, v8

    const-string v9, "video/hevc"

    invoke-virtual {v0, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_4

    aget-object v0, v7, v8

    const-string v9, "video/mp4v-es"

    invoke-virtual {v0, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    goto :goto_2

    :cond_3
    move-object/from16 v16, v3

    goto/16 :goto_9

    :cond_4
    :goto_2
    new-instance v0, Lcom/nexstreaming/nexeditorsdk/nexEngine$ExportProfile;

    invoke-direct {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine$ExportProfile;-><init>()V

    aget-object v9, v7, v8

    const-string v10, "video/avc"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    const v10, 0x10020100

    const v11, 0x10010400

    const v12, 0x10010300

    if-eqz v9, :cond_5

    invoke-static {v0, v12}, Lcom/nexstreaming/nexeditorsdk/nexEngine$ExportProfile;->access$3202(Lcom/nexstreaming/nexeditorsdk/nexEngine$ExportProfile;I)I

    goto :goto_3

    :cond_5
    aget-object v9, v7, v8

    const-string v13, "video/hevc"

    invoke-virtual {v9, v13}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_6

    invoke-static {v0, v11}, Lcom/nexstreaming/nexeditorsdk/nexEngine$ExportProfile;->access$3202(Lcom/nexstreaming/nexeditorsdk/nexEngine$ExportProfile;I)I

    goto :goto_3

    :cond_6
    aget-object v9, v7, v8

    const-string v13, "video/mp4v-es"

    invoke-virtual {v9, v13}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_7

    invoke-static {v0, v10}, Lcom/nexstreaming/nexeditorsdk/nexEngine$ExportProfile;->access$3202(Lcom/nexstreaming/nexeditorsdk/nexEngine$ExportProfile;I)I

    :cond_7
    :goto_3
    const-string v9, "nexEngine"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "codec name="

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Landroid/media/MediaCodecInfo;->getName()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v9, v13}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :try_start_0
    aget-object v9, v7, v8

    invoke-virtual {v6, v9}, Landroid/media/MediaCodecInfo;->getCapabilitiesForType(Ljava/lang/String;)Landroid/media/MediaCodecInfo$CodecCapabilities;

    move-result-object v9

    new-instance v13, Landroid/util/SparseIntArray;

    invoke-direct {v13}, Landroid/util/SparseIntArray;-><init>()V

    iget-object v9, v9, Landroid/media/MediaCodecInfo$CodecCapabilities;->profileLevels:[Landroid/media/MediaCodecInfo$CodecProfileLevel;

    array-length v14, v9

    const/4 v15, 0x0

    :goto_4
    if-ge v15, v14, :cond_f

    aget-object v1, v9, v15

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine$ExportProfile;->access$3200(Lcom/nexstreaming/nexeditorsdk/nexEngine$ExportProfile;)I

    move-result v10

    if-ne v10, v12, :cond_a

    iget v10, v1, Landroid/media/MediaCodecInfo$CodecProfileLevel;->profile:I

    const/16 v12, 0x8

    if-eq v10, v12, :cond_8

    const/16 v12, 0x10

    if-eq v10, v12, :cond_8

    const/16 v12, 0x20

    if-eq v10, v12, :cond_8

    const/16 v12, 0x40

    if-eq v10, v12, :cond_8

    packed-switch v10, :pswitch_data_0

    const/4 v10, 0x0

    goto :goto_5

    :pswitch_0
    const/4 v10, 0x2

    goto :goto_5

    :pswitch_1
    const/4 v10, 0x1

    goto :goto_5

    :cond_8
    const/4 v10, 0x4

    :goto_5
    if-nez v10, :cond_9

    move-object/from16 v16, v3

    goto/16 :goto_6

    :cond_9
    const-string v12, "nexEngine"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-object/from16 v16, v3

    :try_start_1
    const-string v3, "codec profile="

    invoke-virtual {v11, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, ", level="

    invoke-virtual {v11, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v1, Landroid/media/MediaCodecInfo$CodecProfileLevel;->level:I

    invoke-virtual {v11, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v12, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v13, v10}, Landroid/util/SparseIntArray;->get(I)I

    move-result v3

    iget v11, v1, Landroid/media/MediaCodecInfo$CodecProfileLevel;->level:I

    if-ge v3, v11, :cond_e

    iget v1, v1, Landroid/media/MediaCodecInfo$CodecProfileLevel;->level:I

    invoke-virtual {v13, v10, v1}, Landroid/util/SparseIntArray;->put(II)V

    goto/16 :goto_6

    :cond_a
    move-object/from16 v16, v3

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine$ExportProfile;->access$3200(Lcom/nexstreaming/nexeditorsdk/nexEngine$ExportProfile;)I

    move-result v3

    const v10, 0x10010400

    if-ne v3, v10, :cond_c

    iget v3, v1, Landroid/media/MediaCodecInfo$CodecProfileLevel;->profile:I

    if-nez v3, :cond_b

    goto :goto_6

    :cond_b
    const-string v11, "nexEngine"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "codec profile="

    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v10, ", level="

    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v10, v1, Landroid/media/MediaCodecInfo$CodecProfileLevel;->level:I

    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v11, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v13, v3}, Landroid/util/SparseIntArray;->get(I)I

    move-result v10

    iget v11, v1, Landroid/media/MediaCodecInfo$CodecProfileLevel;->level:I

    if-ge v10, v11, :cond_e

    iget v1, v1, Landroid/media/MediaCodecInfo$CodecProfileLevel;->level:I

    invoke-virtual {v13, v3, v1}, Landroid/util/SparseIntArray;->put(II)V

    goto :goto_6

    :cond_c
    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine$ExportProfile;->access$3200(Lcom/nexstreaming/nexeditorsdk/nexEngine$ExportProfile;)I

    move-result v3

    const v10, 0x10020100

    if-ne v3, v10, :cond_e

    iget v3, v1, Landroid/media/MediaCodecInfo$CodecProfileLevel;->profile:I

    if-nez v3, :cond_d

    goto :goto_6

    :cond_d
    const-string v11, "nexEngine"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "codec profile="

    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v10, ", level="

    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v10, v1, Landroid/media/MediaCodecInfo$CodecProfileLevel;->level:I

    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v11, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v13, v3}, Landroid/util/SparseIntArray;->get(I)I

    move-result v10

    iget v11, v1, Landroid/media/MediaCodecInfo$CodecProfileLevel;->level:I

    if-ge v10, v11, :cond_e

    iget v1, v1, Landroid/media/MediaCodecInfo$CodecProfileLevel;->level:I

    invoke-virtual {v13, v3, v1}, Landroid/util/SparseIntArray;->put(II)V

    :cond_e
    :goto_6
    add-int/lit8 v15, v15, 0x1

    move-object/from16 v3, v16

    const/4 v1, 0x0

    const v10, 0x10020100

    const v11, 0x10010400

    const v12, 0x10010300

    goto/16 :goto_4

    :cond_f
    move-object/from16 v16, v3

    invoke-virtual {v13}, Landroid/util/SparseIntArray;->size()I

    move-result v1

    new-array v1, v1, [Lcom/nexstreaming/nexeditorsdk/nexEngine$ProfileAndLevel;

    invoke-static {v0, v1}, Lcom/nexstreaming/nexeditorsdk/nexEngine$ExportProfile;->access$3302(Lcom/nexstreaming/nexeditorsdk/nexEngine$ExportProfile;[Lcom/nexstreaming/nexeditorsdk/nexEngine$ProfileAndLevel;)[Lcom/nexstreaming/nexeditorsdk/nexEngine$ProfileAndLevel;

    const/4 v1, 0x0

    :goto_7
    invoke-virtual {v13}, Landroid/util/SparseIntArray;->size()I

    move-result v3

    if-ge v1, v3, :cond_10

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine$ExportProfile;->access$3300(Lcom/nexstreaming/nexeditorsdk/nexEngine$ExportProfile;)[Lcom/nexstreaming/nexeditorsdk/nexEngine$ProfileAndLevel;

    move-result-object v3

    new-instance v9, Lcom/nexstreaming/nexeditorsdk/nexEngine$ProfileAndLevel;

    invoke-virtual {v13, v1}, Landroid/util/SparseIntArray;->keyAt(I)I

    move-result v10

    invoke-virtual {v13, v1}, Landroid/util/SparseIntArray;->valueAt(I)I

    move-result v11

    const/4 v12, 0x0

    invoke-direct {v9, v10, v11, v12}, Lcom/nexstreaming/nexeditorsdk/nexEngine$ProfileAndLevel;-><init>(IILcom/nexstreaming/nexeditorsdk/nexEngine$1;)V

    aput-object v9, v3, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    :cond_10
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_9

    :catch_0
    move-exception v0

    goto :goto_8

    :catch_1
    move-exception v0

    move-object/from16 v16, v3

    :goto_8
    const-string v1, "nexEngine"

    invoke-static {v1, v0}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_9
    add-int/lit8 v8, v8, 0x1

    move-object/from16 v3, v16

    const/4 v1, 0x0

    goto/16 :goto_1

    :goto_a
    add-int/lit8 v5, v5, 0x1

    move-object/from16 v3, v16

    const/4 v1, 0x0

    goto/16 :goto_0

    :cond_11
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v0

    new-array v0, v0, [Lcom/nexstreaming/nexeditorsdk/nexEngine$ExportProfile;

    sput-object v0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->s_exportProfiles:[Lcom/nexstreaming/nexeditorsdk/nexEngine$ExportProfile;

    const/4 v0, 0x0

    :goto_b
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_12

    sget-object v1, Lcom/nexstreaming/nexeditorsdk/nexEngine;->s_exportProfiles:[Lcom/nexstreaming/nexeditorsdk/nexEngine$ExportProfile;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/nexstreaming/nexeditorsdk/nexEngine$ExportProfile;

    aput-object v3, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_b

    :cond_12
    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->s_exportProfiles:[Lcom/nexstreaming/nexeditorsdk/nexEngine$ExportProfile;

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private getExternalExport(Lcom/nexstreaming/nexeditorsdk/nexExportFormat;Ljava/lang/String;Ljava/lang/String;Lcom/nexstreaming/nexeditorsdk/nexExportListener;)Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$v;
    .locals 2

    const/4 v0, 0x0

    if-eqz p3, :cond_1

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexExternalModuleManager;->getInstance()Lcom/nexstreaming/nexeditorsdk/nexExternalModuleManager;

    move-result-object p2

    invoke-virtual {p2, p3}, Lcom/nexstreaming/nexeditorsdk/nexExternalModuleManager;->getModule(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    if-eqz p2, :cond_0

    const-class p3, Lcom/nexstreaming/nexeditorsdk/module/nexExternalExportProvider;

    invoke-virtual {p3, p2}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_0

    check-cast p2, Lcom/nexstreaming/nexeditorsdk/module/nexExternalExportProvider;

    invoke-interface {p2, p1}, Lcom/nexstreaming/nexeditorsdk/module/nexExternalExportProvider;->OnPrepare(Lcom/nexstreaming/nexeditorsdk/nexExportFormat;)Z

    move-result p1

    if-eqz p1, :cond_0

    new-instance p1, Lcom/nexstreaming/nexeditorsdk/nexEngine$a;

    invoke-direct {p1, p0, p2, p4}, Lcom/nexstreaming/nexeditorsdk/nexEngine$a;-><init>(Lcom/nexstreaming/nexeditorsdk/nexEngine;Lcom/nexstreaming/nexeditorsdk/module/nexExternalExportProvider;Lcom/nexstreaming/nexeditorsdk/nexExportListener;)V

    return-object p1

    :cond_0
    return-object v0

    :cond_1
    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexExternalModuleManager;->getInstance()Lcom/nexstreaming/nexeditorsdk/nexExternalModuleManager;

    move-result-object p3

    const-class v1, Lcom/nexstreaming/nexeditorsdk/module/nexExternalExportProvider;

    invoke-virtual {p3, p2, v1}, Lcom/nexstreaming/nexeditorsdk/nexExternalModuleManager;->getModule(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/nexstreaming/nexeditorsdk/module/nexExternalExportProvider;

    if-eqz p2, :cond_2

    invoke-interface {p2, p1}, Lcom/nexstreaming/nexeditorsdk/module/nexExternalExportProvider;->OnPrepare(Lcom/nexstreaming/nexeditorsdk/nexExportFormat;)Z

    move-result p1

    if-eqz p1, :cond_2

    new-instance p1, Lcom/nexstreaming/nexeditorsdk/nexEngine$a;

    invoke-direct {p1, p0, p2, p4}, Lcom/nexstreaming/nexeditorsdk/nexEngine$a;-><init>(Lcom/nexstreaming/nexeditorsdk/nexEngine;Lcom/nexstreaming/nexeditorsdk/module/nexExternalExportProvider;Lcom/nexstreaming/nexeditorsdk/nexExportListener;)V

    return-object p1

    :cond_2
    return-object v0
.end method

.method private getOverlayVideoCount()I
    .locals 3

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getOverlayItems()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->isVideo()Z

    move-result v2

    if-eqz v2, :cond_1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    return v1
.end method

.method private isSetProject(Z)Z
    .locals 2

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    invoke-virtual {v0, v1}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalClipCount(Z)I

    move-result v0

    if-lez v0, :cond_0

    return v1

    :cond_0
    sget-boolean v0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->sTranscodeMode:Z

    if-eqz v0, :cond_1

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->sTranscodeProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    if-eqz v0, :cond_1

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->sTranscodeProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    invoke-virtual {v0, v1}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalClipCount(Z)I

    move-result v0

    if-lez v0, :cond_1

    return v1

    :cond_1
    if-nez p1, :cond_2

    const/4 p1, 0x0

    return p1

    :cond_2
    new-instance p1, Lcom/nexstreaming/nexeditorsdk/exception/ProjectNotAttachedException;

    invoke-direct {p1}, Lcom/nexstreaming/nexeditorsdk/exception/ProjectNotAttachedException;-><init>()V

    throw p1
.end method

.method private loadClipToEngine(Ljava/util/List;Ljava/util/List;ZZI)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;",
            ">;",
            "Ljava/util/List<",
            "Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;",
            ">;ZZI)Z"
        }
    .end annotation

    const/4 v0, 0x1

    if-eqz p4, :cond_0

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mCachedNexVisualClips:Ljava/util/List;

    iput-object p2, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mCachedNexAudioClips:Ljava/util/List;

    const-string p1, "nexEngine"

    const-string p2, "loadClipToEngine update force"

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->checkUpdateProject(Ljava/util/List;Ljava/util/List;)Z

    move-result p1

    if-eqz p1, :cond_1

    const-string p1, "nexEngine"

    const-string p2, "loadClipToEngine update loadlist call"

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_1
    const-string p1, "nexEngine"

    const-string p2, "loadClipToEngine No update"

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_5

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mCachedNexVisualClips:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    new-array p1, p1, [Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;

    iget-object p2, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mCachedNexAudioClips:Ljava/util/List;

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p2

    if-nez p2, :cond_3

    const/4 p2, 0x0

    if-eqz p3, :cond_2

    iget-object p3, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    iget-object p4, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mCachedNexVisualClips:Ljava/util/List;

    invoke-interface {p4, p1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;

    invoke-virtual {p3, p1, p2, p5}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->b([Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;[Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;I)I

    goto :goto_1

    :cond_2
    iget-object p3, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    iget-object p4, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mCachedNexVisualClips:Ljava/util/List;

    invoke-interface {p4, p1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;

    invoke-virtual {p3, p1, p2, p5}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a([Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;[Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;I)I

    goto :goto_1

    :cond_3
    new-array p2, p2, [Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;

    if-eqz p3, :cond_4

    iget-object p3, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    iget-object p4, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mCachedNexVisualClips:Ljava/util/List;

    invoke-interface {p4, p1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;

    iget-object p4, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mCachedNexAudioClips:Ljava/util/List;

    invoke-interface {p4, p2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p2

    check-cast p2, [Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;

    invoke-virtual {p3, p1, p2, p5}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->b([Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;[Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;I)I

    goto :goto_1

    :cond_4
    iget-object p3, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    iget-object p4, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mCachedNexVisualClips:Ljava/util/List;

    invoke-interface {p4, p1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;

    iget-object p4, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mCachedNexAudioClips:Ljava/util/List;

    invoke-interface {p4, p2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p2

    check-cast p2, [Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;

    invoke-virtual {p3, p1, p2, p5}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a([Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;[Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;I)I

    goto :goto_1

    :cond_5
    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->clearProject()I

    :goto_1
    return v0
.end method

.method private loadEffectsInEditor(Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->loadEffectsInEditor_usingAssetPackageManager(Z)V

    return-void
.end method

.method private loadEffectsInEditor_usingAssetPackageManager(Z)V
    .locals 7

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    const-string v1, "nexEngine"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "TranscoderMode ="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-boolean v3, Lcom/nexstreaming/nexeditorsdk/nexEngine;->sTranscodeMode:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-boolean v1, Lcom/nexstreaming/nexeditorsdk/nexEngine;->sTranscodeMode:Z

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    goto/16 :goto_2

    :cond_0
    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTemplateApplyMode()I

    move-result v1

    const/4 v3, 0x3

    if-ne v1, v3, :cond_1

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTopDrawInfo()Ljava/util/List;

    move-result-object v1

    if-eqz v1, :cond_5

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    if-lez v3, :cond_5

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getEffectID()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTemplageOverlappedTransitionMode()Z

    move-result v1

    iget-object v3, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getPrimaryItems()Ljava/util/List;

    move-result-object v3

    :goto_1
    iget-object v4, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalClipCount(Z)I

    move-result v4

    if-ge v2, v4, :cond_4

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v4, v5}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getClipEffect(Z)Lcom/nexstreaming/nexeditorsdk/nexClipEffect;

    move-result-object v4

    invoke-virtual {v4}, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->getId()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_2

    const-string v6, "none"

    invoke-virtual {v4, v6}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v0, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_2

    invoke-interface {v0, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    :cond_2
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v4, v5}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getTransitionEffect(Z)Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;

    move-result-object v4

    invoke-virtual {v4}, Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;->getId()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_3

    const-string v5, "none"

    invoke-virtual {v4, v5}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v0, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_3

    invoke-interface {v0, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_4
    move v2, v1

    :cond_5
    :goto_2
    invoke-static {}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->a()Lcom/nexstreaming/app/common/nexasset/assetpackage/c;

    move-result-object v1

    iget-object v3, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v1, v0, v3, p1, v2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->a(Ljava/lang/Iterable;Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;ZZ)V

    invoke-static {}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->a()Lcom/nexstreaming/app/common/nexasset/assetpackage/c;

    move-result-object v1

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v1, v0, v2, p1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->a(Ljava/lang/Iterable;Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;Z)V

    return-void
.end method

.method public static prepareSurfaceSetToNull(Z)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    invoke-static {p0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->c(Z)V

    return-void
.end method

.method private resolveProject(ZZ)I
    .locals 24

    move-object/from16 v6, p0

    iget-object v0, v6, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    sget-boolean v1, Lcom/nexstreaming/nexeditorsdk/nexEngine;->sTranscodeMode:Z

    if-eqz v1, :cond_0

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->sTranscodeProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    :cond_0
    move-object v7, v0

    iget-boolean v0, v6, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mForceMixExportMode:Z

    const/4 v8, 0x0

    if-eqz v0, :cond_1

    iput-boolean v8, v6, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mForceMixExportMode:Z

    :cond_1
    const/4 v9, 0x0

    if-nez v7, :cond_2

    const-string v0, "nexEngine"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, v6, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mId:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "]resolveProject() Project is null"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-direct/range {p0 .. p0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->clearList()V

    iput-object v9, v6, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mCachedNexVisualClips:Ljava/util/List;

    iput-object v9, v6, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mCachedNexAudioClips:Ljava/util/List;

    return v8

    :cond_2
    invoke-virtual {v7}, Lcom/nexstreaming/nexeditorsdk/nexProject;->updateProject()Z

    iget-object v0, v6, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v7}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getLetterboxEffect()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->setBaseFilterRenderItem(Ljava/lang/String;)I

    invoke-virtual {v7}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getPrimaryItems()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-nez v1, :cond_3

    const-string v0, "nexEngine"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, v6, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mId:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "]resolveProject() Project["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getId()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "] clip is zero"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-direct/range {p0 .. p0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->clearList()V

    iput-object v9, v6, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mCachedNexVisualClips:Ljava/util/List;

    iput-object v9, v6, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mCachedNexAudioClips:Ljava/util/List;

    return v8

    :cond_3
    const-string v2, "nexEngine"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v4, v6, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mId:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, "]resolveProject() Project["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getId()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-direct/range {p0 .. p0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->getOverlayVideoCount()I

    move-result v2

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    const/16 v10, 0x7531

    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    const/4 v10, 0x0

    const/4 v13, 0x1

    const/4 v14, 0x0

    const/16 v15, 0x7531

    :goto_0
    if-ge v10, v1, :cond_1a

    invoke-interface {v0, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/nexstreaming/nexeditorsdk/nexClip;

    if-nez v10, :cond_4

    invoke-virtual {v7}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getOpeningTitle()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v17, v16

    const/4 v8, 0x1

    goto :goto_1

    :cond_4
    add-int/lit8 v8, v1, -0x1

    if-ne v10, v8, :cond_5

    invoke-virtual {v7}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getEndingTitle()Ljava/lang/String;

    move-result-object v8

    move-object/from16 v17, v8

    const/4 v8, 0x2

    goto :goto_1

    :cond_5
    const/4 v8, 0x0

    const/16 v17, 0x0

    :goto_1
    new-instance v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;

    invoke-direct {v9}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;-><init>()V

    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object v16

    invoke-interface/range {v16 .. v16}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v16

    :goto_2
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_6

    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v18

    move-object/from16 v12, v18

    check-cast v12, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;

    invoke-virtual {v12, v13}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setClipID(I)V

    invoke-interface {v11, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    :cond_6
    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getRealPath()Ljava/lang/String;

    move-result-object v12

    iput-object v12, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mClipPath:Ljava/lang/String;

    iput v13, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mClipID:I

    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getWidth()I

    move-result v12

    iput v12, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mWidth:I

    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getHeight()I

    move-result v12

    iput v12, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mHeight:I

    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getAudioOnOff()Z

    move-result v12

    iput v12, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mAudioOnOff:I

    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getBGMVolume()I

    move-result v12

    iput v12, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mBGMVolume:I

    const/4 v12, 0x1

    invoke-virtual {v14, v12}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getTransitionEffect(Z)Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;->getId()Ljava/lang/String;

    move-result-object v12

    iput-object v12, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mClipEffectID:Ljava/lang/String;

    const/4 v12, 0x2

    if-ne v8, v12, :cond_7

    const-string v8, "none"

    iput-object v8, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mClipEffectID:Ljava/lang/String;

    const/4 v8, 0x0

    iput v8, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mEffectDuration:I

    :goto_3
    const/4 v8, 0x1

    goto :goto_4

    :cond_7
    const/4 v8, 0x0

    const/4 v12, 0x1

    invoke-virtual {v14, v12}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getTransitionEffect(Z)Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;->getId()Ljava/lang/String;

    move-result-object v12

    iput-object v12, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mClipEffectID:Ljava/lang/String;

    iget-object v12, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mClipEffectID:Ljava/lang/String;

    const-string v8, "none"

    invoke-virtual {v12, v8}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v8

    if-nez v8, :cond_8

    const/4 v8, 0x0

    iput v8, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mEffectDuration:I

    goto :goto_3

    :cond_8
    const/4 v8, 0x1

    invoke-virtual {v14, v8}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getTransitionEffect(Z)Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;

    move-result-object v12

    invoke-virtual {v12}, Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;->getDuration()I

    move-result v12

    iput v12, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mEffectDuration:I

    :goto_4
    invoke-virtual {v14, v8}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getTransitionEffect(Z)Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;

    move-result-object v12

    invoke-virtual {v12}, Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;->getOffset()I

    move-result v12

    iput v12, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mEffectOffset:I

    invoke-virtual {v14, v8}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getTransitionEffect(Z)Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;

    move-result-object v12

    invoke-virtual {v12}, Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;->getOverlap()I

    move-result v12

    iput v12, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mEffectOverlap:I

    invoke-virtual {v14, v8}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getClipEffect(Z)Lcom/nexstreaming/nexeditorsdk/nexClipEffect;

    move-result-object v12

    invoke-virtual {v12}, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->getId()Ljava/lang/String;

    move-result-object v8

    iput-object v8, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mTitleEffectID:Ljava/lang/String;

    iget-object v8, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mTitleEffectID:Ljava/lang/String;

    const-string v12, "none"

    invoke-virtual {v8, v12}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v8

    if-nez v8, :cond_9

    const/4 v8, 0x0

    iput-object v8, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mTitleEffectID:Ljava/lang/String;

    :cond_9
    iget v8, v14, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTitleEffectStartTime:I

    iput v8, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mTitleStartTime:I

    iget v8, v14, Lcom/nexstreaming/nexeditorsdk/nexClip;->mTitleEffectEndTime:I

    iput v8, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mTitleEndTime:I

    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getClipType()I

    move-result v8

    const/4 v12, 0x1

    if-eq v8, v12, :cond_d

    const/4 v12, 0x4

    if-eq v8, v12, :cond_a

    goto/16 :goto_5

    :cond_a
    iput v12, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mClipType:I

    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->hasAudio()Z

    move-result v8

    iput v8, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mExistAudio:I

    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->hasVideo()Z

    move-result v8

    iput v8, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mExistVideo:I

    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getTotalTime()I

    move-result v8

    iput v8, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mTotalTime:I

    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getTotalTime()I

    move-result v8

    iput v8, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mTotalVideoTime:I

    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getClipVolume()I

    move-result v8

    iput v8, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mClipVolume:I

    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getVideoClipEdit()Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    move-result-object v8

    iget v8, v8, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;->mTrimStartDuration:I

    if-nez v8, :cond_b

    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getVideoClipEdit()Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    move-result-object v8

    iget v8, v8, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;->mTrimEndDuration:I

    if-eqz v8, :cond_c

    :cond_b
    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getVideoClipEdit()Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    move-result-object v8

    iget v8, v8, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;->mTrimStartDuration:I

    iput v8, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mStartTrimTime:I

    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getVideoClipEdit()Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    move-result-object v8

    iget v8, v8, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;->mTrimEndDuration:I

    iput v8, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mEndTrimTime:I

    :cond_c
    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getVideoClipEdit()Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    move-result-object v8

    iget v8, v8, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;->mFreezeDuration:I

    iput v8, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mFreezeDuration:I

    iget v8, v14, Lcom/nexstreaming/nexeditorsdk/nexClip;->mStartTime:I

    iput v8, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mStartTime:I

    iget v8, v14, Lcom/nexstreaming/nexeditorsdk/nexClip;->mEndTime:I

    iput v8, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mEndTime:I

    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getVideoClipEdit()Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    move-result-object v8

    invoke-virtual {v8}, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;->getSpeedControl()I

    move-result v8

    iput v8, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mSpeedControl:I

    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getAudioEdit()Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;

    move-result-object v8

    invoke-virtual {v8}, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->getVoiceChangerFactor()I

    move-result v8

    iput v8, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mVoiceChanger:I

    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getAudioEdit()Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;

    move-result-object v8

    invoke-virtual {v8}, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->getCompressor()I

    move-result v8

    iput v8, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mCompressor:I

    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getAudioEdit()Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;

    move-result-object v8

    invoke-virtual {v8}, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->getPitch()I

    move-result v8

    iput v8, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mPitchFactor:I

    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getAudioEdit()Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;

    move-result-object v8

    invoke-virtual {v8}, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->getMusicEffect()I

    move-result v8

    iput v8, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mMusicEffector:I

    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getAudioEdit()Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;

    move-result-object v8

    invoke-virtual {v8}, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->getPanLeft()I

    move-result v8

    iput v8, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mPanLeft:I

    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getAudioEdit()Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;

    move-result-object v8

    invoke-virtual {v8}, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->getPanRight()I

    move-result v8

    iput v8, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mPanRight:I

    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getAudioEdit()Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;

    move-result-object v8

    invoke-virtual {v8}, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->getProcessorStrength()I

    move-result v8

    iput v8, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mProcessorStrength:I

    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getAudioEdit()Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;

    move-result-object v8

    invoke-virtual {v8}, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->getBassStrength()I

    move-result v8

    iput v8, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mBassStrength:I

    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getAudioEdit()Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;

    move-result-object v8

    invoke-virtual {v8}, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->getEnhancedAudioFilter()Ljava/lang/String;

    move-result-object v8

    iput-object v8, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mEnhancedAudioFilter:Ljava/lang/String;

    iget-boolean v8, v14, Lcom/nexstreaming/nexeditorsdk/nexClip;->mPropertySlowVideoMode:Z

    iput v8, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mSlowMotion:I

    goto :goto_5

    :cond_d
    iget v8, v14, Lcom/nexstreaming/nexeditorsdk/nexClip;->mStartTime:I

    iput v8, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mStartTime:I

    iget v8, v14, Lcom/nexstreaming/nexeditorsdk/nexClip;->mEndTime:I

    iput v8, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mEndTime:I

    const/4 v8, 0x1

    iput v8, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mClipType:I

    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getImageClipDuration()I

    move-result v8

    iput v8, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mTotalTime:I

    const/16 v8, 0x64

    iput v8, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mSpeedControl:I

    :goto_5
    add-int/lit8 v13, v13, 0x1

    iget v8, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mEndTime:I

    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getRotateDegree()I

    move-result v12

    iput v12, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mRotateState:I

    move-object/from16 v12, v17

    invoke-virtual {v6, v14, v12}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->getEncodedEffectOptions(Lcom/nexstreaming/nexeditorsdk/nexClip;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    iput-object v12, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mTitle:Ljava/lang/String;

    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getVignetteEffect()Z

    move-result v12

    iput v12, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mVignette:I

    iget v12, v6, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mEnhancedCropMode:I

    move-object/from16 v19, v0

    const/4 v0, 0x1

    if-ne v12, v0, :cond_e

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    new-instance v12, Landroid/graphics/Rect;

    invoke-direct {v12}, Landroid/graphics/Rect;-><init>()V

    move/from16 v20, v1

    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getStartPositionRaw(Landroid/graphics/Rect;)V

    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v1

    invoke-virtual {v1, v12}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getEndPositionRaw(Landroid/graphics/Rect;)V

    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getWidth()I

    move-result v1

    move/from16 v21, v8

    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getHeight()I

    move-result v8

    move/from16 v22, v13

    iget v13, v6, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mEnhancedCropOutputWidth:I

    int-to-float v13, v13

    move-object/from16 v23, v11

    iget v11, v6, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mEnhancedCropOutputHeight:I

    int-to-float v11, v11

    invoke-static {v0, v1, v8, v13, v11}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->enhancedCrop(Landroid/graphics/Rect;IIFF)V

    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getWidth()I

    move-result v1

    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getHeight()I

    move-result v8

    iget v11, v6, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mEnhancedCropOutputWidth:I

    int-to-float v11, v11

    iget v13, v6, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mEnhancedCropOutputHeight:I

    int-to-float v13, v13

    invoke-static {v12, v1, v8, v11, v13}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->enhancedCrop(Landroid/graphics/Rect;IIFF)V

    new-instance v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexRectangle;

    iget v8, v0, Landroid/graphics/Rect;->left:I

    iget v11, v0, Landroid/graphics/Rect;->top:I

    iget v13, v0, Landroid/graphics/Rect;->right:I

    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    invoke-direct {v1, v8, v11, v13, v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexRectangle;-><init>(IIII)V

    iput-object v1, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mStartRect:Lcom/nexstreaming/kminternal/nexvideoeditor/NexRectangle;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexRectangle;

    iget v1, v12, Landroid/graphics/Rect;->left:I

    iget v8, v12, Landroid/graphics/Rect;->top:I

    iget v11, v12, Landroid/graphics/Rect;->right:I

    iget v12, v12, Landroid/graphics/Rect;->bottom:I

    invoke-direct {v0, v1, v8, v11, v12}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexRectangle;-><init>(IIII)V

    iput-object v0, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mEndRect:Lcom/nexstreaming/kminternal/nexvideoeditor/NexRectangle;

    goto/16 :goto_7

    :cond_e
    move/from16 v20, v1

    move/from16 v21, v8

    move-object/from16 v23, v11

    move/from16 v22, v13

    iget v0, v6, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mEnhancedCropMode:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_f

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexRectangle;

    const/4 v1, 0x0

    const v8, 0x186a0

    invoke-direct {v0, v1, v1, v8, v8}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexRectangle;-><init>(IIII)V

    iput-object v0, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mStartRect:Lcom/nexstreaming/kminternal/nexvideoeditor/NexRectangle;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexRectangle;

    invoke-direct {v0, v1, v1, v8, v8}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexRectangle;-><init>(IIII)V

    iput-object v0, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mEndRect:Lcom/nexstreaming/kminternal/nexvideoeditor/NexRectangle;

    goto/16 :goto_7

    :cond_f
    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v0

    iget v0, v0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotation:I

    const/16 v1, 0x5a

    if-eq v0, v1, :cond_11

    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v0

    iget v0, v0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotation:I

    const/16 v1, 0x10e

    if-ne v0, v1, :cond_10

    goto :goto_6

    :cond_10
    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexRectangle;

    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v1

    iget v1, v1, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_startPositionLeft:I

    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v8

    iget v8, v8, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_startPositionTop:I

    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v11

    iget v11, v11, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_startPositionRight:I

    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v12

    iget v12, v12, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_startPositionBottom:I

    invoke-direct {v0, v1, v8, v11, v12}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexRectangle;-><init>(IIII)V

    iput-object v0, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mStartRect:Lcom/nexstreaming/kminternal/nexvideoeditor/NexRectangle;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexRectangle;

    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v1

    iget v1, v1, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_endPositionLeft:I

    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v8

    iget v8, v8, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_endPositionTop:I

    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v11

    iget v11, v11, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_endPositionRight:I

    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v12

    iget v12, v12, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_endPositionBottom:I

    invoke-direct {v0, v1, v8, v11, v12}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexRectangle;-><init>(IIII)V

    iput-object v0, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mEndRect:Lcom/nexstreaming/kminternal/nexvideoeditor/NexRectangle;

    goto :goto_7

    :cond_11
    :goto_6
    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexRectangle;

    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v1

    iget v1, v1, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedStartPositionLeft:I

    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v8

    iget v8, v8, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedStartPositionTop:I

    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v11

    iget v11, v11, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedStartPositionRight:I

    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v12

    iget v12, v12, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedStartPositionBottom:I

    invoke-direct {v0, v1, v8, v11, v12}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexRectangle;-><init>(IIII)V

    iput-object v0, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mStartRect:Lcom/nexstreaming/kminternal/nexvideoeditor/NexRectangle;

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexRectangle;

    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v1

    iget v1, v1, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedEndPositionLeft:I

    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v8

    iget v8, v8, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedEndPositionTop:I

    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v11

    iget v11, v11, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedEndPositionRight:I

    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v12

    iget v12, v12, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedEndPositionBottom:I

    invoke-direct {v0, v1, v8, v11, v12}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexRectangle;-><init>(IIII)V

    iput-object v0, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mEndRect:Lcom/nexstreaming/kminternal/nexvideoeditor/NexRectangle;

    :goto_7
    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCombinedBrightness()I

    move-result v0

    iput v0, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mBrightness:I

    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCombinedSaturation()I

    move-result v0

    iput v0, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mSaturation:I

    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCombinedContrast()I

    move-result v0

    iput v0, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mContrast:I

    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getTintColor()I

    move-result v0

    iput v0, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mTintcolor:I

    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getLUTId()I

    move-result v0

    iput v0, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mLUT:I

    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCustomLUTA()I

    move-result v0

    iput v0, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mCustomLUT_A:I

    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCustomLUTB()I

    move-result v0

    iput v0, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mCustomLUT_B:I

    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCustomLUTPower()I

    move-result v0

    iput v0, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mCustomLUT_Power:I

    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getAudioEnvelop()Lcom/nexstreaming/nexeditorsdk/nexAudioEnvelop;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexAudioEnvelop;->getVolumeEnvelopeTimeList()[I

    move-result-object v0

    if-eqz v0, :cond_12

    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getAudioEnvelop()Lcom/nexstreaming/nexeditorsdk/nexAudioEnvelop;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexAudioEnvelop;->getVolumeEnvelopeTimeList()[I

    move-result-object v0

    iput-object v0, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mVolumeEnvelopeTime:[I

    goto :goto_8

    :cond_12
    const/4 v0, 0x2

    new-array v1, v0, [I

    const/4 v0, 0x0

    aput v0, v1, v0

    iget v0, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mEndTime:I

    iget v8, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mStartTime:I

    sub-int/2addr v0, v8

    const/4 v8, 0x1

    aput v0, v1, v8

    iput-object v1, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mVolumeEnvelopeTime:[I

    :goto_8
    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getAudioEnvelop()Lcom/nexstreaming/nexeditorsdk/nexAudioEnvelop;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexAudioEnvelop;->getVolumeEnvelopeLevelList()[I

    move-result-object v0

    if-eqz v0, :cond_13

    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getAudioEnvelop()Lcom/nexstreaming/nexeditorsdk/nexAudioEnvelop;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexAudioEnvelop;->getVolumeEnvelopeLevelList()[I

    move-result-object v0

    iput-object v0, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mVolumeEnvelopeLevel:[I

    goto :goto_9

    :cond_13
    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    iput-object v0, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mVolumeEnvelopeLevel:[I

    :goto_9
    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->isMotionTrackedVideo()Z

    move-result v0

    iput v0, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mMotionTracked:I

    invoke-interface {v5, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getAVSyncTime()I

    move-result v0

    if-eqz v0, :cond_19

    new-instance v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;

    invoke-direct {v1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;-><init>()V

    add-int/lit8 v8, v15, 0x1

    iput v15, v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;->mClipID:I

    iget v11, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mClipID:I

    iput v11, v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;->mVisualClipID:I

    iget v11, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mTotalTime:I

    iput v11, v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;->mTotalTime:I

    iget-object v11, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mClipPath:Ljava/lang/String;

    iput-object v11, v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;->mClipPath:Ljava/lang/String;

    iget v11, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mAudioOnOff:I

    iput v11, v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;->mAudioOnOff:I

    const/4 v11, 0x0

    iput v11, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mAudioOnOff:I

    const/4 v12, 0x3

    iput v12, v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;->mClipType:I

    iget v12, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mClipVolume:I

    iput v12, v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;->mClipVolume:I

    iput v11, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mClipVolume:I

    iput v11, v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;->mAutoEnvelop:I

    iget v11, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mSpeedControl:I

    iput v11, v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;->mSpeedControl:I

    int-to-float v11, v0

    iget v12, v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;->mSpeedControl:I

    int-to-float v12, v12

    mul-float v11, v11, v12

    const/high16 v12, 0x42c80000    # 100.0f

    div-float/2addr v11, v12

    float-to-int v11, v11

    if-lez v0, :cond_16

    iget v13, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mStartTime:I

    if-nez v13, :cond_14

    iget v0, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mStartTime:I

    add-int/2addr v0, v11

    iput v0, v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;->mStartTime:I

    iget v0, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mStartTrimTime:I

    iput v0, v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;->mStartTrimTime:I

    const/4 v11, 0x0

    goto :goto_a

    :cond_14
    iget v13, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mStartTime:I

    iput v13, v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;->mStartTime:I

    iget v13, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mStartTrimTime:I

    if-nez v13, :cond_15

    iget v0, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mStartTime:I

    add-int/2addr v0, v11

    iput v0, v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;->mStartTime:I

    const/4 v11, 0x0

    iput v11, v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;->mStartTrimTime:I

    goto :goto_a

    :cond_15
    const/4 v11, 0x0

    iget v13, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mStartTrimTime:I

    sub-int/2addr v13, v0

    iput v13, v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;->mStartTrimTime:I

    iget v0, v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;->mStartTrimTime:I

    if-gez v0, :cond_17

    iput v11, v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;->mStartTrimTime:I

    goto :goto_a

    :cond_16
    const/4 v11, 0x0

    iget v13, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mStartTime:I

    iput v13, v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;->mStartTime:I

    iget v13, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mStartTrimTime:I

    sub-int/2addr v13, v0

    iput v13, v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;->mStartTrimTime:I

    :cond_17
    :goto_a
    iput v11, v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;->mEndTrimTime:I

    iget v0, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mEndTime:I

    iput v0, v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;->mEndTime:I

    iget v0, v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;->mEndTime:I

    iget v11, v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;->mStartTime:I

    sub-int/2addr v0, v11

    int-to-float v0, v0

    iget v9, v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mSpeedControl:I

    int-to-float v9, v9

    mul-float v0, v0, v9

    div-float/2addr v0, v12

    float-to-int v0, v0

    iget v9, v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;->mTotalTime:I

    iget v11, v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;->mStartTrimTime:I

    add-int/2addr v11, v0

    sub-int/2addr v9, v11

    iput v9, v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;->mEndTrimTime:I

    iget v0, v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;->mEndTrimTime:I

    if-gez v0, :cond_18

    const/4 v0, 0x0

    iput v0, v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;->mEndTrimTime:I

    :cond_18
    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move v15, v8

    :cond_19
    add-int/lit8 v10, v10, 0x1

    move-object/from16 v0, v19

    move/from16 v1, v20

    move/from16 v14, v21

    move/from16 v13, v22

    move-object/from16 v11, v23

    const/4 v8, 0x0

    goto/16 :goto_0

    :cond_1a
    move-object/from16 v23, v11

    sget-boolean v0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->sTranscodeMode:Z

    if-nez v0, :cond_31

    if-lez v2, :cond_1e

    iget-object v0, v6, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    if-eqz v0, :cond_1e

    iget-object v0, v6, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getOverlayItems()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_b
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1e

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->isVideo()Z

    move-result v2

    if-eqz v2, :cond_1d

    new-instance v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;

    invoke-direct {v2}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;-><init>()V

    iput v13, v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mClipID:I

    iput v13, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mVideoEngineId:I

    const/4 v8, 0x7

    iput v8, v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mClipType:I

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->getOverlayImage()Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;

    move-result-object v8

    invoke-virtual {v8}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->getVideoClipInfo()Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;

    move-result-object v8

    invoke-virtual {v8}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;->getTotalTime()I

    move-result v8

    iput v8, v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mTotalTime:I

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->getStartTime()I

    move-result v8

    iput v8, v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mStartTime:I

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->getEndTime()I

    move-result v8

    iput v8, v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mEndTime:I

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->getStartTrimTime()I

    move-result v8

    if-nez v8, :cond_1c

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->getEndTrimTime()I

    move-result v8

    if-eqz v8, :cond_1b

    goto :goto_c

    :cond_1b
    const/4 v8, 0x0

    iput v8, v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mStartTrimTime:I

    iput v8, v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mEndTrimTime:I

    goto :goto_d

    :cond_1c
    :goto_c
    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->getStartTrimTime()I

    move-result v8

    iput v8, v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mStartTrimTime:I

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->getEndTrimTime()I

    move-result v8

    iput v8, v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mEndTrimTime:I

    :goto_d
    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->getOverlayImage()Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;

    move-result-object v8

    invoke-virtual {v8}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->getVideoClipInfo()Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;

    move-result-object v8

    invoke-virtual {v8}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;->getWidth()I

    move-result v8

    iput v8, v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mWidth:I

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->getOverlayImage()Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;

    move-result-object v8

    invoke-virtual {v8}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->getVideoClipInfo()Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;

    move-result-object v8

    invoke-virtual {v8}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;->getHeight()I

    move-result v8

    iput v8, v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mHeight:I

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->getOverlayImage()Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;

    move-result-object v8

    invoke-virtual {v8}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->getVideoClipInfo()Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;

    move-result-object v8

    invoke-virtual {v8}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;->hasVideo()Z

    move-result v8

    iput v8, v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mExistVideo:I

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->getOverlayImage()Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;

    move-result-object v8

    invoke-virtual {v8}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->getVideoClipInfo()Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;

    move-result-object v8

    invoke-virtual {v8}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;->hasAudio()Z

    move-result v8

    iput v8, v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mExistAudio:I

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->getStartTime()I

    move-result v8

    iput v8, v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mTitleStartTime:I

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->getEndTime()I

    move-result v8

    iput v8, v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mTitleEndTime:I

    const/16 v8, 0x64

    iput v8, v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mBGMVolume:I

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->getAudioOnOff()Z

    move-result v9

    iput v9, v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mAudioOnOff:I

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->getVolume()I

    move-result v9

    iput v9, v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mClipVolume:I

    const/4 v9, 0x0

    iput v9, v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mEffectDuration:I

    const-string v10, "none"

    iput-object v10, v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mClipEffectID:Ljava/lang/String;

    const/4 v10, 0x0

    iput-object v10, v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mTitleEffectID:Ljava/lang/String;

    new-instance v11, Lcom/nexstreaming/kminternal/nexvideoeditor/NexRectangle;

    const v12, 0x186a0

    invoke-direct {v11, v9, v9, v12, v12}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexRectangle;-><init>(IIII)V

    iput-object v11, v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mStartRect:Lcom/nexstreaming/kminternal/nexvideoeditor/NexRectangle;

    new-instance v11, Lcom/nexstreaming/kminternal/nexvideoeditor/NexRectangle;

    invoke-direct {v11, v9, v9, v12, v12}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexRectangle;-><init>(IIII)V

    iput-object v11, v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mEndRect:Lcom/nexstreaming/kminternal/nexvideoeditor/NexRectangle;

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->getOverlayImage()Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;

    move-result-object v11

    invoke-virtual {v11}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->getVideoClipInfo()Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;

    move-result-object v11

    invoke-virtual {v11}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;->getPath()Ljava/lang/String;

    move-result-object v11

    iput-object v11, v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mClipPath:Ljava/lang/String;

    iput-object v10, v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mThumbnailPath:Ljava/lang/String;

    iput v9, v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mRotateState:I

    iput v9, v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mEffectOffset:I

    iput v9, v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mEffectOverlap:I

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->getSpeedControl()I

    move-result v1

    iput v1, v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexVisualClip;->mSpeedControl:I

    invoke-interface {v5, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v13, v13, 0x1

    goto/16 :goto_b

    :cond_1d
    const/16 v8, 0x64

    const/4 v10, 0x0

    const v12, 0x186a0

    goto/16 :goto_b

    :cond_1e
    const/4 v10, 0x0

    const/16 v0, 0x2711

    invoke-virtual {v7}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getBackgroundMusic()Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v1

    if-eqz v1, :cond_23

    new-instance v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;

    invoke-direct {v2}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;-><init>()V

    const/16 v8, 0x2712

    iput v0, v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;->mClipID:I

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getTotalTime()I

    move-result v0

    iput v0, v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;->mTotalTime:I

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getRealPath()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;->mClipPath:Ljava/lang/String;

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getAudioOnOff()Z

    move-result v0

    iput v0, v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;->mAudioOnOff:I

    const/4 v0, 0x3

    iput v0, v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;->mClipType:I

    invoke-virtual {v7}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getBGMMasterVolumeScale()F

    move-result v0

    const/high16 v9, 0x43480000    # 200.0f

    mul-float v0, v0, v9

    float-to-int v0, v0

    iput v0, v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;->mClipVolume:I

    const/4 v0, 0x1

    iput v0, v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;->mAutoEnvelop:I

    iget v0, v7, Lcom/nexstreaming/nexeditorsdk/nexProject;->mStartTimeBGM:I

    iput v0, v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;->mStartTime:I

    iget v0, v7, Lcom/nexstreaming/nexeditorsdk/nexProject;->mBGMTrimStartTime:I

    iput v0, v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;->mStartTrimTime:I

    iget v0, v7, Lcom/nexstreaming/nexeditorsdk/nexProject;->mBGMTrimEndTime:I

    if-nez v0, :cond_1f

    const/4 v0, 0x0

    iput v0, v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;->mEndTrimTime:I

    goto :goto_e

    :cond_1f
    const/4 v0, 0x0

    iget v9, v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;->mTotalTime:I

    iget v11, v7, Lcom/nexstreaming/nexeditorsdk/nexProject;->mBGMTrimEndTime:I

    sub-int/2addr v9, v11

    iput v9, v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;->mEndTrimTime:I

    iget v9, v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;->mEndTrimTime:I

    if-gez v9, :cond_20

    iput v0, v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;->mEndTrimTime:I

    :cond_20
    :goto_e
    iget v0, v7, Lcom/nexstreaming/nexeditorsdk/nexProject;->mBGMTrimEndTime:I

    iget v9, v7, Lcom/nexstreaming/nexeditorsdk/nexProject;->mBGMTrimStartTime:I

    sub-int/2addr v0, v9

    if-gtz v0, :cond_21

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getTotalTime()I

    move-result v0

    :cond_21
    iget-boolean v9, v7, Lcom/nexstreaming/nexeditorsdk/nexProject;->mLoopBGM:Z

    if-eqz v9, :cond_22

    invoke-virtual {v7}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalTime()I

    move-result v0

    :cond_22
    iget v9, v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;->mStartTime:I

    add-int/2addr v0, v9

    iput v0, v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;->mEndTime:I

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getAudioEnvelop()Lcom/nexstreaming/nexeditorsdk/nexAudioEnvelop;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexAudioEnvelop;->getVolumeEnvelopeTimeList()[I

    move-result-object v0

    iput-object v0, v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;->mVolumeEnvelopeTime:[I

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getAudioEnvelop()Lcom/nexstreaming/nexeditorsdk/nexAudioEnvelop;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexAudioEnvelop;->getVolumeEnvelopeLevelList()[I

    move-result-object v0

    iput-object v0, v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;->mVolumeEnvelopeLevel:[I

    invoke-interface {v4, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const/16 v0, 0x2712

    :cond_23
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_f
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_24

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;

    invoke-interface {v4, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_f

    :cond_24
    invoke-virtual {v7}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getAudioItems()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_10
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_25

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/nexstreaming/nexeditorsdk/nexAudioItem;

    new-instance v3, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;

    invoke-direct {v3}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;-><init>()V

    iget-object v8, v2, Lcom/nexstreaming/nexeditorsdk/nexAudioItem;->mClip:Lcom/nexstreaming/nexeditorsdk/nexClip;

    iput v0, v3, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;->mClipID:I

    invoke-virtual {v8}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getTotalTime()I

    move-result v9

    iput v9, v3, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;->mTotalTime:I

    invoke-virtual {v8}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getRealPath()Ljava/lang/String;

    move-result-object v9

    iput-object v9, v3, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;->mClipPath:Ljava/lang/String;

    invoke-virtual {v8}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getAudioOnOff()Z

    move-result v9

    iput v9, v3, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;->mAudioOnOff:I

    const/4 v9, 0x3

    iput v9, v3, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;->mClipType:I

    invoke-virtual {v8}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getClipVolume()I

    move-result v9

    iput v9, v3, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;->mClipVolume:I

    iget v9, v8, Lcom/nexstreaming/nexeditorsdk/nexClip;->mStartTime:I

    iput v9, v3, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;->mStartTime:I

    iget v9, v8, Lcom/nexstreaming/nexeditorsdk/nexClip;->mEndTime:I

    iput v9, v3, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;->mEndTime:I

    iget v9, v2, Lcom/nexstreaming/nexeditorsdk/nexAudioItem;->mTrimStartDuration:I

    iput v9, v3, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;->mStartTrimTime:I

    iget v9, v2, Lcom/nexstreaming/nexeditorsdk/nexAudioItem;->mTrimEndDuration:I

    iput v9, v3, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;->mEndTrimTime:I

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexAudioItem;->getSpeedControl()I

    move-result v2

    iput v2, v3, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;->mSpeedControl:I

    invoke-virtual {v8}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getAudioEnvelop()Lcom/nexstreaming/nexeditorsdk/nexAudioEnvelop;

    move-result-object v2

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexAudioEnvelop;->getVolumeEnvelopeTimeList()[I

    move-result-object v2

    iput-object v2, v3, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;->mVolumeEnvelopeTime:[I

    invoke-virtual {v8}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getAudioEnvelop()Lcom/nexstreaming/nexeditorsdk/nexAudioEnvelop;

    move-result-object v2

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexAudioEnvelop;->getVolumeEnvelopeLevelList()[I

    move-result-object v2

    iput-object v2, v3, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;->mVolumeEnvelopeLevel:[I

    invoke-virtual {v8}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getAudioEdit()Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;

    move-result-object v2

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->getVoiceChangerFactor()I

    move-result v2

    iput v2, v3, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;->mVoiceChanger:I

    invoke-virtual {v8}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getAudioEdit()Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;

    move-result-object v2

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->getCompressor()I

    move-result v2

    iput v2, v3, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;->mCompressor:I

    invoke-virtual {v8}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getAudioEdit()Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;

    move-result-object v2

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->getPitch()I

    move-result v2

    iput v2, v3, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;->mPitchFactor:I

    invoke-virtual {v8}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getAudioEdit()Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;

    move-result-object v2

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->getMusicEffect()I

    move-result v2

    iput v2, v3, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;->mMusicEffector:I

    invoke-virtual {v8}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getAudioEdit()Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;

    move-result-object v2

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->getPanLeft()I

    move-result v2

    iput v2, v3, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;->mPanLeft:I

    invoke-virtual {v8}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getAudioEdit()Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;

    move-result-object v2

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->getPanRight()I

    move-result v2

    iput v2, v3, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;->mPanRight:I

    invoke-virtual {v8}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getAudioEdit()Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;

    move-result-object v2

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->getProcessorStrength()I

    move-result v2

    iput v2, v3, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;->mProcessorStrength:I

    invoke-virtual {v8}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getAudioEdit()Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;

    move-result-object v2

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->getBassStrength()I

    move-result v2

    iput v2, v3, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;->mBassStrength:I

    invoke-virtual {v8}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getAudioEdit()Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;

    move-result-object v2

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexAudioEdit;->getEnhancedAudioFilter()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v3, Lcom/nexstreaming/kminternal/nexvideoeditor/NexAudioClip;->mEnhancedAudioFilter:Ljava/lang/String;

    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_10

    :cond_25
    invoke-virtual {v7}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTemplateApplyMode()I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_26

    const/4 v8, 0x1

    const/16 v9, 0x101

    move-object/from16 v0, p0

    move-object v1, v5

    move-object v2, v4

    move/from16 v3, p1

    move v4, v8

    move v5, v9

    invoke-direct/range {v0 .. v5}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->loadClipToEngine(Ljava/util/List;Ljava/util/List;ZZI)Z

    move-result v0

    if-eqz v0, :cond_27

    :goto_11
    const/4 v8, 0x1

    goto :goto_12

    :cond_26
    const/4 v8, 0x0

    move-object/from16 v0, p0

    move-object v1, v5

    move-object v2, v4

    move/from16 v3, p1

    move/from16 v4, p2

    move v5, v8

    invoke-direct/range {v0 .. v5}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->loadClipToEngine(Ljava/util/List;Ljava/util/List;ZZI)Z

    move-result v0

    if-eqz v0, :cond_27

    goto :goto_11

    :cond_27
    const/4 v8, 0x0

    :goto_12
    invoke-virtual {v7}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTopDrawInfo()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_29

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_29

    const-string v1, "nexEngine"

    const-string v2, "resolve Project for top drawInfo(%d) ++++++++++++++++++++"

    const/4 v3, 0x1

    new-array v4, v3, [Ljava/lang/Object;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v5, 0x0

    aput-object v3, v4, v5

    invoke-static {v2, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    new-array v9, v1, [Lcom/nexstreaming/kminternal/nexvideoeditor/NexDrawInfo;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    const/4 v2, 0x0

    :goto_13
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_28

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;

    new-instance v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexDrawInfo;

    invoke-direct {v4}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexDrawInfo;-><init>()V

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getID()I

    move-result v5

    iput v5, v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexDrawInfo;->mID:I

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getClipID()I

    move-result v5

    iput v5, v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexDrawInfo;->mTrackID:I

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getSubEffectID()I

    move-result v5

    iput v5, v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexDrawInfo;->mSubEffectID:I

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getEffectID()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexDrawInfo;->mEffectID:Ljava/lang/String;

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getTitle()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexDrawInfo;->mTitle:Ljava/lang/String;

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getIsTransition()I

    move-result v5

    iput v5, v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexDrawInfo;->mIsTransition:I

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getStartTime()I

    move-result v5

    iput v5, v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexDrawInfo;->mStartTime:I

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getEndTime()I

    move-result v5

    iput v5, v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexDrawInfo;->mEndTime:I

    aput-object v4, v9, v2

    const/4 v4, 0x1

    add-int/2addr v2, v4

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getEndTime()I

    move-result v14

    goto :goto_13

    :cond_28
    const/4 v4, 0x1

    const-string v1, "nexEngine"

    const-string v2, "resolve Project for top drawInfo(%d) --------------------"

    new-array v3, v4, [Ljava/lang/Object;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v4, 0x0

    aput-object v0, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_14

    :cond_29
    move-object v9, v10

    :goto_14
    if-eqz v9, :cond_2b

    invoke-interface/range {v23 .. v23}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_2b

    const-string v0, "nexEngine"

    const-string v1, "resolve Project for sub drawInfo(%d) ++++++++++++++++++++"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Object;

    invoke-interface/range {v23 .. v23}, Ljava/util/List;->size()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v4, 0x0

    aput-object v2, v3, v4

    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-interface/range {v23 .. v23}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [Lcom/nexstreaming/kminternal/nexvideoeditor/NexDrawInfo;

    invoke-interface/range {v23 .. v23}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    const/4 v2, 0x0

    :goto_15
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2a

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;

    new-instance v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexDrawInfo;

    invoke-direct {v4}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexDrawInfo;-><init>()V

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getID()I

    move-result v5

    iput v5, v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexDrawInfo;->mID:I

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getClipID()I

    move-result v5

    iput v5, v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexDrawInfo;->mTrackID:I

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getSubEffectID()I

    move-result v5

    iput v5, v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexDrawInfo;->mSubEffectID:I

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getEffectID()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexDrawInfo;->mEffectID:Ljava/lang/String;

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getTitle()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexDrawInfo;->mTitle:Ljava/lang/String;

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getStartTime()I

    move-result v5

    iput v5, v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexDrawInfo;->mStartTime:I

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getEndTime()I

    move-result v5

    iput v5, v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexDrawInfo;->mEndTime:I

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getRotateState()I

    move-result v5

    iput v5, v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexDrawInfo;->mRotateState:I

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getUserRotateState()I

    move-result v5

    iput v5, v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexDrawInfo;->mUserRotateState:I

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getUserTranslateX()I

    move-result v5

    iput v5, v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexDrawInfo;->mTranslateX:I

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getUserTranslateY()I

    move-result v5

    iput v5, v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexDrawInfo;->mTranslateY:I

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getBrightness()I

    move-result v5

    iput v5, v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexDrawInfo;->mBrightness:I

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getContrast()I

    move-result v5

    iput v5, v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexDrawInfo;->mContrast:I

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getSaturation()I

    move-result v5

    iput v5, v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexDrawInfo;->mSaturation:I

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getTintcolor()I

    move-result v5

    iput v5, v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexDrawInfo;->mTintcolor:I

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getLUT()I

    move-result v5

    iput v5, v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexDrawInfo;->mLUT:I

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getCustomLUTA()I

    move-result v5

    iput v5, v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexDrawInfo;->mCustomLUT_A:I

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getCustomLUTB()I

    move-result v5

    iput v5, v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexDrawInfo;->mCustomLUT_B:I

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getCustomLUTPower()I

    move-result v5

    iput v5, v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexDrawInfo;->mCustomLUT_Power:I

    iget-object v5, v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexDrawInfo;->mStartRect:Lcom/nexstreaming/kminternal/nexvideoeditor/NexRectangle;

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getStartRect()Landroid/graphics/Rect;

    move-result-object v10

    iget v10, v10, Landroid/graphics/Rect;->left:I

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getStartRect()Landroid/graphics/Rect;

    move-result-object v11

    iget v11, v11, Landroid/graphics/Rect;->top:I

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getStartRect()Landroid/graphics/Rect;

    move-result-object v12

    iget v12, v12, Landroid/graphics/Rect;->right:I

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getStartRect()Landroid/graphics/Rect;

    move-result-object v13

    iget v13, v13, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {v5, v10, v11, v12, v13}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexRectangle;->setRect(IIII)V

    iget-object v5, v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexDrawInfo;->mEndRect:Lcom/nexstreaming/kminternal/nexvideoeditor/NexRectangle;

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getEndRect()Landroid/graphics/Rect;

    move-result-object v10

    iget v10, v10, Landroid/graphics/Rect;->left:I

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getEndRect()Landroid/graphics/Rect;

    move-result-object v11

    iget v11, v11, Landroid/graphics/Rect;->top:I

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getEndRect()Landroid/graphics/Rect;

    move-result-object v12

    iget v12, v12, Landroid/graphics/Rect;->right:I

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getEndRect()Landroid/graphics/Rect;

    move-result-object v13

    iget v13, v13, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {v5, v10, v11, v12, v13}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexRectangle;->setRect(IIII)V

    iget-object v5, v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexDrawInfo;->mFaceRect:Lcom/nexstreaming/kminternal/nexvideoeditor/NexRectangle;

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getFaceRect()Landroid/graphics/Rect;

    move-result-object v10

    iget v10, v10, Landroid/graphics/Rect;->left:I

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getFaceRect()Landroid/graphics/Rect;

    move-result-object v11

    iget v11, v11, Landroid/graphics/Rect;->top:I

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getFaceRect()Landroid/graphics/Rect;

    move-result-object v12

    iget v12, v12, Landroid/graphics/Rect;->right:I

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getFaceRect()Landroid/graphics/Rect;

    move-result-object v3

    iget v3, v3, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {v5, v10, v11, v12, v3}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexRectangle;->setRect(IIII)V

    aput-object v4, v0, v2

    const/4 v3, 0x1

    add-int/2addr v2, v3

    goto/16 :goto_15

    :cond_2a
    const/4 v3, 0x1

    const-string v1, "nexEngine"

    const-string v2, "resolve Project for sub drawInfo(%d) --------------------"

    new-array v4, v3, [Ljava/lang/Object;

    invoke-interface/range {v23 .. v23}, Ljava/util/List;->size()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v10, 0x0

    aput-object v3, v4, v10

    invoke-static {v2, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_16

    :cond_2b
    move-object v0, v10

    :goto_16
    iget-object v1, v6, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v1, v9, v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->asyncDrawInfoList([Lcom/nexstreaming/kminternal/nexvideoeditor/NexDrawInfo;[Lcom/nexstreaming/kminternal/nexvideoeditor/NexDrawInfo;)I

    invoke-virtual {v7}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getProjectAudioFadeInTime()I

    move-result v0

    int-to-long v0, v0

    invoke-virtual {v7}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getProjectAudioFadeOutTime()I

    move-result v2

    int-to-long v2, v2

    add-long v4, v0, v2

    int-to-long v9, v14

    cmp-long v11, v4, v9

    if-lez v11, :cond_2c

    mul-long v0, v0, v9

    div-long/2addr v0, v4

    sub-long v2, v9, v0

    :cond_2c
    iget v4, v6, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mLastProjectFadeIn:I

    int-to-long v4, v4

    cmp-long v9, v4, v0

    if-nez v9, :cond_2d

    iget v4, v6, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mLastProjectFadeOut:I

    int-to-long v4, v4

    cmp-long v9, v4, v2

    if-eqz v9, :cond_2e

    :cond_2d
    long-to-int v0, v0

    iput v0, v6, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mLastProjectFadeIn:I

    long-to-int v1, v2

    iput v1, v6, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mLastProjectFadeOut:I

    iget-object v2, v6, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v2, v0, v1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->setProjectVolumeFade(II)I

    :cond_2e
    invoke-virtual {v7}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getProjectVolume()I

    move-result v0

    iget v1, v6, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mLastProjectVolume:I

    if-eq v1, v0, :cond_2f

    iput v0, v6, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mLastProjectVolume:I

    iget-object v1, v6, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v1, v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->setProjectVolume(I)I

    :cond_2f
    invoke-virtual {v7}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getManualVolumeControl()I

    move-result v0

    iget v1, v6, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mLastManualVolCtl:I

    if-eq v1, v0, :cond_30

    iput v0, v6, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mLastManualVolCtl:I

    iget-object v1, v6, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v1, v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->setProjectManualVolumeControl(I)I

    :cond_30
    const/4 v0, 0x1

    goto :goto_17

    :cond_31
    const/4 v10, 0x0

    const/4 v7, 0x0

    move-object/from16 v0, p0

    move-object v1, v5

    move-object v2, v4

    move/from16 v3, p1

    move/from16 v4, p2

    move v5, v7

    invoke-direct/range {v0 .. v5}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->loadClipToEngine(Ljava/util/List;Ljava/util/List;ZZI)Z

    move-result v0

    if-eqz v0, :cond_32

    const/4 v0, 0x1

    const/4 v8, 0x1

    goto :goto_17

    :cond_32
    const/4 v0, 0x1

    const/4 v8, 0x0

    :goto_17
    iput v0, v6, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mState:I

    return v8

    :array_0
    .array-data 4
        0x64
        0x64
    .end array-data
.end method

.method private setEditorListener()V
    .locals 2

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mEditorListener:Lcom/nexstreaming/kminternal/nexvideoeditor/c;

    if-eqz v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;

    invoke-direct {v0, p0}, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;-><init>(Lcom/nexstreaming/nexeditorsdk/nexEngine;)V

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mEditorListener:Lcom/nexstreaming/kminternal/nexvideoeditor/c;

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mEditorListener:Lcom/nexstreaming/kminternal/nexvideoeditor/c;

    invoke-virtual {v0, v1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(Lcom/nexstreaming/kminternal/nexvideoeditor/c;)V

    return-void
.end method

.method public static setExportVideoTrackUUID(Z)V
    .locals 3

    const-string v0, "nexEngine"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setExportVideoTrackUUID()="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    sput p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->sExportVideoTrackUUIDMode:I

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    sput p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->sExportVideoTrackUUIDMode:I

    :goto_0
    return-void
.end method

.method public static setLoadListAsync(Z)V
    .locals 0

    sput-boolean p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->sLoadListAsync:Z

    return-void
.end method

.method private setOverlays(Lcom/nexstreaming/nexeditorsdk/nexEngine$OverlayCommand;)V
    .locals 2

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->m_layerRenderLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/nexstreaming/nexeditorsdk/nexEngine$13;->a:[I

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexEngine$OverlayCommand;->ordinal()I

    move-result p1

    aget p1, v1, p1

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->m_layerLock:Z

    goto :goto_0

    :pswitch_1
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->m_layerLock:Z

    goto :goto_0

    :pswitch_2
    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    if-nez p1, :cond_0

    monitor-exit v0

    return-void

    :cond_0
    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mActiveRenderLayers:Ljava/util/Set;

    invoke-interface {p1}, Ljava/util/Set;->clear()V

    goto :goto_0

    :pswitch_3
    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mActiveRenderLayers:Ljava/util/Set;

    invoke-interface {p1}, Ljava/util/Set;->clear()V

    invoke-static {}, Lcom/nexstreaming/kminternal/nexvideoeditor/b;->a()Lcom/nexstreaming/kminternal/nexvideoeditor/b;

    move-result-object p1

    invoke-virtual {p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/b;->b()V

    :goto_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private transcode(Ljava/lang/String;IIIJII)I
    .locals 4

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mState:I

    const/4 v1, -0x1

    const/4 v2, 0x2

    if-ne v0, v2, :cond_0

    const-string p1, "nexEngine"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "["

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p3, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mId:I

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p3, "]already export state"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return v1

    :cond_0
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->isSetProject(Z)Z

    move-result v3

    if-eqz v3, :cond_1

    sget-object v1, Lcom/nexstreaming/nexeditorsdk/nexEngine$OverlayCommand;->upload:Lcom/nexstreaming/nexeditorsdk/nexEngine$OverlayCommand;

    invoke-direct {p0, v1}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->setOverlays(Lcom/nexstreaming/nexeditorsdk/nexEngine$OverlayCommand;)V

    sget-boolean v1, Lcom/nexstreaming/nexeditorsdk/nexEngine;->sLoadListAsync:Z

    invoke-direct {p0, v1, v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->resolveProject(ZZ)I

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mState:I

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->sTranscodeProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalTime()I

    move-result v0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mExportTotalTime:I

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mExportFilePath:Ljava/lang/String;

    iput p2, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mEncodeWidth:I

    iput p3, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mEncodeHeight:I

    iput p4, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mEncodeBitrate:I

    iput-wide p5, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mEncodeMaxFileSize:J

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    iget-object p2, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mAppContext:Landroid/content/Context;

    invoke-virtual {p1, p2}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(Landroid/content/Context;)Lcom/nexstreaming/app/common/task/Task;

    move-result-object p1

    new-instance p2, Lcom/nexstreaming/nexeditorsdk/nexEngine$4;

    invoke-direct {p2, p0, p8, p7}, Lcom/nexstreaming/nexeditorsdk/nexEngine$4;-><init>(Lcom/nexstreaming/nexeditorsdk/nexEngine;II)V

    invoke-virtual {p1, p2}, Lcom/nexstreaming/app/common/task/Task;->onComplete(Lcom/nexstreaming/app/common/task/Task$OnTaskEventListener;)Lcom/nexstreaming/app/common/task/Task;

    const/4 p1, 0x0

    return p1

    :cond_1
    return v1
.end method

.method private undoForceMixProject()V
    .locals 4

    iget-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mForceMixExportMode:Z

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->isSetProject(Z)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "nexEngine"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mId:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, "]undoForceMixProject"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v1, 0x1

    invoke-direct {p0, v1, v1}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->resolveProject(ZZ)I

    :cond_0
    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mForceMixExportMode:Z

    :cond_1
    return-void
.end method

.method private updateFaceInfo2Clip(Lcom/nexstreaming/nexeditorsdk/nexClip;ILandroid/graphics/RectF;I)V
    .locals 27

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p3

    move/from16 v3, p4

    new-instance v4, Landroid/graphics/Rect;

    invoke-direct {v4}, Landroid/graphics/Rect;-><init>()V

    new-instance v8, Landroid/graphics/Rect;

    invoke-direct {v8}, Landroid/graphics/Rect;-><init>()V

    new-instance v11, Landroid/graphics/Rect;

    invoke-direct {v11}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v5

    invoke-virtual {v5}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getWidth()I

    move-result v5

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v6

    invoke-virtual {v6}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getHeight()I

    move-result v6

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v7

    invoke-virtual {v7}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getFaceDetectSpeed()I

    move-result v7

    const-string v9, "nexEngine"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Face Detection speed: "

    invoke-virtual {v10, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v10, 0x0

    invoke-virtual {v11, v10, v10, v5, v6}, Landroid/graphics/Rect;->set(IIII)V

    iget v9, v2, Landroid/graphics/RectF;->left:F

    int-to-float v12, v5

    mul-float v9, v9, v12

    float-to-int v9, v9

    iget v13, v2, Landroid/graphics/RectF;->top:F

    int-to-float v14, v6

    mul-float v13, v13, v14

    float-to-int v13, v13

    iget v15, v2, Landroid/graphics/RectF;->right:F

    mul-float v15, v15, v12

    float-to-int v15, v15

    iget v10, v2, Landroid/graphics/RectF;->bottom:F

    mul-float v10, v10, v14

    float-to-int v10, v10

    invoke-virtual {v8, v9, v13, v15, v10}, Landroid/graphics/Rect;->set(IIII)V

    iget v9, v2, Landroid/graphics/RectF;->left:F

    mul-float v9, v9, v12

    float-to-int v9, v9

    iget v10, v2, Landroid/graphics/RectF;->top:F

    mul-float v10, v10, v14

    float-to-int v10, v10

    iget v13, v2, Landroid/graphics/RectF;->right:F

    mul-float v13, v13, v12

    float-to-int v12, v13

    iget v13, v2, Landroid/graphics/RectF;->bottom:F

    mul-float v13, v13, v14

    float-to-int v13, v13

    invoke-virtual {v4, v9, v10, v12, v13}, Landroid/graphics/Rect;->set(IIII)V

    invoke-virtual {v8}, Landroid/graphics/Rect;->isEmpty()Z

    move-result v9

    const/4 v15, 0x2

    if-eqz v9, :cond_0

    const/4 v9, 0x0

    invoke-virtual {v8, v9, v9, v5, v6}, Landroid/graphics/Rect;->set(IIII)V

    int-to-double v12, v5

    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v16

    invoke-static {v12, v13}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v12, v12, v16

    const-wide/high16 v16, 0x4010000000000000L    # 4.0

    div-double v12, v12, v16

    double-to-int v9, v12

    int-to-double v12, v6

    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v19

    invoke-static {v12, v13}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v12, v12, v19

    div-double v12, v12, v16

    double-to-int v12, v12

    invoke-virtual {v8, v9, v12}, Landroid/graphics/Rect;->offset(II)V

    const-string v9, "nexEngine"

    const-string v12, "Face Detection Empty "

    invoke-static {v9, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v9, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v8}, Landroid/graphics/Rect;->width()I

    move-result v9

    sub-int v9, v5, v9

    if-lt v9, v15, :cond_1

    iget v12, v8, Landroid/graphics/Rect;->left:I

    div-int/lit8 v9, v9, 0x8

    sub-int/2addr v12, v9

    iput v12, v8, Landroid/graphics/Rect;->left:I

    iget v12, v8, Landroid/graphics/Rect;->right:I

    add-int/2addr v12, v9

    iput v12, v8, Landroid/graphics/Rect;->right:I

    const-string v9, "nexEngine"

    const-string v12, "Face Detection width addSpace > 0"

    invoke-static {v9, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    invoke-virtual {v8}, Landroid/graphics/Rect;->height()I

    move-result v9

    sub-int v9, v6, v9

    if-lt v9, v15, :cond_2

    iget v12, v8, Landroid/graphics/Rect;->top:I

    div-int/lit8 v9, v9, 0x8

    sub-int/2addr v12, v9

    iput v12, v8, Landroid/graphics/Rect;->top:I

    iget v12, v8, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v12, v9

    iput v12, v8, Landroid/graphics/Rect;->bottom:I

    const-string v9, "nexEngine"

    const-string v12, "Face Detection height addSpace>0"

    invoke-static {v9, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    const/4 v9, 0x1

    :goto_0
    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object v12

    if-eqz v12, :cond_c

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object v12

    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result v12

    if-gtz v12, :cond_3

    goto/16 :goto_7

    :cond_3
    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object v12

    invoke-interface {v12}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v19

    :goto_1
    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_b

    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    move-object v14, v12

    check-cast v14, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;

    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getFaceRect()Landroid/graphics/Rect;

    move-result-object v12

    invoke-virtual {v12}, Landroid/graphics/Rect;->isEmpty()Z

    move-result v12

    if-nez v12, :cond_4

    goto :goto_1

    :cond_4
    new-instance v13, Landroid/graphics/Rect;

    invoke-direct {v13, v4}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    new-instance v12, Landroid/graphics/Rect;

    invoke-direct {v12, v8}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    new-instance v10, Landroid/graphics/Rect;

    invoke-direct {v10, v11}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    invoke-virtual/range {p3 .. p3}, Landroid/graphics/RectF;->isEmpty()Z

    move-result v16

    if-nez v16, :cond_a

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getEndPosionLock()Z

    move-result v16

    if-eqz v16, :cond_5

    goto/16 :goto_5

    :cond_5
    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v15

    invoke-virtual {v14}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getRatio()F

    move-result v2

    invoke-virtual {v15, v12, v2}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->growToAspect(Landroid/graphics/Rect;F)V

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v2

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getProjectDuration()I

    move-result v18

    move-object v15, v12

    move-object v12, v2

    move-object v2, v13

    move-object v13, v10

    move-object/from16 v25, v14

    move-object v14, v15

    move-object/from16 v26, v4

    move-object v4, v15

    const/4 v1, 0x2

    move v15, v5

    move/from16 v16, v6

    move/from16 v17, v7

    invoke-virtual/range {v12 .. v18}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->applyCropSpeed(Landroid/graphics/Rect;Landroid/graphics/Rect;IIII)V

    if-eqz v9, :cond_8

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v12

    invoke-virtual/range {v25 .. v25}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getRatio()F

    move-result v13

    invoke-virtual {v12, v4, v13}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->shrinkToAspect(Landroid/graphics/Rect;F)V

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v12

    invoke-virtual/range {v25 .. v25}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getRatio()F

    move-result v13

    invoke-virtual {v12, v10, v13}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->shrinkToAspect(Landroid/graphics/Rect;F)V

    const-string v12, "nexEngine"

    const-string v13, "Face Detection true"

    invoke-static {v12, v13}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget v12, v2, Landroid/graphics/Rect;->top:I

    iget v13, v10, Landroid/graphics/Rect;->top:I

    if-ge v12, v13, :cond_6

    iget v12, v10, Landroid/graphics/Rect;->top:I

    iget v13, v2, Landroid/graphics/Rect;->top:I

    sub-int/2addr v12, v13

    iget v13, v10, Landroid/graphics/Rect;->top:I

    sub-int/2addr v13, v12

    iput v13, v10, Landroid/graphics/Rect;->top:I

    iget v13, v10, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v13, v12

    iput v13, v10, Landroid/graphics/Rect;->bottom:I

    :cond_6
    iget-boolean v12, v0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->bLetterBox:Z

    if-eqz v12, :cond_7

    iget v12, v4, Landroid/graphics/Rect;->right:I

    iget v13, v4, Landroid/graphics/Rect;->left:I

    sub-int/2addr v12, v13

    iget v13, v4, Landroid/graphics/Rect;->left:I

    div-int/lit8 v12, v12, 0x4

    sub-int/2addr v13, v12

    iput v13, v4, Landroid/graphics/Rect;->left:I

    iget v13, v4, Landroid/graphics/Rect;->right:I

    add-int/2addr v13, v12

    iput v13, v4, Landroid/graphics/Rect;->right:I

    iget v12, v4, Landroid/graphics/Rect;->bottom:I

    iget v13, v4, Landroid/graphics/Rect;->top:I

    sub-int/2addr v12, v13

    iget v13, v4, Landroid/graphics/Rect;->top:I

    div-int/lit8 v12, v12, 0x4

    sub-int/2addr v13, v12

    iput v13, v4, Landroid/graphics/Rect;->top:I

    iget v13, v4, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v13, v12

    iput v13, v4, Landroid/graphics/Rect;->bottom:I

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v12

    invoke-virtual/range {v25 .. v25}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getRatio()F

    move-result v13

    invoke-virtual {v12, v4, v13}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->growToAspect(Landroid/graphics/Rect;F)V

    :cond_7
    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v12

    invoke-virtual {v12, v10}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setStartPosition(Landroid/graphics/Rect;)V

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v12

    invoke-virtual {v12, v4}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setEndPosition(Landroid/graphics/Rect;)V

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v12

    invoke-virtual {v12, v2}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setFacePosition(Landroid/graphics/Rect;)V

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v12

    invoke-virtual {v12, v10}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getStartPositionRaw(Landroid/graphics/Rect;)V

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v12

    invoke-virtual {v12, v4}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getEndPositionRaw(Landroid/graphics/Rect;)V

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v12

    invoke-virtual {v12, v2}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getFacePositionRaw(Landroid/graphics/Rect;)V

    move-object/from16 v12, v25

    const/4 v13, 0x1

    goto/16 :goto_4

    :cond_8
    if-ne v3, v1, :cond_9

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v12

    invoke-virtual/range {v25 .. v25}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getRatio()F

    move-result v13

    invoke-virtual {v12, v4, v13}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->shrinkToAspect(Landroid/graphics/Rect;F)V

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v12

    invoke-virtual/range {v25 .. v25}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getRatio()F

    move-result v13

    invoke-virtual {v12, v10, v13}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->growToAspect(Landroid/graphics/Rect;F)V

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v12

    invoke-virtual {v12, v10}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setStartPosition(Landroid/graphics/Rect;)V

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v12

    invoke-virtual {v12, v4}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setEndPosition(Landroid/graphics/Rect;)V

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v12

    invoke-virtual {v12, v2}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setFacePosition(Landroid/graphics/Rect;)V

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v12

    invoke-virtual {v12, v10}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getStartPositionRaw(Landroid/graphics/Rect;)V

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v12

    invoke-virtual {v12, v4}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getEndPositionRaw(Landroid/graphics/Rect;)V

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v12

    invoke-virtual {v12, v2}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getFacePositionRaw(Landroid/graphics/Rect;)V

    :goto_2
    const/4 v12, 0x0

    const/4 v13, 0x1

    goto :goto_3

    :cond_9
    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v12

    invoke-virtual/range {v25 .. v25}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getRatio()F

    move-result v13

    invoke-virtual {v12, v4, v13}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->shrinkToAspect(Landroid/graphics/Rect;F)V

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v12

    invoke-virtual/range {v25 .. v25}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getRatio()F

    move-result v13

    invoke-virtual {v12, v10, v13}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->shrinkToAspect(Landroid/graphics/Rect;F)V

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v12

    invoke-virtual {v12, v4}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setStartPosition(Landroid/graphics/Rect;)V

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v12

    invoke-virtual {v12, v10}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setEndPosition(Landroid/graphics/Rect;)V

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v12

    invoke-virtual {v12, v2}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setFacePosition(Landroid/graphics/Rect;)V

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v12

    invoke-virtual {v12, v4}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getStartPositionRaw(Landroid/graphics/Rect;)V

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v12

    invoke-virtual {v12, v10}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getEndPositionRaw(Landroid/graphics/Rect;)V

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v12

    invoke-virtual {v12, v2}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getFacePositionRaw(Landroid/graphics/Rect;)V

    goto :goto_2

    :goto_3
    invoke-virtual {v2, v12, v12, v13, v13}, Landroid/graphics/Rect;->set(IIII)V

    const-string v12, "nexEngine"

    const-string v14, "Face Detection false  "

    invoke-static {v12, v14}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    move-object/from16 v12, v25

    :goto_4
    invoke-virtual {v12, v4}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setStartRect(Landroid/graphics/Rect;)V

    invoke-virtual {v12, v10}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setEndRect(Landroid/graphics/Rect;)V

    invoke-virtual {v12, v2}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setFaceRect(Landroid/graphics/Rect;)V

    invoke-virtual {v0, v12}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->updateDrawInfo(Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;)V

    move-object/from16 v4, v26

    move-object/from16 v1, p1

    goto :goto_6

    :cond_a
    :goto_5
    move-object/from16 v26, v4

    move-object v12, v14

    const/4 v1, 0x2

    const/4 v13, 0x1

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v2

    invoke-virtual {v2, v8}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getStartPositionRaw(Landroid/graphics/Rect;)V

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v2

    invoke-virtual {v2, v11}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getEndPositionRaw(Landroid/graphics/Rect;)V

    invoke-virtual {v12, v8}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setStartRect(Landroid/graphics/Rect;)V

    invoke-virtual {v12, v11}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setEndRect(Landroid/graphics/Rect;)V

    invoke-virtual {v12, v11}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setFaceRect(Landroid/graphics/Rect;)V

    invoke-virtual {v0, v12}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->updateDrawInfo(Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;)V

    move-object/from16 v1, p1

    const/4 v2, 0x0

    const/4 v4, 0x2

    invoke-virtual {v1, v2, v11}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setFaceDetectProcessed(ZLandroid/graphics/Rect;)V

    move-object/from16 v4, v26

    :goto_6
    move-object/from16 v2, p3

    const/4 v15, 0x2

    goto/16 :goto_1

    :cond_b
    move-object/from16 v26, v4

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v2

    move-object/from16 v10, v26

    invoke-virtual {v2, v10}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setFacePosition(Landroid/graphics/Rect;)V

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v2

    invoke-virtual {v2, v10}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getFacePositionRaw(Landroid/graphics/Rect;)V

    goto/16 :goto_a

    :cond_c
    :goto_7
    move-object v10, v4

    const/4 v2, 0x0

    const/4 v4, 0x2

    new-instance v15, Landroid/graphics/Rect;

    invoke-direct {v15, v10}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    new-instance v14, Landroid/graphics/Rect;

    invoke-direct {v14, v8}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    new-instance v13, Landroid/graphics/Rect;

    invoke-direct {v13, v11}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    invoke-virtual/range {p3 .. p3}, Landroid/graphics/RectF;->isEmpty()Z

    move-result v12

    if-nez v12, :cond_12

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v12

    invoke-virtual {v12}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getEndPosionLock()Z

    move-result v12

    if-eqz v12, :cond_d

    goto/16 :goto_b

    :cond_d
    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v2

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexApplicationConfig;->getAspectRatio()F

    move-result v8

    invoke-virtual {v2, v14, v8}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->growToAspect(Landroid/graphics/Rect;F)V

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v12

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getProjectDuration()I

    move-result v18

    move-object v2, v13

    move-object v8, v14

    move-object v11, v15

    move v15, v5

    move/from16 v16, v6

    move/from16 v17, v7

    invoke-virtual/range {v12 .. v18}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->applyCropSpeed(Landroid/graphics/Rect;Landroid/graphics/Rect;IIII)V

    if-eqz v9, :cond_10

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v3

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexApplicationConfig;->getAspectRatio()F

    move-result v4

    invoke-virtual {v3, v8, v4}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->shrinkToAspect(Landroid/graphics/Rect;F)V

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v3

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexApplicationConfig;->getAspectRatio()F

    move-result v4

    invoke-virtual {v3, v2, v4}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->shrinkToAspect(Landroid/graphics/Rect;F)V

    const-string v3, "nexEngine"

    const-string v4, "Face Detection true"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget v3, v11, Landroid/graphics/Rect;->top:I

    iget v4, v2, Landroid/graphics/Rect;->top:I

    if-ge v3, v4, :cond_e

    iget v3, v2, Landroid/graphics/Rect;->top:I

    iget v4, v11, Landroid/graphics/Rect;->top:I

    sub-int/2addr v3, v4

    iget v4, v2, Landroid/graphics/Rect;->top:I

    sub-int/2addr v4, v3

    iput v4, v2, Landroid/graphics/Rect;->top:I

    iget v4, v2, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v4, v3

    iput v4, v2, Landroid/graphics/Rect;->bottom:I

    :cond_e
    iget-boolean v3, v0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->bLetterBox:Z

    if-eqz v3, :cond_f

    iget v3, v8, Landroid/graphics/Rect;->right:I

    iget v4, v8, Landroid/graphics/Rect;->left:I

    sub-int/2addr v3, v4

    iget v4, v8, Landroid/graphics/Rect;->left:I

    div-int/lit8 v3, v3, 0x4

    sub-int/2addr v4, v3

    iput v4, v8, Landroid/graphics/Rect;->left:I

    iget v4, v8, Landroid/graphics/Rect;->right:I

    add-int/2addr v4, v3

    iput v4, v8, Landroid/graphics/Rect;->right:I

    iget v3, v8, Landroid/graphics/Rect;->bottom:I

    iget v4, v8, Landroid/graphics/Rect;->top:I

    sub-int/2addr v3, v4

    iget v4, v8, Landroid/graphics/Rect;->top:I

    div-int/lit8 v3, v3, 0x4

    sub-int/2addr v4, v3

    iput v4, v8, Landroid/graphics/Rect;->top:I

    iget v4, v8, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v4, v3

    iput v4, v8, Landroid/graphics/Rect;->bottom:I

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v3

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexApplicationConfig;->getAspectRatio()F

    move-result v4

    invoke-virtual {v3, v8, v4}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->growToAspect(Landroid/graphics/Rect;F)V

    :cond_f
    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setStartPosition(Landroid/graphics/Rect;)V

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v3

    invoke-virtual {v3, v8}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setEndPosition(Landroid/graphics/Rect;)V

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v3

    invoke-virtual {v3, v11}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setFacePosition(Landroid/graphics/Rect;)V

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getStartPositionRaw(Landroid/graphics/Rect;)V

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v3

    invoke-virtual {v3, v8}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getEndPositionRaw(Landroid/graphics/Rect;)V

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v3

    invoke-virtual {v3, v11}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getFacePositionRaw(Landroid/graphics/Rect;)V

    goto/16 :goto_9

    :cond_10
    if-ne v3, v4, :cond_11

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v3

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexApplicationConfig;->getAspectRatio()F

    move-result v4

    invoke-virtual {v3, v8, v4}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->shrinkToAspect(Landroid/graphics/Rect;F)V

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v3

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexApplicationConfig;->getAspectRatio()F

    move-result v4

    invoke-virtual {v3, v2, v4}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->growToAspect(Landroid/graphics/Rect;F)V

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setStartPosition(Landroid/graphics/Rect;)V

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v3

    invoke-virtual {v3, v8}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setEndPosition(Landroid/graphics/Rect;)V

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v3

    invoke-virtual {v3, v11}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setFacePosition(Landroid/graphics/Rect;)V

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getStartPositionRaw(Landroid/graphics/Rect;)V

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v3

    invoke-virtual {v3, v8}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getEndPositionRaw(Landroid/graphics/Rect;)V

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v3

    invoke-virtual {v3, v11}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getFacePositionRaw(Landroid/graphics/Rect;)V

    goto :goto_8

    :cond_11
    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v3

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexApplicationConfig;->getAspectRatio()F

    move-result v4

    invoke-virtual {v3, v8, v4}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->shrinkToAspect(Landroid/graphics/Rect;F)V

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v3

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexApplicationConfig;->getAspectRatio()F

    move-result v4

    invoke-virtual {v3, v2, v4}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->shrinkToAspect(Landroid/graphics/Rect;F)V

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v3

    invoke-virtual {v3, v8}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setStartPosition(Landroid/graphics/Rect;)V

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setEndPosition(Landroid/graphics/Rect;)V

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v3

    invoke-virtual {v3, v11}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setFacePosition(Landroid/graphics/Rect;)V

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v3

    invoke-virtual {v3, v8}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getStartPositionRaw(Landroid/graphics/Rect;)V

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getEndPositionRaw(Landroid/graphics/Rect;)V

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v3

    invoke-virtual {v3, v11}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getFacePositionRaw(Landroid/graphics/Rect;)V

    :goto_8
    const-string v3, "nexEngine"

    const-string v4, "Face Detection false  "

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :goto_9
    iget-object v3, v0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    move-object/from16 v19, v3

    move/from16 v20, p2

    move/from16 v21, v9

    move-object/from16 v22, v2

    move-object/from16 v23, v8

    move-object/from16 v24, v11

    invoke-virtual/range {v19 .. v24}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(IILandroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Rect;)I

    :goto_a
    invoke-virtual {v1, v9, v10}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setFaceDetectProcessed(ZLandroid/graphics/Rect;)V

    return-void

    :cond_12
    :goto_b
    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v3

    invoke-virtual {v3, v8}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getStartPositionRaw(Landroid/graphics/Rect;)V

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v3

    invoke-virtual {v3, v11}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getEndPositionRaw(Landroid/graphics/Rect;)V

    iget-object v5, v0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->isFaceDetected()Z

    move-result v7

    move/from16 v6, p2

    move-object v9, v11

    move-object v10, v11

    invoke-virtual/range {v5 .. v10}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(IILandroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Rect;)I

    invoke-virtual {v1, v2, v11}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setFaceDetectProcessed(ZLandroid/graphics/Rect;)V

    return-void
.end method


# virtual methods
.method public KineMixExport(Ljava/lang/String;)Z
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 p1, 0x0

    return p1
.end method

.method public addUdta(ILjava/lang/String;)I
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v0, p1, p2}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->addUDTA(ILjava/lang/String;)I

    move-result p1

    return p1
.end method

.method public autoTrim(Ljava/lang/String;IILcom/nexstreaming/nexeditorsdk/nexEngine$OnAutoTrimRatioResultListener;)I
    .locals 10

    if-eqz p4, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    new-instance v1, Lcom/nexstreaming/nexeditorsdk/nexEngine$8;

    invoke-direct {v1, p0, p4}, Lcom/nexstreaming/nexeditorsdk/nexEngine$8;-><init>(Lcom/nexstreaming/nexeditorsdk/nexEngine;Lcom/nexstreaming/nexeditorsdk/nexEngine$OnAutoTrimRatioResultListener;)V

    invoke-virtual {v0, v1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$s;)V

    :cond_0
    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    const/4 v4, 0x1

    const/4 v6, 0x1

    const/4 v7, 0x0

    const/4 v9, 0x1

    move-object v3, p1

    move v5, p2

    move v8, p3

    invoke-virtual/range {v2 .. v9}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(Ljava/lang/String;IIIIII)I

    const/4 p1, 0x0

    return p1
.end method

.method public autoTrim(Ljava/lang/String;ZIIILcom/nexstreaming/nexeditorsdk/nexEngine$OnAutoTrimResultListener;)I
    .locals 12

    move-object v0, p0

    move-object/from16 v1, p6

    if-eqz v1, :cond_0

    iget-object v2, v0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    new-instance v3, Lcom/nexstreaming/nexeditorsdk/nexEngine$7;

    invoke-direct {v3, p0, v1}, Lcom/nexstreaming/nexeditorsdk/nexEngine$7;-><init>(Lcom/nexstreaming/nexeditorsdk/nexEngine;Lcom/nexstreaming/nexeditorsdk/nexEngine$OnAutoTrimResultListener;)V

    invoke-virtual {v2, v3}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$l;)V

    :cond_0
    iget-object v4, v0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    const/4 v10, 0x0

    const/4 v11, 0x0

    move-object v5, p1

    move v6, p2

    move v7, p3

    move/from16 v8, p4

    move/from16 v9, p5

    invoke-virtual/range {v4 .. v11}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(Ljava/lang/String;IIIIII)I

    const/4 v1, 0x0

    return v1
.end method

.method public autoTrimStop()I
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->z()I

    move-result v0

    return v0
.end method

.method public buildOverlayPreview(I)Lcom/nexstreaming/nexeditorsdk/nexEngine$OverlayPreviewBuilder;
    .locals 2

    new-instance v0, Lcom/nexstreaming/nexeditorsdk/nexEngine$OverlayPreviewBuilder;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lcom/nexstreaming/nexeditorsdk/nexEngine$OverlayPreviewBuilder;-><init>(Lcom/nexstreaming/nexeditorsdk/nexEngine;ILcom/nexstreaming/nexeditorsdk/nexEngine$1;)V

    return-object v0
.end method

.method public cancelKineMixExport()V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    return-void
.end method

.method public captureCurrentFrame(Lcom/nexstreaming/nexeditorsdk/nexEngine$OnCaptureListener;)Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;
    .locals 3

    if-nez p1, :cond_0

    sget-object p1, Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;->ARGUMENT_FAILED:Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;

    return-object p1

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->x()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->lastSeekTime:I

    new-instance v2, Lcom/nexstreaming/nexeditorsdk/nexEngine$9;

    invoke-direct {v2, p0, p1}, Lcom/nexstreaming/nexeditorsdk/nexEngine$9;-><init>(Lcom/nexstreaming/nexeditorsdk/nexEngine;Lcom/nexstreaming/nexeditorsdk/nexEngine$OnCaptureListener;)V

    invoke-virtual {v0, v1, v2}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(ILcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$e;)Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    move-result-object p1

    invoke-virtual {p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->getValue()I

    move-result p1

    invoke-static {p1}, Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;->fromValue(I)Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;

    move-result-object p1

    return-object p1

    :cond_1
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    new-instance v1, Lcom/nexstreaming/nexeditorsdk/nexEngine$10;

    invoke-direct {v1, p0, p1}, Lcom/nexstreaming/nexeditorsdk/nexEngine$10;-><init>(Lcom/nexstreaming/nexeditorsdk/nexEngine;Lcom/nexstreaming/nexeditorsdk/nexEngine$OnCaptureListener;)V

    invoke-virtual {v0, v1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$e;)Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    move-result-object p1

    invoke-virtual {p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->getValue()I

    move-result p1

    invoke-static {p1}, Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;->fromValue(I)Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;

    move-result-object p1

    return-object p1
.end method

.method public checkDirectExport()I
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->checkDirectExport(I)I

    move-result v0

    return v0
.end method

.method public checkDirectExport(I)I
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getOverlayItems()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    const/16 p1, 0x8

    return p1

    :cond_0
    invoke-direct {p0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->setEditorListener()V

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->lastCheckDirectExportOption:I

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v0, p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->checkDirectExport(I)I

    move-result p1

    return p1
.end method

.method public checkKineMixExport(Z)I
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 p1, 0x2

    return p1
.end method

.method public checkKineMixExport()Z
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 v0, 0x0

    return v0
.end method

.method public checkKineMixExport(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 p1, 0x0

    return p1
.end method

.method public checkPFrameDirectExportSync(Ljava/lang/String;)Z
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v0, p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->checkPFrameDirectExportSync(Ljava/lang/String;)I

    move-result p1

    if-nez p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public clearFaceDetectInfo()V
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexProject;->clearFaceDetectInfo()V

    :cond_0
    return-void
.end method

.method public clearOverlayCache()V
    .locals 1

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexEngine$OverlayCommand;->clear:Lcom/nexstreaming/nexeditorsdk/nexEngine$OverlayCommand;

    invoke-direct {p0, v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->setOverlays(Lcom/nexstreaming/nexeditorsdk/nexEngine$OverlayCommand;)V

    return-void
.end method

.method public clearProject()V
    .locals 1

    invoke-direct {p0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->clearList()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    return-void
.end method

.method public clearScreen()I
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->r()I

    const/4 v0, 0x0

    return v0

    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method public clearTrackCache()V
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->clearTrackCache()I

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexEngine$OverlayCommand;->clear:Lcom/nexstreaming/nexeditorsdk/nexEngine$OverlayCommand;

    invoke-direct {p0, v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->setOverlays(Lcom/nexstreaming/nexeditorsdk/nexEngine$OverlayCommand;)V

    :cond_0
    return-void
.end method

.method public clearUdta()I
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->clearUDTA()I

    move-result v0

    return v0
.end method

.method public directExport(Ljava/lang/String;JJ)Z
    .locals 7

    iget v6, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->lastCheckDirectExportOption:I

    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    move-wide v4, p4

    invoke-virtual/range {v0 .. v6}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->directExport(Ljava/lang/String;JJI)Z

    move-result p1

    return p1
.end method

.method public directExport(Ljava/lang/String;JJI)Z
    .locals 9

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->isSetProject(Z)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    const/4 v1, 0x2

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mState:I

    if-nez p1, :cond_0

    return v2

    :cond_0
    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalTime()I

    move-result v1

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mExportTotalTime:I

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mExportFilePath:Ljava/lang/String;

    iput-wide p2, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mEncodeMaxFileSize:J

    invoke-direct {p0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->setEditorListener()V

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    sget p2, Lcom/nexstreaming/nexeditorsdk/nexEngine;->sExportVideoTrackUUIDMode:I

    const/4 p3, 0x0

    invoke-virtual {p1, p2, p3}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(I[B)V

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mExportFilePath:Ljava/lang/String;

    iget-wide v3, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mEncodeMaxFileSize:J

    const-string p1, "up"

    invoke-static {p1}, Lcom/nexstreaming/kminternal/kinemaster/config/EditorGlobal;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    move-wide v5, p4

    move v8, p6

    invoke-virtual/range {v1 .. v8}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->directExport(Ljava/lang/String;JJLjava/lang/String;I)I

    return v0

    :cond_1
    return v2
.end method

.method public export(Ljava/lang/String;IIIJI)I
    .locals 13

    const v8, 0xac44

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/16 v11, 0xbb8

    const v12, 0x10010300

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move/from16 v3, p3

    move/from16 v4, p4

    move-wide/from16 v5, p5

    move/from16 v7, p7

    invoke-virtual/range {v0 .. v12}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->export(Ljava/lang/String;IIIJIIIIII)I

    move-result v0

    return v0
.end method

.method public export(Ljava/lang/String;IIIJII)I
    .locals 13

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/16 v11, 0xbb8

    const v12, 0x10010300

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move/from16 v3, p3

    move/from16 v4, p4

    move-wide/from16 v5, p5

    move/from16 v7, p7

    move/from16 v8, p8

    invoke-virtual/range {v0 .. v12}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->export(Ljava/lang/String;IIIJIIIIII)I

    move-result v0

    return v0
.end method

.method public export(Ljava/lang/String;IIIJIII)I
    .locals 13

    const/4 v9, 0x0

    const/4 v10, 0x0

    const v12, 0x10010300

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move/from16 v3, p3

    move/from16 v4, p4

    move-wide/from16 v5, p5

    move/from16 v7, p7

    move/from16 v8, p8

    move/from16 v11, p9

    invoke-virtual/range {v0 .. v12}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->export(Ljava/lang/String;IIIJIIIIII)I

    move-result v0

    return v0
.end method

.method public export(Ljava/lang/String;IIIJIIIIII)I
    .locals 11

    move-object v8, p0

    iget v0, v8, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mState:I

    const/4 v1, -0x1

    const/4 v2, 0x2

    if-ne v0, v2, :cond_0

    const-string v0, "nexEngine"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v8, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mId:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, "]already export state"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return v1

    :cond_0
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->isSetProject(Z)Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->stopAsyncFaceDetect()V

    sget-object v1, Lcom/nexstreaming/nexeditorsdk/nexEngine$OverlayCommand;->upload:Lcom/nexstreaming/nexeditorsdk/nexEngine$OverlayCommand;

    invoke-direct {p0, v1}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->setOverlays(Lcom/nexstreaming/nexeditorsdk/nexEngine$OverlayCommand;)V

    sget-boolean v1, Lcom/nexstreaming/nexeditorsdk/nexEngine;->sLoadListAsync:Z

    invoke-direct {p0, v1, v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->resolveProject(ZZ)I

    iget-boolean v0, v8, Lcom/nexstreaming/nexeditorsdk/nexEngine;->facedetect_asyncmode:Z

    iget v1, v8, Lcom/nexstreaming/nexeditorsdk/nexEngine;->facedetect_syncclip_count:I

    iget v3, v8, Lcom/nexstreaming/nexeditorsdk/nexEngine;->facedetect_undetected_clip_cropping_mode:I

    invoke-virtual {p0, v0, v1, v3}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->faceDetect_internal(ZII)I

    iput v2, v8, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mState:I

    invoke-virtual {p0, v2}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->setThumbnailRoutine(I)V

    iget-object v0, v8, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalTime()I

    move-result v0

    iput v0, v8, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mExportTotalTime:I

    move-object v0, p1

    iput-object v0, v8, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mExportFilePath:Ljava/lang/String;

    move v0, p2

    iput v0, v8, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mEncodeWidth:I

    move v0, p3

    iput v0, v8, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mEncodeHeight:I

    move v0, p4

    iput v0, v8, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mEncodeBitrate:I

    move-wide/from16 v0, p5

    iput-wide v0, v8, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mEncodeMaxFileSize:J

    iget-object v0, v8, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    iget-object v1, v8, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mAppContext:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(Landroid/content/Context;)Lcom/nexstreaming/app/common/task/Task;

    move-result-object v9

    new-instance v10, Lcom/nexstreaming/nexeditorsdk/nexEngine$18;

    move-object v0, v10

    move-object v1, p0

    move/from16 v2, p7

    move/from16 v3, p8

    move/from16 v4, p9

    move/from16 v5, p10

    move/from16 v6, p11

    move/from16 v7, p12

    invoke-direct/range {v0 .. v7}, Lcom/nexstreaming/nexeditorsdk/nexEngine$18;-><init>(Lcom/nexstreaming/nexeditorsdk/nexEngine;IIIIII)V

    invoke-virtual {v9, v10}, Lcom/nexstreaming/app/common/task/Task;->onComplete(Lcom/nexstreaming/app/common/task/Task$OnTaskEventListener;)Lcom/nexstreaming/app/common/task/Task;

    const/4 v0, 0x0

    return v0

    :cond_1
    return v1
.end method

.method public export(Lcom/nexstreaming/nexeditorsdk/nexExportFormat;Lcom/nexstreaming/nexeditorsdk/nexExportListener;)Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;
    .locals 15

    move-object v13, p0

    move-object/from16 v0, p1

    move-object/from16 v14, p2

    const-string v1, "type"

    invoke-virtual {v0, v1}, Lcom/nexstreaming/nexeditorsdk/nexExportFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_0

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;->ARGUMENT_FAILED:Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;

    return-object v0

    :cond_0
    const-string v2, "external-"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_6

    iget v2, v13, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mState:I

    const/4 v4, 0x2

    if-ne v2, v4, :cond_1

    const-string v0, "nexEngine"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, v13, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mId:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "]already external export state"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;->INVALID_STATE:Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;

    return-object v0

    :cond_1
    iget-object v2, v0, Lcom/nexstreaming/nexeditorsdk/nexExportFormat;->formats:Ljava/util/Map;

    const-string v5, "width"

    invoke-interface {v2, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    iget-object v2, v0, Lcom/nexstreaming/nexeditorsdk/nexExportFormat;->formats:Ljava/util/Map;

    const-string v5, "height"

    invoke-interface {v2, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    iget-object v2, v0, Lcom/nexstreaming/nexeditorsdk/nexExportFormat;->formats:Ljava/util/Map;

    const-string v5, "intervaltime"

    invoke-interface {v2, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    iget-object v2, v0, Lcom/nexstreaming/nexeditorsdk/nexExportFormat;->formats:Ljava/util/Map;

    const-string v5, "starttime"

    invoke-interface {v2, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v9

    iget-object v2, v0, Lcom/nexstreaming/nexeditorsdk/nexExportFormat;->formats:Ljava/util/Map;

    const-string v5, "endtime"

    invoke-interface {v2, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    iget-object v5, v13, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    invoke-virtual {v5}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalTime()I

    move-result v5

    if-le v2, v5, :cond_2

    iget-object v2, v13, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalTime()I

    move-result v2

    :cond_2
    move v10, v2

    if-le v9, v10, :cond_3

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;->ARGUMENT_FAILED:Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;

    return-object v0

    :cond_3
    iget-object v2, v0, Lcom/nexstreaming/nexeditorsdk/nexExportFormat;->formats:Ljava/util/Map;

    const-string v5, "uuid"

    invoke-interface {v2, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    const/16 v5, 0x9

    invoke-virtual {v1, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v0, v5, v2, v14}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->getExternalExport(Lcom/nexstreaming/nexeditorsdk/nexExportFormat;Ljava/lang/String;Ljava/lang/String;Lcom/nexstreaming/nexeditorsdk/nexExportListener;)Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$v;

    move-result-object v2

    if-nez v2, :cond_4

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;->DIRECTEXPORT_ENC_ENCODE_ERROR:Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;

    return-object v0

    :cond_4
    const/4 v5, 0x1

    iput-boolean v5, v13, Lcom/nexstreaming/nexeditorsdk/nexEngine;->externalImageExportProcessing:Z

    sget-object v12, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->NONE:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    iget-object v5, v13, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    move-object v11, v2

    invoke-virtual/range {v5 .. v11}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(IIIIILcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$v;)Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    move-result-object v5

    if-ne v12, v5, :cond_5

    iput v4, v13, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mState:I

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;->NONE:Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;

    return-object v0

    :cond_5
    iput-boolean v3, v13, Lcom/nexstreaming/nexeditorsdk/nexEngine;->externalImageExportProcessing:Z

    invoke-virtual {v2}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$v;->a()V

    const/4 v4, -0x1

    invoke-virtual {v2, v4}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$v;->a(I)Z

    if-eqz v14, :cond_6

    sget-object v2, Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;->INVALID_STATE:Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;

    invoke-interface {v14, v2}, Lcom/nexstreaming/nexeditorsdk/nexExportListener;->onExportFail(Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;)V

    :cond_6
    const-string v2, "bitmap"

    invoke-virtual {v1, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_8

    iget-object v1, v0, Lcom/nexstreaming/nexeditorsdk/nexExportFormat;->formats:Ljava/util/Map;

    const-string v2, "width"

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    iget-object v2, v0, Lcom/nexstreaming/nexeditorsdk/nexExportFormat;->formats:Ljava/util/Map;

    const-string v3, "height"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    iget-object v0, v0, Lcom/nexstreaming/nexeditorsdk/nexExportFormat;->formats:Ljava/util/Map;

    const-string v3, "tag"

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    if-nez v14, :cond_7

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;->ARGUMENT_FAILED:Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;

    return-object v0

    :cond_7
    iget-object v3, v13, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    new-instance v4, Lcom/nexstreaming/nexeditorsdk/nexEngine$20;

    invoke-direct {v4, p0, v14}, Lcom/nexstreaming/nexeditorsdk/nexEngine$20;-><init>(Lcom/nexstreaming/nexeditorsdk/nexEngine;Lcom/nexstreaming/nexeditorsdk/nexExportListener;)V

    invoke-virtual {v3, v1, v2, v0, v4}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(IIILcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$e;)Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->getValue()I

    move-result v0

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;->fromValue(I)Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;

    move-result-object v0

    return-object v0

    :cond_8
    const-string v2, "jpeg"

    invoke-virtual {v1, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_b

    iget-object v1, v0, Lcom/nexstreaming/nexeditorsdk/nexExportFormat;->formats:Ljava/util/Map;

    const-string v2, "path"

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iget-object v2, v0, Lcom/nexstreaming/nexeditorsdk/nexExportFormat;->formats:Ljava/util/Map;

    const-string v4, "width"

    invoke-interface {v2, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    iget-object v4, v0, Lcom/nexstreaming/nexeditorsdk/nexExportFormat;->formats:Ljava/util/Map;

    const-string v5, "height"

    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    iget-object v0, v0, Lcom/nexstreaming/nexeditorsdk/nexExportFormat;->formats:Ljava/util/Map;

    const-string v5, "quality"

    invoke-interface {v0, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    if-eqz v1, :cond_a

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_a

    if-lez v2, :cond_a

    if-lez v4, :cond_a

    if-lez v0, :cond_a

    const/16 v5, 0x64

    if-le v0, v5, :cond_9

    goto :goto_0

    :cond_9
    iget-object v5, v13, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    new-instance v6, Lcom/nexstreaming/nexeditorsdk/nexEngine$2;

    invoke-direct {v6, p0, v1, v0, v14}, Lcom/nexstreaming/nexeditorsdk/nexEngine$2;-><init>(Lcom/nexstreaming/nexeditorsdk/nexEngine;Ljava/lang/String;ILcom/nexstreaming/nexeditorsdk/nexExportListener;)V

    invoke-virtual {v5, v2, v4, v3, v6}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(IIILcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$e;)Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->getValue()I

    move-result v0

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;->fromValue(I)Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;

    move-result-object v0

    return-object v0

    :cond_a
    :goto_0
    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;->ARGUMENT_FAILED:Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;

    return-object v0

    :cond_b
    const-string v2, "mp4"

    invoke-virtual {v1, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v1

    if-nez v1, :cond_d

    :try_start_0
    iget-object v1, v0, Lcom/nexstreaming/nexeditorsdk/nexExportFormat;->formats:Ljava/util/Map;

    const-string v2, "path"

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iget-object v2, v0, Lcom/nexstreaming/nexeditorsdk/nexExportFormat;->formats:Ljava/util/Map;

    const-string v3, "width"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    iget-object v3, v0, Lcom/nexstreaming/nexeditorsdk/nexExportFormat;->formats:Ljava/util/Map;

    const-string v4, "height"

    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    iget-object v4, v0, Lcom/nexstreaming/nexeditorsdk/nexExportFormat;->formats:Ljava/util/Map;

    const-string v5, "videocodec"

    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v12

    iget-object v4, v0, Lcom/nexstreaming/nexeditorsdk/nexExportFormat;->formats:Ljava/util/Map;

    const-string v5, "videobitrate"

    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    iget-object v5, v0, Lcom/nexstreaming/nexeditorsdk/nexExportFormat;->formats:Ljava/util/Map;

    const-string v6, "videoprofile"

    invoke-interface {v5, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v9

    iget-object v5, v0, Lcom/nexstreaming/nexeditorsdk/nexExportFormat;->formats:Ljava/util/Map;

    const-string v6, "videolevel"

    invoke-interface {v5, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v10

    iget-object v5, v0, Lcom/nexstreaming/nexeditorsdk/nexExportFormat;->formats:Ljava/util/Map;

    const-string v6, "videorotate"

    invoke-interface {v5, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    iget-object v5, v0, Lcom/nexstreaming/nexeditorsdk/nexExportFormat;->formats:Ljava/util/Map;

    const-string v6, "videofps"

    invoke-interface {v5, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v11

    iget-object v5, v0, Lcom/nexstreaming/nexeditorsdk/nexExportFormat;->formats:Ljava/util/Map;

    const-string v6, "audiosamplerate"

    invoke-interface {v5, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    iget-object v0, v0, Lcom/nexstreaming/nexeditorsdk/nexExportFormat;->formats:Ljava/util/Map;

    const-string v5, "maxfilesize"

    invoke-interface {v0, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v5
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-object v0, p0

    :try_start_1
    invoke-virtual/range {v0 .. v12}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->export(Ljava/lang/String;IIIJIIIIII)I

    move-result v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    if-nez v0, :cond_c

    iget-object v0, v13, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    new-instance v1, Lcom/nexstreaming/nexeditorsdk/nexEngine$3;

    invoke-direct {v1, p0, v14}, Lcom/nexstreaming/nexeditorsdk/nexEngine$3;-><init>(Lcom/nexstreaming/nexeditorsdk/nexEngine;Lcom/nexstreaming/nexeditorsdk/nexExportListener;)V

    invoke-virtual {v0, v1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$i;)V

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;->NONE:Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;

    return-object v0

    :cond_c
    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;->UNKNOWN:Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;

    return-object v0

    :catch_0
    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;->UNKNOWN:Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;

    return-object v0

    :catch_1
    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;->ARGUMENT_FAILED:Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;

    return-object v0

    :cond_d
    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;->UNSUPPORT_FORMAT:Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;

    return-object v0
.end method

.method public exportJpeg(Ljava/lang/String;IIILcom/nexstreaming/nexeditorsdk/nexEngine$OnCaptureListener;)Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;
    .locals 1

    if-nez p5, :cond_0

    sget-object p1, Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;->ARGUMENT_FAILED:Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;

    return-object p1

    :cond_0
    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    const/4 p4, 0x0

    new-instance v0, Lcom/nexstreaming/nexeditorsdk/nexEngine$19;

    invoke-direct {v0, p0, p5}, Lcom/nexstreaming/nexeditorsdk/nexEngine$19;-><init>(Lcom/nexstreaming/nexeditorsdk/nexEngine;Lcom/nexstreaming/nexeditorsdk/nexEngine$OnCaptureListener;)V

    invoke-virtual {p1, p2, p3, p4, v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(IIILcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$e;)Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    move-result-object p1

    invoke-virtual {p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->getValue()I

    move-result p1

    invoke-static {p1}, Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;->fromValue(I)Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;

    move-result-object p1

    return-object p1
.end method

.method public exportNoException(Ljava/lang/String;IIIJIIIII)I
    .locals 13

    const v12, 0x10010300

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move/from16 v3, p3

    move/from16 v4, p4

    move-wide/from16 v5, p5

    move/from16 v7, p7

    move/from16 v8, p8

    move/from16 v9, p9

    move/from16 v10, p10

    move/from16 v11, p11

    :try_start_0
    invoke-virtual/range {v0 .. v12}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->export(Ljava/lang/String;IIIJIIIIII)I

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    :catch_0
    const/4 v0, -0x2

    return v0
.end method

.method public exportNoException(Ljava/lang/String;IIIJIIIIII)I
    .locals 0

    :try_start_0
    invoke-virtual/range {p0 .. p12}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->export(Ljava/lang/String;IIIJIIIIII)I

    move-result p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    :catch_0
    const/4 p1, -0x2

    return p1
.end method

.method public exportPause()I
    .locals 1

    iget-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->externalImageExportProcessing:Z

    if-eqz v0, :cond_0

    const/4 v0, -0x1

    return v0

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->encodePause()I

    move-result v0

    return v0
.end method

.method public exportResume()I
    .locals 1

    iget-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->externalImageExportProcessing:Z

    if-eqz v0, :cond_0

    const/4 v0, -0x1

    return v0

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->encodeResume()I

    move-result v0

    return v0
.end method

.method public exportSaveStop(Lcom/nexstreaming/nexeditorsdk/nexEngine$OnCompletionListener;)V
    .locals 3

    iget-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->externalImageExportProcessing:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->isSetProject(Z)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mState:I

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    new-instance v2, Lcom/nexstreaming/nexeditorsdk/nexEngine$14;

    invoke-direct {v2, p0, p1}, Lcom/nexstreaming/nexeditorsdk/nexEngine$14;-><init>(Lcom/nexstreaming/nexeditorsdk/nexEngine;Lcom/nexstreaming/nexeditorsdk/nexEngine$OnCompletionListener;)V

    invoke-virtual {v1, v0, v2}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(ILcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$f;)V

    goto :goto_0

    :cond_1
    const/16 v0, 0x15

    invoke-virtual {p1, v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine$OnCompletionListener;->onComplete(I)V

    :goto_0
    return-void
.end method

.method public faceDetect(ZILcom/nexstreaming/nexeditorsdk/nexEngine$nexUndetectedFaceCrop;)I
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->facedetect_asyncmode:Z

    const/4 p2, 0x0

    iput p2, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->facedetect_syncclip_count:I

    invoke-virtual {p3}, Lcom/nexstreaming/nexeditorsdk/nexEngine$nexUndetectedFaceCrop;->getValue()I

    move-result p3

    iput p3, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->facedetect_undetected_clip_cropping_mode:I

    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/utils/facedetect/a;->a()Lcom/nexstreaming/nexeditorsdk/module/nexFaceDetectionProvider;

    move-result-object p3

    if-eqz p3, :cond_0

    iget p3, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->facedetect_undetected_clip_cropping_mode:I

    if-eqz p3, :cond_0

    return p1

    :cond_0
    return p2
.end method

.method public faceDetect_for_seek(II)I
    .locals 8

    const-string v0, "nexEngine"

    const-string v1, "Face Detection Mode = %d"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Object;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-nez p2, :cond_0

    const/4 p1, -0x1

    return p1

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    invoke-virtual {v0, v2}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalClipCount(Z)I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_3

    iget-object v3, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    invoke-virtual {v3, v1, v2}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getClip(IZ)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v3

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getClipType()I

    move-result v4

    if-ne v4, v2, :cond_2

    iget v4, v3, Lcom/nexstreaming/nexeditorsdk/nexClip;->mStartTime:I

    if-gt v4, p1, :cond_2

    iget v4, v3, Lcom/nexstreaming/nexeditorsdk/nexClip;->mEndTime:I

    if-gt p1, v4, :cond_2

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->isAssetResource()Z

    move-result v4

    if-nez v4, :cond_2

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/nexstreaming/kminternal/kinemaster/utils/facedetect/a;->a(Ljava/lang/String;)Lcom/nexstreaming/kminternal/kinemaster/utils/facedetect/a;

    move-result-object v4

    if-nez v4, :cond_1

    new-instance v4, Lcom/nexstreaming/kminternal/kinemaster/utils/facedetect/a;

    new-instance v6, Ljava/io/File;

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getPath()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->getAppContext()Landroid/content/Context;

    move-result-object v7

    invoke-direct {v4, v6, v2, v7}, Lcom/nexstreaming/kminternal/kinemaster/utils/facedetect/a;-><init>(Ljava/io/File;ZLandroid/content/Context;)V

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getPath()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6, v4}, Lcom/nexstreaming/kminternal/kinemaster/utils/facedetect/a;->a(Ljava/lang/String;Lcom/nexstreaming/kminternal/kinemaster/utils/facedetect/a;)V

    :cond_1
    new-instance v6, Landroid/graphics/RectF;

    invoke-direct {v6}, Landroid/graphics/RectF;-><init>()V

    invoke-virtual {v4, v6}, Lcom/nexstreaming/kminternal/kinemaster/utils/facedetect/a;->a(Landroid/graphics/RectF;)V

    add-int/lit8 v4, v1, 0x1

    invoke-direct {p0, v3, v4, v6, p2}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->updateFaceInfo2Clip(Lcom/nexstreaming/nexeditorsdk/nexClip;ILandroid/graphics/RectF;I)V

    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_3
    return v5
.end method

.method public faceDetect_internal(ZII)I
    .locals 18

    move-object/from16 v0, p0

    move/from16 v1, p3

    const-string v2, "nexEngine"

    const-string v3, "Face Detection Mode = %d"

    const/4 v4, 0x1

    new-array v5, v4, [Ljava/lang/Object;

    invoke-static/range {p3 .. p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const/4 v7, 0x0

    aput-object v6, v5, v7

    invoke-static {v3, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-nez v1, :cond_0

    const/4 v1, -0x1

    return v1

    :cond_0
    iget-object v2, v0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    invoke-virtual {v2, v4}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalClipCount(Z)I

    move-result v2

    const/4 v3, 0x0

    const/4 v5, 0x0

    :goto_0
    if-ge v3, v2, :cond_2

    iget-object v6, v0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    invoke-virtual {v6, v3, v4}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getClip(IZ)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v6

    invoke-virtual {v6}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getClipType()I

    move-result v6

    if-ne v6, v4, :cond_1

    add-int/lit8 v5, v5, 0x1

    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_2
    move/from16 v3, p1

    if-ne v4, v3, :cond_3

    move/from16 v5, p2

    :cond_3
    const/4 v3, 0x0

    :goto_1
    if-ge v3, v2, :cond_5

    const-string v6, "nexEngine"

    const-string v8, "Face Detection ResetInfo clip ID = %d"

    new-array v9, v4, [Ljava/lang/Object;

    add-int/lit8 v10, v3, 0x1

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v9, v7

    invoke-static {v8, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v6, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v6, v0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    invoke-virtual {v6, v3, v4}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getClip(IZ)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v3

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getClipType()I

    move-result v3

    if-ne v3, v4, :cond_4

    iget-object v3, v0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v3, v10}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->b(I)I

    :cond_4
    move v3, v10

    goto :goto_1

    :cond_5
    const/4 v3, 0x0

    const/4 v6, 0x0

    :goto_2
    if-ge v3, v2, :cond_e

    new-instance v8, Landroid/graphics/RectF;

    invoke-direct {v8}, Landroid/graphics/RectF;-><init>()V

    const-string v9, "nexEngine"

    const-string v10, "Face Detection sync clip ID = %d"

    new-array v11, v4, [Ljava/lang/Object;

    add-int/lit8 v15, v3, 0x1

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v11, v7

    invoke-static {v10, v11}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v9, v0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    invoke-virtual {v9, v3, v4}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getClip(IZ)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v9

    invoke-virtual {v9}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getClipType()I

    move-result v10

    if-ne v10, v4, :cond_9

    invoke-virtual {v9}, Lcom/nexstreaming/nexeditorsdk/nexClip;->isFaceDetectProcessed()Z

    move-result v10

    if-nez v10, :cond_9

    invoke-virtual {v9}, Lcom/nexstreaming/nexeditorsdk/nexClip;->isAssetResource()Z

    move-result v10

    if-eqz v10, :cond_6

    goto :goto_3

    :cond_6
    invoke-virtual {v9}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getPath()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lcom/nexstreaming/kminternal/kinemaster/utils/facedetect/a;->a(Ljava/lang/String;)Lcom/nexstreaming/kminternal/kinemaster/utils/facedetect/a;

    move-result-object v10

    const-string v11, "nexEngine"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Face Detection sync total num ="

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v13, " continueClip num= "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-nez v10, :cond_8

    add-int/lit8 v10, v5, -0x1

    if-le v3, v10, :cond_7

    goto/16 :goto_8

    :cond_7
    new-instance v10, Lcom/nexstreaming/kminternal/kinemaster/utils/facedetect/a;

    new-instance v3, Ljava/io/File;

    invoke-virtual {v9}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getPath()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v3, v11}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {p0 .. p0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->getAppContext()Landroid/content/Context;

    move-result-object v11

    invoke-direct {v10, v3, v4, v11}, Lcom/nexstreaming/kminternal/kinemaster/utils/facedetect/a;-><init>(Ljava/io/File;ZLandroid/content/Context;)V

    invoke-virtual {v9}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v10}, Lcom/nexstreaming/kminternal/kinemaster/utils/facedetect/a;->a(Ljava/lang/String;Lcom/nexstreaming/kminternal/kinemaster/utils/facedetect/a;)V

    :cond_8
    invoke-virtual {v10, v8}, Lcom/nexstreaming/kminternal/kinemaster/utils/facedetect/a;->a(Landroid/graphics/RectF;)V

    invoke-direct {v0, v9, v15, v8, v1}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->updateFaceInfo2Clip(Lcom/nexstreaming/nexeditorsdk/nexClip;ILandroid/graphics/RectF;I)V

    add-int/lit8 v6, v6, 0x1

    goto/16 :goto_6

    :cond_9
    :goto_3
    invoke-virtual {v9}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getClipType()I

    move-result v3

    if-ne v3, v4, :cond_d

    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    new-instance v8, Landroid/graphics/Rect;

    invoke-direct {v8}, Landroid/graphics/Rect;-><init>()V

    new-instance v10, Landroid/graphics/Rect;

    invoke-direct {v10}, Landroid/graphics/Rect;-><init>()V

    const-string v11, "nexEngine"

    const-string v12, "Face Detection skip clip ID = %d"

    new-array v13, v4, [Ljava/lang/Object;

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v13, v7

    invoke-static {v12, v13}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v9}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object v11

    if-eqz v11, :cond_c

    invoke-virtual {v9}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object v11

    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v11

    if-lez v11, :cond_c

    invoke-virtual {v9}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object v11

    invoke-interface {v11}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :cond_a
    :goto_4
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_b

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;

    invoke-virtual {v12}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getFaceRect()Landroid/graphics/Rect;

    move-result-object v13

    invoke-virtual {v13}, Landroid/graphics/Rect;->isEmpty()Z

    move-result v13

    if-eqz v13, :cond_a

    invoke-virtual {v9}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v13

    invoke-virtual {v13, v3}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getStartPositionRaw(Landroid/graphics/Rect;)V

    invoke-virtual {v9}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v13

    invoke-virtual {v13, v10}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getEndPositionRaw(Landroid/graphics/Rect;)V

    invoke-virtual {v9}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v13

    invoke-virtual {v13, v8}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getFacePositionRaw(Landroid/graphics/Rect;)V

    invoke-virtual {v12, v3}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setStartRect(Landroid/graphics/Rect;)V

    invoke-virtual {v12, v10}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setEndRect(Landroid/graphics/Rect;)V

    invoke-virtual {v12, v8}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setFaceRect(Landroid/graphics/Rect;)V

    invoke-virtual {v0, v12}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->updateDrawInfo(Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;)V

    const-string v12, "nexEngine"

    const-string v13, "Face Detection info update for draw info(clip ID = %d)"

    new-array v14, v4, [Ljava/lang/Object;

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    aput-object v16, v14, v7

    invoke-static {v13, v14}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_4

    :cond_b
    move v9, v15

    goto :goto_5

    :cond_c
    invoke-virtual {v9}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v11

    invoke-virtual {v11, v3}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getStartPositionRaw(Landroid/graphics/Rect;)V

    invoke-virtual {v9}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v11

    invoke-virtual {v11, v10}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getEndPositionRaw(Landroid/graphics/Rect;)V

    invoke-virtual {v9}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v11

    invoke-virtual {v11, v8}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getFacePositionRaw(Landroid/graphics/Rect;)V

    iget-object v12, v0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v9}, Lcom/nexstreaming/nexeditorsdk/nexClip;->isFaceDetected()Z

    move-result v14

    move v13, v15

    move v9, v15

    move-object v15, v3

    move-object/from16 v16, v10

    move-object/from16 v17, v8

    invoke-virtual/range {v12 .. v17}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(IILandroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Rect;)I

    :goto_5
    add-int/lit8 v6, v6, 0x1

    goto :goto_7

    :cond_d
    :goto_6
    move v9, v15

    :goto_7
    move v3, v9

    goto/16 :goto_2

    :cond_e
    :goto_8
    if-ge v6, v2, :cond_14

    iget-object v3, v0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    invoke-virtual {v3, v6, v4}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getClip(IZ)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v3

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getClipType()I

    move-result v5

    if-ne v5, v4, :cond_10

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->isFaceDetectProcessed()Z

    move-result v5

    if-eq v5, v4, :cond_10

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->isAssetResource()Z

    move-result v5

    if-ne v5, v4, :cond_f

    goto :goto_9

    :cond_f
    const-string v5, "nexEngine"

    const-string v8, "Face Detection async clip ID = %d"

    new-array v9, v4, [Ljava/lang/Object;

    add-int/lit8 v10, v6, 0x1

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v9, v7

    invoke-static {v8, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v5, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v5, Lcom/nexstreaming/nexeditorsdk/nexEngine$11;

    invoke-direct {v5, v0, v6, v3, v1}, Lcom/nexstreaming/nexeditorsdk/nexEngine$11;-><init>(Lcom/nexstreaming/nexeditorsdk/nexEngine;ILcom/nexstreaming/nexeditorsdk/nexClip;I)V

    iget-object v8, v0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->async_facedetect_worker_list_:Ljava/util/ArrayList;

    invoke-virtual {v8, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v8, Landroid/os/AsyncTask;->SERIAL_EXECUTOR:Ljava/util/concurrent/Executor;

    new-array v9, v4, [Ljava/lang/String;

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getPath()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v9, v7

    invoke-virtual {v5, v8, v9}, Landroid/os/AsyncTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto/16 :goto_b

    :cond_10
    :goto_9
    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getClipType()I

    move-result v5

    if-ne v5, v4, :cond_13

    new-instance v11, Landroid/graphics/Rect;

    invoke-direct {v11}, Landroid/graphics/Rect;-><init>()V

    new-instance v12, Landroid/graphics/Rect;

    invoke-direct {v12}, Landroid/graphics/Rect;-><init>()V

    new-instance v13, Landroid/graphics/Rect;

    invoke-direct {v13}, Landroid/graphics/Rect;-><init>()V

    const-string v5, "nexEngine"

    const-string v8, "Face Detection skip clip ID = %d"

    new-array v9, v4, [Ljava/lang/Object;

    add-int/lit8 v10, v6, 0x1

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v9, v7

    invoke-static {v8, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v5, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object v5

    if-eqz v5, :cond_12

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-lez v5, :cond_12

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_11
    :goto_a
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_13

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;

    invoke-virtual {v8}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getFaceRect()Landroid/graphics/Rect;

    move-result-object v9

    invoke-virtual {v9}, Landroid/graphics/Rect;->isEmpty()Z

    move-result v9

    if-eqz v9, :cond_11

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v9

    invoke-virtual {v9, v11}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getStartPositionRaw(Landroid/graphics/Rect;)V

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v9

    invoke-virtual {v9, v12}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getEndPositionRaw(Landroid/graphics/Rect;)V

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v9

    invoke-virtual {v9, v13}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getFacePositionRaw(Landroid/graphics/Rect;)V

    invoke-virtual {v8, v11}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setStartRect(Landroid/graphics/Rect;)V

    invoke-virtual {v8, v12}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setEndRect(Landroid/graphics/Rect;)V

    invoke-virtual {v8, v13}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setFaceRect(Landroid/graphics/Rect;)V

    invoke-virtual {v0, v8}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->updateDrawInfo(Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;)V

    goto :goto_a

    :cond_12
    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v5

    invoke-virtual {v5, v11}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getStartPositionRaw(Landroid/graphics/Rect;)V

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v5

    invoke-virtual {v5, v12}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getEndPositionRaw(Landroid/graphics/Rect;)V

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v5

    invoke-virtual {v5, v13}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getFacePositionRaw(Landroid/graphics/Rect;)V

    iget-object v8, v0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->isFaceDetected()Z

    move-result v3

    move v9, v10

    move v10, v3

    invoke-virtual/range {v8 .. v13}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(IILandroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Rect;)I

    :cond_13
    :goto_b
    add-int/lit8 v6, v6, 0x1

    goto/16 :goto_8

    :cond_14
    return v7
.end method

.method public fastPreview(Lcom/nexstreaming/nexeditorsdk/nexEngine$FastPreviewOption;I)V
    .locals 2

    sget-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$FastPreviewOption;->normal:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$FastPreviewOption;

    sget-object v1, Lcom/nexstreaming/nexeditorsdk/nexEngine$13;->b:[I

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexEngine$FastPreviewOption;->ordinal()I

    move-result p1

    aget p1, v1, p1

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    sget-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$FastPreviewOption;->customlut_power:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$FastPreviewOption;

    goto :goto_0

    :pswitch_1
    sget-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$FastPreviewOption;->customlut_clip:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$FastPreviewOption;

    goto :goto_0

    :pswitch_2
    sget-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$FastPreviewOption;->adj_sharpness:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$FastPreviewOption;

    goto :goto_0

    :pswitch_3
    sget-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$FastPreviewOption;->adj_vignetteRange:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$FastPreviewOption;

    goto :goto_0

    :pswitch_4
    sget-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$FastPreviewOption;->adj_vignette:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$FastPreviewOption;

    goto :goto_0

    :pswitch_5
    sget-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$FastPreviewOption;->cts:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$FastPreviewOption;

    goto :goto_0

    :pswitch_6
    sget-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$FastPreviewOption;->tintColor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$FastPreviewOption;

    goto :goto_0

    :pswitch_7
    sget-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$FastPreviewOption;->adj_saturation:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$FastPreviewOption;

    goto :goto_0

    :pswitch_8
    sget-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$FastPreviewOption;->adj_contrast:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$FastPreviewOption;

    goto :goto_0

    :pswitch_9
    sget-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$FastPreviewOption;->adj_brightness:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$FastPreviewOption;

    goto :goto_0

    :pswitch_a
    sget-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$FastPreviewOption;->saturation:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$FastPreviewOption;

    goto :goto_0

    :pswitch_b
    sget-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$FastPreviewOption;->contrast:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$FastPreviewOption;

    goto :goto_0

    :pswitch_c
    sget-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$FastPreviewOption;->brightness:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$FastPreviewOption;

    goto :goto_0

    :pswitch_d
    sget-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$FastPreviewOption;->normal:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$FastPreviewOption;

    :goto_0
    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {p1, v0, p2}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$FastPreviewOption;I)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public fastPreviewCrop(Landroid/graphics/Rect;)V
    .locals 3

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->q()Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$b;

    move-result-object v0

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$FastPreviewOption;->nofx:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$FastPreviewOption;

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$b;->a(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$FastPreviewOption;I)Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$b;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$b;->a(Landroid/graphics/Rect;)Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$b;

    move-result-object p1

    invoke-interface {p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$b;->a()V

    return-void
.end method

.method public fastPreviewCustomlut(I)V
    .locals 2

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mCurrentPlayTime:I

    invoke-virtual {v0, v1}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getClipPosition(I)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0, p1}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->fastPreviewCustomlut(II)V

    return-void
.end method

.method public fastPreviewCustomlut(II)V
    .locals 2

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->q()Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$b;

    move-result-object v0

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$FastPreviewOption;->customlut_clip:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$FastPreviewOption;

    invoke-interface {v0, v1, p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$b;->a(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$FastPreviewOption;I)Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$b;

    move-result-object p1

    sget-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$FastPreviewOption;->customlut_power:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$FastPreviewOption;

    invoke-interface {p1, v0, p2}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$b;->a(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$FastPreviewOption;I)Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$b;

    move-result-object p1

    invoke-interface {p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$b;->a()V

    return-void
.end method

.method public fastPreviewEffect(IZ)V
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->q()Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$b;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$b;->a(I)Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$b;

    move-result-object p1

    invoke-interface {p1, p2}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$b;->a(Z)Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$b;

    move-result-object p1

    invoke-interface {p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$b;->a()V

    return-void
.end method

.method public forceMixExport(Ljava/lang/String;)Z
    .locals 13

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->isSetProject(Z)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_7

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    invoke-virtual {v1, v2, v0}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getClip(IZ)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v1

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getClipType()I

    move-result v1

    const/4 v3, 0x4

    if-eq v1, v3, :cond_0

    const-string p1, "nexEngine"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "]forceMixExport: no video clip."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v2

    :cond_0
    new-instance v1, Lcom/nexstreaming/nexeditorsdk/nexProject;

    invoke-direct {v1}, Lcom/nexstreaming/nexeditorsdk/nexProject;-><init>()V

    iget-object v3, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    invoke-virtual {v3, v2, v0}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getClip(IZ)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v3

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->hasAudio()Z

    move-result v3

    if-eqz v3, :cond_1

    iget-object v3, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    invoke-virtual {v3, v2, v0}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getClip(IZ)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v3

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getAudioCodecType()Ljava/lang/String;

    move-result-object v3

    const-string v4, "aac"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_1

    const-string p1, "nexEngine"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "]forceMixExport: audio is not aac"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v2

    :cond_1
    iget-object v3, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    invoke-virtual {v3, v2, v0}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getClip(IZ)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v3

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getRealPath()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v4, v3}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->checkIDRStart(Ljava/lang/String;)I

    move-result v4

    if-eqz v4, :cond_2

    const-string p1, "nexEngine"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "]forceMixExport: idr finder start fail!"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v2

    :cond_2
    const/4 v4, 0x0

    const/4 v12, 0x0

    :goto_0
    iget-object v5, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    invoke-virtual {v5, v0}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalClipCount(Z)I

    move-result v5

    if-ge v4, v5, :cond_6

    iget-object v5, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    invoke-virtual {v5, v4, v0}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getClip(IZ)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v5

    invoke-virtual {v5}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getRealPath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v5

    if-nez v5, :cond_5

    iget-object v5, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    invoke-virtual {v5, v4, v0}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getClip(IZ)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v5

    invoke-static {v5}, Lcom/nexstreaming/nexeditorsdk/nexClip;->dup(Lcom/nexstreaming/nexeditorsdk/nexClip;)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v5

    invoke-virtual {v1, v5}, Lcom/nexstreaming/nexeditorsdk/nexProject;->add(Lcom/nexstreaming/nexeditorsdk/nexClip;)I

    iget-object v5, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    invoke-virtual {v5, v4, v0}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getClip(IZ)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v5

    invoke-virtual {v5}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getVideoClipEdit()Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    move-result-object v5

    invoke-virtual {v5}, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;->getStartTrimTime()I

    move-result v5

    iget-object v6, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    invoke-virtual {v6, v4, v0}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getClip(IZ)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v6

    invoke-virtual {v6}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getVideoClipEdit()Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    move-result-object v6

    invoke-virtual {v6}, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;->getEndTrimTime()I

    move-result v6

    iget-object v7, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    invoke-virtual {v7, v4, v0}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getClip(IZ)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v7

    invoke-virtual {v7}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getVideoClipEdit()Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    move-result-object v7

    invoke-virtual {v7}, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;->getSpeedControl()I

    move-result v7

    const/16 v8, 0x64

    if-eq v7, v8, :cond_3

    const-string v7, "nexEngine"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "["

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v9, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mId:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v9, "]forceMixExport: set speed clip index="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v12, 0x1

    :cond_3
    iget-object v7, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v7, v5}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->checkIDRTime(I)I

    move-result v7

    const/4 v8, -0x1

    if-ne v7, v8, :cond_4

    const-string p1, "nexEngine"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "]forceMixExport: idr finder fail startTrimTime="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->checkIDREnd()I

    return v2

    :cond_4
    const-string v8, "nexEngine"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "["

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v10, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mId:I

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v10, "]forceMixExport: startTrimTime="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, ", endTrimTime="

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, ", new idrTime="

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v8, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v1, v4, v0}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getClip(IZ)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v5

    invoke-virtual {v5}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getVideoClipEdit()Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    move-result-object v5

    invoke-virtual {v5, v7, v6}, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;->setTrim(II)V

    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_0

    :cond_5
    const-string p1, "nexEngine"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "]forceMixExport: ["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "] clip invaild path="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->checkIDREnd()I

    return v2

    :cond_6
    iget-object v3, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v3}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->checkIDREnd()I

    iget-object v3, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    iput-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    :try_start_0
    sget-boolean v4, Lcom/nexstreaming/nexeditorsdk/nexEngine;->sLoadListAsync:Z

    invoke-direct {p0, v4, v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->resolveProject(ZZ)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mForceMixExportMode:Z

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalTime()I

    move-result v1

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mExportTotalTime:I

    const/4 v1, 0x2

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mState:I

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mExportFilePath:Ljava/lang/String;

    const-wide v1, 0x7fffffffffffffffL

    iput-wide v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mEncodeMaxFileSize:J

    invoke-direct {p0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->setEditorListener()V

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    sget v1, Lcom/nexstreaming/nexeditorsdk/nexEngine;->sExportVideoTrackUUIDMode:I

    const/4 v2, 0x0

    invoke-virtual {p1, v1, v2}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(I[B)V

    iget-object v5, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    iget-object v6, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mExportFilePath:Ljava/lang/String;

    iget-wide v7, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mEncodeMaxFileSize:J

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalTime()I

    move-result p1

    int-to-long v9, p1

    const-string p1, "up"

    invoke-static {p1}, Lcom/nexstreaming/kminternal/kinemaster/config/EditorGlobal;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual/range {v5 .. v12}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->directExport(Ljava/lang/String;JJLjava/lang/String;I)I

    iput-object v3, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    return v0

    :catch_0
    iput-object v3, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    return v2

    :cond_7
    return v2
.end method

.method getAppContext()Landroid/content/Context;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mAppContext:Landroid/content/Context;

    return-object v0
.end method

.method public getAudioSessionID()I
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->d(Z)I

    move-result v0

    return v0
.end method

.method public getBrightness()I
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->getBrightness()I

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public getContrast()I
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->getContrast()I

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public getCurrentPlayTimeTime()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mCurrentPlayTime:I

    return v0
.end method

.method public getDuration()I
    .locals 2

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->isSetProject(Z)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->getDuration()I

    move-result v0

    mul-int/lit16 v0, v0, 0x3e8

    return v0

    :cond_0
    return v0
.end method

.method getEncodedEffectOptions(Lcom/nexstreaming/nexeditorsdk/nexClip;Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x1

    invoke-virtual {p1, v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getClipEffect(Z)Lcom/nexstreaming/nexeditorsdk/nexClipEffect;

    move-result-object v2

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->getShowStartTime()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v2, 0x2c

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getClipEffect(Z)Lcom/nexstreaming/nexeditorsdk/nexClipEffect;

    move-result-object v2

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->getShowEndTime()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v2, 0x3f

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getTransitionEffect(Z)Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;

    move-result-object v3

    invoke-virtual {v3, p2}, Lcom/nexstreaming/nexeditorsdk/nexTransitionEffect;->getEffectOptions(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v3

    invoke-direct {p0, v0, v3}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->encodeEffectOptions(Ljava/lang/StringBuilder;Ljava/util/Map;)V

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getClipEffect(Z)Lcom/nexstreaming/nexeditorsdk/nexClipEffect;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/nexstreaming/nexeditorsdk/nexClipEffect;->getEffectOptions(Ljava/lang/String;)Ljava/util/Map;

    move-result-object p1

    invoke-direct {p0, v0, p1}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->encodeEffectOptions(Ljava/lang/StringBuilder;Ljava/util/Map;)V

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getIDRSeekTabSync(Lcom/nexstreaming/nexeditorsdk/nexClip;)[I
    .locals 9

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getMediaInfo()Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;

    move-result-object v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    const-string p1, "nexEngine"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "]getIDRSeekTabSync() getinfo fail!"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-object v2

    :cond_0
    invoke-virtual {v1}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->d()[I

    move-result-object v1

    const/4 v3, -0x1

    iget-object v4, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getRealPath()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v4, p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->checkIDRStart(Ljava/lang/String;)I

    move-result p1

    if-eqz p1, :cond_1

    const-string p1, "nexEngine"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "]getIDRSeekTabSync() checkIDRStart fail!"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-object v2

    :cond_1
    const/4 p1, 0x0

    const/4 v3, 0x0

    const/4 v4, -0x1

    :goto_0
    array-length v5, v1

    if-ge v3, v5, :cond_4

    iget-object v5, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    aget v6, v1, v3

    invoke-virtual {v5, v6}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->checkIDRTime(I)I

    move-result v5

    const-string v6, "nexEngine"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "["

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v8, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mId:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v8, "]getIDRSeekTabSync() : seektab="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget v8, v1, v3

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v8, ", idrTime="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-gez v5, :cond_2

    const-string p1, "nexEngine"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "["

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v4, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mId:I

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, "]getIDRSeekTabSync() idrTime fail! seekTime="

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget v1, v1, v3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->checkIDREnd()I

    return-object v2

    :cond_2
    if-eq v4, v5, :cond_3

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move v4, v5

    :cond_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_4
    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->checkIDREnd()I

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    new-array v1, v1, [I

    :goto_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    if-ge p1, v2, :cond_5

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    aput v2, v1, p1

    const-string v2, "nexEngine"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v4, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mId:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, "]getIDRSeekTabSync() : new seektab="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget v4, v1, p1

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    add-int/lit8 p1, p1, 0x1

    goto :goto_1

    :cond_5
    return-object v1
.end method

.method public getLayerHeight()I
    .locals 1

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexApplicationConfig;->getAspectProfile()Lcom/nexstreaming/nexeditorsdk/nexAspectProfile;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexAspectProfile;->getHeight()I

    move-result v0

    return v0
.end method

.method public getLayerWidth()I
    .locals 1

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexApplicationConfig;->getAspectProfile()Lcom/nexstreaming/nexeditorsdk/nexAspectProfile;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexAspectProfile;->getWidth()I

    move-result v0

    return v0
.end method

.method public getLetterBox()Z
    .locals 1

    iget-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->bLetterBox:Z

    return v0
.end method

.method public getOverlayHitPoint(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$HitPoint;)Z
    .locals 4

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getOverlayItems()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->getStartTime()I

    move-result v2

    iget v3, p1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$HitPoint;->mTime:I

    if-gt v2, v3, :cond_0

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->getEndTime()I

    move-result v2

    iget v3, p1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$HitPoint;->mTime:I

    if-le v2, v3, :cond_0

    invoke-virtual {v1, p1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->isPointInOverlayItem(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$HitPoint;)Z

    move-result p1

    return p1

    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method public getProject()Lcom/nexstreaming/nexeditorsdk/nexProject;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    return-object v0
.end method

.method public getSaturation()I
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->getSaturation()I

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public getSharpness()I
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->getSharpness()I

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public getThumbnailCache(II)Landroid/graphics/Bitmap;
    .locals 9

    iget-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->cacheSeekMode:Z

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v0, p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->n(I)Landroid/graphics/Bitmap;

    move-result-object p1

    if-nez p1, :cond_1

    return-object v1

    :cond_1
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    new-instance v3, Landroid/graphics/Rect;

    const/4 v4, 0x0

    invoke-direct {v3, v4, v4, v0, v2}, Landroid/graphics/Rect;-><init>(IIII)V

    const/16 v5, 0xb4

    if-ne p2, v5, :cond_2

    sget-object p2, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    invoke-static {v0, v2, p2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p2

    new-instance v5, Landroid/graphics/Canvas;

    invoke-direct {v5, p2}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    const/high16 v6, 0x43340000    # 180.0f

    div-int/lit8 v7, v0, 0x2

    int-to-float v7, v7

    div-int/lit8 v8, v2, 0x2

    int-to-float v8, v8

    invoke-virtual {v5, v6, v7, v8}, Landroid/graphics/Canvas;->rotate(FFF)V

    new-instance v6, Landroid/graphics/Rect;

    invoke-direct {v6, v4, v4, v0, v2}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-virtual {v5, p1, v3, v6, v1}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    return-object p2

    :cond_2
    if-nez p2, :cond_3

    sget-object p2, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    invoke-static {v0, v2, p2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p2

    new-instance v5, Landroid/graphics/Canvas;

    invoke-direct {v5, p2}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    new-instance v6, Landroid/graphics/Rect;

    invoke-direct {v6, v4, v4, v0, v2}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-virtual {v5, p1, v3, v6, v1}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    return-object p2

    :cond_3
    const/16 v5, 0x10e

    const/4 v6, 0x0

    if-ne p2, v5, :cond_4

    sget-object p2, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    invoke-static {v2, v0, p2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p2

    new-instance v5, Landroid/graphics/Canvas;

    invoke-direct {v5, p2}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    const/high16 v7, 0x42b40000    # 90.0f

    invoke-virtual {v5, v7, v6, v6}, Landroid/graphics/Canvas;->rotate(FFF)V

    new-instance v6, Landroid/graphics/Rect;

    neg-int v2, v2

    invoke-direct {v6, v4, v2, v0, v4}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-virtual {v5, p1, v3, v6, v1}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    return-object p2

    :cond_4
    const/16 v5, 0x5a

    if-ne p2, v5, :cond_5

    sget-object p2, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    invoke-static {v2, v0, p2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p2

    new-instance v5, Landroid/graphics/Canvas;

    invoke-direct {v5, p2}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    const/high16 v7, 0x43870000    # 270.0f

    invoke-virtual {v5, v7, v6, v6}, Landroid/graphics/Canvas;->rotate(FFF)V

    new-instance v6, Landroid/graphics/Rect;

    neg-int v0, v0

    invoke-direct {v6, v0, v4, v4, v2}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-virtual {v5, p1, v3, v6, v1}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    return-object p2

    :cond_5
    return-object v1
.end method

.method public getView()Lcom/nexstreaming/nexeditorsdk/nexEngineView;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->k()Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;

    move-result-object v0

    check-cast v0, Lcom/nexstreaming/nexeditorsdk/nexEngineView;

    return-object v0
.end method

.method public getVignette()I
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->getVignette()I

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public getVignetteRange()I
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->getVignetteRange()I

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isCacheSeekMode()Z
    .locals 1

    iget-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->cacheSeekMode:Z

    return v0
.end method

.method public overlayLock(Z)V
    .locals 0

    if-eqz p1, :cond_0

    sget-object p1, Lcom/nexstreaming/nexeditorsdk/nexEngine$OverlayCommand;->lock:Lcom/nexstreaming/nexeditorsdk/nexEngine$OverlayCommand;

    invoke-direct {p0, p1}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->setOverlays(Lcom/nexstreaming/nexeditorsdk/nexEngine$OverlayCommand;)V

    goto :goto_0

    :cond_0
    sget-object p1, Lcom/nexstreaming/nexeditorsdk/nexEngine$OverlayCommand;->unlock:Lcom/nexstreaming/nexeditorsdk/nexEngine$OverlayCommand;

    invoke-direct {p0, p1}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->setOverlays(Lcom/nexstreaming/nexeditorsdk/nexEngine$OverlayCommand;)V

    :goto_0
    return-void
.end method

.method public pause()V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->isSetProject(Z)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->s()V

    :cond_0
    return-void
.end method

.method public play()V
    .locals 4

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->cacheSeekMode:Z

    invoke-direct {p0, v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->isSetProject(Z)Z

    move-result v1

    if-eqz v1, :cond_1

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mState:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_0

    const-string v0, "nexEngine"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mId:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "]export state"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->stopAsyncFaceDetect()V

    sget-object v1, Lcom/nexstreaming/nexeditorsdk/nexEngine$OverlayCommand;->upload:Lcom/nexstreaming/nexeditorsdk/nexEngine$OverlayCommand;

    invoke-direct {p0, v1}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->setOverlays(Lcom/nexstreaming/nexeditorsdk/nexEngine$OverlayCommand;)V

    sget-boolean v1, Lcom/nexstreaming/nexeditorsdk/nexEngine;->sLoadListAsync:Z

    const/4 v2, 0x1

    invoke-direct {p0, v1, v2}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->resolveProject(ZZ)I

    iget-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->facedetect_asyncmode:Z

    iget v2, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->facedetect_syncclip_count:I

    iget v3, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->facedetect_undetected_clip_cropping_mode:I

    invoke-virtual {p0, v1, v2, v3}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->faceDetect_internal(ZII)I

    invoke-direct {p0, v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->loadEffectsInEditor(Z)V

    invoke-direct {p0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->setEditorListener()V

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->t()V

    :cond_1
    return-void
.end method

.method public play(Z)Z
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->cacheSeekMode:Z

    if-eqz p1, :cond_0

    :try_start_0
    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->play()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    return v0

    :cond_0
    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->play()V

    :goto_0
    const/4 p1, 0x1

    return p1
.end method

.method protected removeClip(I)V
    .locals 2

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(ILcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$g;)I

    :cond_0
    return-void
.end method

.method public removeEditorListener()V
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mEditorListener:Lcom/nexstreaming/kminternal/nexvideoeditor/c;

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mEditorListener:Lcom/nexstreaming/kminternal/nexvideoeditor/c;

    :cond_0
    return-void
.end method

.method public resume()V
    .locals 3

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->cacheSeekMode:Z

    invoke-direct {p0, v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->isSetProject(Z)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->undoForceMixProject()V

    invoke-direct {p0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->setEditorListener()V

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexEngine$OverlayCommand;->upload:Lcom/nexstreaming/nexeditorsdk/nexEngine$OverlayCommand;

    invoke-direct {p0, v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->setOverlays(Lcom/nexstreaming/nexeditorsdk/nexEngine$OverlayCommand;)V

    iget-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->facedetect_asyncmode:Z

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->facedetect_syncclip_count:I

    iget v2, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->facedetect_undetected_clip_cropping_mode:I

    invoke-virtual {p0, v0, v1, v2}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->faceDetect_internal(ZII)I

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->t()V

    :cond_0
    return-void
.end method

.method public reverseStart(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIIJIII)Z
    .locals 14

    sub-int v0, p10, p9

    const/4 v12, 0x1

    const/16 v1, 0x1f4

    if-lt v0, v1, :cond_1

    move-object v13, p0

    iget-object v0, v13, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    move-object v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    move/from16 v4, p4

    move/from16 v5, p5

    move/from16 v6, p6

    move-wide/from16 v7, p7

    move/from16 v9, p9

    move/from16 v10, p10

    move/from16 v11, p11

    invoke-virtual/range {v0 .. v11}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->reverseStart(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIIJIII)I

    move-result v0

    if-nez v0, :cond_0

    return v12

    :cond_0
    const/4 v0, 0x0

    return v0

    :cond_1
    move-object v13, p0

    new-instance v2, Lcom/nexstreaming/nexeditorsdk/exception/InvalidRangeException;

    invoke-direct {v2, v1, v0, v12}, Lcom/nexstreaming/nexeditorsdk/exception/InvalidRangeException;-><init>(IIZ)V

    throw v2
.end method

.method public reverseStop()Z
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->reverseStop()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method runTranscodeMode(Lcom/nexstreaming/nexeditorsdk/nexTranscode$Option;Ljava/lang/String;Lcom/nexstreaming/nexeditorsdk/nexEngineListener;)V
    .locals 10

    sget-boolean v2, Lcom/nexstreaming/nexeditorsdk/nexEngine;->sTranscodeMode:Z

    const/4 v3, 0x1

    if-eqz v2, :cond_0

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;->TRANSCODING_BUSY:Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;->getValue()I

    move-result v0

    invoke-interface {p3, v3, v0}, Lcom/nexstreaming/nexeditorsdk/nexEngineListener;->onEncodingDone(ZI)V

    return-void

    :cond_0
    iget v2, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mState:I

    const/4 v4, 0x2

    if-ne v2, v4, :cond_1

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;->TRANSCODING_BUSY:Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;->getValue()I

    move-result v0

    invoke-interface {p3, v3, v0}, Lcom/nexstreaming/nexeditorsdk/nexEngineListener;->onEncodingDone(ZI)V

    return-void

    :cond_1
    invoke-static {p2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getSupportedClip(Ljava/lang/String;)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v2

    if-nez v2, :cond_2

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;->TRANSCODING_NOT_SUPPORTED_FORMAT:Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;->getValue()I

    move-result v0

    invoke-interface {p3, v3, v0}, Lcom/nexstreaming/nexeditorsdk/nexEngineListener;->onEncodingDone(ZI)V

    return-void

    :cond_2
    sput-boolean v3, Lcom/nexstreaming/nexeditorsdk/nexEngine;->sTranscodeMode:Z

    new-instance v4, Lcom/nexstreaming/nexeditorsdk/nexProject;

    invoke-direct {v4}, Lcom/nexstreaming/nexeditorsdk/nexProject;-><init>()V

    sput-object v4, Lcom/nexstreaming/nexeditorsdk/nexEngine;->sTranscodeProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    sget-object v4, Lcom/nexstreaming/nexeditorsdk/nexEngine;->sTranscodeProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    invoke-virtual {v4, v2}, Lcom/nexstreaming/nexeditorsdk/nexProject;->add(Lcom/nexstreaming/nexeditorsdk/nexClip;)I

    sput-object p3, Lcom/nexstreaming/nexeditorsdk/nexEngine;->sTranscodeListener:Lcom/nexstreaming/nexeditorsdk/nexEngineListener;

    iget-object v1, p1, Lcom/nexstreaming/nexeditorsdk/nexTranscode$Option;->outputRotate:Lcom/nexstreaming/nexeditorsdk/nexTranscode$Rotate;

    sget-object v4, Lcom/nexstreaming/nexeditorsdk/nexTranscode$Rotate;->CW_0:Lcom/nexstreaming/nexeditorsdk/nexTranscode$Rotate;

    const/16 v5, 0x5a

    const/16 v6, 0xb4

    const/16 v7, 0x10e

    const/4 v8, 0x0

    if-ne v1, v4, :cond_4

    :cond_3
    const/4 v1, 0x0

    goto :goto_0

    :cond_4
    iget-object v1, p1, Lcom/nexstreaming/nexeditorsdk/nexTranscode$Option;->outputRotate:Lcom/nexstreaming/nexeditorsdk/nexTranscode$Rotate;

    sget-object v4, Lcom/nexstreaming/nexeditorsdk/nexTranscode$Rotate;->CW_90:Lcom/nexstreaming/nexeditorsdk/nexTranscode$Rotate;

    if-ne v1, v4, :cond_5

    const/16 v1, 0x10e

    goto :goto_0

    :cond_5
    iget-object v1, p1, Lcom/nexstreaming/nexeditorsdk/nexTranscode$Option;->outputRotate:Lcom/nexstreaming/nexeditorsdk/nexTranscode$Rotate;

    sget-object v4, Lcom/nexstreaming/nexeditorsdk/nexTranscode$Rotate;->CW_180:Lcom/nexstreaming/nexeditorsdk/nexTranscode$Rotate;

    if-ne v1, v4, :cond_6

    const/16 v1, 0xb4

    goto :goto_0

    :cond_6
    iget-object v1, p1, Lcom/nexstreaming/nexeditorsdk/nexTranscode$Option;->outputRotate:Lcom/nexstreaming/nexeditorsdk/nexTranscode$Rotate;

    sget-object v4, Lcom/nexstreaming/nexeditorsdk/nexTranscode$Rotate;->CW_270:Lcom/nexstreaming/nexeditorsdk/nexTranscode$Rotate;

    if-ne v1, v4, :cond_3

    const/16 v1, 0x5a

    :goto_0
    if-eqz v1, :cond_7

    sget-object v4, Lcom/nexstreaming/nexeditorsdk/nexEngine;->sTranscodeProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    invoke-virtual {v4, v8, v3}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getClip(IZ)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v4

    invoke-virtual {v4, v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setRotateDegree(I)V

    :cond_7
    iget v1, p1, Lcom/nexstreaming/nexeditorsdk/nexTranscode$Option;->outputFitMode:I

    if-nez v1, :cond_8

    sget-object v1, Lcom/nexstreaming/nexeditorsdk/nexEngine;->sTranscodeProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    invoke-virtual {v1, v8, v3}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getClip(IZ)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v1

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v1

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->resetStartEndPosition()V

    goto :goto_1

    :cond_8
    sget-object v1, Lcom/nexstreaming/nexeditorsdk/nexEngine;->sTranscodeProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    invoke-virtual {v1, v8, v3}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getClip(IZ)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v1

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getCrop()Lcom/nexstreaming/nexeditorsdk/nexCrop;

    move-result-object v1

    iget v4, p1, Lcom/nexstreaming/nexeditorsdk/nexTranscode$Option;->outputWidth:I

    iget v9, p1, Lcom/nexstreaming/nexeditorsdk/nexTranscode$Option;->outputHeight:I

    invoke-virtual {v1, v4, v9}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->fitStartEndPosition(II)V

    :goto_1
    invoke-direct {p0, v3, v3}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->resolveProject(ZZ)I

    iget-object v1, p1, Lcom/nexstreaming/nexeditorsdk/nexTranscode$Option;->outputRotateMeta:Lcom/nexstreaming/nexeditorsdk/nexTranscode$Rotate;

    sget-object v3, Lcom/nexstreaming/nexeditorsdk/nexTranscode$Rotate;->BYPASS:Lcom/nexstreaming/nexeditorsdk/nexTranscode$Rotate;

    if-ne v1, v3, :cond_a

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getRotateInMeta()I

    move-result v1

    const/16 v2, 0x168

    rsub-int v1, v1, 0x168

    if-ne v1, v2, :cond_9

    goto :goto_2

    :cond_9
    move v8, v1

    goto :goto_2

    :cond_a
    iget-object v1, p1, Lcom/nexstreaming/nexeditorsdk/nexTranscode$Option;->outputRotateMeta:Lcom/nexstreaming/nexeditorsdk/nexTranscode$Rotate;

    sget-object v2, Lcom/nexstreaming/nexeditorsdk/nexTranscode$Rotate;->CW_0:Lcom/nexstreaming/nexeditorsdk/nexTranscode$Rotate;

    if-ne v1, v2, :cond_b

    goto :goto_2

    :cond_b
    iget-object v1, p1, Lcom/nexstreaming/nexeditorsdk/nexTranscode$Option;->outputRotateMeta:Lcom/nexstreaming/nexeditorsdk/nexTranscode$Rotate;

    sget-object v2, Lcom/nexstreaming/nexeditorsdk/nexTranscode$Rotate;->CW_90:Lcom/nexstreaming/nexeditorsdk/nexTranscode$Rotate;

    if-ne v1, v2, :cond_c

    const/16 v8, 0x5a

    goto :goto_2

    :cond_c
    iget-object v1, p1, Lcom/nexstreaming/nexeditorsdk/nexTranscode$Option;->outputRotateMeta:Lcom/nexstreaming/nexeditorsdk/nexTranscode$Rotate;

    sget-object v2, Lcom/nexstreaming/nexeditorsdk/nexTranscode$Rotate;->CW_180:Lcom/nexstreaming/nexeditorsdk/nexTranscode$Rotate;

    if-ne v1, v2, :cond_d

    const/16 v8, 0xb4

    goto :goto_2

    :cond_d
    iget-object v1, p1, Lcom/nexstreaming/nexeditorsdk/nexTranscode$Option;->outputRotateMeta:Lcom/nexstreaming/nexeditorsdk/nexTranscode$Rotate;

    sget-object v2, Lcom/nexstreaming/nexeditorsdk/nexTranscode$Rotate;->CW_270:Lcom/nexstreaming/nexeditorsdk/nexTranscode$Rotate;

    if-ne v1, v2, :cond_e

    const/16 v8, 0x10e

    :cond_e
    :goto_2
    iget-object v1, p1, Lcom/nexstreaming/nexeditorsdk/nexTranscode$Option;->outputFile:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    iget v2, p1, Lcom/nexstreaming/nexeditorsdk/nexTranscode$Option;->outputWidth:I

    iget v3, p1, Lcom/nexstreaming/nexeditorsdk/nexTranscode$Option;->outputHeight:I

    iget v4, p1, Lcom/nexstreaming/nexeditorsdk/nexTranscode$Option;->outputBitRate:I

    const-wide v5, 0x7fffffffffffffffL

    iget v7, p1, Lcom/nexstreaming/nexeditorsdk/nexTranscode$Option;->outputSamplingRate:I

    move-object v0, p0

    invoke-direct/range {v0 .. v8}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->transcode(Ljava/lang/String;IIIJII)I

    return-void
.end method

.method public seek(I)V
    .locals 2

    iget-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->cacheSeekMode:Z

    if-eqz v0, :cond_0

    const-string p1, "nexEngine"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "] seek fail! cacheSeekMode"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->isSetProject(Z)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->undoForceMixProject()V

    invoke-direct {p0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->setEditorListener()V

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexEngine$OverlayCommand;->upload:Lcom/nexstreaming/nexeditorsdk/nexEngine$OverlayCommand;

    invoke-direct {p0, v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->setOverlays(Lcom/nexstreaming/nexeditorsdk/nexEngine$OverlayCommand;)V

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->stopAsyncFaceDetect()V

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->facedetect_undetected_clip_cropping_mode:I

    invoke-virtual {p0, p1, v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->faceDetect_for_seek(II)I

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->lastSeekTime:I

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v0, p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->j(I)V

    :cond_1
    return-void
.end method

.method public seekFromCache(I)Z
    .locals 2

    iget-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->cacheSeekMode:Z

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    invoke-direct {p0, v1}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->isSetProject(Z)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->undoForceMixProject()V

    invoke-direct {p0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->setEditorListener()V

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexEngine$OverlayCommand;->upload:Lcom/nexstreaming/nexeditorsdk/nexEngine$OverlayCommand;

    invoke-direct {p0, v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->setOverlays(Lcom/nexstreaming/nexeditorsdk/nexEngine$OverlayCommand;)V

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->b(ILcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$p;)V

    const/4 p1, 0x1

    return p1

    :cond_1
    return v1
.end method

.method public seekIDROnly(I)V
    .locals 2

    iget-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->cacheSeekMode:Z

    if-eqz v0, :cond_0

    const-string p1, "nexEngine"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "] seekIDROnly fail! cacheSeekMode"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->isSetProject(Z)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->undoForceMixProject()V

    invoke-direct {p0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->setEditorListener()V

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexEngine$OverlayCommand;->upload:Lcom/nexstreaming/nexeditorsdk/nexEngine$OverlayCommand;

    invoke-direct {p0, v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->setOverlays(Lcom/nexstreaming/nexeditorsdk/nexEngine$OverlayCommand;)V

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->lastSeekTime:I

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->e(ILcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$p;)V

    :cond_1
    return-void
.end method

.method public seekIDROnly(ILcom/nexstreaming/nexeditorsdk/nexEngine$OnSeekCompletionListener;)V
    .locals 2

    iget-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->cacheSeekMode:Z

    if-eqz v0, :cond_0

    const-string p1, "nexEngine"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "["

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mId:I

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, "] seekIDROnly fail! cacheSeekMode"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->isSetProject(Z)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->undoForceMixProject()V

    invoke-direct {p0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->setEditorListener()V

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexEngine$OverlayCommand;->upload:Lcom/nexstreaming/nexeditorsdk/nexEngine$OverlayCommand;

    invoke-direct {p0, v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->setOverlays(Lcom/nexstreaming/nexeditorsdk/nexEngine$OverlayCommand;)V

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->lastSeekTime:I

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    new-instance v1, Lcom/nexstreaming/nexeditorsdk/nexEngine$16;

    invoke-direct {v1, p0, p2}, Lcom/nexstreaming/nexeditorsdk/nexEngine$16;-><init>(Lcom/nexstreaming/nexeditorsdk/nexEngine;Lcom/nexstreaming/nexeditorsdk/nexEngine$OnSeekCompletionListener;)V

    invoke-virtual {v0, p1, v1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->e(ILcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$p;)V

    :cond_1
    return-void
.end method

.method public seekIDRorI(I)V
    .locals 2

    iget-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->cacheSeekMode:Z

    if-eqz v0, :cond_0

    const-string p1, "nexEngine"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "] seekIDRorI fail! cacheSeekMode"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->isSetProject(Z)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->undoForceMixProject()V

    invoke-direct {p0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->setEditorListener()V

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexEngine$OverlayCommand;->upload:Lcom/nexstreaming/nexeditorsdk/nexEngine$OverlayCommand;

    invoke-direct {p0, v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->setOverlays(Lcom/nexstreaming/nexeditorsdk/nexEngine$OverlayCommand;)V

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->lastSeekTime:I

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->d(ILcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$p;)V

    :cond_1
    return-void
.end method

.method public set360VideoForceNormalView()V
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->A()Z

    return-void
.end method

.method public set360VideoViewPosition(II)Z
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v0, p1, p2}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->e(II)Z

    move-result p1

    return p1
.end method

.method public set360VideoViewStopPosition(II)V
    .locals 3

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->q()Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$b;

    move-result-object v0

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$FastPreviewOption;->nofx:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$FastPreviewOption;

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$b;->a(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$FastPreviewOption;I)Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$b;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$b;->a(II)Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$b;

    move-result-object p1

    invoke-interface {p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$b;->a()V

    return-void
.end method

.method public setBrightness(I)V
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v0, p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->setBrightness(I)I

    :cond_0
    return-void
.end method

.method public setContrast(I)V
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v0, p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->setContrast(I)I

    :cond_0
    return-void
.end method

.method public setDeviceGamma(F)V
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v0, p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->setDeviceGamma(F)I

    :cond_0
    return-void
.end method

.method public setDeviceLightLevel(I)V
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v0, p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->setDeviceLightLevel(I)I

    :cond_0
    return-void
.end method

.method public setEventHandler(Lcom/nexstreaming/nexeditorsdk/nexEngineListener;)V
    .locals 3

    const-string v0, "nexEngine"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mId:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "] setEventHandler ="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mEventListener:Lcom/nexstreaming/nexeditorsdk/nexEngineListener;

    invoke-direct {p0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->setEditorListener()V

    return-void
.end method

.method public setExportCrop(III)V
    .locals 3

    const-string v0, "nexEngine"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mId:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "] setExportCrop mode="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "X"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mEnhancedCropMode:I

    iput p2, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mEnhancedCropOutputWidth:I

    iput p3, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mEnhancedCropOutputHeight:I

    return-void
.end method

.method public setFaceModule(Ljava/lang/String;)V
    .locals 5

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->stopAsyncFaceDetect()V

    const/4 v0, 0x0

    if-nez p1, :cond_0

    invoke-static {v0}, Lcom/nexstreaming/kminternal/kinemaster/utils/facedetect/a;->a(Lcom/nexstreaming/nexeditorsdk/module/nexFaceDetectionProvider;)V

    return-void

    :cond_0
    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/utils/facedetect/a;->a()Lcom/nexstreaming/nexeditorsdk/module/nexFaceDetectionProvider;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-interface {v1}, Lcom/nexstreaming/nexeditorsdk/module/nexFaceDetectionProvider;->uuid()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v1

    if-nez v1, :cond_1

    return-void

    :cond_1
    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    if-eqz v1, :cond_3

    const/4 v1, 0x0

    :goto_0
    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalClipCount(Z)I

    move-result v2

    if-ge v1, v2, :cond_3

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    invoke-virtual {v2, v1, v3}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getClip(IZ)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v2

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getClipType()I

    move-result v4

    if-ne v4, v3, :cond_2

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->resetFaceDetectProcessed()V

    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_3
    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexApplicationConfig;->getExternalModuleManager()Lcom/nexstreaming/nexeditorsdk/nexExternalModuleManager;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/nexstreaming/nexeditorsdk/nexExternalModuleManager;->getModule(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    if-nez p1, :cond_4

    invoke-static {v0}, Lcom/nexstreaming/kminternal/kinemaster/utils/facedetect/a;->a(Lcom/nexstreaming/nexeditorsdk/module/nexFaceDetectionProvider;)V

    return-void

    :cond_4
    const-class v0, Lcom/nexstreaming/nexeditorsdk/module/nexFaceDetectionProvider;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    check-cast p1, Lcom/nexstreaming/nexeditorsdk/module/nexFaceDetectionProvider;

    invoke-static {p1}, Lcom/nexstreaming/kminternal/kinemaster/utils/facedetect/a;->a(Lcom/nexstreaming/nexeditorsdk/module/nexFaceDetectionProvider;)V

    :cond_5
    return-void
.end method

.method public setHDRtoSDR(Z)V
    .locals 2

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    const-string v1, "HDR2SDR"

    if-eqz p1, :cond_0

    const-string p1, "1"

    goto :goto_0

    :cond_0
    const-string p1, "0"

    :goto_0
    invoke-virtual {v0, v1, p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->setProperty(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public setLetterBox(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->bLetterBox:Z

    return-void
.end method

.method setMark()V
    .locals 2

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->y()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v0, v1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->e(Z)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->e(Z)V

    :goto_0
    return-void
.end method

.method public setOnSurfaceChangeListener(Lcom/nexstreaming/nexeditorsdk/nexEngine$OnSurfaceChangeListener;)V
    .locals 1

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->m_onSurfaceChangeListener:Lcom/nexstreaming/nexeditorsdk/nexEngine$OnSurfaceChangeListener;

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    new-instance v0, Lcom/nexstreaming/nexeditorsdk/nexEngine$12;

    invoke-direct {v0, p0}, Lcom/nexstreaming/nexeditorsdk/nexEngine$12;-><init>(Lcom/nexstreaming/nexeditorsdk/nexEngine;)V

    invoke-virtual {p1, v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$q;)V

    return-void
.end method

.method public setPreviewScaleFactor(F)Z
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v0, p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(F)Z

    move-result p1

    return p1
.end method

.method public setProject(Lcom/nexstreaming/nexeditorsdk/nexProject;)V
    .locals 3

    const-string v0, "nexEngine"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mId:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "] setProject"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    invoke-direct {p0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->defaultFaceDetectSetting()V

    return-void
.end method

.method public setProperty(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v0, p1, p2}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->setProperty(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    return-void
.end method

.method public setSaturation(I)V
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v0, p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->setSaturation(I)I

    :cond_0
    return-void
.end method

.method public setScalingFlag2Export(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->bNeedScaling:Z

    return-void
.end method

.method public setSharpness(I)V
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v0, p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->setSharpness(I)V

    :cond_0
    return-void
.end method

.method public setTaskSleep(Z)V
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v0, p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->setTaskSleep(I)I

    return-void
.end method

.method public setThumbnailRoutine(I)V
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v0, p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->o(I)I

    return-void
.end method

.method public setTotalAudioVolumeProject(II)V
    .locals 2

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getPrimaryItems()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v1, p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setClipVolume(I)Z

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getAudioItems()Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nexstreaming/nexeditorsdk/nexAudioItem;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexAudioItem;->getClip()Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setClipVolume(I)Z

    goto :goto_1

    :cond_1
    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    int-to-float p2, p2

    const/high16 v0, 0x43480000    # 200.0f

    div-float/2addr p2, v0

    invoke-virtual {p1, p2}, Lcom/nexstreaming/nexeditorsdk/nexProject;->setBGMMasterVolumeScale(F)V

    return-void
.end method

.method public setTotalAudioVolumeResetWhilePlay()Z
    .locals 2

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    const/16 v1, 0x64

    invoke-virtual {v0, v1, v1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->setVolumeWhilePlay(II)I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public setTotalAudioVolumeWhilePlay(II)Z
    .locals 2

    const/16 v0, 0x65

    const/16 v1, 0x64

    if-ne p1, v1, :cond_0

    const/16 p1, 0x65

    :cond_0
    if-ne p2, v1, :cond_1

    const/16 p2, 0x65

    :cond_1
    const/4 v0, 0x0

    if-ltz p1, :cond_6

    const/16 v1, 0xc8

    if-le p1, v1, :cond_2

    goto :goto_1

    :cond_2
    if-ltz p2, :cond_5

    if-le p2, v1, :cond_3

    goto :goto_0

    :cond_3
    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v1, p1, p2}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->setVolumeWhilePlay(II)I

    move-result p1

    if-nez p1, :cond_4

    const/4 p1, 0x1

    return p1

    :cond_4
    return v0

    :cond_5
    :goto_0
    return v0

    :cond_6
    :goto_1
    return v0
.end method

.method public setView(Landroid/view/SurfaceView;)I
    .locals 3

    const-string v0, "nexEngine"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mId:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "] setView SurfaceView="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;)V

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mSurfaceView:Landroid/view/SurfaceView;

    if-eq p1, v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mSurfaceView:Landroid/view/SurfaceView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mSurfaceView:Landroid/view/SurfaceView;

    invoke-virtual {v0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    invoke-interface {v0, p0}, Landroid/view/SurfaceHolder;->removeCallback(Landroid/view/SurfaceHolder$Callback;)V

    :cond_0
    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mSurfaceView:Landroid/view/SurfaceView;

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mSurfaceView:Landroid/view/SurfaceView;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mSurfaceView:Landroid/view/SurfaceView;

    invoke-virtual {p1}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object p1

    invoke-interface {p1, p0}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method public setView(Lcom/nexstreaming/nexeditorsdk/nexEngineView;)I
    .locals 3

    const-string v0, "nexEngine"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mId:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "] setView nexEngineView="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mSurfaceView:Landroid/view/SurfaceView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mSurfaceView:Landroid/view/SurfaceView;

    invoke-virtual {v0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    invoke-interface {v0, p0}, Landroid/view/SurfaceHolder;->removeCallback(Landroid/view/SurfaceHolder$Callback;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mSurfaceView:Landroid/view/SurfaceView;

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v0, p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;)V

    const/4 p1, 0x0

    return p1
.end method

.method public setVignette(I)V
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v0, p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->setVignette(I)V

    :cond_0
    return-void
.end method

.method public setVignetteRange(I)V
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v0, p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->setVignetteRange(I)V

    :cond_0
    return-void
.end method

.method public startCollectCache(ILcom/nexstreaming/nexeditorsdk/nexEngine$OnCompletionListener;)Z
    .locals 3

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->isSetProject(Z)Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->k()Z

    move-result v1

    if-eqz v1, :cond_1

    if-eqz p2, :cond_0

    sget-object p1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->THUMBNAIL_BUSY:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    invoke-virtual {p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->getValue()I

    move-result p1

    invoke-virtual {p2, p1}, Lcom/nexstreaming/nexeditorsdk/nexEngine$OnCompletionListener;->onComplete(I)V

    :cond_0
    return v0

    :cond_1
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->cacheSeekMode:Z

    invoke-direct {p0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->undoForceMixProject()V

    invoke-direct {p0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->setEditorListener()V

    sget-object v1, Lcom/nexstreaming/nexeditorsdk/nexEngine$OverlayCommand;->upload:Lcom/nexstreaming/nexeditorsdk/nexEngine$OverlayCommand;

    invoke-direct {p0, v1}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->setOverlays(Lcom/nexstreaming/nexeditorsdk/nexEngine$OverlayCommand;)V

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    new-instance v2, Lcom/nexstreaming/nexeditorsdk/nexEngine$17;

    invoke-direct {v2, p0, p2}, Lcom/nexstreaming/nexeditorsdk/nexEngine$17;-><init>(Lcom/nexstreaming/nexeditorsdk/nexEngine;Lcom/nexstreaming/nexeditorsdk/nexEngine$OnCompletionListener;)V

    invoke-virtual {v1, p1, v2}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(ILcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$p;)V

    return v0

    :cond_2
    return v0
.end method

.method public stop()V
    .locals 3

    iget-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->externalImageExportProcessing:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->u()V

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mState:I

    return-void

    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->cacheSeekMode:Z

    invoke-direct {p0, v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->isSetProject(Z)Z

    move-result v0

    if-eqz v0, :cond_2

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mState:I

    const/4 v2, 0x2

    if-ne v0, v2, :cond_1

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mState:I

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->s()V

    goto :goto_0

    :cond_1
    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mState:I

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->s()V

    :cond_2
    :goto_0
    return-void
.end method

.method public stop(Lcom/nexstreaming/nexeditorsdk/nexEngine$OnCompletionListener;)V
    .locals 3

    iget-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->externalImageExportProcessing:Z

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->u()V

    if-eqz p1, :cond_0

    invoke-virtual {p1, v2}, Lcom/nexstreaming/nexeditorsdk/nexEngine$OnCompletionListener;->onComplete(I)V

    :cond_0
    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mState:I

    return-void

    :cond_1
    iput-boolean v2, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->cacheSeekMode:Z

    invoke-direct {p0, v2}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->isSetProject(Z)Z

    move-result v0

    if-eqz v0, :cond_2

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mState:I

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    new-instance v1, Lcom/nexstreaming/nexeditorsdk/nexEngine$15;

    invoke-direct {v1, p0, p1}, Lcom/nexstreaming/nexeditorsdk/nexEngine$15;-><init>(Lcom/nexstreaming/nexeditorsdk/nexEngine;Lcom/nexstreaming/nexeditorsdk/nexEngine$OnCompletionListener;)V

    invoke-virtual {v0, v1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$f;)V

    goto :goto_0

    :cond_2
    const/16 v0, 0x15

    invoke-virtual {p1, v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine$OnCompletionListener;->onComplete(I)V

    :goto_0
    return-void
.end method

.method public stopAsyncFaceDetect()V
    .locals 3

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->async_facedetect_worker_list_:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/AsyncTask;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/os/AsyncTask;->cancel(Z)Z

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->async_facedetect_worker_list_:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    return-void
.end method

.method public stopCollectCache(I)V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->cacheSeekMode:Z

    invoke-virtual {p0, p1}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->seek(I)V

    return-void
.end method

.method public stopSync()V
    .locals 4
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->isSetProject(Z)Z

    move-result v1

    if-eqz v1, :cond_3

    const-string v1, "nexEngine"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mId:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, "]stopSync start"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mPlayState:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$PlayState;

    sget-object v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$PlayState;->NONE:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$PlayState;

    const/4 v3, 0x1

    if-eq v1, v2, :cond_2

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mPlayState:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$PlayState;

    sget-object v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$PlayState;->IDLE:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$PlayState;

    if-ne v1, v2, :cond_0

    goto :goto_1

    :cond_0
    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v1, v3}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->b(Z)V

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->s()V

    :goto_0
    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mPlayState:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$PlayState;

    sget-object v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$PlayState;->IDLE:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$PlayState;

    if-ne v1, v2, :cond_1

    iput v3, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mState:I

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v1, v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->b(Z)V

    const-string v0, "nexEngine"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mId:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "]stopSync End!"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    :cond_1
    const-wide/16 v1, 0xa

    :try_start_0
    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    invoke-virtual {v1}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_0

    :cond_2
    :goto_1
    const-string v0, "nexEngine"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mId:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "]stopSync IDLE state"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    iput v3, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mState:I

    return-void

    :cond_3
    :goto_2
    return-void
.end method

.method stopTranscode()V
    .locals 2

    sget-boolean v0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->sTranscodeMode:Z

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mState:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->stop()V

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    sput-boolean v0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->sTranscodeMode:Z

    const/4 v0, 0x1

    invoke-direct {p0, v0, v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->resolveProject(ZZ)I

    :cond_1
    :goto_0
    return-void
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 4

    const-string p2, "nexEngine"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "surfaceChanged called("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz p3, :cond_6

    if-nez p4, :cond_0

    goto/16 :goto_3

    :cond_0
    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexApplicationConfig;->getAspectRatio()F

    move-result p2

    const/4 v0, 0x0

    cmpl-float v0, p2, v0

    if-lez v0, :cond_2

    int-to-float v0, p4

    mul-float v0, v0, p2

    int-to-float v1, p3

    cmpl-float v2, v0, v1

    if-lez v2, :cond_1

    div-float/2addr v1, p2

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result p2

    move v0, p2

    move p2, p3

    goto :goto_1

    :cond_1
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result p2

    goto :goto_0

    :cond_2
    move p2, p3

    :goto_0
    move v0, p4

    :goto_1
    const-string v1, "nexEngine"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "surfaceChanged aspect view size "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, "x"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-ne p2, p3, :cond_5

    if-eq v0, p4, :cond_3

    goto :goto_2

    :cond_3
    invoke-interface {p1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object p1

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mSurface:Landroid/view/Surface;

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    if-eqz p1, :cond_4

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    iget-object p2, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mSurface:Landroid/view/Surface;

    invoke-virtual {p1, p2}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(Landroid/view/Surface;)V

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->w()V

    :cond_4
    return-void

    :cond_5
    :goto_2
    const-string p3, "nexEngine"

    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "surfaceChanged new view size "

    invoke-virtual {p4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "x"

    invoke-virtual {p4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p4

    invoke-static {p3, p4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-interface {p1, p2, v0}, Landroid/view/SurfaceHolder;->setFixedSize(II)V

    return-void

    :cond_6
    :goto_3
    const-string p1, "nexEngine"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "invalid video width("

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p3, ") or height("

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p3, ")"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 2

    const-string v0, "nexEngine"

    const-string v1, "surfaceCreated called()"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mSurfaceView:Landroid/view/SurfaceView;

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-interface {p1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object p1

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mSurface:Landroid/view/Surface;

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mSurface:Landroid/view/Surface;

    invoke-virtual {p1, v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(Landroid/view/Surface;)V

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->w()V

    :cond_1
    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 2

    const-string v0, "nexEngine"

    const-string v1, "surfaceDestroyed called()"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mSurface:Landroid/view/Surface;

    invoke-interface {p1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object p1

    if-ne v1, p1, :cond_0

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mSurface:Landroid/view/Surface;

    :cond_0
    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {p1, v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(Landroid/view/Surface;)V

    :cond_1
    return-void
.end method

.method public transcodingStart(Ljava/lang/String;Ljava/lang/String;IIIIIJII)Z
    .locals 14

    move-object v0, p0

    iget-object v1, v0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    const-string v2, "up"

    invoke-static {v2}, Lcom/nexstreaming/kminternal/kinemaster/config/EditorGlobal;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    move-object v2, p1

    move-object/from16 v3, p2

    move/from16 v4, p3

    move/from16 v5, p4

    move/from16 v6, p5

    move/from16 v7, p6

    move/from16 v8, p7

    move-wide/from16 v9, p8

    move/from16 v11, p10

    move/from16 v12, p11

    invoke-virtual/range {v1 .. v13}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(Ljava/lang/String;Ljava/lang/String;IIIIIJIILjava/lang/String;)Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    move-result-object v1

    invoke-virtual {v1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->isError()Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x1

    return v1

    :cond_0
    const/4 v1, 0x0

    return v1
.end method

.method public transcodingStop()Z
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->p()Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->isError()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public updateDrawInfo(Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;)V
    .locals 6

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    if-eqz v0, :cond_0

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexDrawInfo;

    invoke-direct {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexDrawInfo;-><init>()V

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getID()I

    move-result v1

    iput v1, v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexDrawInfo;->mID:I

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getClipID()I

    move-result v1

    iput v1, v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexDrawInfo;->mTrackID:I

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getSubEffectID()I

    move-result v1

    iput v1, v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexDrawInfo;->mSubEffectID:I

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getEffectID()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexDrawInfo;->mEffectID:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getTitle()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexDrawInfo;->mTitle:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getIsTransition()I

    move-result v1

    iput v1, v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexDrawInfo;->mIsTransition:I

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getStartTime()I

    move-result v1

    iput v1, v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexDrawInfo;->mStartTime:I

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getEndTime()I

    move-result v1

    iput v1, v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexDrawInfo;->mEndTime:I

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getRotateState()I

    move-result v1

    iput v1, v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexDrawInfo;->mRotateState:I

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getUserRotateState()I

    move-result v1

    iput v1, v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexDrawInfo;->mUserRotateState:I

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getUserTranslateX()I

    move-result v1

    iput v1, v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexDrawInfo;->mTranslateX:I

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getUserTranslateY()I

    move-result v1

    iput v1, v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexDrawInfo;->mTranslateY:I

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getLUT()I

    move-result v1

    iput v1, v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexDrawInfo;->mLUT:I

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getCustomLUTA()I

    move-result v1

    iput v1, v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexDrawInfo;->mCustomLUT_A:I

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getCustomLUTB()I

    move-result v1

    iput v1, v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexDrawInfo;->mCustomLUT_B:I

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getCustomLUTPower()I

    move-result v1

    iput v1, v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexDrawInfo;->mCustomLUT_Power:I

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getBrightness()I

    move-result v1

    iput v1, v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexDrawInfo;->mBrightness:I

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getContrast()I

    move-result v1

    iput v1, v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexDrawInfo;->mContrast:I

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getSaturation()I

    move-result v1

    iput v1, v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexDrawInfo;->mSaturation:I

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getTintcolor()I

    move-result v1

    iput v1, v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexDrawInfo;->mTintcolor:I

    iget-object v1, v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexDrawInfo;->mStartRect:Lcom/nexstreaming/kminternal/nexvideoeditor/NexRectangle;

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getStartRect()Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->left:I

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getStartRect()Landroid/graphics/Rect;

    move-result-object v3

    iget v3, v3, Landroid/graphics/Rect;->top:I

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getStartRect()Landroid/graphics/Rect;

    move-result-object v4

    iget v4, v4, Landroid/graphics/Rect;->right:I

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getStartRect()Landroid/graphics/Rect;

    move-result-object v5

    iget v5, v5, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {v1, v2, v3, v4, v5}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexRectangle;->setRect(IIII)V

    iget-object v1, v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexDrawInfo;->mEndRect:Lcom/nexstreaming/kminternal/nexvideoeditor/NexRectangle;

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getEndRect()Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->left:I

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getEndRect()Landroid/graphics/Rect;

    move-result-object v3

    iget v3, v3, Landroid/graphics/Rect;->top:I

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getEndRect()Landroid/graphics/Rect;

    move-result-object v4

    iget v4, v4, Landroid/graphics/Rect;->right:I

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getEndRect()Landroid/graphics/Rect;

    move-result-object v5

    iget v5, v5, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {v1, v2, v3, v4, v5}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexRectangle;->setRect(IIII)V

    iget-object v1, v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexDrawInfo;->mFaceRect:Lcom/nexstreaming/kminternal/nexvideoeditor/NexRectangle;

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getFaceRect()Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->left:I

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getFaceRect()Landroid/graphics/Rect;

    move-result-object v3

    iget v3, v3, Landroid/graphics/Rect;->top:I

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getFaceRect()Landroid/graphics/Rect;

    move-result-object v4

    iget v4, v4, Landroid/graphics/Rect;->right:I

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getFaceRect()Landroid/graphics/Rect;

    move-result-object p1

    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {v1, v2, v3, v4, p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexRectangle;->setRect(IIII)V

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {p1, v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->updateDrawInfo(Lcom/nexstreaming/kminternal/nexvideoeditor/NexDrawInfo;)I

    :cond_0
    return-void
.end method

.method public updateProject()V
    .locals 4

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    if-eqz v0, :cond_1

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexEngine$OverlayCommand;->upload:Lcom/nexstreaming/nexeditorsdk/nexEngine$OverlayCommand;

    invoke-direct {p0, v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->setOverlays(Lcom/nexstreaming/nexeditorsdk/nexEngine$OverlayCommand;)V

    sget-boolean v0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->sLoadListAsync:Z

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->resolveProject(ZZ)I

    move-result v0

    iget v2, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mState:I

    const/4 v3, 0x2

    if-ne v2, v3, :cond_0

    goto :goto_0

    :cond_0
    const/4 v2, 0x1

    if-ne v0, v2, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mProject:Lcom/nexstreaming/nexeditorsdk/nexProject;

    invoke-virtual {v0, v2}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalClipCount(Z)I

    move-result v0

    if-lez v0, :cond_1

    invoke-direct {p0, v1}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->loadEffectsInEditor(Z)V

    :cond_1
    :goto_0
    return-void
.end method

.method public updateProject(Z)Z
    .locals 0

    if-eqz p1, :cond_0

    :try_start_0
    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->updateProject()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const/4 p1, 0x0

    return p1

    :cond_0
    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->updateProject()V

    :goto_0
    const/4 p1, 0x1

    return p1
.end method

.method public updateScreenMode()V
    .locals 3

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexApplicationConfig;->getAspectProfile()Lcom/nexstreaming/nexeditorsdk/nexAspectProfile;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexAspectProfile;->getWidth()I

    move-result v0

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexApplicationConfig;->getAspectProfile()Lcom/nexstreaming/nexeditorsdk/nexAspectProfile;

    move-result-object v1

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexAspectProfile;->getHeight()I

    move-result v1

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexApplicationConfig;->getOverlayCoordinateMode()I

    move-result v2

    invoke-static {v0, v1, v2}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(III)V

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->mVideoEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexApplicationConfig;->getScreenMode()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(I)V

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexApplicationConfig;->getAspectRatio()F

    move-result v0

    invoke-static {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->setAspectRatio(F)V

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->setMark()V

    :cond_0
    return-void
.end method
