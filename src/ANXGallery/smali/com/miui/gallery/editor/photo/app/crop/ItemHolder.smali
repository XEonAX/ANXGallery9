.class Lcom/miui/gallery/editor/photo/app/crop/ItemHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;
.source "ItemHolder.java"


# instance fields
.field private mView:Landroid/widget/ImageView;


# direct methods
.method constructor <init>(Landroid/view/View;)V
    .locals 1

    invoke-direct {p0, p1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    const v0, 0x7f09016a

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/crop/ItemHolder;->mView:Landroid/widget/ImageView;

    return-void
.end method


# virtual methods
.method bind(Lcom/miui/gallery/editor/photo/core/common/model/CropData;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/crop/ItemHolder;->mView:Landroid/widget/ImageView;

    iget v1, p1, Lcom/miui/gallery/editor/photo/core/common/model/CropData;->icon:I

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/crop/ItemHolder;->mView:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/crop/ItemHolder;->mView:Landroid/widget/ImageView;

    invoke-virtual {v1}, Landroid/widget/ImageView;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    iget p1, p1, Lcom/miui/gallery/editor/photo/core/common/model/CropData;->talkbackName:I

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    return-void
.end method
