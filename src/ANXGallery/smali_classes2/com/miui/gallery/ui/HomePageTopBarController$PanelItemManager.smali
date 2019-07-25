.class Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;
.super Ljava/lang/Object;
.source "HomePageTopBarController.java"

# interfaces
.implements Lcom/miui/gallery/widget/PanelManager;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/HomePageTopBarController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PanelItemManager"
.end annotation


# instance fields
.field private mComparator:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Lcom/miui/gallery/widget/PanelItem;",
            ">;"
        }
    .end annotation
.end field

.field private mCurrentItem:Lcom/miui/gallery/widget/PanelItem;

.field private mIsItemEnable:Z

.field private mPanelBar:Lcom/miui/gallery/widget/PanelBar;

.field private mWaitingItems:Ljava/util/PriorityQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/PriorityQueue<",
            "Lcom/miui/gallery/widget/PanelItem;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/miui/gallery/ui/HomePageTopBarController;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/ui/HomePageTopBarController;Lcom/miui/gallery/widget/PanelBar;)V
    .locals 1

    iput-object p1, p0, Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;->this$0:Lcom/miui/gallery/ui/HomePageTopBarController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;->mIsItemEnable:Z

    iput-object p2, p0, Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;->mPanelBar:Lcom/miui/gallery/widget/PanelBar;

    new-instance p2, Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager$1;

    invoke-direct {p2, p0, p1}, Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager$1;-><init>(Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;Lcom/miui/gallery/ui/HomePageTopBarController;)V

    iput-object p2, p0, Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;->mComparator:Ljava/util/Comparator;

    new-instance p1, Ljava/util/PriorityQueue;

    iget-object p2, p0, Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;->mComparator:Ljava/util/Comparator;

    const/16 v0, 0xa

    invoke-direct {p1, v0, p2}, Ljava/util/PriorityQueue;-><init>(ILjava/util/Comparator;)V

    iput-object p1, p0, Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;->mWaitingItems:Ljava/util/PriorityQueue;

    return-void
.end method

.method static synthetic access$400(Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;)Lcom/miui/gallery/widget/PanelItem;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;->mCurrentItem:Lcom/miui/gallery/widget/PanelItem;

    return-object p0
.end method

.method static synthetic access$500(Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;)Lcom/miui/gallery/widget/PanelBar;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;->mPanelBar:Lcom/miui/gallery/widget/PanelBar;

    return-object p0
.end method


# virtual methods
.method public addItem(Lcom/miui/gallery/widget/PanelItem;Z)Z
    .locals 4

    if-eqz p1, :cond_0

    invoke-interface {p1}, Lcom/miui/gallery/widget/PanelItem;->getView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Lcom/miui/gallery/widget/PanelItem;->getView()Landroid/view/View;

    move-result-object v0

    iget-boolean v1, p0, Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;->mIsItemEnable:Z

    invoke-virtual {v0, v1}, Landroid/view/View;->setClickable(Z)V

    invoke-interface {p1}, Lcom/miui/gallery/widget/PanelItem;->getView()Landroid/view/View;

    move-result-object v0

    iget-boolean v1, p0, Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;->mIsItemEnable:Z

    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;->mCurrentItem:Lcom/miui/gallery/widget/PanelItem;

    iget-object v1, p0, Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;->mCurrentItem:Lcom/miui/gallery/widget/PanelItem;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    iput-object p1, p0, Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;->mCurrentItem:Lcom/miui/gallery/widget/PanelItem;

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;->mCurrentItem:Lcom/miui/gallery/widget/PanelItem;

    if-eq v1, p1, :cond_5

    iget-object v1, p0, Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;->mComparator:Ljava/util/Comparator;

    iget-object v3, p0, Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;->mCurrentItem:Lcom/miui/gallery/widget/PanelItem;

    invoke-interface {v1, v3, p1}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v1

    if-ltz v1, :cond_3

    iget-object p2, p0, Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;->mWaitingItems:Ljava/util/PriorityQueue;

    invoke-virtual {p2, p1}, Ljava/util/PriorityQueue;->contains(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_2

    iget-object p2, p0, Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;->mWaitingItems:Ljava/util/PriorityQueue;

    invoke-virtual {p2, p1}, Ljava/util/PriorityQueue;->offer(Ljava/lang/Object;)Z

    :cond_2
    return v2

    :cond_3
    iget-object v1, p0, Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;->mWaitingItems:Ljava/util/PriorityQueue;

    iget-object v3, p0, Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;->mCurrentItem:Lcom/miui/gallery/widget/PanelItem;

    invoke-virtual {v1, v3}, Ljava/util/PriorityQueue;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    iget-object v1, p0, Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;->mWaitingItems:Ljava/util/PriorityQueue;

    iget-object v3, p0, Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;->mCurrentItem:Lcom/miui/gallery/widget/PanelItem;

    invoke-virtual {v1, v3}, Ljava/util/PriorityQueue;->offer(Ljava/lang/Object;)Z

    :cond_4
    iput-object p1, p0, Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;->mCurrentItem:Lcom/miui/gallery/widget/PanelItem;

    :cond_5
    :goto_0
    const/4 p1, 0x1

    if-eqz p2, :cond_9

    if-eqz v0, :cond_6

    iget-object p2, p0, Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;->mCurrentItem:Lcom/miui/gallery/widget/PanelItem;

    if-eq v0, p2, :cond_6

    iget-object p2, p0, Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;->this$0:Lcom/miui/gallery/ui/HomePageTopBarController;

    invoke-static {p2}, Lcom/miui/gallery/ui/HomePageTopBarController;->access$200(Lcom/miui/gallery/ui/HomePageTopBarController;)Z

    move-result p2

    if-eqz p2, :cond_6

    iget-object p2, p0, Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;->this$0:Lcom/miui/gallery/ui/HomePageTopBarController;

    invoke-static {p2}, Lcom/miui/gallery/ui/HomePageTopBarController;->access$300(Lcom/miui/gallery/ui/HomePageTopBarController;)Z

    move-result p2

    if-nez p2, :cond_6

    iget-object p2, p0, Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;->this$0:Lcom/miui/gallery/ui/HomePageTopBarController;

    new-instance v0, Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager$2;-><init>(Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;)V

    invoke-static {p2, p1, v0}, Lcom/miui/gallery/ui/HomePageTopBarController;->access$600(Lcom/miui/gallery/ui/HomePageTopBarController;ZLcom/miui/gallery/widget/TwoStageDrawer$DrawerAnimEndListener;)V

    goto :goto_2

    :cond_6
    iget-object p2, p0, Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;->mCurrentItem:Lcom/miui/gallery/widget/PanelItem;

    if-eq v0, p2, :cond_7

    iget-object p2, p0, Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;->mPanelBar:Lcom/miui/gallery/widget/PanelBar;

    iget-object v1, p0, Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;->mCurrentItem:Lcom/miui/gallery/widget/PanelItem;

    iget-object v2, p0, Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;->this$0:Lcom/miui/gallery/ui/HomePageTopBarController;

    invoke-static {v2}, Lcom/miui/gallery/ui/HomePageTopBarController;->access$300(Lcom/miui/gallery/ui/HomePageTopBarController;)Z

    move-result v2

    invoke-virtual {p2, v1, v2}, Lcom/miui/gallery/widget/PanelBar;->replaceItem(Lcom/miui/gallery/widget/PanelItem;Z)V

    :cond_7
    if-nez v0, :cond_8

    const/16 p2, 0x258

    goto :goto_1

    :cond_8
    const/16 p2, 0x12c

    :goto_1
    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;->this$0:Lcom/miui/gallery/ui/HomePageTopBarController;

    invoke-static {v0, p2}, Lcom/miui/gallery/ui/HomePageTopBarController;->access$700(Lcom/miui/gallery/ui/HomePageTopBarController;I)V

    goto :goto_2

    :cond_9
    iget-object p2, p0, Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;->mCurrentItem:Lcom/miui/gallery/widget/PanelItem;

    if-eq v0, p2, :cond_a

    iget-object p2, p0, Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;->mPanelBar:Lcom/miui/gallery/widget/PanelBar;

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;->mCurrentItem:Lcom/miui/gallery/widget/PanelItem;

    invoke-virtual {p2, v0, v2}, Lcom/miui/gallery/widget/PanelBar;->replaceItem(Lcom/miui/gallery/widget/PanelItem;Z)V

    :cond_a
    :goto_2
    return p1
.end method

.method public hasItem()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;->mCurrentItem:Lcom/miui/gallery/widget/PanelItem;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public removeItem(Lcom/miui/gallery/widget/PanelItem;Z)Z
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;->mCurrentItem:Lcom/miui/gallery/widget/PanelItem;

    iget-object v1, p0, Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;->mCurrentItem:Lcom/miui/gallery/widget/PanelItem;

    if-ne v1, p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;->mWaitingItems:Ljava/util/PriorityQueue;

    invoke-virtual {p1}, Ljava/util/PriorityQueue;->poll()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/widget/PanelItem;

    iput-object p1, p0, Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;->mCurrentItem:Lcom/miui/gallery/widget/PanelItem;

    iget-object p1, p0, Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;->mCurrentItem:Lcom/miui/gallery/widget/PanelItem;

    const/4 v1, 0x0

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;->mPanelBar:Lcom/miui/gallery/widget/PanelBar;

    iget-object v2, p0, Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;->mCurrentItem:Lcom/miui/gallery/widget/PanelItem;

    invoke-virtual {p1, v2, v1}, Lcom/miui/gallery/widget/PanelBar;->replaceItem(Lcom/miui/gallery/widget/PanelItem;Z)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;->mPanelBar:Lcom/miui/gallery/widget/PanelBar;

    invoke-virtual {p1, v1}, Lcom/miui/gallery/widget/PanelBar;->removeItem(Z)V

    :goto_0
    const/4 p1, 0x1

    if-eqz p2, :cond_1

    iget-object p2, p0, Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;->this$0:Lcom/miui/gallery/ui/HomePageTopBarController;

    new-instance v1, Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager$3;

    invoke-direct {v1, p0, v0}, Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager$3;-><init>(Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;Lcom/miui/gallery/widget/PanelItem;)V

    invoke-static {p2, p1, v1}, Lcom/miui/gallery/ui/HomePageTopBarController;->access$600(Lcom/miui/gallery/ui/HomePageTopBarController;ZLcom/miui/gallery/widget/TwoStageDrawer$DrawerAnimEndListener;)V

    goto :goto_1

    :cond_1
    iget-object p2, p0, Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;->this$0:Lcom/miui/gallery/ui/HomePageTopBarController;

    const/4 v0, 0x0

    invoke-static {p2, v1, v0}, Lcom/miui/gallery/ui/HomePageTopBarController;->access$600(Lcom/miui/gallery/ui/HomePageTopBarController;ZLcom/miui/gallery/widget/TwoStageDrawer$DrawerAnimEndListener;)V

    :goto_1
    return p1

    :cond_2
    iget-object p2, p0, Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;->mWaitingItems:Ljava/util/PriorityQueue;

    invoke-virtual {p2, p1}, Ljava/util/PriorityQueue;->remove(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public setItemEnable(Z)V
    .locals 3

    iget-boolean v0, p0, Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;->mIsItemEnable:Z

    if-eq p1, v0, :cond_2

    iput-boolean p1, p0, Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;->mIsItemEnable:Z

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;->mCurrentItem:Lcom/miui/gallery/widget/PanelItem;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;->mCurrentItem:Lcom/miui/gallery/widget/PanelItem;

    invoke-interface {v0}, Lcom/miui/gallery/widget/PanelItem;->getView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;->mCurrentItem:Lcom/miui/gallery/widget/PanelItem;

    invoke-interface {v0}, Lcom/miui/gallery/widget/PanelItem;->getView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/view/View;->setEnabled(Z)V

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;->mCurrentItem:Lcom/miui/gallery/widget/PanelItem;

    invoke-interface {v0}, Lcom/miui/gallery/widget/PanelItem;->getView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/view/View;->setClickable(Z)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;->mWaitingItems:Ljava/util/PriorityQueue;

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;->mWaitingItems:Ljava/util/PriorityQueue;

    invoke-virtual {v0}, Ljava/util/PriorityQueue;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/widget/PanelItem;

    invoke-interface {v1}, Lcom/miui/gallery/widget/PanelItem;->getView()Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Lcom/miui/gallery/widget/PanelItem;->getView()Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, p1}, Landroid/view/View;->setEnabled(Z)V

    invoke-interface {v1}, Lcom/miui/gallery/widget/PanelItem;->getView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/view/View;->setClickable(Z)V

    goto :goto_0

    :cond_2
    return-void
.end method
