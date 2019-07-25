.class public final enum Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;
.super Ljava/lang/Enum;
.source "SyncContentUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Reason"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;

.field public static final enum ACTIVATED_FAIL:Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;

.field public static final enum AUTH_TOKEN_ERROR:Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;

.field public static final enum NETWORK_DISALLOWED:Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;

.field public static final enum PERMISSION_LIMIT:Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;

.field public static final enum PRIVACY_ERROR:Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;

.field public static final enum SECURE_SPACE_LIMIT:Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;

.field public static final enum SUCCESS:Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;

.field public static final enum SYNC_HARD_ERROR:Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;

.field public static final enum SYNC_SOFT_ERROR:Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;

.field public static final enum TIME_UNAVAILABLE:Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;

.field public static final enum UNKNOWN:Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;


# instance fields
.field final v8:I

.field final v9:I


# direct methods
.method static constructor <clinit>()V
    .locals 15

    new-instance v0, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;

    const-string v1, "SUCCESS"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2, v2}, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;-><init>(Ljava/lang/String;III)V

    sput-object v0, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;->SUCCESS:Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;

    new-instance v0, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;

    const-string v1, "UNKNOWN"

    const/4 v3, 0x1

    const/4 v4, -0x1

    invoke-direct {v0, v1, v3, v4, v4}, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;-><init>(Ljava/lang/String;III)V

    sput-object v0, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;->UNKNOWN:Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;

    new-instance v0, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;

    const-string v1, "NETWORK_DISALLOWED"

    const/16 v5, 0x3e8

    const/4 v6, 0x2

    invoke-direct {v0, v1, v6, v5, v5}, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;-><init>(Ljava/lang/String;III)V

    sput-object v0, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;->NETWORK_DISALLOWED:Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;

    new-instance v0, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;

    const-string v1, "AUTH_TOKEN_ERROR"

    const/16 v5, 0x3e9

    const/4 v7, 0x3

    const/16 v8, 0x64

    invoke-direct {v0, v1, v7, v5, v8}, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;-><init>(Ljava/lang/String;III)V

    sput-object v0, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;->AUTH_TOKEN_ERROR:Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;

    new-instance v0, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;

    const-string v1, "ACTIVATED_FAIL"

    const/16 v8, 0x3ea

    const/4 v9, 0x4

    invoke-direct {v0, v1, v9, v8, v5}, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;-><init>(Ljava/lang/String;III)V

    sput-object v0, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;->ACTIVATED_FAIL:Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;

    new-instance v0, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;

    const-string v1, "TIME_UNAVAILABLE"

    const/16 v5, 0x3eb

    const/4 v10, 0x5

    const/16 v11, 0x65

    invoke-direct {v0, v1, v10, v5, v11}, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;-><init>(Ljava/lang/String;III)V

    sput-object v0, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;->TIME_UNAVAILABLE:Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;

    new-instance v0, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;

    const-string v1, "PERMISSION_LIMIT"

    const/4 v11, 0x6

    invoke-direct {v0, v1, v11, v4, v8}, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;-><init>(Ljava/lang/String;III)V

    sput-object v0, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;->PERMISSION_LIMIT:Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;

    new-instance v0, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;

    const-string v1, "SECURE_SPACE_LIMIT"

    const/4 v8, 0x7

    invoke-direct {v0, v1, v8, v4, v5}, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;-><init>(Ljava/lang/String;III)V

    sput-object v0, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;->SECURE_SPACE_LIMIT:Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;

    new-instance v0, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;

    const-string v1, "SYNC_SOFT_ERROR"

    const/16 v5, 0x8

    invoke-direct {v0, v1, v5, v4, v3}, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;-><init>(Ljava/lang/String;III)V

    sput-object v0, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;->SYNC_SOFT_ERROR:Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;

    new-instance v0, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;

    const-string v1, "SYNC_HARD_ERROR"

    const/16 v12, 0x9

    invoke-direct {v0, v1, v12, v4, v6}, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;-><init>(Ljava/lang/String;III)V

    sput-object v0, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;->SYNC_HARD_ERROR:Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;

    new-instance v0, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;

    const-string v1, "PRIVACY_ERROR"

    const/16 v13, 0xa

    const v14, 0xcb23

    invoke-direct {v0, v1, v13, v4, v14}, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;-><init>(Ljava/lang/String;III)V

    sput-object v0, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;->PRIVACY_ERROR:Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;

    const/16 v0, 0xb

    new-array v0, v0, [Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;

    sget-object v1, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;->SUCCESS:Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;

    aput-object v1, v0, v2

    sget-object v1, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;->UNKNOWN:Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;

    aput-object v1, v0, v3

    sget-object v1, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;->NETWORK_DISALLOWED:Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;

    aput-object v1, v0, v6

    sget-object v1, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;->AUTH_TOKEN_ERROR:Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;

    aput-object v1, v0, v7

    sget-object v1, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;->ACTIVATED_FAIL:Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;

    aput-object v1, v0, v9

    sget-object v1, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;->TIME_UNAVAILABLE:Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;

    aput-object v1, v0, v10

    sget-object v1, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;->PERMISSION_LIMIT:Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;

    aput-object v1, v0, v11

    sget-object v1, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;->SECURE_SPACE_LIMIT:Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;

    aput-object v1, v0, v8

    sget-object v1, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;->SYNC_SOFT_ERROR:Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;

    aput-object v1, v0, v5

    sget-object v1, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;->SYNC_HARD_ERROR:Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;

    aput-object v1, v0, v12

    sget-object v1, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;->PRIVACY_ERROR:Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;

    const/16 v2, 0xa

    aput-object v1, v0, v2

    sput-object v0, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;->$VALUES:[Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;III)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;->v8:I

    iput p4, p0, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;->v9:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;
    .locals 1

    const-class v0, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;

    return-object p0
.end method

.method public static values()[Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;
    .locals 1

    sget-object v0, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;->$VALUES:[Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;

    invoke-virtual {v0}, [Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;

    return-object v0
.end method
