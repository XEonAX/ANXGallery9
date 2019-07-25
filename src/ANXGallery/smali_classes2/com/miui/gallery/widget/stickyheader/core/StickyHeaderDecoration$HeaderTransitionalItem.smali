.class Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderTransitionalItem;
.super Ljava/lang/Object;
.source "StickyHeaderDecoration.java"

# interfaces
.implements Lcom/miui/gallery/widget/recyclerview/transition/TransitionalItem;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "HeaderTransitionalItem"
.end annotation


# instance fields
.field private final mDrawable:Landroid/graphics/drawable/Drawable;

.field private final mFrame:Landroid/graphics/RectF;


# direct methods
.method public constructor <init>(Landroid/graphics/RectF;Landroid/graphics/drawable/Drawable;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderTransitionalItem;->mFrame:Landroid/graphics/RectF;

    iput-object p2, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderTransitionalItem;->mDrawable:Landroid/graphics/drawable/Drawable;

    return-void
.end method


# virtual methods
.method public getTransitDrawable()Landroid/graphics/drawable/Drawable;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderTransitionalItem;->mDrawable:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public getTransitFrame()Landroid/graphics/RectF;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderTransitionalItem;->mFrame:Landroid/graphics/RectF;

    return-object v0
.end method

.method public getTransitId()J
    .locals 2

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getTransitPath()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public getTransitScaleType()Landroid/widget/ImageView$ScaleType;
    .locals 1

    sget-object v0, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    return-object v0
.end method
