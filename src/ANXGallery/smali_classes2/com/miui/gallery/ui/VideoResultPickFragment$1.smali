.class Lcom/miui/gallery/ui/VideoResultPickFragment$1;
.super Landroid/database/DataSetObserver;
.source "VideoResultPickFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/VideoResultPickFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/VideoResultPickFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/VideoResultPickFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/VideoResultPickFragment$1;->this$0:Lcom/miui/gallery/ui/VideoResultPickFragment;

    invoke-direct {p0}, Landroid/database/DataSetObserver;-><init>()V

    return-void
.end method


# virtual methods
.method public onChanged()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/VideoResultPickFragment$1;->this$0:Lcom/miui/gallery/ui/VideoResultPickFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/VideoResultPickFragment;->access$000(Lcom/miui/gallery/ui/VideoResultPickFragment;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/VideoResultPickFragment$1;->this$0:Lcom/miui/gallery/ui/VideoResultPickFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/VideoResultPickFragment;->access$100(Lcom/miui/gallery/ui/VideoResultPickFragment;)Lcom/miui/gallery/adapter/AlbumDetailTimeLineAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/adapter/AlbumDetailTimeLineAdapter;->getCount()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/VideoResultPickFragment$1;->this$0:Lcom/miui/gallery/ui/VideoResultPickFragment;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/miui/gallery/ui/VideoResultPickFragment;->access$002(Lcom/miui/gallery/ui/VideoResultPickFragment;Z)Z

    iget-object v0, p0, Lcom/miui/gallery/ui/VideoResultPickFragment$1;->this$0:Lcom/miui/gallery/ui/VideoResultPickFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/VideoResultPickFragment;->access$200(Lcom/miui/gallery/ui/VideoResultPickFragment;)Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->setAllItemsCheckState(Z)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/VideoResultPickFragment$1;->this$0:Lcom/miui/gallery/ui/VideoResultPickFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/VideoResultPickFragment;->access$300(Lcom/miui/gallery/ui/VideoResultPickFragment;)V

    return-void
.end method
