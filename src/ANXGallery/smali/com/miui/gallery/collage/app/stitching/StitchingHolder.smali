.class Lcom/miui/gallery/collage/app/stitching/StitchingHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;
.source "StitchingHolder.java"


# instance fields
.field private mImageView:Landroid/widget/ImageView;


# direct methods
.method constructor <init>(Landroid/view/ViewGroup;Landroid/content/Context;)V
    .locals 2

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    const v0, 0x7f0b0118

    const/4 v1, 0x0

    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-direct {p0, p1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    iget-object p1, p0, Lcom/miui/gallery/collage/app/stitching/StitchingHolder;->itemView:Landroid/view/View;

    const p2, 0x7f090098

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lcom/miui/gallery/collage/app/stitching/StitchingHolder;->mImageView:Landroid/widget/ImageView;

    return-void
.end method


# virtual methods
.method setStitchingModel(Landroid/content/res/Resources;Lcom/miui/gallery/collage/core/stitching/StitchingModel;I)V
    .locals 5

    sget-object p1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v0, "%s%s%s%s"

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/Object;

    iget-object p2, p2, Lcom/miui/gallery/collage/core/stitching/StitchingModel;->relativePath:Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    sget-object p2, Ljava/io/File;->separator:Ljava/lang/String;

    const/4 v3, 0x1

    aput-object p2, v1, v3

    const-string p2, "preview"

    const/4 v4, 0x2

    aput-object p2, v1, v4

    const-string p2, ".png"

    const/4 v4, 0x3

    aput-object p2, v1, v4

    invoke-static {p1, v0, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object p2

    sget-object v0, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->ASSETS:Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    invoke-virtual {v0, p1}, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->wrap(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/collage/app/stitching/StitchingHolder;->mImageView:Landroid/widget/ImageView;

    invoke-virtual {p2, p1, v0}, Lcom/nostra13/universalimageloader/core/ImageLoader;->displayImage(Ljava/lang/String;Landroid/widget/ImageView;)V

    iget-object p1, p0, Lcom/miui/gallery/collage/app/stitching/StitchingHolder;->mImageView:Landroid/widget/ImageView;

    iget-object p2, p0, Lcom/miui/gallery/collage/app/stitching/StitchingHolder;->mImageView:Landroid/widget/ImageView;

    invoke-virtual {p2}, Landroid/widget/ImageView;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    new-array v0, v3, [Ljava/lang/Object;

    add-int/2addr p3, v3

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    aput-object p3, v0, v2

    const p3, 0x7f100555

    invoke-virtual {p2, p3, v0}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    return-void
.end method
