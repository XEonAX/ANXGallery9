.class public Lcom/miui/gallery/widget/EmptyPage;
.super Landroid/widget/RelativeLayout;
.source "EmptyPage.java"


# instance fields
.field private mActionButton:Landroid/widget/Button;

.field private mBigTitle:Landroid/widget/TextView;

.field private mDescription:Landroid/widget/TextView;

.field private mIcon:Landroid/widget/ImageView;

.field private mTitle:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/widget/EmptyPage;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/miui/gallery/widget/EmptyPage;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    invoke-direct {p0, p2}, Lcom/miui/gallery/widget/EmptyPage;->init(Landroid/util/AttributeSet;)V

    return-void
.end method

.method private init(Landroid/util/AttributeSet;)V
    .locals 10

    invoke-virtual {p0}, Lcom/miui/gallery/widget/EmptyPage;->isInEditMode()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/widget/EmptyPage;->getContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/R$styleable;->EmptyPage:[I

    invoke-virtual {v0, p1, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    const/4 v0, 0x3

    :try_start_0
    invoke-virtual {p1, v0}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const/4 v1, 0x4

    invoke-virtual {p1, v1}, Landroid/content/res/TypedArray;->getText(I)Ljava/lang/CharSequence;

    move-result-object v1

    const/4 v2, 0x2

    invoke-virtual {p1, v2}, Landroid/content/res/TypedArray;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {p1, v3}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    const/4 v5, 0x1

    invoke-virtual {p1, v5}, Landroid/content/res/TypedArray;->getText(I)Ljava/lang/CharSequence;

    move-result-object v6

    const/4 v7, 0x5

    invoke-virtual {p1, v7, v5}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v7
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    invoke-virtual {p0}, Lcom/miui/gallery/widget/EmptyPage;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const v8, 0x7f0b0074

    invoke-virtual {p1, v8, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    const v8, 0x7f09016a

    invoke-virtual {p1, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/ImageView;

    iput-object v8, p0, Lcom/miui/gallery/widget/EmptyPage;->mIcon:Landroid/widget/ImageView;

    const v8, 0x7f0902fa

    invoke-virtual {p1, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/TextView;

    iput-object v8, p0, Lcom/miui/gallery/widget/EmptyPage;->mTitle:Landroid/widget/TextView;

    const v8, 0x7f090060

    invoke-virtual {p1, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/TextView;

    iput-object v8, p0, Lcom/miui/gallery/widget/EmptyPage;->mBigTitle:Landroid/widget/TextView;

    const v8, 0x7f0900d0

    invoke-virtual {p1, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/TextView;

    iput-object v8, p0, Lcom/miui/gallery/widget/EmptyPage;->mDescription:Landroid/widget/TextView;

    sget v8, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v9, 0x15

    if-lt v8, v9, :cond_1

    iget-object v8, p0, Lcom/miui/gallery/widget/EmptyPage;->mBigTitle:Landroid/widget/TextView;

    const v9, 0x3ccccccd    # 0.025f

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setLetterSpacing(F)V

    iget-object v8, p0, Lcom/miui/gallery/widget/EmptyPage;->mDescription:Landroid/widget/TextView;

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setLetterSpacing(F)V

    :cond_1
    const v8, 0x7f090004

    invoke-virtual {p1, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    iput-object p1, p0, Lcom/miui/gallery/widget/EmptyPage;->mActionButton:Landroid/widget/Button;

    if-eqz v0, :cond_2

    invoke-virtual {p0, v0}, Lcom/miui/gallery/widget/EmptyPage;->setIcon(Landroid/graphics/drawable/Drawable;)V

    :cond_2
    if-eqz v2, :cond_3

    invoke-direct {p0, v3}, Lcom/miui/gallery/widget/EmptyPage;->setSingleLineTextMode(Z)V

    invoke-virtual {p0, v2}, Lcom/miui/gallery/widget/EmptyPage;->setDescription(Ljava/lang/CharSequence;)V

    if-eqz v1, :cond_4

    invoke-virtual {p0, v1}, Lcom/miui/gallery/widget/EmptyPage;->setBigTitle(Ljava/lang/CharSequence;)V

    goto :goto_0

    :cond_3
    invoke-direct {p0, v5}, Lcom/miui/gallery/widget/EmptyPage;->setSingleLineTextMode(Z)V

    if-eqz v1, :cond_4

    invoke-virtual {p0, v1}, Lcom/miui/gallery/widget/EmptyPage;->setTitle(Ljava/lang/CharSequence;)V

    :cond_4
    :goto_0
    if-eqz v4, :cond_5

    invoke-virtual {p0, v4}, Lcom/miui/gallery/widget/EmptyPage;->setActionButtonBackground(Landroid/graphics/drawable/Drawable;)V

    :cond_5
    if-eqz v6, :cond_6

    invoke-virtual {p0, v6}, Lcom/miui/gallery/widget/EmptyPage;->setActionButtonText(Ljava/lang/CharSequence;)V

    :cond_6
    invoke-virtual {p0, v7}, Lcom/miui/gallery/widget/EmptyPage;->setActionButtonVisible(Z)V

    return-void

    :catchall_0
    move-exception v0

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    throw v0
.end method

.method private setSingleLineTextMode(Z)V
    .locals 2

    const/16 v0, 0x8

    const/4 v1, 0x0

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/widget/EmptyPage;->mTitle:Landroid/widget/TextView;

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object p1, p0, Lcom/miui/gallery/widget/EmptyPage;->mBigTitle:Landroid/widget/TextView;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object p1, p0, Lcom/miui/gallery/widget/EmptyPage;->mDescription:Landroid/widget/TextView;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/widget/EmptyPage;->mTitle:Landroid/widget/TextView;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object p1, p0, Lcom/miui/gallery/widget/EmptyPage;->mBigTitle:Landroid/widget/TextView;

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object p1, p0, Lcom/miui/gallery/widget/EmptyPage;->mDescription:Landroid/widget/TextView;

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setVisibility(I)V

    :goto_0
    return-void
.end method


# virtual methods
.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/widget/EmptyPage;->mIcon:Landroid/widget/ImageView;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/widget/EmptyPage;->mIcon:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-virtual {p0}, Lcom/miui/gallery/widget/EmptyPage;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0604f2

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    if-eq v2, v1, :cond_1

    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    iget v3, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    iget v4, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    invoke-virtual {v0, v2, v1, v3, v4}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    iget-object v1, p0, Lcom/miui/gallery/widget/EmptyPage;->mIcon:Landroid/widget/ImageView;

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_1
    iget p1, p1, Landroid/content/res/Configuration;->orientation:I

    const/4 v0, 0x2

    if-ne p1, v0, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/widget/EmptyPage;->mTitle:Landroid/widget/TextView;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/widget/EmptyPage;->mTitle:Landroid/widget/TextView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    :goto_0
    return-void
.end method

.method public setActionButtonBackground(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/EmptyPage;->mActionButton:Landroid/widget/Button;

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setBackgroundResource(I)V

    return-void
.end method

.method public setActionButtonBackground(Landroid/graphics/drawable/Drawable;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/EmptyPage;->mActionButton:Landroid/widget/Button;

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public setActionButtonClickable(Z)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/EmptyPage;->mActionButton:Landroid/widget/Button;

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setClickable(Z)V

    return-void
.end method

.method public setActionButtonText(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/EmptyPage;->mActionButton:Landroid/widget/Button;

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setText(I)V

    return-void
.end method

.method public setActionButtonText(Ljava/lang/CharSequence;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/EmptyPage;->mActionButton:Landroid/widget/Button;

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public setActionButtonVisible(Z)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/EmptyPage;->mActionButton:Landroid/widget/Button;

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    const/4 p1, 0x4

    :goto_0
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setVisibility(I)V

    return-void
.end method

.method public setBigTitle(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/EmptyPage;->mBigTitle:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    return-void
.end method

.method public setBigTitle(Ljava/lang/CharSequence;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/EmptyPage;->mBigTitle:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public setDescription(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/EmptyPage;->mDescription:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    return-void
.end method

.method public setDescription(Ljava/lang/CharSequence;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/EmptyPage;->mDescription:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public setIcon(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/EmptyPage;->mIcon:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    return-void
.end method

.method public setIcon(Landroid/graphics/drawable/Drawable;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/EmptyPage;->mIcon:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public setOnActionButtonClickListener(Landroid/view/View$OnClickListener;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/EmptyPage;->mActionButton:Landroid/widget/Button;

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public setTitle(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/EmptyPage;->mTitle:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    return-void
.end method

.method public setTitle(Ljava/lang/CharSequence;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/EmptyPage;->mTitle:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method
