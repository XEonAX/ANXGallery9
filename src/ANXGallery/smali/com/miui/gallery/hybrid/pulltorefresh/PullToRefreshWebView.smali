.class public Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshWebView;
.super Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;
.source "PullToRefreshWebView.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase<",
        "Landroid/webkit/WebView;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;-><init>(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;-><init>(Landroid/content/Context;Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$AnimationStyle;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;-><init>(Landroid/content/Context;Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$AnimationStyle;)V

    return-void
.end method


# virtual methods
.method protected bridge synthetic createRefreshableView(Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshWebView;->createRefreshableView(Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/webkit/WebView;

    move-result-object p1

    return-object p1
.end method

.method protected createRefreshableView(Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/webkit/WebView;
    .locals 1

    new-instance v0, Landroid/webkit/WebView;

    invoke-direct {v0, p1, p2}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method public final getPullToRefreshScrollDirection()Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Orientation;
    .locals 1

    sget-object v0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Orientation;->VERTICAL:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Orientation;

    return-object v0
.end method

.method protected isReadyForPullEnd()Z
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshWebView;->mRefreshableView:Landroid/view/View;

    check-cast v0, Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getContentHeight()I

    move-result v0

    int-to-float v0, v0

    iget-object v1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshWebView;->mRefreshableView:Landroid/view/View;

    check-cast v1, Landroid/webkit/WebView;

    invoke-virtual {v1}, Landroid/webkit/WebView;->getScale()F

    move-result v1

    mul-float v0, v0, v1

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    double-to-float v0, v0

    iget-object v1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshWebView;->mRefreshableView:Landroid/view/View;

    check-cast v1, Landroid/webkit/WebView;

    invoke-virtual {v1}, Landroid/webkit/WebView;->getScrollY()I

    move-result v1

    int-to-float v1, v1

    iget-object v2, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshWebView;->mRefreshableView:Landroid/view/View;

    check-cast v2, Landroid/webkit/WebView;

    invoke-virtual {v2}, Landroid/webkit/WebView;->getHeight()I

    move-result v2

    int-to-float v2, v2

    sub-float/2addr v0, v2

    cmpl-float v0, v1, v0

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method protected isReadyForPullStart()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshWebView;->mRefreshableView:Landroid/view/View;

    check-cast v0, Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getScrollY()I

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshWebView;->isRefreshing()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method protected onPtrRestoreInstanceState(Landroid/os/Bundle;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->onPtrRestoreInstanceState(Landroid/os/Bundle;)V

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshWebView;->mRefreshableView:Landroid/view/View;

    check-cast v0, Landroid/webkit/WebView;

    invoke-virtual {v0, p1}, Landroid/webkit/WebView;->restoreState(Landroid/os/Bundle;)Landroid/webkit/WebBackForwardList;

    return-void
.end method

.method protected onPtrSaveInstanceState(Landroid/os/Bundle;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->onPtrSaveInstanceState(Landroid/os/Bundle;)V

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshWebView;->mRefreshableView:Landroid/view/View;

    check-cast v0, Landroid/webkit/WebView;

    invoke-virtual {v0, p1}, Landroid/webkit/WebView;->saveState(Landroid/os/Bundle;)Landroid/webkit/WebBackForwardList;

    return-void
.end method
