.class public abstract Lcom/miui/gallery/ui/AlbumPageListItemBase;
.super Landroid/widget/RelativeLayout;
.source "AlbumPageListItemBase.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/AlbumPageListItemBase$AlbumType;
    }
.end annotation


# instance fields
.field protected mAlbumName:Landroid/widget/TextView;

.field protected mAlbumPhotoCount:Landroid/widget/TextView;

.field protected mForceTop:Landroid/widget/TextView;

.field protected mShareInfo:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method public bindCommonInfo(Ljava/lang/String;IZ)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumPageListItemBase;->mAlbumName:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/AlbumPageListItemBase;->mAlbumPhotoCount:Landroid/widget/TextView;

    if-eqz p3, :cond_0

    const-string p2, ""

    goto :goto_0

    :cond_0
    const-string p3, "%d"

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    aput-object p2, v0, v1

    invoke-static {p3, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    :goto_0
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public bindForceTopIcon(Z)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumPageListItemBase;->mForceTop:Landroid/widget/TextView;

    if-eqz p1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    const/16 v1, 0x8

    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/ui/AlbumPageListItemBase;->mShareInfo:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->getVisibility()I

    move-result p1

    const/4 v0, 0x0

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/AlbumPageListItemBase;->mForceTop:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumPageListItemBase;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0701a0

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {p1, v1, v0, v0, v0}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto :goto_1

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/AlbumPageListItemBase;->mForceTop:Landroid/widget/TextView;

    invoke-virtual {p1, v0, v0, v0, v0}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    :cond_2
    :goto_1
    return-void
.end method

.method public bindType(Lcom/miui/gallery/ui/AlbumPageListItemBase$AlbumType;Ljava/lang/String;)V
    .locals 1

    sget-object v0, Lcom/miui/gallery/ui/AlbumPageListItemBase$AlbumType;->NORMAL:Lcom/miui/gallery/ui/AlbumPageListItemBase$AlbumType;

    if-eq p1, v0, :cond_1

    sget-object v0, Lcom/miui/gallery/ui/AlbumPageListItemBase$AlbumType;->SYSTEM:Lcom/miui/gallery/ui/AlbumPageListItemBase$AlbumType;

    if-eq p1, v0, :cond_1

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/AlbumPageListItemBase;->mShareInfo:Landroid/widget/TextView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object p1, p0, Lcom/miui/gallery/ui/AlbumPageListItemBase;->mShareInfo:Landroid/widget/TextView;

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1

    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/ui/AlbumPageListItemBase;->mShareInfo:Landroid/widget/TextView;

    const/16 p2, 0x8

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setVisibility(I)V

    :goto_1
    return-void
.end method

.method protected onFinishInflate()V
    .locals 1

    invoke-super {p0}, Landroid/widget/RelativeLayout;->onFinishInflate()V

    const v0, 0x7f09003a

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/AlbumPageListItemBase;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/miui/gallery/ui/AlbumPageListItemBase;->mAlbumName:Landroid/widget/TextView;

    const v0, 0x7f090043

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/AlbumPageListItemBase;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/miui/gallery/ui/AlbumPageListItemBase;->mShareInfo:Landroid/widget/TextView;

    const v0, 0x7f090040

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/AlbumPageListItemBase;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/miui/gallery/ui/AlbumPageListItemBase;->mAlbumPhotoCount:Landroid/widget/TextView;

    const v0, 0x7f090035

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/AlbumPageListItemBase;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/miui/gallery/ui/AlbumPageListItemBase;->mForceTop:Landroid/widget/TextView;

    return-void
.end method
