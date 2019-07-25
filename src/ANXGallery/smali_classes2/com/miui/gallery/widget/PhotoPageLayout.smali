.class public Lcom/miui/gallery/widget/PhotoPageLayout;
.super Landroid/widget/FrameLayout;
.source "PhotoPageLayout.java"

# interfaces
.implements Lcom/miui/gallery/widget/IMultiThemeView;


# static fields
.field private static final DEFAULT_THEME:Lcom/miui/gallery/widget/IMultiThemeView$Theme;


# instance fields
.field private mAnimFinalValue:F

.field private mBackgroundAlpha:F

.field private mBackgroundColor:I

.field private mColorAnim:Landroid/animation/ValueAnimator;

.field private mPreBackgroundAlpha:F

.field private mPreBackgroundColor:I

.field private mTheme:Lcom/miui/gallery/widget/IMultiThemeView$Theme;

.field private mTransition:Lcom/miui/gallery/widget/IMultiThemeView$ThemeTransition;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    sget-object v0, Lcom/miui/gallery/widget/IMultiThemeView$Theme;->LIGHT:Lcom/miui/gallery/widget/IMultiThemeView$Theme;

    sput-object v0, Lcom/miui/gallery/widget/PhotoPageLayout;->DEFAULT_THEME:Lcom/miui/gallery/widget/IMultiThemeView$Theme;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/widget/PhotoPageLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/miui/gallery/widget/PhotoPageLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    invoke-direct {p0}, Lcom/miui/gallery/widget/PhotoPageLayout;->init()V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/widget/PhotoPageLayout;)Lcom/miui/gallery/widget/IMultiThemeView$ThemeTransition;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/widget/PhotoPageLayout;->mTransition:Lcom/miui/gallery/widget/IMultiThemeView$ThemeTransition;

    return-object p0
.end method

.method static synthetic access$102(Lcom/miui/gallery/widget/PhotoPageLayout;F)F
    .locals 0

    iput p1, p0, Lcom/miui/gallery/widget/PhotoPageLayout;->mBackgroundAlpha:F

    return p1
.end method

.method static synthetic access$202(Lcom/miui/gallery/widget/PhotoPageLayout;F)F
    .locals 0

    iput p1, p0, Lcom/miui/gallery/widget/PhotoPageLayout;->mPreBackgroundAlpha:F

    return p1
.end method

.method private cancelBackgroundTransition()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/widget/PhotoPageLayout;->isBackColorTransiting()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/PhotoPageLayout;->mColorAnim:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    :cond_0
    return-void
.end method

.method private drawBackground(Landroid/graphics/Canvas;)V
    .locals 6

    invoke-direct {p0}, Lcom/miui/gallery/widget/PhotoPageLayout;->isBackColorTransiting()Z

    move-result v0

    if-eqz v0, :cond_2

    iget v0, p0, Lcom/miui/gallery/widget/PhotoPageLayout;->mPreBackgroundColor:I

    iget v1, p0, Lcom/miui/gallery/widget/PhotoPageLayout;->mPreBackgroundAlpha:F

    iget v2, p0, Lcom/miui/gallery/widget/PhotoPageLayout;->mBackgroundColor:I

    iget v3, p0, Lcom/miui/gallery/widget/PhotoPageLayout;->mBackgroundAlpha:F

    iget-object v4, p0, Lcom/miui/gallery/widget/PhotoPageLayout;->mTransition:Lcom/miui/gallery/widget/IMultiThemeView$ThemeTransition;

    sget-object v5, Lcom/miui/gallery/widget/IMultiThemeView$ThemeTransition;->FADE_OUT:Lcom/miui/gallery/widget/IMultiThemeView$ThemeTransition;

    if-ne v4, v5, :cond_0

    iget v0, p0, Lcom/miui/gallery/widget/PhotoPageLayout;->mBackgroundColor:I

    iget v1, p0, Lcom/miui/gallery/widget/PhotoPageLayout;->mBackgroundAlpha:F

    iget v2, p0, Lcom/miui/gallery/widget/PhotoPageLayout;->mPreBackgroundColor:I

    iget v3, p0, Lcom/miui/gallery/widget/PhotoPageLayout;->mPreBackgroundAlpha:F

    :cond_0
    const/4 v4, 0x0

    cmpl-float v4, v1, v4

    if-lez v4, :cond_1

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    invoke-direct {p0, p1, v0, v1}, Lcom/miui/gallery/widget/PhotoPageLayout;->drawColor(Landroid/graphics/Canvas;IF)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    :cond_1
    invoke-direct {p0, p1, v2, v3}, Lcom/miui/gallery/widget/PhotoPageLayout;->drawColor(Landroid/graphics/Canvas;IF)V

    goto :goto_0

    :cond_2
    iget v0, p0, Lcom/miui/gallery/widget/PhotoPageLayout;->mBackgroundColor:I

    iget v1, p0, Lcom/miui/gallery/widget/PhotoPageLayout;->mBackgroundAlpha:F

    invoke-direct {p0, p1, v0, v1}, Lcom/miui/gallery/widget/PhotoPageLayout;->drawColor(Landroid/graphics/Canvas;IF)V

    :goto_0
    return-void
.end method

.method private drawColor(Landroid/graphics/Canvas;IF)V
    .locals 1

    const/4 v0, 0x0

    cmpl-float v0, p3, v0

    if-lez v0, :cond_0

    invoke-direct {p0, p2, p3}, Lcom/miui/gallery/widget/PhotoPageLayout;->genColor(IF)I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/graphics/Canvas;->drawColor(I)V

    :cond_0
    return-void
.end method

.method private genColor(IF)I
    .locals 2

    const/high16 v0, 0x437f0000    # 255.0f

    mul-float p2, p2, v0

    float-to-int p2, p2

    invoke-static {p1}, Landroid/graphics/Color;->red(I)I

    move-result v0

    invoke-static {p1}, Landroid/graphics/Color;->green(I)I

    move-result v1

    invoke-static {p1}, Landroid/graphics/Color;->blue(I)I

    move-result p1

    invoke-static {p2, v0, v1, p1}, Landroid/graphics/Color;->argb(IIII)I

    move-result p1

    return p1
.end method

.method private getBackgroundColor(Lcom/miui/gallery/widget/IMultiThemeView$Theme;)I
    .locals 1

    sget-object v0, Lcom/miui/gallery/widget/PhotoPageLayout$2;->$SwitchMap$com$miui$gallery$widget$IMultiThemeView$Theme:[I

    invoke-virtual {p1}, Lcom/miui/gallery/widget/IMultiThemeView$Theme;->ordinal()I

    move-result p1

    aget p1, v0, p1

    packed-switch p1, :pswitch_data_0

    const/4 p1, 0x0

    return p1

    :pswitch_0
    invoke-virtual {p0}, Lcom/miui/gallery/widget/PhotoPageLayout;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f050112

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getColor(I)I

    move-result p1

    return p1

    :pswitch_1
    invoke-virtual {p0}, Lcom/miui/gallery/widget/PhotoPageLayout;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f05010f

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getColor(I)I

    move-result p1

    return p1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private getDefaultTransitionInterpolator(Lcom/miui/gallery/widget/IMultiThemeView$ThemeTransition;)Landroid/view/animation/Interpolator;
    .locals 1

    sget-object v0, Lcom/miui/gallery/widget/PhotoPageLayout$2;->$SwitchMap$com$miui$gallery$widget$IMultiThemeView$ThemeTransition:[I

    invoke-virtual {p1}, Lcom/miui/gallery/widget/IMultiThemeView$ThemeTransition;->ordinal()I

    move-result p1

    aget p1, v0, p1

    packed-switch p1, :pswitch_data_0

    const/4 p1, 0x0

    return-object p1

    :pswitch_0
    new-instance p1, Lmiui/view/animation/SineEaseInOutInterpolator;

    invoke-direct {p1}, Lmiui/view/animation/SineEaseInOutInterpolator;-><init>()V

    return-object p1

    :pswitch_1
    new-instance p1, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {p1}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    return-object p1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private getDefaultTransitionTime(Lcom/miui/gallery/widget/IMultiThemeView$ThemeTransition;)J
    .locals 2

    sget-object v0, Lcom/miui/gallery/widget/PhotoPageLayout$2;->$SwitchMap$com$miui$gallery$widget$IMultiThemeView$ThemeTransition:[I

    invoke-virtual {p1}, Lcom/miui/gallery/widget/IMultiThemeView$ThemeTransition;->ordinal()I

    move-result p1

    aget p1, v0, p1

    packed-switch p1, :pswitch_data_0

    const-wide/16 v0, 0x0

    return-wide v0

    :pswitch_0
    invoke-virtual {p0}, Lcom/miui/gallery/widget/PhotoPageLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f0a0029

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p1

    int-to-long v0, p1

    return-wide v0

    :pswitch_1
    invoke-virtual {p0}, Lcom/miui/gallery/widget/PhotoPageLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f0a0027

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p1

    int-to-long v0, p1

    return-wide v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private init()V
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/widget/PhotoPageLayout;->setWillNotDraw(Z)V

    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/miui/gallery/widget/PhotoPageLayout;->mBackgroundAlpha:F

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/widget/PhotoPageLayout;->mPreBackgroundAlpha:F

    sget-object v0, Lcom/miui/gallery/widget/PhotoPageLayout;->DEFAULT_THEME:Lcom/miui/gallery/widget/IMultiThemeView$Theme;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/widget/PhotoPageLayout;->setTheme(Lcom/miui/gallery/widget/IMultiThemeView$Theme;)V

    return-void
.end method

.method private isBackColorTransiting()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/PhotoPageLayout;->mColorAnim:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/PhotoPageLayout;->mColorAnim:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/PhotoPageLayout;->drawBackground(Landroid/graphics/Canvas;)V

    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onDraw(Landroid/graphics/Canvas;)V

    return-void
.end method

.method public setBackgroundAlpha(F)V
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/widget/PhotoPageLayout;->isBackColorTransiting()Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/miui/gallery/widget/PhotoPageLayout;->mAnimFinalValue:F

    invoke-static {p1, v0}, Lcom/miui/gallery/util/MiscUtil;->floatEquals(FF)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "PhotoPageLayout"

    const-string v1, "color transiting while set alpha %s"

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/widget/PhotoPageLayout;->cancelBackgroundTransition()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/widget/PhotoPageLayout;->mPreBackgroundAlpha:F

    iget v0, p0, Lcom/miui/gallery/widget/PhotoPageLayout;->mBackgroundAlpha:F

    invoke-static {v0, p1}, Lcom/miui/gallery/util/MiscUtil;->floatEquals(FF)Z

    move-result v0

    if-nez v0, :cond_1

    iput p1, p0, Lcom/miui/gallery/widget/PhotoPageLayout;->mBackgroundAlpha:F

    invoke-virtual {p0}, Lcom/miui/gallery/widget/PhotoPageLayout;->invalidate()V

    :cond_1
    return-void
.end method

.method public setTheme(Lcom/miui/gallery/widget/IMultiThemeView$Theme;)V
    .locals 1

    sget-object v0, Lcom/miui/gallery/widget/IMultiThemeView$ThemeTransition;->NONE:Lcom/miui/gallery/widget/IMultiThemeView$ThemeTransition;

    invoke-virtual {p0, p1, v0}, Lcom/miui/gallery/widget/PhotoPageLayout;->setTheme(Lcom/miui/gallery/widget/IMultiThemeView$Theme;Lcom/miui/gallery/widget/IMultiThemeView$ThemeTransition;)V

    return-void
.end method

.method public setTheme(Lcom/miui/gallery/widget/IMultiThemeView$Theme;Lcom/miui/gallery/widget/IMultiThemeView$ThemeTransition;)V
    .locals 6

    invoke-direct {p0, p2}, Lcom/miui/gallery/widget/PhotoPageLayout;->getDefaultTransitionInterpolator(Lcom/miui/gallery/widget/IMultiThemeView$ThemeTransition;)Landroid/view/animation/Interpolator;

    move-result-object v3

    invoke-direct {p0, p2}, Lcom/miui/gallery/widget/PhotoPageLayout;->getDefaultTransitionTime(Lcom/miui/gallery/widget/IMultiThemeView$ThemeTransition;)J

    move-result-wide v4

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-virtual/range {v0 .. v5}, Lcom/miui/gallery/widget/PhotoPageLayout;->setTheme(Lcom/miui/gallery/widget/IMultiThemeView$Theme;Lcom/miui/gallery/widget/IMultiThemeView$ThemeTransition;Landroid/view/animation/Interpolator;J)V

    return-void
.end method

.method public setTheme(Lcom/miui/gallery/widget/IMultiThemeView$Theme;Lcom/miui/gallery/widget/IMultiThemeView$ThemeTransition;Landroid/view/animation/Interpolator;J)V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/widget/PhotoPageLayout;->mTheme:Lcom/miui/gallery/widget/IMultiThemeView$Theme;

    if-ne v0, p1, :cond_0

    return-void

    :cond_0
    const-string v0, "PhotoPageLayout"

    const-string v1, "setTheme %s -> %s"

    iget-object v2, p0, Lcom/miui/gallery/widget/PhotoPageLayout;->mTheme:Lcom/miui/gallery/widget/IMultiThemeView$Theme;

    invoke-static {v0, v1, v2, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    iput-object p1, p0, Lcom/miui/gallery/widget/PhotoPageLayout;->mTheme:Lcom/miui/gallery/widget/IMultiThemeView$Theme;

    iget v0, p0, Lcom/miui/gallery/widget/PhotoPageLayout;->mBackgroundColor:I

    iput v0, p0, Lcom/miui/gallery/widget/PhotoPageLayout;->mPreBackgroundColor:I

    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/PhotoPageLayout;->getBackgroundColor(Lcom/miui/gallery/widget/IMultiThemeView$Theme;)I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/widget/PhotoPageLayout;->mBackgroundColor:I

    iput-object p2, p0, Lcom/miui/gallery/widget/PhotoPageLayout;->mTransition:Lcom/miui/gallery/widget/IMultiThemeView$ThemeTransition;

    sget-object p1, Lcom/miui/gallery/widget/PhotoPageLayout$2;->$SwitchMap$com$miui$gallery$widget$IMultiThemeView$ThemeTransition:[I

    invoke-virtual {p2}, Lcom/miui/gallery/widget/IMultiThemeView$ThemeTransition;->ordinal()I

    move-result v0

    aget p1, p1, v0

    const/4 v0, 0x0

    const/high16 v1, 0x3f800000    # 1.0f

    packed-switch p1, :pswitch_data_0

    iput v0, p0, Lcom/miui/gallery/widget/PhotoPageLayout;->mPreBackgroundAlpha:F

    iput v1, p0, Lcom/miui/gallery/widget/PhotoPageLayout;->mBackgroundAlpha:F

    iput v1, p0, Lcom/miui/gallery/widget/PhotoPageLayout;->mAnimFinalValue:F

    const/high16 p1, 0x3f800000    # 1.0f

    const/high16 v0, 0x3f800000    # 1.0f

    goto :goto_2

    :pswitch_0
    invoke-direct {p0}, Lcom/miui/gallery/widget/PhotoPageLayout;->isBackColorTransiting()Z

    move-result p1

    if-eqz p1, :cond_1

    iget p1, p0, Lcom/miui/gallery/widget/PhotoPageLayout;->mAnimFinalValue:F

    iput p1, p0, Lcom/miui/gallery/widget/PhotoPageLayout;->mBackgroundAlpha:F

    goto :goto_0

    :cond_1
    iget p1, p0, Lcom/miui/gallery/widget/PhotoPageLayout;->mBackgroundAlpha:F

    iput p1, p0, Lcom/miui/gallery/widget/PhotoPageLayout;->mAnimFinalValue:F

    :goto_0
    iget p1, p0, Lcom/miui/gallery/widget/PhotoPageLayout;->mAnimFinalValue:F

    iput p1, p0, Lcom/miui/gallery/widget/PhotoPageLayout;->mPreBackgroundAlpha:F

    goto :goto_2

    :pswitch_1
    iget p1, p0, Lcom/miui/gallery/widget/PhotoPageLayout;->mBackgroundAlpha:F

    iput p1, p0, Lcom/miui/gallery/widget/PhotoPageLayout;->mPreBackgroundAlpha:F

    iput v0, p0, Lcom/miui/gallery/widget/PhotoPageLayout;->mBackgroundAlpha:F

    invoke-direct {p0}, Lcom/miui/gallery/widget/PhotoPageLayout;->isBackColorTransiting()Z

    move-result p1

    if-eqz p1, :cond_2

    iget p1, p0, Lcom/miui/gallery/widget/PhotoPageLayout;->mAnimFinalValue:F

    iput p1, p0, Lcom/miui/gallery/widget/PhotoPageLayout;->mPreBackgroundAlpha:F

    goto :goto_1

    :cond_2
    iget p1, p0, Lcom/miui/gallery/widget/PhotoPageLayout;->mPreBackgroundAlpha:F

    iput p1, p0, Lcom/miui/gallery/widget/PhotoPageLayout;->mAnimFinalValue:F

    :goto_1
    iget p1, p0, Lcom/miui/gallery/widget/PhotoPageLayout;->mAnimFinalValue:F

    move v0, p1

    const/4 p1, 0x0

    :goto_2
    invoke-static {p1, v0}, Lcom/miui/gallery/util/MiscUtil;->floatEquals(FF)Z

    move-result v1

    if-nez v1, :cond_5

    invoke-direct {p0}, Lcom/miui/gallery/widget/PhotoPageLayout;->cancelBackgroundTransition()V

    const-wide/16 v1, 0x0

    cmp-long v3, p4, v1

    if-lez v3, :cond_3

    goto :goto_3

    :cond_3
    invoke-direct {p0, p2}, Lcom/miui/gallery/widget/PhotoPageLayout;->getDefaultTransitionTime(Lcom/miui/gallery/widget/IMultiThemeView$ThemeTransition;)J

    move-result-wide p4

    :goto_3
    if-eqz p3, :cond_4

    goto :goto_4

    :cond_4
    invoke-direct {p0, p2}, Lcom/miui/gallery/widget/PhotoPageLayout;->getDefaultTransitionInterpolator(Lcom/miui/gallery/widget/IMultiThemeView$ThemeTransition;)Landroid/view/animation/Interpolator;

    move-result-object p3

    :goto_4
    const/4 p2, 0x2

    new-array p2, p2, [F

    const/4 v1, 0x0

    aput p1, p2, v1

    const/4 p1, 0x1

    aput v0, p2, p1

    invoke-static {p2}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object p1

    invoke-virtual {p1, p4, p5}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/widget/PhotoPageLayout;->mColorAnim:Landroid/animation/ValueAnimator;

    iget-object p1, p0, Lcom/miui/gallery/widget/PhotoPageLayout;->mColorAnim:Landroid/animation/ValueAnimator;

    invoke-virtual {p1, p3}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    iget-object p1, p0, Lcom/miui/gallery/widget/PhotoPageLayout;->mColorAnim:Landroid/animation/ValueAnimator;

    new-instance p2, Lcom/miui/gallery/widget/PhotoPageLayout$1;

    invoke-direct {p2, p0}, Lcom/miui/gallery/widget/PhotoPageLayout$1;-><init>(Lcom/miui/gallery/widget/PhotoPageLayout;)V

    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    iget-object p1, p0, Lcom/miui/gallery/widget/PhotoPageLayout;->mColorAnim:Landroid/animation/ValueAnimator;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    goto :goto_5

    :cond_5
    invoke-virtual {p0}, Lcom/miui/gallery/widget/PhotoPageLayout;->invalidate()V

    :goto_5
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
