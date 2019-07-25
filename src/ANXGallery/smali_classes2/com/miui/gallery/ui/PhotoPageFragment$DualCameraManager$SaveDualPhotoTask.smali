.class Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager$SaveDualPhotoTask;
.super Landroid/os/AsyncTask;
.source "PhotoPageFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "SaveDualPhotoTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/String;",
        "Ljava/lang/Void;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager$SaveDualPhotoTask;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager$SaveDualPhotoTask;->doInBackground([Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected varargs doInBackground([Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager$SaveDualPhotoTask;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v0}, Lcom/miui/gallery/activity/BaseActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    aget-object v2, p1, v1

    invoke-static {v0, v2}, Lcom/miui/gallery/scanner/MediaScanner;->scanSingleFile(Landroid/content/Context;Ljava/lang/String;)V

    aget-object p1, p1, v1

    return-object p1
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager$SaveDualPhotoTask;->onPostExecute(Ljava/lang/String;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/String;)V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager$SaveDualPhotoTask;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager$SaveDualPhotoTask;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment;->mAdapter:Lcom/miui/gallery/adapter/PhotoPageAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->getDataSet()Lcom/miui/gallery/model/BaseDataSet;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager$SaveDualPhotoTask;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageFragment;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {v1}, Lcom/miui/gallery/widget/ViewPager;->getCurrentItem()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, p1, v1}, Lcom/miui/gallery/model/BaseDataSet;->addNewFile(Ljava/lang/String;I)Z

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager$SaveDualPhotoTask;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "photo_focused_path"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager$SaveDualPhotoTask;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->onContentChanged()V

    return-void
.end method

.method protected onPreExecute()V
    .locals 0

    return-void
.end method
