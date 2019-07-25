.class Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$MyEditItemSelectChangeListener;
.super Ljava/lang/Object;
.source "MovieEditorMenuFragment.java"

# interfaces
.implements Lcom/miui/gallery/movie/ui/adapter/BaseAdapter$ItemSelectChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MyEditItemSelectChangeListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$MyEditItemSelectChangeListener;->this$0:Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$MyEditItemSelectChangeListener;-><init>(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;)V

    return-void
.end method


# virtual methods
.method public onItemSelect(Landroid/support/v7/widget/RecyclerView;Lcom/miui/gallery/movie/ui/adapter/BaseAdapter$BaseHolder;IZ)Z
    .locals 4

    iget-object p2, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$MyEditItemSelectChangeListener;->this$0:Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;

    invoke-static {p2}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->access$300(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;)Lcom/miui/gallery/movie/ui/adapter/EditAdapter;

    move-result-object p2

    invoke-virtual {p2, p3}, Lcom/miui/gallery/movie/ui/adapter/EditAdapter;->isAddItem(I)Z

    move-result p2

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eqz p2, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$MyEditItemSelectChangeListener;->this$0:Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;

    invoke-static {p1}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->access$1000(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;)Lcom/miui/gallery/movie/entity/MovieInfo;

    move-result-object p1

    iget-boolean p1, p1, Lcom/miui/gallery/movie/entity/MovieInfo;->isFromStory:Z

    const/16 p2, 0x14

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$MyEditItemSelectChangeListener;->this$0:Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;

    invoke-static {p1}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->access$1500(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$MyEditItemSelectChangeListener;->this$0:Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;

    invoke-static {p1}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->access$000(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;)Lcom/miui/gallery/movie/ui/listener/MenuFragmentListener;

    move-result-object p1

    invoke-interface {p1}, Lcom/miui/gallery/movie/ui/listener/MenuFragmentListener;->updateStorySha1Data()V

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$MyEditItemSelectChangeListener;->this$0:Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;

    invoke-static {p1, v0}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->access$1502(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;Z)Z

    :cond_0
    new-instance p1, Landroid/content/Intent;

    iget-object p3, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$MyEditItemSelectChangeListener;->this$0:Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;

    invoke-virtual {p3}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->getActivity()Landroid/app/Activity;

    move-result-object p3

    const-class p4, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;

    invoke-direct {p1, p3, p4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string p3, "card_id"

    iget-object p4, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$MyEditItemSelectChangeListener;->this$0:Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;

    invoke-static {p4}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->access$1600(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;)J

    move-result-wide v2

    invoke-virtual {p1, p3, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    const-string p3, "pick_sha1"

    iget-object p4, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$MyEditItemSelectChangeListener;->this$0:Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;

    invoke-static {p4}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->access$000(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;)Lcom/miui/gallery/movie/ui/listener/MenuFragmentListener;

    move-result-object p4

    invoke-interface {p4}, Lcom/miui/gallery/movie/ui/listener/MenuFragmentListener;->getStoryMovieSha1()Ljava/util/ArrayList;

    move-result-object p4

    invoke-virtual {p1, p3, p4}, Landroid/content/Intent;->putStringArrayListExtra(Ljava/lang/String;Ljava/util/ArrayList;)Landroid/content/Intent;

    const-string p3, "pick-upper-bound"

    invoke-virtual {p1, p3, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string p2, "pick-lower-bound"

    const/4 p3, 0x3

    invoke-virtual {p1, p2, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    iget-object p2, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$MyEditItemSelectChangeListener;->this$0:Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;

    invoke-virtual {p2, p1, v1}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$MyEditItemSelectChangeListener;->this$0:Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;

    invoke-static {p1}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->access$300(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;)Lcom/miui/gallery/movie/ui/adapter/EditAdapter;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/movie/ui/adapter/EditAdapter;->getListSize()I

    move-result p1

    if-lt p1, p2, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$MyEditItemSelectChangeListener;->this$0:Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    const p2, 0x7f10047e

    invoke-static {p1, p2}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    goto :goto_0

    :cond_2
    new-instance p1, Landroid/content/Intent;

    const-string p3, "android.intent.action.GET_CONTENT"

    invoke-direct {p1, p3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string p3, "image/*"

    invoke-virtual {p1, p3}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    const-string p3, "pick-upper-bound"

    iget-object p4, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$MyEditItemSelectChangeListener;->this$0:Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;

    invoke-static {p4}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->access$300(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;)Lcom/miui/gallery/movie/ui/adapter/EditAdapter;

    move-result-object p4

    invoke-virtual {p4}, Lcom/miui/gallery/movie/ui/adapter/EditAdapter;->getList()Ljava/util/List;

    move-result-object p4

    invoke-interface {p4}, Ljava/util/List;->size()I

    move-result p4

    sub-int/2addr p2, p4

    invoke-virtual {p1, p3, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string p2, "com.miui.gallery"

    invoke-virtual {p1, p2}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    iget-object p2, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$MyEditItemSelectChangeListener;->this$0:Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;

    const/4 p3, 0x7

    invoke-virtual {p2, p1, p3}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_0

    :cond_3
    if-eqz p4, :cond_4

    invoke-static {p1, p3}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/ScrollControlLinearLayoutManager;->onItemClick(Landroid/support/v7/widget/RecyclerView;I)V

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$MyEditItemSelectChangeListener;->this$0:Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;

    invoke-static {p1}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->access$000(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;)Lcom/miui/gallery/movie/ui/listener/MenuFragmentListener;

    move-result-object p1

    invoke-interface {p1, p3}, Lcom/miui/gallery/movie/ui/listener/MenuFragmentListener;->seekToIndex(I)V

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$MyEditItemSelectChangeListener;->this$0:Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;

    invoke-static {p1}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->access$000(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;)Lcom/miui/gallery/movie/ui/listener/MenuFragmentListener;

    move-result-object p1

    invoke-interface {p1, v1}, Lcom/miui/gallery/movie/ui/listener/MenuFragmentListener;->setDeleteVisible(Z)V

    return v1

    :cond_4
    :goto_0
    return v0
.end method
