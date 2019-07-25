.class Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$PreloadBigPhotoRunnable$1;
.super Ljava/lang/Object;
.source "MiuiCameraCaptureReceiver.java"

# interfaces
.implements Lcom/miui/gallery/threadpool/ThreadPool$Job;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$PreloadBigPhotoRunnable;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/threadpool/ThreadPool$Job<",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$PreloadBigPhotoRunnable;

.field final synthetic val$filePath:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$PreloadBigPhotoRunnable;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$PreloadBigPhotoRunnable$1;->this$0:Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$PreloadBigPhotoRunnable;

    iput-object p2, p0, Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$PreloadBigPhotoRunnable$1;->val$filePath:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$PreloadBigPhotoRunnable$1;->run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method public run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Void;
    .locals 5

    iget-object p1, p0, Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$PreloadBigPhotoRunnable$1;->this$0:Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$PreloadBigPhotoRunnable;

    iget-object v0, p0, Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$PreloadBigPhotoRunnable$1;->val$filePath:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$PreloadBigPhotoRunnable;->access$100(Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$PreloadBigPhotoRunnable;Ljava/lang/String;)Z

    move-result p1

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    return-object v0

    :cond_0
    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object p1

    const-string v1, "android.permission.READ_EXTERNAL_STORAGE"

    invoke-static {p1, v1}, Lcom/miui/gallery/permission/core/PermissionUtils;->checkPermission(Landroid/content/Context;Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_1

    const-string p1, "MiuiCameraCaptureReceiver"

    const-string v1, "Can\'t access external storage, relate permission is ungranted"

    invoke-static {p1, v1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$PreloadBigPhotoRunnable$1;->this$0:Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$PreloadBigPhotoRunnable;

    invoke-static {p1}, Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$PreloadBigPhotoRunnable;->access$200(Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$PreloadBigPhotoRunnable;)J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long p1, v1, v3

    if-lez p1, :cond_2

    const-string p1, "external"

    iget-object v1, p0, Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$PreloadBigPhotoRunnable$1;->this$0:Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$PreloadBigPhotoRunnable;

    invoke-static {v1}, Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$PreloadBigPhotoRunnable;->access$200(Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$PreloadBigPhotoRunnable;)J

    move-result-wide v1

    invoke-static {p1, v1, v2}, Landroid/provider/MediaStore$Files;->getContentUri(Ljava/lang/String;J)Landroid/net/Uri;

    move-result-object p1

    goto :goto_0

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$PreloadBigPhotoRunnable$1;->val$filePath:Ljava/lang/String;

    invoke-static {p1}, Lcom/miui/gallery/util/MediaStoreUtils;->getFileMediaUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    :goto_0
    iget-object v1, p0, Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$PreloadBigPhotoRunnable$1;->this$0:Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$PreloadBigPhotoRunnable;

    iget-object v2, p0, Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$PreloadBigPhotoRunnable$1;->val$filePath:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$PreloadBigPhotoRunnable;->access$100(Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$PreloadBigPhotoRunnable;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    return-object v0

    :cond_3
    if-eqz p1, :cond_4

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p1

    iget-object v1, p0, Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$PreloadBigPhotoRunnable$1;->this$0:Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$PreloadBigPhotoRunnable;

    invoke-static {v1}, Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$PreloadBigPhotoRunnable;->access$300(Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$PreloadBigPhotoRunnable;)Z

    move-result v1

    invoke-static {p1, v1}, Lcom/miui/gallery/activity/ExternalPhotoPageActivity;->preloadThumbnail(Ljava/lang/String;Z)V

    :cond_4
    return-object v0
.end method
