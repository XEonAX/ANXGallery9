.class public Lcom/miui/gallery/video/editor/adapter/SmartEffectViewHolder;
.super Lcom/miui/gallery/video/editor/widget/SingleChoiceRecyclerView$SingleChoiceRecyclerViewAdapter$SingleChoiceViewHolder;
.source "SmartEffectViewHolder.java"


# static fields
.field private static mDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;


# instance fields
.field private mContext:Landroid/content/Context;

.field private mDownloadView:Lcom/miui/gallery/video/editor/widget/DownloadView;

.field private mIcon:Landroid/widget/ImageView;

.field private mNameTextView:Landroid/widget/TextView;

.field private mSelected:Landroid/view/View;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    sget-object v0, Lcom/miui/gallery/video/editor/util/ImageLoaderUtils;->mVideoEditorDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    sput-object v0, Lcom/miui/gallery/video/editor/adapter/SmartEffectViewHolder;->mDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    return-void
.end method

.method public constructor <init>(Landroid/view/View;)V
    .locals 1

    invoke-direct {p0, p1}, Lcom/miui/gallery/video/editor/widget/SingleChoiceRecyclerView$SingleChoiceRecyclerViewAdapter$SingleChoiceViewHolder;-><init>(Landroid/view/View;)V

    const v0, 0x7f09018c

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/miui/gallery/video/editor/adapter/SmartEffectViewHolder;->mNameTextView:Landroid/widget/TextView;

    const v0, 0x7f090188

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/miui/gallery/video/editor/adapter/SmartEffectViewHolder;->mIcon:Landroid/widget/ImageView;

    const v0, 0x7f090186

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/video/editor/widget/DownloadView;

    iput-object v0, p0, Lcom/miui/gallery/video/editor/adapter/SmartEffectViewHolder;->mDownloadView:Lcom/miui/gallery/video/editor/widget/DownloadView;

    const v0, 0x7f090193

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/video/editor/adapter/SmartEffectViewHolder;->mSelected:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/video/editor/adapter/SmartEffectViewHolder;->mContext:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public setIcon(I)V
    .locals 1

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/adapter/SmartEffectViewHolder;->mIcon:Landroid/widget/ImageView;

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

    iget-object v2, p0, Lcom/miui/gallery/video/editor/adapter/SmartEffectViewHolder;->mIcon:Landroid/widget/ImageView;

    invoke-direct {v1, v2}, Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;-><init>(Landroid/widget/ImageView;)V

    sget-object v2, Lcom/miui/gallery/video/editor/adapter/SmartEffectViewHolder;->mDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    invoke-virtual {v0, p1, v1, v2}, Lcom/nostra13/universalimageloader/core/ImageLoader;->displayImage(Ljava/lang/String;Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)V

    :cond_0
    return-void
.end method

.method public setName(I)V
    .locals 1

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/adapter/SmartEffectViewHolder;->mNameTextView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    :cond_0
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/adapter/SmartEffectViewHolder;->mNameTextView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public setSelect(Z)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/adapter/SmartEffectViewHolder;->mSelected:Landroid/view/View;

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    const/4 p1, 0x4

    :goto_0
    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public setStateImage(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/adapter/SmartEffectViewHolder;->mDownloadView:Lcom/miui/gallery/video/editor/widget/DownloadView;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/video/editor/widget/DownloadView;->setStateImage(I)V

    return-void
.end method

.method public updateSelected(ZZ)V
    .locals 2

    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    iget-object p2, p0, Lcom/miui/gallery/video/editor/adapter/SmartEffectViewHolder;->mSelected:Landroid/view/View;

    invoke-static {p2}, Lcom/miui/gallery/video/editor/util/ToolsUtil;->showView(Landroid/view/View;)V

    iget-object p2, p0, Lcom/miui/gallery/video/editor/adapter/SmartEffectViewHolder;->mNameTextView:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/miui/gallery/video/editor/adapter/SmartEffectViewHolder;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f050187

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_0

    :cond_0
    iget-object p2, p0, Lcom/miui/gallery/video/editor/adapter/SmartEffectViewHolder;->mSelected:Landroid/view/View;

    invoke-static {p2}, Lcom/miui/gallery/video/editor/util/ToolsUtil;->hideView(Landroid/view/View;)V

    iget-object p2, p0, Lcom/miui/gallery/video/editor/adapter/SmartEffectViewHolder;->mNameTextView:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/miui/gallery/video/editor/adapter/SmartEffectViewHolder;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f050180

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    :goto_0
    iget-object p2, p0, Lcom/miui/gallery/video/editor/adapter/SmartEffectViewHolder;->mNameTextView:Landroid/widget/TextView;

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setSelected(Z)V

    return-void
.end method
