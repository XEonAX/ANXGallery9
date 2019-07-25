.class public Lcom/miui/gallery/editor/photo/app/EditorApplicationDelegate;
.super Lmiui/external/ApplicationDelegate;
.source "EditorApplicationDelegate.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lmiui/external/ApplicationDelegate;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreate()V
    .locals 3

    invoke-super {p0}, Lmiui/external/ApplicationDelegate;->onCreate()V

    const-string v0, "EditApplicationDelegate"

    const-string v1, "edit progress start"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->getInstance()Lcom/miui/gallery/cloudcontrol/CloudControlManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->init(Landroid/content/Context;)V

    invoke-static {p0}, Lcom/miui/gallery/util/GalleryStatHelper;->init(Landroid/content/Context;)V

    invoke-static {p0}, Lcom/miui/gallery/util/uil/CloudImageLoader;->init(Landroid/content/Context;)V

    invoke-static {p0}, Lcom/miui/filtersdk/BeautificationSDK;->init(Landroid/content/Context;)V

    new-instance v0, Lcom/miui/gallery/editor/photo/app/EditorApplicationDelegate$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/app/EditorApplicationDelegate$1;-><init>(Lcom/miui/gallery/editor/photo/app/EditorApplicationDelegate;)V

    invoke-static {v0}, Lcom/nostra13/universalimageloader/core/ImageLoader;->setInitializer(Lcom/nostra13/universalimageloader/core/ImageLoader$Initializer;)V

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object v1

    new-instance v2, Lcom/miui/gallery/editor/photo/app/EditorApplicationDelegate$2;

    invoke-direct {v2, p0, v0}, Lcom/miui/gallery/editor/photo/app/EditorApplicationDelegate$2;-><init>(Lcom/miui/gallery/editor/photo/app/EditorApplicationDelegate;Lcom/nostra13/universalimageloader/core/ImageLoader$Initializer;)V

    invoke-virtual {v1, v2}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;)Lcom/miui/gallery/threadpool/Future;

    return-void
.end method
