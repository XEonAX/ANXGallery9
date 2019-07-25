.class Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment$7;
.super Lcom/miui/gallery/threadpool/FutureHandler;
.source "AssistantPageFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;->loadMoreCard()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/threadpool/FutureHandler<",
        "Ljava/util/List<",
        "Lcom/miui/gallery/card/Card;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment$7;->this$0:Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;

    invoke-direct {p0}, Lcom/miui/gallery/threadpool/FutureHandler;-><init>()V

    return-void
.end method


# virtual methods
.method public onPostExecute(Lcom/miui/gallery/threadpool/Future;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/threadpool/Future<",
            "Ljava/util/List<",
            "Lcom/miui/gallery/card/Card;",
            ">;>;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment$7;->this$0:Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;

    invoke-static {v0}, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;->access$400(Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;)Lcom/miui/gallery/activity/BaseActivity;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-interface {p1}, Lcom/miui/gallery/threadpool/Future;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    const/4 v0, 0x1

    const/16 v1, 0x14

    const/4 v2, 0x0

    if-eqz p1, :cond_2

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    if-ge p1, v1, :cond_1

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment$7;->this$0:Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;

    invoke-static {p1}, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;->access$700(Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;)Z

    move-result p1

    if-eqz p1, :cond_4

    iget-object p1, p0, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment$7;->this$0:Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;

    invoke-static {p1}, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;->access$100(Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;)Lcom/miui/gallery/card/ui/cardlist/CardAdapter;

    move-result-object p1

    iget-object v1, p0, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment$7;->this$0:Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;

    invoke-static {v1}, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;->access$500(Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;)Lcom/miui/gallery/widget/LoadMoreLayout;

    move-result-object v1

    invoke-virtual {p1, v1, v0}, Lcom/miui/gallery/card/ui/cardlist/CardAdapter;->setFooter(Landroid/view/View;Z)V

    goto :goto_1

    :cond_2
    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment$7;->this$0:Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;

    invoke-static {p1}, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;->access$500(Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;)Lcom/miui/gallery/widget/LoadMoreLayout;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/widget/LoadMoreLayout;->setLoadComplete()V

    invoke-static {}, Lcom/miui/gallery/card/CardManager;->getInstance()Lcom/miui/gallery/card/CardManager;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/card/CardManager;->getLoadedCard()Ljava/util/List;

    move-result-object p1

    if-eqz p1, :cond_3

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    if-le p1, v1, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment$7;->this$0:Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;

    invoke-static {p1}, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;->access$100(Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;)Lcom/miui/gallery/card/ui/cardlist/CardAdapter;

    move-result-object p1

    iget-object v1, p0, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment$7;->this$0:Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;

    invoke-static {v1}, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;->access$500(Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;)Lcom/miui/gallery/widget/LoadMoreLayout;

    move-result-object v1

    invoke-virtual {p1, v1, v0}, Lcom/miui/gallery/card/ui/cardlist/CardAdapter;->setFooter(Landroid/view/View;Z)V

    :cond_3
    iget-object p1, p0, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment$7;->this$0:Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;

    invoke-static {p1, v2}, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;->access$602(Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;Z)Z

    :cond_4
    :goto_1
    iget-object p1, p0, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment$7;->this$0:Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;

    invoke-static {p1}, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;->access$200(Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;)V

    iget-object p1, p0, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment$7;->this$0:Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;

    invoke-static {p1, v2}, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;->access$802(Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;Z)Z

    iget-object p1, p0, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment$7;->this$0:Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;

    invoke-static {p1, v2}, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;->access$702(Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;Z)Z

    return-void
.end method
