.class public Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicProvider;
.super Lcom/miui/gallery/editor/photo/screen/core/ScreenProvider;
.source "ScreenMosaicProvider.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicProvider$ResourceListener;,
        Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicProvider$LoadMosaicTask;
    }
.end annotation


# static fields
.field private static final PATH_MOSAIC:Ljava/lang/String;

.field private static final SEPARATOR:Ljava/lang/String;


# instance fields
.field private mMosaicDataList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicData;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    sget-object v0, Ljava/io/File;->separator:Ljava/lang/String;

    sput-object v0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicProvider;->SEPARATOR:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "mosaic"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicProvider;->SEPARATOR:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "entities"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicProvider;->PATH_MOSAIC:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/screen/core/ScreenProvider;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicProvider;->mMosaicDataList:Ljava/util/List;

    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicProvider;->PATH_MOSAIC:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    invoke-static {p0}, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicProvider;->getMosaicConfigPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$200(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    invoke-static {p0}, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicProvider;->getMosaicIconPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$300(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    invoke-static {p0}, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicProvider;->getMosaicResourcePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static getMosaicConfigPath(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicProvider;->PATH_MOSAIC:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicProvider;->SEPARATOR:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicProvider;->SEPARATOR:Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "config.json"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static getMosaicIconPath(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "assets://"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicProvider;->PATH_MOSAIC:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicProvider;->SEPARATOR:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicProvider;->SEPARATOR:Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "icon.png"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static getMosaicResourcePath(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "assets://"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicProvider;->PATH_MOSAIC:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicProvider;->SEPARATOR:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicProvider;->SEPARATOR:Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "resource.png"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private initialize(Landroid/content/Context;)V
    .locals 2

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicProvider;->mIsInitialized:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicProvider$LoadMosaicTask;

    new-instance v1, Lcom/miui/gallery/editor/photo/screen/mosaic/-$$Lambda$ScreenMosaicProvider$0MavvFKkVPhTZSoR30QGl1MqovA;

    invoke-direct {v1, p0}, Lcom/miui/gallery/editor/photo/screen/mosaic/-$$Lambda$ScreenMosaicProvider$0MavvFKkVPhTZSoR30QGl1MqovA;-><init>(Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicProvider;)V

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {v0, v1, p1}, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicProvider$LoadMosaicTask;-><init>(Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicProvider$ResourceListener;Landroid/content/Context;)V

    const/4 p1, 0x0

    new-array p1, p1, [Ljava/lang/Void;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicProvider$LoadMosaicTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public static synthetic lambda$initialize$75(Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicProvider;Ljava/util/List;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicProvider;->mMosaicDataList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicProvider;->mMosaicDataList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicProvider;->mIsInitialized:Z

    return-void
.end method

.method static loadResourceFileString(Landroid/content/res/AssetManager;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0, p1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    const-string p1, "ScreenMosaicProvider"

    invoke-static {p1, p0}, Lcom/miui/gallery/editor/photo/utils/IoUtils;->readInputStreamToString(Ljava/lang/String;Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object p1
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-static {p0}, Lcom/miui/gallery/editor/photo/utils/IoUtils;->close(Ljava/io/Closeable;)V

    goto :goto_1

    :catchall_0
    move-exception p1

    goto :goto_2

    :catch_0
    move-exception p1

    goto :goto_0

    :catchall_1
    move-exception p1

    move-object p0, v0

    goto :goto_2

    :catch_1
    move-exception p1

    move-object p0, v0

    :goto_0
    :try_start_2
    const-string v1, "ScreenMosaicProvider"

    invoke-static {v1, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    invoke-static {p0}, Lcom/miui/gallery/editor/photo/utils/IoUtils;->close(Ljava/io/Closeable;)V

    move-object p1, v0

    :goto_1
    return-object p1

    :goto_2
    invoke-static {p0}, Lcom/miui/gallery/editor/photo/utils/IoUtils;->close(Ljava/io/Closeable;)V

    throw p1
.end method


# virtual methods
.method public clearShader()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicProvider;->mMosaicDataList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicData;

    check-cast v1, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity;->clearShader()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public getDefaultData()Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicData;
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicProvider;->mMosaicDataList:Ljava/util/List;

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicProvider;->mMosaicDataList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicData;

    instance-of v2, v1, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntityNormal;

    if-eqz v2, :cond_0

    return-object v1

    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public list()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "+",
            "Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicData;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicProvider;->mMosaicDataList:Ljava/util/List;

    return-object v0
.end method

.method public onActivityCreate(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicProvider;->initialize(Landroid/content/Context;)V

    return-void
.end method

.method public onActivityDestroy()V
    .locals 0

    return-void
.end method
