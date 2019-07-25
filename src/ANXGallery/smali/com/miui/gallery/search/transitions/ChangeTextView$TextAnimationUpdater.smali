.class Lcom/miui/gallery/search/transitions/ChangeTextView$TextAnimationUpdater;
.super Ljava/lang/Object;
.source "ChangeTextView.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/search/transitions/ChangeTextView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "TextAnimationUpdater"
.end annotation


# instance fields
.field private final mEnd:Lcom/miui/gallery/search/transitions/ChangeTextView$ValueHolder;

.field private mInterpolator:Landroid/view/animation/Interpolator;

.field private mIsEndEmpty:Z

.field private mIsStartEmpty:Z

.field private final mStart:Lcom/miui/gallery/search/transitions/ChangeTextView$ValueHolder;

.field private final mTextView:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/widget/TextView;Lcom/miui/gallery/search/transitions/ChangeTextView$ValueHolder;Lcom/miui/gallery/search/transitions/ChangeTextView$ValueHolder;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/search/transitions/ChangeTextView$TextAnimationUpdater;->mTextView:Landroid/widget/TextView;

    iput-object p2, p0, Lcom/miui/gallery/search/transitions/ChangeTextView$TextAnimationUpdater;->mStart:Lcom/miui/gallery/search/transitions/ChangeTextView$ValueHolder;

    iput-object p3, p0, Lcom/miui/gallery/search/transitions/ChangeTextView$TextAnimationUpdater;->mEnd:Lcom/miui/gallery/search/transitions/ChangeTextView$ValueHolder;

    iget-object p1, p0, Lcom/miui/gallery/search/transitions/ChangeTextView$TextAnimationUpdater;->mStart:Lcom/miui/gallery/search/transitions/ChangeTextView$ValueHolder;

    iget-object p1, p1, Lcom/miui/gallery/search/transitions/ChangeTextView$ValueHolder;->hint:Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    const/4 p2, 0x1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/search/transitions/ChangeTextView$TextAnimationUpdater;->mStart:Lcom/miui/gallery/search/transitions/ChangeTextView$ValueHolder;

    iget-object p1, p1, Lcom/miui/gallery/search/transitions/ChangeTextView$ValueHolder;->text:Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_0

    iput-boolean p2, p0, Lcom/miui/gallery/search/transitions/ChangeTextView$TextAnimationUpdater;->mIsStartEmpty:Z

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/search/transitions/ChangeTextView$TextAnimationUpdater;->mEnd:Lcom/miui/gallery/search/transitions/ChangeTextView$ValueHolder;

    iget-object p1, p1, Lcom/miui/gallery/search/transitions/ChangeTextView$ValueHolder;->hint:Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/search/transitions/ChangeTextView$TextAnimationUpdater;->mEnd:Lcom/miui/gallery/search/transitions/ChangeTextView$ValueHolder;

    iget-object p1, p1, Lcom/miui/gallery/search/transitions/ChangeTextView$ValueHolder;->text:Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_1

    iput-boolean p2, p0, Lcom/miui/gallery/search/transitions/ChangeTextView$TextAnimationUpdater;->mIsEndEmpty:Z

    :cond_1
    return-void
.end method


# virtual methods
.method public getInterpolator()Landroid/view/animation/Interpolator;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/transitions/ChangeTextView$TextAnimationUpdater;->mInterpolator:Landroid/view/animation/Interpolator;

    if-nez v0, :cond_4

    iget-boolean v0, p0, Lcom/miui/gallery/search/transitions/ChangeTextView$TextAnimationUpdater;->mIsStartEmpty:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/miui/gallery/search/transitions/ChangeTextView$TextAnimationUpdater;->mIsEndEmpty:Z

    if-nez v0, :cond_1

    :cond_0
    iget-boolean v0, p0, Lcom/miui/gallery/search/transitions/ChangeTextView$TextAnimationUpdater;->mIsStartEmpty:Z

    if-nez v0, :cond_2

    iget-boolean v0, p0, Lcom/miui/gallery/search/transitions/ChangeTextView$TextAnimationUpdater;->mIsEndEmpty:Z

    if-nez v0, :cond_2

    :cond_1
    new-instance v0, Landroid/view/animation/LinearInterpolator;

    invoke-direct {v0}, Landroid/view/animation/LinearInterpolator;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/search/transitions/ChangeTextView$TextAnimationUpdater;->mInterpolator:Landroid/view/animation/Interpolator;

    goto :goto_0

    :cond_2
    iget-boolean v0, p0, Lcom/miui/gallery/search/transitions/ChangeTextView$TextAnimationUpdater;->mIsStartEmpty:Z

    if-eqz v0, :cond_3

    new-instance v0, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v0}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/search/transitions/ChangeTextView$TextAnimationUpdater;->mInterpolator:Landroid/view/animation/Interpolator;

    goto :goto_0

    :cond_3
    new-instance v0, Landroid/view/animation/AccelerateInterpolator;

    invoke-direct {v0}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/search/transitions/ChangeTextView$TextAnimationUpdater;->mInterpolator:Landroid/view/animation/Interpolator;

    :cond_4
    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/search/transitions/ChangeTextView$TextAnimationUpdater;->mInterpolator:Landroid/view/animation/Interpolator;

    return-object v0
.end method

.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 4

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    if-nez p1, :cond_0

    return-void

    :cond_0
    const/high16 v0, 0x3f000000    # 0.5f

    iget-boolean v1, p0, Lcom/miui/gallery/search/transitions/ChangeTextView$TextAnimationUpdater;->mIsStartEmpty:Z

    if-eqz v1, :cond_1

    iget-boolean v1, p0, Lcom/miui/gallery/search/transitions/ChangeTextView$TextAnimationUpdater;->mIsEndEmpty:Z

    if-eqz v1, :cond_1

    return-void

    :cond_1
    iget-boolean v1, p0, Lcom/miui/gallery/search/transitions/ChangeTextView$TextAnimationUpdater;->mIsStartEmpty:Z

    if-eqz v1, :cond_2

    const v0, 0x3c23d70a    # 0.01f

    goto :goto_0

    :cond_2
    iget-boolean v1, p0, Lcom/miui/gallery/search/transitions/ChangeTextView$TextAnimationUpdater;->mIsEndEmpty:Z

    if-eqz v1, :cond_3

    const v0, 0x3f7d70a4    # 0.99f

    :cond_3
    :goto_0
    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    cmpg-float v1, v1, v0

    if-gtz v1, :cond_4

    const/4 v1, 0x1

    goto :goto_1

    :cond_4
    const/4 v1, 0x0

    :goto_1
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    sub-float/2addr p1, v0

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    if-eqz v1, :cond_5

    goto :goto_2

    :cond_5
    const/high16 v2, 0x3f800000    # 1.0f

    sub-float v0, v2, v0

    :goto_2
    div-float/2addr p1, v0

    if-eqz v1, :cond_6

    iget-object v0, p0, Lcom/miui/gallery/search/transitions/ChangeTextView$TextAnimationUpdater;->mStart:Lcom/miui/gallery/search/transitions/ChangeTextView$ValueHolder;

    iget-object v0, v0, Lcom/miui/gallery/search/transitions/ChangeTextView$ValueHolder;->text:Ljava/lang/String;

    iget-object v1, p0, Lcom/miui/gallery/search/transitions/ChangeTextView$TextAnimationUpdater;->mStart:Lcom/miui/gallery/search/transitions/ChangeTextView$ValueHolder;

    iget-object v1, v1, Lcom/miui/gallery/search/transitions/ChangeTextView$ValueHolder;->hint:Ljava/lang/String;

    iget-object v2, p0, Lcom/miui/gallery/search/transitions/ChangeTextView$TextAnimationUpdater;->mStart:Lcom/miui/gallery/search/transitions/ChangeTextView$ValueHolder;

    iget v2, v2, Lcom/miui/gallery/search/transitions/ChangeTextView$ValueHolder;->hintColor:I

    invoke-static {p1, v2}, Lcom/miui/gallery/search/transitions/ChangeTextView;->access$000(FI)I

    move-result v2

    iget-object v3, p0, Lcom/miui/gallery/search/transitions/ChangeTextView$TextAnimationUpdater;->mStart:Lcom/miui/gallery/search/transitions/ChangeTextView$ValueHolder;

    iget v3, v3, Lcom/miui/gallery/search/transitions/ChangeTextView$ValueHolder;->textColor:I

    invoke-static {p1, v3}, Lcom/miui/gallery/search/transitions/ChangeTextView;->access$000(FI)I

    move-result p1

    goto :goto_3

    :cond_6
    iget-object v0, p0, Lcom/miui/gallery/search/transitions/ChangeTextView$TextAnimationUpdater;->mEnd:Lcom/miui/gallery/search/transitions/ChangeTextView$ValueHolder;

    iget-object v0, v0, Lcom/miui/gallery/search/transitions/ChangeTextView$ValueHolder;->text:Ljava/lang/String;

    iget-object v1, p0, Lcom/miui/gallery/search/transitions/ChangeTextView$TextAnimationUpdater;->mEnd:Lcom/miui/gallery/search/transitions/ChangeTextView$ValueHolder;

    iget-object v1, v1, Lcom/miui/gallery/search/transitions/ChangeTextView$ValueHolder;->hint:Ljava/lang/String;

    iget-object v2, p0, Lcom/miui/gallery/search/transitions/ChangeTextView$TextAnimationUpdater;->mEnd:Lcom/miui/gallery/search/transitions/ChangeTextView$ValueHolder;

    iget v2, v2, Lcom/miui/gallery/search/transitions/ChangeTextView$ValueHolder;->hintColor:I

    invoke-static {p1, v2}, Lcom/miui/gallery/search/transitions/ChangeTextView;->access$000(FI)I

    move-result v2

    iget-object v3, p0, Lcom/miui/gallery/search/transitions/ChangeTextView$TextAnimationUpdater;->mEnd:Lcom/miui/gallery/search/transitions/ChangeTextView$ValueHolder;

    iget v3, v3, Lcom/miui/gallery/search/transitions/ChangeTextView$ValueHolder;->textColor:I

    invoke-static {p1, v3}, Lcom/miui/gallery/search/transitions/ChangeTextView;->access$000(FI)I

    move-result p1

    :goto_3
    iget-object v3, p0, Lcom/miui/gallery/search/transitions/ChangeTextView$TextAnimationUpdater;->mTextView:Landroid/widget/TextView;

    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/miui/gallery/search/transitions/ChangeTextView$TextAnimationUpdater;->mTextView:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/miui/gallery/search/transitions/ChangeTextView$TextAnimationUpdater;->mTextView:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setHintTextColor(I)V

    iget-object v0, p0, Lcom/miui/gallery/search/transitions/ChangeTextView$TextAnimationUpdater;->mTextView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    return-void
.end method
