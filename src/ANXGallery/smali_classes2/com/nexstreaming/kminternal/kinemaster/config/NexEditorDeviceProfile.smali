.class public Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;
.super Ljava/lang/Object;
.source "NexEditorDeviceProfile.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile$b;,
        Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile$a;,
        Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile$ProfileSource;,
        Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile$MediaRecordingMode;
    }
.end annotation


# static fields
.field public static final UNKNOWN:I = -0x80000000

.field private static a:Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile; = null

.field private static final b:Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile$b;

.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private final MAX_SUPPORTED_FPS:I

.field private final MEM_1080P_SIZE:I

.field private final MEM_720P_SIZE:I

.field private final MEM_UHD_SIZE:I

.field private final mBoardPlatform:Ljava/lang/String;

.field private final m_MCHWAVCDecBaselineSize:I

.field private final m_MCHWAVCDecHighSize:I

.field private final m_MCHWAVCDecMainSize:I

.field private final m_MCSWAVCDecBaselineSize:I

.field private final m_MCSWAVCDecHighSize:I

.field private final m_MCSWAVCDecMainSize:I

.field private final m_NXSWAVCDecBaselineSize:I

.field private final m_NXSWAVCDecHighSize:I

.field private final m_NXSWAVCDecMainSize:I

.field private m_actualSupportedExportProfilesHW:[Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;

.field private m_actualSupportedExportProfilesSW:[Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;

.field private final m_audioCodecCount:I

.field private m_bSetUserConfig:Z

.field private final m_deviceMaxGamma:I

.field private final m_deviceMaxLightLevel:I

.field private final m_dsr:Lcom/nexstreaming/app/common/tracelog/DeviceSupportResponse;

.field private final m_enableProjectProtection:Z

.field private final m_exportExtraProfilesHW:[Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;

.field private final m_exportExtraProfilesSW:[Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;

.field private final m_exportProfilesHW:[Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;

.field private final m_exportProfilesSW:[Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;

.field private m_extraDurationForSplit:I

.field private final m_forceDirectExport:I

.field private m_fullHDMaxTransitionTime:I

.field private final m_glDepthBufferBits:I

.field private final m_glMultisample:Z

.field private final m_hardwareCodecMemSize:I

.field private final m_hardwareDecMaxCount:I

.field private final m_hardwareEncMaxCount:I

.field private final m_imageRecording:Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile$MediaRecordingMode;

.field private final m_limitTextInputHeight:Z

.field private final m_matchInfo:Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile$a;

.field private m_maxCamcorderProfileSizeForUnknownDevice:I

.field private final m_maxImportHWSize:I

.field private final m_maxImportSWSize:I

.field private m_maxSupportedFPS:I

.field private m_maxSupportedResolution:I

.field private final m_nativeLogLevel:I

.field private final m_needSeekBeforeFastPreview:Z

.field private final m_profileSource:Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile$ProfileSource;

.field private final m_properties:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final m_support:Z

.field private final m_supportAVC:Z

.field private final m_supportIfUpgradeVersion:I

.field private final m_supportMPEGV4:Z

.field private final m_supportedTimeCheker:I

.field private m_transcodeProfile:Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;

.field private final m_useEditorView:Z

.field private final m_useNativeMediaDB:Z

.field private final m_usedContext:Z

.field private final m_usedDSR:Z

.field private final m_videoRecording:Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile$MediaRecordingMode;

.field private final m_visualMediaFromKineMasterFolderOnly:Z


# direct methods
.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile$b;

    const/16 v1, 0x780

    const/16 v2, 0x440

    invoke-direct {v0, v1, v2}, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile$b;-><init>(II)V

    sput-object v0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->b:Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile$b;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;Lcom/nexstreaming/app/common/tracelog/DeviceSupportResponse;[I)V
    .locals 12

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const v0, 0x7f8000

    iput v0, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->MEM_UHD_SIZE:I

    const v1, 0x1fe000

    iput v1, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->MEM_1080P_SIZE:I

    const v1, 0xe1000

    iput v1, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->MEM_720P_SIZE:I

    const/16 v1, 0x78

    iput v1, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->MAX_SUPPORTED_FPS:I

    const/4 v2, 0x0

    iput v2, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_extraDurationForSplit:I

    const v3, 0x205800

    iput v3, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_maxCamcorderProfileSizeForUnknownDevice:I

    const/4 v3, 0x0

    iput-object v3, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_actualSupportedExportProfilesSW:[Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;

    iput-object v3, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_actualSupportedExportProfilesHW:[Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;

    iput-object v3, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_transcodeProfile:Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;

    const/4 v4, 0x1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    iput-boolean p1, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_usedContext:Z

    if-eqz p2, :cond_1

    const/4 p1, 0x1

    goto :goto_1

    :cond_1
    const/4 p1, 0x0

    :goto_1
    iput-boolean p1, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_usedDSR:Z

    const-string p1, "NexEditorDeviceProfile"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Building device profile : hasContext="

    invoke-virtual {p2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v5, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_usedContext:Z

    invoke-virtual {p2, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lcom/nexstreaming/app/common/util/o;->b()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->mBoardPlatform:Ljava/lang/String;

    iput-object v3, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_dsr:Lcom/nexstreaming/app/common/tracelog/DeviceSupportResponse;

    sget-object p1, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile$MediaRecordingMode;->UseKineMaster:Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile$MediaRecordingMode;

    iput-object p1, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_videoRecording:Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile$MediaRecordingMode;

    sget-object p1, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile$MediaRecordingMode;->UseNative:Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile$MediaRecordingMode;

    iput-object p1, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_imageRecording:Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile$MediaRecordingMode;

    iput v2, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_supportIfUpgradeVersion:I

    iput-boolean v4, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_useNativeMediaDB:Z

    iput-boolean v4, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_needSeekBeforeFastPreview:Z

    iput-boolean v2, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_limitTextInputHeight:Z

    const/16 p1, 0x10

    iput p1, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_glDepthBufferBits:I

    iput-boolean v4, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_glMultisample:Z

    iput-boolean v2, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_useEditorView:Z

    iput-boolean v4, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_supportAVC:Z

    iput-boolean v4, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_support:Z

    const/4 p1, -0x1

    iput p1, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_audioCodecCount:I

    iput-object v3, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_matchInfo:Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile$a;

    if-nez p3, :cond_2

    iput-boolean v2, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_bSetUserConfig:Z

    goto :goto_3

    :cond_2
    aget p1, p3, v2

    if-ne p1, v4, :cond_3

    const/4 p1, 0x1

    goto :goto_2

    :cond_3
    const/4 p1, 0x0

    :goto_2
    iput-boolean p1, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_bSetUserConfig:Z

    :goto_3
    if-nez p3, :cond_4

    iput v0, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_hardwareCodecMemSize:I

    goto :goto_4

    :cond_4
    aget p1, p3, v4

    iput p1, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_hardwareCodecMemSize:I

    :goto_4
    const/4 p1, 0x2

    if-nez p3, :cond_5

    iput p1, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_hardwareDecMaxCount:I

    goto :goto_5

    :cond_5
    aget p2, p3, p1

    iput p2, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_hardwareDecMaxCount:I

    :goto_5
    const/4 p2, 0x3

    if-nez p3, :cond_6

    iput v1, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_maxSupportedFPS:I

    goto :goto_6

    :cond_6
    aget v1, p3, p2

    iput v1, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_maxSupportedFPS:I

    :goto_6
    const/4 v1, 0x4

    if-nez p3, :cond_7

    iput-boolean v2, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_supportMPEGV4:Z

    goto :goto_8

    :cond_7
    aget v5, p3, v1

    if-nez v5, :cond_8

    const/4 v5, 0x0

    goto :goto_7

    :cond_8
    const/4 v5, 0x1

    :goto_7
    iput-boolean v5, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_supportMPEGV4:Z

    :goto_8
    const/4 v5, 0x5

    if-nez p3, :cond_9

    iput v0, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_maxSupportedResolution:I

    goto :goto_9

    :cond_9
    aget v0, p3, v5

    iput v0, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_maxSupportedResolution:I

    :goto_9
    const/4 v0, 0x6

    if-nez p3, :cond_a

    iput v2, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_forceDirectExport:I

    goto :goto_a

    :cond_a
    aget v6, p3, v0

    iput v6, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_forceDirectExport:I

    :goto_a
    if-nez p3, :cond_b

    iput p1, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_nativeLogLevel:I

    goto :goto_b

    :cond_b
    const/4 v6, 0x7

    aget v6, p3, v6

    iput v6, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_nativeLogLevel:I

    :goto_b
    if-nez p3, :cond_c

    iput v4, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_supportedTimeCheker:I

    goto :goto_c

    :cond_c
    const/16 v6, 0x8

    aget v6, p3, v6

    iput v6, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_supportedTimeCheker:I

    :goto_c
    const/16 v6, 0x226

    if-nez p3, :cond_d

    iput v6, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_deviceMaxLightLevel:I

    goto :goto_d

    :cond_d
    const/16 v7, 0x9

    aget v7, p3, v7

    iput v7, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_deviceMaxLightLevel:I

    :goto_d
    if-nez p3, :cond_e

    iput v6, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_deviceMaxGamma:I

    goto :goto_e

    :cond_e
    const/16 v6, 0xa

    aget p3, p3, v6

    iput p3, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_deviceMaxGamma:I

    :goto_e
    const-string p3, "NexEditorDeviceProfile"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "User set supportMPEGV4 = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v7, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_supportMPEGV4:Z

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {p3, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string p3, "NexEditorDeviceProfile"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "User set hardwareDecMaxCount = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v7, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_hardwareDecMaxCount:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {p3, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string p3, "NexEditorDeviceProfile"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "User set maxSupportedFPS = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v7, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_maxSupportedFPS:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {p3, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string p3, "NexEditorDeviceProfile"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "User set hardwareCodecMemSize = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v7, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_hardwareCodecMemSize:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {p3, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string p3, "NexEditorDeviceProfile"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "User set maxSupportedResolution = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v7, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_maxSupportedResolution:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {p3, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string p3, "NexEditorDeviceProfile"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "User set forceDirectExport = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v7, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_forceDirectExport:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {p3, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string p3, "NexEditorDeviceProfile"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "User set m_nativeLogLevel = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v7, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_nativeLogLevel:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {p3, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string p3, "NexEditorDeviceProfile"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "User set m_supportedTimeCheker = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v7, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_supportedTimeCheker:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {p3, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string p3, "NexEditorDeviceProfile"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "User set device LightLevel = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v7, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_deviceMaxLightLevel:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v7, ", Gamma="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v7, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_deviceMaxGamma:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {p3, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iput v4, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_hardwareEncMaxCount:I

    const/high16 p3, -0x80000000

    iput p3, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_maxImportSWSize:I

    iput p3, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_maxImportHWSize:I

    iput p3, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_NXSWAVCDecBaselineSize:I

    iput p3, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_NXSWAVCDecMainSize:I

    iput p3, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_NXSWAVCDecHighSize:I

    iput p3, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_MCSWAVCDecBaselineSize:I

    iput p3, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_MCSWAVCDecMainSize:I

    iput p3, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_MCSWAVCDecHighSize:I

    iput p3, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_MCHWAVCDecBaselineSize:I

    iput p3, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_MCHWAVCDecMainSize:I

    iput p3, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_MCHWAVCDecHighSize:I

    iput-object v3, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_exportProfilesSW:[Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;

    iput-object v3, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_exportProfilesHW:[Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;

    const p3, 0x7fffffff

    iput p3, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_fullHDMaxTransitionTime:I

    sget-object p3, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile$ProfileSource;->Unknown:Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile$ProfileSource;

    iput-object p3, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_profileSource:Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile$ProfileSource;

    new-instance p3, Ljava/util/HashMap;

    invoke-direct {p3}, Ljava/util/HashMap;-><init>()V

    iput-object p3, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_properties:Ljava/util/Map;

    const-string p3, "Xiaomi"

    const-string v3, "Xiaomi"

    invoke-virtual {p3, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-nez p3, :cond_12

    new-array p3, v0, [I

    fill-array-data p3, :array_0

    const/4 v0, 0x0

    const/4 v3, 0x0

    :goto_f
    array-length v6, p3

    if-ge v0, v6, :cond_11

    aget v6, p3, v0

    invoke-static {v6}, Landroid/media/CamcorderProfile;->hasProfile(I)Z

    move-result v6

    if-eqz v6, :cond_10

    aget v6, p3, v0

    invoke-static {v6}, Landroid/media/CamcorderProfile;->get(I)Landroid/media/CamcorderProfile;

    move-result-object v6

    if-nez v6, :cond_f

    goto :goto_10

    :cond_f
    iget v7, v6, Landroid/media/CamcorderProfile;->videoFrameHeight:I

    add-int/lit8 v7, v7, 0x1f

    and-int/lit8 v7, v7, -0x10

    iget v8, v6, Landroid/media/CamcorderProfile;->videoFrameWidth:I

    mul-int v8, v8, v7

    if-le v8, v3, :cond_10

    iget v3, v6, Landroid/media/CamcorderProfile;->videoFrameWidth:I

    mul-int v3, v3, v7

    const-string v8, "NexEditorDeviceProfile"

    const-string v9, "bestCamcorderProfileSize(%d), Width(%d), Height(%d/%d), Project=[%s]"

    new-array v10, v5, [Ljava/lang/Object;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v10, v2

    iget v11, v6, Landroid/media/CamcorderProfile;->videoFrameWidth:I

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v10, v4

    iget v6, v6, Landroid/media/CamcorderProfile;->videoFrameHeight:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v10, p1

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v10, p2

    const-string v6, "Xiaomi"

    aput-object v6, v10, v1

    invoke-static {v9, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v8, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_10
    :goto_10
    add-int/lit8 v0, v0, 0x1

    goto :goto_f

    :cond_11
    iput v3, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_maxCamcorderProfileSizeForUnknownDevice:I

    :cond_12
    new-array p1, v4, [Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;

    sget-object p2, Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;->EXPORT_320_180:Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;

    aput-object p2, p1, v2

    iput-object p1, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_exportExtraProfilesSW:[Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;

    new-array p1, v4, [Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;

    sget-object p2, Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;->EXPORT_320_180:Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;

    aput-object p2, p1, v2

    iput-object p1, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_exportExtraProfilesHW:[Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;

    iput-boolean v2, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_enableProjectProtection:Z

    iput-boolean v2, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_visualMediaFromKineMasterFolderOnly:Z

    return-void

    :array_0
    .array-data 4
        0x1
        0x6
        0x5
        0x4
        0x3
        0x7
    .end array-data
.end method

.method private a(ILjava/lang/String;Ljava/lang/String;)I
    .locals 1

    const/high16 v0, -0x80000000

    if-ne p1, v0, :cond_4

    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/config/EditorGlobal;->a()Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    move-result-object p1

    if-nez p1, :cond_0

    iget p1, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_maxCamcorderProfileSizeForUnknownDevice:I

    return p1

    :cond_0
    const/4 v0, 0x0

    if-eqz p2, :cond_1

    invoke-virtual {p1, p2, v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(Ljava/lang/String;Z)Z

    move-result p2

    if-nez p2, :cond_1

    return v0

    :cond_1
    if-eqz p3, :cond_3

    iget p2, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_maxCamcorderProfileSizeForUnknownDevice:I

    if-gtz p2, :cond_2

    invoke-virtual {p1, p3, v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->b(Ljava/lang/String;I)I

    move-result p1

    return p1

    :cond_2
    iget p2, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_maxCamcorderProfileSizeForUnknownDevice:I

    invoke-virtual {p1, p3, v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->b(Ljava/lang/String;I)I

    move-result p1

    invoke-static {p2, p1}, Ljava/lang/Math;->min(II)I

    move-result p1

    return p1

    :cond_3
    return v0

    :cond_4
    return p1
.end method

.method private a(Ljava/lang/String;)Z
    .locals 1

    const/4 v0, 0x1

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    if-ge p1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :cond_1
    :goto_0
    return v0
.end method

.method private a([Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;Z)[Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;
    .locals 8

    new-instance v0, Ljava/util/ArrayList;

    array-length v1, p1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {p0, p2}, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->getMaxImportSize(Z)I

    move-result p2

    array-length v1, p1

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_3

    aget-object v4, p1, v3

    invoke-virtual {v4}, Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;->width()I

    move-result v5

    invoke-virtual {v4}, Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;->height()I

    move-result v6

    add-int/lit8 v6, v6, -0x1f

    mul-int v5, v5, v6

    if-gt v5, p2, :cond_0

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_0
    if-eqz v2, :cond_1

    invoke-virtual {v2}, Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;->width()I

    move-result v5

    invoke-virtual {v2}, Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;->height()I

    move-result v6

    mul-int v5, v5, v6

    invoke-virtual {v4}, Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;->width()I

    move-result v6

    invoke-virtual {v4}, Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;->height()I

    move-result v7

    mul-int v6, v6, v7

    if-le v5, v6, :cond_2

    :cond_1
    move-object v2, v4

    :cond_2
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_3
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result p1

    const/4 p2, 0x1

    if-ge p1, p2, :cond_4

    if-eqz v2, :cond_4

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_4
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result p1

    new-array p1, p1, [Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;

    invoke-interface {v0, p1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;

    return-object p1
.end method

.method static synthetic access$000(Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;Ljava/lang/String;)Z
    .locals 0

    invoke-direct {p0, p1}, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->a(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public static getDeviceProfile()Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;
    .locals 2

    sget-object v0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->a:Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;

    if-nez v0, :cond_0

    new-instance v0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;

    const/4 v1, 0x0

    invoke-direct {v0, v1, v1, v1}, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;-><init>(Landroid/content/Context;Lcom/nexstreaming/app/common/tracelog/DeviceSupportResponse;[I)V

    sput-object v0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->a:Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;

    :cond_0
    sget-object v0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->a:Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;

    return-object v0
.end method

.method public static setAppContext(Landroid/content/Context;[I)V
    .locals 2

    sget-object v0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->a:Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;

    if-eqz v0, :cond_1

    sget-object v0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->a:Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;

    iget-boolean v0, v0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_usedContext:Z

    if-nez v0, :cond_0

    sget-object v0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->a:Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;

    iget-boolean v0, v0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_usedDSR:Z

    if-eqz v0, :cond_1

    :cond_0
    return-void

    :cond_1
    new-instance v0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1, p1}, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;-><init>(Landroid/content/Context;Lcom/nexstreaming/app/common/tracelog/DeviceSupportResponse;[I)V

    sput-object v0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->a:Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;

    return-void
.end method

.method public static setDeviceSupportResponse(Lcom/nexstreaming/app/common/tracelog/DeviceSupportResponse;)V
    .locals 2

    sget-object v0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->a:Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->a:Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;

    iget-boolean v0, v0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_usedDSR:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;

    const/4 v1, 0x0

    invoke-direct {v0, v1, p0, v1}, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;-><init>(Landroid/content/Context;Lcom/nexstreaming/app/common/tracelog/DeviceSupportResponse;[I)V

    sput-object v0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->a:Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;

    return-void
.end method


# virtual methods
.method public allowOverlappingVideo()Z
    .locals 2

    invoke-virtual {p0}, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->getHardwareDecMaxCount()I

    move-result v0

    const/4 v1, 0x2

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getAVCSupported()Z
    .locals 1

    iget-boolean v0, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_supportAVC:Z

    return v0
.end method

.method public getAudioCodecMaxCount()I
    .locals 2

    iget v0, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_audioCodecCount:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    const v0, 0x7fffffff

    return v0

    :cond_0
    iget v0, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_audioCodecCount:I

    if-gez v0, :cond_1

    const/4 v0, 0x0

    return v0

    :cond_1
    iget v0, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_audioCodecCount:I

    return v0
.end method

.method public getBooleanProperty(Ljava/lang/String;Z)Z
    .locals 2

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_properties:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_properties:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    const-string v1, "true"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    const-string v0, "false"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 p1, 0x0

    return p1

    :cond_1
    return p2

    :cond_2
    return p2
.end method

.method public getDSR()Lcom/nexstreaming/app/common/tracelog/DeviceSupportResponse;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_dsr:Lcom/nexstreaming/app/common/tracelog/DeviceSupportResponse;

    return-object v0
.end method

.method public getDefaultExportProfile(Z)Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;
    .locals 7

    invoke-virtual {p0, p1}, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->getSupportedExportProfiles(Z)[Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;

    move-result-object p1

    array-length v0, p1

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_1

    aget-object v3, p1, v2

    invoke-virtual {v3}, Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;->height()I

    move-result v4

    const/16 v5, 0x2d0

    if-eq v4, v5, :cond_2

    invoke-virtual {v3}, Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;->height()I

    move-result v4

    const/16 v5, 0x2e0

    if-ne v4, v5, :cond_0

    goto :goto_1

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    const/4 v3, 0x0

    :cond_2
    :goto_1
    if-nez v3, :cond_4

    array-length v0, p1

    const/4 v2, 0x0

    :goto_2
    if-ge v2, v0, :cond_4

    aget-object v4, p1, v2

    invoke-virtual {v4}, Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;->height()I

    move-result v5

    const/16 v6, 0x438

    if-ne v5, v6, :cond_3

    invoke-virtual {v4}, Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;->height()I

    move-result v5

    const/16 v6, 0x440

    if-ne v5, v6, :cond_3

    move-object v3, v4

    goto :goto_3

    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    :cond_4
    :goto_3
    if-nez v3, :cond_5

    aget-object v3, p1, v1

    :cond_5
    return-object v3
.end method

.method public getDeviceMaxGamma()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_deviceMaxGamma:I

    return v0
.end method

.method public getDeviceMaxLightLevel()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_deviceMaxLightLevel:I

    return v0
.end method

.method public getEnableProjectProtection()Z
    .locals 1

    iget-boolean v0, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_enableProjectProtection:Z

    return v0
.end method

.method public getExtraDurationForSplit()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_extraDurationForSplit:I

    return v0
.end method

.method public getForceDirectExport()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_forceDirectExport:I

    return v0
.end method

.method public getFullHDMaxTransitionTime()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_fullHDMaxTransitionTime:I

    return v0
.end method

.method public getGLDepthBufferBits()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_glDepthBufferBits:I

    return v0
.end method

.method public getGLMultisample()Z
    .locals 1

    iget-boolean v0, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_glMultisample:Z

    return v0
.end method

.method public getHardwareCodecMemSize()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_hardwareCodecMemSize:I

    return v0
.end method

.method public getHardwareDecMaxCount()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_hardwareDecMaxCount:I

    return v0
.end method

.method public getHardwareEncMaxCount()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_hardwareEncMaxCount:I

    return v0
.end method

.method public getImageRecordingMode()Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile$MediaRecordingMode;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_imageRecording:Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile$MediaRecordingMode;

    return-object v0
.end method

.method public getIntProperty(Ljava/lang/String;I)I
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_properties:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_properties:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    :catch_0
    return p2

    :cond_0
    return p2
.end method

.method public getIsDeviceSupported()Z
    .locals 2

    iget-boolean v0, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_support:Z

    if-eqz v0, :cond_2

    iget v0, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_audioCodecCount:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    iget v0, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_audioCodecCount:I

    const/4 v1, 0x6

    if-lt v0, v1, :cond_2

    :cond_0
    invoke-virtual {p0}, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->getAVCSupported()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->getMPEGV4Supported()Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_1
    const/4 v0, 0x1

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getLimitTextInputHeight()Z
    .locals 1

    iget-boolean v0, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_limitTextInputHeight:Z

    return v0
.end method

.method public getLongProperty(Ljava/lang/String;J)J
    .locals 2

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_properties:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_properties:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return-wide v0

    :catch_0
    return-wide p2

    :cond_0
    return-wide p2
.end method

.method public getMCHWAVCDecBaselineSize()I
    .locals 3

    iget v0, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_MCHWAVCDecBaselineSize:I

    const-string v1, "MCHWAVCDecBaselineLevelSize"

    const/4 v2, 0x0

    invoke-direct {p0, v0, v2, v1}, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->a(ILjava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getMCHWAVCDecHighSize()I
    .locals 3

    iget v0, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_MCHWAVCDecHighSize:I

    const-string v1, "MCHWAVCDecHighLevelSize"

    const/4 v2, 0x0

    invoke-direct {p0, v0, v2, v1}, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->a(ILjava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getMCHWAVCDecMainSize()I
    .locals 3

    iget v0, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_MCHWAVCDecMainSize:I

    const-string v1, "MCHWAVCDecMainLevelSize"

    const/4 v2, 0x0

    invoke-direct {p0, v0, v2, v1}, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->a(ILjava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getMCSWAVCDecBaselineSize()I
    .locals 3

    iget v0, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_MCSWAVCDecBaselineSize:I

    const-string v1, "canUseMCSoftwareCodec"

    const-string v2, "MCSWAVCDecBaselineLevelSize"

    invoke-direct {p0, v0, v1, v2}, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->a(ILjava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getMCSWAVCDecHighSize()I
    .locals 3

    iget v0, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_MCSWAVCDecHighSize:I

    const-string v1, "canUseMCSoftwareCodec"

    const-string v2, "MCSWAVCDecMainLevelSize"

    invoke-direct {p0, v0, v1, v2}, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->a(ILjava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getMCSWAVCDecMainSize()I
    .locals 3

    iget v0, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_MCSWAVCDecMainSize:I

    const-string v1, "canUseMCSoftwareCodec"

    const-string v2, "MCSWAVCDecMainLevelSize"

    invoke-direct {p0, v0, v1, v2}, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->a(ILjava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getMPEGV4Supported()Z
    .locals 1

    iget-boolean v0, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_supportMPEGV4:Z

    return v0
.end method

.method public getMatchInfo()Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile$a;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_matchInfo:Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile$a;

    return-object v0
.end method

.method public getMaxCamcorderProfileSizeForUnknownDevice()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_maxCamcorderProfileSizeForUnknownDevice:I

    return v0
.end method

.method public getMaxImportSize(Z)I
    .locals 0

    if-eqz p1, :cond_0

    iget p1, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_maxImportSWSize:I

    goto :goto_0

    :cond_0
    iget p1, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_maxImportHWSize:I

    :goto_0
    return p1
.end method

.method public getMaxResolution()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_maxSupportedResolution:I

    return v0
.end method

.method public getMaxSpeedCtrlValue(II)I
    .locals 1

    mul-int p1, p1, p2

    iget p2, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_maxImportHWSize:I

    const/16 v0, 0x96

    if-gt p1, p2, :cond_0

    return v0

    :cond_0
    const p2, 0xe6000

    if-le p1, p2, :cond_1

    const/16 p1, 0x64

    return p1

    :cond_1
    return v0
.end method

.method public getMaxSupportedAudioChannels(I)I
    .locals 1

    const-string v0, "max_supported_audio_channels"

    invoke-virtual {p0, v0, p1}, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->getIntProperty(Ljava/lang/String;I)I

    move-result p1

    return p1
.end method

.method public getMaxSupportedAudioSamplingRate(I)I
    .locals 1

    const-string v0, "max_supported_audio_samplingrate"

    invoke-virtual {p0, v0, p1}, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->getIntProperty(Ljava/lang/String;I)I

    move-result p1

    return p1
.end method

.method public getMaxSupportedFPS()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_maxSupportedFPS:I

    return v0
.end method

.method public getMaxSupportedVideoBitrate(I)I
    .locals 1

    const-string v0, "max_supported_video_bitrate"

    invoke-virtual {p0, v0, p1}, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->getIntProperty(Ljava/lang/String;I)I

    move-result p1

    return p1
.end method

.method public getMinSpeedCtrlValue()I
    .locals 1

    const/16 v0, 0x19

    return v0
.end method

.method public getNXSWAVCDecBaselineSize()I
    .locals 3

    iget v0, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_NXSWAVCDecBaselineSize:I

    const-string v1, "canUseSoftwareCodec"

    const-string v2, "NXSWAVCDecBaselineLevelSize"

    invoke-direct {p0, v0, v1, v2}, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->a(ILjava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getNXSWAVCDecHighSize()I
    .locals 3

    iget v0, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_NXSWAVCDecHighSize:I

    const-string v1, "canUseSoftwareCodec"

    const-string v2, "NXSWAVCDecHighLevelSize"

    invoke-direct {p0, v0, v1, v2}, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->a(ILjava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getNXSWAVCDecMainSize()I
    .locals 3

    iget v0, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_NXSWAVCDecMainSize:I

    const-string v1, "canUseSoftwareCodec"

    const-string v2, "NXSWAVCDecMainLevelSize"

    invoke-direct {p0, v0, v1, v2}, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->a(ILjava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getNativeLogLevel()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_nativeLogLevel:I

    return v0
.end method

.method public getNeedSeekBeforeFastPreview()Z
    .locals 1

    iget-boolean v0, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_needSeekBeforeFastPreview:Z

    return v0
.end method

.method public getNeedsColorFormatCheck()Z
    .locals 4

    invoke-virtual {p0}, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->isUnknownDevice()Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x11

    if-gt v0, v3, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->mBoardPlatform:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v0, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    const-string v3, "exynos"

    invoke-virtual {v0, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    return v1

    :cond_0
    return v2

    :cond_1
    const-string v0, "chk_color_fmt"

    invoke-virtual {p0, v0, v2}, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->getIntProperty(Ljava/lang/String;I)I

    move-result v0

    if-ne v0, v1, :cond_2

    goto :goto_0

    :cond_2
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public getProfileSource()Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile$ProfileSource;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_profileSource:Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile$ProfileSource;

    return-object v0
.end method

.method public getStringProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_properties:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p2, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_properties:Ljava/util/Map;

    invoke-interface {p2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    return-object p1

    :cond_0
    return-object p2
.end method

.method public getSupportIfUpgradeVersion()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_supportIfUpgradeVersion:I

    return v0
.end method

.method public getSupportedExportProfiles(Z)[Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;
    .locals 2

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_actualSupportedExportProfilesSW:[Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_actualSupportedExportProfilesHW:[Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;

    :goto_0
    if-eqz v0, :cond_1

    invoke-direct {p0, v0, p1}, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->a([Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;Z)[Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;

    move-result-object p1

    return-object p1

    :cond_1
    if-eqz p1, :cond_2

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_exportProfilesSW:[Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;

    goto :goto_1

    :cond_2
    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_exportProfilesHW:[Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;

    :goto_1
    if-nez v0, :cond_4

    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/config/EditorGlobal;->a()Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    move-result-object v0

    if-nez v0, :cond_3

    const/4 v0, 0x0

    new-array v0, v0, [Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;

    goto :goto_2

    :cond_3
    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->j()Lcom/nexstreaming/kminternal/nexvideoeditor/d;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->a()I

    move-result v0

    invoke-static {v0}, Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;->getExportProfiles(I)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    new-array v1, v1, [Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;

    :cond_4
    :goto_2
    if-eqz p1, :cond_5

    iput-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_actualSupportedExportProfilesSW:[Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;

    goto :goto_3

    :cond_5
    iput-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_actualSupportedExportProfilesHW:[Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;

    :goto_3
    invoke-direct {p0, v0, p1}, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->a([Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;Z)[Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;

    move-result-object p1

    return-object p1
.end method

.method public getSupportedExtraProfiles(Z)[Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;
    .locals 0

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_exportExtraProfilesSW:[Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;

    return-object p1

    :cond_0
    iget-object p1, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_exportExtraProfilesHW:[Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;

    return-object p1
.end method

.method public getSupportedTimeCheker()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_supportedTimeCheker:I

    return v0
.end method

.method public getTranscodeMaxInputResolution(Z)Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile$b;
    .locals 0

    sget-object p1, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->b:Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile$b;

    return-object p1
.end method

.method public getTranscodeProfile(Z)Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;
    .locals 6

    invoke-virtual {p0, p1}, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->getMaxImportSize(Z)I

    move-result v0

    iget-object v1, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_transcodeProfile:Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;

    if-nez v1, :cond_4

    invoke-virtual {p0, p1}, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->getSupportedExportProfiles(Z)[Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;

    move-result-object p1

    array-length v1, p1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_4

    aget-object v3, p1, v2

    invoke-virtual {v3}, Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;->width()I

    move-result v4

    invoke-virtual {v3}, Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;->height()I

    move-result v5

    add-int/lit8 v5, v5, -0x1f

    mul-int v4, v4, v5

    if-le v4, v0, :cond_0

    goto :goto_1

    :cond_0
    invoke-virtual {v3}, Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;->width()I

    move-result v4

    const/16 v5, 0x780

    if-gt v4, v5, :cond_3

    invoke-virtual {v3}, Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;->height()I

    move-result v4

    const/16 v5, 0x440

    if-le v4, v5, :cond_1

    goto :goto_1

    :cond_1
    iget-object v4, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_transcodeProfile:Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;

    if-eqz v4, :cond_2

    iget-object v4, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_transcodeProfile:Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;

    invoke-virtual {v4}, Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;->height()I

    move-result v4

    invoke-virtual {v3}, Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;->height()I

    move-result v5

    if-ge v4, v5, :cond_3

    :cond_2
    iput-object v3, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_transcodeProfile:Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;

    :cond_3
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_4
    iget-object p1, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_transcodeProfile:Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;

    if-eqz p1, :cond_5

    iget-object p1, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_transcodeProfile:Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;

    return-object p1

    :cond_5
    new-instance p1, Ljava/lang/InternalError;

    invoke-direct {p1}, Ljava/lang/InternalError;-><init>()V

    throw p1
.end method

.method public getTranscodeProfile(ZII)Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;
    .locals 9

    mul-int v0, p2, p3

    if-eqz p1, :cond_0

    iget v1, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_maxImportSWSize:I

    goto :goto_0

    :cond_0
    iget v1, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_maxImportHWSize:I

    :goto_0
    const/4 v2, 0x0

    invoke-virtual {p0, p1}, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->getMaxImportSize(Z)I

    move-result v3

    invoke-virtual {p0, p1}, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->getSupportedExportProfiles(Z)[Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;

    move-result-object p1

    array-length v4, p1

    const/4 v5, 0x0

    :goto_1
    if-ge v5, v4, :cond_3

    aget-object v6, p1, v5

    invoke-virtual {v6}, Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;->width()I

    move-result v7

    invoke-virtual {v6}, Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;->height()I

    move-result v8

    add-int/lit8 v8, v8, -0x1f

    mul-int v7, v7, v8

    if-le v7, v3, :cond_1

    goto :goto_2

    :cond_1
    invoke-virtual {v6}, Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;->width()I

    move-result v7

    invoke-virtual {v6}, Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;->height()I

    move-result v8

    mul-int v7, v7, v8

    mul-int/lit8 v8, v0, 0x69

    div-int/lit8 v8, v8, 0x64

    if-gt v7, v8, :cond_2

    if-gt v7, v1, :cond_2

    move-object v2, v6

    goto :goto_3

    :cond_2
    :goto_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    :cond_3
    :goto_3
    if-nez v2, :cond_4

    invoke-static {p2, p3}, Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;->getExportProfiles(II)Lcom/nexstreaming/kminternal/kinemaster/config/NexExportProfile;

    move-result-object v2

    :cond_4
    if-eqz v2, :cond_5

    return-object v2

    :cond_5
    new-instance p1, Ljava/lang/InternalError;

    invoke-direct {p1}, Ljava/lang/InternalError;-><init>()V

    throw p1
.end method

.method public getUseAndroidJPEGDecoder()Z
    .locals 2

    const-string v0, "use_android_jpeg_dec"

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->getIntProperty(Ljava/lang/String;I)I

    move-result v0

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public getUseEditorView()Z
    .locals 1

    iget-boolean v0, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_useEditorView:Z

    return v0
.end method

.method public getUseMediaExtractor()Z
    .locals 2

    const-string v0, "use_mediaextractor"

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->getIntProperty(Ljava/lang/String;I)I

    move-result v0

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public getUseNativeMediaDB()Z
    .locals 1

    iget-boolean v0, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_useNativeMediaDB:Z

    return v0
.end method

.method public getUserConfigSettings()Z
    .locals 1

    iget-boolean v0, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_bSetUserConfig:Z

    return v0
.end method

.method public getVideoRecordingMode()Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile$MediaRecordingMode;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_videoRecording:Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile$MediaRecordingMode;

    return-object v0
.end method

.method public getVisualMediaFromKineMasterFolderOnly()Z
    .locals 1

    iget-boolean v0, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_visualMediaFromKineMasterFolderOnly:Z

    return v0
.end method

.method public isUnknownDevice()Z
    .locals 2

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->m_profileSource:Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile$ProfileSource;

    sget-object v1, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile$ProfileSource;->Unknown:Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile$ProfileSource;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
