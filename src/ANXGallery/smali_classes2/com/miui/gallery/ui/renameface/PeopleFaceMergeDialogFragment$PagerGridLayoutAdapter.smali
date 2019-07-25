.class Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$PagerGridLayoutAdapter;
.super Lcom/miui/gallery/widget/PagerGridLayout$BaseAdapter;
.source "PeopleFaceMergeDialogFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PagerGridLayoutAdapter"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$PagerGridLayoutAdapter$ViewHolder;
    }
.end annotation


# instance fields
.field private mGridLayoutItems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/model/DisplayFolderItem;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/model/DisplayFolderItem;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$PagerGridLayoutAdapter;->this$0:Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;

    invoke-direct {p0}, Lcom/miui/gallery/widget/PagerGridLayout$BaseAdapter;-><init>()V

    iput-object p2, p0, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$PagerGridLayoutAdapter;->mGridLayoutItems:Ljava/util/ArrayList;

    return-void
.end method

.method static synthetic access$700(Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$PagerGridLayoutAdapter;Landroid/view/View;Lcom/miui/gallery/ui/renameface/FaceDisplayFolderItem;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$PagerGridLayoutAdapter;->setItemClickListener(Landroid/view/View;Lcom/miui/gallery/ui/renameface/FaceDisplayFolderItem;)V

    return-void
.end method

.method private setItemClickListener(Landroid/view/View;Lcom/miui/gallery/ui/renameface/FaceDisplayFolderItem;)V
    .locals 1

    new-instance v0, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$PagerGridLayoutAdapter$1;

    invoke-direct {v0, p0, p2}, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$PagerGridLayoutAdapter$1;-><init>(Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$PagerGridLayoutAdapter;Lcom/miui/gallery/ui/renameface/FaceDisplayFolderItem;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method


# virtual methods
.method public bindData(ILandroid/view/View;)V
    .locals 1

    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$PagerGridLayoutAdapter$ViewHolder;

    iget-object v0, p0, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$PagerGridLayoutAdapter;->mGridLayoutItems:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/ui/renameface/FaceDisplayFolderItem;

    invoke-virtual {p2, p1}, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$PagerGridLayoutAdapter$ViewHolder;->bindView(Lcom/miui/gallery/ui/renameface/FaceDisplayFolderItem;)V

    return-void
.end method

.method public freshView(Landroid/view/View;)V
    .locals 0

    return-void
.end method

.method public getColumnsCount()I
    .locals 1

    const/4 v0, 0x4

    return v0
.end method

.method public getCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$PagerGridLayoutAdapter;->mGridLayoutItems:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$PagerGridLayoutAdapter;->mGridLayoutItems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_0
    return v0
.end method

.method public getRowsCount()I
    .locals 1

    const/4 v0, 0x2

    return v0
.end method

.method public getView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    const v0, 0x7f0b00e5

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    new-instance p2, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$PagerGridLayoutAdapter$ViewHolder;

    invoke-direct {p2, p0, p1}, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$PagerGridLayoutAdapter$ViewHolder;-><init>(Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$PagerGridLayoutAdapter;Landroid/view/View;)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    return-object p1
.end method

.method public onPageChanged()V
    .locals 0

    return-void
.end method

.method public updateItems(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/model/DisplayFolderItem;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$PagerGridLayoutAdapter;->mGridLayoutItems:Ljava/util/ArrayList;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$PagerGridLayoutAdapter;->notifyDataSetChanged()V

    return-void
.end method
