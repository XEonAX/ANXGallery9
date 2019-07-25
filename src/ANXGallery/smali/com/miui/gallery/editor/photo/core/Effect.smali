.class public final Lcom/miui/gallery/editor/photo/core/Effect;
.super Ljava/lang/Object;
.source "Effect.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/miui/gallery/editor/photo/core/SdkProvider;",
        ">",
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable;"
    }
.end annotation


# static fields
.field public static final ADJUST:Lcom/miui/gallery/editor/photo/core/Effect;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/editor/photo/core/Effect<",
            "Lcom/miui/gallery/editor/photo/core/SdkProvider<",
            "Lcom/miui/gallery/editor/photo/core/common/model/AdjustData;",
            "Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final BEAUTIFY:Lcom/miui/gallery/editor/photo/core/Effect;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/editor/photo/core/Effect<",
            "Lcom/miui/gallery/editor/photo/core/SdkProvider<",
            "Lcom/miui/gallery/editor/photo/core/common/model/BeautifyData;",
            "Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/miui/gallery/editor/photo/core/Effect;",
            ">;"
        }
    .end annotation
.end field

.field public static final CROP:Lcom/miui/gallery/editor/photo/core/Effect;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/editor/photo/core/Effect<",
            "Lcom/miui/gallery/editor/photo/core/SdkProvider<",
            "Lcom/miui/gallery/editor/photo/core/common/model/CropData;",
            "Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractCropFragment;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final DOODLE:Lcom/miui/gallery/editor/photo/core/Effect;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/editor/photo/core/Effect<",
            "Lcom/miui/gallery/editor/photo/core/SdkProvider<",
            "Lcom/miui/gallery/editor/photo/core/common/model/DoodleData;",
            "Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractDoodleFragment;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final FILTER:Lcom/miui/gallery/editor/photo/core/Effect;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/editor/photo/core/Effect<",
            "Lcom/miui/gallery/editor/photo/core/SdkProvider<",
            "Lcom/miui/gallery/editor/photo/core/common/model/FilterCategory;",
            "Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final FRAME:Lcom/miui/gallery/editor/photo/core/Effect;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/editor/photo/core/Effect<",
            "Lcom/miui/gallery/editor/photo/core/SdkProvider<",
            "Lcom/miui/gallery/editor/photo/core/common/model/FrameData;",
            "Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractFrameFragment;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final LONG_CROP:Lcom/miui/gallery/editor/photo/core/Effect;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/editor/photo/core/Effect<",
            "Lcom/miui/gallery/editor/photo/core/SdkProvider<",
            "Ljava/lang/Object;",
            "Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractLongCropFragment;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final MIUIBEAUTIFY:Lcom/miui/gallery/editor/photo/core/Effect;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/editor/photo/core/Effect<",
            "Lcom/miui/gallery/editor/photo/core/SdkProvider<",
            "Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautifyData;",
            "Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final MOSAIC:Lcom/miui/gallery/editor/photo/core/Effect;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/editor/photo/core/Effect<",
            "Lcom/miui/gallery/editor/photo/core/SdkProvider<",
            "Lcom/miui/gallery/editor/photo/core/common/model/MosaicData;",
            "Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractMosaicFragment;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final REMOVER:Lcom/miui/gallery/editor/photo/core/Effect;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/editor/photo/core/Effect<",
            "Lcom/miui/gallery/editor/photo/core/SdkProvider<",
            "Lcom/miui/gallery/editor/photo/core/common/model/RemoverData;",
            "Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractRemoverFragment;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final STICKER:Lcom/miui/gallery/editor/photo/core/Effect;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/editor/photo/core/Effect<",
            "Lcom/miui/gallery/editor/photo/core/common/provider/AbstractStickerProvider;",
            ">;"
        }
    .end annotation
.end field

.field public static final TEXT:Lcom/miui/gallery/editor/photo/core/Effect;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/editor/photo/core/Effect<",
            "Lcom/miui/gallery/editor/photo/core/common/provider/AbstractTextProvider;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mName:Ljava/lang/String;

.field private mOrdinal:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Lcom/miui/gallery/editor/photo/core/Effect;

    const-string v1, "FILTER"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/miui/gallery/editor/photo/core/Effect;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/editor/photo/core/Effect;->FILTER:Lcom/miui/gallery/editor/photo/core/Effect;

    new-instance v0, Lcom/miui/gallery/editor/photo/core/Effect;

    const-string v1, "ADJUST"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/miui/gallery/editor/photo/core/Effect;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/editor/photo/core/Effect;->ADJUST:Lcom/miui/gallery/editor/photo/core/Effect;

    new-instance v0, Lcom/miui/gallery/editor/photo/core/Effect;

    const-string v1, "CROP"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/miui/gallery/editor/photo/core/Effect;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/editor/photo/core/Effect;->CROP:Lcom/miui/gallery/editor/photo/core/Effect;

    new-instance v0, Lcom/miui/gallery/editor/photo/core/Effect;

    const-string v1, "DOODLE"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/miui/gallery/editor/photo/core/Effect;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/editor/photo/core/Effect;->DOODLE:Lcom/miui/gallery/editor/photo/core/Effect;

    new-instance v0, Lcom/miui/gallery/editor/photo/core/Effect;

    const-string v1, "STICKER"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lcom/miui/gallery/editor/photo/core/Effect;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/editor/photo/core/Effect;->STICKER:Lcom/miui/gallery/editor/photo/core/Effect;

    new-instance v0, Lcom/miui/gallery/editor/photo/core/Effect;

    const-string v1, "BEAUTIFY"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/miui/gallery/editor/photo/core/Effect;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/editor/photo/core/Effect;->BEAUTIFY:Lcom/miui/gallery/editor/photo/core/Effect;

    new-instance v0, Lcom/miui/gallery/editor/photo/core/Effect;

    const-string v1, "LONG_CROP"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/miui/gallery/editor/photo/core/Effect;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/editor/photo/core/Effect;->LONG_CROP:Lcom/miui/gallery/editor/photo/core/Effect;

    new-instance v0, Lcom/miui/gallery/editor/photo/core/Effect;

    const-string v1, "TEXT"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/miui/gallery/editor/photo/core/Effect;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/editor/photo/core/Effect;->TEXT:Lcom/miui/gallery/editor/photo/core/Effect;

    new-instance v0, Lcom/miui/gallery/editor/photo/core/Effect;

    const-string v1, "MOSAIC"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lcom/miui/gallery/editor/photo/core/Effect;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/editor/photo/core/Effect;->MOSAIC:Lcom/miui/gallery/editor/photo/core/Effect;

    new-instance v0, Lcom/miui/gallery/editor/photo/core/Effect;

    const-string v1, "REMOVER"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lcom/miui/gallery/editor/photo/core/Effect;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/editor/photo/core/Effect;->REMOVER:Lcom/miui/gallery/editor/photo/core/Effect;

    new-instance v0, Lcom/miui/gallery/editor/photo/core/Effect;

    const-string v1, "MIUIBEAUTIFY"

    const/16 v2, 0xa

    invoke-direct {v0, v1, v2}, Lcom/miui/gallery/editor/photo/core/Effect;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/editor/photo/core/Effect;->MIUIBEAUTIFY:Lcom/miui/gallery/editor/photo/core/Effect;

    new-instance v0, Lcom/miui/gallery/editor/photo/core/Effect;

    const-string v1, "FRAME"

    const/16 v2, 0xb

    invoke-direct {v0, v1, v2}, Lcom/miui/gallery/editor/photo/core/Effect;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/editor/photo/core/Effect;->FRAME:Lcom/miui/gallery/editor/photo/core/Effect;

    new-instance v0, Lcom/miui/gallery/editor/photo/core/Effect$1;

    invoke-direct {v0}, Lcom/miui/gallery/editor/photo/core/Effect$1;-><init>()V

    sput-object v0, Lcom/miui/gallery/editor/photo/core/Effect;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/Effect;->mOrdinal:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/Effect;->mName:Ljava/lang/String;

    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/miui/gallery/editor/photo/core/Effect$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/Effect;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p2, p0, Lcom/miui/gallery/editor/photo/core/Effect;->mOrdinal:I

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/Effect;->mName:Ljava/lang/String;

    return-void
.end method

.method public static values()[Lcom/miui/gallery/editor/photo/core/Effect;
    .locals 3

    const/16 v0, 0xc

    new-array v0, v0, [Lcom/miui/gallery/editor/photo/core/Effect;

    sget-object v1, Lcom/miui/gallery/editor/photo/core/Effect;->FILTER:Lcom/miui/gallery/editor/photo/core/Effect;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lcom/miui/gallery/editor/photo/core/Effect;->ADJUST:Lcom/miui/gallery/editor/photo/core/Effect;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lcom/miui/gallery/editor/photo/core/Effect;->CROP:Lcom/miui/gallery/editor/photo/core/Effect;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    sget-object v1, Lcom/miui/gallery/editor/photo/core/Effect;->DOODLE:Lcom/miui/gallery/editor/photo/core/Effect;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    sget-object v1, Lcom/miui/gallery/editor/photo/core/Effect;->STICKER:Lcom/miui/gallery/editor/photo/core/Effect;

    const/4 v2, 0x4

    aput-object v1, v0, v2

    sget-object v1, Lcom/miui/gallery/editor/photo/core/Effect;->BEAUTIFY:Lcom/miui/gallery/editor/photo/core/Effect;

    const/4 v2, 0x5

    aput-object v1, v0, v2

    sget-object v1, Lcom/miui/gallery/editor/photo/core/Effect;->LONG_CROP:Lcom/miui/gallery/editor/photo/core/Effect;

    const/4 v2, 0x6

    aput-object v1, v0, v2

    sget-object v1, Lcom/miui/gallery/editor/photo/core/Effect;->TEXT:Lcom/miui/gallery/editor/photo/core/Effect;

    const/4 v2, 0x7

    aput-object v1, v0, v2

    sget-object v1, Lcom/miui/gallery/editor/photo/core/Effect;->MOSAIC:Lcom/miui/gallery/editor/photo/core/Effect;

    const/16 v2, 0x8

    aput-object v1, v0, v2

    sget-object v1, Lcom/miui/gallery/editor/photo/core/Effect;->REMOVER:Lcom/miui/gallery/editor/photo/core/Effect;

    const/16 v2, 0x9

    aput-object v1, v0, v2

    sget-object v1, Lcom/miui/gallery/editor/photo/core/Effect;->MIUIBEAUTIFY:Lcom/miui/gallery/editor/photo/core/Effect;

    const/16 v2, 0xa

    aput-object v1, v0, v2

    sget-object v1, Lcom/miui/gallery/editor/photo/core/Effect;->FRAME:Lcom/miui/gallery/editor/photo/core/Effect;

    const/16 v2, 0xb

    aput-object v1, v0, v2

    return-object v0
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public name()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/Effect;->mName:Ljava/lang/String;

    return-object v0
.end method

.method public ordinal()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/Effect;->mOrdinal:I

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/Effect;->mName:Ljava/lang/String;

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    iget p2, p0, Lcom/miui/gallery/editor/photo/core/Effect;->mOrdinal:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/Effect;->mName:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return-void
.end method
