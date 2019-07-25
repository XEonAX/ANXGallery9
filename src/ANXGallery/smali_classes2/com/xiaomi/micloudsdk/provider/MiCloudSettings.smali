.class public Lcom/xiaomi/micloudsdk/provider/MiCloudSettings;
.super Ljava/lang/Object;
.source "MiCloudSettings.java"


# direct methods
.method public static getInt(Landroid/content/Context;Ljava/lang/String;I)I
    .locals 2

    sget-object v0, Lmiui/cloud/AppConstants;->CLOUD_SDK_LEVEL:Lcom/miui/app/ModuleLevel;

    invoke-virtual {v0, p0}, Lcom/miui/app/ModuleLevel;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/16 v1, 0x12

    if-lt v0, v1, :cond_0

    invoke-static {p0, p1, p2}, Lcom/xiaomi/micloudsdk/provider/MiCloudSettingsV18;->getInt(Landroid/content/Context;Ljava/lang/String;I)I

    move-result p0

    return p0

    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    invoke-static {p0, p1, p2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result p0

    return p0
.end method

.method public static getString(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    sget-object v0, Lmiui/cloud/AppConstants;->CLOUD_SDK_LEVEL:Lcom/miui/app/ModuleLevel;

    invoke-virtual {v0, p0}, Lcom/miui/app/ModuleLevel;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/16 v1, 0x12

    if-lt v0, v1, :cond_0

    invoke-static {p0, p1}, Lcom/xiaomi/micloudsdk/provider/MiCloudSettingsV18;->getString(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    invoke-static {p0, p1}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static putInt(Landroid/content/Context;Ljava/lang/String;I)Z
    .locals 2

    sget-object v0, Lmiui/cloud/AppConstants;->CLOUD_SDK_LEVEL:Lcom/miui/app/ModuleLevel;

    invoke-virtual {v0, p0}, Lcom/miui/app/ModuleLevel;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/16 v1, 0x12

    if-lt v0, v1, :cond_0

    invoke-static {p0, p1, p2}, Lcom/xiaomi/micloudsdk/provider/MiCloudSettingsV18;->putInt(Landroid/content/Context;Ljava/lang/String;I)Z

    move-result p0

    return p0

    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    invoke-static {p0, p1, p2}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    move-result p0

    return p0
.end method

.method public static putString(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 2

    sget-object v0, Lmiui/cloud/AppConstants;->CLOUD_SDK_LEVEL:Lcom/miui/app/ModuleLevel;

    invoke-virtual {v0, p0}, Lcom/miui/app/ModuleLevel;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/16 v1, 0x12

    if-lt v0, v1, :cond_0

    invoke-static {p0, p1, p2}, Lcom/xiaomi/micloudsdk/provider/MiCloudSettingsV18;->putString(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    return p0

    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    invoke-static {p0, p1, p2}, Landroid/provider/Settings$System;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    return p0
.end method
