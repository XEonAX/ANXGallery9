.class synthetic Lcom/xiaomi/push/service/OnlineConfigHelper$1;
.super Ljava/lang/Object;
.source "OnlineConfigHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/push/service/OnlineConfigHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$xiaomi$xmpush$thrift$ConfigListType:[I

.field static final synthetic $SwitchMap$com$xiaomi$xmpush$thrift$ConfigType:[I


# direct methods
.method static constructor <clinit>()V
    .locals 5

    invoke-static {}, Lcom/xiaomi/xmpush/thrift/ConfigType;->values()[Lcom/xiaomi/xmpush/thrift/ConfigType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/xiaomi/push/service/OnlineConfigHelper$1;->$SwitchMap$com$xiaomi$xmpush$thrift$ConfigType:[I

    const/4 v0, 0x1

    :try_start_0
    sget-object v1, Lcom/xiaomi/push/service/OnlineConfigHelper$1;->$SwitchMap$com$xiaomi$xmpush$thrift$ConfigType:[I

    sget-object v2, Lcom/xiaomi/xmpush/thrift/ConfigType;->INT:Lcom/xiaomi/xmpush/thrift/ConfigType;

    invoke-virtual {v2}, Lcom/xiaomi/xmpush/thrift/ConfigType;->ordinal()I

    move-result v2

    aput v0, v1, v2
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    const/4 v1, 0x2

    :try_start_1
    sget-object v2, Lcom/xiaomi/push/service/OnlineConfigHelper$1;->$SwitchMap$com$xiaomi$xmpush$thrift$ConfigType:[I

    sget-object v3, Lcom/xiaomi/xmpush/thrift/ConfigType;->LONG:Lcom/xiaomi/xmpush/thrift/ConfigType;

    invoke-virtual {v3}, Lcom/xiaomi/xmpush/thrift/ConfigType;->ordinal()I

    move-result v3

    aput v1, v2, v3
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    :try_start_2
    sget-object v2, Lcom/xiaomi/push/service/OnlineConfigHelper$1;->$SwitchMap$com$xiaomi$xmpush$thrift$ConfigType:[I

    sget-object v3, Lcom/xiaomi/xmpush/thrift/ConfigType;->STRING:Lcom/xiaomi/xmpush/thrift/ConfigType;

    invoke-virtual {v3}, Lcom/xiaomi/xmpush/thrift/ConfigType;->ordinal()I

    move-result v3

    const/4 v4, 0x3

    aput v4, v2, v3
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_2

    :catch_2
    :try_start_3
    sget-object v2, Lcom/xiaomi/push/service/OnlineConfigHelper$1;->$SwitchMap$com$xiaomi$xmpush$thrift$ConfigType:[I

    sget-object v3, Lcom/xiaomi/xmpush/thrift/ConfigType;->BOOLEAN:Lcom/xiaomi/xmpush/thrift/ConfigType;

    invoke-virtual {v3}, Lcom/xiaomi/xmpush/thrift/ConfigType;->ordinal()I

    move-result v3

    const/4 v4, 0x4

    aput v4, v2, v3
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_3

    :catch_3
    invoke-static {}, Lcom/xiaomi/xmpush/thrift/ConfigListType;->values()[Lcom/xiaomi/xmpush/thrift/ConfigListType;

    move-result-object v2

    array-length v2, v2

    new-array v2, v2, [I

    sput-object v2, Lcom/xiaomi/push/service/OnlineConfigHelper$1;->$SwitchMap$com$xiaomi$xmpush$thrift$ConfigListType:[I

    :try_start_4
    sget-object v2, Lcom/xiaomi/push/service/OnlineConfigHelper$1;->$SwitchMap$com$xiaomi$xmpush$thrift$ConfigListType:[I

    sget-object v3, Lcom/xiaomi/xmpush/thrift/ConfigListType;->MISC_CONFIG:Lcom/xiaomi/xmpush/thrift/ConfigListType;

    invoke-virtual {v3}, Lcom/xiaomi/xmpush/thrift/ConfigListType;->ordinal()I

    move-result v3

    aput v0, v2, v3
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_4

    :catch_4
    :try_start_5
    sget-object v0, Lcom/xiaomi/push/service/OnlineConfigHelper$1;->$SwitchMap$com$xiaomi$xmpush$thrift$ConfigListType:[I

    sget-object v2, Lcom/xiaomi/xmpush/thrift/ConfigListType;->PLUGIN_CONFIG:Lcom/xiaomi/xmpush/thrift/ConfigListType;

    invoke-virtual {v2}, Lcom/xiaomi/xmpush/thrift/ConfigListType;->ordinal()I

    move-result v2

    aput v1, v0, v2
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_5

    :catch_5
    return-void
.end method
