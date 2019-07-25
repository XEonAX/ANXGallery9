.class public Lcom/miui/gallery/video/editor/adapter/WaterMarkHolder;
.super Lcom/miui/gallery/video/editor/widget/SingleChoiceRecyclerView$SingleChoiceRecyclerViewAdapter$SingleChoiceViewHolder;
.source "WaterMarkHolder.java"


# static fields
.field private static mDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;


# instance fields
.field private mDownloadView:Lcom/miui/gallery/video/editor/widget/DownloadView;

.field private mIcon:Landroid/widget/ImageView;

.field private mSelectBackground:Landroid/view/View;

.field private mSelected:Landroid/view/View;

.field private mTextEditable:Landroid/widget/ImageView;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    sget-object v0, Lcom/miui/gallery/video/editor/util/ImageLoaderUtils;->mVideoEditorDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    sput-object v0, Lcom/miui/gallery/video/editor/adapter/WaterMarkHolder;->mDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    return-void
.end method

.method public constructor <init>(Landroid/view/View;)V
    .locals 2

    invoke-direct {p0, p1}, Lcom/miui/gallery/video/editor/widget/SingleChoiceRecyclerView$SingleChoiceRecyclerViewAdapter$SingleChoiceViewHolder;-><init>(Landroid/view/View;)V

    const v0, 0x7f09033b

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/miui/gallery/video/editor/adapter/WaterMarkHolder;->mIcon:Landroid/widget/ImageView;

    const v0, 0x7f090186

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/video/editor/widget/DownloadView;

    iput-object v0, p0, Lcom/miui/gallery/video/editor/adapter/WaterMarkHolder;->mDownloadView:Lcom/miui/gallery/video/editor/widget/DownloadView;

    const v0, 0x7f09029e

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/video/editor/adapter/WaterMarkHolder;->mSelected:Landroid/view/View;

    const v0, 0x7f090330

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/miui/gallery/video/editor/adapter/WaterMarkHolder;->mTextEditable:Landroid/widget/ImageView;

    const v0, 0x7f090295

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/video/editor/adapter/WaterMarkHolder;->mSelectBackground:Landroid/view/View;

    iget-object v0, p0, Lcom/miui/gallery/video/editor/adapter/WaterMarkHolder;->mDownloadView:Lcom/miui/gallery/video/editor/widget/DownloadView;

    invoke-static {}, Lcom/miui/gallery/video/editor/util/ToolsUtil;->isRTLDirection()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v1, 0x7f070323

    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v1, 0x7f070322

    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    :goto_0
    invoke-virtual {v0, p1}, Lcom/miui/gallery/video/editor/widget/DownloadView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method


# virtual methods
.method public setIcon(I)V
    .locals 1

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/adapter/WaterMarkHolder;->mIcon:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    :cond_0
    return-void
.end method

.method public setIcon(Ljava/lang/String;)V
    .locals 3

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v0

    new-instance v1, Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;

    iget-object v2, p0, Lcom/miui/gallery/video/editor/adapter/WaterMarkHolder;->mIcon:Landroid/widget/ImageView;

    invoke-direct {v1, v2}, Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;-><init>(Landroid/widget/ImageView;)V

    sget-object v2, Lcom/miui/gallery/video/editor/adapter/WaterMarkHolder;->mDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    invoke-virtual {v0, p1, v1, v2}, Lcom/nostra13/universalimageloader/core/ImageLoader;->displayImage(Ljava/lang/String;Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)V

    :cond_0
    return-void
.end method

.method public setSelect(Z)V
    .locals 0

    return-void
.end method

.method public setStateImage(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/adapter/WaterMarkHolder;->mDownloadView:Lcom/miui/gallery/video/editor/widget/DownloadView;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/video/editor/widget/DownloadView;->setStateImage(I)V

    return-void
.end method

.method public updateSelected(ZZ)V
    .locals 0

    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/video/editor/adapter/WaterMarkHolder;->mSelected:Landroid/view/View;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/util/ToolsUtil;->showView(Landroid/view/View;)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/video/editor/adapter/WaterMarkHolder;->mSelected:Landroid/view/View;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/util/ToolsUtil;->hideView(Landroid/view/View;)V

    :goto_0
    return-void
.end method

.method public updateTextEditable(Z)V
    .locals 0

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/video/editor/adapter/WaterMarkHolder;->mTextEditable:Landroid/widget/ImageView;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/util/ToolsUtil;->showView(Landroid/view/View;)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/adapter/WaterMarkHolder;->mSelectBackground:Landroid/view/View;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/util/ToolsUtil;->showView(Landroid/view/View;)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/video/editor/adapter/WaterMarkHolder;->mTextEditable:Landroid/widget/ImageView;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/util/ToolsUtil;->hideView(Landroid/view/View;)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/adapter/WaterMarkHolder;->mSelectBackground:Landroid/view/View;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/util/ToolsUtil;->hideView(Landroid/view/View;)V

    :goto_0
    return-void
.end method
