.class public Lcom/miui/gallery/video/editor/adapter/VideoNavHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;
.source "VideoNavHolder.java"


# instance fields
.field private mImageView:Landroid/widget/ImageView;

.field private mView:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 1

    invoke-direct {p0, p1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    const v0, 0x7f090196

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/miui/gallery/video/editor/adapter/VideoNavHolder;->mView:Landroid/widget/TextView;

    const v0, 0x7f090176

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lcom/miui/gallery/video/editor/adapter/VideoNavHolder;->mImageView:Landroid/widget/ImageView;

    return-void
.end method


# virtual methods
.method bind(Lcom/miui/gallery/video/editor/model/MenuFragmentData;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/video/editor/adapter/VideoNavHolder;->mView:Landroid/widget/TextView;

    iget v1, p1, Lcom/miui/gallery/video/editor/model/MenuFragmentData;->nameId:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/adapter/VideoNavHolder;->mImageView:Landroid/widget/ImageView;

    iget p1, p1, Lcom/miui/gallery/video/editor/model/MenuFragmentData;->iconId:I

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    return-void
.end method
