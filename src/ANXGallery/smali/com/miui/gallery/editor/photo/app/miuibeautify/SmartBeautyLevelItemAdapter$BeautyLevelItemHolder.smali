.class Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter$BeautyLevelItemHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;
.source "SmartBeautyLevelItemAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "BeautyLevelItemHolder"
.end annotation


# instance fields
.field private mImageView:Landroid/widget/ImageView;

.field final synthetic this$0:Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter;Landroid/view/View;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter$BeautyLevelItemHolder;->this$0:Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter;

    invoke-direct {p0, p2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    const p1, 0x7f090174

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter$BeautyLevelItemHolder;->mImageView:Landroid/widget/ImageView;

    return-void
.end method


# virtual methods
.method public bind(II)V
    .locals 2

    new-instance v0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter$BeautyLevelItemHolder;->mImageView:Landroid/widget/ImageView;

    invoke-virtual {v1}, Landroid/widget/ImageView;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter$BeautyLevelItemHolder;->mImageView:Landroid/widget/ImageView;

    invoke-virtual {v1}, Landroid/widget/ImageView;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    invoke-direct {v0, p1, p2}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;-><init>(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    new-instance p1, Lmiui/view/animation/SineEaseInOutInterpolator;

    invoke-direct {p1}, Lmiui/view/animation/SineEaseInOutInterpolator;-><init>()V

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter$BeautyLevelItemHolder;->mImageView:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f0a0058

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p1

    int-to-long p1, p1

    invoke-virtual {v0, p1, p2}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->setDuration(J)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter$BeautyLevelItemHolder;->mImageView:Landroid/widget/ImageView;

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method
