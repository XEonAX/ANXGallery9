.class public final enum Lcom/nexstreaming/app/common/tracelog/ResponseCode;
.super Ljava/lang/Enum;
.source "ResponseCode.java"

# interfaces
.implements Lcom/nexstreaming/app/common/task/Task$TaskError;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/nexstreaming/app/common/tracelog/ResponseCode;",
        ">;",
        "Lcom/nexstreaming/app/common/task/Task$TaskError;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/nexstreaming/app/common/tracelog/ResponseCode;

.field public static final enum ALREADYINUSE_PROMOCODE:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

.field public static final enum ALREADY_IAP_REGISTERED:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

.field public static final enum APPAUTH_FAILED:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

.field public static final enum APP_BLOCKDATE:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

.field public static final enum APP_VERSION_EXISTED:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

.field public static final enum DLLIMIT_EXCEEDED:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

.field public static final enum ERR_FATAL:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

.field public static final enum ERR_NORMAL:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

.field public static final enum EXPIRED_PROMOCODE:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

.field public static final enum INVALID_APIVERSION:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

.field public static final enum INVALID_CODECID:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

.field public static final enum INVALID_DEVICE:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

.field public static final enum INVALID_PROMOCODE:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

.field public static final enum INVALID_SOUNDTRACKID:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

.field public static final enum LICENSE_EXPIRED:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

.field public static final enum NOTICE_AVAILABLE:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

.field public static final enum NOTICE_NOTAVAILABLE:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

.field public static final enum NO_AVAILABLE_LICENSE:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

.field public static final enum NO_MATCH:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

.field public static final enum PROMOCODE_ALREADY:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

.field public static final enum PROMOCODE_NONE:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

.field public static final enum SOMETHING_WRONG:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

.field public static final enum SUCCESS:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

.field public static final enum UNKNOWN:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

.field public static final enum UPDATE_AVAILABLE:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

.field public static final enum UPDATE_NOTAVAILABLE:Lcom/nexstreaming/app/common/tracelog/ResponseCode;


# instance fields
.field private final unknown:Z

.field private final value:I


# direct methods
.method static constructor <clinit>()V
    .locals 16

    new-instance v0, Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    const-string v1, "SUCCESS"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lcom/nexstreaming/app/common/tracelog/ResponseCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/app/common/tracelog/ResponseCode;->SUCCESS:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    new-instance v0, Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    const-string v1, "APPAUTH_FAILED"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3, v3}, Lcom/nexstreaming/app/common/tracelog/ResponseCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/app/common/tracelog/ResponseCode;->APPAUTH_FAILED:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    new-instance v0, Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    const-string v1, "LICENSE_EXPIRED"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4, v4}, Lcom/nexstreaming/app/common/tracelog/ResponseCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/app/common/tracelog/ResponseCode;->LICENSE_EXPIRED:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    new-instance v0, Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    const-string v1, "DLLIMIT_EXCEEDED"

    const/4 v5, 0x3

    invoke-direct {v0, v1, v5, v5}, Lcom/nexstreaming/app/common/tracelog/ResponseCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/app/common/tracelog/ResponseCode;->DLLIMIT_EXCEEDED:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    new-instance v0, Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    const-string v1, "NO_AVAILABLE_LICENSE"

    const/4 v6, 0x4

    invoke-direct {v0, v1, v6, v6}, Lcom/nexstreaming/app/common/tracelog/ResponseCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/app/common/tracelog/ResponseCode;->NO_AVAILABLE_LICENSE:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    new-instance v0, Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    const-string v1, "INVALID_APIVERSION"

    const/4 v7, 0x5

    invoke-direct {v0, v1, v7, v7}, Lcom/nexstreaming/app/common/tracelog/ResponseCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/app/common/tracelog/ResponseCode;->INVALID_APIVERSION:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    new-instance v0, Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    const-string v1, "ERR_NORMAL"

    const/4 v8, 0x6

    invoke-direct {v0, v1, v8, v8}, Lcom/nexstreaming/app/common/tracelog/ResponseCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/app/common/tracelog/ResponseCode;->ERR_NORMAL:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    new-instance v0, Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    const-string v1, "ERR_FATAL"

    const/4 v9, 0x7

    invoke-direct {v0, v1, v9, v9}, Lcom/nexstreaming/app/common/tracelog/ResponseCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/app/common/tracelog/ResponseCode;->ERR_FATAL:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    new-instance v0, Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    const-string v1, "INVALID_CODECID"

    const/16 v10, 0x8

    invoke-direct {v0, v1, v10, v10}, Lcom/nexstreaming/app/common/tracelog/ResponseCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/app/common/tracelog/ResponseCode;->INVALID_CODECID:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    new-instance v0, Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    const-string v1, "INVALID_DEVICE"

    const/16 v11, 0x9

    invoke-direct {v0, v1, v11, v11}, Lcom/nexstreaming/app/common/tracelog/ResponseCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/app/common/tracelog/ResponseCode;->INVALID_DEVICE:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    new-instance v0, Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    const-string v1, "UPDATE_AVAILABLE"

    const/16 v12, 0xa

    invoke-direct {v0, v1, v12, v12}, Lcom/nexstreaming/app/common/tracelog/ResponseCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/app/common/tracelog/ResponseCode;->UPDATE_AVAILABLE:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    new-instance v0, Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    const-string v1, "UPDATE_NOTAVAILABLE"

    const/16 v13, 0xb

    invoke-direct {v0, v1, v13, v13}, Lcom/nexstreaming/app/common/tracelog/ResponseCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/app/common/tracelog/ResponseCode;->UPDATE_NOTAVAILABLE:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    new-instance v0, Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    const-string v1, "APP_VERSION_EXISTED"

    const/16 v14, 0xc

    invoke-direct {v0, v1, v14, v14}, Lcom/nexstreaming/app/common/tracelog/ResponseCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/app/common/tracelog/ResponseCode;->APP_VERSION_EXISTED:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    new-instance v0, Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    const-string v1, "NOTICE_AVAILABLE"

    const/16 v15, 0xd

    invoke-direct {v0, v1, v15, v15}, Lcom/nexstreaming/app/common/tracelog/ResponseCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/app/common/tracelog/ResponseCode;->NOTICE_AVAILABLE:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    new-instance v0, Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    const-string v1, "NOTICE_NOTAVAILABLE"

    const/16 v15, 0xe

    invoke-direct {v0, v1, v15, v15}, Lcom/nexstreaming/app/common/tracelog/ResponseCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/app/common/tracelog/ResponseCode;->NOTICE_NOTAVAILABLE:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    new-instance v0, Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    const-string v1, "INVALID_PROMOCODE"

    const/16 v15, 0xf

    const/16 v14, 0xf

    invoke-direct {v0, v1, v15, v14}, Lcom/nexstreaming/app/common/tracelog/ResponseCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/app/common/tracelog/ResponseCode;->INVALID_PROMOCODE:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    new-instance v0, Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    const-string v1, "EXPIRED_PROMOCODE"

    const/16 v14, 0x10

    const/16 v15, 0x10

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/app/common/tracelog/ResponseCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/app/common/tracelog/ResponseCode;->EXPIRED_PROMOCODE:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    new-instance v0, Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    const-string v1, "ALREADYINUSE_PROMOCODE"

    const/16 v14, 0x11

    const/16 v15, 0x11

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/app/common/tracelog/ResponseCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/app/common/tracelog/ResponseCode;->ALREADYINUSE_PROMOCODE:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    new-instance v0, Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    const-string v1, "PROMOCODE_NONE"

    const/16 v14, 0x12

    const/16 v15, 0x12

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/app/common/tracelog/ResponseCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/app/common/tracelog/ResponseCode;->PROMOCODE_NONE:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    new-instance v0, Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    const-string v1, "PROMOCODE_ALREADY"

    const/16 v14, 0x13

    const/16 v15, 0x13

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/app/common/tracelog/ResponseCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/app/common/tracelog/ResponseCode;->PROMOCODE_ALREADY:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    new-instance v0, Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    const-string v1, "ALREADY_IAP_REGISTERED"

    const/16 v14, 0x14

    const/16 v15, 0x14

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/app/common/tracelog/ResponseCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/app/common/tracelog/ResponseCode;->ALREADY_IAP_REGISTERED:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    new-instance v0, Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    const-string v1, "APP_BLOCKDATE"

    const/16 v14, 0x15

    const/16 v15, 0x15

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/app/common/tracelog/ResponseCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/app/common/tracelog/ResponseCode;->APP_BLOCKDATE:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    new-instance v0, Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    const-string v1, "INVALID_SOUNDTRACKID"

    const/16 v14, 0x16

    const/16 v15, 0x16

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/app/common/tracelog/ResponseCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/app/common/tracelog/ResponseCode;->INVALID_SOUNDTRACKID:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    new-instance v0, Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    const-string v1, "NO_MATCH"

    const/16 v14, 0x17

    const/16 v15, 0x17

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/app/common/tracelog/ResponseCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/app/common/tracelog/ResponseCode;->NO_MATCH:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    new-instance v0, Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    const-string v1, "SOMETHING_WRONG"

    const/16 v14, 0x18

    const/16 v15, 0x1f9

    invoke-direct {v0, v1, v14, v15}, Lcom/nexstreaming/app/common/tracelog/ResponseCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/nexstreaming/app/common/tracelog/ResponseCode;->SOMETHING_WRONG:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    new-instance v0, Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    const-string v1, "UNKNOWN"

    const/16 v14, 0x19

    invoke-direct {v0, v1, v14}, Lcom/nexstreaming/app/common/tracelog/ResponseCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/nexstreaming/app/common/tracelog/ResponseCode;->UNKNOWN:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    const/16 v0, 0x1a

    new-array v0, v0, [Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    sget-object v1, Lcom/nexstreaming/app/common/tracelog/ResponseCode;->SUCCESS:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/app/common/tracelog/ResponseCode;->APPAUTH_FAILED:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    aput-object v1, v0, v3

    sget-object v1, Lcom/nexstreaming/app/common/tracelog/ResponseCode;->LICENSE_EXPIRED:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    aput-object v1, v0, v4

    sget-object v1, Lcom/nexstreaming/app/common/tracelog/ResponseCode;->DLLIMIT_EXCEEDED:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    aput-object v1, v0, v5

    sget-object v1, Lcom/nexstreaming/app/common/tracelog/ResponseCode;->NO_AVAILABLE_LICENSE:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    aput-object v1, v0, v6

    sget-object v1, Lcom/nexstreaming/app/common/tracelog/ResponseCode;->INVALID_APIVERSION:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    aput-object v1, v0, v7

    sget-object v1, Lcom/nexstreaming/app/common/tracelog/ResponseCode;->ERR_NORMAL:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    aput-object v1, v0, v8

    sget-object v1, Lcom/nexstreaming/app/common/tracelog/ResponseCode;->ERR_FATAL:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    aput-object v1, v0, v9

    sget-object v1, Lcom/nexstreaming/app/common/tracelog/ResponseCode;->INVALID_CODECID:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    aput-object v1, v0, v10

    sget-object v1, Lcom/nexstreaming/app/common/tracelog/ResponseCode;->INVALID_DEVICE:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    aput-object v1, v0, v11

    sget-object v1, Lcom/nexstreaming/app/common/tracelog/ResponseCode;->UPDATE_AVAILABLE:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    aput-object v1, v0, v12

    sget-object v1, Lcom/nexstreaming/app/common/tracelog/ResponseCode;->UPDATE_NOTAVAILABLE:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    aput-object v1, v0, v13

    sget-object v1, Lcom/nexstreaming/app/common/tracelog/ResponseCode;->APP_VERSION_EXISTED:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    const/16 v2, 0xc

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/app/common/tracelog/ResponseCode;->NOTICE_AVAILABLE:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    const/16 v2, 0xd

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/app/common/tracelog/ResponseCode;->NOTICE_NOTAVAILABLE:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    const/16 v2, 0xe

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/app/common/tracelog/ResponseCode;->INVALID_PROMOCODE:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    const/16 v2, 0xf

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/app/common/tracelog/ResponseCode;->EXPIRED_PROMOCODE:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    const/16 v2, 0x10

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/app/common/tracelog/ResponseCode;->ALREADYINUSE_PROMOCODE:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    const/16 v2, 0x11

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/app/common/tracelog/ResponseCode;->PROMOCODE_NONE:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    const/16 v2, 0x12

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/app/common/tracelog/ResponseCode;->PROMOCODE_ALREADY:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    const/16 v2, 0x13

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/app/common/tracelog/ResponseCode;->ALREADY_IAP_REGISTERED:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    const/16 v2, 0x14

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/app/common/tracelog/ResponseCode;->APP_BLOCKDATE:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    const/16 v2, 0x15

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/app/common/tracelog/ResponseCode;->INVALID_SOUNDTRACKID:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    const/16 v2, 0x16

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/app/common/tracelog/ResponseCode;->NO_MATCH:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    const/16 v2, 0x17

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/app/common/tracelog/ResponseCode;->SOMETHING_WRONG:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    const/16 v2, 0x18

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/app/common/tracelog/ResponseCode;->UNKNOWN:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    const/16 v2, 0x19

    aput-object v1, v0, v2

    sput-object v0, Lcom/nexstreaming/app/common/tracelog/ResponseCode;->$VALUES:[Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    const/4 p1, 0x0

    iput p1, p0, Lcom/nexstreaming/app/common/tracelog/ResponseCode;->value:I

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/nexstreaming/app/common/tracelog/ResponseCode;->unknown:Z

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

    iput p3, p0, Lcom/nexstreaming/app/common/tracelog/ResponseCode;->value:I

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/nexstreaming/app/common/tracelog/ResponseCode;->unknown:Z

    return-void
.end method

.method static fromValue(I)Lcom/nexstreaming/app/common/tracelog/ResponseCode;
    .locals 5

    invoke-static {}, Lcom/nexstreaming/app/common/tracelog/ResponseCode;->values()[Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    iget v4, v3, Lcom/nexstreaming/app/common/tracelog/ResponseCode;->value:I

    if-ne v4, p0, :cond_0

    return-object v3

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    sget-object p0, Lcom/nexstreaming/app/common/tracelog/ResponseCode;->UNKNOWN:Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/nexstreaming/app/common/tracelog/ResponseCode;
    .locals 1

    const-class v0, Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    return-object p0
.end method

.method public static values()[Lcom/nexstreaming/app/common/tracelog/ResponseCode;
    .locals 1

    sget-object v0, Lcom/nexstreaming/app/common/tracelog/ResponseCode;->$VALUES:[Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    invoke-virtual {v0}, [Lcom/nexstreaming/app/common/tracelog/ResponseCode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/nexstreaming/app/common/tracelog/ResponseCode;

    return-object v0
.end method


# virtual methods
.method public getException()Ljava/lang/Exception;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public getIntErrorCode()I
    .locals 1

    invoke-virtual {p0}, Lcom/nexstreaming/app/common/tracelog/ResponseCode;->value()I

    move-result v0

    return v0
.end method

.method public getLocalizedMessage(Landroid/content/Context;)Ljava/lang/String;
    .locals 0

    invoke-virtual {p0}, Lcom/nexstreaming/app/common/tracelog/ResponseCode;->getMessage()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getMessage()Ljava/lang/String;
    .locals 2

    iget-boolean v0, p0, Lcom/nexstreaming/app/common/tracelog/ResponseCode;->unknown:Z

    if-eqz v0, :cond_0

    const-string v0, "UNKNOWN"

    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/nexstreaming/app/common/tracelog/ResponseCode;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " ["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/nexstreaming/app/common/tracelog/ResponseCode;->value:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public value()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/app/common/tracelog/ResponseCode;->value:I

    return v0
.end method
