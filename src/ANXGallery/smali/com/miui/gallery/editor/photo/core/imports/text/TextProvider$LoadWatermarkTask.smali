.class Lcom/miui/gallery/editor/photo/core/imports/text/TextProvider$LoadWatermarkTask;
.super Landroid/os/AsyncTask;
.source "TextProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/core/imports/text/TextProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "LoadWatermarkTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Landroid/app/Application;",
        "Ljava/lang/Void;",
        "Ljava/util/List<",
        "Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;",
        ">;>;"
    }
.end annotation


# instance fields
.field private mAssetManager:Landroid/content/res/AssetManager;

.field private mResourceListener:Lcom/miui/gallery/editor/photo/core/imports/text/TextProvider$ResourceListener;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/core/imports/text/TextProvider$ResourceListener;Landroid/content/res/AssetManager;)V
    .locals 0

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextProvider$LoadWatermarkTask;->mResourceListener:Lcom/miui/gallery/editor/photo/core/imports/text/TextProvider$ResourceListener;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextProvider$LoadWatermarkTask;->mAssetManager:Landroid/content/res/AssetManager;

    return-void
.end method

.method private static getAssetFilePath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "assets://watermark"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object p0, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static getConfigPath(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "watermark"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object p0, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "config.json"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, [Landroid/app/Application;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextProvider$LoadWatermarkTask;->doInBackground([Landroid/app/Application;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method protected varargs doInBackground([Landroid/app/Application;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Landroid/app/Application;",
            ")",
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;",
            ">;"
        }
    .end annotation

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextProvider$LoadWatermarkTask;->mAssetManager:Landroid/content/res/AssetManager;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    :try_start_0
    const-string v1, "watermark"

    invoke-virtual {p1, v1}, Landroid/content/res/AssetManager;->list(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    :goto_0
    array-length v3, v1

    if-ge v2, v3, :cond_0

    aget-object v3, v1, v2

    invoke-static {v3}, Lcom/miui/gallery/editor/photo/core/imports/text/TextProvider$LoadWatermarkTask;->getConfigPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {p1, v4}, Lcom/miui/gallery/editor/photo/utils/IoUtils;->loadAssetFileString(Landroid/content/res/AssetManager;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-class v5, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;

    invoke-static {v4, v5}, Lcom/miui/gallery/util/GsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;

    iget-object v5, v4, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;->icon:Ljava/lang/String;

    invoke-static {v3, v5}, Lcom/miui/gallery/editor/photo/core/imports/text/TextProvider$LoadWatermarkTask;->getAssetFilePath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;->icon:Ljava/lang/String;

    iget-object v5, v4, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;->bgPost:Ljava/lang/String;

    invoke-static {v3, v5}, Lcom/miui/gallery/editor/photo/core/imports/text/TextProvider$LoadWatermarkTask;->getAssetFilePath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v4, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;->bgPost:Ljava/lang/String;

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/io/IOException;->printStackTrace()V

    :cond_0
    return-object v0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Ljava/util/List;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextProvider$LoadWatermarkTask;->onPostExecute(Ljava/util/List;)V

    return-void
.end method

.method protected onPostExecute(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextProvider$LoadWatermarkTask;->mResourceListener:Lcom/miui/gallery/editor/photo/core/imports/text/TextProvider$ResourceListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextProvider$LoadWatermarkTask;->mResourceListener:Lcom/miui/gallery/editor/photo/core/imports/text/TextProvider$ResourceListener;

    invoke-interface {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextProvider$ResourceListener;->onLoadFinish(Ljava/util/List;)V

    :cond_0
    return-void
.end method
