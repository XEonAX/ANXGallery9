.class public Lcom/miui/gallery/editor/photo/core/imports/text/dialog/LocalDialogModel;
.super Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;
.source "LocalDialogModel.java"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/miui/gallery/editor/photo/core/imports/text/dialog/LocalDialogModel;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mDialogRes:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/LocalDialogModel$1;

    invoke-direct {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/LocalDialogModel$1;-><init>()V

    sput-object v0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/LocalDialogModel;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(IIIFFFFZILjava/lang/String;)V
    .locals 13

    sget-object v0, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->DRAWABLE:Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->wrap(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    sget-object v0, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->DRAWABLE:Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    invoke-static/range {p3 .. p3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->wrap(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    move-object v2, p0

    move v3, p1

    move/from16 v6, p4

    move/from16 v7, p5

    move/from16 v8, p6

    move/from16 v9, p7

    move/from16 v10, p8

    move/from16 v11, p9

    move-object/from16 v12, p10

    invoke-direct/range {v2 .. v12}, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;-><init>(ILjava/lang/String;Ljava/lang/String;FFFFZILjava/lang/String;)V

    move-object v0, p0

    move/from16 v1, p3

    iput v1, v0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/LocalDialogModel;->mDialogRes:I

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;-><init>(Landroid/os/Parcel;)V

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/LocalDialogModel;->mDialogRes:I

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public hasDialog()Z
    .locals 1

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/LocalDialogModel;->mDialogRes:I

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public readDialogDrawable(Landroid/content/res/Resources;)Landroid/graphics/drawable/Drawable;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/LocalDialogModel;->hasDialog()Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/LocalDialogModel;->mDialogRes:I

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;->writeToParcel(Landroid/os/Parcel;I)V

    iget p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/LocalDialogModel;->mDialogRes:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    return-void
.end method
