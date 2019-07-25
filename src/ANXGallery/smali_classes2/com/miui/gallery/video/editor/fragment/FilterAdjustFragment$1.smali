.class Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment$1;
.super Ljava/lang/Object;
.source "FilterAdjustFragment.java"

# interfaces
.implements Lcom/miui/gallery/video/editor/widget/FilterAdjustHeadView$FilterHeadViewClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->initListener()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment$1;->this$0:Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAdjustClick()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment$1;->this$0:Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->access$500(Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;)Lcom/miui/gallery/video/editor/widget/AdjustView;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment$1;->this$0:Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->access$100(Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;)Lcom/miui/gallery/editor/photo/widgets/NoScrollViewPager;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/widgets/NoScrollViewPager;->setCurrentItem(I)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment$1;->this$0:Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->access$300(Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;)Landroid/widget/TextView;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment$1;->this$0:Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;

    invoke-static {v1}, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->access$600(Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;)Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f10070d

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment$1;->this$0:Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->access$402(Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;Z)Z

    iget-object v0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment$1;->this$0:Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->access$500(Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;)Lcom/miui/gallery/video/editor/widget/AdjustView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/widget/AdjustView;->refreshData()V

    :cond_0
    return-void
.end method

.method public onFilterClick()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment$1;->this$0:Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->access$000(Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;)Lcom/miui/gallery/video/editor/widget/FilterView;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment$1;->this$0:Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->access$100(Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;)Lcom/miui/gallery/editor/photo/widgets/NoScrollViewPager;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/widgets/NoScrollViewPager;->setCurrentItem(I)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment$1;->this$0:Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->access$300(Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;)Landroid/widget/TextView;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment$1;->this$0:Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;

    invoke-static {v1}, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->access$200(Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;)Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f10072f

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment$1;->this$0:Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->access$402(Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;Z)Z

    :cond_0
    return-void
.end method
