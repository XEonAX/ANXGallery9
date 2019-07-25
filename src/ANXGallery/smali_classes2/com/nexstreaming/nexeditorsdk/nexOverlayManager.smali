.class public Lcom/nexstreaming/nexeditorsdk/nexOverlayManager;
.super Ljava/lang/Object;
.source "nexOverlayManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;,
        Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$Overlay;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "nexOverlayManager"

.field private static mAppContext:Landroid/content/Context; = null

.field private static sAutoAspectSelect:Z = true

.field private static sSingleton:Lcom/nexstreaming/nexeditorsdk/nexOverlayManager;


# instance fields
.field private externalView_overlayEntries:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$Overlay;",
            ">;"
        }
    .end annotation
.end field

.field private m_overlayEntryLock:Ljava/lang/Object;

.field private overlayEntries:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$Overlay;",
            ">;"
        }
    .end annotation
.end field

.field private overlayTitle:Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager;->overlayEntries:Ljava/util/List;

    const/4 p2, 0x0

    iput-object p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager;->externalView_overlayEntries:Ljava/util/List;

    iput-object p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager;->overlayTitle:Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;

    new-instance p2, Ljava/lang/Object;

    invoke-direct {p2}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager;->m_overlayEntryLock:Ljava/lang/Object;

    sput-object p1, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager;->mAppContext:Landroid/content/Context;

    return-void
.end method

.method private AssetPackageJsonToString(Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    invoke-static {}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->a()Lcom/nexstreaming/app/common/nexasset/assetpackage/c;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->c(Ljava/lang/String;)Lcom/nexstreaming/app/common/nexasset/assetpackage/f;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const-string v0, "nexOverlayManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "AssetPackageJsonToString info fail="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-object v1

    :cond_0
    invoke-static {}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->a()Lcom/nexstreaming/app/common/nexasset/assetpackage/c;

    move-result-object v2

    invoke-interface {v0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;->getAssetPackage()Lcom/nexstreaming/app/common/nexasset/assetpackage/b;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->a(Lcom/nexstreaming/app/common/nexasset/assetpackage/b;)Z

    move-result v2

    if-eqz v2, :cond_1

    const-string v0, "nexOverlayManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "AssetPackageJsonToString expire id="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-object v1

    :cond_1
    :try_start_0
    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/config/a;->a()Lcom/nexstreaming/kminternal/kinemaster/config/a;

    move-result-object p1

    invoke-virtual {p1}, Lcom/nexstreaming/kminternal/kinemaster/config/a;->b()Landroid/content/Context;

    move-result-object p1

    invoke-interface {v0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;->getPackageURI()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;->getAssetPackage()Lcom/nexstreaming/app/common/nexasset/assetpackage/b;

    move-result-object v3

    invoke-interface {v3}, Lcom/nexstreaming/app/common/nexasset/assetpackage/b;->getAssetId()Ljava/lang/String;

    move-result-object v3

    invoke-static {p1, v2, v3}, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;

    move-result-object p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    :try_start_1
    invoke-interface {v0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;->getFilePath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->a(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    if-eqz v0, :cond_3

    new-instance v2, Ljava/io/InputStreamReader;

    invoke-direct {v2, v0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    new-instance v3, Ljava/io/BufferedReader;

    invoke-direct {v3, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    :goto_0
    invoke-virtual {v3}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_2

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "\n"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    :cond_2
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-static {p1}, Lcom/nexstreaming/app/common/util/b;->a(Ljava/io/Closeable;)V

    return-object v0

    :catchall_0
    move-exception v0

    goto :goto_1

    :catch_0
    move-exception v0

    :try_start_2
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :cond_3
    invoke-static {p1}, Lcom/nexstreaming/app/common/util/b;->a(Ljava/io/Closeable;)V

    return-object v1

    :goto_1
    invoke-static {p1}, Lcom/nexstreaming/app/common/util/b;->a(Ljava/io/Closeable;)V

    throw v0

    :catch_1
    move-exception p1

    invoke-virtual {p1}, Ljava/io/IOException;->printStackTrace()V

    return-object v1
.end method

.method static synthetic access$000()Z
    .locals 1

    sget-boolean v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager;->sAutoAspectSelect:Z

    return v0
.end method

.method static synthetic access$100()Landroid/content/Context;
    .locals 1

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager;->mAppContext:Landroid/content/Context;

    return-object v0
.end method

.method private getAssetOverlay(Ljava/lang/String;)Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$Overlay;
    .locals 3

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager;->overlayEntries:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$Overlay;

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$Overlay;->packageInfo()Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Asset;

    move-result-object v2

    invoke-interface {v2}, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Asset;->assetId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_0

    return-object v1

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method public static getOverlayManager(Landroid/content/Context;Landroid/content/Context;)Lcom/nexstreaming/nexeditorsdk/nexOverlayManager;
    .locals 2

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager;->sSingleton:Lcom/nexstreaming/nexeditorsdk/nexOverlayManager;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager;->sSingleton:Lcom/nexstreaming/nexeditorsdk/nexOverlayManager;

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager;->mAppContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    sput-object v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager;->sSingleton:Lcom/nexstreaming/nexeditorsdk/nexOverlayManager;

    :cond_0
    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager;->sSingleton:Lcom/nexstreaming/nexeditorsdk/nexOverlayManager;

    if-nez v0, :cond_1

    new-instance v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager;

    invoke-direct {v0, p0, p1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager;-><init>(Landroid/content/Context;Landroid/content/Context;)V

    sput-object v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager;->sSingleton:Lcom/nexstreaming/nexeditorsdk/nexOverlayManager;

    :cond_1
    sget-object p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager;->sSingleton:Lcom/nexstreaming/nexeditorsdk/nexOverlayManager;

    return-object p0
.end method

.method private resolveOverlay()V
    .locals 5

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager;->m_overlayEntryLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager;->overlayEntries:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/config/a;->a()Lcom/nexstreaming/kminternal/kinemaster/config/a;

    move-result-object v1

    invoke-virtual {v1}, Lcom/nexstreaming/kminternal/kinemaster/config/a;->b()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager;->getAssetPackageManager(Landroid/content/Context;)Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager;

    move-result-object v1

    sget-object v2, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Category;->overlay:Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Category;

    invoke-virtual {v1, v2}, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager;->getInstalledAssetItems(Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Category;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Item;

    invoke-interface {v2}, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Item;->type()Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$ItemMethodType;

    move-result-object v3

    sget-object v4, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$ItemMethodType;->ItemTemplate:Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$ItemMethodType;

    if-ne v3, v4, :cond_0

    invoke-interface {v2}, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Item;->packageInfo()Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Asset;

    move-result-object v3

    invoke-interface {v3}, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Asset;->assetId()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager;->getAssetOverlay(Ljava/lang/String;)Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$Overlay;

    move-result-object v3

    if-nez v3, :cond_1

    invoke-static {v2}, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$Overlay;->access$200(Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Item;)Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$Overlay;

    move-result-object v3

    iget-object v4, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager;->overlayEntries:Ljava/util/List;

    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_1
    invoke-interface {v2}, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Item;->id()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$Overlay;->setAspect(Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public static setAutoSelectFromAspect(Z)V
    .locals 0

    sput-boolean p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager;->sAutoAspectSelect:Z

    return-void
.end method


# virtual methods
.method public applyOverlayToProjectById(Lcom/nexstreaming/nexeditorsdk/nexProject;Ljava/lang/String;Ljava/util/List;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/nexstreaming/nexeditorsdk/nexProject;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;",
            ">;)Z"
        }
    .end annotation

    const-string v0, "nexOverlayManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "applyOverlayToProjectById with : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    invoke-virtual {p0, p2, v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager;->parseOverlay(Ljava/lang/String;Ljava/util/List;)Z

    iget-object p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager;->overlayTitle:Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;

    const/4 v0, 0x0

    if-nez p2, :cond_0

    const-string p1, "nexOverlayManager"

    const-string p2, "Overlay data did not exist"

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v0

    :cond_0
    iget-object p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager;->overlayTitle:Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;

    sget-object v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager;->mAppContext:Landroid/content/Context;

    invoke-virtual {p2, v1, p1, p3}, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;->a(Landroid/content/Context;Lcom/nexstreaming/nexeditorsdk/nexProject;Ljava/util/List;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_1

    const-string p1, "nexOverlayManager"

    const-string p2, "Overlay apply failed"

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v0

    :cond_1
    const/4 p1, 0x1

    return p1
.end method

.method public clearOverlayToProject(Lcom/nexstreaming/nexeditorsdk/nexProject;)Z
    .locals 2

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager;->overlayTitle:Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const-string p1, "nexOverlayManager"

    const-string v0, "Overlay data did not exist"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v1

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager;->overlayTitle:Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;

    invoke-virtual {v0, p1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;->a(Lcom/nexstreaming/nexeditorsdk/nexProject;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_1

    const-string p1, "nexOverlayManager"

    const-string v0, "Overlay apply failed"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v1

    :cond_1
    const/4 p1, 0x1

    return p1
.end method

.method public getOverlays()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$Overlay;",
            ">;"
        }
    .end annotation

    const-string v0, "nexOverlayManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getOverlays total : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager;->overlayEntries:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager;->externalView_overlayEntries:Ljava/util/List;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager;->overlayEntries:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager;->externalView_overlayEntries:Ljava/util/List;

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager;->externalView_overlayEntries:Ljava/util/List;

    return-object v0
.end method

.method public getOverlays(Z)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Ljava/util/List<",
            "Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$Overlay;",
            ">;"
        }
    .end annotation

    const-string v0, "nexOverlayManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getOverlays total : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager;->overlayEntries:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " match : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager;->m_overlayEntryLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexApplicationConfig;->getAspectRatio()F

    move-result v2

    iget-object v3, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager;->overlayEntries:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$Overlay;

    if-eqz p1, :cond_1

    invoke-virtual {v4}, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$Overlay;->getRatio()F

    move-result v5

    cmpl-float v5, v5, v2

    if-nez v5, :cond_0

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_2
    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public loadOverlay()V
    .locals 0

    invoke-direct {p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager;->resolveOverlay()V

    return-void
.end method

.method public parseOverlay(Ljava/lang/String;Ljava/util/List;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;",
            ">;)Z"
        }
    .end annotation

    new-instance v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;

    invoke-direct {v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;-><init>()V

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager;->overlayTitle:Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;

    if-eqz p1, :cond_0

    const-string v0, "nexOverlayManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "parseOverlay with : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    const/4 v0, 0x0

    :try_start_0
    invoke-direct {p0, p1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager;->AssetPackageJsonToString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {p0, p1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager;->AssetPackageJsonToString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager;->overlayTitle:Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;

    new-instance v2, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$1;

    invoke-direct {v2, p0, p2}, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$1;-><init>(Lcom/nexstreaming/nexeditorsdk/nexOverlayManager;Ljava/util/List;)V

    invoke-virtual {p1, v1, v2}, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;->a(Lorg/json/JSONObject;Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$TitleInfoListener;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_1

    const-string v1, "nexOverlayManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "json parse failed"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-interface {p2}, Ljava/util/List;->clear()V

    return v0

    :cond_1
    const/4 p1, 0x1

    return p1

    :cond_2
    :try_start_1
    const-string p1, "nexOverlayManager"

    const-string p2, "json create failed overlayid is null"

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    return v0

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    const-string p2, "nexOverlayManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "json create failed"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v0
.end method

.method public uninstallPackageById(Ljava/lang/String;)V
    .locals 1

    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/config/a;->a()Lcom/nexstreaming/kminternal/kinemaster/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/kinemaster/config/a;->b()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager;->getAssetPackageManager(Landroid/content/Context;)Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager;->uninstallPackageById(Ljava/lang/String;)V

    return-void
.end method

.method updateOverlayTitle(ZLcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Item;)Z
    .locals 5

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager;->m_overlayEntryLock:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x0

    if-eqz p1, :cond_1

    :try_start_0
    invoke-interface {p2}, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Item;->packageInfo()Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Asset;

    move-result-object p1

    invoke-interface {p1}, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Asset;->assetId()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager;->getAssetOverlay(Ljava/lang/String;)Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$Overlay;

    move-result-object p1

    if-nez p1, :cond_0

    invoke-static {p2}, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$Overlay;->access$200(Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Item;)Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$Overlay;

    move-result-object p1

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager;->overlayEntries:Ljava/util/List;

    invoke-interface {v2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    invoke-interface {p2}, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Item;->id()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$Overlay;->setAspect(Ljava/lang/String;)V

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    :cond_1
    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager;->overlayEntries:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$Overlay;

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$Overlay;->packageInfo()Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Asset;

    move-result-object v3

    invoke-interface {v3}, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Asset;->assetId()Ljava/lang/String;

    move-result-object v3

    invoke-interface {p2}, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Item;->packageInfo()Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Asset;

    move-result-object v4

    invoke-interface {v4}, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Asset;->assetId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v3

    if-nez v3, :cond_2

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager;->overlayEntries:Ljava/util/List;

    invoke-interface {p1, v2}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    :cond_3
    :goto_0
    monitor-exit v0

    return v1

    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method
