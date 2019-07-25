.class final Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;
.super Ljava/lang/Object;
.source "DecorItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Builder"
.end annotation


# instance fields
.field private mDrawable:Landroid/graphics/drawable/Drawable;

.field private mFromAlpha:I

.field private mFromFrame:Landroid/graphics/RectF;

.field private mHost:Landroid/view/View;

.field private mLocalPath:Ljava/lang/String;

.field private mScaleType:Landroid/widget/ImageView$ScaleType;

.field private mToAlpha:I

.field private mToFrame:Landroid/graphics/RectF;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0xff

    iput v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;->mFromAlpha:I

    iput-object p1, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;->mHost:Landroid/view/View;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;)Landroid/view/View;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;->mHost:Landroid/view/View;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;->mLocalPath:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;)Landroid/widget/ImageView$ScaleType;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;->mScaleType:Landroid/widget/ImageView$ScaleType;

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;)Landroid/graphics/RectF;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;->mFromFrame:Landroid/graphics/RectF;

    return-object p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;)Landroid/graphics/RectF;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;->mToFrame:Landroid/graphics/RectF;

    return-object p0
.end method

.method static synthetic access$500(Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;->mFromAlpha:I

    return p0
.end method

.method static synthetic access$600(Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;->mToAlpha:I

    return p0
.end method

.method static synthetic access$700(Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;)Landroid/graphics/drawable/Drawable;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;->mDrawable:Landroid/graphics/drawable/Drawable;

    return-object p0
.end method


# virtual methods
.method public build()Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;
    .locals 2

    new-instance v0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;-><init>(Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$1;)V

    return-object v0
.end method

.method public setDrawable(Landroid/graphics/drawable/Drawable;)Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;->mDrawable:Landroid/graphics/drawable/Drawable;

    return-object p0
.end method

.method public setFromAlpha(I)Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;
    .locals 0

    iput p1, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;->mFromAlpha:I

    return-object p0
.end method

.method public setFromFrame(Landroid/graphics/RectF;)Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;->mFromFrame:Landroid/graphics/RectF;

    return-object p0
.end method

.method public setLocalPath(Ljava/lang/String;)Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;->mLocalPath:Ljava/lang/String;

    return-object p0
.end method

.method public setScaleType(Landroid/widget/ImageView$ScaleType;)Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;->mScaleType:Landroid/widget/ImageView$ScaleType;

    return-object p0
.end method

.method public setToAlpha(I)Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;
    .locals 0

    iput p1, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;->mToAlpha:I

    return-object p0
.end method

.method public setToFrame(Landroid/graphics/RectF;)Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;->mToFrame:Landroid/graphics/RectF;

    return-object p0
.end method
