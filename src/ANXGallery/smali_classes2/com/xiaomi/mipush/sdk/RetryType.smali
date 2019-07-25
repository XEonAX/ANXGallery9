.class public final enum Lcom/xiaomi/mipush/sdk/RetryType;
.super Ljava/lang/Enum;
.source "RetryType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/xiaomi/mipush/sdk/RetryType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/xiaomi/mipush/sdk/RetryType;

.field public static final enum DISABLE_PUSH:Lcom/xiaomi/mipush/sdk/RetryType;

.field public static final enum ENABLE_PUSH:Lcom/xiaomi/mipush/sdk/RetryType;

.field public static final enum UPLOAD_COS_TOKEN:Lcom/xiaomi/mipush/sdk/RetryType;

.field public static final enum UPLOAD_FCM_TOKEN:Lcom/xiaomi/mipush/sdk/RetryType;

.field public static final enum UPLOAD_FTOS_TOKEN:Lcom/xiaomi/mipush/sdk/RetryType;

.field public static final enum UPLOAD_HUAWEI_TOKEN:Lcom/xiaomi/mipush/sdk/RetryType;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    new-instance v0, Lcom/xiaomi/mipush/sdk/RetryType;

    const-string v1, "DISABLE_PUSH"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/xiaomi/mipush/sdk/RetryType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/xiaomi/mipush/sdk/RetryType;->DISABLE_PUSH:Lcom/xiaomi/mipush/sdk/RetryType;

    new-instance v0, Lcom/xiaomi/mipush/sdk/RetryType;

    const-string v1, "ENABLE_PUSH"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lcom/xiaomi/mipush/sdk/RetryType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/xiaomi/mipush/sdk/RetryType;->ENABLE_PUSH:Lcom/xiaomi/mipush/sdk/RetryType;

    new-instance v0, Lcom/xiaomi/mipush/sdk/RetryType;

    const-string v1, "UPLOAD_HUAWEI_TOKEN"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4}, Lcom/xiaomi/mipush/sdk/RetryType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/xiaomi/mipush/sdk/RetryType;->UPLOAD_HUAWEI_TOKEN:Lcom/xiaomi/mipush/sdk/RetryType;

    new-instance v0, Lcom/xiaomi/mipush/sdk/RetryType;

    const-string v1, "UPLOAD_FCM_TOKEN"

    const/4 v5, 0x3

    invoke-direct {v0, v1, v5}, Lcom/xiaomi/mipush/sdk/RetryType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/xiaomi/mipush/sdk/RetryType;->UPLOAD_FCM_TOKEN:Lcom/xiaomi/mipush/sdk/RetryType;

    new-instance v0, Lcom/xiaomi/mipush/sdk/RetryType;

    const-string v1, "UPLOAD_COS_TOKEN"

    const/4 v6, 0x4

    invoke-direct {v0, v1, v6}, Lcom/xiaomi/mipush/sdk/RetryType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/xiaomi/mipush/sdk/RetryType;->UPLOAD_COS_TOKEN:Lcom/xiaomi/mipush/sdk/RetryType;

    new-instance v0, Lcom/xiaomi/mipush/sdk/RetryType;

    const-string v1, "UPLOAD_FTOS_TOKEN"

    const/4 v7, 0x5

    invoke-direct {v0, v1, v7}, Lcom/xiaomi/mipush/sdk/RetryType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/xiaomi/mipush/sdk/RetryType;->UPLOAD_FTOS_TOKEN:Lcom/xiaomi/mipush/sdk/RetryType;

    const/4 v0, 0x6

    new-array v0, v0, [Lcom/xiaomi/mipush/sdk/RetryType;

    sget-object v1, Lcom/xiaomi/mipush/sdk/RetryType;->DISABLE_PUSH:Lcom/xiaomi/mipush/sdk/RetryType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/xiaomi/mipush/sdk/RetryType;->ENABLE_PUSH:Lcom/xiaomi/mipush/sdk/RetryType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/xiaomi/mipush/sdk/RetryType;->UPLOAD_HUAWEI_TOKEN:Lcom/xiaomi/mipush/sdk/RetryType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/xiaomi/mipush/sdk/RetryType;->UPLOAD_FCM_TOKEN:Lcom/xiaomi/mipush/sdk/RetryType;

    aput-object v1, v0, v5

    sget-object v1, Lcom/xiaomi/mipush/sdk/RetryType;->UPLOAD_COS_TOKEN:Lcom/xiaomi/mipush/sdk/RetryType;

    aput-object v1, v0, v6

    sget-object v1, Lcom/xiaomi/mipush/sdk/RetryType;->UPLOAD_FTOS_TOKEN:Lcom/xiaomi/mipush/sdk/RetryType;

    aput-object v1, v0, v7

    sput-object v0, Lcom/xiaomi/mipush/sdk/RetryType;->$VALUES:[Lcom/xiaomi/mipush/sdk/RetryType;

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

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/xiaomi/mipush/sdk/RetryType;
    .locals 1

    const-class v0, Lcom/xiaomi/mipush/sdk/RetryType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/xiaomi/mipush/sdk/RetryType;

    return-object p0
.end method

.method public static values()[Lcom/xiaomi/mipush/sdk/RetryType;
    .locals 1

    sget-object v0, Lcom/xiaomi/mipush/sdk/RetryType;->$VALUES:[Lcom/xiaomi/mipush/sdk/RetryType;

    invoke-virtual {v0}, [Lcom/xiaomi/mipush/sdk/RetryType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/xiaomi/mipush/sdk/RetryType;

    return-object v0
.end method
