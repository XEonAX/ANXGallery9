.class public final enum Lcom/xiaomi/xmpush/thrift/ConfigListType;
.super Ljava/lang/Enum;
.source "ConfigListType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/xiaomi/xmpush/thrift/ConfigListType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/xiaomi/xmpush/thrift/ConfigListType;

.field public static final enum MISC_CONFIG:Lcom/xiaomi/xmpush/thrift/ConfigListType;

.field public static final enum PLUGIN_CONFIG:Lcom/xiaomi/xmpush/thrift/ConfigListType;


# instance fields
.field private final value:I


# direct methods
.method static constructor <clinit>()V
    .locals 5

    new-instance v0, Lcom/xiaomi/xmpush/thrift/ConfigListType;

    const-string v1, "MISC_CONFIG"

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Lcom/xiaomi/xmpush/thrift/ConfigListType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/xiaomi/xmpush/thrift/ConfigListType;->MISC_CONFIG:Lcom/xiaomi/xmpush/thrift/ConfigListType;

    new-instance v0, Lcom/xiaomi/xmpush/thrift/ConfigListType;

    const-string v1, "PLUGIN_CONFIG"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v3, v4}, Lcom/xiaomi/xmpush/thrift/ConfigListType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/xiaomi/xmpush/thrift/ConfigListType;->PLUGIN_CONFIG:Lcom/xiaomi/xmpush/thrift/ConfigListType;

    new-array v0, v4, [Lcom/xiaomi/xmpush/thrift/ConfigListType;

    sget-object v1, Lcom/xiaomi/xmpush/thrift/ConfigListType;->MISC_CONFIG:Lcom/xiaomi/xmpush/thrift/ConfigListType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/xiaomi/xmpush/thrift/ConfigListType;->PLUGIN_CONFIG:Lcom/xiaomi/xmpush/thrift/ConfigListType;

    aput-object v1, v0, v3

    sput-object v0, Lcom/xiaomi/xmpush/thrift/ConfigListType;->$VALUES:[Lcom/xiaomi/xmpush/thrift/ConfigListType;

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

    iput p3, p0, Lcom/xiaomi/xmpush/thrift/ConfigListType;->value:I

    return-void
.end method

.method public static findByValue(I)Lcom/xiaomi/xmpush/thrift/ConfigListType;
    .locals 0

    packed-switch p0, :pswitch_data_0

    const/4 p0, 0x0

    return-object p0

    :pswitch_0
    sget-object p0, Lcom/xiaomi/xmpush/thrift/ConfigListType;->PLUGIN_CONFIG:Lcom/xiaomi/xmpush/thrift/ConfigListType;

    return-object p0

    :pswitch_1
    sget-object p0, Lcom/xiaomi/xmpush/thrift/ConfigListType;->MISC_CONFIG:Lcom/xiaomi/xmpush/thrift/ConfigListType;

    return-object p0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/xiaomi/xmpush/thrift/ConfigListType;
    .locals 1

    const-class v0, Lcom/xiaomi/xmpush/thrift/ConfigListType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/xiaomi/xmpush/thrift/ConfigListType;

    return-object p0
.end method

.method public static values()[Lcom/xiaomi/xmpush/thrift/ConfigListType;
    .locals 1

    sget-object v0, Lcom/xiaomi/xmpush/thrift/ConfigListType;->$VALUES:[Lcom/xiaomi/xmpush/thrift/ConfigListType;

    invoke-virtual {v0}, [Lcom/xiaomi/xmpush/thrift/ConfigListType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/xiaomi/xmpush/thrift/ConfigListType;

    return-object v0
.end method


# virtual methods
.method public getValue()I
    .locals 1

    iget v0, p0, Lcom/xiaomi/xmpush/thrift/ConfigListType;->value:I

    return v0
.end method
