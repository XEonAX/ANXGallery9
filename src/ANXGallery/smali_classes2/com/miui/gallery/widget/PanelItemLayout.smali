.class public Lcom/miui/gallery/widget/PanelItemLayout;
.super Ljava/lang/Object;
.source "PanelItemLayout.java"


# instance fields
.field private mArrow:Landroid/view/View;

.field private mContext:Landroid/content/Context;

.field private mDetailContainer:Landroid/view/ViewGroup;

.field private final mMsgDrawableGonePadding:I

.field private final mMsgDrawableVisiblePadding:I

.field private mPanelItem:Landroid/view/View;

.field private mTitle:Landroid/widget/TextView;

.field private mTitleDrawable:Landroid/widget/ImageView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/widget/PanelItemLayout;->mContext:Landroid/content/Context;

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/widget/PanelItemLayout;->mMsgDrawableVisiblePadding:I

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f06030a

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/widget/PanelItemLayout;->mMsgDrawableGonePadding:I

    return-void
.end method

.method private ensureView()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/widget/PanelItemLayout;->mPanelItem:Landroid/view/View;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/PanelItemLayout;->mContext:Landroid/content/Context;

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0b00e2

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/widget/PanelItemLayout;->mPanelItem:Landroid/view/View;

    iget-object v0, p0, Lcom/miui/gallery/widget/PanelItemLayout;->mPanelItem:Landroid/view/View;

    const v1, 0x7f0901dc

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/miui/gallery/widget/PanelItemLayout;->mTitleDrawable:Landroid/widget/ImageView;

    iget-object v0, p0, Lcom/miui/gallery/widget/PanelItemLayout;->mPanelItem:Landroid/view/View;

    const v1, 0x7f0901db

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/miui/gallery/widget/PanelItemLayout;->mTitle:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/miui/gallery/widget/PanelItemLayout;->mPanelItem:Landroid/view/View;

    const v1, 0x7f09026b

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/widget/PanelItemLayout;->mArrow:Landroid/view/View;

    iget-object v0, p0, Lcom/miui/gallery/widget/PanelItemLayout;->mPanelItem:Landroid/view/View;

    const v1, 0x7f0900d1

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/miui/gallery/widget/PanelItemLayout;->mDetailContainer:Landroid/view/ViewGroup;

    :cond_0
    return-void
.end method


# virtual methods
.method public addDetail(I)Landroid/view/View;
    .locals 3

    if-eqz p1, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/widget/PanelItemLayout;->ensureView()V

    iget-object v0, p0, Lcom/miui/gallery/widget/PanelItemLayout;->mContext:Landroid/content/Context;

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/widget/PanelItemLayout;->mDetailContainer:Landroid/view/ViewGroup;

    const/4 v2, 0x0

    invoke-virtual {v0, p1, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/widget/PanelItemLayout;->addDetail(Landroid/view/View;)Landroid/view/View;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public addDetail(Landroid/view/View;)Landroid/view/View;
    .locals 2

    if-eqz p1, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/widget/PanelItemLayout;->ensureView()V

    iget-object v0, p0, Lcom/miui/gallery/widget/PanelItemLayout;->mDetailContainer:Landroid/view/ViewGroup;

    iget-object v1, p0, Lcom/miui/gallery/widget/PanelItemLayout;->mDetailContainer:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    invoke-virtual {v0, p1, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    :cond_0
    return-object p1
.end method

.method public clearDetails()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/PanelItemLayout;->mDetailContainer:Landroid/view/ViewGroup;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/PanelItemLayout;->mDetailContainer:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    :cond_0
    return-void
.end method

.method public getView()Landroid/view/View;
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/widget/PanelItemLayout;->ensureView()V

    iget-object v0, p0, Lcom/miui/gallery/widget/PanelItemLayout;->mPanelItem:Landroid/view/View;

    return-object v0
.end method

.method public setOnClickListener(Landroid/view/View$OnClickListener;)V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/widget/PanelItemLayout;->ensureView()V

    iget-object v0, p0, Lcom/miui/gallery/widget/PanelItemLayout;->mPanelItem:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public setTitle(Ljava/lang/CharSequence;)V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/widget/PanelItemLayout;->ensureView()V

    iget-object v0, p0, Lcom/miui/gallery/widget/PanelItemLayout;->mTitle:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public setTitleDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 5

    invoke-direct {p0}, Lcom/miui/gallery/widget/PanelItemLayout;->ensureView()V

    iget-object v0, p0, Lcom/miui/gallery/widget/PanelItemLayout;->mTitleDrawable:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    const/16 v0, 0x8

    if-eqz p1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/widget/PanelItemLayout;->mTitleDrawable:Landroid/widget/ImageView;

    invoke-virtual {v1}, Landroid/widget/ImageView;->getVisibility()I

    move-result v1

    if-ne v1, v0, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/widget/PanelItemLayout;->mPanelItem:Landroid/view/View;

    iget v0, p0, Lcom/miui/gallery/widget/PanelItemLayout;->mMsgDrawableVisiblePadding:I

    iget-object v1, p0, Lcom/miui/gallery/widget/PanelItemLayout;->mPanelItem:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getPaddingTop()I

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/widget/PanelItemLayout;->mPanelItem:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getPaddingEnd()I

    move-result v2

    iget-object v3, p0, Lcom/miui/gallery/widget/PanelItemLayout;->mPanelItem:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getPaddingBottom()I

    move-result v3

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/view/View;->setPadding(IIII)V

    iget-object p1, p0, Lcom/miui/gallery/widget/PanelItemLayout;->mTitleDrawable:Landroid/widget/ImageView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    return-void

    :cond_0
    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/widget/PanelItemLayout;->mTitleDrawable:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getVisibility()I

    move-result p1

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/widget/PanelItemLayout;->mPanelItem:Landroid/view/View;

    iget v1, p0, Lcom/miui/gallery/widget/PanelItemLayout;->mMsgDrawableGonePadding:I

    iget-object v2, p0, Lcom/miui/gallery/widget/PanelItemLayout;->mPanelItem:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getPaddingTop()I

    move-result v2

    iget-object v3, p0, Lcom/miui/gallery/widget/PanelItemLayout;->mPanelItem:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getPaddingEnd()I

    move-result v3

    iget-object v4, p0, Lcom/miui/gallery/widget/PanelItemLayout;->mPanelItem:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getPaddingBottom()I

    move-result v4

    invoke-virtual {p1, v1, v2, v3, v4}, Landroid/view/View;->setPadding(IIII)V

    iget-object p1, p0, Lcom/miui/gallery/widget/PanelItemLayout;->mTitleDrawable:Landroid/widget/ImageView;

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    return-void

    :cond_1
    return-void
.end method

.method public showArrow(Z)V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/widget/PanelItemLayout;->ensureView()V

    iget-object v0, p0, Lcom/miui/gallery/widget/PanelItemLayout;->mArrow:Landroid/view/View;

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    const/16 p1, 0x8

    :goto_0
    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method
