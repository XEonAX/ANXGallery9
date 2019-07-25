.class final Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$FakeTransitionalItem;
.super Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;
.source "TransitionHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "FakeTransitionalItem"
.end annotation


# instance fields
.field private final mFakeFrame:Landroid/graphics/RectF;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/widget/recyclerview/transition/TransitionalItem;)V
    .locals 1

    const/4 v0, -0x1

    invoke-direct {p0, p1, v0, v0}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;-><init>(Lcom/miui/gallery/widget/recyclerview/transition/TransitionalItem;II)V

    new-instance v0, Landroid/graphics/RectF;

    invoke-interface {p1}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionalItem;->getTransitFrame()Landroid/graphics/RectF;

    move-result-object p1

    invoke-direct {v0, p1}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    iput-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$FakeTransitionalItem;->mFakeFrame:Landroid/graphics/RectF;

    return-void
.end method


# virtual methods
.method public getTransitDrawable()Landroid/graphics/drawable/Drawable;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public getTransitFrame()Landroid/graphics/RectF;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$FakeTransitionalItem;->mFakeFrame:Landroid/graphics/RectF;

    return-object v0
.end method

.method public getTransitId()J
    .locals 2

    const-wide/32 v0, -0x80000000

    return-wide v0
.end method

.method public getTransitPath()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public getTransitScaleType()Landroid/widget/ImageView$ScaleType;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method
