.class public Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;
.super Ljava/lang/Object;
.source "GLRectF.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF$Iterator;
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private bottom:F

.field private left:F

.field private right:F

.field private top:F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF$1;

    invoke-direct {v0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF$1;-><init>()V

    sput-object v0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;->left:F

    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;->top:F

    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;->right:F

    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result p1

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;->bottom:F

    return-void
.end method

.method public constructor <init>([F)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;->setByVertex([F)V

    return-void
.end method


# virtual methods
.method public centerX()F
    .locals 2

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;->left:F

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;->right:F

    add-float/2addr v0, v1

    const/high16 v1, 0x3f000000    # 0.5f

    mul-float v0, v0, v1

    return v0
.end method

.method public final centerY()F
    .locals 2

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;->top:F

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;->bottom:F

    add-float/2addr v0, v1

    const/high16 v1, 0x3f000000    # 0.5f

    mul-float v0, v0, v1

    return v0
.end method

.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getVertex([F)V
    .locals 2

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;->left:F

    const/4 v1, 0x0

    aput v0, p1, v1

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;->bottom:F

    const/4 v1, 0x1

    aput v0, p1, v1

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;->right:F

    const/4 v1, 0x2

    aput v0, p1, v1

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;->bottom:F

    const/4 v1, 0x3

    aput v0, p1, v1

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;->left:F

    const/4 v1, 0x4

    aput v0, p1, v1

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;->top:F

    const/4 v1, 0x5

    aput v0, p1, v1

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;->right:F

    const/4 v1, 0x6

    aput v0, p1, v1

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;->top:F

    const/4 v1, 0x7

    aput v0, p1, v1

    return-void
.end method

.method public final height()F
    .locals 2

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;->top:F

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;->bottom:F

    sub-float/2addr v0, v1

    return v0
.end method

.method public offset(FF)V
    .locals 1

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;->left:F

    add-float/2addr v0, p1

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;->left:F

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;->top:F

    add-float/2addr v0, p2

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;->top:F

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;->right:F

    add-float/2addr v0, p1

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;->right:F

    iget p1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;->bottom:F

    add-float/2addr p1, p2

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;->bottom:F

    return-void
.end method

.method public set(Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;)V
    .locals 1

    iget v0, p1, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;->left:F

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;->left:F

    iget v0, p1, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;->top:F

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;->top:F

    iget v0, p1, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;->right:F

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;->right:F

    iget p1, p1, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;->bottom:F

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;->bottom:F

    return-void
.end method

.method public setByVertex([F)V
    .locals 1

    const/4 v0, 0x0

    aget v0, p1, v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;->left:F

    const/4 v0, 0x5

    aget v0, p1, v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;->top:F

    const/4 v0, 0x2

    aget v0, p1, v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;->right:F

    const/4 v0, 0x1

    aget p1, p1, v0

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;->bottom:F

    return-void
.end method

.method public final width()F
    .locals 2

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;->right:F

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;->left:F

    sub-float/2addr v0, v1

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    iget p2, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;->left:F

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeFloat(F)V

    iget p2, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;->top:F

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeFloat(F)V

    iget p2, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;->right:F

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeFloat(F)V

    iget p2, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;->bottom:F

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeFloat(F)V

    return-void
.end method
