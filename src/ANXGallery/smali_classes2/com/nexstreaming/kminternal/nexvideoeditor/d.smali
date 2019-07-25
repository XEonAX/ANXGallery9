.class public Lcom/nexstreaming/kminternal/nexvideoeditor/d;
.super Ljava/lang/Object;
.source "NexVisualClipChecker.java"


# instance fields
.field private a:I

.field private b:I

.field private c:I

.field private d:I

.field private e:I

.field private f:I

.field private g:I

.field private h:I

.field private i:I

.field private j:Z

.field private k:I

.field private l:I

.field private m:I

.field private n:Z

.field private o:I

.field private p:I

.field private q:I

.field private r:I

.field private s:I

.field private t:I

.field private u:I

.field private v:I

.field private w:I

.field private x:Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Vector<",
            "Landroid/media/CamcorderProfile;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;)V
    .locals 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->a:I

    iput v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->b:I

    iput v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->c:I

    iput v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->d:I

    iput v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->e:I

    iput v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->f:I

    iput v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->g:I

    iput v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->h:I

    iput v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->i:I

    iput-boolean v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->j:Z

    iput v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->k:I

    iput v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->l:I

    iput v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->m:I

    iput-boolean v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->n:Z

    iput v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->o:I

    iput v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->p:I

    iput v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->q:I

    const/16 v1, 0x37

    iput v1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->r:I

    iput v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->s:I

    iput v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->t:I

    iput v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->u:I

    iput v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->v:I

    iput v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->w:I

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->getDeviceProfile()Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;

    move-result-object v1

    invoke-virtual {v1}, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->getMaxCamcorderProfileSizeForUnknownDevice()I

    move-result v2

    if-gtz v2, :cond_1

    const v2, 0x7fffffff

    :cond_1
    const-string v3, "Device_Support_BaselineMaxLevel"

    invoke-virtual {v1, v3, v0}, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->getIntProperty(Ljava/lang/String;I)I

    move-result v3

    iput v3, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->a:I

    const-string v3, "Device_Support_MainMaxLevel"

    invoke-virtual {v1, v3, v0}, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->getIntProperty(Ljava/lang/String;I)I

    move-result v3

    iput v3, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->b:I

    const-string v3, "Device_Support_HighMaxLevel"

    invoke-virtual {v1, v3, v0}, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->getIntProperty(Ljava/lang/String;I)I

    move-result v3

    iput v3, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->c:I

    invoke-virtual {v1}, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->getMCHWAVCDecBaselineSize()I

    move-result v3

    iput v3, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->d:I

    invoke-virtual {v1}, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->getMCHWAVCDecMainSize()I

    move-result v3

    iput v3, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->e:I

    invoke-virtual {v1}, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->getMCHWAVCDecHighSize()I

    move-result v3

    iput v3, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->f:I

    invoke-virtual {v1}, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->isUnknownDevice()Z

    move-result v3

    if-eqz v3, :cond_2

    const-string v3, "MCHWAVCEncBaselineLevelSize"

    invoke-virtual {p1, v3, v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->b(Ljava/lang/String;I)I

    move-result v3

    invoke-static {v2, v3}, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->a(II)I

    move-result v3

    iput v3, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->g:I

    const-string v3, "MCHWAVCEncMainLevelSize"

    invoke-virtual {p1, v3, v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->b(Ljava/lang/String;I)I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v3

    iput v3, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->h:I

    const-string v3, "MCHWAVCEncHighLevelSize"

    invoke-virtual {p1, v3, v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->b(Ljava/lang/String;I)I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    iput v2, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->i:I

    goto :goto_0

    :cond_2
    const-string v2, "MCHWAVCEncBaselineLevelSize"

    invoke-virtual {p1, v2, v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->b(Ljava/lang/String;I)I

    move-result v2

    iput v2, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->g:I

    const-string v2, "MCHWAVCEncMainLevelSize"

    invoke-virtual {p1, v2, v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->b(Ljava/lang/String;I)I

    move-result v2

    iput v2, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->h:I

    const-string v2, "MCHWAVCEncHighLevelSize"

    invoke-virtual {p1, v2, v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->b(Ljava/lang/String;I)I

    move-result v2

    iput v2, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->i:I

    :goto_0
    const-string v2, "canUseMCSoftwareCodec"

    invoke-virtual {p1, v2, v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(Ljava/lang/String;Z)Z

    move-result v2

    iput-boolean v2, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->j:Z

    iget-boolean v2, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->j:Z

    if-eqz v2, :cond_3

    invoke-virtual {v1}, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->getMCSWAVCDecBaselineSize()I

    move-result v2

    iput v2, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->k:I

    invoke-virtual {v1}, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->getMCSWAVCDecMainSize()I

    move-result v2

    iput v2, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->l:I

    invoke-virtual {v1}, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->getMCSWAVCDecHighSize()I

    move-result v2

    iput v2, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->m:I

    :cond_3
    const-string v2, "canUseSoftwareCodec"

    invoke-virtual {p1, v2, v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(Ljava/lang/String;Z)Z

    move-result p1

    iput-boolean p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->n:Z

    iget-boolean p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->n:Z

    if-eqz p1, :cond_4

    invoke-virtual {v1}, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->getNXSWAVCDecBaselineSize()I

    move-result p1

    iput p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->o:I

    invoke-virtual {v1}, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->getNXSWAVCDecMainSize()I

    move-result p1

    iput p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->p:I

    invoke-virtual {v1}, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->getNXSWAVCDecHighSize()I

    move-result p1

    iput p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->q:I

    :cond_4
    invoke-virtual {v1}, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->getMaxSupportedFPS()I

    move-result p1

    iput p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->r:I

    invoke-virtual {v1, v0}, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->getMaxSupportedVideoBitrate(I)I

    move-result p1

    iput p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->u:I

    invoke-virtual {v1, v0}, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->getMaxSupportedAudioSamplingRate(I)I

    move-result p1

    iput p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->v:I

    invoke-virtual {v1, v0}, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->getMaxSupportedAudioChannels(I)I

    move-result p1

    iput p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->w:I

    invoke-virtual {v1}, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->isUnknownDevice()Z

    move-result p1

    if-eqz p1, :cond_5

    iget p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->d:I

    iput p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->s:I

    iget p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->d:I

    iput p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->t:I

    goto :goto_1

    :cond_5
    const/4 p1, 0x1

    invoke-virtual {v1, p1}, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->getMaxImportSize(Z)I

    move-result p1

    iput p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->s:I

    invoke-virtual {v1, v0}, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->getMaxImportSize(Z)I

    move-result p1

    iput p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->t:I

    :goto_1
    new-instance p1, Ljava/util/Vector;

    invoke-direct {p1}, Ljava/util/Vector;-><init>()V

    iput-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->x:Ljava/util/Vector;

    const/4 p1, 0x5

    new-array p1, p1, [I

    fill-array-data p1, :array_0

    :goto_2
    array-length v1, p1

    if-ge v0, v1, :cond_7

    aget v1, p1, v0

    invoke-static {v1}, Landroid/media/CamcorderProfile;->hasProfile(I)Z

    move-result v1

    if-eqz v1, :cond_6

    iget-object v1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->x:Ljava/util/Vector;

    aget v2, p1, v0

    invoke-static {v2}, Landroid/media/CamcorderProfile;->get(I)Landroid/media/CamcorderProfile;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    :cond_6
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_7
    return-void

    :array_0
    .array-data 4
        0x6
        0x5
        0x4
        0x3
        0x7
    .end array-data
.end method

.method private static a(II)I
    .locals 0

    if-nez p0, :cond_0

    return p1

    :cond_0
    if-nez p1, :cond_1

    return p0

    :cond_1
    if-ge p0, p1, :cond_2

    return p0

    :cond_2
    return p1
.end method


# virtual methods
.method public a()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->g:I

    return v0
.end method

.method public a(IIIIIIII)I
    .locals 16

    move-object/from16 v0, p0

    move/from16 v1, p1

    move/from16 v2, p2

    move/from16 v4, p5

    iget v5, v0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->v:I

    if-lez v5, :cond_0

    iget v5, v0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->v:I

    move/from16 v6, p7

    if-ge v5, v6, :cond_0

    const/4 v1, 0x6

    return v1

    :cond_0
    iget-boolean v5, v0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->n:Z

    if-eqz v5, :cond_1

    iget v5, v0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->s:I

    goto :goto_0

    :cond_1
    iget v5, v0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->t:I

    :goto_0
    const/16 v6, 0xff

    const/4 v7, 0x4

    const/4 v8, 0x0

    const/4 v9, 0x2

    const/4 v10, 0x1

    if-ne v1, v6, :cond_6

    mul-int v1, p3, p4

    if-le v1, v5, :cond_4

    iget-boolean v2, v0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->n:Z

    if-eqz v2, :cond_2

    iget v2, v0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->o:I

    goto :goto_1

    :cond_2
    iget v2, v0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->d:I

    :goto_1
    if-le v1, v2, :cond_3

    return v7

    :cond_3
    return v10

    :cond_4
    iget v1, v0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->r:I

    if-le v4, v1, :cond_5

    return v9

    :cond_5
    return v8

    :cond_6
    iget-boolean v6, v0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->n:Z

    if-eqz v6, :cond_7

    iget v6, v0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->o:I

    iget v11, v0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->p:I

    iget v12, v0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->q:I

    goto :goto_2

    :cond_7
    iget v6, v0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->d:I

    iget v11, v0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->e:I

    iget v12, v0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->f:I

    :goto_2
    const/16 v13, 0x42

    const/4 v14, 0x5

    const/4 v15, 0x3

    if-eq v1, v13, :cond_e

    const/16 v6, 0x4d

    if-eq v1, v6, :cond_b

    const/16 v6, 0x64

    if-eq v1, v6, :cond_8

    return v15

    :cond_8
    if-nez v12, :cond_9

    return v15

    :cond_9
    iget v6, v0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->c:I

    if-eqz v6, :cond_a

    iget v6, v0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->c:I

    if-ge v6, v2, :cond_a

    return v14

    :cond_a
    move v6, v12

    goto :goto_3

    :cond_b
    if-nez v11, :cond_c

    return v15

    :cond_c
    iget v6, v0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->b:I

    if-eqz v6, :cond_d

    iget v6, v0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->b:I

    if-ge v6, v2, :cond_d

    return v14

    :cond_d
    move v6, v11

    goto :goto_3

    :cond_e
    iget v11, v0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->a:I

    if-eqz v11, :cond_f

    iget v11, v0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->a:I

    if-ge v11, v2, :cond_f

    return v14

    :cond_f
    :goto_3
    mul-int v2, p3, p4

    if-le v2, v6, :cond_12

    iget-boolean v3, v0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->j:Z

    if-eqz v3, :cond_11

    if-ne v1, v13, :cond_10

    iget v1, v0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->k:I

    if-gt v2, v1, :cond_10

    return v10

    :cond_10
    return v15

    :cond_11
    return v7

    :cond_12
    if-le v2, v5, :cond_13

    return v10

    :cond_13
    iget v1, v0, Lcom/nexstreaming/kminternal/nexvideoeditor/d;->r:I

    if-le v4, v1, :cond_14

    return v9

    :cond_14
    return v8
.end method
