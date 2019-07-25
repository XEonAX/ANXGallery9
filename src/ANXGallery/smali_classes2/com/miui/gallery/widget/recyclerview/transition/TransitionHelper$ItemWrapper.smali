.class Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;
.super Ljava/lang/Object;
.source "TransitionHelper.java"

# interfaces
.implements Lcom/miui/gallery/widget/recyclerview/transition/TransitionalItem;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ItemWrapper"
.end annotation


# instance fields
.field protected final mItem:Lcom/miui/gallery/widget/recyclerview/transition/TransitionalItem;

.field private final mSpanGroupIndex:I

.field private final mSpanIndex:I


# direct methods
.method public constructor <init>(Lcom/miui/gallery/widget/recyclerview/transition/TransitionalItem;II)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;->mItem:Lcom/miui/gallery/widget/recyclerview/transition/TransitionalItem;

    iput p2, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;->mSpanGroupIndex:I

    iput p3, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;->mSpanIndex:I

    return-void
.end method

.method static synthetic access$1000(Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;->mSpanGroupIndex:I

    return p0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    if-eqz p1, :cond_0

    instance-of v0, p1, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;->getTransitId()J

    move-result-wide v0

    check-cast p1, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;

    invoke-virtual {p1}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;->getTransitId()J

    move-result-wide v2

    cmp-long p1, v0, v2

    if-nez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public getTransitDrawable()Landroid/graphics/drawable/Drawable;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;->mItem:Lcom/miui/gallery/widget/recyclerview/transition/TransitionalItem;

    invoke-interface {v0}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionalItem;->getTransitDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method public getTransitFrame()Landroid/graphics/RectF;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;->mItem:Lcom/miui/gallery/widget/recyclerview/transition/TransitionalItem;

    invoke-interface {v0}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionalItem;->getTransitFrame()Landroid/graphics/RectF;

    move-result-object v0

    return-object v0
.end method

.method public getTransitId()J
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;->mItem:Lcom/miui/gallery/widget/recyclerview/transition/TransitionalItem;

    invoke-interface {v0}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionalItem;->getTransitId()J

    move-result-wide v0

    return-wide v0
.end method

.method public getTransitPath()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;->mItem:Lcom/miui/gallery/widget/recyclerview/transition/TransitionalItem;

    invoke-interface {v0}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionalItem;->getTransitPath()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTransitScaleType()Landroid/widget/ImageView$ScaleType;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;->mItem:Lcom/miui/gallery/widget/recyclerview/transition/TransitionalItem;

    invoke-interface {v0}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionalItem;->getTransitScaleType()Landroid/widget/ImageView$ScaleType;

    move-result-object v0

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;->getTransitId()J

    move-result-wide v0

    long-to-int v0, v0

    return v0
.end method
