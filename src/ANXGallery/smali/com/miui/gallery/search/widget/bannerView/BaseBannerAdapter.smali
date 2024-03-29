.class public abstract Lcom/miui/gallery/search/widget/bannerView/BaseBannerAdapter;
.super Ljava/lang/Object;
.source "BaseBannerAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/search/widget/bannerView/BaseBannerAdapter$OnUpdateTextListener;,
        Lcom/miui/gallery/search/widget/bannerView/BaseBannerAdapter$OnDataChangedListener;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/miui/gallery/search/widget/bannerView/BaseBannerItemData;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private mData:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation
.end field

.field private mOnDataChangedListener:Lcom/miui/gallery/search/widget/bannerView/BaseBannerAdapter$OnDataChangedListener;

.field private mOnUpdateTextListener:Lcom/miui/gallery/search/widget/bannerView/BaseBannerAdapter$OnUpdateTextListener;


# direct methods
.method public constructor <init>([Lcom/miui/gallery/search/widget/bannerView/BaseBannerItemData;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TT;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcom/miui/gallery/search/widget/bannerView/BaseBannerAdapter;->mData:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public abstract bindView(Landroid/view/View;I)V
.end method

.method public getCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/widget/bannerView/BaseBannerAdapter;->mData:Ljava/util/List;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/search/widget/bannerView/BaseBannerAdapter;->mData:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    :goto_0
    return v0
.end method

.method public getItem(I)Lcom/miui/gallery/search/widget/bannerView/BaseBannerItemData;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/search/widget/bannerView/BaseBannerAdapter;->mData:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/search/widget/bannerView/BaseBannerItemData;

    return-object p1
.end method

.method public getOnUpdateTextListener()Lcom/miui/gallery/search/widget/bannerView/BaseBannerAdapter$OnUpdateTextListener;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/widget/bannerView/BaseBannerAdapter;->mOnUpdateTextListener:Lcom/miui/gallery/search/widget/bannerView/BaseBannerAdapter$OnUpdateTextListener;

    return-object v0
.end method

.method public abstract getView(Lcom/miui/gallery/search/widget/bannerView/BannerView;)Landroid/view/View;
.end method

.method notifyDataChanged()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/widget/bannerView/BaseBannerAdapter;->mOnDataChangedListener:Lcom/miui/gallery/search/widget/bannerView/BaseBannerAdapter$OnDataChangedListener;

    invoke-interface {v0}, Lcom/miui/gallery/search/widget/bannerView/BaseBannerAdapter$OnDataChangedListener;->onChanged()V

    return-void
.end method

.method public setData(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "TT;>;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/miui/gallery/search/widget/bannerView/BaseBannerAdapter;->mData:Ljava/util/List;

    invoke-virtual {p0}, Lcom/miui/gallery/search/widget/bannerView/BaseBannerAdapter;->notifyDataChanged()V

    return-void
.end method

.method public setData([Lcom/miui/gallery/search/widget/bannerView/BaseBannerItemData;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TT;)V"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {p0, v0}, Lcom/miui/gallery/search/widget/bannerView/BaseBannerAdapter;->setData(Ljava/util/List;)V

    return-void
.end method

.method setOnDataChangedListener(Lcom/miui/gallery/search/widget/bannerView/BaseBannerAdapter$OnDataChangedListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/search/widget/bannerView/BaseBannerAdapter;->mOnDataChangedListener:Lcom/miui/gallery/search/widget/bannerView/BaseBannerAdapter$OnDataChangedListener;

    return-void
.end method

.method public setOnUpdateTextListener(Lcom/miui/gallery/search/widget/bannerView/BaseBannerAdapter$OnUpdateTextListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/search/widget/bannerView/BaseBannerAdapter;->mOnUpdateTextListener:Lcom/miui/gallery/search/widget/bannerView/BaseBannerAdapter$OnUpdateTextListener;

    return-void
.end method
