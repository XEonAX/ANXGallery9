.class public Lcom/miui/gallery/Config$SecretAlbumConfig;
.super Ljava/lang/Object;
.source "Config.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/Config;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SecretAlbumConfig"
.end annotation


# direct methods
.method public static getSupportedSpecialTypeFlags(J)J
    .locals 2

    const-wide/16 v0, 0x0

    and-long/2addr p0, v0

    return-wide p0
.end method

.method public static isVideoSupported()Z
    .locals 1

    sget-boolean v0, Lcom/miui/os/Rom;->IS_INTERNATIONAL:Z

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlStrategyHelper;->isGlobalSecretVideoSupported()Z

    move-result v0

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
