.class synthetic Lcom/xiaomi/mipush/sdk/AssemblePushInfoHelper$1;
.super Ljava/lang/Object;
.source "AssemblePushInfoHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/mipush/sdk/AssemblePushInfoHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$xiaomi$mipush$sdk$AssemblePush:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    invoke-static {}, Lcom/xiaomi/mipush/sdk/AssemblePush;->values()[Lcom/xiaomi/mipush/sdk/AssemblePush;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/xiaomi/mipush/sdk/AssemblePushInfoHelper$1;->$SwitchMap$com$xiaomi$mipush$sdk$AssemblePush:[I

    :try_start_0
    sget-object v0, Lcom/xiaomi/mipush/sdk/AssemblePushInfoHelper$1;->$SwitchMap$com$xiaomi$mipush$sdk$AssemblePush:[I

    sget-object v1, Lcom/xiaomi/mipush/sdk/AssemblePush;->ASSEMBLE_PUSH_HUAWEI:Lcom/xiaomi/mipush/sdk/AssemblePush;

    invoke-virtual {v1}, Lcom/xiaomi/mipush/sdk/AssemblePush;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :try_start_1
    sget-object v0, Lcom/xiaomi/mipush/sdk/AssemblePushInfoHelper$1;->$SwitchMap$com$xiaomi$mipush$sdk$AssemblePush:[I

    sget-object v1, Lcom/xiaomi/mipush/sdk/AssemblePush;->ASSEMBLE_PUSH_FCM:Lcom/xiaomi/mipush/sdk/AssemblePush;

    invoke-virtual {v1}, Lcom/xiaomi/mipush/sdk/AssemblePush;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    :try_start_2
    sget-object v0, Lcom/xiaomi/mipush/sdk/AssemblePushInfoHelper$1;->$SwitchMap$com$xiaomi$mipush$sdk$AssemblePush:[I

    sget-object v1, Lcom/xiaomi/mipush/sdk/AssemblePush;->ASSEMBLE_PUSH_COS:Lcom/xiaomi/mipush/sdk/AssemblePush;

    invoke-virtual {v1}, Lcom/xiaomi/mipush/sdk/AssemblePush;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_2

    :catch_2
    :try_start_3
    sget-object v0, Lcom/xiaomi/mipush/sdk/AssemblePushInfoHelper$1;->$SwitchMap$com$xiaomi$mipush$sdk$AssemblePush:[I

    sget-object v1, Lcom/xiaomi/mipush/sdk/AssemblePush;->ASSEMBLE_PUSH_FTOS:Lcom/xiaomi/mipush/sdk/AssemblePush;

    invoke-virtual {v1}, Lcom/xiaomi/mipush/sdk/AssemblePush;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_3

    :catch_3
    return-void
.end method
