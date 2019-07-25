.class Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager$4;
.super Ljava/lang/Object;
.source "PhotoPageFragment.java"

# interfaces
.implements Lcom/miui/gallery/ui/ProcessTask$OnCompleteListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->playVideo(Lcom/miui/gallery/model/BaseDataItem;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/ui/ProcessTask$OnCompleteListener<",
        "Landroid/net/Uri;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;

.field final synthetic val$dataItem:Lcom/miui/gallery/model/BaseDataItem;

.field final synthetic val$mode:I


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;Lcom/miui/gallery/model/BaseDataItem;I)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager$4;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;

    iput-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager$4;->val$dataItem:Lcom/miui/gallery/model/BaseDataItem;

    iput p3, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager$4;->val$mode:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompleteProcess(Landroid/net/Uri;)V
    .locals 4

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager$4;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager$4;->val$dataItem:Lcom/miui/gallery/model/BaseDataItem;

    const/4 v2, 0x1

    iget v3, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager$4;->val$mode:I

    invoke-static {v0, v1, p1, v2, v3}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->access$7900(Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;Lcom/miui/gallery/model/BaseDataItem;Landroid/net/Uri;ZI)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager$4;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const v0, 0x7f1002ee

    invoke-static {p1, v0}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    :goto_0
    return-void
.end method

.method public bridge synthetic onCompleteProcess(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Landroid/net/Uri;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager$4;->onCompleteProcess(Landroid/net/Uri;)V

    return-void
.end method
