.class Lcom/miui/gallery/editor/photo/app/sticker/StickerMenuFragment$3;
.super Ljava/lang/Object;
.source "StickerMenuFragment.java"

# interfaces
.implements Lcom/miui/gallery/ui/SimpleRecyclerView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/app/sticker/StickerMenuFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/app/sticker/StickerMenuFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/app/sticker/StickerMenuFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/sticker/StickerMenuFragment$3;->this$0:Lcom/miui/gallery/editor/photo/app/sticker/StickerMenuFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public OnItemClick(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;I)Z
    .locals 2

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/editor/photo/app/sticker/CategoryDetailAdapter;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/sticker/StickerMenuFragment$3;->this$0:Lcom/miui/gallery/editor/photo/app/sticker/StickerMenuFragment;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/sticker/StickerMenuFragment;->access$300(Lcom/miui/gallery/editor/photo/app/sticker/StickerMenuFragment;)Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;

    invoke-virtual {p2}, Lcom/miui/gallery/editor/photo/app/sticker/CategoryDetailAdapter;->getDataList()Ljava/util/List;

    move-result-object p2

    invoke-interface {p2, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/editor/photo/core/Metadata;

    const/4 v1, 0x0

    invoke-virtual {v0, p2, v1}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;->add(Lcom/miui/gallery/editor/photo/core/Metadata;Ljava/lang/Object;)V

    invoke-static {p1, p3}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/ScrollControlLinearLayoutManager;->onItemClick(Landroid/support/v7/widget/RecyclerView;I)V

    const/4 p1, 0x1

    return p1
.end method
