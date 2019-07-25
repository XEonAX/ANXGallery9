.class Lcom/miui/gallery/editor/photo/app/CropperActivity$2;
.super Ljava/lang/Object;
.source "CropperActivity.java"

# interfaces
.implements Landroid/app/LoaderManager$LoaderCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/app/CropperActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/app/LoaderManager$LoaderCallbacks<",
        "Lcom/miui/gallery/editor/photo/app/CropperActivity$DecodeResult;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/app/CropperActivity;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/app/CropperActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/CropperActivity$2;->this$0:Lcom/miui/gallery/editor/photo/app/CropperActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreateLoader(ILandroid/os/Bundle;)Landroid/content/Loader;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Landroid/os/Bundle;",
            ")",
            "Landroid/content/Loader<",
            "Lcom/miui/gallery/editor/photo/app/CropperActivity$DecodeResult;",
            ">;"
        }
    .end annotation

    new-instance p1, Lcom/miui/gallery/editor/photo/app/CropperActivity$PrepareLoader;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/CropperActivity$2;->this$0:Lcom/miui/gallery/editor/photo/app/CropperActivity;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/CropperActivity$2;->this$0:Lcom/miui/gallery/editor/photo/app/CropperActivity;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/CropperActivity;->access$200(Lcom/miui/gallery/editor/photo/app/CropperActivity;)Landroid/net/Uri;

    move-result-object v0

    invoke-direct {p1, p2, v0}, Lcom/miui/gallery/editor/photo/app/CropperActivity$PrepareLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;)V

    return-object p1
.end method

.method public onLoadFinished(Landroid/content/Loader;Lcom/miui/gallery/editor/photo/app/CropperActivity$DecodeResult;)V
    .locals 1

    iget-object p1, p2, Lcom/miui/gallery/editor/photo/app/CropperActivity$DecodeResult;->mBitmap:Landroid/graphics/Bitmap;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/CropperActivity$2;->this$0:Lcom/miui/gallery/editor/photo/app/CropperActivity;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/CropperActivity;->access$300(Lcom/miui/gallery/editor/photo/app/CropperActivity;)Lcom/edmodo/cropper/CropImageView;

    move-result-object p1

    iget-object p2, p2, Lcom/miui/gallery/editor/photo/app/CropperActivity$DecodeResult;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {p1, p2}, Lcom/edmodo/cropper/CropImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/CropperActivity$2;->this$0:Lcom/miui/gallery/editor/photo/app/CropperActivity;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/CropperActivity;->access$100(Lcom/miui/gallery/editor/photo/app/CropperActivity;)Landroid/view/View;

    move-result-object p1

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Landroid/view/View;->setEnabled(Z)V

    goto :goto_0

    :cond_0
    iget-object p1, p2, Lcom/miui/gallery/editor/photo/app/CropperActivity$DecodeResult;->mException:Ljava/lang/Exception;

    if-eqz p1, :cond_1

    const-string p1, "CropperActivity"

    iget-object p2, p2, Lcom/miui/gallery/editor/photo/app/CropperActivity$DecodeResult;->mException:Ljava/lang/Exception;

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/CropperActivity$2;->this$0:Lcom/miui/gallery/editor/photo/app/CropperActivity;

    const p2, 0x7f100424

    const/4 v0, 0x0

    invoke-static {p1, p2, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/CropperActivity$2;->this$0:Lcom/miui/gallery/editor/photo/app/CropperActivity;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/app/CropperActivity;->finish()V

    :goto_0
    return-void
.end method

.method public bridge synthetic onLoadFinished(Landroid/content/Loader;Ljava/lang/Object;)V
    .locals 0

    check-cast p2, Lcom/miui/gallery/editor/photo/app/CropperActivity$DecodeResult;

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/editor/photo/app/CropperActivity$2;->onLoadFinished(Landroid/content/Loader;Lcom/miui/gallery/editor/photo/app/CropperActivity$DecodeResult;)V

    return-void
.end method

.method public onLoaderReset(Landroid/content/Loader;)V
    .locals 0

    return-void
.end method
