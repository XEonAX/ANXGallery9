.class final Lcom/miui/gallery/editor/photo/screen/home/ScreenNavAdapter$ScreenNavigatorHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;
.source "ScreenNavAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/screen/home/ScreenNavAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ScreenNavigatorHolder"
.end annotation


# instance fields
.field private mIcon:Landroid/widget/ImageView;

.field private mSelected:Landroid/widget/ImageView;

.field private mTextView:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 1

    invoke-direct {p0, p1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    const v0, 0x7f090196

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavAdapter$ScreenNavigatorHolder;->mTextView:Landroid/widget/TextView;

    const v0, 0x7f09016a

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavAdapter$ScreenNavigatorHolder;->mIcon:Landroid/widget/ImageView;

    const v0, 0x7f09029c

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavAdapter$ScreenNavigatorHolder;->mSelected:Landroid/widget/ImageView;

    return-void
.end method


# virtual methods
.method bind(ZLcom/miui/gallery/editor/photo/screen/entity/ScreenNavigatorData;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavAdapter$ScreenNavigatorHolder;->mSelected:Landroid/widget/ImageView;

    if-eqz p1, :cond_0

    iget p1, p2, Lcom/miui/gallery/editor/photo/screen/entity/ScreenNavigatorData;->id:I

    const/4 v1, 0x5

    if-eq p1, v1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    const/4 p1, 0x4

    :goto_0
    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavAdapter$ScreenNavigatorHolder;->mIcon:Landroid/widget/ImageView;

    iget v0, p2, Lcom/miui/gallery/editor/photo/screen/entity/ScreenNavigatorData;->icon:I

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavAdapter$ScreenNavigatorHolder;->mTextView:Landroid/widget/TextView;

    iget p2, p2, Lcom/miui/gallery/editor/photo/screen/entity/ScreenNavigatorData;->name:I

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    return-void
.end method
