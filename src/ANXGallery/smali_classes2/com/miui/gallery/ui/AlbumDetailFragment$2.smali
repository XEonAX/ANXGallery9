.class Lcom/miui/gallery/ui/AlbumDetailFragment$2;
.super Ljava/lang/Object;
.source "AlbumDetailFragment.java"

# interfaces
.implements Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$OnAlbumOperationDoneListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/AlbumDetailFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/AlbumDetailFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/AlbumDetailFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/AlbumDetailFragment$2;->this$0:Lcom/miui/gallery/ui/AlbumDetailFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onOperationDone(JLjava/lang/String;)V
    .locals 3

    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-lez v2, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/AlbumDetailFragment$2;->this$0:Lcom/miui/gallery/ui/AlbumDetailFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/AlbumDetailFragment;->isAdded()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/AlbumDetailFragment$2;->this$0:Lcom/miui/gallery/ui/AlbumDetailFragment;

    iput-object p3, p1, Lcom/miui/gallery/ui/AlbumDetailFragment;->mAlbumName:Ljava/lang/String;

    iget-object p1, p0, Lcom/miui/gallery/ui/AlbumDetailFragment$2;->this$0:Lcom/miui/gallery/ui/AlbumDetailFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/AlbumDetailFragment;->access$500(Lcom/miui/gallery/ui/AlbumDetailFragment;)V

    :cond_0
    return-void
.end method
