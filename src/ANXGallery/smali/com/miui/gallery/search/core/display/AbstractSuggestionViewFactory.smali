.class public abstract Lcom/miui/gallery/search/core/display/AbstractSuggestionViewFactory;
.super Ljava/lang/Object;
.source "AbstractSuggestionViewFactory.java"

# interfaces
.implements Lcom/miui/gallery/search/core/display/SuggestionViewFactory;


# instance fields
.field private final mContext:Landroid/content/Context;

.field protected mDefaultDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

.field protected mDisplayImageOptionBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

.field private final mLayoutInflater:Landroid/view/LayoutInflater;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/search/core/display/AbstractSuggestionViewFactory;->mContext:Landroid/content/Context;

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/search/core/display/AbstractSuggestionViewFactory;->mLayoutInflater:Landroid/view/LayoutInflater;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/search/core/display/AbstractSuggestionViewFactory;->initDisplayImageOptions(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method protected bindIcon(Landroid/widget/ImageView;Ljava/lang/String;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)V
    .locals 7

    invoke-static {}, Lcom/miui/gallery/search/core/display/icon/IconImageLoader;->getInstance()Lcom/miui/gallery/search/core/display/icon/IconImageLoader;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/search/core/display/AbstractSuggestionViewFactory;->mContext:Landroid/content/Context;

    if-nez p2, :cond_0

    const/4 p2, 0x0

    :goto_0
    move-object v2, p2

    goto :goto_1

    :cond_0
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p2

    goto :goto_0

    :goto_1
    sget-object v3, Lcom/miui/gallery/sdk/download/DownloadType;->MICRO:Lcom/miui/gallery/sdk/download/DownloadType;

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object p2

    iget-object v6, p2, Lcom/miui/gallery/Config$ThumbConfig;->sMicroTargetSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    move-object v4, p1

    move-object v5, p3

    invoke-virtual/range {v0 .. v6}, Lcom/miui/gallery/search/core/display/icon/IconImageLoader;->displayImage(Landroid/content/Context;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Landroid/widget/ImageView;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;)V

    return-void
.end method

.method public bindViewHolder(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/suggestion/Suggestion;ILcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;Lcom/miui/gallery/search/core/display/OnActionClickListener;)V
    .locals 0

    invoke-virtual {p4}, Lcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;->getIconView()Landroid/widget/ImageView;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p4}, Lcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;->getIconView()Landroid/widget/ImageView;

    move-result-object p1

    invoke-interface {p2}, Lcom/miui/gallery/search/core/suggestion/Suggestion;->getSuggestionIcon()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p4}, Lcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;->getViewType()Ljava/lang/String;

    move-result-object p5

    invoke-virtual {p0, p5}, Lcom/miui/gallery/search/core/display/AbstractSuggestionViewFactory;->getDisplayImageOptionsForViewType(Ljava/lang/String;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object p5

    invoke-virtual {p0, p1, p3, p5}, Lcom/miui/gallery/search/core/display/AbstractSuggestionViewFactory;->bindIcon(Landroid/widget/ImageView;Ljava/lang/String;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)V

    :cond_0
    invoke-virtual {p4}, Lcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;->getTitle()Landroid/widget/TextView;

    move-result-object p1

    if-eqz p1, :cond_1

    invoke-virtual {p4}, Lcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;->getTitle()Landroid/widget/TextView;

    move-result-object p1

    invoke-interface {p2}, Lcom/miui/gallery/search/core/suggestion/Suggestion;->getSuggestionTitle()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_1
    invoke-virtual {p4}, Lcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;->getSubTitle()Landroid/widget/TextView;

    move-result-object p1

    if-eqz p1, :cond_2

    invoke-virtual {p4}, Lcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;->getSubTitle()Landroid/widget/TextView;

    move-result-object p1

    invoke-interface {p2}, Lcom/miui/gallery/search/core/suggestion/Suggestion;->getSuggestionSubTitle()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_2
    return-void
.end method

.method protected createViewHolder(Landroid/view/View;)Lcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;
    .locals 1

    new-instance v0, Lcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;

    invoke-direct {v0, p1}, Lcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;-><init>(Landroid/view/View;)V

    return-object v0
.end method

.method public createViewHolder(Landroid/view/ViewGroup;Ljava/lang/String;)Lcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/search/core/display/AbstractSuggestionViewFactory;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    invoke-virtual {p0, p2}, Lcom/miui/gallery/search/core/display/AbstractSuggestionViewFactory;->getLayoutIdForViewType(Ljava/lang/String;)I

    move-result p2

    const/4 v1, 0x0

    invoke-virtual {v0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/search/core/display/AbstractSuggestionViewFactory;->createViewHolder(Landroid/view/View;)Lcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;

    move-result-object p1

    return-object p1
.end method

.method protected getContext()Landroid/content/Context;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/display/AbstractSuggestionViewFactory;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method protected getDisplayImageOptionsForViewType(Ljava/lang/String;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions;
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/search/core/display/AbstractSuggestionViewFactory;->mDefaultDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    return-object p1
.end method

.method protected abstract getLayoutIdForViewType(Ljava/lang/String;)I
.end method

.method protected getLayoutInflater()Landroid/view/LayoutInflater;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/display/AbstractSuggestionViewFactory;->mLayoutInflater:Landroid/view/LayoutInflater;

    return-object v0
.end method

.method protected initDisplayImageOptions(Landroid/content/Context;)V
    .locals 1

    new-instance p1, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-direct {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;-><init>()V

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheThumbnail(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->loadFromMicroCache(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->considerExifParams(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->resetViewBeforeLoading(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p1

    sget-object v0, Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;->EXACTLY:Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;

    invoke-virtual {p1, v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->imageScaleType(Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p1

    sget-object v0, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    invoke-virtual {p1, v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->bitmapConfig(Landroid/graphics/Bitmap$Config;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p1

    const v0, 0x7f07019d

    invoke-virtual {p1, v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->showImageOnLoading(I)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->showImageOnFail(I)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->showImageForEmptyUri(I)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/search/core/display/AbstractSuggestionViewFactory;->mDisplayImageOptionBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    iget-object p1, p0, Lcom/miui/gallery/search/core/display/AbstractSuggestionViewFactory;->mDisplayImageOptionBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-virtual {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/search/core/display/AbstractSuggestionViewFactory;->mDefaultDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    return-void
.end method
