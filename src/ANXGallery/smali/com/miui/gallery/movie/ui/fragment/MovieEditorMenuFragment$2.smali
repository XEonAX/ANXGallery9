.class Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$2;
.super Ljava/lang/Object;
.source "MovieEditorMenuFragment.java"

# interfaces
.implements Lcom/miui/gallery/movie/ui/listener/MovieDownloadListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->downloadResource(Lcom/miui/gallery/movie/entity/MovieResource;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;

.field final synthetic val$data:Lcom/miui/gallery/movie/entity/MovieResource;


# direct methods
.method constructor <init>(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;Lcom/miui/gallery/movie/entity/MovieResource;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$2;->this$0:Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;

    iput-object p2, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$2;->val$data:Lcom/miui/gallery/movie/entity/MovieResource;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompleted(Z)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$2;->val$data:Lcom/miui/gallery/movie/entity/MovieResource;

    invoke-static {v0, p1}, Lcom/miui/gallery/movie/utils/MovieStatUtils;->statDownloadResult(Lcom/miui/gallery/movie/entity/MovieResource;Z)V

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$2;->val$data:Lcom/miui/gallery/movie/entity/MovieResource;

    if-eqz p1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    const/16 v1, 0x14

    :goto_0
    iput v1, v0, Lcom/miui/gallery/movie/entity/MovieResource;->downloadState:I

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$2;->this$0:Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;

    invoke-static {p1}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->access$500(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;)Landroid/content/Context;

    move-result-object p1

    const v0, 0x7f10048f

    invoke-static {p1, v0}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$2;->this$0:Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$2;->val$data:Lcom/miui/gallery/movie/entity/MovieResource;

    invoke-static {p1, v0}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->access$1400(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;Lcom/miui/gallery/movie/entity/MovieResource;)V

    return-void
.end method

.method public onStart()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$2;->val$data:Lcom/miui/gallery/movie/entity/MovieResource;

    invoke-static {v0}, Lcom/miui/gallery/movie/utils/MovieStatUtils;->statDownload(Lcom/miui/gallery/movie/entity/MovieResource;)V

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$2;->val$data:Lcom/miui/gallery/movie/entity/MovieResource;

    const/16 v1, 0x12

    iput v1, v0, Lcom/miui/gallery/movie/entity/MovieResource;->downloadState:I

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$2;->this$0:Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;

    iget-object v1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$2;->val$data:Lcom/miui/gallery/movie/entity/MovieResource;

    invoke-static {v0, v1}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->access$1400(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;Lcom/miui/gallery/movie/entity/MovieResource;)V

    return-void
.end method
