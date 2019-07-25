.class Lcom/miui/gallery/editor/photo/core/imports/frame/FrameProvider;
.super Lcom/miui/gallery/editor/photo/core/SdkProvider;
.source "FrameProvider.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/core/imports/frame/FrameProvider$ResourceListener;,
        Lcom/miui/gallery/editor/photo/core/imports/frame/FrameProvider$LoadResourceTask;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/editor/photo/core/SdkProvider<",
        "Lcom/miui/gallery/editor/photo/core/common/model/FrameData;",
        "Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractFrameFragment;",
        ">;"
    }
.end annotation


# static fields
.field private static final SEPARATOR:Ljava/lang/String;


# instance fields
.field private mFrameData:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/common/model/FrameData;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    sget-object v0, Ljava/io/File;->separator:Ljava/lang/String;

    sput-object v0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameProvider;->SEPARATOR:Ljava/lang/String;

    sget-object v0, Lcom/miui/gallery/editor/photo/core/SdkManager;->INSTANCE:Lcom/miui/gallery/editor/photo/core/SdkManager;

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameProvider;

    invoke-direct {v1}, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameProvider;-><init>()V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/core/SdkManager;->register(Lcom/miui/gallery/editor/photo/core/SdkProvider;)V

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    sget-object v0, Lcom/miui/gallery/editor/photo/core/Effect;->FRAME:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/core/SdkProvider;-><init>(Lcom/miui/gallery/editor/photo/core/Effect;)V

    return-void
.end method

.method static synthetic access$002(Lcom/miui/gallery/editor/photo/core/imports/frame/FrameProvider;Ljava/util/List;)Ljava/util/List;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameProvider;->mFrameData:Ljava/util/List;

    return-object p1
.end method

.method static synthetic access$100(Lcom/miui/gallery/editor/photo/core/imports/frame/FrameProvider;)V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameProvider;->notifyInitializeFinish()V

    return-void
.end method

.method static synthetic access$200()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameProvider;->SEPARATOR:Ljava/lang/String;

    return-object v0
.end method

.method private initialize()V
    .locals 4

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameProvider$LoadResourceTask;

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameProvider$1;

    invoke-direct {v1, p0}, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameProvider$1;-><init>(Lcom/miui/gallery/editor/photo/core/imports/frame/FrameProvider;)V

    invoke-direct {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameProvider$LoadResourceTask;-><init>(Lcom/miui/gallery/editor/photo/core/imports/frame/FrameProvider$ResourceListener;)V

    const/4 v1, 0x1

    new-array v1, v1, [Landroid/app/Application;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameProvider;->getApplicationContext()Landroid/app/Application;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameProvider$LoadResourceTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

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
    const-string p1, "FrameProvider"

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
    const-string v1, "FrameProvider"

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
.method public createEngine(Landroid/content/Context;)Lcom/miui/gallery/editor/photo/core/RenderEngine;
    .locals 0

    new-instance p1, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEngine;

    invoke-direct {p1}, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEngine;-><init>()V

    return-object p1
.end method

.method public list()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "+",
            "Lcom/miui/gallery/editor/photo/core/common/model/FrameData;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameProvider;->mFrameData:Ljava/util/List;

    return-object v0
.end method

.method protected onActivityCreate()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameProvider;->initialize()V

    return-void
.end method

.method protected bridge synthetic onCreateFragment()Lcom/miui/gallery/editor/photo/core/RenderFragment;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameProvider;->onCreateFragment()Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractFrameFragment;

    move-result-object v0

    return-object v0
.end method

.method protected onCreateFragment()Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractFrameFragment;
    .locals 1

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameFragment;

    invoke-direct {v0}, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameFragment;-><init>()V

    return-object v0
.end method
