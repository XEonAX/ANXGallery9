.class Lcom/miui/gallery/ui/FacePageFragment$3;
.super Ljava/lang/Object;
.source "FacePageFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/FacePageFragment;->onInflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/FacePageFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/FacePageFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/FacePageFragment$3;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5

    iget-object p1, p0, Lcom/miui/gallery/ui/FacePageFragment$3;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/FacePageFragment;->getIsHasEverNotCreateBabyAlbumFromThis()J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long p1, v0, v2

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/FacePageFragment$3;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/FacePageFragment;->access$700(Lcom/miui/gallery/ui/FacePageFragment;)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/FacePageFragment$3;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    iget-object p1, p1, Lcom/miui/gallery/ui/FacePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    new-instance v2, Lcom/miui/gallery/share/Path;

    const/4 v3, 0x1

    const/4 v4, 0x0

    invoke-direct {v2, v0, v1, v4, v3}, Lcom/miui/gallery/share/Path;-><init>(JZZ)V

    invoke-static {p1, v2, v4}, Lcom/miui/gallery/share/UIHelper;->showAlbumShareInfo(Landroid/app/Activity;Lcom/miui/gallery/share/Path;I)V

    const-string p1, "face"

    const-string v0, "face_enter_album_share"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method
