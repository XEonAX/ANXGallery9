.class public Lcom/miui/gallery/movie/ui/adapter/EditAdapter$EditHolder;
.super Lcom/miui/gallery/movie/ui/adapter/BaseAdapter$BaseHolder;
.source "EditAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/movie/ui/adapter/EditAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "EditHolder"
.end annotation


# instance fields
.field protected mImageView:Lcom/meicam/sdk/NvsThumbnailView;

.field protected mImageViewAdd:Landroid/widget/ImageView;

.field final synthetic this$0:Lcom/miui/gallery/movie/ui/adapter/EditAdapter;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/movie/ui/adapter/EditAdapter;Landroid/view/View;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/movie/ui/adapter/EditAdapter$EditHolder;->this$0:Lcom/miui/gallery/movie/ui/adapter/EditAdapter;

    invoke-direct {p0, p2}, Lcom/miui/gallery/movie/ui/adapter/BaseAdapter$BaseHolder;-><init>(Landroid/view/View;)V

    const p1, 0x7f090188

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/meicam/sdk/NvsThumbnailView;

    iput-object p1, p0, Lcom/miui/gallery/movie/ui/adapter/EditAdapter$EditHolder;->mImageView:Lcom/meicam/sdk/NvsThumbnailView;

    const p1, 0x7f090189

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lcom/miui/gallery/movie/ui/adapter/EditAdapter$EditHolder;->mImageViewAdd:Landroid/widget/ImageView;

    return-void
.end method


# virtual methods
.method public bindView(I)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/adapter/EditAdapter$EditHolder;->this$0:Lcom/miui/gallery/movie/ui/adapter/EditAdapter;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/movie/ui/adapter/EditAdapter;->isAddItem(I)Z

    move-result v0

    const/4 v1, 0x0

    const/16 v2, 0x8

    if-eqz v0, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/adapter/EditAdapter$EditHolder;->mImageView:Lcom/meicam/sdk/NvsThumbnailView;

    invoke-virtual {p1, v2}, Lcom/meicam/sdk/NvsThumbnailView;->setVisibility(I)V

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/adapter/EditAdapter$EditHolder;->mImageViewAdd:Landroid/widget/ImageView;

    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/movie/ui/adapter/EditAdapter$EditHolder;->mImageView:Lcom/meicam/sdk/NvsThumbnailView;

    invoke-virtual {v0, v1}, Lcom/meicam/sdk/NvsThumbnailView;->setVisibility(I)V

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/adapter/EditAdapter$EditHolder;->mImageViewAdd:Landroid/widget/ImageView;

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/adapter/EditAdapter$EditHolder;->mImageView:Lcom/meicam/sdk/NvsThumbnailView;

    iget-object v1, p0, Lcom/miui/gallery/movie/ui/adapter/EditAdapter$EditHolder;->this$0:Lcom/miui/gallery/movie/ui/adapter/EditAdapter;

    invoke-virtual {v1, p1}, Lcom/miui/gallery/movie/ui/adapter/EditAdapter;->getItemData(I)Lcom/miui/gallery/movie/entity/ImageEntity;

    move-result-object p1

    iget-object p1, p1, Lcom/miui/gallery/movie/entity/ImageEntity;->image:Ljava/lang/String;

    invoke-virtual {v0, p1}, Lcom/meicam/sdk/NvsThumbnailView;->setMediaFilePath(Ljava/lang/String;)V

    :goto_0
    return-void
.end method
