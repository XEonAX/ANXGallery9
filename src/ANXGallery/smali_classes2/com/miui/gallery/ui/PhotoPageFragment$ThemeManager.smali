.class Lcom/miui/gallery/ui/PhotoPageFragment$ThemeManager;
.super Ljava/lang/Object;
.source "PhotoPageFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPageFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ThemeManager"
.end annotation


# instance fields
.field private mHostView:Lcom/miui/gallery/widget/IMultiThemeView;


# direct methods
.method constructor <init>(Lcom/miui/gallery/widget/IMultiThemeView;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ThemeManager;->mHostView:Lcom/miui/gallery/widget/IMultiThemeView;

    return-void
.end method


# virtual methods
.method public setBackgroundAlpha(F)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ThemeManager;->mHostView:Lcom/miui/gallery/widget/IMultiThemeView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ThemeManager;->mHostView:Lcom/miui/gallery/widget/IMultiThemeView;

    invoke-interface {v0, p1}, Lcom/miui/gallery/widget/IMultiThemeView;->setBackgroundAlpha(F)V

    :cond_0
    return-void
.end method

.method public setDarkTheme(ZZ)V
    .locals 7

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ThemeManager;->mHostView:Lcom/miui/gallery/widget/IMultiThemeView;

    if-eqz v0, :cond_3

    if-eqz p2, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ThemeManager;->mHostView:Lcom/miui/gallery/widget/IMultiThemeView;

    sget-object v2, Lcom/miui/gallery/widget/IMultiThemeView$Theme;->DARK:Lcom/miui/gallery/widget/IMultiThemeView$Theme;

    if-eqz p1, :cond_0

    sget-object p1, Lcom/miui/gallery/widget/IMultiThemeView$ThemeTransition;->FADE_OUT:Lcom/miui/gallery/widget/IMultiThemeView$ThemeTransition;

    :goto_0
    move-object v3, p1

    goto :goto_1

    :cond_0
    sget-object p1, Lcom/miui/gallery/widget/IMultiThemeView$ThemeTransition;->NONE:Lcom/miui/gallery/widget/IMultiThemeView$ThemeTransition;

    goto :goto_0

    :goto_1
    new-instance v4, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {v4}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ThemeManager;->mHostView:Lcom/miui/gallery/widget/IMultiThemeView;

    check-cast p1, Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f0a002a

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p1

    int-to-long v5, p1

    invoke-interface/range {v1 .. v6}, Lcom/miui/gallery/widget/IMultiThemeView;->setTheme(Lcom/miui/gallery/widget/IMultiThemeView$Theme;Lcom/miui/gallery/widget/IMultiThemeView$ThemeTransition;Landroid/view/animation/Interpolator;J)V

    goto :goto_3

    :cond_1
    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ThemeManager;->mHostView:Lcom/miui/gallery/widget/IMultiThemeView;

    sget-object v0, Lcom/miui/gallery/widget/IMultiThemeView$Theme;->DARK:Lcom/miui/gallery/widget/IMultiThemeView$Theme;

    if-eqz p1, :cond_2

    sget-object p1, Lcom/miui/gallery/widget/IMultiThemeView$ThemeTransition;->FADE_OUT:Lcom/miui/gallery/widget/IMultiThemeView$ThemeTransition;

    goto :goto_2

    :cond_2
    sget-object p1, Lcom/miui/gallery/widget/IMultiThemeView$ThemeTransition;->NONE:Lcom/miui/gallery/widget/IMultiThemeView$ThemeTransition;

    :goto_2
    invoke-interface {p2, v0, p1}, Lcom/miui/gallery/widget/IMultiThemeView;->setTheme(Lcom/miui/gallery/widget/IMultiThemeView$Theme;Lcom/miui/gallery/widget/IMultiThemeView$ThemeTransition;)V

    :cond_3
    :goto_3
    return-void
.end method

.method public setLightTheme(ZZ)V
    .locals 7

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ThemeManager;->mHostView:Lcom/miui/gallery/widget/IMultiThemeView;

    if-eqz v0, :cond_3

    if-eqz p2, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ThemeManager;->mHostView:Lcom/miui/gallery/widget/IMultiThemeView;

    sget-object v2, Lcom/miui/gallery/widget/IMultiThemeView$Theme;->LIGHT:Lcom/miui/gallery/widget/IMultiThemeView$Theme;

    if-eqz p1, :cond_0

    sget-object p1, Lcom/miui/gallery/widget/IMultiThemeView$ThemeTransition;->FADE_IN:Lcom/miui/gallery/widget/IMultiThemeView$ThemeTransition;

    :goto_0
    move-object v3, p1

    goto :goto_1

    :cond_0
    sget-object p1, Lcom/miui/gallery/widget/IMultiThemeView$ThemeTransition;->NONE:Lcom/miui/gallery/widget/IMultiThemeView$ThemeTransition;

    goto :goto_0

    :goto_1
    new-instance v4, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {v4}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ThemeManager;->mHostView:Lcom/miui/gallery/widget/IMultiThemeView;

    check-cast p1, Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f0a0028

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p1

    int-to-long v5, p1

    invoke-interface/range {v1 .. v6}, Lcom/miui/gallery/widget/IMultiThemeView;->setTheme(Lcom/miui/gallery/widget/IMultiThemeView$Theme;Lcom/miui/gallery/widget/IMultiThemeView$ThemeTransition;Landroid/view/animation/Interpolator;J)V

    goto :goto_3

    :cond_1
    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ThemeManager;->mHostView:Lcom/miui/gallery/widget/IMultiThemeView;

    sget-object v0, Lcom/miui/gallery/widget/IMultiThemeView$Theme;->LIGHT:Lcom/miui/gallery/widget/IMultiThemeView$Theme;

    if-eqz p1, :cond_2

    sget-object p1, Lcom/miui/gallery/widget/IMultiThemeView$ThemeTransition;->FADE_IN:Lcom/miui/gallery/widget/IMultiThemeView$ThemeTransition;

    goto :goto_2

    :cond_2
    sget-object p1, Lcom/miui/gallery/widget/IMultiThemeView$ThemeTransition;->NONE:Lcom/miui/gallery/widget/IMultiThemeView$ThemeTransition;

    :goto_2
    invoke-interface {p2, v0, p1}, Lcom/miui/gallery/widget/IMultiThemeView;->setTheme(Lcom/miui/gallery/widget/IMultiThemeView$Theme;Lcom/miui/gallery/widget/IMultiThemeView$ThemeTransition;)V

    :cond_3
    :goto_3
    return-void
.end method
