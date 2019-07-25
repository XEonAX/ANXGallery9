.class public final enum Lcom/miui/gallery/sdk/download/DownloadType;
.super Ljava/lang/Enum;
.source "DownloadType.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/miui/gallery/sdk/download/DownloadType;",
        ">;",
        "Landroid/os/Parcelable;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/miui/gallery/sdk/download/DownloadType;

.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/miui/gallery/sdk/download/DownloadType;",
            ">;"
        }
    .end annotation
.end field

.field public static final enum MICRO:Lcom/miui/gallery/sdk/download/DownloadType;

.field public static final enum MICRO_BATCH:Lcom/miui/gallery/sdk/download/DownloadType;

.field public static final enum ORIGIN:Lcom/miui/gallery/sdk/download/DownloadType;

.field public static final enum ORIGIN_BATCH:Lcom/miui/gallery/sdk/download/DownloadType;

.field public static final enum ORIGIN_FORCE:Lcom/miui/gallery/sdk/download/DownloadType;

.field public static final enum THUMBNAIL:Lcom/miui/gallery/sdk/download/DownloadType;

.field public static final enum THUMBNAIL_BATCH:Lcom/miui/gallery/sdk/download/DownloadType;


# instance fields
.field private mIsBackground:Z

.field private mPriority:I


# direct methods
.method static constructor <clinit>()V
    .locals 11

    new-instance v0, Lcom/miui/gallery/sdk/download/DownloadType;

    const-string v1, "ORIGIN"

    const/16 v2, 0xa

    const/4 v3, 0x0

    invoke-direct {v0, v1, v3, v2, v3}, Lcom/miui/gallery/sdk/download/DownloadType;-><init>(Ljava/lang/String;IIZ)V

    sput-object v0, Lcom/miui/gallery/sdk/download/DownloadType;->ORIGIN:Lcom/miui/gallery/sdk/download/DownloadType;

    new-instance v0, Lcom/miui/gallery/sdk/download/DownloadType;

    const-string v1, "ORIGIN_FORCE"

    const/4 v4, 0x1

    const/16 v5, 0xb

    invoke-direct {v0, v1, v4, v5, v3}, Lcom/miui/gallery/sdk/download/DownloadType;-><init>(Ljava/lang/String;IIZ)V

    sput-object v0, Lcom/miui/gallery/sdk/download/DownloadType;->ORIGIN_FORCE:Lcom/miui/gallery/sdk/download/DownloadType;

    new-instance v0, Lcom/miui/gallery/sdk/download/DownloadType;

    const-string v1, "THUMBNAIL"

    const/4 v5, 0x2

    const/16 v6, 0xc

    invoke-direct {v0, v1, v5, v6, v3}, Lcom/miui/gallery/sdk/download/DownloadType;-><init>(Ljava/lang/String;IIZ)V

    sput-object v0, Lcom/miui/gallery/sdk/download/DownloadType;->THUMBNAIL:Lcom/miui/gallery/sdk/download/DownloadType;

    new-instance v0, Lcom/miui/gallery/sdk/download/DownloadType;

    const-string v1, "MICRO"

    const/4 v6, 0x3

    const/16 v7, 0xd

    invoke-direct {v0, v1, v6, v7, v3}, Lcom/miui/gallery/sdk/download/DownloadType;-><init>(Ljava/lang/String;IIZ)V

    sput-object v0, Lcom/miui/gallery/sdk/download/DownloadType;->MICRO:Lcom/miui/gallery/sdk/download/DownloadType;

    new-instance v0, Lcom/miui/gallery/sdk/download/DownloadType;

    const-string v1, "THUMBNAIL_BATCH"

    const/4 v7, 0x7

    const/4 v8, 0x4

    invoke-direct {v0, v1, v8, v7, v4}, Lcom/miui/gallery/sdk/download/DownloadType;-><init>(Ljava/lang/String;IIZ)V

    sput-object v0, Lcom/miui/gallery/sdk/download/DownloadType;->THUMBNAIL_BATCH:Lcom/miui/gallery/sdk/download/DownloadType;

    new-instance v0, Lcom/miui/gallery/sdk/download/DownloadType;

    const-string v1, "ORIGIN_BATCH"

    const/4 v9, 0x5

    invoke-direct {v0, v1, v9, v2, v4}, Lcom/miui/gallery/sdk/download/DownloadType;-><init>(Ljava/lang/String;IIZ)V

    sput-object v0, Lcom/miui/gallery/sdk/download/DownloadType;->ORIGIN_BATCH:Lcom/miui/gallery/sdk/download/DownloadType;

    new-instance v0, Lcom/miui/gallery/sdk/download/DownloadType;

    const-string v1, "MICRO_BATCH"

    const/4 v2, 0x6

    const/16 v10, 0x8

    invoke-direct {v0, v1, v2, v10, v4}, Lcom/miui/gallery/sdk/download/DownloadType;-><init>(Ljava/lang/String;IIZ)V

    sput-object v0, Lcom/miui/gallery/sdk/download/DownloadType;->MICRO_BATCH:Lcom/miui/gallery/sdk/download/DownloadType;

    new-array v0, v7, [Lcom/miui/gallery/sdk/download/DownloadType;

    sget-object v1, Lcom/miui/gallery/sdk/download/DownloadType;->ORIGIN:Lcom/miui/gallery/sdk/download/DownloadType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/miui/gallery/sdk/download/DownloadType;->ORIGIN_FORCE:Lcom/miui/gallery/sdk/download/DownloadType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/miui/gallery/sdk/download/DownloadType;->THUMBNAIL:Lcom/miui/gallery/sdk/download/DownloadType;

    aput-object v1, v0, v5

    sget-object v1, Lcom/miui/gallery/sdk/download/DownloadType;->MICRO:Lcom/miui/gallery/sdk/download/DownloadType;

    aput-object v1, v0, v6

    sget-object v1, Lcom/miui/gallery/sdk/download/DownloadType;->THUMBNAIL_BATCH:Lcom/miui/gallery/sdk/download/DownloadType;

    aput-object v1, v0, v8

    sget-object v1, Lcom/miui/gallery/sdk/download/DownloadType;->ORIGIN_BATCH:Lcom/miui/gallery/sdk/download/DownloadType;

    aput-object v1, v0, v9

    sget-object v1, Lcom/miui/gallery/sdk/download/DownloadType;->MICRO_BATCH:Lcom/miui/gallery/sdk/download/DownloadType;

    aput-object v1, v0, v2

    sput-object v0, Lcom/miui/gallery/sdk/download/DownloadType;->$VALUES:[Lcom/miui/gallery/sdk/download/DownloadType;

    new-instance v0, Lcom/miui/gallery/sdk/download/DownloadType$1;

    invoke-direct {v0}, Lcom/miui/gallery/sdk/download/DownloadType$1;-><init>()V

    sput-object v0, Lcom/miui/gallery/sdk/download/DownloadType;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IIZ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IZ)V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/miui/gallery/sdk/download/DownloadType;->mPriority:I

    iput-boolean p4, p0, Lcom/miui/gallery/sdk/download/DownloadType;->mIsBackground:Z

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/miui/gallery/sdk/download/DownloadType;
    .locals 1

    const-class v0, Lcom/miui/gallery/sdk/download/DownloadType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/sdk/download/DownloadType;

    return-object p0
.end method

.method public static values()[Lcom/miui/gallery/sdk/download/DownloadType;
    .locals 1

    sget-object v0, Lcom/miui/gallery/sdk/download/DownloadType;->$VALUES:[Lcom/miui/gallery/sdk/download/DownloadType;

    invoke-virtual {v0}, [Lcom/miui/gallery/sdk/download/DownloadType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/miui/gallery/sdk/download/DownloadType;

    return-object v0
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getPriority()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/sdk/download/DownloadType;->mPriority:I

    return v0
.end method

.method public isBackground()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/sdk/download/DownloadType;->mIsBackground:Z

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/sdk/download/DownloadType;->ordinal()I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    return-void
.end method
