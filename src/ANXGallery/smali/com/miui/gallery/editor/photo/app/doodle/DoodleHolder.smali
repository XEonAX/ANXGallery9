.class public Lcom/miui/gallery/editor/photo/app/doodle/DoodleHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;
.source "DoodleHolder.java"


# instance fields
.field private mImageView:Landroid/widget/ImageView;


# direct methods
.method constructor <init>(Landroid/content/Context;Landroid/view/ViewGroup;)V
    .locals 2

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const v0, 0x7f0b006d

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-direct {p0, p1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleHolder;->itemView:Landroid/view/View;

    const p2, 0x7f090174

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleHolder;->mImageView:Landroid/widget/ImageView;

    return-void
.end method


# virtual methods
.method setIconPath(II)V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleHolder;->mImageView:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleHolder;->mImageView:Landroid/widget/ImageView;

    invoke-virtual {v1}, Landroid/widget/ImageView;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Object;

    add-int/2addr p2, v2

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    const/4 v2, 0x0

    aput-object p2, v3, v2

    const p2, 0x7f100555

    invoke-virtual {v1, p2, v3}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodleHolder;->mImageView:Landroid/widget/ImageView;

    invoke-virtual {p2, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    return-void
.end method
