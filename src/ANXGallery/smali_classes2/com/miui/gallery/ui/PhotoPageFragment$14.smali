.class Lcom/miui/gallery/ui/PhotoPageFragment$14;
.super Ljava/lang/Object;
.source "PhotoPageFragment.java"

# interfaces
.implements Lcom/miui/gallery/ui/DownloadFragment$OnDownloadListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/PhotoPageFragment;->doDownloadOrigin(Lcom/miui/gallery/model/BaseDataItem;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/miui/gallery/ui/PhotoPageFragment$DownloadCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

.field final synthetic val$downloadCallback:Lcom/miui/gallery/ui/PhotoPageFragment$DownloadCallback;

.field final synthetic val$imageType:Lcom/miui/gallery/sdk/download/DownloadType;

.field final synthetic val$item:Lcom/miui/gallery/model/BaseDataItem;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/PhotoPageFragment;Lcom/miui/gallery/model/BaseDataItem;Lcom/miui/gallery/ui/PhotoPageFragment$DownloadCallback;Lcom/miui/gallery/sdk/download/DownloadType;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$14;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iput-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$14;->val$item:Lcom/miui/gallery/model/BaseDataItem;

    iput-object p3, p0, Lcom/miui/gallery/ui/PhotoPageFragment$14;->val$downloadCallback:Lcom/miui/gallery/ui/PhotoPageFragment$DownloadCallback;

    iput-object p4, p0, Lcom/miui/gallery/ui/PhotoPageFragment$14;->val$imageType:Lcom/miui/gallery/sdk/download/DownloadType;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCanceled()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$14;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$2800(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/util/uil/CloudImageLoadingListener;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$14;->val$item:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v1}, Lcom/miui/gallery/model/BaseDataItem;->getDownloadUri()Landroid/net/Uri;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$14;->val$imageType:Lcom/miui/gallery/sdk/download/DownloadType;

    const/4 v3, 0x0

    invoke-interface {v0, v1, v2, v3}, Lcom/miui/gallery/util/uil/CloudImageLoadingListener;->onLoadingCancelled(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Landroid/view/View;)V

    return-void
.end method

.method public onDownloadComplete(Ljava/util/List;Ljava/util/List;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;",
            ">;",
            "Ljava/util/List<",
            "Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;",
            ">;)V"
        }
    .end annotation

    if-eqz p1, :cond_1

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p2

    const/4 v0, 0x1

    if-ge p2, v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$14;->val$item:Lcom/miui/gallery/model/BaseDataItem;

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;

    invoke-virtual {v1}, Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;->getDownloadPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Lcom/miui/gallery/model/BaseDataItem;->setFilePath(Ljava/lang/String;)Lcom/miui/gallery/model/BaseDataItem;

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$14;->val$downloadCallback:Lcom/miui/gallery/ui/PhotoPageFragment$DownloadCallback;

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;

    invoke-virtual {p1}, Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;->getDownloadPath()Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$14;->val$item:Lcom/miui/gallery/model/BaseDataItem;

    invoke-interface {p2, p1, v0}, Lcom/miui/gallery/ui/PhotoPageFragment$DownloadCallback;->downloadSuccess(Ljava/lang/String;Lcom/miui/gallery/model/BaseDataItem;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$14;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$2800(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/util/uil/CloudImageLoadingListener;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$14;->val$item:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {p2}, Lcom/miui/gallery/model/BaseDataItem;->getDownloadUri()Landroid/net/Uri;

    move-result-object p2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$14;->val$imageType:Lcom/miui/gallery/sdk/download/DownloadType;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$14;->val$item:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v2}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p1, p2, v0, v1, v2}, Lcom/miui/gallery/util/uil/CloudImageLoadingListener;->onDownloadComplete(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Landroid/view/View;Ljava/lang/String;)V

    goto :goto_1

    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$14;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v0, p1, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$14;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f100317

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$14;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f100319

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    const v3, 0x7f100318

    const/high16 v4, 0x1040000

    new-instance v5, Lcom/miui/gallery/ui/PhotoPageFragment$14$1;

    invoke-direct {v5, p0}, Lcom/miui/gallery/ui/PhotoPageFragment$14$1;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment$14;)V

    new-instance v6, Lcom/miui/gallery/ui/PhotoPageFragment$14$2;

    invoke-direct {v6, p0}, Lcom/miui/gallery/ui/PhotoPageFragment$14$2;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment$14;)V

    invoke-static/range {v0 .. v6}, Lcom/miui/gallery/util/DialogUtil;->showInfoDialog(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;IILandroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog;

    :goto_1
    return-void
.end method
