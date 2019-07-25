.class public Lcom/miui/gallery/video/editor/manager/SmartVideoJudgeManager;
.super Ljava/lang/Object;
.source "SmartVideoJudgeManager.java"


# static fields
.field private static sLoaded:Z

.field private static final sWhiteList:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 17

    const-string v0, "dipper"

    const-string v1, "ursa"

    const-string v2, "equuleus"

    const-string v3, "perseus"

    const-string v4, "sirius"

    const-string v5, "lavender"

    const-string v6, "cepheus"

    const-string v7, "violet"

    const-string v8, "onc"

    const-string v9, "grus"

    const-string v10, "pyxis"

    const-string v11, "raphael"

    const-string v12, "davinci"

    const-string v13, "davinciin"

    const-string v14, "raphaelin"

    const-string v15, "vela"

    const-string v16, "crux"

    filled-new-array/range {v0 .. v16}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/video/editor/manager/SmartVideoJudgeManager;->sWhiteList:[Ljava/lang/String;

    const/4 v0, 0x0

    sput-boolean v0, Lcom/miui/gallery/video/editor/manager/SmartVideoJudgeManager;->sLoaded:Z

    sget-object v1, Lcom/miui/gallery/video/editor/manager/SmartVideoJudgeManager;->sWhiteList:[Ljava/lang/String;

    array-length v2, v1

    :goto_0
    if-ge v0, v2, :cond_1

    aget-object v3, v1, v0

    sget-object v4, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v3, 0x1

    sput-boolean v3, Lcom/miui/gallery/video/editor/manager/SmartVideoJudgeManager;->sLoaded:Z

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public static isAvailable()Z
    .locals 1

    sget-boolean v0, Lcom/miui/gallery/video/editor/manager/SmartVideoJudgeManager;->sLoaded:Z

    return v0
.end method
