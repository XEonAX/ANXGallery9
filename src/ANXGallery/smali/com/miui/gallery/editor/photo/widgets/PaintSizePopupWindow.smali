.class public Lcom/miui/gallery/editor/photo/widgets/PaintSizePopupWindow;
.super Landroid/widget/PopupWindow;
.source "PaintSizePopupWindow.java"


# instance fields
.field private mAnimatorUpdateListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

.field private mPaintView:Lcom/miui/gallery/editor/photo/widgets/PaintSizeView;

.field private mValueAnimator:Landroid/animation/ValueAnimator;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/widgets/PaintSizePopupWindow;->getCustomView(Landroid/content/Context;)Landroid/view/View;

    move-result-object v0

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/widgets/PaintSizePopupWindow;->getCustomWidth(Landroid/content/Context;)I

    move-result v1

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/widgets/PaintSizePopupWindow;->getCustomHeight(Landroid/content/Context;)I

    move-result v2

    invoke-direct {p0, v0, v1, v2}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;II)V

    new-instance v0, Lcom/miui/gallery/editor/photo/widgets/PaintSizePopupWindow$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/widgets/PaintSizePopupWindow$1;-><init>(Lcom/miui/gallery/editor/photo/widgets/PaintSizePopupWindow;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/PaintSizePopupWindow;->mAnimatorUpdateListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/widgets/PaintSizePopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    const v0, 0x7f1100b2

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/widgets/PaintSizePopupWindow;->setAnimationStyle(I)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/widgets/PaintSizePopupWindow;->getContentView()Landroid/view/View;

    move-result-object v0

    const v1, 0x7f09020a

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/widgets/PaintSizeView;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/PaintSizePopupWindow;->mPaintView:Lcom/miui/gallery/editor/photo/widgets/PaintSizeView;

    const/4 v0, 0x2

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/PaintSizePopupWindow;->mValueAnimator:Landroid/animation/ValueAnimator;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/PaintSizePopupWindow;->mValueAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v1, 0x7f0a0024

    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p1

    int-to-long v1, p1

    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/PaintSizePopupWindow;->mValueAnimator:Landroid/animation/ValueAnimator;

    new-instance v0, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v0}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/PaintSizePopupWindow;->mValueAnimator:Landroid/animation/ValueAnimator;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/PaintSizePopupWindow;->mAnimatorUpdateListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    return-void

    nop

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private static getCustomHeight(Landroid/content/Context;)I
    .locals 1

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const v0, 0x7f060304

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p0

    return p0
.end method

.method private static getCustomView(Landroid/content/Context;)Landroid/view/View;
    .locals 2

    const v0, 0x7f0b00e1

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method private static getCustomWidth(Landroid/content/Context;)I
    .locals 1

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const v0, 0x7f060304

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p0

    return p0
.end method


# virtual methods
.method public dismiss()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/PaintSizePopupWindow;->mValueAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    invoke-super {p0}, Landroid/widget/PopupWindow;->dismiss()V

    return-void
.end method

.method public setPaintSize(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/PaintSizePopupWindow;->mPaintView:Lcom/miui/gallery/editor/photo/widgets/PaintSizeView;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/widgets/PaintSizeView;->setDiameter(I)V

    return-void
.end method

.method public showAtLocation(Landroid/view/View;III)V
    .locals 0

    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/widgets/PaintSizePopupWindow;->getContentView()Landroid/view/View;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/view/View;->setAlpha(F)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/PaintSizePopupWindow;->mValueAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->cancel()V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/PaintSizePopupWindow;->mValueAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    return-void
.end method
