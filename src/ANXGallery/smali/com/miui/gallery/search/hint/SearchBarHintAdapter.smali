.class public Lcom/miui/gallery/search/hint/SearchBarHintAdapter;
.super Lcom/miui/gallery/search/widget/bannerView/BaseBannerAdapter;
.source "SearchBarHintAdapter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/search/widget/bannerView/BaseBannerAdapter<",
        "Lcom/miui/gallery/search/hint/SearchBarHintItem;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>([Lcom/miui/gallery/search/hint/SearchBarHintItem;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/search/widget/bannerView/BaseBannerAdapter;-><init>([Lcom/miui/gallery/search/widget/bannerView/BaseBannerItemData;)V

    return-void
.end method


# virtual methods
.method public bindView(Landroid/view/View;I)V
    .locals 1

    invoke-virtual {p0, p2}, Lcom/miui/gallery/search/hint/SearchBarHintAdapter;->getItem(I)Lcom/miui/gallery/search/widget/bannerView/BaseBannerItemData;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/search/hint/SearchBarHintItem;

    const v0, 0x7f09015f

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    invoke-virtual {p2}, Lcom/miui/gallery/search/hint/SearchBarHintItem;->getHintText()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    invoke-virtual {p0}, Lcom/miui/gallery/search/hint/SearchBarHintAdapter;->getOnUpdateTextListener()Lcom/miui/gallery/search/widget/bannerView/BaseBannerAdapter$OnUpdateTextListener;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/search/hint/SearchBarHintAdapter;->getOnUpdateTextListener()Lcom/miui/gallery/search/widget/bannerView/BaseBannerAdapter$OnUpdateTextListener;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p2}, Lcom/miui/gallery/search/hint/SearchBarHintItem;->getHintText()Ljava/lang/String;

    move-result-object p2

    invoke-interface {p1, v0, p2}, Lcom/miui/gallery/search/widget/bannerView/BaseBannerAdapter$OnUpdateTextListener;->onUpdateText(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public getView(Lcom/miui/gallery/search/widget/bannerView/BannerView;)Landroid/view/View;
    .locals 2

    invoke-virtual {p1}, Lcom/miui/gallery/search/widget/bannerView/BannerView;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const v0, 0x7f0b0138

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method
