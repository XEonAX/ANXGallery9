.class Lcom/miui/gallery/editor/photo/app/DraftManager$1;
.super Landroid/os/AsyncTask;
.source "DraftManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/app/DraftManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/app/DraftManager;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/app/DraftManager;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/DraftManager$1;->this$0:Lcom/miui/gallery/editor/photo/app/DraftManager;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Landroid/graphics/Bitmap;
    .locals 2

    new-instance p1, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {p1}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/DraftManager$1;->this$0:Lcom/miui/gallery/editor/photo/app/DraftManager;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/DraftManager;->access$000(Lcom/miui/gallery/editor/photo/app/DraftManager;)I

    move-result v0

    iput v0, p1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/DraftManager$1;->this$0:Lcom/miui/gallery/editor/photo/app/DraftManager;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/DraftManager$1;->this$0:Lcom/miui/gallery/editor/photo/app/DraftManager;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/app/DraftManager;->access$100(Lcom/miui/gallery/editor/photo/app/DraftManager;)Lcom/miui/gallery3d/exif/ExifInterface;

    move-result-object v1

    invoke-static {v1}, Lcom/miui/gallery/util/ExifUtil;->getRotationDegrees(Lcom/miui/gallery3d/exif/ExifInterface;)I

    move-result v1

    invoke-static {v0, p1, v1}, Lcom/miui/gallery/editor/photo/app/DraftManager;->access$200(Lcom/miui/gallery/editor/photo/app/DraftManager;Landroid/graphics/BitmapFactory$Options;I)Landroid/graphics/Bitmap;

    move-result-object p1
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    const-string v0, "DraftManager"

    invoke-static {v0, p1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    :catch_1
    move-exception p1

    const-string v0, "DraftManager"

    invoke-static {v0, p1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    const/4 p1, 0x0

    :goto_1
    return-object p1
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/app/DraftManager$1;->doInBackground([Ljava/lang/Void;)Landroid/graphics/Bitmap;

    move-result-object p1

    return-object p1
.end method

.method protected onPostExecute(Landroid/graphics/Bitmap;)V
    .locals 1

    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/DraftManager$1;->this$0:Lcom/miui/gallery/editor/photo/app/DraftManager;

    invoke-static {v0, p1}, Lcom/miui/gallery/editor/photo/app/DraftManager;->access$302(Lcom/miui/gallery/editor/photo/app/DraftManager;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/DraftManager$1;->this$0:Lcom/miui/gallery/editor/photo/app/DraftManager;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/DraftManager;->access$400(Lcom/miui/gallery/editor/photo/app/DraftManager;)Lcom/miui/gallery/editor/photo/app/DraftManager$OnPreviewRefreshListener;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/DraftManager$1;->this$0:Lcom/miui/gallery/editor/photo/app/DraftManager;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/DraftManager;->access$400(Lcom/miui/gallery/editor/photo/app/DraftManager;)Lcom/miui/gallery/editor/photo/app/DraftManager$OnPreviewRefreshListener;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/DraftManager$1;->this$0:Lcom/miui/gallery/editor/photo/app/DraftManager;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/DraftManager;->access$300(Lcom/miui/gallery/editor/photo/app/DraftManager;)Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-interface {p1, v0}, Lcom/miui/gallery/editor/photo/app/DraftManager$OnPreviewRefreshListener;->onRefresh(Landroid/graphics/Bitmap;)V

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/DraftManager$1;->this$0:Lcom/miui/gallery/editor/photo/app/DraftManager;

    const/4 v0, 0x1

    invoke-static {p1, v0}, Lcom/miui/gallery/editor/photo/app/DraftManager;->access$502(Lcom/miui/gallery/editor/photo/app/DraftManager;Z)Z

    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Landroid/graphics/Bitmap;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/app/DraftManager$1;->onPostExecute(Landroid/graphics/Bitmap;)V

    return-void
.end method
