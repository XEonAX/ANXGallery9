.class public Lcom/miui/gallery/ui/AlbumPageListNormalItem;
.super Lcom/miui/gallery/ui/AlbumPageListItemBase;
.source "AlbumPageListNormalItem.java"


# instance fields
.field private mAlbumCover:Landroid/widget/ImageView;

.field private mAlbumCoverContainer:Landroid/view/View;

.field protected mAlbumIndicatorContainer:Landroid/view/View;

.field protected mAlbumTypeIndicator:Landroid/view/View;

.field private mAutoUploadedInfo:Landroid/view/View;

.field private mHiddenMask:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/ui/AlbumPageListItemBase;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method public adjustAlbumCoverContainerPadding(ZZ)V
    .locals 6

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumPageListNormalItem;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f060272

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/ui/AlbumPageListNormalItem;->mAlbumCoverContainer:Landroid/view/View;

    iget-object v2, p0, Lcom/miui/gallery/ui/AlbumPageListNormalItem;->mAlbumCoverContainer:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getPaddingStart()I

    move-result v2

    const/4 v3, 0x1

    const/4 v4, 0x2

    if-eqz p1, :cond_0

    const/4 p1, 0x2

    goto :goto_0

    :cond_0
    const/4 p1, 0x1

    :goto_0
    mul-int p1, p1, v0

    iget-object v5, p0, Lcom/miui/gallery/ui/AlbumPageListNormalItem;->mAlbumCoverContainer:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getPaddingEnd()I

    move-result v5

    if-eqz p2, :cond_1

    const/4 v3, 0x2

    :cond_1
    mul-int v0, v0, v3

    invoke-virtual {v1, v2, p1, v5, v0}, Landroid/view/View;->setPaddingRelative(IIII)V

    return-void
.end method

.method public bindForceTopIcon(Z)V
    .locals 2

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/AlbumPageListItemBase;->bindForceTopIcon(Z)V

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/AlbumPageListNormalItem;->mAutoUploadedInfo:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/AlbumPageListNormalItem;->mForceTop:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumPageListNormalItem;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0701a0

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1, v1, v1}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    :cond_0
    return-void
.end method

.method public bindHiddenMask(Z)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumPageListNormalItem;->mHiddenMask:Landroid/view/View;

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    const/16 p1, 0x8

    :goto_0
    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public bindImage(Ljava/lang/String;Landroid/net/Uri;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)V
    .locals 6

    sget-object v2, Lcom/miui/gallery/sdk/download/DownloadType;->MICRO:Lcom/miui/gallery/sdk/download/DownloadType;

    iget-object v3, p0, Lcom/miui/gallery/ui/AlbumPageListNormalItem;->mAlbumCover:Landroid/widget/ImageView;

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object v0

    iget-object v5, v0, Lcom/miui/gallery/Config$ThumbConfig;->sMicroTargetSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    move-object v0, p1

    move-object v1, p2

    move-object v4, p3

    invoke-static/range {v0 .. v5}, Lcom/miui/gallery/util/BindImageHelper;->bindImage(Ljava/lang/String;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Landroid/widget/ImageView;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;)V

    return-void
.end method

.method public bindIndicator(ZZZZZ)V
    .locals 4

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumPageListNormalItem;->mAlbumTypeIndicator:Landroid/view/View;

    check-cast v0, Landroid/widget/ImageView;

    const v1, 0x7f0702d6

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0

    :cond_0
    if-eqz p2, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumPageListNormalItem;->mAlbumTypeIndicator:Landroid/view/View;

    check-cast v0, Landroid/widget/ImageView;

    const v1, 0x7f0702d9

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0

    :cond_1
    if-eqz p3, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumPageListNormalItem;->mAlbumTypeIndicator:Landroid/view/View;

    check-cast v0, Landroid/widget/ImageView;

    const v1, 0x7f0702d3

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumPageListNormalItem;->mAlbumTypeIndicator:Landroid/view/View;

    const/16 v1, 0x8

    const/4 v2, 0x0

    if-nez p2, :cond_4

    if-nez p1, :cond_4

    if-eqz p3, :cond_3

    goto :goto_1

    :cond_3
    const/16 v3, 0x8

    goto :goto_2

    :cond_4
    :goto_1
    const/4 v3, 0x0

    :goto_2
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumPageListNormalItem;->mAlbumIndicatorContainer:Landroid/view/View;

    if-nez p2, :cond_6

    if-nez p1, :cond_6

    if-eqz p3, :cond_5

    goto :goto_3

    :cond_5
    const/16 p1, 0x8

    goto :goto_4

    :cond_6
    :goto_3
    const/4 p1, 0x0

    :goto_4
    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    iget-object p1, p0, Lcom/miui/gallery/ui/AlbumPageListNormalItem;->mAutoUploadedInfo:Landroid/view/View;

    if-nez p5, :cond_7

    if-nez p4, :cond_7

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumPageListNormalItem;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Lcom/miui/gallery/util/SyncUtil;->existXiaomiAccount(Landroid/content/Context;)Z

    move-result p2

    if-eqz p2, :cond_7

    const/4 v1, 0x0

    :cond_7
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method protected onFinishInflate()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/ui/AlbumPageListItemBase;->onFinishInflate()V

    const v0, 0x7f09002b

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/AlbumPageListNormalItem;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/miui/gallery/ui/AlbumPageListNormalItem;->mAlbumCover:Landroid/widget/ImageView;

    const v0, 0x7f090037

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/AlbumPageListNormalItem;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/ui/AlbumPageListNormalItem;->mAlbumIndicatorContainer:Landroid/view/View;

    const v0, 0x7f090044

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/AlbumPageListNormalItem;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/ui/AlbumPageListNormalItem;->mAlbumTypeIndicator:Landroid/view/View;

    const v0, 0x7f09015d

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/AlbumPageListNormalItem;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/ui/AlbumPageListNormalItem;->mHiddenMask:Landroid/view/View;

    const v0, 0x7f09002a

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/AlbumPageListNormalItem;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/ui/AlbumPageListNormalItem;->mAutoUploadedInfo:Landroid/view/View;

    const v0, 0x7f09002f

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/AlbumPageListNormalItem;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/ui/AlbumPageListNormalItem;->mAlbumCoverContainer:Landroid/view/View;

    return-void
.end method
