.class Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4$2;
.super Ljava/lang/Object;
.source "StoryAlbumFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4;->removeItemByIds(Ljava/util/ArrayList;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4;

.field final synthetic val$sha1s:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4;Ljava/util/ArrayList;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4$2;->this$1:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4;

    iput-object p2, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4$2;->val$sha1s:Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4$2;->this$1:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4;

    iget-object p1, p1, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {p1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$3400(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->stopActionMode()V

    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4$2;->val$sha1s:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4$2;->this$1:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4;

    iget-object v0, v0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$3500(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0, p2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4$2;->this$1:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4;

    iget-object p1, p1, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object p1

    const/4 p2, 0x1

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4$2;->this$1:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4;

    iget-object v1, v1, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$3600(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$PhotoLoaderCallback;

    move-result-object v1

    invoke-virtual {p1, p2, v0, v1}, Landroid/app/LoaderManager;->restartLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    const-string p2, "count"

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4$2;->val$sha1s:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, p2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p2, "scenarioId"

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4$2;->this$1:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4;

    iget-object v0, v0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$3700(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/card/Card;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/card/Card;->getScenarioId()I

    move-result v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, p2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p2, "assistant"

    const-string v0, "assistant_card_remove_photos"

    invoke-static {p2, v0, p1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method
