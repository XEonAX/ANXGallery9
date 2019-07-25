.class Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicProvider$LoadMosaicTask;
.super Landroid/os/AsyncTask;
.source "ScreenMosaicProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "LoadMosaicTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/util/List<",
        "Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity;",
        ">;>;"
    }
.end annotation


# instance fields
.field private mContext:Landroid/content/Context;

.field private mResourceListener:Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicProvider$ResourceListener;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicProvider$ResourceListener;Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicProvider$LoadMosaicTask;->mResourceListener:Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicProvider$ResourceListener;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicProvider$LoadMosaicTask;->mContext:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicProvider$LoadMosaicTask;->doInBackground([Ljava/lang/Void;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Void;",
            ")",
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity;",
            ">;"
        }
    .end annotation

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicProvider$LoadMosaicTask;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object p1

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    :try_start_0
    invoke-static {}, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicProvider;->access$000()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/content/res/AssetManager;->list(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    :goto_0
    array-length v3, v1

    if-ge v2, v3, :cond_2

    aget-object v3, v1, v2

    invoke-static {v3}, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicProvider;->access$100(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3}, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicProvider;->access$200(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {p1, v4}, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicProvider;->loadResourceFileString(Landroid/content/res/AssetManager;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-class v6, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicConfig;

    invoke-static {v4, v6}, Lcom/miui/gallery/util/GsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicConfig;

    iget-boolean v6, v4, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicConfig;->supportScreenEditor:Z

    if-nez v6, :cond_0

    goto :goto_3

    :cond_0
    iget-object v6, v4, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicConfig;->effectType:Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;

    sget-object v7, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicProvider$1;->$SwitchMap$com$miui$gallery$editor$photo$screen$mosaic$shader$MosaicEntity$TYPE:[I

    invoke-virtual {v6}, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;->ordinal()I

    move-result v6

    aget v6, v7, v6

    packed-switch v6, :pswitch_data_0

    new-instance v4, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntityNormal;

    goto :goto_1

    :pswitch_0
    new-instance v4, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntityTriangleRect;

    invoke-direct {v4, v3, v5}, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntityTriangleRect;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    :pswitch_1
    new-instance v4, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntityTriangle;

    invoke-direct {v4, v3, v5}, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntityTriangle;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    :pswitch_2
    new-instance v4, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntityBlur;

    iget-object v6, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicProvider$LoadMosaicTask;->mContext:Landroid/content/Context;

    invoke-direct {v4, v3, v5, v6}, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntityBlur;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    goto :goto_2

    :pswitch_3
    new-instance v6, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntityBitmap;

    invoke-static {v3}, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicProvider;->access$300(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iget-object v4, v4, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicConfig;->tileMode:Landroid/graphics/Shader$TileMode;

    invoke-direct {v6, v3, v5, v7, v4}, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntityBitmap;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Shader$TileMode;)V

    move-object v4, v6

    goto :goto_2

    :pswitch_4
    new-instance v4, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntityOrigin;

    invoke-direct {v4, v3, v5}, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntityOrigin;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    :goto_1
    invoke-direct {v4, v3, v5}, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntityNormal;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    :goto_2
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v4, 0x6

    if-lt v3, v4, :cond_1

    goto :goto_4

    :cond_1
    :goto_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/io/IOException;->printStackTrace()V

    :cond_2
    :goto_4
    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Ljava/util/List;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicProvider$LoadMosaicTask;->onPostExecute(Ljava/util/List;)V

    return-void
.end method

.method protected onPostExecute(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicProvider$LoadMosaicTask;->mResourceListener:Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicProvider$ResourceListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicProvider$LoadMosaicTask;->mResourceListener:Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicProvider$ResourceListener;

    invoke-interface {v0, p1}, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicProvider$ResourceListener;->onLoadFinish(Ljava/util/List;)V

    :cond_0
    return-void
.end method
