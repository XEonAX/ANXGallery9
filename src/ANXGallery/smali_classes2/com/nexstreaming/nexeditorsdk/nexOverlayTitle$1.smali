.class Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$1;
.super Ljava/lang/Object;
.source "nexOverlayTitle.java"

# interfaces
.implements Lcom/nexstreaming/nexeditorsdk/nexAnimate$MoveTrackingPath;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;->a(Landroid/content/Context;Lcom/nexstreaming/nexeditorsdk/nexProject;Ljava/util/List;)Ljava/lang/String;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:F

.field final synthetic b:F

.field final synthetic c:F

.field final synthetic d:F

.field final synthetic e:Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;


# direct methods
.method constructor <init>(Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;FFFF)V
    .locals 0

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$1;->e:Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle;

    iput p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$1;->a:F

    iput p3, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$1;->b:F

    iput p4, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$1;->c:F

    iput p5, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$1;->d:F

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getTranslatePosition(IF)F
    .locals 1

    const/4 v0, 0x1

    if-ne p1, v0, :cond_1

    iget p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$1;->a:F

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$1;->b:F

    sub-float/2addr p1, v0

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    mul-float p1, p1, p2

    iget p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$1;->a:F

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$1;->b:F

    cmpg-float p2, p2, v0

    if-gez p2, :cond_0

    goto :goto_0

    :cond_0
    neg-float p1, p1

    :goto_0
    iget p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$1;->a:F

    add-float/2addr p2, p1

    return p2

    :cond_1
    const/4 v0, 0x2

    if-ne p1, v0, :cond_3

    iget p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$1;->c:F

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$1;->d:F

    sub-float/2addr p1, v0

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    mul-float p1, p1, p2

    iget p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$1;->c:F

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$1;->d:F

    cmpg-float p2, p2, v0

    if-gez p2, :cond_2

    goto :goto_1

    :cond_2
    neg-float p1, p1

    :goto_1
    iget p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayTitle$1;->c:F

    add-float/2addr p2, p1

    return p2

    :cond_3
    const/4 p1, 0x0

    return p1
.end method
