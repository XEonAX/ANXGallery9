.class public Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;
.super Landroid/widget/LinearLayout;
.source "DownloadView.java"


# instance fields
.field private mImageView:Landroid/widget/ImageView;

.field private mRotationAnimal:Landroid/animation/ObjectAnimator;

.field private mTextView:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;->initView(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;->initView(Landroid/content/Context;)V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;)Landroid/widget/ImageView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;->mImageView:Landroid/widget/ImageView;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;Landroid/view/View;Landroid/animation/AnimatorListenerAdapter;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;->hide(Landroid/view/View;Landroid/animation/AnimatorListenerAdapter;)V

    return-void
.end method

.method static synthetic access$200(Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;)Landroid/widget/TextView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;->mTextView:Landroid/widget/TextView;

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;Landroid/view/View;Landroid/animation/AnimatorListenerAdapter;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;->show(Landroid/view/View;Landroid/animation/AnimatorListenerAdapter;)V

    return-void
.end method

.method private doDownloading()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;->mImageView:Landroid/widget/ImageView;

    const v1, 0x7f0700fc

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;->rotation()V

    return-void
.end method

.method private endDownloading()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;->mImageView:Landroid/widget/ImageView;

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView$1;

    invoke-direct {v1, p0}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView$1;-><init>(Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;)V

    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;->hide(Landroid/view/View;Landroid/animation/AnimatorListenerAdapter;)V

    return-void
.end method

.method private hide(Landroid/view/View;Landroid/animation/AnimatorListenerAdapter;)V
    .locals 2

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setScaleX(F)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setScaleY(F)V

    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    const v0, 0x3f19999a    # 0.6f

    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    const-wide/16 v0, 0xfa

    invoke-virtual {p1, v0, v1}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1, p2}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    new-instance p2, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {p2}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    invoke-virtual {p1, p2}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    return-void
.end method

.method private initView(Landroid/content/Context;)V
    .locals 1

    const v0, 0x7f0b00fd

    invoke-static {p1, v0, p0}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    const p1, 0x7f0902e8

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;->mTextView:Landroid/widget/TextView;

    const p1, 0x7f090175

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;->mImageView:Landroid/widget/ImageView;

    return-void
.end method

.method private rotation()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;->mRotationAnimal:Landroid/animation/ObjectAnimator;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;->mRotationAnimal:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->end()V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;->mImageView:Landroid/widget/ImageView;

    const-string v1, "rotation"

    const/4 v2, 0x2

    new-array v2, v2, [F

    fill-array-data v2, :array_0

    invoke-static {v0, v1, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;->mRotationAnimal:Landroid/animation/ObjectAnimator;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;->mRotationAnimal:Landroid/animation/ObjectAnimator;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->setRepeatCount(I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;->mRotationAnimal:Landroid/animation/ObjectAnimator;

    new-instance v1, Landroid/view/animation/LinearInterpolator;

    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;->mRotationAnimal:Landroid/animation/ObjectAnimator;

    const-wide/16 v1, 0x3e8

    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;->mRotationAnimal:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    return-void

    :array_0
    .array-data 4
        0x0
        0x43b40000    # 360.0f
    .end array-data
.end method

.method private show(Landroid/view/View;Landroid/animation/AnimatorListenerAdapter;)V
    .locals 2

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    const v0, 0x3f19999a    # 0.6f

    invoke-virtual {p1, v0}, Landroid/view/View;->setScaleX(F)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setScaleY(F)V

    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    const-wide/16 v0, 0x15e

    invoke-virtual {p1, v0, v1}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1, p2}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    new-instance p2, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {p2}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    invoke-virtual {p1, p2}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    return-void
.end method


# virtual methods
.method public clearAnimator()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;->mRotationAnimal:Landroid/animation/ObjectAnimator;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;->mRotationAnimal:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->end()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;->mRotationAnimal:Landroid/animation/ObjectAnimator;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;->mImageView:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    return-void
.end method

.method public setStateImage(I)V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;->clearAnimator()V

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;->setVisibility(I)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;->mImageView:Landroid/widget/ImageView;

    const v0, 0x7f0700fa

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0

    :pswitch_1
    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;->setVisibility(I)V

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;->doDownloading()V

    goto :goto_0

    :pswitch_2
    const/16 p1, 0x8

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;->setVisibility(I)V

    goto :goto_0

    :cond_0
    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;->setVisibility(I)V

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;->endDownloading()V

    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x11
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public setText(Ljava/lang/CharSequence;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadView;->mTextView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method
