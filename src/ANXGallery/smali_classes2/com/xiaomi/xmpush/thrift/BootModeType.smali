.class public final enum Lcom/xiaomi/xmpush/thrift/BootModeType;
.super Ljava/lang/Enum;
.source "BootModeType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/xiaomi/xmpush/thrift/BootModeType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/xiaomi/xmpush/thrift/BootModeType;

.field public static final enum BIND:Lcom/xiaomi/xmpush/thrift/BootModeType;

.field public static final enum START:Lcom/xiaomi/xmpush/thrift/BootModeType;


# instance fields
.field private final value:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    new-instance v0, Lcom/xiaomi/xmpush/thrift/BootModeType;

    const-string v1, "START"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lcom/xiaomi/xmpush/thrift/BootModeType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/xiaomi/xmpush/thrift/BootModeType;->START:Lcom/xiaomi/xmpush/thrift/BootModeType;

    new-instance v0, Lcom/xiaomi/xmpush/thrift/BootModeType;

    const-string v1, "BIND"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3, v3}, Lcom/xiaomi/xmpush/thrift/BootModeType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/xiaomi/xmpush/thrift/BootModeType;->BIND:Lcom/xiaomi/xmpush/thrift/BootModeType;

    const/4 v0, 0x2

    new-array v0, v0, [Lcom/xiaomi/xmpush/thrift/BootModeType;

    sget-object v1, Lcom/xiaomi/xmpush/thrift/BootModeType;->START:Lcom/xiaomi/xmpush/thrift/BootModeType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/xiaomi/xmpush/thrift/BootModeType;->BIND:Lcom/xiaomi/xmpush/thrift/BootModeType;

    aput-object v1, v0, v3

    sput-object v0, Lcom/xiaomi/xmpush/thrift/BootModeType;->$VALUES:[Lcom/xiaomi/xmpush/thrift/BootModeType;

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

    iput p3, p0, Lcom/xiaomi/xmpush/thrift/BootModeType;->value:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/xiaomi/xmpush/thrift/BootModeType;
    .locals 1

    const-class v0, Lcom/xiaomi/xmpush/thrift/BootModeType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/xiaomi/xmpush/thrift/BootModeType;

    return-object p0
.end method

.method public static values()[Lcom/xiaomi/xmpush/thrift/BootModeType;
    .locals 1

    sget-object v0, Lcom/xiaomi/xmpush/thrift/BootModeType;->$VALUES:[Lcom/xiaomi/xmpush/thrift/BootModeType;

    invoke-virtual {v0}, [Lcom/xiaomi/xmpush/thrift/BootModeType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/xiaomi/xmpush/thrift/BootModeType;

    return-object v0
.end method


# virtual methods
.method public getValue()I
    .locals 1

    iget v0, p0, Lcom/xiaomi/xmpush/thrift/BootModeType;->value:I

    return v0
.end method
