.class Lcom/miui/gallery/ui/PeoplePageFragment$2;
.super Lcom/miui/gallery/widget/AntiDoubleItemClickListener;
.source "PeoplePageFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PeoplePageFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/PeoplePageFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/PeoplePageFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment$2;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    invoke-direct {p0}, Lcom/miui/gallery/widget/AntiDoubleItemClickListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onAntiDoubleItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    iget-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment$2;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/PeoplePageFragment;->access$600(Lcom/miui/gallery/ui/PeoplePageFragment;)Lcom/miui/gallery/adapter/PeoplePageAdapter;

    move-result-object p1

    invoke-virtual {p1, p3}, Lcom/miui/gallery/adapter/PeoplePageAdapter;->getPeopleIdOfItem(I)Ljava/lang/String;

    move-result-object p1

    iget-object p4, p0, Lcom/miui/gallery/ui/PeoplePageFragment$2;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    invoke-static {p4}, Lcom/miui/gallery/ui/PeoplePageFragment;->access$600(Lcom/miui/gallery/ui/PeoplePageFragment;)Lcom/miui/gallery/adapter/PeoplePageAdapter;

    move-result-object p4

    invoke-virtual {p4, p3}, Lcom/miui/gallery/adapter/PeoplePageAdapter;->getPeopleLocalIdOfItem(I)Ljava/lang/String;

    move-result-object p4

    check-cast p2, Lcom/miui/gallery/ui/PeoplePageGridItem;

    invoke-virtual {p2}, Lcom/miui/gallery/ui/PeoplePageGridItem;->getName()Ljava/lang/String;

    move-result-object p2

    iget-object p5, p0, Lcom/miui/gallery/ui/PeoplePageFragment$2;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    invoke-static {p5}, Lcom/miui/gallery/ui/PeoplePageFragment;->access$700(Lcom/miui/gallery/ui/PeoplePageFragment;)Z

    move-result p5

    if-eqz p5, :cond_2

    iget-object p3, p0, Lcom/miui/gallery/ui/PeoplePageFragment$2;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    invoke-static {p3}, Lcom/miui/gallery/ui/PeoplePageFragment;->access$800(Lcom/miui/gallery/ui/PeoplePageFragment;)Lcom/miui/gallery/model/PeopleContactInfo$Relation;

    move-result-object p3

    if-eqz p3, :cond_0

    new-instance p3, Lcom/miui/gallery/ui/ProcessTask;

    new-instance p5, Lcom/miui/gallery/ui/PeoplePageFragment$2$1;

    invoke-direct {p5, p0, p4}, Lcom/miui/gallery/ui/PeoplePageFragment$2$1;-><init>(Lcom/miui/gallery/ui/PeoplePageFragment$2;Ljava/lang/String;)V

    invoke-direct {p3, p5}, Lcom/miui/gallery/ui/ProcessTask;-><init>(Lcom/miui/gallery/ui/ProcessTask$ProcessCallback;)V

    new-instance p5, Lcom/miui/gallery/ui/PeoplePageFragment$2$2;

    invoke-direct {p5, p0, p4, p1, p2}, Lcom/miui/gallery/ui/PeoplePageFragment$2$2;-><init>(Lcom/miui/gallery/ui/PeoplePageFragment$2;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p3, p5}, Lcom/miui/gallery/ui/ProcessTask;->setCompleteListener(Lcom/miui/gallery/ui/ProcessTask$OnCompleteListener;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment$2;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    iget-object p1, p1, Lcom/miui/gallery/ui/PeoplePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    iget-object p2, p0, Lcom/miui/gallery/ui/PeoplePageFragment$2;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    const p4, 0x7f100467

    invoke-virtual {p2, p4}, Lcom/miui/gallery/ui/PeoplePageFragment;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p3, p1, p2}, Lcom/miui/gallery/ui/ProcessTask;->showProgress(Landroid/app/Activity;Ljava/lang/String;)V

    sget-object p1, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 p2, 0x0

    new-array p2, p2, [Ljava/lang/Void;

    invoke-virtual {p3, p1, p2}, Lcom/miui/gallery/ui/ProcessTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto/16 :goto_1

    :cond_0
    iget-object p3, p0, Lcom/miui/gallery/ui/PeoplePageFragment$2;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    invoke-static {p3}, Lcom/miui/gallery/ui/PeoplePageFragment;->access$900(Lcom/miui/gallery/ui/PeoplePageFragment;)Ljava/lang/String;

    move-result-object p3

    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p3

    if-nez p3, :cond_3

    new-instance p3, Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;

    invoke-static {p4}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object p5

    invoke-virtual {p5}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    iget-object p5, p0, Lcom/miui/gallery/ui/PeoplePageFragment$2;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    invoke-static {p5}, Lcom/miui/gallery/ui/PeoplePageFragment;->access$900(Lcom/miui/gallery/ui/PeoplePageFragment;)Ljava/lang/String;

    move-result-object p5

    invoke-static {p5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p5

    if-eqz p5, :cond_1

    move-object p5, p2

    goto :goto_0

    :cond_1
    iget-object p5, p0, Lcom/miui/gallery/ui/PeoplePageFragment$2;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    invoke-static {p5}, Lcom/miui/gallery/ui/PeoplePageFragment;->access$900(Lcom/miui/gallery/ui/PeoplePageFragment;)Ljava/lang/String;

    move-result-object p5

    :goto_0
    invoke-direct {p3, v0, v1, p1, p5}, Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;-><init>(JLjava/lang/String;Ljava/lang/String;)V

    iget-object p5, p0, Lcom/miui/gallery/ui/PeoplePageFragment$2;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    new-instance v0, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;

    iget-object v1, p0, Lcom/miui/gallery/ui/PeoplePageFragment$2;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    iget-object v1, v1, Lcom/miui/gallery/ui/PeoplePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    new-instance v2, Lcom/miui/gallery/ui/PeoplePageFragment$2$3;

    invoke-direct {v2, p0, p4, p1, p2}, Lcom/miui/gallery/ui/PeoplePageFragment$2$3;-><init>(Lcom/miui/gallery/ui/PeoplePageFragment$2;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {v0, v1, p3, v2}, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;-><init>(Landroid/app/Activity;Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler$ConfirmListener;)V

    invoke-static {p5, v0}, Lcom/miui/gallery/ui/PeoplePageFragment;->access$1102(Lcom/miui/gallery/ui/PeoplePageFragment;Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;)Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;

    iget-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment$2;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/PeoplePageFragment;->access$1100(Lcom/miui/gallery/ui/PeoplePageFragment;)Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;->show()V

    goto :goto_1

    :cond_2
    new-instance p5, Landroid/content/Intent;

    invoke-direct {p5}, Landroid/content/Intent;-><init>()V

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "server_id_of_album"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "local_id_of_album"

    invoke-virtual {v0, p1, p4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "album_name"

    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "relationType"

    iget-object p2, p0, Lcom/miui/gallery/ui/PeoplePageFragment$2;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    invoke-static {p2}, Lcom/miui/gallery/ui/PeoplePageFragment;->access$600(Lcom/miui/gallery/ui/PeoplePageFragment;)Lcom/miui/gallery/adapter/PeoplePageAdapter;

    move-result-object p2

    invoke-virtual {p2, p3}, Lcom/miui/gallery/adapter/PeoplePageAdapter;->getRelationTypeOfItem(I)I

    move-result p2

    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string p1, "face_album_cover"

    iget-object p2, p0, Lcom/miui/gallery/ui/PeoplePageFragment$2;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    invoke-static {p2}, Lcom/miui/gallery/ui/PeoplePageFragment;->access$600(Lcom/miui/gallery/ui/PeoplePageFragment;)Lcom/miui/gallery/adapter/PeoplePageAdapter;

    move-result-object p2

    invoke-virtual {p2, p3}, Lcom/miui/gallery/adapter/PeoplePageAdapter;->getThumbFilePath(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "face_position_rect"

    iget-object p2, p0, Lcom/miui/gallery/ui/PeoplePageFragment$2;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    invoke-static {p2}, Lcom/miui/gallery/ui/PeoplePageFragment;->access$600(Lcom/miui/gallery/ui/PeoplePageFragment;)Lcom/miui/gallery/adapter/PeoplePageAdapter;

    move-result-object p2

    invoke-virtual {p2, p3}, Lcom/miui/gallery/adapter/PeoplePageAdapter;->getFaceRegionRectF(I)Landroid/graphics/RectF;

    move-result-object p2

    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    invoke-virtual {p5, v0}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    iget-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment$2;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    iget-object p1, p1, Lcom/miui/gallery/ui/PeoplePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const-class p2, Lcom/miui/gallery/activity/facebaby/FacePageActivity;

    invoke-virtual {p5, p1, p2}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    iget-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment$2;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    invoke-virtual {p1, p5}, Lcom/miui/gallery/ui/PeoplePageFragment;->startActivity(Landroid/content/Intent;)V

    :cond_3
    :goto_1
    return-void
.end method
