.class Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Free;
.super Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Curve;
.source "RemoverGestureView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Free"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Free$Builder;
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Free;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mPath:Landroid/graphics/Path;

.field private mPointFList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/graphics/PointF;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Free$1;

    invoke-direct {v0}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Free$1;-><init>()V

    sput-object v0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Free;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method constructor <init>(Landroid/graphics/Paint;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Curve;-><init>(Landroid/graphics/Paint;)V

    new-instance p1, Landroid/graphics/Path;

    invoke-direct {p1}, Landroid/graphics/Path;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Free;->mPath:Landroid/graphics/Path;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Free;->mPointFList:Ljava/util/List;

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 1

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Curve;-><init>(Landroid/os/Parcel;)V

    sget-object v0, Landroid/graphics/PointF;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->createTypedArrayList(Landroid/os/Parcelable$Creator;)Ljava/util/ArrayList;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Free;->mPointFList:Ljava/util/List;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Free;->mPointFList:Ljava/util/List;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelablePathUtils;->getPathFromPointList(Ljava/util/List;)Landroid/graphics/Path;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Free;->mPath:Landroid/graphics/Path;

    return-void
.end method

.method static synthetic access$1200(Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Free;)Landroid/graphics/Path;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Free;->mPath:Landroid/graphics/Path;

    return-object p0
.end method

.method static synthetic access$1300(Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Free;)Ljava/util/List;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Free;->mPointFList:Ljava/util/List;

    return-object p0
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method isEmpty(Landroid/graphics/RectF;)Z
    .locals 0

    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Free;->onComputeBounds(Landroid/graphics/RectF;)V

    invoke-virtual {p1}, Landroid/graphics/RectF;->isEmpty()Z

    move-result p1

    return p1
.end method

.method onComputeBounds(Landroid/graphics/RectF;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Free;->mPath:Landroid/graphics/Path;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Landroid/graphics/Path;->computeBounds(Landroid/graphics/RectF;Z)V

    return-void
.end method

.method onDraw(Landroid/graphics/Canvas;Landroid/graphics/Paint;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Free;->mPath:Landroid/graphics/Path;

    invoke-virtual {p1, v0, p2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Curve;->writeToParcel(Landroid/os/Parcel;I)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView$Free;->mPointFList:Ljava/util/List;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeTypedList(Ljava/util/List;)V

    return-void
.end method
