.class public Lcom/xiaomi/micloudsdk/provider/GdprUtils;
.super Ljava/lang/Object;
.source "GdprUtils.java"


# direct methods
.method public static isGdprAvailable(Landroid/content/Context;)Z
    .locals 1

    sget-object v0, Lmiui/cloud/AppConstants;->CLOUD_SDK_LEVEL:Lcom/miui/app/ModuleLevel;

    invoke-virtual {v0, p0}, Lcom/miui/app/ModuleLevel;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    const/16 v0, 0x17

    if-le p0, v0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static isPermissionGranted(Landroid/content/Context;)Z
    .locals 2

    invoke-static {p0}, Lcom/xiaomi/micloudsdk/provider/GdprUtils;->isGdprAvailable(Landroid/content/Context;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    const-string v0, "micloud_gdpr_permission_granted"

    invoke-static {p0, v0, v1}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1

    :cond_1
    return v1
.end method
