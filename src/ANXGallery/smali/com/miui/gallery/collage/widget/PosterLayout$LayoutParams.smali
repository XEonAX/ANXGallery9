.class public Lcom/miui/gallery/collage/widget/PosterLayout$LayoutParams;
.super Landroid/view/ViewGroup$LayoutParams;
.source "PosterLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/collage/widget/PosterLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "LayoutParams"
.end annotation


# instance fields
.field private mBottom:F

.field private mLeft:F

.field private mRight:F

.field private mTop:F


# direct methods
.method public varargs constructor <init>([F)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, v0, v0}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    aget v0, p1, v0

    iput v0, p0, Lcom/miui/gallery/collage/widget/PosterLayout$LayoutParams;->mLeft:F

    const/4 v0, 0x1

    aget v0, p1, v0

    iput v0, p0, Lcom/miui/gallery/collage/widget/PosterLayout$LayoutParams;->mTop:F

    const/4 v0, 0x2

    aget v0, p1, v0

    iput v0, p0, Lcom/miui/gallery/collage/widget/PosterLayout$LayoutParams;->mRight:F

    const/4 v0, 0x3

    aget p1, p1, v0

    iput p1, p0, Lcom/miui/gallery/collage/widget/PosterLayout$LayoutParams;->mBottom:F

    return-void
.end method

.method static synthetic access$200(Lcom/miui/gallery/collage/widget/PosterLayout$LayoutParams;)F
    .locals 0

    iget p0, p0, Lcom/miui/gallery/collage/widget/PosterLayout$LayoutParams;->mLeft:F

    return p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/collage/widget/PosterLayout$LayoutParams;)F
    .locals 0

    iget p0, p0, Lcom/miui/gallery/collage/widget/PosterLayout$LayoutParams;->mTop:F

    return p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/collage/widget/PosterLayout$LayoutParams;)F
    .locals 0

    iget p0, p0, Lcom/miui/gallery/collage/widget/PosterLayout$LayoutParams;->mRight:F

    return p0
.end method

.method static synthetic access$500(Lcom/miui/gallery/collage/widget/PosterLayout$LayoutParams;)F
    .locals 0

    iget p0, p0, Lcom/miui/gallery/collage/widget/PosterLayout$LayoutParams;->mBottom:F

    return p0
.end method
