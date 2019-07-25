.class Lcom/miui/gallery/ui/FacePageFragment$19$2;
.super Ljava/lang/Object;
.source "FacePageFragment.java"

# interfaces
.implements Lcom/miui/gallery/threadpool/ThreadPool$Job;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/FacePageFragment$19;->onConfirm(Ljava/lang/String;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/threadpool/ThreadPool$Job<",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/ui/FacePageFragment$19;

.field final synthetic val$newName:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/FacePageFragment$19;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/FacePageFragment$19$2;->this$1:Lcom/miui/gallery/ui/FacePageFragment$19;

    iput-object p2, p0, Lcom/miui/gallery/ui/FacePageFragment$19$2;->val$newName:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/FacePageFragment$19$2;->run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method public run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Void;
    .locals 4

    iget-object p1, p0, Lcom/miui/gallery/ui/FacePageFragment$19$2;->this$1:Lcom/miui/gallery/ui/FacePageFragment$19;

    iget-object p1, p1, Lcom/miui/gallery/ui/FacePageFragment$19;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    iget-object p1, p1, Lcom/miui/gallery/ui/FacePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment$19$2;->val$newName:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/miui/gallery/cloud/peopleface/FaceDataManager;->getGroupByPeopleName(Landroid/content/Context;Ljava/lang/String;)Lcom/miui/gallery/cloud/peopleface/PeopleFace;

    move-result-object p1

    if-eqz p1, :cond_0

    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/miui/gallery/ui/FacePageFragment$19$2;->this$1:Lcom/miui/gallery/ui/FacePageFragment$19;

    iget-object v1, v1, Lcom/miui/gallery/ui/FacePageFragment$19;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    iget-object v1, v1, Lcom/miui/gallery/ui/FacePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const-class v2, Lcom/miui/gallery/activity/facebaby/FacePageActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "server_id_of_album"

    iget-object v3, p1, Lcom/miui/gallery/cloud/peopleface/PeopleFace;->serverId:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "local_id_of_album"

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/peopleface/PeopleFace;->getId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "album_name"

    iget-object v3, p0, Lcom/miui/gallery/ui/FacePageFragment$19$2;->val$newName:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "relationType"

    iget v3, p1, Lcom/miui/gallery/cloud/peopleface/PeopleFace;->relationType:I

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const/4 v2, 0x1

    new-array v2, v2, [Landroid/graphics/RectF;

    iget-object p1, p1, Lcom/miui/gallery/cloud/peopleface/PeopleFace;->serverId:Ljava/lang/String;

    invoke-static {p1, v2}, Lcom/miui/gallery/provider/FaceManager;->queryCoverImageOfOnePerson(Ljava/lang/String;[Landroid/graphics/RectF;)Ljava/lang/String;

    move-result-object p1

    const-string v3, "face_album_cover"

    invoke-virtual {v1, v3, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "face_position_rect"

    const/4 v3, 0x0

    aget-object v2, v2, v3

    invoke-virtual {v1, p1, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    invoke-virtual {v0, v1}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    iget-object p1, p0, Lcom/miui/gallery/ui/FacePageFragment$19$2;->this$1:Lcom/miui/gallery/ui/FacePageFragment$19;

    iget-object p1, p1, Lcom/miui/gallery/ui/FacePageFragment$19;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    iget-object p1, p1, Lcom/miui/gallery/ui/FacePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/activity/BaseActivity;->startActivity(Landroid/content/Intent;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/FacePageFragment$19$2;->this$1:Lcom/miui/gallery/ui/FacePageFragment$19;

    iget-object p1, p1, Lcom/miui/gallery/ui/FacePageFragment$19;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    iget-object p1, p1, Lcom/miui/gallery/ui/FacePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {p1}, Lcom/miui/gallery/activity/BaseActivity;->finish()V

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method
