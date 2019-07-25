.class Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Point;
.super Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Curve;
.source "RemoverGestureView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Point"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Point$Builder;
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Point;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mPointF:Landroid/graphics/PointF;

.field private mPointPaint:Landroid/graphics/Paint;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Point$1;

    invoke-direct {v0}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Point$1;-><init>()V

    sput-object v0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Point;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method constructor <init>(Landroid/graphics/Paint;)V
    .locals 1

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Curve;-><init>(Landroid/graphics/Paint;)V

    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Point;->mPointF:Landroid/graphics/PointF;

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, p1}, Landroid/graphics/Paint;-><init>(Landroid/graphics/Paint;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Point;->mPointPaint:Landroid/graphics/Paint;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Point;->mPointPaint:Landroid/graphics/Paint;

    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 1

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Curve;-><init>(Landroid/os/Parcel;)V

    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Point;->mPointF:Landroid/graphics/PointF;

    const-class v0, Landroid/graphics/PointF;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Landroid/graphics/PointF;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Point;->mPointF:Landroid/graphics/PointF;

    new-instance p1, Landroid/graphics/Paint;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Point;->mPaint:Landroid/graphics/Paint;

    invoke-direct {p1, v0}, Landroid/graphics/Paint;-><init>(Landroid/graphics/Paint;)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Point;->mPointPaint:Landroid/graphics/Paint;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Point;->mPointPaint:Landroid/graphics/Paint;

    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    return-void
.end method

.method static synthetic access$1600(Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Point;)Landroid/graphics/PointF;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Point;->mPointF:Landroid/graphics/PointF;

    return-object p0
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method isEmpty(Landroid/graphics/RectF;)Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Point;->mPointF:Landroid/graphics/PointF;

    iget v0, v0, Landroid/graphics/PointF;->x:F

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Point;->mPointF:Landroid/graphics/PointF;

    iget v1, v1, Landroid/graphics/PointF;->y:F

    invoke-virtual {p1, v0, v1}, Landroid/graphics/RectF;->contains(FF)Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    return p1
.end method

.method onComputeBounds(Landroid/graphics/RectF;)V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Point;->mPointF:Landroid/graphics/PointF;

    iget v0, v0, Landroid/graphics/PointF;->x:F

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Point;->mPointF:Landroid/graphics/PointF;

    iget v1, v1, Landroid/graphics/PointF;->y:F

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Point;->mPointF:Landroid/graphics/PointF;

    iget v2, v2, Landroid/graphics/PointF;->x:F

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Point;->mPointF:Landroid/graphics/PointF;

    iget v3, v3, Landroid/graphics/PointF;->y:F

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/RectF;->set(FFFF)V

    return-void
.end method

.method onDraw(Landroid/graphics/Canvas;Landroid/graphics/Paint;)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Point;->mPointF:Landroid/graphics/PointF;

    iget v0, v0, Landroid/graphics/PointF;->x:F

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Point;->mPointF:Landroid/graphics/PointF;

    iget v1, v1, Landroid/graphics/PointF;->y:F

    invoke-virtual {p2}, Landroid/graphics/Paint;->getStrokeWidth()F

    move-result p2

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr p2, v2

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Point;->mPointPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, p2, v2}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Curve;->writeToParcel(Landroid/os/Parcel;I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Point;->mPointF:Landroid/graphics/PointF;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    return-void
.end method
