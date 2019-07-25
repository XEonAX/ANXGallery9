.class Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$2$2;
.super Lcom/miui/gallery/threadpool/FutureHandler;
.source "StoryAlbumFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$2;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/threadpool/FutureHandler<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$2;


# direct methods
.method constructor <init>(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$2;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$2$2;->this$1:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$2;

    invoke-direct {p0}, Lcom/miui/gallery/threadpool/FutureHandler;-><init>()V

    return-void
.end method


# virtual methods
.method public onPostExecute(Lcom/miui/gallery/threadpool/Future;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/threadpool/Future<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    :try_start_0
    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$2$2;->this$1:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$2;

    iget-object p1, p1, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$2;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {p1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$1000(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;

    move-result-object p1

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;->setEnabled(Z)V

    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$2$2;->this$1:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$2;

    iget-object p1, p1, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$2;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {p1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$1400(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Ljava/util/ArrayList;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result p1

    if-eqz p1, :cond_2

    invoke-static {}, Lcom/miui/gallery/cloud/NetworkUtils;->isNetworkConnected()Z

    move-result p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$2$2;->this$1:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$2;

    iget-object p1, p1, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$2;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {p1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$1500(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/activity/BaseActivity;

    move-result-object p1

    const v0, 0x7f1006b2

    invoke-static {p1, v0}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/miui/gallery/cloud/NetworkUtils;->isActiveNetworkMetered()Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$2$2;->this$1:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$2;

    iget-object p1, p1, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$2;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {p1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$1600(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$2$2;->this$1:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$2;

    iget-object p1, p1, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$2;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {p1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$1700(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)V

    goto :goto_0

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$2$2;->this$1:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$2;

    iget-object p1, p1, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$2;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {p1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$1200(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$2$2;->this$1:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$2;

    iget-object p1, p1, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$2;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {p1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$1800(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v0, "StoryAlbumFragment"

    invoke-virtual {p1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method
