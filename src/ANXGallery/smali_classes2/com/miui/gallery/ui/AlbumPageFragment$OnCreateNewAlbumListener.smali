.class Lcom/miui/gallery/ui/AlbumPageFragment$OnCreateNewAlbumListener;
.super Ljava/lang/Object;
.source "AlbumPageFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/AlbumPageFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "OnCreateNewAlbumListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/AlbumPageFragment;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/ui/AlbumPageFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/AlbumPageFragment$OnCreateNewAlbumListener;->this$0:Lcom/miui/gallery/ui/AlbumPageFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/ui/AlbumPageFragment;Lcom/miui/gallery/ui/AlbumPageFragment$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/AlbumPageFragment$OnCreateNewAlbumListener;-><init>(Lcom/miui/gallery/ui/AlbumPageFragment;)V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    new-instance p1, Lcom/miui/gallery/ui/AlbumCreatorDialogFragment;

    invoke-direct {p1}, Lcom/miui/gallery/ui/AlbumCreatorDialogFragment;-><init>()V

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumPageFragment$OnCreateNewAlbumListener;->this$0:Lcom/miui/gallery/ui/AlbumPageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/AlbumPageFragment;->access$300(Lcom/miui/gallery/ui/AlbumPageFragment;)Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$OnAlbumOperationDoneListener;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/ui/AlbumCreatorDialogFragment;->setOnAlbumOperationDoneListener(Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$OnAlbumOperationDoneListener;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumPageFragment$OnCreateNewAlbumListener;->this$0:Lcom/miui/gallery/ui/AlbumPageFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/AlbumPageFragment;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    const-string v1, "AlbumCreatorDialogFragment"

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/ui/AlbumCreatorDialogFragment;->showAllowingStateLoss(Landroid/app/FragmentManager;Ljava/lang/String;)V

    const-string p1, "album"

    const-string v0, "create_album"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
