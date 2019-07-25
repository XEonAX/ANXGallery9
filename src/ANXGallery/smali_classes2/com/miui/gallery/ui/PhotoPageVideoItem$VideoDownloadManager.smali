.class Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoDownloadManager;
.super Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;
.source "PhotoPageVideoItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPageVideoItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "VideoDownloadManager"
.end annotation


# instance fields
.field private mOriginProgressBar:Landroid/widget/ProgressBar;

.field final synthetic this$0:Lcom/miui/gallery/ui/PhotoPageVideoItem;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/ui/PhotoPageVideoItem;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoDownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageVideoItem;

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;-><init>(Lcom/miui/gallery/ui/PhotoPageItem;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/ui/PhotoPageVideoItem;Lcom/miui/gallery/ui/PhotoPageVideoItem$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoDownloadManager;-><init>(Lcom/miui/gallery/ui/PhotoPageVideoItem;)V

    return-void
.end method

.method private initOriginProgressBar()Landroid/widget/ProgressBar;
    .locals 6

    new-instance v0, Lcom/miui/gallery/widget/CircleStrokeProgressBar;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoDownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageVideoItem;

    invoke-virtual {v1}, Lcom/miui/gallery/ui/PhotoPageVideoItem;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/miui/gallery/widget/CircleStrokeProgressBar;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x1

    new-array v2, v1, [I

    const/4 v3, 0x0

    const v4, 0x7f0701fc

    aput v4, v2, v3

    new-array v4, v1, [I

    const v5, 0x7f0701fe

    aput v5, v4, v3

    const/4 v5, 0x0

    invoke-virtual {v0, v2, v4, v5}, Lcom/miui/gallery/widget/CircleStrokeProgressBar;->setDrawablesForLevels([I[I[I)V

    new-array v1, v1, [I

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoDownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageVideoItem;

    invoke-virtual {v2}, Lcom/miui/gallery/ui/PhotoPageVideoItem;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v4, 0x7f050083

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    aput v2, v1, v3

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoDownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageVideoItem;

    invoke-virtual {v2}, Lcom/miui/gallery/ui/PhotoPageVideoItem;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f06012e

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/widget/CircleStrokeProgressBar;->setMiddleStrokeColors([IF)V

    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v2, -0x2

    invoke-direct {v1, v2, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    const/16 v2, 0xd

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    const/16 v2, 0x8

    invoke-virtual {v0, v2}, Lcom/miui/gallery/widget/CircleStrokeProgressBar;->setVisibility(I)V

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoDownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageVideoItem;

    invoke-virtual {v2, v0, v1}, Lcom/miui/gallery/ui/PhotoPageVideoItem;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-object v0
.end method


# virtual methods
.method protected adjustProgressBarLocation(ZLandroid/graphics/RectF;Z)V
    .locals 2

    invoke-static {}, Lcom/miui/gallery/util/uil/CloudImageLoader;->getInstance()Lcom/miui/gallery/util/uil/CloudImageLoader;

    move-result-object v0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoDownloadManager;->getCurDownloadType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/util/uil/CloudImageLoader;->isOrigin(Lcom/miui/gallery/sdk/download/DownloadType;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    invoke-super {p0, p1, p2, p3}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->adjustProgressBarLocation(ZLandroid/graphics/RectF;Z)V

    return-void
.end method

.method protected doOnDownloaded(Lcom/miui/gallery/sdk/download/DownloadType;Ljava/lang/String;)V
    .locals 0

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->doOnDownloaded(Lcom/miui/gallery/sdk/download/DownloadType;Ljava/lang/String;)V

    invoke-static {}, Lcom/miui/gallery/util/uil/CloudImageLoader;->getInstance()Lcom/miui/gallery/util/uil/CloudImageLoader;

    move-result-object p2

    invoke-virtual {p2, p1}, Lcom/miui/gallery/util/uil/CloudImageLoader;->isOrigin(Lcom/miui/gallery/sdk/download/DownloadType;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoDownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageVideoItem;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageVideoItem;->access$600(Lcom/miui/gallery/ui/PhotoPageVideoItem;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoDownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageVideoItem;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageVideoItem;->access$700(Lcom/miui/gallery/ui/PhotoPageVideoItem;)V

    :cond_0
    return-void
.end method

.method protected doOnProgressVisibilityChanged(Z)V
    .locals 3

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->doOnProgressVisibilityChanged(Z)V

    invoke-static {}, Lcom/miui/gallery/util/uil/CloudImageLoader;->getInstance()Lcom/miui/gallery/util/uil/CloudImageLoader;

    move-result-object v0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoDownloadManager;->getCurDownloadType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/util/uil/CloudImageLoader;->isOrigin(Lcom/miui/gallery/sdk/download/DownloadType;)Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x0

    if-nez p1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoDownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageVideoItem;

    invoke-static {v1}, Lcom/miui/gallery/ui/PhotoPageVideoItem;->access$600(Lcom/miui/gallery/ui/PhotoPageVideoItem;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoDownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageVideoItem;

    xor-int/lit8 v2, p1, 0x1

    invoke-static {v1, v2}, Lcom/miui/gallery/ui/PhotoPageVideoItem;->access$800(Lcom/miui/gallery/ui/PhotoPageVideoItem;Z)V

    goto :goto_1

    :cond_1
    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoDownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageVideoItem;

    xor-int/lit8 v2, p1, 0x1

    invoke-static {v1, v2}, Lcom/miui/gallery/ui/PhotoPageVideoItem;->access$400(Lcom/miui/gallery/ui/PhotoPageVideoItem;Z)V

    :goto_1
    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoDownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageVideoItem;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageVideoItem;->mEmptyView:Lcom/miui/gallery/ui/PhotoPageItem$EmptyView;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/ui/PhotoPageItem$EmptyView;->setVisible(Z)V

    :cond_2
    return-void
.end method

.method protected filterError(Lcom/miui/gallery/error/core/ErrorCode;)Z
    .locals 1

    sget-object v0, Lcom/miui/gallery/error/core/ErrorCode;->DECODE_ERROR:Lcom/miui/gallery/error/core/ErrorCode;

    if-ne p1, v0, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoDownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageVideoItem;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageVideoItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {p1}, Luk/co/senab/photoview/PhotoView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method protected getErrorTip()Ljava/lang/CharSequence;
    .locals 6

    invoke-static {}, Lcom/miui/gallery/util/uil/CloudImageLoader;->getInstance()Lcom/miui/gallery/util/uil/CloudImageLoader;

    move-result-object v0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoDownloadManager;->getCurDownloadType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/util/uil/CloudImageLoader;->isOrigin(Lcom/miui/gallery/sdk/download/DownloadType;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoDownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageVideoItem;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageVideoItem;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f100315

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoDownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageVideoItem;

    invoke-virtual {v4}, Lcom/miui/gallery/ui/PhotoPageVideoItem;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f1004fa

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    invoke-super {p0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->getErrorTip()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method protected getProgressBar()Landroid/widget/ProgressBar;
    .locals 2

    invoke-static {}, Lcom/miui/gallery/util/uil/CloudImageLoader;->getInstance()Lcom/miui/gallery/util/uil/CloudImageLoader;

    move-result-object v0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoDownloadManager;->getCurDownloadType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/util/uil/CloudImageLoader;->isOrigin(Lcom/miui/gallery/sdk/download/DownloadType;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoDownloadManager;->mOriginProgressBar:Landroid/widget/ProgressBar;

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoDownloadManager;->initOriginProgressBar()Landroid/widget/ProgressBar;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoDownloadManager;->mOriginProgressBar:Landroid/widget/ProgressBar;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoDownloadManager;->mOriginProgressBar:Landroid/widget/ProgressBar;

    return-object v0

    :cond_1
    invoke-super {p0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->getProgressBar()Landroid/widget/ProgressBar;

    move-result-object v0

    return-object v0
.end method

.method public isProgressVisible()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoDownloadManager;->mOriginProgressBar:Landroid/widget/ProgressBar;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoDownloadManager;->mOriginProgressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v0}, Landroid/widget/ProgressBar;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method protected needShowDownloadView()Z
    .locals 2

    invoke-static {}, Lcom/miui/gallery/util/uil/CloudImageLoader;->getInstance()Lcom/miui/gallery/util/uil/CloudImageLoader;

    move-result-object v0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoDownloadManager;->getCurDownloadType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/util/uil/CloudImageLoader;->isOrigin(Lcom/miui/gallery/sdk/download/DownloadType;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoDownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageVideoItem;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageVideoItem;->isInActionMode()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoDownloadManager;->isDrawableDisplayInside()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_1
    invoke-super {p0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->needShowDownloadView()Z

    move-result v0

    return v0
.end method
