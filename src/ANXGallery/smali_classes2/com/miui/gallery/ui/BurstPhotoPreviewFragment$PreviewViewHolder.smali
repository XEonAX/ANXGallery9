.class Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewHolder;
.super Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;
.source "BurstPhotoPreviewFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "PreviewViewHolder"
.end annotation


# instance fields
.field private mPreview:Landroid/widget/ImageView;

.field private mSelectView:Landroid/view/View;

.field final synthetic this$0:Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;Landroid/view/View;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewHolder;->this$0:Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;

    invoke-direct {p0, p2}, Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;-><init>(Landroid/view/View;)V

    const p1, 0x7f090228

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewHolder;->mPreview:Landroid/widget/ImageView;

    const p1, 0x7f09029b

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewHolder;->mSelectView:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public bindImage(ZLjava/lang/String;Landroid/net/Uri;IILcom/nostra13/universalimageloader/core/DisplayImageOptions;)V
    .locals 7

    iget-object v0, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewHolder;->mSelectView:Landroid/view/View;

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    const/16 p1, 0x8

    :goto_0
    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    iget-object p1, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewHolder;->mPreview:Landroid/widget/ImageView;

    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v0, p4, p5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    sget-object v3, Lcom/miui/gallery/sdk/download/DownloadType;->MICRO:Lcom/miui/gallery/sdk/download/DownloadType;

    iget-object v4, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewHolder;->mPreview:Landroid/widget/ImageView;

    new-instance v6, Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    invoke-direct {v6, p4, p5}, Lcom/nostra13/universalimageloader/core/assist/ImageSize;-><init>(II)V

    move-object v1, p2

    move-object v2, p3

    move-object v5, p6

    invoke-static/range {v1 .. v6}, Lcom/miui/gallery/util/BindImageHelper;->bindImage(Ljava/lang/String;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Landroid/widget/ImageView;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewHolder;->itemView:Landroid/view/View;

    new-instance p2, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewHolder$1;

    invoke-direct {p2, p0}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewHolder$1;-><init>(Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewHolder;)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public setSelect(Z)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewHolder;->mSelectView:Landroid/view/View;

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    const/16 p1, 0x8

    :goto_0
    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method
