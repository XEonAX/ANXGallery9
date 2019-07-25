.class Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewAdapter;
.super Landroid/support/v7/widget/RecyclerView$Adapter;
.source "BurstPhotoPreviewFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "PreviewViewAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/v7/widget/RecyclerView$Adapter<",
        "Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field private mContext:Landroid/content/Context;

.field private mDataSet:Lcom/miui/gallery/model/BaseDataSet;

.field mDisplayOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

.field private mItemHeight:I

.field private mItemWidth:I

.field private mSelectDataPos:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;Landroid/content/Context;)V
    .locals 2

    iput-object p1, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewAdapter;->this$0:Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewAdapter;->mSelectDataPos:Ljava/util/List;

    new-instance v0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-direct {v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;-><init>()V

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object v1

    iget-object v1, v1, Lcom/miui/gallery/Config$ThumbConfig;->MICRO_THUMB_DISPLAY_IMAGE_OPTIONS_DEFAULT:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cloneFrom(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheThumbnail(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->loadFromMicroCache(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewAdapter;->mDisplayOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    iput-object p2, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->getActivity()Landroid/app/Activity;

    move-result-object p2

    invoke-virtual {p2}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const v0, 0x7f06006c

    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    iput p2, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewAdapter;->mItemWidth:I

    invoke-virtual {p1}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f060064

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewAdapter;->mItemHeight:I

    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewAdapter;->mDataSet:Lcom/miui/gallery/model/BaseDataSet;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewAdapter;->mDataSet:Lcom/miui/gallery/model/BaseDataSet;

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataSet;->getCount()I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getSelectCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewAdapter;->mSelectDataPos:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    check-cast p1, Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewAdapter;->onBindViewHolder(Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;I)V
    .locals 12

    iget-object v0, p1, Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;->itemView:Landroid/view/View;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewAdapter;->mDataSet:Lcom/miui/gallery/model/BaseDataSet;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewAdapter;->mDataSet:Lcom/miui/gallery/model/BaseDataSet;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p2}, Lcom/miui/gallery/model/BaseDataSet;->getItem(Lcom/miui/gallery/model/BaseDataItem;I)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem;->getKey()J

    move-result-wide v2

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_2

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem;->getThumnailPath()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_1

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem;->getMicroPath()Ljava/lang/String;

    move-result-object v4

    goto :goto_0

    :cond_1
    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem;->getThumnailPath()Ljava/lang/String;

    move-result-object v4

    goto :goto_0

    :cond_2
    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v4

    :goto_0
    move-object v7, v4

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem;->isSynced()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-static {v2, v3}, Lcom/miui/gallery/util/uil/CloudUriAdapter;->getDownloadUri(J)Landroid/net/Uri;

    move-result-object v1

    :cond_3
    move-object v8, v1

    instance-of v0, p1, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewHolder;

    if-eqz v0, :cond_4

    move-object v5, p1

    check-cast v5, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewHolder;

    iget-object p1, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewAdapter;->mSelectDataPos:Ljava/util/List;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-interface {p1, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v6

    iget v9, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewAdapter;->mItemWidth:I

    iget v10, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewAdapter;->mItemHeight:I

    iget-object v11, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewAdapter;->mDisplayOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    invoke-virtual/range {v5 .. v11}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewHolder;->bindImage(ZLjava/lang/String;Landroid/net/Uri;IILcom/nostra13/universalimageloader/core/DisplayImageOptions;)V

    :cond_4
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;

    move-result-object p1

    return-object p1
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;
    .locals 4

    new-instance p2, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewHolder;

    iget-object v0, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewAdapter;->this$0:Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;

    iget-object v1, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewAdapter;->mContext:Landroid/content/Context;

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const v2, 0x7f0b0039

    const/4 v3, 0x0

    invoke-virtual {v1, v2, p1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-direct {p2, v0, p1}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewHolder;-><init>(Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;Landroid/view/View;)V

    return-object p2
.end method

.method public setDateSet(Lcom/miui/gallery/model/BaseDataSet;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewAdapter;->mDataSet:Lcom/miui/gallery/model/BaseDataSet;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewAdapter;->notifyDataSetChanged()V

    return-void
.end method

.method public setSelectDataPosition(IZ)V
    .locals 2

    if-eqz p2, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewAdapter;->mSelectDataPos:Ljava/util/List;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewAdapter;->mSelectDataPos:Ljava/util/List;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewAdapter;->mSelectDataPos:Ljava/util/List;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewAdapter;->this$0:Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->access$300(Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;)Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewAdapter;->this$0:Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;

    invoke-static {v1}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->access$200(Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;)Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewHeaderFooterWrapper;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewHeaderFooterWrapper;->getHeadersCount()I

    move-result v1

    add-int/2addr p1, v1

    invoke-virtual {v0, p1}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->findViewHolderForAdapterPosition(I)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;

    if-eqz p1, :cond_2

    instance-of v0, p1, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewHolder;

    if-eqz v0, :cond_2

    check-cast p1, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewHolder;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewHolder;->setSelect(Z)V

    :cond_2
    return-void
.end method
