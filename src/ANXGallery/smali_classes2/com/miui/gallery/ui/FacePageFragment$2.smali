.class Lcom/miui/gallery/ui/FacePageFragment$2;
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

    iput-object p1, p0, Lcom/miui/gallery/ui/FacePageFragment$2;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    iget-object p1, p0, Lcom/miui/gallery/ui/FacePageFragment$2;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/FacePageFragment;->access$400(Lcom/miui/gallery/ui/FacePageFragment;)Lcom/miui/gallery/provider/deprecated/PeopleRecommendMediaSet;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/provider/deprecated/PeopleRecommendMediaSet;->refreshRecommendInfo()V

    new-instance p1, Landroid/content/Intent;

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment$2;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/FacePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const-class v1, Lcom/miui/gallery/activity/facebaby/RecommendFacePageActivity;

    invoke-direct {p1, v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v0, "server_id_of_album"

    iget-object v1, p0, Lcom/miui/gallery/ui/FacePageFragment$2;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-virtual {v1}, Lcom/miui/gallery/ui/FacePageFragment;->getServerIdOfAlbum()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v0, "local_id_of_album"

    iget-object v1, p0, Lcom/miui/gallery/ui/FacePageFragment$2;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-static {v1}, Lcom/miui/gallery/ui/FacePageFragment;->access$500(Lcom/miui/gallery/ui/FacePageFragment;)J

    move-result-wide v1

    invoke-virtual {p1, v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    const-string v0, "album_name"

    iget-object v1, p0, Lcom/miui/gallery/ui/FacePageFragment$2;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-static {v1}, Lcom/miui/gallery/ui/FacePageFragment;->access$600(Lcom/miui/gallery/ui/FacePageFragment;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v0, "server_ids_of_faces"

    iget-object v1, p0, Lcom/miui/gallery/ui/FacePageFragment$2;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-static {v1}, Lcom/miui/gallery/ui/FacePageFragment;->access$400(Lcom/miui/gallery/ui/FacePageFragment;)Lcom/miui/gallery/provider/deprecated/PeopleRecommendMediaSet;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/provider/deprecated/PeopleRecommendMediaSet;->getServerIdsIn()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment$2;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    const/16 v1, 0x15

    invoke-virtual {v0, p1, v1}, Lcom/miui/gallery/ui/FacePageFragment;->startActivityForResult(Landroid/content/Intent;I)V

    const-string p1, "face"

    const-string v0, "face_enter_recommend"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
