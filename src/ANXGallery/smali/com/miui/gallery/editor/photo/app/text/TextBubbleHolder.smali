.class Lcom/miui/gallery/editor/photo/app/text/TextBubbleHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;
.source "TextBubbleHolder.java"


# instance fields
.field private mImageView:Landroid/widget/ImageView;


# direct methods
.method constructor <init>(Landroid/view/View;)V
    .locals 1

    invoke-direct {p0, p1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    const v0, 0x7f090174

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/text/TextBubbleHolder;->mImageView:Landroid/widget/ImageView;

    return-void
.end method


# virtual methods
.method public bind(Lcom/miui/gallery/editor/photo/core/common/model/TextData;I)V
    .locals 3

    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v0

    iget-object p1, p1, Lcom/miui/gallery/editor/photo/core/common/model/TextData;->iconPath:Ljava/lang/String;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/text/TextBubbleHolder;->mImageView:Landroid/widget/ImageView;

    invoke-virtual {v0, p1, v1}, Lcom/nostra13/universalimageloader/core/ImageLoader;->displayImage(Ljava/lang/String;Landroid/widget/ImageView;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/text/TextBubbleHolder;->mImageView:Landroid/widget/ImageView;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/text/TextBubbleHolder;->mImageView:Landroid/widget/ImageView;

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
