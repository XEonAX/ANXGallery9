.class Lcom/miui/gallery/ui/AlbumPageFragment$3;
.super Ljava/lang/Object;
.source "AlbumPageFragment.java"

# interfaces
.implements Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$OnAlbumOperationDoneListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/AlbumPageFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/AlbumPageFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/AlbumPageFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/AlbumPageFragment$3;->this$0:Lcom/miui/gallery/ui/AlbumPageFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onOperationDone(JLjava/lang/String;)V
    .locals 2

    const-wide/16 v0, 0x0

    cmp-long p3, p1, v0

    if-lez p3, :cond_0

    iget-object p3, p0, Lcom/miui/gallery/ui/AlbumPageFragment$3;->this$0:Lcom/miui/gallery/ui/AlbumPageFragment;

    invoke-virtual {p3}, Lcom/miui/gallery/ui/AlbumPageFragment;->isAdded()Z

    move-result p3

    if-eqz p3, :cond_0

    iget-object p3, p0, Lcom/miui/gallery/ui/AlbumPageFragment$3;->this$0:Lcom/miui/gallery/ui/AlbumPageFragment;

    const/4 v0, 0x1

    invoke-static {p3, v0}, Lcom/miui/gallery/ui/AlbumPageFragment;->access$1802(Lcom/miui/gallery/ui/AlbumPageFragment;Z)Z

    iget-object p3, p0, Lcom/miui/gallery/ui/AlbumPageFragment$3;->this$0:Lcom/miui/gallery/ui/AlbumPageFragment;

    invoke-static {p3, p1, p2}, Lcom/miui/gallery/ui/AlbumPageFragment;->access$1902(Lcom/miui/gallery/ui/AlbumPageFragment;J)J

    iget-object p3, p0, Lcom/miui/gallery/ui/AlbumPageFragment$3;->this$0:Lcom/miui/gallery/ui/AlbumPageFragment;

    invoke-static {p3, p1, p2}, Lcom/miui/gallery/ui/AddPhotosFragment;->addPhotos(Landroid/app/Fragment;J)V

    :cond_0
    return-void
.end method
