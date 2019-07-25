.class Lcom/miui/gallery/ui/SaveUriDialogFragment$2$1;
.super Ljava/lang/Object;
.source "SaveUriDialogFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/SaveUriDialogFragment$2;->onFutureDone(Lcom/miui/gallery/threadpool/Future;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/ui/SaveUriDialogFragment$2;

.field final synthetic val$future:Lcom/miui/gallery/threadpool/Future;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/SaveUriDialogFragment$2;Lcom/miui/gallery/threadpool/Future;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/SaveUriDialogFragment$2$1;->this$1:Lcom/miui/gallery/ui/SaveUriDialogFragment$2;

    iput-object p2, p0, Lcom/miui/gallery/ui/SaveUriDialogFragment$2$1;->val$future:Lcom/miui/gallery/threadpool/Future;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/SaveUriDialogFragment$2$1;->this$1:Lcom/miui/gallery/ui/SaveUriDialogFragment$2;

    iget-object v0, v0, Lcom/miui/gallery/ui/SaveUriDialogFragment$2;->this$0:Lcom/miui/gallery/ui/SaveUriDialogFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/SaveUriDialogFragment;->access$100(Lcom/miui/gallery/ui/SaveUriDialogFragment;)Lcom/miui/gallery/ui/SaveUriDialogFragment$OnCompleteListener;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/SaveUriDialogFragment$2$1;->this$1:Lcom/miui/gallery/ui/SaveUriDialogFragment$2;

    iget-object v0, v0, Lcom/miui/gallery/ui/SaveUriDialogFragment$2;->this$0:Lcom/miui/gallery/ui/SaveUriDialogFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/SaveUriDialogFragment;->access$100(Lcom/miui/gallery/ui/SaveUriDialogFragment;)Lcom/miui/gallery/ui/SaveUriDialogFragment$OnCompleteListener;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/SaveUriDialogFragment$2$1;->val$future:Lcom/miui/gallery/threadpool/Future;

    invoke-interface {v1}, Lcom/miui/gallery/threadpool/Future;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-interface {v0, v1}, Lcom/miui/gallery/ui/SaveUriDialogFragment$OnCompleteListener;->onComplete(Ljava/lang/String;)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/SaveUriDialogFragment$2$1;->this$1:Lcom/miui/gallery/ui/SaveUriDialogFragment$2;

    iget-object v0, v0, Lcom/miui/gallery/ui/SaveUriDialogFragment$2;->this$0:Lcom/miui/gallery/ui/SaveUriDialogFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/SaveUriDialogFragment;->isAdded()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/SaveUriDialogFragment$2$1;->this$1:Lcom/miui/gallery/ui/SaveUriDialogFragment$2;

    iget-object v0, v0, Lcom/miui/gallery/ui/SaveUriDialogFragment$2;->this$0:Lcom/miui/gallery/ui/SaveUriDialogFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/SaveUriDialogFragment;->dismissAllowingStateLoss()V

    :cond_1
    return-void
.end method
