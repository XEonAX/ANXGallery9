.class public Lcom/xiaomi/mistatistic/sdk/CustomSettings;
.super Ljava/lang/Object;
.source "CustomSettings.java"


# static fields
.field private static a:Z = false

.field private static b:Z = false

.field private static c:Z = true


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public static isDataUploadingEnabled()Z
    .locals 1

    sget-boolean v0, Lcom/xiaomi/mistatistic/sdk/CustomSettings;->c:Z

    return v0
.end method

.method public static isUseSystemStatService()Z
    .locals 1

    sget-boolean v0, Lcom/xiaomi/mistatistic/sdk/CustomSettings;->b:Z

    return v0
.end method

.method public static isUseSystemUploadingService()Z
    .locals 1

    sget-boolean v0, Lcom/xiaomi/mistatistic/sdk/CustomSettings;->a:Z

    return v0
.end method
