.class Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPageAdapterWrapper;
.super Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;
.source "AlbumPageFragment.java"

# interfaces
.implements Lcom/miui/gallery/widget/DividerTypeProvider;
.implements Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/AlbumPageFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "AlbumPageAdapterWrapper"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper<",
        "Lcom/miui/gallery/adapter/AlbumPageAdapter;",
        "Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;",
        ">;",
        "Lcom/miui/gallery/widget/DividerTypeProvider;",
        "Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemClickListener;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/miui/gallery/adapter/AlbumPageAdapter;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;-><init>(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    return-void
.end method

.method private recordViewAlbum(I)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPageAdapterWrapper;->mWrapped:Landroid/support/v7/widget/RecyclerView$Adapter;

    check-cast v0, Lcom/miui/gallery/adapter/AlbumPageAdapter;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->getAlbumLocalPath(I)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPageAdapterWrapper;->mWrapped:Landroid/support/v7/widget/RecyclerView$Adapter;

    check-cast v1, Lcom/miui/gallery/adapter/AlbumPageAdapter;

    invoke-virtual {v1, p1}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->isSystemAlbum(I)Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "album_name"

    iget-object v2, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPageAdapterWrapper;->mWrapped:Landroid/support/v7/widget/RecyclerView$Adapter;

    check-cast v2, Lcom/miui/gallery/adapter/AlbumPageAdapter;

    invoke-virtual {v2, p1}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->getAlbumName(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "album_server_id"

    iget-object v2, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPageAdapterWrapper;->mWrapped:Landroid/support/v7/widget/RecyclerView$Adapter;

    check-cast v2, Lcom/miui/gallery/adapter/AlbumPageAdapter;

    invoke-virtual {v2, p1}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->getServerId(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "album_image_count"

    iget-object v2, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPageAdapterWrapper;->mWrapped:Landroid/support/v7/widget/RecyclerView$Adapter;

    check-cast v2, Lcom/miui/gallery/adapter/AlbumPageAdapter;

    invoke-virtual {v2, p1}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->getAlbumCount(I)I

    move-result p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "album"

    const-string v1, "view_system_album"

    invoke-static {p1, v1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    goto/16 :goto_0

    :cond_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    const-string v2, "album_path"

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "album_attribute"

    iget-object v2, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPageAdapterWrapper;->mWrapped:Landroid/support/v7/widget/RecyclerView$Adapter;

    check-cast v2, Lcom/miui/gallery/adapter/AlbumPageAdapter;

    invoke-virtual {v2, p1}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->getAttributes(I)Ljava/lang/Long;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "album_image_count"

    iget-object v2, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPageAdapterWrapper;->mWrapped:Landroid/support/v7/widget/RecyclerView$Adapter;

    check-cast v2, Lcom/miui/gallery/adapter/AlbumPageAdapter;

    invoke-virtual {v2, p1}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->getAlbumCount(I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "baby_album"

    iget-object v2, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPageAdapterWrapper;->mWrapped:Landroid/support/v7/widget/RecyclerView$Adapter;

    check-cast v2, Lcom/miui/gallery/adapter/AlbumPageAdapter;

    invoke-virtual {v2, p1}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->isBabyAlbum(I)Z

    move-result p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, v0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "album"

    const-string v0, "view_album"

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPageAdapterWrapper;->mWrapped:Landroid/support/v7/widget/RecyclerView$Adapter;

    check-cast v0, Lcom/miui/gallery/adapter/AlbumPageAdapter;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->isOtherShareAlbum(I)Z

    move-result v0

    if-eqz v0, :cond_2

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "album_image_count"

    iget-object v2, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPageAdapterWrapper;->mWrapped:Landroid/support/v7/widget/RecyclerView$Adapter;

    check-cast v2, Lcom/miui/gallery/adapter/AlbumPageAdapter;

    invoke-virtual {v2, p1}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->getAlbumCount(I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "baby_album"

    iget-object v2, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPageAdapterWrapper;->mWrapped:Landroid/support/v7/widget/RecyclerView$Adapter;

    check-cast v2, Lcom/miui/gallery/adapter/AlbumPageAdapter;

    invoke-virtual {v2, p1}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->isBabyAlbum(I)Z

    move-result p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "album"

    const-string v1, "view_share_album"

    invoke-static {p1, v1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    :cond_2
    :goto_0
    return-void
.end method


# virtual methods
.method public getBottomDividerType(I)I
    .locals 2

    const/4 v0, 0x0

    const/4 v1, -0x1

    if-ne p1, v1, :cond_0

    return v0

    :cond_0
    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPageAdapterWrapper;->isHeaderPosition(I)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 p1, 0x3

    return p1

    :cond_1
    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPageAdapterWrapper;->isFooterPosition(I)Z

    move-result v1

    if-eqz v1, :cond_2

    return v0

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPageAdapterWrapper;->mWrapped:Landroid/support/v7/widget/RecyclerView$Adapter;

    check-cast v0, Lcom/miui/gallery/adapter/AlbumPageAdapter;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPageAdapterWrapper;->getHeadersCount()I

    move-result v1

    sub-int/2addr p1, v1

    invoke-virtual {v0, p1}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->getBottomDividerType(I)I

    move-result p1

    return p1
.end method

.method public getTopDividerType(I)I
    .locals 2

    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPageAdapterWrapper;->getHeadersCount()I

    move-result v0

    if-gtz v0, :cond_1

    if-nez p1, :cond_1

    const/4 p1, 0x3

    return p1

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPageAdapterWrapper;->mWrapped:Landroid/support/v7/widget/RecyclerView$Adapter;

    check-cast v0, Lcom/miui/gallery/adapter/AlbumPageAdapter;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPageAdapterWrapper;->getHeadersCount()I

    move-result v1

    sub-int/2addr p1, v1

    invoke-virtual {v0, p1}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->getTopDividerType(I)I

    move-result p1

    return p1
.end method

.method protected bridge synthetic onCreateHeaderFooterViewHolder(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPageAdapterWrapper;->onCreateHeaderFooterViewHolder(Landroid/view/View;)Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;

    move-result-object p1

    return-object p1
.end method

.method protected onCreateHeaderFooterViewHolder(Landroid/view/View;)Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;
    .locals 1

    new-instance v0, Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;

    invoke-direct {v0, p1}, Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;-><init>(Landroid/view/View;)V

    const/4 p1, 0x0

    invoke-virtual {v0, p1}, Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;->setIsRecyclable(Z)V

    return-object v0
.end method

.method public onItemClick(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;IJFF)Z
    .locals 11

    move-object v0, p0

    move v1, p3

    invoke-virtual {p0, p3}, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPageAdapterWrapper;->isHeaderPosition(I)Z

    move-result v2

    if-nez v2, :cond_1

    invoke-virtual {p0, p3}, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPageAdapterWrapper;->isFooterPosition(I)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0, p3}, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPageAdapterWrapper;->getWrappedAdapterPosition(I)I

    move-result v6

    invoke-direct {p0, v6}, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPageAdapterWrapper;->recordViewAlbum(I)V

    iget-object v1, v0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPageAdapterWrapper;->mWrapped:Landroid/support/v7/widget/RecyclerView$Adapter;

    move-object v3, v1

    check-cast v3, Lcom/miui/gallery/adapter/AlbumPageAdapter;

    move-object v4, p1

    move-object v5, p2

    move-wide v7, p4

    move/from16 v9, p6

    move/from16 v10, p7

    invoke-virtual/range {v3 .. v10}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->onItemClick(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;IJFF)Z

    move-result v1

    return v1

    :cond_1
    :goto_0
    const/4 v1, 0x0

    return v1
.end method
