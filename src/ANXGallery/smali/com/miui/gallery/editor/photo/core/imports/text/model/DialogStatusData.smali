.class public Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;
.super Lcom/miui/gallery/editor/photo/core/imports/text/model/TextStatusData;
.source "DialogStatusData.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public isReverseColor:Z

.field public itemDegree:F

.field public itemPositionX:F

.field public itemPositionY:F

.field public itemScale:F

.field public textStatusDatas:[Lcom/miui/gallery/editor/photo/core/imports/text/model/TextStatusData;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData$1;

    invoke-direct {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData$1;-><init>()V

    sput-object v0, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/model/TextStatusData;-><init>()V

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/model/TextStatusData;-><init>()V

    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->itemPositionX:F

    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->itemPositionY:F

    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->itemScale:F

    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->itemDegree:F

    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->isReverseColor:Z

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableGenericUtils;->readArray(Landroid/os/Parcel;)[Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, [Lcom/miui/gallery/editor/photo/core/imports/text/model/TextStatusData;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->textStatusDatas:[Lcom/miui/gallery/editor/photo/core/imports/text/model/TextStatusData;

    return-void
.end method


# virtual methods
.method public configSelfByInit(Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;)V
    .locals 4

    const/4 v0, 0x0

    const/4 v1, 0x1

    const/4 v2, -0x1

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;->hasDialog()Z

    move-result v3

    if-eqz v3, :cond_1

    iget-boolean p1, p1, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;->isCorner:Z

    if-eqz p1, :cond_0

    iput v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->color:I

    sget-object p1, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;->LEFT:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->textAlignment:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;

    iput-boolean v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->textShadow:Z

    goto :goto_0

    :cond_0
    const/high16 p1, -0x1000000

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->color:I

    sget-object p1, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;->CENTER:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->textAlignment:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->textShadow:Z

    goto :goto_0

    :cond_1
    iput v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->color:I

    sget-object p1, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;->LEFT:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->textAlignment:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;

    iput-boolean v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->textShadow:Z

    :goto_0
    const/4 p1, 0x0

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->transparentProgress:F

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->textStyle:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->textBold:Z

    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->itemScale:F

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->itemDegree:F

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->itemPositionX:F

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->itemPositionY:F

    return-void
.end method

.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public setEmpty()V
    .locals 3

    const/4 v0, -0x1

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->color:I

    sget-object v0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;->LEFT:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->textAlignment:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->transparentProgress:F

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->textStyle:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;

    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->textBold:Z

    iput-boolean v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->textShadow:Z

    const/high16 v2, 0x3f800000    # 1.0f

    iput v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->itemScale:F

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->itemDegree:F

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->itemPositionX:F

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->itemPositionY:F

    new-array v0, v1, [Lcom/miui/gallery/editor/photo/core/imports/text/model/TextStatusData;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->textStatusDatas:[Lcom/miui/gallery/editor/photo/core/imports/text/model/TextStatusData;

    return-void
.end method

.method public watermarkInitSelf(Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;)V
    .locals 4

    if-eqz p1, :cond_1

    iget-object v0, p1, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;->textPieceList:Ljava/util/List;

    if-nez v0, :cond_0

    goto :goto_1

    :cond_0
    iget-object v0, p1, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;->textPieceList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [Lcom/miui/gallery/editor/photo/core/imports/text/model/TextStatusData;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->textStatusDatas:[Lcom/miui/gallery/editor/photo/core/imports/text/model/TextStatusData;

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_0
    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->textStatusDatas:[Lcom/miui/gallery/editor/photo/core/imports/text/model/TextStatusData;

    array-length v2, v2

    if-ge v1, v2, :cond_2

    new-instance v2, Lcom/miui/gallery/editor/photo/core/imports/text/model/TextStatusData;

    invoke-direct {v2}, Lcom/miui/gallery/editor/photo/core/imports/text/model/TextStatusData;-><init>()V

    iget-object v3, p1, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;->textPieceList:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo$TextPieceInfo;

    iget-boolean v3, v3, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo$TextPieceInfo;->isBold:Z

    iput-boolean v3, v2, Lcom/miui/gallery/editor/photo/core/imports/text/model/TextStatusData;->textBold:Z

    const/4 v3, -0x1

    iput v3, v2, Lcom/miui/gallery/editor/photo/core/imports/text/model/TextStatusData;->color:I

    sget-object v3, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;->LEFT:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;

    iput-object v3, v2, Lcom/miui/gallery/editor/photo/core/imports/text/model/TextStatusData;->textAlignment:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;

    const/4 v3, 0x0

    iput v3, v2, Lcom/miui/gallery/editor/photo/core/imports/text/model/TextStatusData;->transparentProgress:F

    const/4 v3, 0x0

    iput-object v3, v2, Lcom/miui/gallery/editor/photo/core/imports/text/model/TextStatusData;->textStyle:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;

    iput-boolean v0, v2, Lcom/miui/gallery/editor/photo/core/imports/text/model/TextStatusData;->textShadow:Z

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->textStatusDatas:[Lcom/miui/gallery/editor/photo/core/imports/text/model/TextStatusData;

    aput-object v2, v3, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->setEmpty()V

    :cond_2
    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 2

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->itemPositionX:F

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeFloat(F)V

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->itemPositionY:F

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeFloat(F)V

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->itemScale:F

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeFloat(F)V

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->itemDegree:F

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeFloat(F)V

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->isReverseColor:Z

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->textStatusDatas:[Lcom/miui/gallery/editor/photo/core/imports/text/model/TextStatusData;

    const-class v1, Lcom/miui/gallery/editor/photo/core/imports/text/model/TextStatusData;

    invoke-static {p1, p2, v0, v1}, Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableGenericUtils;->writeArray(Landroid/os/Parcel;I[Landroid/os/Parcelable;Ljava/lang/Class;)V

    return-void
.end method
