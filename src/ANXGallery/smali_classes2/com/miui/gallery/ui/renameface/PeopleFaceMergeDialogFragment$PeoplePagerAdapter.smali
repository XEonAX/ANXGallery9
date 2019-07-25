.class Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$PeoplePagerAdapter;
.super Lcom/miui/gallery/widget/PagerAdapter;
.source "PeopleFaceMergeDialogFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PeoplePagerAdapter"
.end annotation


# instance fields
.field private mAdapter:Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$PagerGridLayoutAdapter;

.field final synthetic this$0:Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;)V
    .locals 2

    iput-object p1, p0, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$PeoplePagerAdapter;->this$0:Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;

    invoke-direct {p0}, Lcom/miui/gallery/widget/PagerAdapter;-><init>()V

    new-instance p1, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$PagerGridLayoutAdapter;

    iget-object v0, p0, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$PeoplePagerAdapter;->this$0:Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;

    iget-object v1, p0, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$PeoplePagerAdapter;->this$0:Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;

    invoke-static {v1}, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;->access$500(Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-direct {p1, v0, v1}, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$PagerGridLayoutAdapter;-><init>(Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;Ljava/util/ArrayList;)V

    iput-object p1, p0, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$PeoplePagerAdapter;->mAdapter:Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$PagerGridLayoutAdapter;

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$PeoplePagerAdapter;-><init>(Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;)V

    return-void
.end method

.method private getPagerLayout()Lcom/miui/gallery/widget/PagerGridLayout;
    .locals 3

    new-instance v0, Lcom/miui/gallery/widget/PagerGridLayout;

    iget-object v1, p0, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$PeoplePagerAdapter;->this$0:Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;

    invoke-virtual {v1}, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/miui/gallery/widget/PagerGridLayout;-><init>(Landroid/content/Context;)V

    iget-object v1, p0, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$PeoplePagerAdapter;->this$0:Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;

    invoke-virtual {v1}, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f060312

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, v1, v2}, Lcom/miui/gallery/widget/PagerGridLayout;->setPaddingRelative(IIII)V

    return-object v0
.end method


# virtual methods
.method public destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 0

    check-cast p3, Landroid/view/View;

    invoke-virtual {p1, p3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    return-void
.end method

.method public getCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$PeoplePagerAdapter;->this$0:Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;->access$500(Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;)Ljava/util/ArrayList;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$PeoplePagerAdapter;->this$0:Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;->access$500(Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, 0x7

    div-int/lit8 v0, v0, 0x8

    :goto_0
    return v0
.end method

.method public getItemPosition(Ljava/lang/Object;I)I
    .locals 0

    if-lez p2, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$PeoplePagerAdapter;->getCount()I

    move-result p1

    if-ge p2, p1, :cond_0

    const/4 p1, -0x3

    return p1

    :cond_0
    const/4 p1, -0x2

    return p1
.end method

.method public instantiateItem(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$PeoplePagerAdapter;->getPagerLayout()Lcom/miui/gallery/widget/PagerGridLayout;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$PeoplePagerAdapter;->mAdapter:Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$PagerGridLayoutAdapter;

    invoke-virtual {v0, v1, p2}, Lcom/miui/gallery/widget/PagerGridLayout;->setAdapter(Lcom/miui/gallery/widget/PagerGridLayout$BaseAdapter;I)V

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    return-object v0
.end method

.method public isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z
    .locals 0

    if-ne p1, p2, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public updateItems(Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/model/DisplayFolderItem;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$PeoplePagerAdapter;->this$0:Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;->access$500(Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    iget-object p1, p0, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$PeoplePagerAdapter;->mAdapter:Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$PagerGridLayoutAdapter;

    iget-object v0, p0, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$PeoplePagerAdapter;->this$0:Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;->access$500(Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$PagerGridLayoutAdapter;->updateItems(Ljava/util/ArrayList;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$PeoplePagerAdapter;->notifyDataSetChanged()V

    return-void
.end method
