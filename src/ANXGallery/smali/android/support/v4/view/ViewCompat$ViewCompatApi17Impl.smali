.class Landroid/support/v4/view/ViewCompat$ViewCompatApi17Impl;
.super Landroid/support/v4/view/ViewCompat$ViewCompatApi16Impl;
.source "ViewCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/view/ViewCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ViewCompatApi17Impl"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/support/v4/view/ViewCompat$ViewCompatApi16Impl;-><init>()V

    return-void
.end method


# virtual methods
.method public getDisplay(Landroid/view/View;)Landroid/view/Display;
    .locals 0

    invoke-virtual {p1}, Landroid/view/View;->getDisplay()Landroid/view/Display;

    move-result-object p1

    return-object p1
.end method

.method public getLayoutDirection(Landroid/view/View;)I
    .locals 0

    invoke-virtual {p1}, Landroid/view/View;->getLayoutDirection()I

    move-result p1

    return p1
.end method

.method public getPaddingEnd(Landroid/view/View;)I
    .locals 0

    invoke-virtual {p1}, Landroid/view/View;->getPaddingEnd()I

    move-result p1

    return p1
.end method

.method public getPaddingStart(Landroid/view/View;)I
    .locals 0

    invoke-virtual {p1}, Landroid/view/View;->getPaddingStart()I

    move-result p1

    return p1
.end method
