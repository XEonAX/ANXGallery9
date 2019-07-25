.class Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager$ParsePhotoTask;
.super Landroid/os/AsyncTask;
.source "PhotoPageFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ParsePhotoTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/String;",
        "Ljava/lang/Void;",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager$ParsePhotoTask;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 2

    const/4 v0, 0x0

    aget-object p1, p1, v0

    invoke-static {p1}, Lcom/miui/gallery/util/FileUtils;->isFileExist(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager$ParsePhotoTask;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;

    invoke-static {v1}, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->access$5700(Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;)Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;->isExtraPhoto(Ljava/lang/String;)Z

    move-result p1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager$ParsePhotoTask;->isCancelled()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1

    :cond_0
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1

    :cond_1
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager$ParsePhotoTask;->doInBackground([Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method

.method protected onPostExecute(Ljava/lang/Boolean;)V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager$ParsePhotoTask;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager$ParsePhotoTask;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    invoke-static {v0, v1}, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->access$5802(Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;I)I

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager$ParsePhotoTask;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-static {v0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->access$5900(Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;Z)V

    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager$ParsePhotoTask;->onPostExecute(Ljava/lang/Boolean;)V

    return-void
.end method
