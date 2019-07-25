.class final Lcom/miui/gallery/editor/photo/app/navigator/ScreenshotNaviFragment$NavigatorHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;
.source "ScreenshotNaviFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/app/navigator/ScreenshotNaviFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "NavigatorHolder"
.end annotation


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

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/navigator/ScreenshotNaviFragment$NavigatorHolder;->mView:Landroid/widget/TextView;

    const v0, 0x7f090176

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/navigator/ScreenshotNaviFragment$NavigatorHolder;->mImageView:Landroid/widget/ImageView;

    return-void
.end method


# virtual methods
.method bind(Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/navigator/ScreenshotNaviFragment$NavigatorHolder;->mView:Landroid/widget/TextView;

    iget v1, p1, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;->name:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/navigator/ScreenshotNaviFragment$NavigatorHolder;->mImageView:Landroid/widget/ImageView;

    iget p1, p1, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;->icon:I

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    return-void
.end method
