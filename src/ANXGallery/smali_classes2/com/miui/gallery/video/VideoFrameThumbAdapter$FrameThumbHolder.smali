.class Lcom/miui/gallery/video/VideoFrameThumbAdapter$FrameThumbHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;
.source "VideoFrameThumbAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/video/VideoFrameThumbAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FrameThumbHolder"
.end annotation


# instance fields
.field private mImageView:Landroid/widget/ImageView;

.field final synthetic this$0:Lcom/miui/gallery/video/VideoFrameThumbAdapter;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/video/VideoFrameThumbAdapter;Landroid/view/View;)V
    .locals 2

    iput-object p1, p0, Lcom/miui/gallery/video/VideoFrameThumbAdapter$FrameThumbHolder;->this$0:Lcom/miui/gallery/video/VideoFrameThumbAdapter;

    new-instance v0, Landroid/widget/ImageView;

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-direct {v0, p2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    invoke-direct {p0, v0}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    iget-object p2, p0, Lcom/miui/gallery/video/VideoFrameThumbAdapter$FrameThumbHolder;->itemView:Landroid/view/View;

    check-cast p2, Landroid/widget/ImageView;

    iput-object p2, p0, Lcom/miui/gallery/video/VideoFrameThumbAdapter$FrameThumbHolder;->mImageView:Landroid/widget/ImageView;

    iget-object p2, p0, Lcom/miui/gallery/video/VideoFrameThumbAdapter$FrameThumbHolder;->mImageView:Landroid/widget/ImageView;

    new-instance v0, Landroid/support/v7/widget/RecyclerView$LayoutParams;

    invoke-static {p1}, Lcom/miui/gallery/video/VideoFrameThumbAdapter;->access$000(Lcom/miui/gallery/video/VideoFrameThumbAdapter;)I

    move-result p1

    const/4 v1, -0x1

    invoke-direct {v0, p1, v1}, Landroid/support/v7/widget/RecyclerView$LayoutParams;-><init>(II)V

    invoke-virtual {p2, v0}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object p1, p0, Lcom/miui/gallery/video/VideoFrameThumbAdapter$FrameThumbHolder;->mImageView:Landroid/widget/ImageView;

    sget-object p2, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    return-void
.end method


# virtual methods
.method public setBitmap(Landroid/graphics/Bitmap;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/VideoFrameThumbAdapter$FrameThumbHolder;->mImageView:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    return-void
.end method
