.class Lcom/miui/gallery/editor/photo/core/imports/frame/FrameProvider$LoadResourceTask;
.super Landroid/os/AsyncTask;
.source "FrameProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/core/imports/frame/FrameProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "LoadResourceTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Landroid/app/Application;",
        "Ljava/lang/Void;",
        "Ljava/util/List<",
        "Lcom/miui/gallery/editor/photo/core/common/model/FrameData;",
        ">;>;"
    }
.end annotation


# instance fields
.field private mResourceListener:Lcom/miui/gallery/editor/photo/core/imports/frame/FrameProvider$ResourceListener;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/editor/photo/core/imports/frame/FrameProvider$ResourceListener;)V
    .locals 0

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameProvider$LoadResourceTask;->mResourceListener:Lcom/miui/gallery/editor/photo/core/imports/frame/FrameProvider$ResourceListener;

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, [Landroid/app/Application;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameProvider$LoadResourceTask;->doInBackground([Landroid/app/Application;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method protected varargs doInBackground([Landroid/app/Application;)Ljava/util/List;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Landroid/app/Application;",
            ")",
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/common/model/FrameData;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x0

    aget-object p1, p1, v0

    invoke-virtual {p1}, Landroid/app/Application;->getAssets()Landroid/content/res/AssetManager;

    move-result-object p1

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    :try_start_0
    const-string v2, "frame"

    invoke-virtual {p1, v2}, Landroid/content/res/AssetManager;->list(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    :goto_0
    array-length v4, v2

    if-ge v3, v4, :cond_0

    aget-object v7, v2, v3

    const-string v4, "%s%s%s"

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    const-string v6, "frame"

    aput-object v6, v5, v0

    invoke-static {}, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameProvider;->access$200()Ljava/lang/String;

    move-result-object v6

    const/4 v8, 0x1

    aput-object v6, v5, v8

    const/4 v6, 0x2

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {p1, v4}, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameProvider;->loadResourceFileString(Landroid/content/res/AssetManager;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-class v5, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameConfig;

    invoke-static {v4, v5}, Lcom/miui/gallery/util/GsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameConfig;

    new-instance v11, Lcom/miui/gallery/editor/photo/core/common/model/FrameData;

    int-to-short v6, v3

    iget v8, v4, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameConfig;->width:I

    iget v9, v4, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameConfig;->height:I

    iget v10, v4, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameConfig;->iconRatio:F

    move-object v5, v11

    invoke-direct/range {v5 .. v10}, Lcom/miui/gallery/editor/photo/core/common/model/FrameData;-><init>(SLjava/lang/String;IIF)V

    invoke-interface {v1, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v0, "FrameProvider"

    const-string v2, "FrameProvider load resource error"

    invoke-static {v0, v2, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_0
    return-object v1
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Ljava/util/List;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameProvider$LoadResourceTask;->onPostExecute(Ljava/util/List;)V

    return-void
.end method

.method protected onPostExecute(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/common/model/FrameData;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameProvider$LoadResourceTask;->mResourceListener:Lcom/miui/gallery/editor/photo/core/imports/frame/FrameProvider$ResourceListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameProvider$LoadResourceTask;->mResourceListener:Lcom/miui/gallery/editor/photo/core/imports/frame/FrameProvider$ResourceListener;

    invoke-interface {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameProvider$ResourceListener;->onLoadFinish(Ljava/util/List;)V

    :cond_0
    return-void
.end method
