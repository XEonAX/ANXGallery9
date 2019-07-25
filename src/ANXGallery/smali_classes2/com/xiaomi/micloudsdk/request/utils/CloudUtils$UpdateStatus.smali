.class final enum Lcom/xiaomi/micloudsdk/request/utils/CloudUtils$UpdateStatus;
.super Ljava/lang/Enum;
.source "CloudUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/micloudsdk/request/utils/CloudUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "UpdateStatus"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/xiaomi/micloudsdk/request/utils/CloudUtils$UpdateStatus;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/xiaomi/micloudsdk/request/utils/CloudUtils$UpdateStatus;

.field public static final enum FAILED:Lcom/xiaomi/micloudsdk/request/utils/CloudUtils$UpdateStatus;

.field public static final enum SUCCESS:Lcom/xiaomi/micloudsdk/request/utils/CloudUtils$UpdateStatus;

.field public static final enum UPDATING:Lcom/xiaomi/micloudsdk/request/utils/CloudUtils$UpdateStatus;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    new-instance v0, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils$UpdateStatus;

    const-string v1, "UPDATING"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils$UpdateStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils$UpdateStatus;->UPDATING:Lcom/xiaomi/micloudsdk/request/utils/CloudUtils$UpdateStatus;

    new-instance v0, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils$UpdateStatus;

    const-string v1, "SUCCESS"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils$UpdateStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils$UpdateStatus;->SUCCESS:Lcom/xiaomi/micloudsdk/request/utils/CloudUtils$UpdateStatus;

    new-instance v0, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils$UpdateStatus;

    const-string v1, "FAILED"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4}, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils$UpdateStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils$UpdateStatus;->FAILED:Lcom/xiaomi/micloudsdk/request/utils/CloudUtils$UpdateStatus;

    const/4 v0, 0x3

    new-array v0, v0, [Lcom/xiaomi/micloudsdk/request/utils/CloudUtils$UpdateStatus;

    sget-object v1, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils$UpdateStatus;->UPDATING:Lcom/xiaomi/micloudsdk/request/utils/CloudUtils$UpdateStatus;

    aput-object v1, v0, v2

    sget-object v1, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils$UpdateStatus;->SUCCESS:Lcom/xiaomi/micloudsdk/request/utils/CloudUtils$UpdateStatus;

    aput-object v1, v0, v3

    sget-object v1, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils$UpdateStatus;->FAILED:Lcom/xiaomi/micloudsdk/request/utils/CloudUtils$UpdateStatus;

    aput-object v1, v0, v4

    sput-object v0, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils$UpdateStatus;->$VALUES:[Lcom/xiaomi/micloudsdk/request/utils/CloudUtils$UpdateStatus;

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

.method public static valueOf(Ljava/lang/String;)Lcom/xiaomi/micloudsdk/request/utils/CloudUtils$UpdateStatus;
    .locals 1

    const-class v0, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils$UpdateStatus;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils$UpdateStatus;

    return-object p0
.end method

.method public static values()[Lcom/xiaomi/micloudsdk/request/utils/CloudUtils$UpdateStatus;
    .locals 1

    sget-object v0, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils$UpdateStatus;->$VALUES:[Lcom/xiaomi/micloudsdk/request/utils/CloudUtils$UpdateStatus;

    invoke-virtual {v0}, [Lcom/xiaomi/micloudsdk/request/utils/CloudUtils$UpdateStatus;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/xiaomi/micloudsdk/request/utils/CloudUtils$UpdateStatus;

    return-object v0
.end method
