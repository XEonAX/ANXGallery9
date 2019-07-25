.class Lcom/miui/gallery/collage/core/poster/PosterDataLoader$LoadResourceTask;
.super Landroid/os/AsyncTask;
.source "PosterDataLoader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/collage/core/poster/PosterDataLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "LoadResourceTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Landroid/content/res/AssetManager;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field private mDataLoadListener:Lcom/miui/gallery/collage/core/poster/PosterDataLoader$DataLoadListener;

.field private mPosterLayoutSparseArray:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Ljava/util/List<",
            "Lcom/miui/gallery/collage/core/layout/LayoutModel;",
            ">;>;"
        }
    .end annotation
.end field

.field private mPosterSparseArray:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Ljava/util/List<",
            "Lcom/miui/gallery/collage/core/poster/PosterModel;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/miui/gallery/collage/core/poster/PosterDataLoader$DataLoadListener;)V
    .locals 1

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/collage/core/poster/PosterDataLoader$LoadResourceTask;->mPosterLayoutSparseArray:Landroid/util/SparseArray;

    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/collage/core/poster/PosterDataLoader$LoadResourceTask;->mPosterSparseArray:Landroid/util/SparseArray;

    iput-object p1, p0, Lcom/miui/gallery/collage/core/poster/PosterDataLoader$LoadResourceTask;->mDataLoadListener:Lcom/miui/gallery/collage/core/poster/PosterDataLoader$DataLoadListener;

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, [Landroid/content/res/AssetManager;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/collage/core/poster/PosterDataLoader$LoadResourceTask;->doInBackground([Landroid/content/res/AssetManager;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method protected varargs doInBackground([Landroid/content/res/AssetManager;)Ljava/lang/Void;
    .locals 14

    invoke-static {}, Lcom/miui/gallery/collage/CollageUtils;->generateCustomGson()Lcom/google/gson/Gson;

    move-result-object v0

    const/4 v1, 0x0

    aget-object p1, p1, v1

    const/4 v2, 0x0

    :try_start_0
    new-instance v3, Lcom/google/gson/JsonParser;

    invoke-direct {v3}, Lcom/google/gson/JsonParser;-><init>()V

    sget-object v4, Lcom/miui/gallery/collage/core/poster/PosterDataLoader;->PATH_POSTER_LAYOUT:Ljava/lang/String;

    invoke-virtual {p1, v4}, Landroid/content/res/AssetManager;->list(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    array-length v5, v4

    const/4 v6, 0x0

    :goto_0
    if-ge v6, v5, :cond_1

    aget-object v7, v4, v6

    invoke-virtual {p0}, Lcom/miui/gallery/collage/core/poster/PosterDataLoader$LoadResourceTask;->isCancelled()Z

    move-result v8

    if-eqz v8, :cond_0

    return-object v2

    :cond_0
    invoke-static {p1, v0, v7}, Lcom/miui/gallery/collage/core/poster/PosterDataLoader;->generatePosterLayoutModelByName(Landroid/content/res/AssetManager;Lcom/google/gson/Gson;Ljava/lang/String;)Lcom/miui/gallery/collage/core/layout/LayoutModel;

    move-result-object v7

    iget-object v8, p0, Lcom/miui/gallery/collage/core/poster/PosterDataLoader$LoadResourceTask;->mPosterLayoutSparseArray:Landroid/util/SparseArray;

    invoke-static {v8, v7}, Lcom/miui/gallery/collage/core/poster/PosterDataLoader;->access$000(Landroid/util/SparseArray;Lcom/miui/gallery/collage/core/layout/LayoutModel;)V

    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    :cond_1
    sget-object v4, Lcom/miui/gallery/collage/core/poster/PosterDataLoader;->PATH_POSTER_MODE:Ljava/lang/String;

    invoke-virtual {p1, v4}, Landroid/content/res/AssetManager;->list(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    array-length v5, v4

    :goto_1
    if-ge v1, v5, :cond_3

    aget-object v6, v4, v1

    invoke-virtual {p0}, Lcom/miui/gallery/collage/core/poster/PosterDataLoader$LoadResourceTask;->isCancelled()Z

    move-result v7

    if-eqz v7, :cond_2

    return-object v2

    :cond_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    invoke-static {p1, v0, v3, v6}, Lcom/miui/gallery/collage/core/poster/PosterDataLoader;->generatePosterModelByName(Landroid/content/res/AssetManager;Lcom/google/gson/Gson;Lcom/google/gson/JsonParser;Ljava/lang/String;)Lcom/miui/gallery/collage/core/poster/PosterModel;

    move-result-object v9

    iget-object v10, p0, Lcom/miui/gallery/collage/core/poster/PosterDataLoader$LoadResourceTask;->mPosterSparseArray:Landroid/util/SparseArray;

    invoke-static {v10, v9}, Lcom/miui/gallery/collage/core/poster/PosterDataLoader;->access$100(Landroid/util/SparseArray;Lcom/miui/gallery/collage/core/poster/PosterModel;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    const-string v11, "PosterDataLoader"

    const-string v12, "gson parse posterModel %s coast %d"

    const/4 v13, 0x0

    sub-long/2addr v9, v7

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-static {v11, v12, v6, v7}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :catch_0
    move-exception p1

    const-string v0, "PosterDataLoader"

    invoke-static {v0, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_3
    return-object v2
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/collage/core/poster/PosterDataLoader$LoadResourceTask;->onPostExecute(Ljava/lang/Void;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/Void;)V
    .locals 2

    iget-object p1, p0, Lcom/miui/gallery/collage/core/poster/PosterDataLoader$LoadResourceTask;->mDataLoadListener:Lcom/miui/gallery/collage/core/poster/PosterDataLoader$DataLoadListener;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/collage/core/poster/PosterDataLoader$LoadResourceTask;->mDataLoadListener:Lcom/miui/gallery/collage/core/poster/PosterDataLoader$DataLoadListener;

    iget-object v0, p0, Lcom/miui/gallery/collage/core/poster/PosterDataLoader$LoadResourceTask;->mPosterLayoutSparseArray:Landroid/util/SparseArray;

    iget-object v1, p0, Lcom/miui/gallery/collage/core/poster/PosterDataLoader$LoadResourceTask;->mPosterSparseArray:Landroid/util/SparseArray;

    invoke-interface {p1, v0, v1}, Lcom/miui/gallery/collage/core/poster/PosterDataLoader$DataLoadListener;->onDataLoad(Landroid/util/SparseArray;Landroid/util/SparseArray;)V

    :cond_0
    return-void
.end method
