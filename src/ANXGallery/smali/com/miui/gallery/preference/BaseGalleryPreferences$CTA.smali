.class public Lcom/miui/gallery/preference/BaseGalleryPreferences$CTA;
.super Ljava/lang/Object;
.source "BaseGalleryPreferences.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/preference/BaseGalleryPreferences;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CTA"
.end annotation


# static fields
.field private static sAllowUseOnOfflineGlobal:Z = false

.field private static sCanConnectToNetworkTemp:Z = false


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public static allowUseOnOfflineGlobal()Z
    .locals 1

    sget-boolean v0, Lcom/miui/gallery/preference/BaseGalleryPreferences$CTA;->sAllowUseOnOfflineGlobal:Z

    return v0
.end method

.method public static canConnectNetwork()Z
    .locals 2

    invoke-static {}, Lcom/miui/gallery/util/deprecated/BaseDeprecatedPreference;->sCanConnectNetworkByImpunity()Z

    move-result v0

    const-string v1, "can_connect_network"

    invoke-static {v1, v0}, Lcom/miui/gallery/preference/PreferenceHelper;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_1

    sget-boolean v0, Lcom/miui/gallery/preference/BaseGalleryPreferences$CTA;->sCanConnectToNetworkTemp:Z

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

.method public static remindConnectNetworkEveryTime()Z
    .locals 2

    const-string v0, "impunity_declaration_every_time"

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/miui/gallery/preference/PreferenceHelper;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static setCanConnectNetwork(Z)V
    .locals 2

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eqz p0, :cond_0

    sput-boolean v1, Lcom/miui/gallery/preference/BaseGalleryPreferences$CTA;->sCanConnectToNetworkTemp:Z

    const-string p0, "can_connect_network"

    invoke-static {p0, v0}, Lcom/miui/gallery/preference/PreferenceHelper;->putBoolean(Ljava/lang/String;Z)V

    const-string p0, "impunity_declaration_every_time"

    invoke-static {p0, v1}, Lcom/miui/gallery/preference/PreferenceHelper;->putBoolean(Ljava/lang/String;Z)V

    goto :goto_0

    :cond_0
    sput-boolean v0, Lcom/miui/gallery/preference/BaseGalleryPreferences$CTA;->sCanConnectToNetworkTemp:Z

    const-string p0, "can_connect_network"

    invoke-static {p0, v1}, Lcom/miui/gallery/preference/PreferenceHelper;->putBoolean(Ljava/lang/String;Z)V

    :goto_0
    invoke-static {}, Lcom/miui/gallery/util/StaticContext;->sGetAndroidContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object p0

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.miui.gallery.action.CTA_CHANGED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Landroid/support/v4/content/LocalBroadcastManager;->sendBroadcast(Landroid/content/Intent;)Z

    return-void
.end method

.method public static setCanConnectToNetworkTemp(Z)V
    .locals 0

    sput-boolean p0, Lcom/miui/gallery/preference/BaseGalleryPreferences$CTA;->sCanConnectToNetworkTemp:Z

    return-void
.end method

.method public static setRemindConnectNetworkEveryTime(Z)V
    .locals 1

    const-string v0, "impunity_declaration_every_time"

    invoke-static {v0, p0}, Lcom/miui/gallery/preference/PreferenceHelper;->putBoolean(Ljava/lang/String;Z)V

    if-eqz p0, :cond_0

    const-string p0, "can_connect_network"

    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/miui/gallery/preference/PreferenceHelper;->putBoolean(Ljava/lang/String;Z)V

    :cond_0
    return-void
.end method

.method public static setToAllowUseOnOfflineGlobal(Z)V
    .locals 0

    sput-boolean p0, Lcom/miui/gallery/preference/BaseGalleryPreferences$CTA;->sAllowUseOnOfflineGlobal:Z

    return-void
.end method
