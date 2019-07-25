.class public Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;
.super Ljava/lang/Object;
.source "TextAppendConfig.java"

# interfaces
.implements Landroid/os/Parcelable;
.implements Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig$TextDrawable;
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mAutoLineLayout:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;

.field private mColor:I

.field private mContext:Landroid/content/Context;

.field private final mCornerDialogWidth:I

.field private final mCorrectionDegrees:I

.field private final mCountSizeSpacing:F

.field private mDefaultLocationX:F

.field private mDefaultLocationY:F

.field private final mDefaultStrokeWidth:I

.field private final mDefaultTextSize:F

.field private mDialogDrawable:Landroid/graphics/drawable/Drawable;

.field private mDialogModel:Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;

.field private final mDialogOutLineOffsetX:I

.field private final mDialogOutLineOffsetY:I

.field private mDialogRect:Landroid/graphics/RectF;

.field private final mDialogWidth:I

.field private mIsActivation:Z

.field private mIsBoldText:Z

.field private mIsCorrection:Z

.field private mIsMirror:Z

.field private mIsRTL:Z

.field private mIsShadow:Z

.field private mMatrix:Landroid/graphics/Matrix;

.field private final mMaxTextSize:F

.field private mMaxWidth:F

.field private final mMinTextSize:I

.field private final mOutLineOffsetX:I

.field private final mOutLineOffsetY:I

.field private mOutLineRect:Landroid/graphics/RectF;

.field private mRotateDegrees:F

.field private mScaleMultipleOrigin:F

.field private mTemRect:Landroid/graphics/RectF;

.field private mText:Ljava/lang/String;

.field private final mTextAppendPadding:F

.field private mTextDrawable:Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig$TextDrawable;

.field private mTextInDialogRect:Landroid/graphics/RectF;

.field private mTextRect:Landroid/graphics/RectF;

.field private mTextStyle:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;

.field private mTextTransparent:F

.field private mUserLocationX:F

.field private mUserLocationY:F

.field private mUserScaleMultiple:F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig$1;

    invoke-direct {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig$1;-><init>()V

    sput-object v0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mIsRTL:Z

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Configuration;->getLayoutDirection()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    iput-boolean v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mIsRTL:Z

    :cond_0
    const v1, 0x7f0604bb

    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    iput v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mOutLineOffsetX:I

    const v1, 0x7f0604bc

    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    iput v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mOutLineOffsetY:I

    const v1, 0x7f0604ad

    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    iput v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mDialogOutLineOffsetX:I

    const v1, 0x7f0604ae

    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    iput v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mDialogOutLineOffsetY:I

    const v1, 0x7f0604ac

    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    iput v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mDialogWidth:I

    const v1, 0x7f0604a8

    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    iput v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mCornerDialogWidth:I

    const v1, 0x7f0604ba

    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    iput v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mMinTextSize:I

    const v1, 0x7f0604aa

    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    iput v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mDefaultStrokeWidth:I

    const/4 v1, 0x5

    iput v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mCorrectionDegrees:I

    const v1, 0x7f0604ab

    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v1

    iput v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mDefaultTextSize:F

    const v1, 0x7f0604b9

    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v1

    iput v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mMaxTextSize:F

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    iput v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mCountSizeSpacing:F

    const v1, 0x7f0604bd

    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v1

    iput v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mTextAppendPadding:F

    const/4 v1, -0x1

    iput v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mColor:I

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mTextStyle:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mText:Ljava/lang/String;

    if-nez v2, :cond_1

    const v2, 0x7f1006d2

    invoke-virtual {p1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mText:Ljava/lang/String;

    :cond_1
    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mIsActivation:Z

    const/4 v2, 0x0

    iput v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mTextTransparent:F

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mIsBoldText:Z

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mIsShadow:Z

    const/high16 v3, -0x40800000    # -1.0f

    iput v3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mDefaultLocationX:F

    iput v3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mDefaultLocationY:F

    iput v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mUserLocationX:F

    iput v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mUserLocationY:F

    const/high16 v3, 0x3f800000    # 1.0f

    iput v3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mUserScaleMultiple:F

    iput v3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mScaleMultipleOrigin:F

    iput v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mRotateDegrees:F

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mIsMirror:Z

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mIsCorrection:Z

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;

    invoke-direct {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mAutoLineLayout:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mAutoLineLayout:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->getPaint()Landroid/graphics/Paint;

    move-result-object v0

    iget v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mDefaultTextSize:F

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setTextSize(F)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mAutoLineLayout:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;

    const v2, 0x7f0604b8

    invoke-virtual {p1, v2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->setLineHeightOffset(F)V

    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mOutLineRect:Landroid/graphics/RectF;

    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mTextRect:Landroid/graphics/RectF;

    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mTextInDialogRect:Landroid/graphics/RectF;

    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mDialogRect:Landroid/graphics/RectF;

    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mTemRect:Landroid/graphics/RectF;

    new-instance p1, Landroid/graphics/Matrix;

    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mMatrix:Landroid/graphics/Matrix;

    new-instance p1, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig$TextDrawable;

    invoke-direct {p1, p0, v1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig$TextDrawable;-><init>(Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig$1;)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mTextDrawable:Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig$TextDrawable;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mAutoLineLayout:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mIsRTL:Z

    if-eqz v0, :cond_2

    sget-object v0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;->RIGHT:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;

    goto :goto_0

    :cond_2
    sget-object v0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;->LEFT:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;

    :goto_0
    invoke-virtual {p1, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->setTextAlignment(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;)V

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 3

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;-><init>(Landroid/content/Context;)V

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableGenericUtils;->readObject(Landroid/os/Parcel;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mDialogModel:Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mColor:I

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableGenericUtils;->readObject(Landroid/os/Parcel;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mTextStyle:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mText:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mIsActivation:Z

    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mTextTransparent:F

    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    goto :goto_1

    :cond_1
    const/4 v0, 0x0

    :goto_1
    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mIsBoldText:Z

    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x1

    goto :goto_2

    :cond_2
    const/4 v0, 0x0

    :goto_2
    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mIsShadow:Z

    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mDefaultLocationX:F

    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mDefaultLocationY:F

    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mUserLocationX:F

    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mUserLocationY:F

    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mUserScaleMultiple:F

    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mScaleMultipleOrigin:F

    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mRotateDegrees:F

    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_3

    const/4 v0, 0x1

    goto :goto_3

    :cond_3
    const/4 v0, 0x0

    :goto_3
    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mIsMirror:Z

    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_4

    const/4 v1, 0x1

    :cond_4
    iput-boolean v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mIsCorrection:Z

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mAutoLineLayout:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;

    invoke-static {}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;->values()[Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;

    move-result-object v2

    aget-object v0, v2, v0

    invoke-virtual {v1, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->setTextAlignment(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;)V

    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result p1

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mMaxWidth:F

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->initForParcelable()V

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;)F
    .locals 0

    iget p0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mDefaultLocationX:F

    return p0
.end method

.method static synthetic access$1000(Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;)Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mAutoLineLayout:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;

    return-object p0
.end method

.method static synthetic access$102(Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;F)F
    .locals 0

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mDefaultLocationX:F

    return p1
.end method

.method static synthetic access$1100(Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;)F
    .locals 0

    iget p0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mUserLocationX:F

    return p0
.end method

.method static synthetic access$1200(Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;)F
    .locals 0

    iget p0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mUserLocationY:F

    return p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;)F
    .locals 0

    iget p0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mDefaultLocationY:F

    return p0
.end method

.method static synthetic access$202(Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;F)F
    .locals 0

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mDefaultLocationY:F

    return p1
.end method

.method static synthetic access$300(Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;)Landroid/graphics/drawable/Drawable;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mDialogDrawable:Landroid/graphics/drawable/Drawable;

    return-object p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;)Landroid/graphics/RectF;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mDialogRect:Landroid/graphics/RectF;

    return-object p0
.end method

.method static synthetic access$500(Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mIsMirror:Z

    return p0
.end method

.method static synthetic access$600(Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;)Z
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->isCornerDialog()Z

    move-result p0

    return p0
.end method

.method static synthetic access$700(Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mColor:I

    return p0
.end method

.method static synthetic access$800(Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mText:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$900(Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;)Landroid/graphics/RectF;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mTextInDialogRect:Landroid/graphics/RectF;

    return-object p0
.end method

.method private configTextPaint(Landroid/graphics/Paint;)V
    .locals 2

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mColor:I

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mTextStyle:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;

    if-nez v0, :cond_0

    sget-object v0, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mTextStyle:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;->getTypeFace()Landroid/graphics/Typeface;

    move-result-object v0

    :goto_0
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->getAlphaByConfig()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setAlpha(I)V

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mIsBoldText:Z

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mIsShadow:Z

    if-eqz v0, :cond_1

    const/high16 v0, 0x66000000

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {p1, v1, v1, v1, v0}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    goto :goto_1

    :cond_1
    invoke-virtual {p1}, Landroid/graphics/Paint;->clearShadowLayer()V

    :goto_1
    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->isDialogEnable()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->isCornerDialog()Z

    move-result v0

    if-eqz v0, :cond_3

    :cond_2
    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mDefaultTextSize:F

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setTextSize(F)V

    :cond_3
    return-void
.end method

.method private countDialog()V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mDialogDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v0

    int-to-float v0, v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mDialogDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v1

    int-to-float v1, v1

    iget v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mDialogWidth:I

    int-to-float v2, v2

    div-float/2addr v2, v0

    mul-float v1, v1, v2

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mDialogWidth:I

    int-to-float v0, v0

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v1, v2

    div-float/2addr v0, v2

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mDialogRect:Landroid/graphics/RectF;

    neg-float v3, v0

    neg-float v4, v1

    invoke-virtual {v2, v3, v4, v0, v1}, Landroid/graphics/RectF;->set(FFFF)V

    return-void
.end method

.method private countDialogCorner()V
    .locals 8

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mAutoLineLayout:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mTextRect:Landroid/graphics/RectF;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->getTextRect(Landroid/graphics/RectF;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mDialogDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v0

    int-to-float v0, v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mDialogDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v1

    int-to-float v1, v1

    iget v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mCornerDialogWidth:I

    int-to-float v2, v2

    div-float/2addr v2, v0

    mul-float v1, v1, v2

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mCornerDialogWidth:I

    int-to-float v0, v0

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v1, v2

    div-float/2addr v0, v2

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mDialogRect:Landroid/graphics/RectF;

    neg-float v4, v0

    neg-float v5, v1

    invoke-virtual {v3, v4, v5, v0, v1}, Landroid/graphics/RectF;->set(FFFF)V

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mTextRect:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->width()F

    move-result v3

    div-float/2addr v3, v2

    iget-object v6, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mTextRect:Landroid/graphics/RectF;

    invoke-virtual {v6}, Landroid/graphics/RectF;->height()F

    move-result v6

    div-float/2addr v6, v2

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mTextInDialogRect:Landroid/graphics/RectF;

    iget-object v7, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mTextRect:Landroid/graphics/RectF;

    invoke-virtual {v2, v7}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mDialogModel:Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;

    iget v2, v2, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;->cornerPosition:I

    packed-switch v2, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mDialogRect:Landroid/graphics/RectF;

    invoke-virtual {v0, v3, v6}, Landroid/graphics/RectF;->offset(FF)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mTextInDialogRect:Landroid/graphics/RectF;

    invoke-virtual {v0, v4, v5}, Landroid/graphics/RectF;->offset(FF)V

    goto :goto_0

    :pswitch_1
    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mDialogRect:Landroid/graphics/RectF;

    neg-float v2, v3

    invoke-virtual {v1, v2, v6}, Landroid/graphics/RectF;->offset(FF)V

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mTextInDialogRect:Landroid/graphics/RectF;

    invoke-virtual {v1, v0, v5}, Landroid/graphics/RectF;->offset(FF)V

    goto :goto_0

    :pswitch_2
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mDialogRect:Landroid/graphics/RectF;

    neg-float v2, v6

    invoke-virtual {v0, v3, v2}, Landroid/graphics/RectF;->offset(FF)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mTextInDialogRect:Landroid/graphics/RectF;

    invoke-virtual {v0, v4, v1}, Landroid/graphics/RectF;->offset(FF)V

    goto :goto_0

    :pswitch_3
    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mDialogRect:Landroid/graphics/RectF;

    neg-float v3, v3

    neg-float v4, v6

    invoke-virtual {v2, v3, v4}, Landroid/graphics/RectF;->offset(FF)V

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mTextInDialogRect:Landroid/graphics/RectF;

    invoke-virtual {v2, v0, v1}, Landroid/graphics/RectF;->offset(FF)V

    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private countOutLine()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mAutoLineLayout:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mTextRect:Landroid/graphics/RectF;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->getTextRect(Landroid/graphics/RectF;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->isDialogEnable()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mText:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mTextRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->setEmpty()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mTextRect:Landroid/graphics/RectF;

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mDefaultStrokeWidth:I

    neg-int v1, v1

    int-to-float v1, v1

    iget v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mDefaultStrokeWidth:I

    neg-int v2, v2

    int-to-float v2, v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/RectF;->inset(FF)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mOutLineRect:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mTextRect:Landroid/graphics/RectF;

    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    goto :goto_0

    :cond_1
    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->isCornerDialog()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mOutLineRect:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mDialogRect:Landroid/graphics/RectF;

    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mOutLineRect:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mTextInDialogRect:Landroid/graphics/RectF;

    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->union(Landroid/graphics/RectF;)V

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mOutLineRect:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mDialogRect:Landroid/graphics/RectF;

    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    :goto_0
    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->isDialogEnable()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mOutLineRect:Landroid/graphics/RectF;

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mDialogOutLineOffsetX:I

    neg-int v1, v1

    int-to-float v1, v1

    iget v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mDialogOutLineOffsetY:I

    neg-int v2, v2

    int-to-float v2, v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/RectF;->inset(FF)V

    goto :goto_1

    :cond_3
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mOutLineRect:Landroid/graphics/RectF;

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mOutLineOffsetX:I

    neg-int v1, v1

    int-to-float v1, v1

    iget v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mOutLineOffsetY:I

    neg-int v2, v2

    int-to-float v2, v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/RectF;->inset(FF)V

    :goto_1
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mOutLineRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->getScaleMultiple()F

    move-result v1

    mul-float v0, v0, v1

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mOutLineRect:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v1

    sub-float/2addr v0, v1

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mOutLineRect:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->height()F

    move-result v2

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->getScaleMultiple()F

    move-result v3

    mul-float v2, v2, v3

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mOutLineRect:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->height()F

    move-result v3

    sub-float/2addr v2, v3

    div-float/2addr v2, v1

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mOutLineRect:Landroid/graphics/RectF;

    neg-float v0, v0

    neg-float v2, v2

    invoke-virtual {v1, v0, v2}, Landroid/graphics/RectF;->inset(FF)V

    return-void
.end method

.method private countTextInDialog()V
    .locals 8

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mTextInDialogRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->setEmpty()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mText:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mAutoLineLayout:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mText:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->setText(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mTextInDialogRect:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mDialogRect:Landroid/graphics/RectF;

    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mDialogModel:Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mTextInDialogRect:Landroid/graphics/RectF;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;->configRect(Landroid/graphics/RectF;Z)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mAutoLineLayout:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mTextInDialogRect:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->width()F

    move-result v3

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mTextInDialogRect:Landroid/graphics/RectF;

    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    move-result v4

    iget v5, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mMinTextSize:I

    int-to-float v5, v5

    iget v6, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mMaxTextSize:F

    iget v7, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mCountSizeSpacing:F

    invoke-virtual/range {v2 .. v7}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->countTextArea(FFFFF)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    const-string v4, "TextAppendConfig"

    const-string v5, "\u6d4b\u91cf\u8017\u65f6\uff1a %d"

    sub-long/2addr v2, v0

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {v4, v5, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method private countTextNormal(F)V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mAutoLineLayout:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mText:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->setText(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mAutoLineLayout:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;

    const/high16 v3, -0x40800000    # -1.0f

    invoke-virtual {v2, p1, v3}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->countText(FF)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    const-string p1, "TextAppendConfig"

    const-string v4, "\u6587\u5b57\u8ba1\u7b97\u8017\u65f6\uff1a %d"

    sub-long/2addr v2, v0

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {p1, v4, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method private getAlphaByConfig()I
    .locals 2

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mTextTransparent:F

    const/high16 v1, 0x43660000    # 230.0f

    mul-float v0, v0, v1

    const/high16 v1, 0x437f0000    # 255.0f

    sub-float/2addr v1, v0

    float-to-int v0, v1

    return v0
.end method

.method private initForParcelable()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mDialogModel:Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mDialogModel:Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;->readDialogDrawable(Landroid/content/res/Resources;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mDialogDrawable:Landroid/graphics/drawable/Drawable;

    :cond_0
    const/4 v0, 0x1

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mMaxWidth:F

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->countLocation(ZF)V

    return-void
.end method

.method private isCornerDialog()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mDialogModel:Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mDialogModel:Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;

    iget-boolean v0, v0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;->isCorner:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private offsetRect(Landroid/graphics/RectF;)V
    .locals 3

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mDefaultLocationX:F

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mUserLocationX:F

    add-float/2addr v0, v1

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mDefaultLocationY:F

    iget v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mUserLocationY:F

    add-float/2addr v1, v2

    invoke-virtual {p1, v0, v1}, Landroid/graphics/RectF;->offset(FF)V

    return-void
.end method


# virtual methods
.method public appendUserLocationX(F)V
    .locals 1

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mUserLocationX:F

    add-float/2addr v0, p1

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mUserLocationX:F

    return-void
.end method

.method public appendUserLocationY(F)V
    .locals 1

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mUserLocationY:F

    add-float/2addr v0, p1

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mUserLocationY:F

    return-void
.end method

.method public contains(FF)Z
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mTemRect:Landroid/graphics/RectF;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->getOutLineRect(Landroid/graphics/RectF;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->getRotateDegrees()F

    move-result v1

    neg-float v1, v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mTemRect:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->centerX()F

    move-result v2

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mTemRect:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->centerY()F

    move-result v3

    invoke-virtual {v0, v1, v2, v3}, Landroid/graphics/Matrix;->postRotate(FFF)Z

    const/4 v0, 0x2

    new-array v0, v0, [F

    const/4 v1, 0x0

    aput p1, v0, v1

    const/4 p1, 0x1

    aput p2, v0, p1

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p2, v0}, Landroid/graphics/Matrix;->mapPoints([F)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mTemRect:Landroid/graphics/RectF;

    aget v1, v0, v1

    aget p1, v0, p1

    invoke-virtual {p2, v1, p1}, Landroid/graphics/RectF;->contains(FF)Z

    move-result p1

    return p1
.end method

.method public countLocation(ZF)V
    .locals 1

    iput p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mMaxWidth:F

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mScaleMultipleOrigin:F

    div-float/2addr p2, v0

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mTextAppendPadding:F

    sub-float/2addr p2, v0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mAutoLineLayout:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->getPaint()Landroid/graphics/Paint;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->configTextPaint(Landroid/graphics/Paint;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->isDialogEnable()Z

    move-result v0

    if-nez v0, :cond_1

    if-eqz p1, :cond_0

    invoke-direct {p0, p2}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->countTextNormal(F)V

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->countOutLine()V

    goto :goto_0

    :cond_1
    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->isCornerDialog()Z

    move-result v0

    if-eqz v0, :cond_3

    if-eqz p1, :cond_2

    invoke-direct {p0, p2}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->countTextNormal(F)V

    :cond_2
    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->countDialogCorner()V

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->countOutLine()V

    goto :goto_0

    :cond_3
    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->countDialog()V

    if-eqz p1, :cond_4

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->countTextInDialog()V

    :cond_4
    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->countOutLine()V

    :goto_0
    return-void
.end method

.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mTextDrawable:Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig$TextDrawable;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mTextDrawable:Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig$TextDrawable;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig$TextDrawable;->draw(Landroid/graphics/Canvas;)V

    :cond_0
    return-void
.end method

.method public getColor()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mColor:I

    return v0
.end method

.method public getDialogModel()Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mDialogModel:Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;

    return-object v0
.end method

.method public getDialogStatusData(Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;)V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->getUserLocationX()F

    move-result v0

    iput v0, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->itemPositionX:F

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->getUserLocationY()F

    move-result v0

    iput v0, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->itemPositionY:F

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->getUserScaleMultiple()F

    move-result v0

    iput v0, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->itemScale:F

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->getRotateDegrees()F

    move-result v0

    iput v0, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->itemDegree:F

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->getColor()I

    move-result v0

    iput v0, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->color:I

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->getTextTransparent()F

    move-result v0

    iput v0, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->transparentProgress:F

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->getTextStyle()Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;

    move-result-object v0

    iput-object v0, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->textStyle:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->isBoldText()Z

    move-result v0

    iput-boolean v0, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->textBold:Z

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->isShadow()Z

    move-result v0

    iput-boolean v0, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->textShadow:Z

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->getTextAlignment()Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;

    move-result-object v0

    iput-object v0, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->textAlignment:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->getText()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->text:Ljava/lang/String;

    return-void
.end method

.method public getOutLineRect(Landroid/graphics/RectF;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mOutLineRect:Landroid/graphics/RectF;

    invoke-virtual {p1, v0}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->offsetRect(Landroid/graphics/RectF;)V

    return-void
.end method

.method public getRotateDegrees()F
    .locals 4

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mRotateDegrees:F

    const/4 v1, 0x0

    cmpg-float v2, v0, v1

    const/high16 v3, 0x43b40000    # 360.0f

    if-gez v2, :cond_0

    add-float/2addr v0, v3

    :cond_0
    rem-float/2addr v0, v3

    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mIsCorrection:Z

    cmpl-float v2, v0, v1

    const/4 v3, 0x1

    if-lez v2, :cond_1

    iget v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mCorrectionDegrees:I

    int-to-float v2, v2

    cmpg-float v2, v0, v2

    if-gez v2, :cond_1

    iput-boolean v3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mIsCorrection:Z

    const/4 v0, 0x0

    :cond_1
    iget v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mCorrectionDegrees:I

    rsub-int v2, v2, 0x168

    int-to-float v2, v2

    cmpl-float v2, v0, v2

    if-lez v2, :cond_2

    iput-boolean v3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mIsCorrection:Z

    const/4 v0, 0x0

    :cond_2
    const/high16 v1, 0x42b40000    # 90.0f

    cmpl-float v2, v0, v1

    if-eqz v2, :cond_3

    iget v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mCorrectionDegrees:I

    rsub-int/lit8 v2, v2, 0x5a

    int-to-float v2, v2

    cmpl-float v2, v0, v2

    if-lez v2, :cond_3

    iget v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mCorrectionDegrees:I

    add-int/lit8 v2, v2, 0x5a

    int-to-float v2, v2

    cmpg-float v2, v0, v2

    if-gez v2, :cond_3

    iput-boolean v3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mIsCorrection:Z

    const/high16 v0, 0x42b40000    # 90.0f

    :cond_3
    const/high16 v1, 0x43340000    # 180.0f

    cmpl-float v2, v0, v1

    if-eqz v2, :cond_4

    iget v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mCorrectionDegrees:I

    rsub-int v2, v2, 0xb4

    int-to-float v2, v2

    cmpl-float v2, v0, v2

    if-lez v2, :cond_4

    iget v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mCorrectionDegrees:I

    add-int/lit16 v2, v2, 0xb4

    int-to-float v2, v2

    cmpg-float v2, v0, v2

    if-gez v2, :cond_4

    iput-boolean v3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mIsCorrection:Z

    const/high16 v0, 0x43340000    # 180.0f

    :cond_4
    const/high16 v1, 0x43870000    # 270.0f

    cmpl-float v2, v0, v1

    if-eqz v2, :cond_5

    iget v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mCorrectionDegrees:I

    rsub-int v2, v2, 0x10e

    int-to-float v2, v2

    cmpl-float v2, v0, v2

    if-lez v2, :cond_5

    iget v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mCorrectionDegrees:I

    add-int/lit16 v2, v2, 0x10e

    int-to-float v2, v2

    cmpg-float v2, v0, v2

    if-gez v2, :cond_5

    iput-boolean v3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mIsCorrection:Z

    const/high16 v0, 0x43870000    # 270.0f

    :cond_5
    return v0
.end method

.method public getSampleName()Ljava/lang/String;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mDialogModel:Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "dialog_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mDialogModel:Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;

    iget-object v1, v1, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    const-string v0, "dialog_none"

    return-object v0
.end method

.method public getScaleMultiple()F
    .locals 2

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mUserScaleMultiple:F

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mScaleMultipleOrigin:F

    mul-float v0, v0, v1

    return v0
.end method

.method public getText()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mText:Ljava/lang/String;

    return-object v0
.end method

.method public getTextAlignment()Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mAutoLineLayout:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->getTextAlignment()Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;

    move-result-object v0

    return-object v0
.end method

.method public getTextStyle()Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mTextStyle:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;

    return-object v0
.end method

.method public getTextTransparent()F
    .locals 1

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mTextTransparent:F

    return v0
.end method

.method public getUserLocationX()F
    .locals 1

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mUserLocationX:F

    return v0
.end method

.method public getUserLocationY()F
    .locals 1

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mUserLocationY:F

    return v0
.end method

.method public getUserScaleMultiple()F
    .locals 1

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mUserScaleMultiple:F

    return v0
.end method

.method public isActivation()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mIsActivation:Z

    return v0
.end method

.method public isBoldText()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mIsBoldText:Z

    return v0
.end method

.method public isDialogEnable()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mDialogModel:Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mDialogModel:Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;->hasDialog()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isReverseColor()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public isShadow()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mIsShadow:Z

    return v0
.end method

.method public isWatermark()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public refreshRotateDegree()V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->getRotateDegrees()F

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mRotateDegrees:F

    return-void
.end method

.method public reverseColor(I)V
    .locals 0

    return-void
.end method

.method public setActivation(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mIsActivation:Z

    return-void
.end method

.method public setBoldText(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mIsBoldText:Z

    return-void
.end method

.method public setColor(I)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mColor:I

    return-void
.end method

.method public setDialogModel(Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;Landroid/content/res/Resources;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mDialogModel:Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;->readDialogDrawable(Landroid/content/res/Resources;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mDialogDrawable:Landroid/graphics/drawable/Drawable;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mDialogDrawable:Landroid/graphics/drawable/Drawable;

    if-nez p1, :cond_0

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mDialogModel:Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;

    :cond_0
    return-void
.end method

.method public setDialogWithStatusData(Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;)V
    .locals 1

    iget v0, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->itemPositionX:F

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->setUserLocationX(F)V

    iget v0, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->itemPositionY:F

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->setUserLocationY(F)V

    iget v0, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->itemScale:F

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->setUserScaleMultiple(F)V

    iget v0, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->itemDegree:F

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->setRotateDegrees(F)V

    iget v0, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->color:I

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->setColor(I)V

    iget v0, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->transparentProgress:F

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->setTextTransparent(F)V

    iget-object v0, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->textStyle:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->setTextStyle(Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;)V

    iget-boolean v0, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->textBold:Z

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->setBoldText(Z)V

    iget-boolean v0, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->textShadow:Z

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->setShadow(Z)V

    iget-object v0, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->textAlignment:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->setTextAlignment(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;)V

    iget-object v0, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->text:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object p1, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->text:Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->setText(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public setDisplaySize(FF)V
    .locals 1

    const/high16 v0, 0x40000000    # 2.0f

    div-float/2addr p1, v0

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mDefaultLocationX:F

    div-float/2addr p2, v0

    iput p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mDefaultLocationY:F

    return-void
.end method

.method public setDrawOutline(Z)V
    .locals 0

    return-void
.end method

.method public setRotateDegrees(F)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mRotateDegrees:F

    return-void
.end method

.method public setScaleMultipleOrigin(F)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mScaleMultipleOrigin:F

    return-void
.end method

.method public setShadow(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mIsShadow:Z

    return-void
.end method

.method public setText(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mText:Ljava/lang/String;

    return-void
.end method

.method public setTextAlignment(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mAutoLineLayout:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->setTextAlignment(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;)V

    return-void
.end method

.method public setTextStyle(Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mTextStyle:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;

    return-void
.end method

.method public setTextTransparent(F)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mTextTransparent:F

    return-void
.end method

.method public setUserLocationX(F)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mUserLocationX:F

    return-void
.end method

.method public setUserLocationY(F)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mUserLocationY:F

    return-void
.end method

.method public setUserScaleMultiple(F)V
    .locals 1

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mUserScaleMultiple:F

    iget p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mUserScaleMultiple:F

    const v0, 0x3e99999a    # 0.3f

    cmpg-float p1, p1, v0

    if-gez p1, :cond_0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mUserScaleMultiple:F

    :cond_0
    iget p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mUserScaleMultiple:F

    const/high16 v0, 0x40a00000    # 5.0f

    cmpl-float p1, p1, v0

    if-lez p1, :cond_1

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mUserScaleMultiple:F

    :cond_1
    return-void
.end method

.method public toggleMirror()V
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mIsMirror:Z

    xor-int/lit8 v0, v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mIsMirror:Z

    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mDialogModel:Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;

    invoke-static {p1, p2, v0}, Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableGenericUtils;->writeObject(Landroid/os/Parcel;ILandroid/os/Parcelable;)V

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mColor:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mTextStyle:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;

    invoke-static {p1, p2, v0}, Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableGenericUtils;->writeObject(Landroid/os/Parcel;ILandroid/os/Parcelable;)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mText:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget-boolean p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mIsActivation:Z

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeByte(B)V

    iget p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mTextTransparent:F

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeFloat(F)V

    iget-boolean p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mIsBoldText:Z

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeByte(B)V

    iget-boolean p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mIsShadow:Z

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeByte(B)V

    iget p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mDefaultLocationX:F

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeFloat(F)V

    iget p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mDefaultLocationY:F

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeFloat(F)V

    iget p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mUserLocationX:F

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeFloat(F)V

    iget p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mUserLocationY:F

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeFloat(F)V

    iget p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mUserScaleMultiple:F

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeFloat(F)V

    iget p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mScaleMultipleOrigin:F

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeFloat(F)V

    iget p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mRotateDegrees:F

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeFloat(F)V

    iget-boolean p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mIsMirror:Z

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeByte(B)V

    iget-boolean p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mIsCorrection:Z

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeByte(B)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mAutoLineLayout:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;

    invoke-virtual {p2}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->getTextAlignment()Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;

    move-result-object p2

    invoke-virtual {p2}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;->ordinal()I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    iget p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->mMaxWidth:F

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeFloat(F)V

    return-void
.end method
