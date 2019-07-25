.class Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$MyTemplateItemSelectChangeListener;
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
    name = "MyTemplateItemSelectChangeListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$MyTemplateItemSelectChangeListener;->this$0:Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$MyTemplateItemSelectChangeListener;-><init>(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;)V

    return-void
.end method


# virtual methods
.method public onItemSelect(Landroid/support/v7/widget/RecyclerView;Lcom/miui/gallery/movie/ui/adapter/BaseAdapter$BaseHolder;IZ)Z
    .locals 2

    const/4 p2, 0x0

    if-nez p4, :cond_0

    return p2

    :cond_0
    iget-object p4, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$MyTemplateItemSelectChangeListener;->this$0:Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;

    invoke-static {p4}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->access$100(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;)Lcom/miui/gallery/movie/ui/adapter/TemplateAdapter;

    move-result-object p4

    invoke-virtual {p4, p3}, Lcom/miui/gallery/movie/ui/adapter/TemplateAdapter;->getItemData(I)Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Lcom/miui/gallery/movie/entity/TemplateResource;

    invoke-virtual {p4}, Lcom/miui/gallery/movie/entity/TemplateResource;->getDownloadState()I

    move-result v0

    const/16 v1, 0x11

    if-eq v0, v1, :cond_4

    if-nez v0, :cond_1

    goto :goto_1

    :cond_1
    const/16 p1, 0x13

    if-eq v0, p1, :cond_3

    const/16 p1, 0x14

    if-ne v0, p1, :cond_2

    goto :goto_0

    :cond_2
    return p2

    :cond_3
    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$MyTemplateItemSelectChangeListener;->this$0:Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;

    invoke-static {p1, p4}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->access$1300(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;Lcom/miui/gallery/movie/entity/MovieResource;)V

    return p2

    :cond_4
    :goto_1
    invoke-static {p1, p3}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/ScrollControlLinearLayoutManager;->onItemClick(Landroid/support/v7/widget/RecyclerView;I)V

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$MyTemplateItemSelectChangeListener;->this$0:Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;

    invoke-static {p1}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->access$200(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;)Lcom/miui/gallery/movie/ui/adapter/AudioAdapter;

    move-result-object p1

    const/4 p2, -0x1

    invoke-virtual {p1, p2}, Lcom/miui/gallery/movie/ui/adapter/AudioAdapter;->setSelectedItemPosition(I)V

    invoke-static {p4}, Lcom/miui/gallery/movie/utils/MovieStatUtils;->statItemChoose(Lcom/miui/gallery/movie/entity/MovieResource;)V

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$MyTemplateItemSelectChangeListener;->this$0:Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;

    invoke-static {p1}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->access$1000(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;)Lcom/miui/gallery/movie/entity/MovieInfo;

    move-result-object p1

    iget-object p2, p4, Lcom/miui/gallery/movie/entity/TemplateResource;->nameKey:Ljava/lang/String;

    iput-object p2, p1, Lcom/miui/gallery/movie/entity/MovieInfo;->template:Ljava/lang/String;

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$MyTemplateItemSelectChangeListener;->this$0:Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;

    invoke-static {p1}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->access$1100(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;)Lcom/miui/gallery/movie/core/MovieManager;

    move-result-object p1

    invoke-virtual {p1, p4}, Lcom/miui/gallery/movie/core/MovieManager;->setTemplate(Lcom/miui/gallery/movie/entity/TemplateResource;)V

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$MyTemplateItemSelectChangeListener;->this$0:Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;

    invoke-static {p1}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->access$1200(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;)V

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$MyTemplateItemSelectChangeListener;->this$0:Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;

    invoke-static {p1}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->access$000(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;)Lcom/miui/gallery/movie/ui/listener/MenuFragmentListener;

    move-result-object p1

    invoke-interface {p1}, Lcom/miui/gallery/movie/ui/listener/MenuFragmentListener;->showLoadingView()V

    const/4 p1, 0x1

    return p1
.end method
