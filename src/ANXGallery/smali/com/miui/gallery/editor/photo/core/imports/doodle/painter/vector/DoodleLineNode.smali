.class public Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleLineNode;
.super Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;
.source "DoodleLineNode.java"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleLineNode;",
            ">;"
        }
    .end annotation
.end field

.field private static final DOODLE_ITEM:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    sget-object v0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;->LINE:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;

    sput-object v0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleLineNode;->DOODLE_ITEM:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleLineNode$1;

    invoke-direct {v0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleLineNode$1;-><init>()V

    sput-object v0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleLineNode;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Landroid/content/res/Resources;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;-><init>(Landroid/content/res/Resources;)V

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;-><init>(Landroid/os/Parcel;)V

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public drawSafely(Landroid/graphics/Canvas;)V
    .locals 7

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleLineNode;->configCanvas(Landroid/graphics/Canvas;Z)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleLineNode;->mStartPoint:Landroid/graphics/PointF;

    iget v2, v0, Landroid/graphics/PointF;->x:F

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleLineNode;->mStartPoint:Landroid/graphics/PointF;

    iget v3, v0, Landroid/graphics/PointF;->y:F

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleLineNode;->mEndPoint:Landroid/graphics/PointF;

    iget v4, v0, Landroid/graphics/PointF;->x:F

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleLineNode;->mEndPoint:Landroid/graphics/PointF;

    iget v5, v0, Landroid/graphics/PointF;->y:F

    iget-object v6, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleLineNode;->mPaint:Landroid/graphics/Paint;

    move-object v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    return-void
.end method

.method public getDoodleName()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleLineNode;->DOODLE_ITEM:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;->name()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected init(Landroid/content/res/Resources;)V
    .locals 0

    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->writeToParcel(Landroid/os/Parcel;I)V

    return-void
.end method
