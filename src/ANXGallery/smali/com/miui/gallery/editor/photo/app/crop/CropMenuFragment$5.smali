.class Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment$5;
.super Ljava/lang/Object;
.source "CropMenuFragment.java"

# interfaces
.implements Lcom/miui/gallery/ui/SimpleRecyclerView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment$5;->this$0:Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public OnItemClick(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;I)Z
    .locals 1

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment$5;->this$0:Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;->access$1000(Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;)Ljava/util/List;

    move-result-object p2

    invoke-interface {p2, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/editor/photo/core/common/model/CropData;

    sget-object v0, Lcom/miui/gallery/editor/photo/core/common/model/CropData;->MIRROR:Lcom/miui/gallery/editor/photo/core/common/model/CropData;

    if-ne p2, v0, :cond_0

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment$5;->this$0:Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;->access$1100(Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;)Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractCropFragment;

    invoke-virtual {p2}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractCropFragment;->doMirror()V

    goto :goto_0

    :cond_0
    sget-object v0, Lcom/miui/gallery/editor/photo/core/common/model/CropData;->ROTATE:Lcom/miui/gallery/editor/photo/core/common/model/CropData;

    if-ne p2, v0, :cond_1

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment$5;->this$0:Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;->access$1200(Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;)Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractCropFragment;

    invoke-virtual {p2}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractCropFragment;->doRotate()V

    goto :goto_0

    :cond_1
    instance-of p2, p2, Lcom/miui/gallery/editor/photo/core/common/model/CropData$AspectRatio;

    if-eqz p2, :cond_2

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment$5;->this$0:Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;->access$700(Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;)Lcom/miui/gallery/editor/photo/app/crop/CropAdapter;

    move-result-object p2

    invoke-virtual {p2, p3}, Lcom/miui/gallery/editor/photo/app/crop/CropAdapter;->setSelection(I)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment$5;->this$0:Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;->access$1300(Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;)Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractCropFragment;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment$5;->this$0:Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;->access$700(Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;)Lcom/miui/gallery/editor/photo/app/crop/CropAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/app/crop/CropAdapter;->getSelectedItem()Lcom/miui/gallery/editor/photo/core/common/model/CropData;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/common/model/CropData$AspectRatio;

    invoke-virtual {p2, v0}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractCropFragment;->setAspectRatio(Lcom/miui/gallery/editor/photo/core/common/model/CropData$AspectRatio;)V

    :cond_2
    :goto_0
    invoke-static {p1, p3}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/ScrollControlLinearLayoutManager;->onItemClick(Landroid/support/v7/widget/RecyclerView;I)V

    const/4 p1, 0x1

    return p1
.end method
