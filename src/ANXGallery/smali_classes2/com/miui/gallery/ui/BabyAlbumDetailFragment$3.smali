.class Lcom/miui/gallery/ui/BabyAlbumDetailFragment$3;
.super Ljava/lang/Object;
.source "BabyAlbumDetailFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->intialFaceHeader(Lcom/miui/gallery/ui/BabyAlbumDetailFaceHeaderItem;Lcom/miui/gallery/cloud/baby/BabyInfo;Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/BabyAlbumDetailFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/BabyAlbumDetailFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment$3;->this$0:Lcom/miui/gallery/ui/BabyAlbumDetailFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment$3;->this$0:Lcom/miui/gallery/ui/BabyAlbumDetailFragment;

    iget-boolean p1, p1, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mIsOtherShareAlbum:Z

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment$3;->this$0:Lcom/miui/gallery/ui/BabyAlbumDetailFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->access$100(Lcom/miui/gallery/ui/BabyAlbumDetailFragment;)Lcom/miui/gallery/ui/BabyAlbumDetailFragment$ActionBarHelper;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/ui/BabyAlbumDetailFragment$ActionBarHelper;->access$1000(Lcom/miui/gallery/ui/BabyAlbumDetailFragment$ActionBarHelper;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment$3;->this$0:Lcom/miui/gallery/ui/BabyAlbumDetailFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->access$1100(Lcom/miui/gallery/ui/BabyAlbumDetailFragment;)V

    :cond_0
    return-void
.end method
