.class public abstract Lcom/miui/gallery/share/ShareUserAdapterBase;
.super Landroid/widget/BaseAdapter;
.source "ShareUserAdapterBase.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/share/ShareUserAdapterBase$ViewHolder;
    }
.end annotation


# static fields
.field private static sIconEffectHeight:I

.field private static sIconEffectWidth:I

.field private static sIconHeight:I

.field private static sIconWidth:I


# instance fields
.field protected final mCreatorId:Ljava/lang/String;

.field protected mDefaultDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

.field protected final mInflater:Landroid/view/LayoutInflater;

.field private final mItemLayoutId:I

.field protected final mShareUsers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/share/CloudUserCacheEntry;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;I)V
    .locals 1

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    invoke-static {}, Lcom/google/common/collect/Lists;->newArrayList()Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/share/ShareUserAdapterBase;->mShareUsers:Ljava/util/List;

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/share/ShareUserAdapterBase;->mInflater:Landroid/view/LayoutInflater;

    iput-object p2, p0, Lcom/miui/gallery/share/ShareUserAdapterBase;->mCreatorId:Ljava/lang/String;

    iput p3, p0, Lcom/miui/gallery/share/ShareUserAdapterBase;->mItemLayoutId:I

    sget p2, Lcom/miui/gallery/share/ShareUserAdapterBase;->sIconWidth:I

    if-nez p2, :cond_0

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f070172

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    invoke-virtual {p2}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result p3

    sput p3, Lcom/miui/gallery/share/ShareUserAdapterBase;->sIconWidth:I

    invoke-virtual {p2}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result p2

    sput p2, Lcom/miui/gallery/share/ShareUserAdapterBase;->sIconHeight:I

    const p2, 0x7f07016f

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result p2

    sput p2, Lcom/miui/gallery/share/ShareUserAdapterBase;->sIconEffectWidth:I

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result p1

    sput p1, Lcom/miui/gallery/share/ShareUserAdapterBase;->sIconEffectHeight:I

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/share/ShareUserAdapterBase;->intialDisplayOptions()V

    return-void
.end method


# virtual methods
.method protected abstract getAbsentSharerIcon(Lcom/miui/gallery/share/CloudUserCacheEntry;)I
.end method

.method protected abstract getDefaultIcon(Lcom/miui/gallery/share/CloudUserCacheEntry;)I
.end method

.method protected getDisplayName(Landroid/content/res/Resources;Lcom/miui/gallery/share/UserInfo;Lcom/miui/gallery/share/CloudUserCacheEntry;)Ljava/lang/String;
    .locals 1

    if-eqz p2, :cond_1

    invoke-virtual {p2}, Lcom/miui/gallery/share/UserInfo;->getUserId()Ljava/lang/String;

    move-result-object p3

    invoke-static {}, Lcom/miui/gallery/cloud/GalleryCloudUtils;->getAccountName()Ljava/lang/String;

    move-result-object v0

    invoke-static {p3, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p3

    if-eqz p3, :cond_0

    const p2, 0x7f100707

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_0
    invoke-virtual {p2}, Lcom/miui/gallery/share/UserInfo;->getDisplayName()Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_1
    if-nez p3, :cond_2

    const/4 p1, 0x0

    goto :goto_0

    :cond_2
    iget-object p1, p3, Lcom/miui/gallery/share/CloudUserCacheEntry;->mUserId:Ljava/lang/String;

    :goto_0
    return-object p1
.end method

.method protected abstract getIconEffect()I
.end method

.method public getItem(I)Lcom/miui/gallery/share/CloudUserCacheEntry;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/share/ShareUserAdapterBase;->mShareUsers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge p1, v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/share/ShareUserAdapterBase;->mShareUsers:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/share/CloudUserCacheEntry;

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/share/ShareUserAdapterBase;->getItem(I)Lcom/miui/gallery/share/CloudUserCacheEntry;

    move-result-object p1

    return-object p1
.end method

.method public getItemId(I)J
    .locals 2

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 5

    invoke-virtual {p0, p1}, Lcom/miui/gallery/share/ShareUserAdapterBase;->getItem(I)Lcom/miui/gallery/share/CloudUserCacheEntry;

    move-result-object v0

    if-eqz p2, :cond_0

    goto :goto_0

    :cond_0
    iget-object p2, p0, Lcom/miui/gallery/share/ShareUserAdapterBase;->mInflater:Landroid/view/LayoutInflater;

    iget v1, p0, Lcom/miui/gallery/share/ShareUserAdapterBase;->mItemLayoutId:I

    const/4 v2, 0x0

    invoke-virtual {p2, v1, p3, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    new-instance p3, Lcom/miui/gallery/share/ShareUserAdapterBase$ViewHolder;

    invoke-direct {p3, p0, v0, p2}, Lcom/miui/gallery/share/ShareUserAdapterBase$ViewHolder;-><init>(Lcom/miui/gallery/share/ShareUserAdapterBase;Lcom/miui/gallery/share/CloudUserCacheEntry;Landroid/view/View;)V

    invoke-virtual {p2, p3}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    :goto_0
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/miui/gallery/share/ShareUserAdapterBase$ViewHolder;

    const/4 v1, 0x0

    if-eqz v0, :cond_3

    iget-object v2, v0, Lcom/miui/gallery/share/CloudUserCacheEntry;->mUserId:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_3

    invoke-static {}, Lcom/miui/gallery/share/UserInfoCache;->getInstance()Lcom/miui/gallery/share/UserInfoCache;

    move-result-object p1

    iget-object v2, v0, Lcom/miui/gallery/share/CloudUserCacheEntry;->mUserId:Ljava/lang/String;

    invoke-virtual {p1, v2}, Lcom/miui/gallery/share/UserInfoCache;->getValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/share/UserInfo;

    iget-object v2, p3, Lcom/miui/gallery/share/ShareUserAdapterBase$ViewHolder;->mText:Landroid/widget/TextView;

    invoke-virtual {p2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {p0, v3, p1, v0}, Lcom/miui/gallery/share/ShareUserAdapterBase;->getDisplayName(Landroid/content/res/Resources;Lcom/miui/gallery/share/UserInfo;Lcom/miui/gallery/share/CloudUserCacheEntry;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    if-eqz p1, :cond_2

    invoke-virtual {p1}, Lcom/miui/gallery/share/UserInfo;->getMiliaoIconUrl150()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object p1, p3, Lcom/miui/gallery/share/ShareUserAdapterBase$ViewHolder;->mIcon:Landroid/widget/ImageView;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/share/ShareUserAdapterBase;->getDefaultIcon(Lcom/miui/gallery/share/CloudUserCacheEntry;)I

    move-result v1

    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_1

    :cond_1
    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v2

    iget-object v3, p3, Lcom/miui/gallery/share/ShareUserAdapterBase$ViewHolder;->mIcon:Landroid/widget/ImageView;

    iget-object v4, p0, Lcom/miui/gallery/share/ShareUserAdapterBase;->mDefaultDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    invoke-virtual {v2, p1, v3, v4, v1}, Lcom/nostra13/universalimageloader/core/ImageLoader;->displayImage(Ljava/lang/String;Landroid/widget/ImageView;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;)V

    goto :goto_1

    :cond_2
    iget-object p1, p3, Lcom/miui/gallery/share/ShareUserAdapterBase$ViewHolder;->mIcon:Landroid/widget/ImageView;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/share/ShareUserAdapterBase;->getDefaultIcon(Lcom/miui/gallery/share/CloudUserCacheEntry;)I

    move-result v1

    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    :goto_1
    iget-object p1, v0, Lcom/miui/gallery/share/CloudUserCacheEntry;->mUserId:Ljava/lang/String;

    iget-object v0, p0, Lcom/miui/gallery/share/ShareUserAdapterBase;->mCreatorId:Ljava/lang/String;

    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_5

    iget-object p1, p3, Lcom/miui/gallery/share/ShareUserAdapterBase$ViewHolder;->mMark:Landroid/widget/ImageView;

    const v0, 0x7f070087

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_3

    :cond_3
    iget-object v2, p3, Lcom/miui/gallery/share/ShareUserAdapterBase$ViewHolder;->mText:Landroid/widget/TextView;

    invoke-virtual {p2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {p0, v3, v1, v0}, Lcom/miui/gallery/share/ShareUserAdapterBase;->getDisplayName(Landroid/content/res/Resources;Lcom/miui/gallery/share/UserInfo;Lcom/miui/gallery/share/CloudUserCacheEntry;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p3, Lcom/miui/gallery/share/ShareUserAdapterBase$ViewHolder;->mIcon:Landroid/widget/ImageView;

    if-nez p1, :cond_4

    invoke-virtual {p0, v0}, Lcom/miui/gallery/share/ShareUserAdapterBase;->getDefaultIcon(Lcom/miui/gallery/share/CloudUserCacheEntry;)I

    move-result p1

    goto :goto_2

    :cond_4
    invoke-virtual {p0, v0}, Lcom/miui/gallery/share/ShareUserAdapterBase;->getAbsentSharerIcon(Lcom/miui/gallery/share/CloudUserCacheEntry;)I

    move-result p1

    :goto_2
    invoke-virtual {v1, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    :cond_5
    :goto_3
    iget-object p1, p3, Lcom/miui/gallery/share/ShareUserAdapterBase$ViewHolder;->mIconEffect:Landroid/widget/ImageView;

    invoke-virtual {p0}, Lcom/miui/gallery/share/ShareUserAdapterBase;->getIconEffect()I

    move-result p3

    invoke-virtual {p1, p3}, Landroid/widget/ImageView;->setImageResource(I)V

    return-object p2
.end method

.method protected abstract intialDisplayOptions()V
.end method

.method protected setIconSize(Lcom/miui/gallery/share/CloudUserCacheEntry;Landroid/view/ViewGroup$LayoutParams;)V
    .locals 0

    sget p1, Lcom/miui/gallery/share/ShareUserAdapterBase;->sIconEffectWidth:I

    iput p1, p2, Landroid/view/ViewGroup$LayoutParams;->width:I

    sget p1, Lcom/miui/gallery/share/ShareUserAdapterBase;->sIconEffectHeight:I

    iput p1, p2, Landroid/view/ViewGroup$LayoutParams;->height:I

    return-void
.end method

.method public setShareUsers(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/share/CloudUserCacheEntry;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/share/ShareUserAdapterBase;->mShareUsers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    iget-object v0, p0, Lcom/miui/gallery/share/ShareUserAdapterBase;->mShareUsers:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    invoke-virtual {p0}, Lcom/miui/gallery/share/ShareUserAdapterBase;->notifyDataSetChanged()V

    return-void
.end method
