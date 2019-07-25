.class Lcom/miui/gallery/collage/BitmapManager$DecodeBitmapTask;
.super Landroid/os/AsyncTask;
.source "BitmapManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/collage/BitmapManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DecodeBitmapTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Landroid/net/Uri;",
        "Ljava/lang/Void;",
        "[",
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation


# instance fields
.field mContext:Landroid/content/Context;

.field mLoadListener:Lcom/miui/gallery/collage/BitmapManager$CustomLoadListener;


# direct methods
.method constructor <init>(Lcom/miui/gallery/collage/BitmapManager$CustomLoadListener;Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/collage/BitmapManager$DecodeBitmapTask;->mLoadListener:Lcom/miui/gallery/collage/BitmapManager$CustomLoadListener;

    iput-object p2, p0, Lcom/miui/gallery/collage/BitmapManager$DecodeBitmapTask;->mContext:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, [Landroid/net/Uri;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/collage/BitmapManager$DecodeBitmapTask;->doInBackground([Landroid/net/Uri;)[Landroid/graphics/Bitmap;

    move-result-object p1

    return-object p1
.end method

.method protected varargs doInBackground([Landroid/net/Uri;)[Landroid/graphics/Bitmap;
    .locals 5

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    array-length v1, p1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, p1, v2

    iget-object v4, p0, Lcom/miui/gallery/collage/BitmapManager$DecodeBitmapTask;->mContext:Landroid/content/Context;

    invoke-static {v4, v3}, Lcom/miui/gallery/collage/BitmapManager;->loadSuitableBitmapOnScreen(Landroid/content/Context;Landroid/net/Uri;)Landroid/graphics/Bitmap;

    move-result-object v3

    if-eqz v3, :cond_0

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result p1

    new-array p1, p1, [Landroid/graphics/Bitmap;

    invoke-interface {v0, p1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Landroid/graphics/Bitmap;

    return-object p1
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, [Landroid/graphics/Bitmap;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/collage/BitmapManager$DecodeBitmapTask;->onPostExecute([Landroid/graphics/Bitmap;)V

    return-void
.end method

.method protected onPostExecute([Landroid/graphics/Bitmap;)V
    .locals 1

    if-eqz p1, :cond_0

    array-length v0, p1

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/collage/BitmapManager$DecodeBitmapTask;->mLoadListener:Lcom/miui/gallery/collage/BitmapManager$CustomLoadListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/collage/BitmapManager$DecodeBitmapTask;->mLoadListener:Lcom/miui/gallery/collage/BitmapManager$CustomLoadListener;

    invoke-interface {v0, p1}, Lcom/miui/gallery/collage/BitmapManager$CustomLoadListener;->onBitmapLoad([Landroid/graphics/Bitmap;)V

    :cond_0
    return-void
.end method
