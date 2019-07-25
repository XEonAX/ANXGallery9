.class public final Lcom/miui/gallery/ui/PhotoPageItem$EmptyView;
.super Ljava/lang/Object;
.source "PhotoPageItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPageItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x14
    name = "EmptyView"
.end annotation


# instance fields
.field private mEmptyBackground:I

.field private mEmptyView:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/miui/gallery/ui/PhotoPageItem;


# direct methods
.method protected constructor <init>(Lcom/miui/gallery/ui/PhotoPageItem;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$EmptyView;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private initView()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$EmptyView;->mEmptyView:Landroid/widget/TextView;

    if-nez v0, :cond_0

    new-instance v0, Landroid/widget/TextView;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageItem$EmptyView;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    invoke-virtual {v1}, Lcom/miui/gallery/ui/PhotoPageItem;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$EmptyView;->mEmptyView:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$EmptyView;->mEmptyView:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageItem$EmptyView;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    invoke-virtual {v1}, Lcom/miui/gallery/ui/PhotoPageItem;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f050111

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$EmptyView;->mEmptyView:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageItem$EmptyView;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    invoke-virtual {v1}, Lcom/miui/gallery/ui/PhotoPageItem;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f060363

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    int-to-float v1, v1

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Landroid/widget/TextView;->setTextSize(IF)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$EmptyView;->mEmptyView:Landroid/widget/TextView;

    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$EmptyView;->mEmptyView:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageItem$EmptyView;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    invoke-virtual {v1}, Lcom/miui/gallery/ui/PhotoPageItem;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v3, 0x7f060362

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v1, -0x2

    invoke-direct {v0, v1, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    const/16 v1, 0xd

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageItem$EmptyView;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object v3, p0, Lcom/miui/gallery/ui/PhotoPageItem$EmptyView;->mEmptyView:Landroid/widget/TextView;

    invoke-virtual {v1, v3, v2, v0}, Lcom/miui/gallery/ui/PhotoPageItem;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$EmptyView;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageItem;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f050110

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$EmptyView;->mEmptyBackground:I

    :cond_0
    return-void
.end method


# virtual methods
.method public setIcon(Landroid/graphics/drawable/Drawable;)V
    .locals 2

    if-nez p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$EmptyView;->mEmptyView:Landroid/widget/TextView;

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageItem$EmptyView;->initView()V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$EmptyView;->mEmptyView:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p1, v1, v1}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public setTip(Ljava/lang/CharSequence;)V
    .locals 1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$EmptyView;->mEmptyView:Landroid/widget/TextView;

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageItem$EmptyView;->initView()V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$EmptyView;->mEmptyView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public setVisible(Z)V
    .locals 1

    if-eqz p1, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageItem$EmptyView;->initView()V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$EmptyView;->mEmptyView:Landroid/widget/TextView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$EmptyView;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$EmptyView;->mEmptyBackground:I

    invoke-virtual {p1, v0}, Lcom/miui/gallery/ui/PhotoPageItem;->setBackgroundColor(I)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$EmptyView;->mEmptyView:Landroid/widget/TextView;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$EmptyView;->mEmptyView:Landroid/widget/TextView;

    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$EmptyView;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/ui/PhotoPageItem;->setBackground(Landroid/graphics/drawable/Drawable;)V

    :cond_1
    :goto_0
    return-void
.end method
