.class Lcom/miui/gallery/ui/AddToAlbumDialogFragment$3;
.super Ljava/lang/Object;
.source "AddToAlbumDialogFragment.java"

# interfaces
.implements Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$OnAlbumOperationDoneListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/AddToAlbumDialogFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/AddToAlbumDialogFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/AddToAlbumDialogFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$3;->this$0:Lcom/miui/gallery/ui/AddToAlbumDialogFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onOperationDone(JLjava/lang/String;)V
    .locals 2

    const-wide/16 v0, 0x0

    cmp-long p3, p1, v0

    if-lez p3, :cond_0

    iget-object p3, p0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$3;->this$0:Lcom/miui/gallery/ui/AddToAlbumDialogFragment;

    iget-object v0, p0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$3;->this$0:Lcom/miui/gallery/ui/AddToAlbumDialogFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->access$1100(Lcom/miui/gallery/ui/AddToAlbumDialogFragment;)Z

    move-result v0

    invoke-static {p3, p1, p2, v0}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->access$1000(Lcom/miui/gallery/ui/AddToAlbumDialogFragment;JZ)V

    :cond_0
    return-void
.end method
