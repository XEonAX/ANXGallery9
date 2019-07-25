.class Lcom/miui/gallery/collage/app/poster/PosterHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;
.source "PosterHolder.java"


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

    iget-object p1, p0, Lcom/miui/gallery/collage/app/poster/PosterHolder;->itemView:Landroid/view/View;

    const p2, 0x7f090098

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lcom/miui/gallery/collage/app/poster/PosterHolder;->mImageView:Landroid/widget/ImageView;

    return-void
.end method


# virtual methods
.method setPosterModel(Landroid/content/res/Resources;Lcom/miui/gallery/collage/core/poster/PosterModel;II)V
    .locals 5

    sget-object p1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v0, "%s%s%s%d%s"

    const/4 v1, 0x5

    new-array v1, v1, [Ljava/lang/Object;

    iget-object p2, p2, Lcom/miui/gallery/collage/core/poster/PosterModel;->relativePath:Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    sget-object p2, Ljava/io/File;->separator:Ljava/lang/String;

    const/4 v3, 0x1

    aput-object p2, v1, v3

    const-string p2, "preview_"

    const/4 v4, 0x2

    aput-object p2, v1, v4

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    const/4 p3, 0x3

    aput-object p2, v1, p3

    const-string p2, ".png"

    const/4 p3, 0x4

    aput-object p2, v1, p3

    invoke-static {p1, v0, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object p2

    sget-object p3, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->ASSETS:Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    invoke-virtual {p3, p1}, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->wrap(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iget-object p3, p0, Lcom/miui/gallery/collage/app/poster/PosterHolder;->mImageView:Landroid/widget/ImageView;

    invoke-virtual {p2, p1, p3}, Lcom/nostra13/universalimageloader/core/ImageLoader;->displayImage(Ljava/lang/String;Landroid/widget/ImageView;)V

    iget-object p1, p0, Lcom/miui/gallery/collage/app/poster/PosterHolder;->mImageView:Landroid/widget/ImageView;

    iget-object p2, p0, Lcom/miui/gallery/collage/app/poster/PosterHolder;->mImageView:Landroid/widget/ImageView;

    invoke-virtual {p2}, Landroid/widget/ImageView;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    new-array p3, v3, [Ljava/lang/Object;

    add-int/2addr p4, v3

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p4

    aput-object p4, p3, v2

    const p4, 0x7f100555

    invoke-virtual {p2, p4, p3}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    return-void
.end method
