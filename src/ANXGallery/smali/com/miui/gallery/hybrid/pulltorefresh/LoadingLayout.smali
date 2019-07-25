.class public abstract Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;
.super Landroid/widget/FrameLayout;
.source "LoadingLayout.java"

# interfaces
.implements Lcom/miui/gallery/hybrid/pulltorefresh/ILoadingLayout;


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "ViewConstructor"
    }
.end annotation


# static fields
.field static final ANIMATION_INTERPOLATOR:Landroid/view/animation/Interpolator;


# instance fields
.field protected final mHeaderImage:Landroid/widget/ImageView;

.field protected final mHeaderProgress:Landroid/widget/ProgressBar;

.field private final mHeaderText:Landroid/widget/TextView;

.field private mInnerLayout:Landroid/view/View;

.field protected final mMode:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

.field private mPullLabel:Ljava/lang/CharSequence;

.field private mRefreshingLabel:Ljava/lang/CharSequence;

.field private mReleaseLabel:Ljava/lang/CharSequence;

.field protected final mScrollDirection:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Orientation;

.field private final mSubHeaderText:Landroid/widget/TextView;

.field private mUseIntrinsicAnimation:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Landroid/view/animation/LinearInterpolator;

    invoke-direct {v0}, Landroid/view/animation/LinearInterpolator;-><init>()V

    sput-object v0, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->ANIMATION_INTERPOLATOR:Landroid/view/animation/Interpolator;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Orientation;Landroid/content/res/TypedArray;)V
    .locals 3

    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->mMode:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    iput-object p3, p0, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->mScrollDirection:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Orientation;

    sget-object v0, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout$1;->$SwitchMap$com$miui$gallery$hybrid$pulltorefresh$PullToRefreshBase$Orientation:[I

    invoke-virtual {p3}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Orientation;->ordinal()I

    move-result v1

    aget v0, v0, v1

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0b0094

    invoke-virtual {v0, v1, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    const v0, 0x7f090135

    invoke-virtual {p0, v0}, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->mInnerLayout:Landroid/view/View;

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->mInnerLayout:Landroid/view/View;

    const v1, 0x7f090241

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->mHeaderText:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->mInnerLayout:Landroid/view/View;

    const v1, 0x7f09023f

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->mHeaderProgress:Landroid/widget/ProgressBar;

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->mInnerLayout:Landroid/view/View;

    const v1, 0x7f090240

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->mSubHeaderText:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->mInnerLayout:Landroid/view/View;

    const v1, 0x7f09023e

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->mHeaderImage:Landroid/widget/ImageView;

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->mInnerLayout:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    sget-object v1, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout$1;->$SwitchMap$com$miui$gallery$hybrid$pulltorefresh$PullToRefreshBase$Mode:[I

    invoke-virtual {p2}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->ordinal()I

    move-result v2

    aget v1, v1, v2

    sget-object v1, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Orientation;->VERTICAL:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Orientation;

    const/4 v2, 0x5

    if-ne p3, v1, :cond_0

    const/16 p3, 0x50

    goto :goto_0

    :cond_0
    const/4 p3, 0x5

    :goto_0
    iput p3, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    const p3, 0x7f10041b

    invoke-virtual {p1, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p3

    iput-object p3, p0, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->mPullLabel:Ljava/lang/CharSequence;

    const p3, 0x7f10041c

    invoke-virtual {p1, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p3

    iput-object p3, p0, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->mRefreshingLabel:Ljava/lang/CharSequence;

    const p3, 0x7f10041d

    invoke-virtual {p1, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p3

    iput-object p3, p0, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->mReleaseLabel:Ljava/lang/CharSequence;

    const/4 p3, 0x7

    invoke-virtual {p4, p3}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p4, p3}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p3

    if-eqz p3, :cond_1

    invoke-static {p0, p3}, Lcom/miui/gallery/hybrid/pulltorefresh/ViewCompat;->setBackground(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    :cond_1
    const/16 p3, 0x9

    invoke-virtual {p4, p3}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v0

    if-eqz v0, :cond_2

    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    invoke-virtual {p4, p3, v0}, Landroid/content/res/TypedArray;->getValue(ILandroid/util/TypedValue;)Z

    iget p3, v0, Landroid/util/TypedValue;->data:I

    invoke-direct {p0, p3}, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->setTextAppearance(I)V

    :cond_2
    const/16 p3, 0x13

    invoke-virtual {p4, p3}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v0

    if-eqz v0, :cond_3

    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    invoke-virtual {p4, p3, v0}, Landroid/content/res/TypedArray;->getValue(ILandroid/util/TypedValue;)Z

    iget p3, v0, Landroid/util/TypedValue;->data:I

    invoke-direct {p0, p3}, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->setSubTextAppearance(I)V

    :cond_3
    const/16 p3, 0xa

    invoke-virtual {p4, p3}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-virtual {p4, p3}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object p3

    if-eqz p3, :cond_4

    invoke-direct {p0, p3}, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->setTextColor(Landroid/content/res/ColorStateList;)V

    :cond_4
    const/16 p3, 0x8

    invoke-virtual {p4, p3}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-virtual {p4, p3}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object p3

    if-eqz p3, :cond_5

    invoke-direct {p0, p3}, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->setSubTextColor(Landroid/content/res/ColorStateList;)V

    :cond_5
    const/4 p3, 0x0

    const/4 v0, 0x2

    invoke-virtual {p4, v0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v1

    if-eqz v1, :cond_6

    invoke-virtual {p4, v0}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p3

    :cond_6
    sget-object v1, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout$1;->$SwitchMap$com$miui$gallery$hybrid$pulltorefresh$PullToRefreshBase$Mode:[I

    invoke-virtual {p2}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->ordinal()I

    move-result p2

    aget p2, v1, p2

    if-eq p2, v0, :cond_8

    invoke-virtual {p4, v2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p2

    if-eqz p2, :cond_7

    invoke-virtual {p4, v2}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p3

    goto :goto_1

    :cond_7
    const/4 p2, 0x6

    invoke-virtual {p4, p2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v0

    if-eqz v0, :cond_a

    invoke-virtual {p4, p2}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p3

    goto :goto_1

    :cond_8
    const/4 p2, 0x4

    invoke-virtual {p4, p2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v0

    if-eqz v0, :cond_9

    invoke-virtual {p4, p2}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p3

    goto :goto_1

    :cond_9
    const/4 p2, 0x3

    invoke-virtual {p4, p2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v0

    if-eqz v0, :cond_a

    invoke-virtual {p4, p2}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p3

    :cond_a
    :goto_1
    if-nez p3, :cond_b

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->getDefaultDrawableResId()I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p3

    :cond_b
    invoke-virtual {p0, p3}, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->setLoadingDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->reset()V

    return-void
.end method

.method private setSubHeaderText(Ljava/lang/CharSequence;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->mSubHeaderText:Landroid/widget/TextView;

    if-eqz v0, :cond_1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/16 v1, 0x8

    if-eqz v0, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->mSubHeaderText:Landroid/widget/TextView;

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->mSubHeaderText:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->mSubHeaderText:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->getVisibility()I

    move-result p1

    if-ne v1, p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->mSubHeaderText:Landroid/widget/TextView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    :cond_1
    :goto_0
    return-void
.end method

.method private setSubTextAppearance(I)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->mSubHeaderText:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->mSubHeaderText:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Landroid/widget/TextView;->setTextAppearance(Landroid/content/Context;I)V

    :cond_0
    return-void
.end method

.method private setSubTextColor(Landroid/content/res/ColorStateList;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->mSubHeaderText:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->mSubHeaderText:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    :cond_0
    return-void
.end method

.method private setTextAppearance(I)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->mHeaderText:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->mHeaderText:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Landroid/widget/TextView;->setTextAppearance(Landroid/content/Context;I)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->mSubHeaderText:Landroid/widget/TextView;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->mSubHeaderText:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Landroid/widget/TextView;->setTextAppearance(Landroid/content/Context;I)V

    :cond_1
    return-void
.end method

.method private setTextColor(Landroid/content/res/ColorStateList;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->mHeaderText:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->mHeaderText:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->mSubHeaderText:Landroid/widget/TextView;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->mSubHeaderText:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    :cond_1
    return-void
.end method


# virtual methods
.method public final getContentSize()I
    .locals 2

    sget-object v0, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout$1;->$SwitchMap$com$miui$gallery$hybrid$pulltorefresh$PullToRefreshBase$Orientation:[I

    iget-object v1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->mScrollDirection:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Orientation;

    invoke-virtual {v1}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Orientation;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->mInnerLayout:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v0

    return v0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->mInnerLayout:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v0

    return v0
.end method

.method protected abstract getDefaultDrawableResId()I
.end method

.method protected abstract onLoadingDrawableSet(Landroid/graphics/drawable/Drawable;)V
.end method

.method public final onPull(F)V
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->mUseIntrinsicAnimation:Z

    if-nez v0, :cond_0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->onPullImpl(F)V

    :cond_0
    return-void
.end method

.method protected abstract onPullImpl(F)V
.end method

.method public final pullToRefresh()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->mHeaderText:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->mHeaderText:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->mPullLabel:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->pullToRefreshImpl()V

    return-void
.end method

.method protected abstract pullToRefreshImpl()V
.end method

.method public final refreshing()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->mHeaderText:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->mHeaderText:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->mRefreshingLabel:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    iget-boolean v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->mUseIntrinsicAnimation:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->mHeaderImage:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/AnimationDrawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/AnimationDrawable;->start()V

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->refreshingImpl()V

    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->mSubHeaderText:Landroid/widget/TextView;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->mSubHeaderText:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    :cond_2
    return-void
.end method

.method protected abstract refreshingImpl()V
.end method

.method public final releaseToRefresh()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->mHeaderText:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->mHeaderText:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->mReleaseLabel:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->releaseToRefreshImpl()V

    return-void
.end method

.method protected abstract releaseToRefreshImpl()V
.end method

.method public final reset()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->mHeaderText:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->mHeaderText:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->mPullLabel:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->mHeaderImage:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-boolean v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->mUseIntrinsicAnimation:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->mHeaderImage:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/AnimationDrawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/AnimationDrawable;->stop()V

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->resetImpl()V

    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->mSubHeaderText:Landroid/widget/TextView;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->mSubHeaderText:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->mSubHeaderText:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_1

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->mSubHeaderText:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    :cond_3
    :goto_1
    return-void
.end method

.method protected abstract resetImpl()V
.end method

.method public final setHeight(I)V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->requestLayout()V

    return-void
.end method

.method public setLastUpdatedLabel(Ljava/lang/CharSequence;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->setSubHeaderText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final setLoadingDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->mHeaderImage:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    instance-of v0, p1, Landroid/graphics/drawable/AnimationDrawable;

    iput-boolean v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->mUseIntrinsicAnimation:Z

    invoke-virtual {p0, p1}, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->onLoadingDrawableSet(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public setPullLabel(Ljava/lang/CharSequence;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->mPullLabel:Ljava/lang/CharSequence;

    return-void
.end method

.method public setRefreshingLabel(Ljava/lang/CharSequence;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->mRefreshingLabel:Ljava/lang/CharSequence;

    return-void
.end method

.method public setReleaseLabel(Ljava/lang/CharSequence;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->mReleaseLabel:Ljava/lang/CharSequence;

    return-void
.end method

.method public setTextTypeface(Landroid/graphics/Typeface;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->mHeaderText:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    return-void
.end method

.method public final setWidth(I)V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    invoke-virtual {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->requestLayout()V

    return-void
.end method
