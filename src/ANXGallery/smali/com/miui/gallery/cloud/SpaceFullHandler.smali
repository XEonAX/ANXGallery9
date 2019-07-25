.class public Lcom/miui/gallery/cloud/SpaceFullHandler;
.super Ljava/lang/Object;
.source "SpaceFullHandler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/cloud/SpaceFullHandler$SharerSpaceFullListener;,
        Lcom/miui/gallery/cloud/SpaceFullHandler$OwnerSpaceFullListener;,
        Lcom/miui/gallery/cloud/SpaceFullHandler$SpaceFullListener;
    }
.end annotation


# static fields
.field private static sOwnerSpaceFullListener:Lcom/miui/gallery/cloud/SpaceFullHandler$OwnerSpaceFullListener;

.field private static sSharerSpaceFullListener:Lcom/miui/gallery/cloud/SpaceFullHandler$SharerSpaceFullListener;

.field static sSpaceFullMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/miui/gallery/cloud/SpaceFullHandler;->sSpaceFullMap:Ljava/util/HashMap;

    return-void
.end method

.method public static getOwnerSpaceFullListener()Lcom/miui/gallery/cloud/SpaceFullHandler$OwnerSpaceFullListener;
    .locals 1

    sget-object v0, Lcom/miui/gallery/cloud/SpaceFullHandler;->sOwnerSpaceFullListener:Lcom/miui/gallery/cloud/SpaceFullHandler$OwnerSpaceFullListener;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/cloud/SpaceFullHandler$OwnerSpaceFullListener;

    invoke-direct {v0}, Lcom/miui/gallery/cloud/SpaceFullHandler$OwnerSpaceFullListener;-><init>()V

    sput-object v0, Lcom/miui/gallery/cloud/SpaceFullHandler;->sOwnerSpaceFullListener:Lcom/miui/gallery/cloud/SpaceFullHandler$OwnerSpaceFullListener;

    :cond_0
    sget-object v0, Lcom/miui/gallery/cloud/SpaceFullHandler;->sOwnerSpaceFullListener:Lcom/miui/gallery/cloud/SpaceFullHandler$OwnerSpaceFullListener;

    return-object v0
.end method

.method public static getSharerSpaceFullListener()Lcom/miui/gallery/cloud/SpaceFullHandler$SharerSpaceFullListener;
    .locals 1

    sget-object v0, Lcom/miui/gallery/cloud/SpaceFullHandler;->sSharerSpaceFullListener:Lcom/miui/gallery/cloud/SpaceFullHandler$SharerSpaceFullListener;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/cloud/SpaceFullHandler$SharerSpaceFullListener;

    invoke-direct {v0}, Lcom/miui/gallery/cloud/SpaceFullHandler$SharerSpaceFullListener;-><init>()V

    sput-object v0, Lcom/miui/gallery/cloud/SpaceFullHandler;->sSharerSpaceFullListener:Lcom/miui/gallery/cloud/SpaceFullHandler$SharerSpaceFullListener;

    :cond_0
    sget-object v0, Lcom/miui/gallery/cloud/SpaceFullHandler;->sSharerSpaceFullListener:Lcom/miui/gallery/cloud/SpaceFullHandler$SharerSpaceFullListener;

    return-object v0
.end method

.method public static declared-synchronized isOwnerSpaceFull()Z
    .locals 2

    const-class v0, Lcom/miui/gallery/cloud/SpaceFullHandler;

    monitor-enter v0

    :try_start_0
    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->sGetCloudGallerySpaceFull()Z

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public static declared-synchronized isSharerSpaceFull(Ljava/lang/String;)Z
    .locals 2

    const-class v0, Lcom/miui/gallery/cloud/SpaceFullHandler;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/miui/gallery/cloud/SpaceFullHandler;->sSpaceFullMap:Ljava/util/HashMap;

    invoke-virtual {v1, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return p0

    :cond_0
    const/4 p0, 0x0

    monitor-exit v0

    return p0

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static declared-synchronized removeOwnerSpaceFull()V
    .locals 2

    const-class v0, Lcom/miui/gallery/cloud/SpaceFullHandler;

    monitor-enter v0

    const/4 v1, 0x0

    :try_start_0
    invoke-static {v1}, Lcom/miui/gallery/util/deprecated/Preference;->sSetCloudGallerySpaceFull(Z)V

    invoke-static {v1}, Lcom/miui/gallery/cloud/SpaceFullHandler;->setMiCloudStatusInfoReceiverEnabledSetting(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public static declared-synchronized removeSharerSpaceFull(Ljava/lang/String;)V
    .locals 5

    const-class v0, Lcom/miui/gallery/cloud/SpaceFullHandler;

    monitor-enter v0

    :try_start_0
    new-instance v1, Ljava/lang/Throwable;

    invoke-direct {v1}, Ljava/lang/Throwable;-><init>()V

    invoke-virtual {v1}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v1

    const/4 v2, 0x1

    aget-object v1, v1, v2

    invoke-virtual {v1}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "SpaceFullHandler"

    const-string v3, "%s, remove shareAlbum: %s space full."

    invoke-static {p0}, Lcom/miui/gallery/util/Utils;->desensitizeShareAlbumId(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v1, v4}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    sget-object v1, Lcom/miui/gallery/cloud/SpaceFullHandler;->sSpaceFullMap:Ljava/util/HashMap;

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v1, p0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method private static setMiCloudStatusInfoReceiverEnabledSetting(Z)V
    .locals 4

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    new-instance v1, Landroid/content/ComponentName;

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v2

    const-class v3, Lcom/miui/gallery/cloud/MiCloudStatusInfoReceiver;

    invoke-direct {v1, v2, v3}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/4 v2, 0x1

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x2

    :goto_0
    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->getComponentEnabledSetting(Landroid/content/ComponentName;)I

    move-result v3

    if-eq p0, v3, :cond_1

    invoke-virtual {v0, v1, p0, v2}, Landroid/content/pm/PackageManager;->setComponentEnabledSetting(Landroid/content/ComponentName;II)V

    :cond_1
    return-void
.end method

.method public static declared-synchronized setOwnerSpaceFull()V
    .locals 5

    const-class v0, Lcom/miui/gallery/cloud/SpaceFullHandler;

    monitor-enter v0

    :try_start_0
    new-instance v1, Ljava/lang/Throwable;

    invoke-direct {v1}, Ljava/lang/Throwable;-><init>()V

    invoke-virtual {v1}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v1

    const/4 v2, 0x1

    aget-object v1, v1, v2

    invoke-virtual {v1}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v1

    const-string v3, "SpaceFullHandler"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " set owner space full."

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v2}, Lcom/miui/gallery/util/deprecated/Preference;->sSetCloudGallerySpaceFull(Z)V

    invoke-static {v2}, Lcom/miui/gallery/cloud/SpaceFullHandler;->setMiCloudStatusInfoReceiverEnabledSetting(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public static declared-synchronized setSharerSpaceFull(Ljava/lang/String;)V
    .locals 6

    const-class v0, Lcom/miui/gallery/cloud/SpaceFullHandler;

    monitor-enter v0

    :try_start_0
    new-instance v1, Ljava/lang/Throwable;

    invoke-direct {v1}, Ljava/lang/Throwable;-><init>()V

    invoke-virtual {v1}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v1

    const/4 v2, 0x1

    aget-object v1, v1, v2

    invoke-virtual {v1}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v1

    const-string v3, "SpaceFullHandler"

    const-string v4, "%s, set shareAlbum: %s space full."

    invoke-static {p0}, Lcom/miui/gallery/util/Utils;->desensitizeShareAlbumId(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v1, v5}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    sget-object v1, Lcom/miui/gallery/cloud/SpaceFullHandler;->sSpaceFullMap:Ljava/util/HashMap;

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v1, p0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method
