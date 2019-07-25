.class public final enum Lcom/nexstreaming/app/common/localprotocol/nexProtoErrorCode;
.super Ljava/lang/Enum;
.source "nexProtoErrorCode.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/nexstreaming/app/common/localprotocol/nexProtoErrorCode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/nexstreaming/app/common/localprotocol/nexProtoErrorCode;

.field public static final enum InvalidHDR:Lcom/nexstreaming/app/common/localprotocol/nexProtoErrorCode;

.field public static final enum InvalidRQ:Lcom/nexstreaming/app/common/localprotocol/nexProtoErrorCode;

.field public static final enum InvalidRS:Lcom/nexstreaming/app/common/localprotocol/nexProtoErrorCode;

.field public static final enum InvalidSSID:Lcom/nexstreaming/app/common/localprotocol/nexProtoErrorCode;

.field public static final enum OK:Lcom/nexstreaming/app/common/localprotocol/nexProtoErrorCode;

.field public static final enum Unrecognized:Lcom/nexstreaming/app/common/localprotocol/nexProtoErrorCode;


# instance fields
.field private final mValue:I


# direct methods
.method static constructor <clinit>()V
    .locals 9

    new-instance v0, Lcom/nexstreaming/app/common/localprotocol/nexProtoErrorCode;

    const-string v1, "OK"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lcom/nexstreaming/app/common/localprotocol/nexProtoErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/app/common/localprotocol/nexProtoErrorCode;->OK:Lcom/nexstreaming/app/common/localprotocol/nexProtoErrorCode;

    new-instance v0, Lcom/nexstreaming/app/common/localprotocol/nexProtoErrorCode;

    const-string v1, "InvalidHDR"

    const/4 v3, 0x1

    const/16 v4, 0x65

    invoke-direct {v0, v1, v3, v4}, Lcom/nexstreaming/app/common/localprotocol/nexProtoErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/app/common/localprotocol/nexProtoErrorCode;->InvalidHDR:Lcom/nexstreaming/app/common/localprotocol/nexProtoErrorCode;

    new-instance v0, Lcom/nexstreaming/app/common/localprotocol/nexProtoErrorCode;

    const-string v1, "InvalidRQ"

    const/4 v4, 0x2

    const/16 v5, 0x66

    invoke-direct {v0, v1, v4, v5}, Lcom/nexstreaming/app/common/localprotocol/nexProtoErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/app/common/localprotocol/nexProtoErrorCode;->InvalidRQ:Lcom/nexstreaming/app/common/localprotocol/nexProtoErrorCode;

    new-instance v0, Lcom/nexstreaming/app/common/localprotocol/nexProtoErrorCode;

    const-string v1, "InvalidRS"

    const/4 v5, 0x3

    const/16 v6, 0x67

    invoke-direct {v0, v1, v5, v6}, Lcom/nexstreaming/app/common/localprotocol/nexProtoErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/app/common/localprotocol/nexProtoErrorCode;->InvalidRS:Lcom/nexstreaming/app/common/localprotocol/nexProtoErrorCode;

    new-instance v0, Lcom/nexstreaming/app/common/localprotocol/nexProtoErrorCode;

    const-string v1, "InvalidSSID"

    const/4 v6, 0x4

    const/16 v7, 0x68

    invoke-direct {v0, v1, v6, v7}, Lcom/nexstreaming/app/common/localprotocol/nexProtoErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/app/common/localprotocol/nexProtoErrorCode;->InvalidSSID:Lcom/nexstreaming/app/common/localprotocol/nexProtoErrorCode;

    new-instance v0, Lcom/nexstreaming/app/common/localprotocol/nexProtoErrorCode;

    const-string v1, "Unrecognized"

    const/4 v7, 0x5

    const/16 v8, 0x320

    invoke-direct {v0, v1, v7, v8}, Lcom/nexstreaming/app/common/localprotocol/nexProtoErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/app/common/localprotocol/nexProtoErrorCode;->Unrecognized:Lcom/nexstreaming/app/common/localprotocol/nexProtoErrorCode;

    const/4 v0, 0x6

    new-array v0, v0, [Lcom/nexstreaming/app/common/localprotocol/nexProtoErrorCode;

    sget-object v1, Lcom/nexstreaming/app/common/localprotocol/nexProtoErrorCode;->OK:Lcom/nexstreaming/app/common/localprotocol/nexProtoErrorCode;

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/app/common/localprotocol/nexProtoErrorCode;->InvalidHDR:Lcom/nexstreaming/app/common/localprotocol/nexProtoErrorCode;

    aput-object v1, v0, v3

    sget-object v1, Lcom/nexstreaming/app/common/localprotocol/nexProtoErrorCode;->InvalidRQ:Lcom/nexstreaming/app/common/localprotocol/nexProtoErrorCode;

    aput-object v1, v0, v4

    sget-object v1, Lcom/nexstreaming/app/common/localprotocol/nexProtoErrorCode;->InvalidRS:Lcom/nexstreaming/app/common/localprotocol/nexProtoErrorCode;

    aput-object v1, v0, v5

    sget-object v1, Lcom/nexstreaming/app/common/localprotocol/nexProtoErrorCode;->InvalidSSID:Lcom/nexstreaming/app/common/localprotocol/nexProtoErrorCode;

    aput-object v1, v0, v6

    sget-object v1, Lcom/nexstreaming/app/common/localprotocol/nexProtoErrorCode;->Unrecognized:Lcom/nexstreaming/app/common/localprotocol/nexProtoErrorCode;

    aput-object v1, v0, v7

    sput-object v0, Lcom/nexstreaming/app/common/localprotocol/nexProtoErrorCode;->$VALUES:[Lcom/nexstreaming/app/common/localprotocol/nexProtoErrorCode;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/nexstreaming/app/common/localprotocol/nexProtoErrorCode;->mValue:I

    return-void
.end method

.method static fromValue(I)Lcom/nexstreaming/app/common/localprotocol/nexProtoErrorCode;
    .locals 5

    invoke-static {}, Lcom/nexstreaming/app/common/localprotocol/nexProtoErrorCode;->values()[Lcom/nexstreaming/app/common/localprotocol/nexProtoErrorCode;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    invoke-virtual {v3}, Lcom/nexstreaming/app/common/localprotocol/nexProtoErrorCode;->getValue()I

    move-result v4

    if-ne v4, p0, :cond_0

    return-object v3

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    sget-object p0, Lcom/nexstreaming/app/common/localprotocol/nexProtoErrorCode;->Unrecognized:Lcom/nexstreaming/app/common/localprotocol/nexProtoErrorCode;

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/nexstreaming/app/common/localprotocol/nexProtoErrorCode;
    .locals 1

    const-class v0, Lcom/nexstreaming/app/common/localprotocol/nexProtoErrorCode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/nexstreaming/app/common/localprotocol/nexProtoErrorCode;

    return-object p0
.end method

.method public static values()[Lcom/nexstreaming/app/common/localprotocol/nexProtoErrorCode;
    .locals 1

    sget-object v0, Lcom/nexstreaming/app/common/localprotocol/nexProtoErrorCode;->$VALUES:[Lcom/nexstreaming/app/common/localprotocol/nexProtoErrorCode;

    invoke-virtual {v0}, [Lcom/nexstreaming/app/common/localprotocol/nexProtoErrorCode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/nexstreaming/app/common/localprotocol/nexProtoErrorCode;

    return-object v0
.end method


# virtual methods
.method public getValue()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/app/common/localprotocol/nexProtoErrorCode;->mValue:I

    return v0
.end method
