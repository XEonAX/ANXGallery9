.class public Lcom/xiaomi/mipush/sdk/AssemblePushInfoHelper;
.super Ljava/lang/Object;
.source "AssemblePushInfoHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/mipush/sdk/AssemblePushInfoHelper$ManageClassInfo;
    }
.end annotation


# static fields
.field private static mHashMaps:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Lcom/xiaomi/mipush/sdk/AssemblePush;",
            "Lcom/xiaomi/mipush/sdk/AssemblePushInfoHelper$ManageClassInfo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/xiaomi/mipush/sdk/AssemblePushInfoHelper;->mHashMaps:Ljava/util/HashMap;

    sget-object v0, Lcom/xiaomi/mipush/sdk/AssemblePush;->ASSEMBLE_PUSH_HUAWEI:Lcom/xiaomi/mipush/sdk/AssemblePush;

    new-instance v1, Lcom/xiaomi/mipush/sdk/AssemblePushInfoHelper$ManageClassInfo;

    const-string v2, "com.xiaomi.assemble.control.HmsPushManager"

    const-string v3, "newInstance"

    invoke-direct {v1, v2, v3}, Lcom/xiaomi/mipush/sdk/AssemblePushInfoHelper$ManageClassInfo;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v0, v1}, Lcom/xiaomi/mipush/sdk/AssemblePushInfoHelper;->add(Lcom/xiaomi/mipush/sdk/AssemblePush;Lcom/xiaomi/mipush/sdk/AssemblePushInfoHelper$ManageClassInfo;)V

    sget-object v0, Lcom/xiaomi/mipush/sdk/AssemblePush;->ASSEMBLE_PUSH_FCM:Lcom/xiaomi/mipush/sdk/AssemblePush;

    new-instance v1, Lcom/xiaomi/mipush/sdk/AssemblePushInfoHelper$ManageClassInfo;

    const-string v2, "com.xiaomi.assemble.control.FCMPushManager"

    const-string v3, "newInstance"

    invoke-direct {v1, v2, v3}, Lcom/xiaomi/mipush/sdk/AssemblePushInfoHelper$ManageClassInfo;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v0, v1}, Lcom/xiaomi/mipush/sdk/AssemblePushInfoHelper;->add(Lcom/xiaomi/mipush/sdk/AssemblePush;Lcom/xiaomi/mipush/sdk/AssemblePushInfoHelper$ManageClassInfo;)V

    sget-object v0, Lcom/xiaomi/mipush/sdk/AssemblePush;->ASSEMBLE_PUSH_COS:Lcom/xiaomi/mipush/sdk/AssemblePush;

    new-instance v1, Lcom/xiaomi/mipush/sdk/AssemblePushInfoHelper$ManageClassInfo;

    const-string v2, "com.xiaomi.assemble.control.COSPushManager"

    const-string v3, "newInstance"

    invoke-direct {v1, v2, v3}, Lcom/xiaomi/mipush/sdk/AssemblePushInfoHelper$ManageClassInfo;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v0, v1}, Lcom/xiaomi/mipush/sdk/AssemblePushInfoHelper;->add(Lcom/xiaomi/mipush/sdk/AssemblePush;Lcom/xiaomi/mipush/sdk/AssemblePushInfoHelper$ManageClassInfo;)V

    sget-object v0, Lcom/xiaomi/mipush/sdk/AssemblePush;->ASSEMBLE_PUSH_FTOS:Lcom/xiaomi/mipush/sdk/AssemblePush;

    new-instance v1, Lcom/xiaomi/mipush/sdk/AssemblePushInfoHelper$ManageClassInfo;

    const-string v2, "com.xiaomi.assemble.control.FTOSPushManager"

    const-string v3, "newInstance"

    invoke-direct {v1, v2, v3}, Lcom/xiaomi/mipush/sdk/AssemblePushInfoHelper$ManageClassInfo;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v0, v1}, Lcom/xiaomi/mipush/sdk/AssemblePushInfoHelper;->add(Lcom/xiaomi/mipush/sdk/AssemblePush;Lcom/xiaomi/mipush/sdk/AssemblePushInfoHelper$ManageClassInfo;)V

    return-void
.end method

.method private static add(Lcom/xiaomi/mipush/sdk/AssemblePush;Lcom/xiaomi/mipush/sdk/AssemblePushInfoHelper$ManageClassInfo;)V
    .locals 1

    if-eqz p1, :cond_0

    sget-object v0, Lcom/xiaomi/mipush/sdk/AssemblePushInfoHelper;->mHashMaps:Ljava/util/HashMap;

    invoke-virtual {v0, p0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-void
.end method

.method public static getConfigKeyByType(Lcom/xiaomi/mipush/sdk/AssemblePush;)Lcom/xiaomi/xmpush/thrift/ConfigKey;
    .locals 0

    sget-object p0, Lcom/xiaomi/xmpush/thrift/ConfigKey;->AggregatePushSwitch:Lcom/xiaomi/xmpush/thrift/ConfigKey;

    return-object p0
.end method

.method public static getManageClassInfoByType(Lcom/xiaomi/mipush/sdk/AssemblePush;)Lcom/xiaomi/mipush/sdk/AssemblePushInfoHelper$ManageClassInfo;
    .locals 1

    sget-object v0, Lcom/xiaomi/mipush/sdk/AssemblePushInfoHelper;->mHashMaps:Ljava/util/HashMap;

    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/xiaomi/mipush/sdk/AssemblePushInfoHelper$ManageClassInfo;

    return-object p0
.end method

.method public static getRetryType(Lcom/xiaomi/mipush/sdk/AssemblePush;)Lcom/xiaomi/mipush/sdk/RetryType;
    .locals 1

    sget-object v0, Lcom/xiaomi/mipush/sdk/AssemblePushInfoHelper$1;->$SwitchMap$com$xiaomi$mipush$sdk$AssemblePush:[I

    invoke-virtual {p0}, Lcom/xiaomi/mipush/sdk/AssemblePush;->ordinal()I

    move-result p0

    aget p0, v0, p0

    packed-switch p0, :pswitch_data_0

    const/4 p0, 0x0

    goto :goto_0

    :pswitch_0
    sget-object p0, Lcom/xiaomi/mipush/sdk/RetryType;->UPLOAD_FTOS_TOKEN:Lcom/xiaomi/mipush/sdk/RetryType;

    goto :goto_0

    :pswitch_1
    sget-object p0, Lcom/xiaomi/mipush/sdk/RetryType;->UPLOAD_COS_TOKEN:Lcom/xiaomi/mipush/sdk/RetryType;

    goto :goto_0

    :pswitch_2
    sget-object p0, Lcom/xiaomi/mipush/sdk/RetryType;->UPLOAD_FCM_TOKEN:Lcom/xiaomi/mipush/sdk/RetryType;

    goto :goto_0

    :pswitch_3
    sget-object p0, Lcom/xiaomi/mipush/sdk/RetryType;->UPLOAD_HUAWEI_TOKEN:Lcom/xiaomi/mipush/sdk/RetryType;

    :goto_0
    return-object p0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
