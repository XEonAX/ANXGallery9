.class Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;
.super Ljava/lang/Object;
.source "PhotoPageFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPageFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MenuManager"
.end annotation


# instance fields
.field private final ORDER_IMAGE:I

.field private final ORDER_UNKNOWN:I

.field private final ORDER_VIDEO:I

.field private mMenu:Landroid/view/Menu;

.field private mOperationMask:I

.field private mOrder:I

.field final synthetic this$0:Lcom/miui/gallery/ui/PhotoPageFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/PhotoPageFragment;Landroid/view/Menu;I)V
    .locals 1

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, -0x1

    iput p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->ORDER_UNKNOWN:I

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->ORDER_IMAGE:I

    const/4 v0, 0x1

    iput v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->ORDER_VIDEO:I

    iput p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->mOrder:I

    iput-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->mMenu:Landroid/view/Menu;

    iput p3, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->mOperationMask:I

    return-void
.end method

.method static synthetic access$2600(Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;Ljava/lang/String;ZZ)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->refreshDownloadItem(Ljava/lang/String;ZZ)V

    return-void
.end method

.method static synthetic access$3300(Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;IZ)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->setMenuItemVisibility(IZ)V

    return-void
.end method

.method static synthetic access$3800(Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->setWallpaper(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$3900(Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;Landroid/net/Uri;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->setWallpaper(Landroid/net/Uri;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$4000(Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;Landroid/net/Uri;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->setSlideWallpaper(Landroid/net/Uri;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$4100(Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->setVideoWallpaper(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$4200(Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->onGetVideoWallpaperFileFailed()V

    return-void
.end method

.method private configMenu(Lcom/miui/gallery/model/BaseDataItem;)V
    .locals 5

    if-nez p1, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$1600(Lcom/miui/gallery/ui/PhotoPageFragment;)Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_2

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->isVideo()Z

    move-result v0

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->mOrder:I

    if-eq v0, v1, :cond_2

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->makeVideoOrder()V

    iput v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->mOrder:I

    goto :goto_0

    :cond_1
    iget v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->mOrder:I

    if-eqz v0, :cond_2

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->makeImageOrder()V

    iput v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->mOrder:I

    :cond_2
    :goto_0
    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getSupportOperations()I

    move-result v0

    iget v3, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->mOperationMask:I

    and-int/2addr v0, v3

    const v3, 0x7f090009

    invoke-static {v0, v1}, Lcom/miui/gallery/util/PhotoOperationsUtil;->isSupportedOptions(II)Z

    move-result v4

    invoke-direct {p0, v3, v4}, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->setMenuItemVisibility(IZ)V

    const v3, 0x7f09001b

    const/high16 v4, 0x80000

    invoke-static {v0, v4}, Lcom/miui/gallery/util/PhotoOperationsUtil;->isSupportedOptions(II)Z

    move-result v4

    invoke-direct {p0, v3, v4}, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->setMenuItemVisibility(IZ)V

    const v3, 0x7f09000d

    iget-object v4, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v4}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$4600(Lcom/miui/gallery/ui/PhotoPageFragment;)Z

    move-result v4

    if-nez v4, :cond_3

    const/16 v4, 0x200

    invoke-static {v0, v4}, Lcom/miui/gallery/util/PhotoOperationsUtil;->isSupportedOptions(II)Z

    move-result v4

    if-eqz v4, :cond_3

    const/4 v4, 0x1

    goto :goto_1

    :cond_3
    const/4 v4, 0x0

    :goto_1
    invoke-direct {p0, v3, v4}, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->setMenuItemVisibility(IZ)V

    const v3, 0x7f09001d

    iget-object v4, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v4}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$4600(Lcom/miui/gallery/ui/PhotoPageFragment;)Z

    move-result v4

    if-nez v4, :cond_4

    const/4 v4, 0x4

    invoke-static {v0, v4}, Lcom/miui/gallery/util/PhotoOperationsUtil;->isSupportedOptions(II)Z

    move-result v4

    if-eqz v4, :cond_4

    const/4 v4, 0x1

    goto :goto_2

    :cond_4
    const/4 v4, 0x0

    :goto_2
    invoke-direct {p0, v3, v4}, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->setMenuItemVisibility(IZ)V

    const v3, 0x7f090021

    iget-object v4, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v4}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$4600(Lcom/miui/gallery/ui/PhotoPageFragment;)Z

    move-result v4

    if-nez v4, :cond_5

    const/16 v4, 0x20

    invoke-static {v0, v4}, Lcom/miui/gallery/util/PhotoOperationsUtil;->isSupportedOptions(II)Z

    move-result v4

    if-eqz v4, :cond_5

    const/4 v4, 0x1

    goto :goto_3

    :cond_5
    const/4 v4, 0x0

    :goto_3
    invoke-direct {p0, v3, v4}, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->setMenuItemVisibility(IZ)V

    const v3, 0x7f09001f

    iget-object v4, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v4}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$4600(Lcom/miui/gallery/ui/PhotoPageFragment;)Z

    move-result v4

    if-nez v4, :cond_6

    const/16 v4, 0x800

    invoke-static {v0, v4}, Lcom/miui/gallery/util/PhotoOperationsUtil;->isSupportedOptions(II)Z

    move-result v4

    if-eqz v4, :cond_6

    const/4 v4, 0x1

    goto :goto_4

    :cond_6
    const/4 v4, 0x0

    :goto_4
    invoke-direct {p0, v3, v4}, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->setMenuItemVisibility(IZ)V

    const v3, 0x7f090002

    iget-object v4, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v4}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$4600(Lcom/miui/gallery/ui/PhotoPageFragment;)Z

    move-result v4

    if-nez v4, :cond_7

    const/high16 v4, 0x100000

    invoke-static {v0, v4}, Lcom/miui/gallery/util/PhotoOperationsUtil;->isSupportedOptions(II)Z

    move-result v4

    if-eqz v4, :cond_7

    const/4 v4, 0x1

    goto :goto_5

    :cond_7
    const/4 v4, 0x0

    :goto_5
    invoke-direct {p0, v3, v4}, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->setMenuItemVisibility(IZ)V

    const v3, 0x7f090016

    iget-object v4, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v4}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$4600(Lcom/miui/gallery/ui/PhotoPageFragment;)Z

    move-result v4

    if-nez v4, :cond_8

    const/high16 v4, 0x40000

    invoke-static {v0, v4}, Lcom/miui/gallery/util/PhotoOperationsUtil;->isSupportedOptions(II)Z

    move-result v4

    if-eqz v4, :cond_8

    const/4 v4, 0x1

    goto :goto_6

    :cond_8
    const/4 v4, 0x0

    :goto_6
    invoke-direct {p0, v3, v4}, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->setMenuItemVisibility(IZ)V

    const v3, 0x7f09001a

    iget-object v4, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v4}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$4600(Lcom/miui/gallery/ui/PhotoPageFragment;)Z

    move-result v4

    if-nez v4, :cond_9

    const/high16 v4, 0x1000000

    invoke-static {v0, v4}, Lcom/miui/gallery/util/PhotoOperationsUtil;->isSupportedOptions(II)Z

    move-result v4

    if-eqz v4, :cond_9

    const/4 v4, 0x1

    goto :goto_7

    :cond_9
    const/4 v4, 0x0

    :goto_7
    invoke-direct {p0, v3, v4}, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->setMenuItemVisibility(IZ)V

    const v3, 0x7f090020

    const/16 v4, 0x1000

    invoke-static {v0, v4}, Lcom/miui/gallery/util/PhotoOperationsUtil;->isSupportedOptions(II)Z

    move-result v4

    invoke-direct {p0, v3, v4}, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->setMenuItemVisibility(IZ)V

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->getDownloadOriginTitle(Lcom/miui/gallery/model/BaseDataItem;)Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0x100

    invoke-static {v0, v4}, Lcom/miui/gallery/util/PhotoOperationsUtil;->isSupportedOptions(II)Z

    move-result v4

    invoke-direct {p0, v3, v4, v1}, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->refreshDownloadItem(Ljava/lang/String;ZZ)V

    iget-object v3, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v4, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v4}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$4600(Lcom/miui/gallery/ui/PhotoPageFragment;)Z

    move-result v4

    if-nez v4, :cond_a

    const/high16 v4, 0x800000

    invoke-static {v0, v4}, Lcom/miui/gallery/util/PhotoOperationsUtil;->isSupportedOptions(II)Z

    move-result v0

    if-eqz v0, :cond_a

    goto :goto_8

    :cond_a
    const/4 v1, 0x0

    :goto_8
    invoke-static {v3, v1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$4302(Lcom/miui/gallery/ui/PhotoPageFragment;Z)Z

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$1900(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_b

    invoke-virtual {p0, v1, v2, v2}, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->refreshCastItem(Ljava/lang/String;ZZ)V

    goto :goto_9

    :cond_b
    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_c

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/webkit/URLUtil;->isContentUrl(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_c

    invoke-virtual {p0, v1, v2, v2}, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->refreshCastItem(Ljava/lang/String;ZZ)V

    goto :goto_9

    :cond_c
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$1900(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->refreshProjectState()V

    :goto_9
    return-void
.end method

.method private doDelete(I)V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment;->mAdapter:Lcom/miui/gallery/adapter/PhotoPageAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->getDataSet()Lcom/miui/gallery/model/BaseDataSet;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageFragment;->mAdapter:Lcom/miui/gallery/adapter/PhotoPageAdapter;

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v2, v2, Lcom/miui/gallery/ui/PhotoPageFragment;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {v2}, Lcom/miui/gallery/widget/ViewPager;->getCurrentItem()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->getDataItem(I)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object v1

    if-eqz v0, :cond_0

    if-eqz v1, :cond_0

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v2, v2, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    new-instance v3, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager$10;

    invoke-direct {v3, p0, v1}, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager$10;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;Lcom/miui/gallery/model/BaseDataItem;)V

    invoke-virtual {v0, v2, p1, v3}, Lcom/miui/gallery/model/BaseDataSet;->delete(Landroid/app/Activity;ILcom/miui/gallery/ui/DeletionTask$OnDeletionCompleteListener;)V

    :cond_0
    return-void
.end method

.method private getDownloadOriginTitle(Lcom/miui/gallery/model/BaseDataItem;)Ljava/lang/String;
    .locals 8

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->isBurstItem()Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_2

    const-wide/16 v3, 0x0

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getBurstGroup()Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v5}, Lcom/miui/gallery/model/BaseDataItem;->getSize()J

    move-result-wide v5

    add-long/2addr v3, v5

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v5, 0x7f0e0012

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v6

    new-array v7, v2, [Ljava/lang/Object;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v7, v1

    invoke-virtual {v0, v5, v6, v7}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v5, 0x7f1000c6

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    aput-object p1, v6, v1

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {p1, v3, v4}, Lcom/miui/gallery/util/FormatUtil;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object p1

    aput-object p1, v6, v2

    invoke-virtual {v0, v5, v6}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v3, 0x7f100425

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v4, v4, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getSize()J

    move-result-wide v5

    invoke-static {v4, v5, v6}, Lcom/miui/gallery/util/FormatUtil;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object p1

    aput-object p1, v2, v1

    invoke-virtual {v0, v3, v2}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private isOperationWithoutKeyGuard(I)Z
    .locals 1

    const v0, 0x7f09001d

    if-eq p1, v0, :cond_1

    const v0, 0x7f09000d

    if-eq p1, v0, :cond_1

    const v0, 0x7f090021

    if-eq p1, v0, :cond_1

    const v0, 0x7f090002

    if-ne p1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    :goto_1
    return p1
.end method

.method private makeImageOrder()V
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->mMenu:Landroid/view/Menu;

    const v1, 0x7f09000d

    invoke-interface {v0, v1}, Landroid/view/Menu;->removeItem(I)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->mMenu:Landroid/view/Menu;

    const/4 v2, 0x0

    const/4 v3, 0x2

    const v4, 0x7f1004d7

    invoke-interface {v0, v2, v1, v3, v4}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v0

    const v4, 0x7f070054

    invoke-interface {v0, v4}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->mMenu:Landroid/view/Menu;

    invoke-interface {v0, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    invoke-interface {v0, v3}, Landroid/view/MenuItem;->setShowAsAction(I)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->mMenu:Landroid/view/Menu;

    const v1, 0x7f090002

    invoke-interface {v0, v1}, Landroid/view/Menu;->removeItem(I)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->mMenu:Landroid/view/Menu;

    const/4 v4, 0x5

    const v5, 0x7f1004cd

    invoke-interface {v0, v2, v1, v4, v5}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v0

    const v1, 0x7f070071

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    move-result-object v0

    invoke-interface {v0, v3}, Landroid/view/MenuItem;->setShowAsAction(I)V

    return-void
.end method

.method private makeVideoOrder()V
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->mMenu:Landroid/view/Menu;

    const v1, 0x7f09000d

    invoke-interface {v0, v1}, Landroid/view/Menu;->removeItem(I)V

    invoke-static {}, Lcom/miui/gallery/video/editor/sdk/Build;->supportVideoEditor()Z

    move-result v0

    const/4 v2, 0x0

    const/4 v3, 0x2

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->mMenu:Landroid/view/Menu;

    const v4, 0x7f1004d8

    invoke-interface {v0, v2, v1, v3, v4}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v0

    const v4, 0x7f070054

    invoke-interface {v0, v4}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->mMenu:Landroid/view/Menu;

    invoke-interface {v0, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    invoke-interface {v0, v3}, Landroid/view/MenuItem;->setShowAsAction(I)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->mMenu:Landroid/view/Menu;

    const v1, 0x7f090002

    invoke-interface {v0, v1}, Landroid/view/Menu;->removeItem(I)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->mMenu:Landroid/view/Menu;

    const/4 v4, 0x4

    const v5, 0x7f1004cd

    invoke-interface {v0, v2, v1, v4, v5}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v0

    const v1, 0x7f070071

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    move-result-object v0

    invoke-interface {v0, v3}, Landroid/view/MenuItem;->setShowAsAction(I)V

    return-void
.end method

.method private onGetVideoWallpaperFileFailed()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const v1, 0x7f10066c

    invoke-static {v0, v1}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    const-string v0, "video"

    const-string v1, "set_slide_wallpaper_fail"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private onGetWallpaperFileFailed()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const v1, 0x7f10066d

    invoke-static {v0, v1}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    return-void
.end method

.method private refreshDownloadItem(Ljava/lang/String;ZZ)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->mMenu:Landroid/view/Menu;

    const v1, 0x7f09000c

    invoke-interface {v0, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    invoke-interface {v0}, Landroid/view/MenuItem;->getTitle()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    invoke-interface {v0, p1}, Landroid/view/MenuItem;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    :cond_1
    invoke-interface {v0}, Landroid/view/MenuItem;->isVisible()Z

    move-result p1

    if-eq p1, p2, :cond_2

    invoke-interface {v0, p2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :cond_2
    invoke-interface {v0}, Landroid/view/MenuItem;->isEnabled()Z

    move-result p1

    if-eq p1, p3, :cond_3

    invoke-interface {v0, p3}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    :cond_3
    return-void
.end method

.method private setMenuItemVisibility(IZ)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->mMenu:Landroid/view/Menu;

    invoke-interface {v0, p1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object p1

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-interface {p1}, Landroid/view/MenuItem;->isVisible()Z

    move-result v0

    if-eq v0, p2, :cond_1

    invoke-interface {p1, p2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :cond_1
    return-void
.end method

.method private setSlideWallpaper(Landroid/net/Uri;Ljava/lang/String;)V
    .locals 1

    if-nez p1, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->onGetWallpaperFileFailed()V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {v0, p1, p2}, Lcom/miui/gallery/util/SlideWallpaperUtils;->setSlideWallpaper(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;)V

    return-void
.end method

.method private setVideoWallpaper(Ljava/lang/String;)V
    .locals 1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->onGetVideoWallpaperFileFailed()V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {v0, p1}, Lcom/miui/gallery/util/VideoWallpaperUtils;->setVideoWallpaper(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method private setWallpaper(Landroid/net/Uri;Ljava/lang/String;)V
    .locals 1

    if-nez p1, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->onGetWallpaperFileFailed()V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {v0, p1, p2}, Lcom/miui/gallery/util/WallpaperUtils;->setWallPapers(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;)V

    const-string p1, "photo"

    const-string p2, "set_as_wallpaper"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private setWallpaper(Ljava/lang/String;)V
    .locals 2

    invoke-static {p1}, Lcom/miui/gallery/util/FileUtils;->isFileExist(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p1}, Lcom/miui/gallery/util/FileMimeUtil;->getMimeType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object p1

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->setWallpaper(Landroid/net/Uri;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->onGetWallpaperFileFailed()V

    :goto_0
    return-void
.end method


# virtual methods
.method public onMenuItemClick(Landroid/view/MenuItem;)V
    .locals 13

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment;->mAdapter:Lcom/miui/gallery/adapter/PhotoPageAdapter;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageFragment;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {v1}, Lcom/miui/gallery/widget/ViewPager;->getCurrentItem()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->getDataItem(I)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$2900(Lcom/miui/gallery/ui/PhotoPageFragment;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->isOperationWithoutKeyGuard(I)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$3000(Lcom/miui/gallery/ui/PhotoPageFragment;)V

    :cond_1
    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v1, v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$3100(Lcom/miui/gallery/ui/PhotoPageFragment;Lcom/miui/gallery/model/BaseDataItem;)Ljava/lang/String;

    move-result-object v1

    const v2, 0x7f09000c

    sparse-switch p1, :sswitch_data_0

    goto/16 :goto_7

    :sswitch_0
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p1, v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$3400(Lcom/miui/gallery/ui/PhotoPageFragment;Lcom/miui/gallery/model/BaseDataItem;)Z

    move-result p1

    if-eqz p1, :cond_2

    return-void

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->mMenu:Landroid/view/Menu;

    invoke-interface {p1, v2}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object p1

    if-eqz p1, :cond_3

    invoke-interface {p1}, Landroid/view/MenuItem;->isVisible()Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v2, p1, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const v3, 0x7f100664

    const v4, 0x7f100665

    const v5, 0x7f100786

    const v6, 0x7f1004bb

    new-instance v7, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager$2;

    invoke-direct {v7, p0, v0}, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager$2;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;Lcom/miui/gallery/model/BaseDataItem;)V

    new-instance v8, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager$3;

    invoke-direct {v8, p0, v0}, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager$3;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;Lcom/miui/gallery/model/BaseDataItem;)V

    invoke-static/range {v2 .. v8}, Lcom/miui/gallery/util/DialogUtil;->showInfoDialog(Landroid/content/Context;IIIILandroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog;

    goto :goto_0

    :cond_3
    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem;->getContentUriForExternal()Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem;->getMimeType()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->setWallpaper(Landroid/net/Uri;Ljava/lang/String;)V

    :goto_0
    const-string p1, "set_wallpaper_click"

    invoke-static {v1, p1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_7

    :sswitch_1
    const-string p1, "video"

    const-string v1, "set_slide_wallpaper_click"

    invoke-static {p1, v1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p1, v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$3400(Lcom/miui/gallery/ui/PhotoPageFragment;Lcom/miui/gallery/model/BaseDataItem;)Z

    move-result p1

    if-eqz p1, :cond_4

    return-void

    :cond_4
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->mMenu:Landroid/view/Menu;

    invoke-interface {p1, v2}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object p1

    if-eqz p1, :cond_5

    invoke-interface {p1}, Landroid/view/MenuItem;->isVisible()Z

    move-result p1

    if-eqz p1, :cond_5

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v1, p1, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const v2, 0x7f100662

    const v3, 0x7f100663

    const v4, 0x7f100786

    const v5, 0x7f1004bb

    new-instance v6, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager$6;

    invoke-direct {v6, p0, v0}, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager$6;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;Lcom/miui/gallery/model/BaseDataItem;)V

    new-instance v7, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager$7;

    invoke-direct {v7, p0}, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager$7;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;)V

    invoke-static/range {v1 .. v7}, Lcom/miui/gallery/util/DialogUtil;->showInfoDialog(Landroid/content/Context;IIIILandroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog;

    goto/16 :goto_7

    :cond_5
    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->setVideoWallpaper(Ljava/lang/String;)V

    goto/16 :goto_7

    :sswitch_2
    const-string p1, "set_slide_wallpaper_click"

    invoke-static {v1, p1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p1, v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$3400(Lcom/miui/gallery/ui/PhotoPageFragment;Lcom/miui/gallery/model/BaseDataItem;)Z

    move-result p1

    if-eqz p1, :cond_6

    return-void

    :cond_6
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->mMenu:Landroid/view/Menu;

    invoke-interface {p1, v2}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object p1

    if-eqz p1, :cond_7

    invoke-interface {p1}, Landroid/view/MenuItem;->isVisible()Z

    move-result p1

    if-eqz p1, :cond_7

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v1, p1, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const v2, 0x7f100660

    const v3, 0x7f100661

    const v4, 0x7f100786

    const v5, 0x7f1004bb

    new-instance v6, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager$4;

    invoke-direct {v6, p0, v0}, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager$4;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;Lcom/miui/gallery/model/BaseDataItem;)V

    new-instance v7, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager$5;

    invoke-direct {v7, p0, v0}, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager$5;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;Lcom/miui/gallery/model/BaseDataItem;)V

    invoke-static/range {v1 .. v7}, Lcom/miui/gallery/util/DialogUtil;->showInfoDialog(Landroid/content/Context;IIIILandroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog;

    goto/16 :goto_7

    :cond_7
    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem;->getContentUriForExternal()Landroid/net/Uri;

    move-result-object p1

    instance-of v1, v0, Lcom/miui/gallery/model/CloudItem;

    if-eqz v1, :cond_8

    check-cast v0, Lcom/miui/gallery/model/CloudItem;

    invoke-virtual {v0}, Lcom/miui/gallery/model/CloudItem;->getSha1()Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    :cond_8
    const/4 v0, 0x0

    :goto_1
    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->setSlideWallpaper(Landroid/net/Uri;Ljava/lang/String;)V

    goto/16 :goto_7

    :sswitch_3
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p1, v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$3400(Lcom/miui/gallery/ui/PhotoPageFragment;Lcom/miui/gallery/model/BaseDataItem;)Z

    move-result p1

    if-eqz p1, :cond_9

    return-void

    :cond_9
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$1800(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;

    move-result-object p1

    if-eqz p1, :cond_a

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$1800(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;

    move-result-object p1

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/miui/gallery/ui/PhotoPageFragment$ChoiceManager;->setSlipped(Z)V

    :cond_a
    const-string p1, "send"

    invoke-static {v1, p1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_7

    :sswitch_4
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    new-instance v2, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager$1;

    invoke-direct {v2, p0}, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager$1;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;)V

    invoke-virtual {v0, p1, v2}, Lcom/miui/gallery/model/BaseDataItem;->save(Landroid/app/Activity;Lcom/miui/gallery/ui/SaveUriDialogFragment$OnCompleteListener;)V

    const-string p1, "save_photo"

    invoke-static {v1, p1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_7

    :sswitch_5
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragment;->mAdapter:Lcom/miui/gallery/adapter/PhotoPageAdapter;

    invoke-virtual {p1}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->getDataSet()Lcom/miui/gallery/model/BaseDataSet;

    move-result-object p1

    if-eqz p1, :cond_b

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v2, v2, Lcom/miui/gallery/ui/PhotoPageFragment;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {v2}, Lcom/miui/gallery/widget/ViewPager;->getCurrentItem()I

    move-result v2

    new-instance v3, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager$9;

    invoke-direct {v3, p0}, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager$9;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;)V

    invoke-virtual {p1, v0, v2, v3}, Lcom/miui/gallery/model/BaseDataSet;->removeFromSecret(Landroid/app/Activity;ILcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;)Z

    :cond_b
    const-string p1, "remove_from_secret"

    invoke-static {v1, p1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_7

    :sswitch_6
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$1900(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;

    move-result-object p1

    if-eqz p1, :cond_c

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$1900(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->isConnected()Z

    move-result p1

    if-eqz p1, :cond_c

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$1900(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/ViewPager;->getCurrentItem()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->enterSlideShow(I)V

    goto :goto_4

    :cond_c
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "photo_init_position"

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v2, v2, Lcom/miui/gallery/ui/PhotoPageFragment;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {v2}, Lcom/miui/gallery/widget/ViewPager;->getCurrentItem()I

    move-result v2

    invoke-virtual {p1, v0, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragment;->mAdapter:Lcom/miui/gallery/adapter/PhotoPageAdapter;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/ViewPager;->getCurrentItem()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->getDataItem(I)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object p1

    if-eqz p1, :cond_e

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_d

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getThumnailPath()Ljava/lang/String;

    move-result-object v0

    :goto_2
    move-object v5, v0

    goto :goto_3

    :cond_d
    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v0

    goto :goto_2

    :goto_3
    new-instance v0, Lcom/miui/gallery/model/ImageLoadParams;

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getKey()J

    move-result-wide v3

    const/4 v6, 0x0

    const/4 v7, 0x0

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v2, v2, Lcom/miui/gallery/ui/PhotoPageFragment;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {v2}, Lcom/miui/gallery/widget/ViewPager;->getCurrentItem()I

    move-result v8

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getMimeType()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getSecretKey()[B

    move-result-object v10

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getSize()J

    move-result-wide v11

    move-object v2, v0

    invoke-direct/range {v2 .. v12}, Lcom/miui/gallery/model/ImageLoadParams;-><init>(JLjava/lang/String;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Landroid/graphics/RectF;ILjava/lang/String;[BJ)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v2, "photo_transition_data"

    invoke-virtual {p1, v2, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    :cond_e
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/miui/gallery/ui/SlideShowFragment;->showSlideShowFragment(Lcom/miui/gallery/activity/BaseActivity;Landroid/os/Bundle;)V

    :goto_4
    const-string p1, "play_slide_show"

    invoke-static {v1, p1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_7

    :sswitch_7
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$3200(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;

    move-result-object p1

    if-eqz p1, :cond_15

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$3200(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;->toggle()V

    goto/16 :goto_7

    :sswitch_8
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p1, v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$3400(Lcom/miui/gallery/ui/PhotoPageFragment;Lcom/miui/gallery/model/BaseDataItem;)Z

    move-result p1

    if-eqz p1, :cond_f

    return-void

    :cond_f
    invoke-static {}, Lcom/miui/gallery/util/IntentUtil;->isSupportMeituEditor()Z

    move-result p1

    if-eqz p1, :cond_10

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem;->isVideo()Z

    move-result p1

    if-nez p1, :cond_10

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem;->isSecret()Z

    move-result p1

    if-nez p1, :cond_10

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v0, p1, v2}, Lcom/miui/gallery/util/IntentUtil;->startMeituEditAction(Lcom/miui/gallery/model/BaseDataItem;Landroid/app/Activity;Lcom/miui/gallery/ui/PhotoPageFragment;)Z

    move-result p1

    if-eqz p1, :cond_10

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$3500(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$MeituEditorManager;

    move-result-object p1

    if-eqz p1, :cond_11

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$3500(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$MeituEditorManager;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageFragment$MeituEditorManager;->onStartEditor()V

    goto :goto_5

    :cond_10
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v0, p1, v2}, Lcom/miui/gallery/util/IntentUtil;->startEditAction(Lcom/miui/gallery/model/BaseDataItem;Landroid/app/Activity;Lcom/miui/gallery/ui/PhotoPageFragment;)Z

    move-result p1

    if-eqz p1, :cond_11

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$3600(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$PhotoEditorManager;

    move-result-object p1

    if-eqz p1, :cond_11

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$3600(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$PhotoEditorManager;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoEditorManager;->onStartEditor()V

    :cond_11
    :goto_5
    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem;->isVideo()Z

    move-result p1

    if-eqz p1, :cond_12

    const-string p1, "edit_video"

    goto :goto_6

    :cond_12
    const-string p1, "edit_photo"

    :goto_6
    invoke-static {v1, p1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_7

    :sswitch_9
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$4400(Lcom/miui/gallery/ui/PhotoPageFragment;)V

    const-string p1, "download_origin"

    invoke-static {v1, p1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_7

    :sswitch_a
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment;->mAdapter:Lcom/miui/gallery/adapter/PhotoPageAdapter;

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v2, v2, Lcom/miui/gallery/ui/PhotoPageFragment;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {v2}, Lcom/miui/gallery/widget/ViewPager;->getCurrentItem()I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->getDataItem(I)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object v0

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v2}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$3700(Lcom/miui/gallery/ui/PhotoPageFragment;)Z

    move-result v2

    invoke-static {p1, v0, v2}, Lcom/miui/gallery/util/IntentUtil;->gotoPhotoDetailPage(Landroid/app/Activity;Lcom/miui/gallery/model/BaseDataItem;Z)V

    const-string p1, "view_detail"

    invoke-static {v1, p1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_7

    :sswitch_b
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragment;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {p1}, Lcom/miui/gallery/widget/ViewPager;->getCurrentItem()I

    move-result p1

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->doDelete(I)V

    const-string p1, "delete_photo"

    invoke-static {v1, p1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_7

    :sswitch_c
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$1900(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;

    move-result-object p1

    if-eqz p1, :cond_15

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$1900(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->access$4500(Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;)V

    const-string p1, "project_photo"

    invoke-static {v1, p1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_7

    :sswitch_d
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p1, v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$3400(Lcom/miui/gallery/ui/PhotoPageFragment;Lcom/miui/gallery/model/BaseDataItem;)Z

    move-result p1

    if-eqz p1, :cond_13

    return-void

    :cond_13
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragment;->mAdapter:Lcom/miui/gallery/adapter/PhotoPageAdapter;

    invoke-virtual {p1}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->getDataSet()Lcom/miui/gallery/model/BaseDataSet;

    move-result-object v2

    if-eqz v2, :cond_14

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v3, p1, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragment;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {p1}, Lcom/miui/gallery/widget/ViewPager;->getCurrentItem()I

    move-result v4

    const/4 v5, 0x1

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$4300(Lcom/miui/gallery/ui/PhotoPageFragment;)Z

    move-result v6

    new-instance v7, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager$8;

    invoke-direct {v7, p0}, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager$8;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;)V

    invoke-virtual/range {v2 .. v7}, Lcom/miui/gallery/model/BaseDataSet;->addToAlbum(Landroid/app/Activity;IZZLcom/miui/gallery/util/MediaAndAlbumOperations$OnAddAlbumListener;)Z

    :cond_14
    const-string p1, "add_to_album"

    invoke-static {v1, p1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    :cond_15
    :goto_7
    return-void

    :sswitch_data_0
    .sparse-switch
        0x7f090002 -> :sswitch_d
        0x7f090005 -> :sswitch_c
        0x7f090009 -> :sswitch_b
        0x7f09000a -> :sswitch_a
        0x7f09000c -> :sswitch_9
        0x7f09000d -> :sswitch_8
        0x7f09000e -> :sswitch_7
        0x7f090016 -> :sswitch_6
        0x7f09001a -> :sswitch_5
        0x7f09001b -> :sswitch_4
        0x7f09001d -> :sswitch_3
        0x7f09001f -> :sswitch_2
        0x7f090020 -> :sswitch_1
        0x7f090021 -> :sswitch_0
    .end sparse-switch
.end method

.method refreshCastItem(Ljava/lang/String;ZZ)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->mMenu:Landroid/view/Menu;

    const v1, 0x7f090005

    invoke-interface {v0, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    invoke-interface {v0}, Landroid/view/MenuItem;->getTitle()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    invoke-static {p1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object p1

    invoke-interface {v0, p1}, Landroid/view/MenuItem;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    :cond_1
    invoke-interface {v0}, Landroid/view/MenuItem;->isVisible()Z

    move-result p1

    if-eq p1, p2, :cond_2

    invoke-interface {v0, p2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :cond_2
    invoke-interface {v0}, Landroid/view/MenuItem;->isEnabled()Z

    move-result p1

    if-eq p1, p3, :cond_3

    invoke-interface {v0, p3}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    :cond_3
    return-void
.end method

.method public refreshDownloadItem(ZZ)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment;->mAdapter:Lcom/miui/gallery/adapter/PhotoPageAdapter;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageFragment;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {v1}, Lcom/miui/gallery/widget/ViewPager;->getCurrentItem()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->getDataItem(I)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->getDownloadOriginTitle(Lcom/miui/gallery/model/BaseDataItem;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p1, p2}, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->refreshDownloadItem(Ljava/lang/String;ZZ)V

    return-void
.end method

.method public settleItem(Lcom/miui/gallery/model/BaseDataItem;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->configMenu(Lcom/miui/gallery/model/BaseDataItem;)V

    return-void
.end method
