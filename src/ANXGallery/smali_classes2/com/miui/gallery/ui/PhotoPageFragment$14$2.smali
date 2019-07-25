.class Lcom/miui/gallery/ui/PhotoPageFragment$14$2;
.super Ljava/lang/Object;
.source "PhotoPageFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/PhotoPageFragment$14;->onDownloadComplete(Ljava/util/List;Ljava/util/List;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/ui/PhotoPageFragment$14;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/PhotoPageFragment$14;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$14$2;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$14;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$14$2;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$14;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragment$14;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$2800(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/util/uil/CloudImageLoadingListener;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$14$2;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$14;

    iget-object p2, p2, Lcom/miui/gallery/ui/PhotoPageFragment$14;->val$item:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {p2}, Lcom/miui/gallery/model/BaseDataItem;->getDownloadUri()Landroid/net/Uri;

    move-result-object p2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$14$2;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$14;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment$14;->val$imageType:Lcom/miui/gallery/sdk/download/DownloadType;

    const/4 v1, 0x0

    invoke-interface {p1, p2, v0, v1}, Lcom/miui/gallery/util/uil/CloudImageLoadingListener;->onLoadingCancelled(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Landroid/view/View;)V

    return-void
.end method
