.class public abstract Lcom/miui/gallery/adapter/BaseMediaAdapterDeprecated;
.super Lcom/miui/gallery/adapter/BaseAdapter;
.source "BaseMediaAdapterDeprecated.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/adapter/BaseMediaAdapterDeprecated$OnScrollListenerWrapper;
    }
.end annotation


# instance fields
.field protected mViewScrollState:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/adapter/BaseAdapter;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x0

    iput p1, p0, Lcom/miui/gallery/adapter/BaseMediaAdapterDeprecated;->mViewScrollState:I

    return-void
.end method


# virtual methods
.method public final bindView(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;)V
    .locals 2

    invoke-interface {p3}, Landroid/database/Cursor;->getPosition()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const v1, 0x7f0902cd

    invoke-virtual {p1, v1, v0}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    invoke-virtual {p0, p1, p2, p3}, Lcom/miui/gallery/adapter/BaseMediaAdapterDeprecated;->doBindView(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;)V

    return-void
.end method

.method protected abstract doBindView(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;)V
.end method

.method public generateWrapScrollListener(Landroid/widget/AbsListView$OnScrollListener;)Landroid/widget/AbsListView$OnScrollListener;
    .locals 1

    new-instance v0, Lcom/miui/gallery/adapter/BaseMediaAdapterDeprecated$1;

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/adapter/BaseMediaAdapterDeprecated$1;-><init>(Lcom/miui/gallery/adapter/BaseMediaAdapterDeprecated;Landroid/widget/AbsListView$OnScrollListener;)V

    return-object v0
.end method

.method public getCheckedItem(I)Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem;
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/adapter/BaseMediaAdapterDeprecated;->getCount()I

    move-result v0

    if-ge p1, v0, :cond_1

    if-gez p1, :cond_0

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem$Builder;

    invoke-direct {v0}, Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem$Builder;-><init>()V

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/BaseMediaAdapterDeprecated;->getItemKey(I)J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem$Builder;->setId(J)Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem$Builder;

    move-result-object v0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/BaseMediaAdapterDeprecated;->getSha1(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem$Builder;->setSha1(Ljava/lang/String;)Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem$Builder;

    move-result-object v0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/BaseMediaAdapterDeprecated;->getMicroThumbFilePath(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem$Builder;->setMicroThumbnailFile(Ljava/lang/String;)Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem$Builder;

    move-result-object v0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/BaseMediaAdapterDeprecated;->getThumbFilePath(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem$Builder;->setThumbnailFile(Ljava/lang/String;)Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem$Builder;

    move-result-object v0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/BaseMediaAdapterDeprecated;->getOriginFilePath(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem$Builder;->setOriginFile(Ljava/lang/String;)Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem$Builder;

    move-result-object v0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/BaseMediaAdapterDeprecated;->getMimeType(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem$Builder;->setMimeType(Ljava/lang/String;)Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem$Builder;->build()Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem;

    move-result-object p1

    return-object p1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public getItemDecodeRectF(I)Landroid/graphics/RectF;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method public abstract getItemKey(I)J
.end method

.method public getItemSecretKey(I)[B
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method public abstract getMimeType(I)Ljava/lang/String;
.end method

.method public abstract getSha1(I)Ljava/lang/String;
.end method

.method protected onViewScrollStateChanged(Landroid/widget/AbsListView;I)V
    .locals 0

    iput p2, p0, Lcom/miui/gallery/adapter/BaseMediaAdapterDeprecated;->mViewScrollState:I

    return-void
.end method

.method protected onViewScrolled(Landroid/widget/AbsListView;III)V
    .locals 0

    return-void
.end method
