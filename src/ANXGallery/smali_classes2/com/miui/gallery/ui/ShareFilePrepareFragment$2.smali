.class Lcom/miui/gallery/ui/ShareFilePrepareFragment$2;
.super Ljava/lang/Object;
.source "ShareFilePrepareFragment.java"

# interfaces
.implements Lcom/miui/gallery/ui/ShareFilePrepareFragment$DecodeSecretTask$DecodeSecretListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/ShareFilePrepareFragment;->doSecret()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/ShareFilePrepareFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/ShareFilePrepareFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$2;->this$0:Lcom/miui/gallery/ui/ShareFilePrepareFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onEnd(Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/net/Uri;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$2;->this$0:Lcom/miui/gallery/ui/ShareFilePrepareFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->access$400(Lcom/miui/gallery/ui/ShareFilePrepareFragment;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->clear()V

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$2;->this$0:Lcom/miui/gallery/ui/ShareFilePrepareFragment;

    const v0, 0x7f10065d

    invoke-static {p1, v0}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->access$500(Lcom/miui/gallery/ui/ShareFilePrepareFragment;I)V

    return-void

    :cond_0
    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_2

    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/net/Uri;

    iget-object v3, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$2;->this$0:Lcom/miui/gallery/ui/ShareFilePrepareFragment;

    invoke-static {v3}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->access$400(Lcom/miui/gallery/ui/ShareFilePrepareFragment;)Ljava/util/List;

    move-result-object v3

    invoke-virtual {v2}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v2, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$2;->this$0:Lcom/miui/gallery/ui/ShareFilePrepareFragment;

    invoke-static {v2}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->access$700(Lcom/miui/gallery/ui/ShareFilePrepareFragment;)Ljava/util/List;

    move-result-object v2

    iget-object v3, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$2;->this$0:Lcom/miui/gallery/ui/ShareFilePrepareFragment;

    invoke-static {v3}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->access$600(Lcom/miui/gallery/ui/ShareFilePrepareFragment;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_1

    iget-object v3, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$2;->this$0:Lcom/miui/gallery/ui/ShareFilePrepareFragment;

    invoke-static {v3}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->access$700(Lcom/miui/gallery/ui/ShareFilePrepareFragment;)Ljava/util/List;

    move-result-object v3

    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v3, v2, v4}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    iget-object v1, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$2;->this$0:Lcom/miui/gallery/ui/ShareFilePrepareFragment;

    invoke-static {v1}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->access$800(Lcom/miui/gallery/ui/ShareFilePrepareFragment;)Ljava/util/Set;

    move-result-object v1

    invoke-static {v1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v1

    if-eqz v1, :cond_5

    :goto_1
    iget-object v1, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$2;->this$0:Lcom/miui/gallery/ui/ShareFilePrepareFragment;

    invoke-static {v1}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->access$600(Lcom/miui/gallery/ui/ShareFilePrepareFragment;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_4

    iget-object v1, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$2;->this$0:Lcom/miui/gallery/ui/ShareFilePrepareFragment;

    invoke-static {v1}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->access$600(Lcom/miui/gallery/ui/ShareFilePrepareFragment;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/Uri;

    iget-object v2, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$2;->this$0:Lcom/miui/gallery/ui/ShareFilePrepareFragment;

    invoke-static {v2}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->access$800(Lcom/miui/gallery/ui/ShareFilePrepareFragment;)Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$2;->this$0:Lcom/miui/gallery/ui/ShareFilePrepareFragment;

    invoke-static {v2}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->access$800(Lcom/miui/gallery/ui/ShareFilePrepareFragment;)Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2, v1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    iget-object v1, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$2;->this$0:Lcom/miui/gallery/ui/ShareFilePrepareFragment;

    invoke-static {v1}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->access$800(Lcom/miui/gallery/ui/ShareFilePrepareFragment;)Ljava/util/Set;

    move-result-object v1

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    const-string v1, "ShareFilePrepareFragment"

    const-string v2, "download success, need render: %s"

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_4
    iget-object p1, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$2;->this$0:Lcom/miui/gallery/ui/ShareFilePrepareFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->access$900(Lcom/miui/gallery/ui/ShareFilePrepareFragment;)V

    goto :goto_2

    :cond_5
    iget-object p1, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$2;->this$0:Lcom/miui/gallery/ui/ShareFilePrepareFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->access$1000(Lcom/miui/gallery/ui/ShareFilePrepareFragment;)V

    :goto_2
    iget-object p1, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$2;->this$0:Lcom/miui/gallery/ui/ShareFilePrepareFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->access$1100(Lcom/miui/gallery/ui/ShareFilePrepareFragment;)V

    return-void
.end method

.method public onItemFinish(F)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$2;->this$0:Lcom/miui/gallery/ui/ShareFilePrepareFragment;

    iget-object v1, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$2;->this$0:Lcom/miui/gallery/ui/ShareFilePrepareFragment;

    invoke-static {v1}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->access$100(Lcom/miui/gallery/ui/ShareFilePrepareFragment;)I

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$2;->this$0:Lcom/miui/gallery/ui/ShareFilePrepareFragment;

    invoke-static {v2}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->access$200(Lcom/miui/gallery/ui/ShareFilePrepareFragment;)I

    move-result v2

    int-to-float v2, v2

    mul-float p1, p1, v2

    float-to-int p1, p1

    add-int/2addr v1, p1

    invoke-static {v0, v1}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->access$300(Lcom/miui/gallery/ui/ShareFilePrepareFragment;I)V

    return-void
.end method
