.class Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicProvider$LoadMosaicTask;
.super Landroid/os/AsyncTask;
.source "MosaicProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "LoadMosaicTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Landroid/app/Application;",
        "Ljava/lang/Void;",
        "Ljava/util/List<",
        "Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEntity;",
        ">;>;"
    }
.end annotation


# instance fields
.field private mAssetManager:Landroid/content/res/AssetManager;

.field private mResourceListener:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicProvider$ResourceListener;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicProvider$ResourceListener;Landroid/content/res/AssetManager;)V
    .locals 0

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicProvider$LoadMosaicTask;->mResourceListener:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicProvider$ResourceListener;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicProvider$LoadMosaicTask;->mAssetManager:Landroid/content/res/AssetManager;

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, [Landroid/app/Application;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicProvider$LoadMosaicTask;->doInBackground([Landroid/app/Application;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method protected varargs doInBackground([Landroid/app/Application;)Ljava/util/List;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Landroid/app/Application;",
            ")",
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEntity;",
            ">;"
        }
    .end annotation

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicProvider$LoadMosaicTask;->mAssetManager:Landroid/content/res/AssetManager;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    :try_start_0
    invoke-static {}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicProvider;->access$200()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/content/res/AssetManager;->list(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    :goto_0
    array-length v3, v1

    if-ge v2, v3, :cond_0

    aget-object v6, v1, v2

    invoke-static {v6}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicProvider;->access$300(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v6}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicProvider;->access$400(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {p1, v3}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicProvider;->loadResourceFileString(Landroid/content/res/AssetManager;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-class v4, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicConfig;

    invoke-static {v3, v4}, Lcom/miui/gallery/util/GsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicConfig;

    iget-object v4, v3, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicConfig;->type:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEntity$TYPE;

    const/4 v5, 0x0

    sget-object v8, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicProvider$2;->$SwitchMap$com$miui$gallery$editor$photo$core$imports$mosaic$MosaicGLEntity$TYPE:[I

    invoke-virtual {v4}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEntity$TYPE;->ordinal()I

    move-result v4

    aget v4, v8, v4

    packed-switch v4, :pswitch_data_0

    goto :goto_1

    :pswitch_0
    new-instance v5, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEffectEntity;

    int-to-short v4, v2

    iget-object v3, v3, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicConfig;->effectType:Ljava/lang/String;

    invoke-direct {v5, v4, v6, v7, v3}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEffectEntity;-><init>(SLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    :pswitch_1
    new-instance v10, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLResourceEntity;

    int-to-short v5, v2

    invoke-static {v6}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicProvider;->access$500(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iget-object v9, v3, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicConfig;->tileMode:Ljava/lang/String;

    move-object v4, v10

    invoke-direct/range {v4 .. v9}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLResourceEntity;-><init>(SLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    move-object v5, v10

    goto :goto_1

    :pswitch_2
    new-instance v5, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLOriginEntity;

    int-to-short v3, v2

    invoke-direct {v5, v3, v6, v7}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLOriginEntity;-><init>(SLjava/lang/String;Ljava/lang/String;)V

    :goto_1
    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/io/IOException;->printStackTrace()V

    :cond_0
    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Ljava/util/List;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicProvider$LoadMosaicTask;->onPostExecute(Ljava/util/List;)V

    return-void
.end method

.method protected onPostExecute(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEntity;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicProvider$LoadMosaicTask;->mResourceListener:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicProvider$ResourceListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicProvider$LoadMosaicTask;->mResourceListener:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicProvider$ResourceListener;

    invoke-interface {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicProvider$ResourceListener;->onLoadFinish(Ljava/util/List;)V

    :cond_0
    return-void
.end method
