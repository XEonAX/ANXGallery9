.class Lcom/miui/gallery/collage/app/layout/LayoutHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;
.source "LayoutHolder.java"


# instance fields
.field private mImageView:Landroid/widget/ImageView;

.field private mLayoutPreviewDrawable:Lcom/miui/gallery/collage/app/layout/LayoutPreviewDrawable;


# direct methods
.method constructor <init>(Landroid/view/ViewGroup;Landroid/content/Context;)V
    .locals 3

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0b00a2

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-direct {p0, p1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    iget-object p1, p0, Lcom/miui/gallery/collage/app/layout/LayoutHolder;->itemView:Landroid/view/View;

    const v0, 0x7f090098

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lcom/miui/gallery/collage/app/layout/LayoutHolder;->mImageView:Landroid/widget/ImageView;

    new-instance p1, Lcom/miui/gallery/collage/app/layout/LayoutPreviewDrawable;

    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/miui/gallery/collage/app/layout/LayoutPreviewDrawable;-><init>(Landroid/content/res/Resources;)V

    iput-object p1, p0, Lcom/miui/gallery/collage/app/layout/LayoutHolder;->mLayoutPreviewDrawable:Lcom/miui/gallery/collage/app/layout/LayoutPreviewDrawable;

    return-void
.end method


# virtual methods
.method setLayoutModel(Lcom/miui/gallery/collage/core/layout/LayoutModel;I)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/collage/app/layout/LayoutHolder;->mLayoutPreviewDrawable:Lcom/miui/gallery/collage/app/layout/LayoutPreviewDrawable;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/collage/app/layout/LayoutPreviewDrawable;->setLayoutModel(Lcom/miui/gallery/collage/core/layout/LayoutModel;)V

    iget-object p1, p0, Lcom/miui/gallery/collage/app/layout/LayoutHolder;->mImageView:Landroid/widget/ImageView;

    iget-object v0, p0, Lcom/miui/gallery/collage/app/layout/LayoutHolder;->mLayoutPreviewDrawable:Lcom/miui/gallery/collage/app/layout/LayoutPreviewDrawable;

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object p1, p0, Lcom/miui/gallery/collage/app/layout/LayoutHolder;->mImageView:Landroid/widget/ImageView;

    iget-object v0, p0, Lcom/miui/gallery/collage/app/layout/LayoutHolder;->mImageView:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Object;

    add-int/2addr p2, v1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    const/4 v1, 0x0

    aput-object p2, v2, v1

    const p2, 0x7f100555

    invoke-virtual {v0, p2, v2}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    return-void
.end method
