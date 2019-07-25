.class public abstract Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;
.super Ljava/lang/Object;
.source "BaseDialogModel.java"

# interfaces
.implements Landroid/os/Parcelable;


# instance fields
.field public final backgroundColor:I

.field public final bottomOffsetPercent:F

.field public final cornerPosition:I

.field public dialogPath:Ljava/lang/String;

.field public dialogSmallIconPath:Ljava/lang/String;

.field public final isCorner:Z

.field public final leftOffsetPercent:F

.field public final name:Ljava/lang/String;

.field public final rightOffsetPercent:F

.field public final topOffsetPercent:F


# direct methods
.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;FFFFZILjava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;->dialogSmallIconPath:Ljava/lang/String;

    iput-object p3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;->dialogPath:Ljava/lang/String;

    iput p4, p0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;->leftOffsetPercent:F

    iput p5, p0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;->topOffsetPercent:F

    iput p6, p0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;->rightOffsetPercent:F

    iput p7, p0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;->bottomOffsetPercent:F

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;->backgroundColor:I

    iput-boolean p8, p0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;->isCorner:Z

    iput p9, p0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;->cornerPosition:I

    iput-object p10, p0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;->name:Ljava/lang/String;

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;->backgroundColor:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;->leftOffsetPercent:F

    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;->topOffsetPercent:F

    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;->rightOffsetPercent:F

    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;->bottomOffsetPercent:F

    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;->isCorner:Z

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;->cornerPosition:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;->name:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public configRect(Landroid/graphics/RectF;Z)V
    .locals 4

    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result v0

    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    move-result v1

    iget v2, p1, Landroid/graphics/RectF;->left:F

    if-eqz p2, :cond_0

    iget v3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;->rightOffsetPercent:F

    :goto_0
    mul-float v3, v3, v0

    goto :goto_1

    :cond_0
    iget v3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;->leftOffsetPercent:F

    goto :goto_0

    :goto_1
    add-float/2addr v2, v3

    iput v2, p1, Landroid/graphics/RectF;->left:F

    iget v2, p1, Landroid/graphics/RectF;->right:F

    if-eqz p2, :cond_1

    iget p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;->leftOffsetPercent:F

    :goto_2
    mul-float v0, v0, p2

    goto :goto_3

    :cond_1
    iget p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;->rightOffsetPercent:F

    goto :goto_2

    :goto_3
    sub-float/2addr v2, v0

    iput v2, p1, Landroid/graphics/RectF;->right:F

    iget p2, p1, Landroid/graphics/RectF;->top:F

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;->topOffsetPercent:F

    mul-float v0, v0, v1

    add-float/2addr p2, v0

    iput p2, p1, Landroid/graphics/RectF;->top:F

    iget p2, p1, Landroid/graphics/RectF;->bottom:F

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;->bottomOffsetPercent:F

    mul-float v1, v1, v0

    sub-float/2addr p2, v1

    iput p2, p1, Landroid/graphics/RectF;->bottom:F

    return-void
.end method

.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public hasDialog()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;->dialogPath:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public abstract readDialogDrawable(Landroid/content/res/Resources;)Landroid/graphics/drawable/Drawable;
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    iget p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;->backgroundColor:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    iget p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;->leftOffsetPercent:F

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeFloat(F)V

    iget p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;->topOffsetPercent:F

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeFloat(F)V

    iget p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;->rightOffsetPercent:F

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeFloat(F)V

    iget p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;->bottomOffsetPercent:F

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeFloat(F)V

    iget-boolean p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;->isCorner:Z

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeByte(B)V

    iget p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;->cornerPosition:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;->name:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return-void
.end method
