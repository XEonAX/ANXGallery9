.class Lcom/miui/gallery/ui/AddToAlbumDialogFragment$2;
.super Ljava/lang/Object;
.source "AddToAlbumDialogFragment.java"

# interfaces
.implements Lcom/miui/gallery/ui/CopyOrMoveDialog$OnOperationSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->showCopyOrMoveDialog(J)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/AddToAlbumDialogFragment;

.field final synthetic val$id:J


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/AddToAlbumDialogFragment;J)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$2;->this$0:Lcom/miui/gallery/ui/AddToAlbumDialogFragment;

    iput-wide p2, p0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$2;->val$id:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onOperationSelected(I)V
    .locals 3

    packed-switch p1, :pswitch_data_0

    iget-object p1, p0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$2;->this$0:Lcom/miui/gallery/ui/AddToAlbumDialogFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->access$700(Lcom/miui/gallery/ui/AddToAlbumDialogFragment;)Lcom/miui/gallery/ui/AddToAlbumDialogFragment$OnAlbumSelectedListener;

    move-result-object p1

    const/4 v0, 0x1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$2;->this$0:Lcom/miui/gallery/ui/AddToAlbumDialogFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->access$700(Lcom/miui/gallery/ui/AddToAlbumDialogFragment;)Lcom/miui/gallery/ui/AddToAlbumDialogFragment$OnAlbumSelectedListener;

    move-result-object p1

    iget-wide v1, p0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$2;->val$id:J

    invoke-interface {p1, v1, v2, v0}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$OnAlbumSelectedListener;->onAlbumSelected(JZ)V

    goto :goto_0

    :pswitch_0
    iget-object p1, p0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$2;->this$0:Lcom/miui/gallery/ui/AddToAlbumDialogFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->access$700(Lcom/miui/gallery/ui/AddToAlbumDialogFragment;)Lcom/miui/gallery/ui/AddToAlbumDialogFragment$OnAlbumSelectedListener;

    move-result-object p1

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$2;->this$0:Lcom/miui/gallery/ui/AddToAlbumDialogFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->access$700(Lcom/miui/gallery/ui/AddToAlbumDialogFragment;)Lcom/miui/gallery/ui/AddToAlbumDialogFragment$OnAlbumSelectedListener;

    move-result-object p1

    iget-wide v1, p0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$2;->val$id:J

    invoke-interface {p1, v1, v2, v0}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$OnAlbumSelectedListener;->onAlbumSelected(JZ)V

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$2;->this$0:Lcom/miui/gallery/ui/AddToAlbumDialogFragment;

    invoke-static {p1, v0}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->access$800(Lcom/miui/gallery/ui/AddToAlbumDialogFragment;Z)V

    goto :goto_1

    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$2;->this$0:Lcom/miui/gallery/ui/AddToAlbumDialogFragment;

    invoke-static {p1, v0}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->access$800(Lcom/miui/gallery/ui/AddToAlbumDialogFragment;Z)V

    :goto_1
    :pswitch_1
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
