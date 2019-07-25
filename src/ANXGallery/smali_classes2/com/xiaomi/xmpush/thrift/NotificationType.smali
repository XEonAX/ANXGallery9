.class public final enum Lcom/xiaomi/xmpush/thrift/NotificationType;
.super Ljava/lang/Enum;
.source "NotificationType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/xiaomi/xmpush/thrift/NotificationType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/xiaomi/xmpush/thrift/NotificationType;

.field public static final enum APP_SLEEP:Lcom/xiaomi/xmpush/thrift/NotificationType;

.field public static final enum APP_WAKEUP:Lcom/xiaomi/xmpush/thrift/NotificationType;

.field public static final enum AppOpen:Lcom/xiaomi/xmpush/thrift/NotificationType;

.field public static final enum AppUninstall:Lcom/xiaomi/xmpush/thrift/NotificationType;

.field public static final enum AwakeApp:Lcom/xiaomi/xmpush/thrift/NotificationType;

.field public static final enum AwakeAppResponse:Lcom/xiaomi/xmpush/thrift/NotificationType;

.field public static final enum AwakeSystemApp:Lcom/xiaomi/xmpush/thrift/NotificationType;

.field public static final enum BarCancel:Lcom/xiaomi/xmpush/thrift/NotificationType;

.field public static final enum BarClick:Lcom/xiaomi/xmpush/thrift/NotificationType;

.field public static final enum CancelPushMessage:Lcom/xiaomi/xmpush/thrift/NotificationType;

.field public static final enum ClientABTest:Lcom/xiaomi/xmpush/thrift/NotificationType;

.field public static final enum ClientInfoUpdate:Lcom/xiaomi/xmpush/thrift/NotificationType;

.field public static final enum ClientInfoUpdateOk:Lcom/xiaomi/xmpush/thrift/NotificationType;

.field public static final enum ClientMIIDUpdate:Lcom/xiaomi/xmpush/thrift/NotificationType;

.field public static final enum ConnectionDisabled:Lcom/xiaomi/xmpush/thrift/NotificationType;

.field public static final enum CustomClientConfigUpdate:Lcom/xiaomi/xmpush/thrift/NotificationType;

.field public static final enum DailyCheckClientConfig:Lcom/xiaomi/xmpush/thrift/NotificationType;

.field public static final enum DataCollection:Lcom/xiaomi/xmpush/thrift/NotificationType;

.field public static final enum DecryptMessageFail:Lcom/xiaomi/xmpush/thrift/NotificationType;

.field public static final enum DisablePushMessage:Lcom/xiaomi/xmpush/thrift/NotificationType;

.field public static final enum EnablePushMessage:Lcom/xiaomi/xmpush/thrift/NotificationType;

.field public static final enum ForceSync:Lcom/xiaomi/xmpush/thrift/NotificationType;

.field public static final enum HybridRegister:Lcom/xiaomi/xmpush/thrift/NotificationType;

.field public static final enum HybridRegisterResult:Lcom/xiaomi/xmpush/thrift/NotificationType;

.field public static final enum HybridUnregister:Lcom/xiaomi/xmpush/thrift/NotificationType;

.field public static final enum HybridUnregisterResult:Lcom/xiaomi/xmpush/thrift/NotificationType;

.field public static final enum Invalid:Lcom/xiaomi/xmpush/thrift/NotificationType;

.field public static final enum IosSleep:Lcom/xiaomi/xmpush/thrift/NotificationType;

.field public static final enum IosWakeUp:Lcom/xiaomi/xmpush/thrift/NotificationType;

.field public static final enum NOTIFICATION_SWITCH:Lcom/xiaomi/xmpush/thrift/NotificationType;

.field public static final enum NormalClientConfigUpdate:Lcom/xiaomi/xmpush/thrift/NotificationType;

.field public static final enum NotificationBarInfo:Lcom/xiaomi/xmpush/thrift/NotificationType;

.field public static final enum PackageUninstall:Lcom/xiaomi/xmpush/thrift/NotificationType;

.field public static final enum PackageUnregistered:Lcom/xiaomi/xmpush/thrift/NotificationType;

.field public static final enum PullOfflineMessage:Lcom/xiaomi/xmpush/thrift/NotificationType;

.field public static final enum PushLogUpload:Lcom/xiaomi/xmpush/thrift/NotificationType;

.field public static final enum RegIdExpired:Lcom/xiaomi/xmpush/thrift/NotificationType;

.field public static final enum SyncInfo:Lcom/xiaomi/xmpush/thrift/NotificationType;

.field public static final enum SyncInfoResult:Lcom/xiaomi/xmpush/thrift/NotificationType;

.field public static final enum SyncMIID:Lcom/xiaomi/xmpush/thrift/NotificationType;

.field public static final enum ThirdPartyRegUpdate:Lcom/xiaomi/xmpush/thrift/NotificationType;

.field public static final enum UploadClientLog:Lcom/xiaomi/xmpush/thrift/NotificationType;

.field public static final enum UploadTinyData:Lcom/xiaomi/xmpush/thrift/NotificationType;

.field public static final enum VRUpload:Lcom/xiaomi/xmpush/thrift/NotificationType;


# instance fields
.field public final value:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 16

    new-instance v0, Lcom/xiaomi/xmpush/thrift/NotificationType;

    const-string v1, "Invalid"

    const-string v2, "INVALID"

    const/4 v3, 0x0

    invoke-direct {v0, v1, v3, v2}, Lcom/xiaomi/xmpush/thrift/NotificationType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/xiaomi/xmpush/thrift/NotificationType;->Invalid:Lcom/xiaomi/xmpush/thrift/NotificationType;

    new-instance v0, Lcom/xiaomi/xmpush/thrift/NotificationType;

    const-string v1, "BarClick"

    const-string v2, "bar:click"

    const/4 v4, 0x1

    invoke-direct {v0, v1, v4, v2}, Lcom/xiaomi/xmpush/thrift/NotificationType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/xiaomi/xmpush/thrift/NotificationType;->BarClick:Lcom/xiaomi/xmpush/thrift/NotificationType;

    new-instance v0, Lcom/xiaomi/xmpush/thrift/NotificationType;

    const-string v1, "BarCancel"

    const-string v2, "bar:cancel"

    const/4 v5, 0x2

    invoke-direct {v0, v1, v5, v2}, Lcom/xiaomi/xmpush/thrift/NotificationType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/xiaomi/xmpush/thrift/NotificationType;->BarCancel:Lcom/xiaomi/xmpush/thrift/NotificationType;

    new-instance v0, Lcom/xiaomi/xmpush/thrift/NotificationType;

    const-string v1, "AppOpen"

    const-string v2, "app:open"

    const/4 v6, 0x3

    invoke-direct {v0, v1, v6, v2}, Lcom/xiaomi/xmpush/thrift/NotificationType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/xiaomi/xmpush/thrift/NotificationType;->AppOpen:Lcom/xiaomi/xmpush/thrift/NotificationType;

    new-instance v0, Lcom/xiaomi/xmpush/thrift/NotificationType;

    const-string v1, "PackageUninstall"

    const-string v2, "package uninstalled"

    const/4 v7, 0x4

    invoke-direct {v0, v1, v7, v2}, Lcom/xiaomi/xmpush/thrift/NotificationType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/xiaomi/xmpush/thrift/NotificationType;->PackageUninstall:Lcom/xiaomi/xmpush/thrift/NotificationType;

    new-instance v0, Lcom/xiaomi/xmpush/thrift/NotificationType;

    const-string v1, "AppUninstall"

    const-string v2, "app_uninstalled"

    const/4 v8, 0x5

    invoke-direct {v0, v1, v8, v2}, Lcom/xiaomi/xmpush/thrift/NotificationType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/xiaomi/xmpush/thrift/NotificationType;->AppUninstall:Lcom/xiaomi/xmpush/thrift/NotificationType;

    new-instance v0, Lcom/xiaomi/xmpush/thrift/NotificationType;

    const-string v1, "ClientInfoUpdate"

    const-string v2, "client_info_update"

    const/4 v9, 0x6

    invoke-direct {v0, v1, v9, v2}, Lcom/xiaomi/xmpush/thrift/NotificationType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/xiaomi/xmpush/thrift/NotificationType;->ClientInfoUpdate:Lcom/xiaomi/xmpush/thrift/NotificationType;

    new-instance v0, Lcom/xiaomi/xmpush/thrift/NotificationType;

    const-string v1, "ClientInfoUpdateOk"

    const-string v2, "client_info_update_ok"

    const/4 v10, 0x7

    invoke-direct {v0, v1, v10, v2}, Lcom/xiaomi/xmpush/thrift/NotificationType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/xiaomi/xmpush/thrift/NotificationType;->ClientInfoUpdateOk:Lcom/xiaomi/xmpush/thrift/NotificationType;

    new-instance v0, Lcom/xiaomi/xmpush/thrift/NotificationType;

    const-string v1, "ClientMIIDUpdate"

    const-string v2, "client_miid_update"

    const/16 v11, 0x8

    invoke-direct {v0, v1, v11, v2}, Lcom/xiaomi/xmpush/thrift/NotificationType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/xiaomi/xmpush/thrift/NotificationType;->ClientMIIDUpdate:Lcom/xiaomi/xmpush/thrift/NotificationType;

    new-instance v0, Lcom/xiaomi/xmpush/thrift/NotificationType;

    const-string v1, "PullOfflineMessage"

    const-string v2, "pull"

    const/16 v12, 0x9

    invoke-direct {v0, v1, v12, v2}, Lcom/xiaomi/xmpush/thrift/NotificationType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/xiaomi/xmpush/thrift/NotificationType;->PullOfflineMessage:Lcom/xiaomi/xmpush/thrift/NotificationType;

    new-instance v0, Lcom/xiaomi/xmpush/thrift/NotificationType;

    const-string v1, "IosSleep"

    const-string v2, "ios_sleep"

    const/16 v13, 0xa

    invoke-direct {v0, v1, v13, v2}, Lcom/xiaomi/xmpush/thrift/NotificationType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/xiaomi/xmpush/thrift/NotificationType;->IosSleep:Lcom/xiaomi/xmpush/thrift/NotificationType;

    new-instance v0, Lcom/xiaomi/xmpush/thrift/NotificationType;

    const-string v1, "IosWakeUp"

    const-string v2, "ios_wakeup"

    const/16 v14, 0xb

    invoke-direct {v0, v1, v14, v2}, Lcom/xiaomi/xmpush/thrift/NotificationType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/xiaomi/xmpush/thrift/NotificationType;->IosWakeUp:Lcom/xiaomi/xmpush/thrift/NotificationType;

    new-instance v0, Lcom/xiaomi/xmpush/thrift/NotificationType;

    const-string v1, "AwakeApp"

    const-string v2, "awake_app"

    const/16 v15, 0xc

    invoke-direct {v0, v1, v15, v2}, Lcom/xiaomi/xmpush/thrift/NotificationType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/xiaomi/xmpush/thrift/NotificationType;->AwakeApp:Lcom/xiaomi/xmpush/thrift/NotificationType;

    new-instance v0, Lcom/xiaomi/xmpush/thrift/NotificationType;

    const-string v1, "NormalClientConfigUpdate"

    const-string v2, "normal_client_config_update"

    const/16 v15, 0xd

    invoke-direct {v0, v1, v15, v2}, Lcom/xiaomi/xmpush/thrift/NotificationType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/xiaomi/xmpush/thrift/NotificationType;->NormalClientConfigUpdate:Lcom/xiaomi/xmpush/thrift/NotificationType;

    new-instance v0, Lcom/xiaomi/xmpush/thrift/NotificationType;

    const-string v1, "CustomClientConfigUpdate"

    const-string v2, "custom_client_config_update"

    const/16 v15, 0xe

    invoke-direct {v0, v1, v15, v2}, Lcom/xiaomi/xmpush/thrift/NotificationType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/xiaomi/xmpush/thrift/NotificationType;->CustomClientConfigUpdate:Lcom/xiaomi/xmpush/thrift/NotificationType;

    new-instance v0, Lcom/xiaomi/xmpush/thrift/NotificationType;

    const-string v1, "DailyCheckClientConfig"

    const-string v2, "daily_check_client_config"

    const/16 v15, 0xf

    invoke-direct {v0, v1, v15, v2}, Lcom/xiaomi/xmpush/thrift/NotificationType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/xiaomi/xmpush/thrift/NotificationType;->DailyCheckClientConfig:Lcom/xiaomi/xmpush/thrift/NotificationType;

    new-instance v0, Lcom/xiaomi/xmpush/thrift/NotificationType;

    const-string v1, "DataCollection"

    const-string v2, "data_collection"

    const/16 v15, 0x10

    invoke-direct {v0, v1, v15, v2}, Lcom/xiaomi/xmpush/thrift/NotificationType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/xiaomi/xmpush/thrift/NotificationType;->DataCollection:Lcom/xiaomi/xmpush/thrift/NotificationType;

    new-instance v0, Lcom/xiaomi/xmpush/thrift/NotificationType;

    const-string v1, "RegIdExpired"

    const-string v2, "registration id expired"

    const/16 v15, 0x11

    invoke-direct {v0, v1, v15, v2}, Lcom/xiaomi/xmpush/thrift/NotificationType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/xiaomi/xmpush/thrift/NotificationType;->RegIdExpired:Lcom/xiaomi/xmpush/thrift/NotificationType;

    new-instance v0, Lcom/xiaomi/xmpush/thrift/NotificationType;

    const-string v1, "ConnectionDisabled"

    const-string v2, "!!!MILINK CONNECTION DISABLED!!!"

    const/16 v15, 0x12

    invoke-direct {v0, v1, v15, v2}, Lcom/xiaomi/xmpush/thrift/NotificationType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/xiaomi/xmpush/thrift/NotificationType;->ConnectionDisabled:Lcom/xiaomi/xmpush/thrift/NotificationType;

    new-instance v0, Lcom/xiaomi/xmpush/thrift/NotificationType;

    const-string v1, "PackageUnregistered"

    const-string v2, "package_unregistered"

    const/16 v15, 0x13

    invoke-direct {v0, v1, v15, v2}, Lcom/xiaomi/xmpush/thrift/NotificationType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/xiaomi/xmpush/thrift/NotificationType;->PackageUnregistered:Lcom/xiaomi/xmpush/thrift/NotificationType;

    new-instance v0, Lcom/xiaomi/xmpush/thrift/NotificationType;

    const-string v1, "DecryptMessageFail"

    const-string v2, "decrypt_msg_fail"

    const/16 v15, 0x14

    invoke-direct {v0, v1, v15, v2}, Lcom/xiaomi/xmpush/thrift/NotificationType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/xiaomi/xmpush/thrift/NotificationType;->DecryptMessageFail:Lcom/xiaomi/xmpush/thrift/NotificationType;

    new-instance v0, Lcom/xiaomi/xmpush/thrift/NotificationType;

    const-string v1, "SyncInfo"

    const-string v2, "sync_info"

    const/16 v15, 0x15

    invoke-direct {v0, v1, v15, v2}, Lcom/xiaomi/xmpush/thrift/NotificationType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/xiaomi/xmpush/thrift/NotificationType;->SyncInfo:Lcom/xiaomi/xmpush/thrift/NotificationType;

    new-instance v0, Lcom/xiaomi/xmpush/thrift/NotificationType;

    const-string v1, "SyncInfoResult"

    const-string v2, "sync_info_result"

    const/16 v15, 0x16

    invoke-direct {v0, v1, v15, v2}, Lcom/xiaomi/xmpush/thrift/NotificationType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/xiaomi/xmpush/thrift/NotificationType;->SyncInfoResult:Lcom/xiaomi/xmpush/thrift/NotificationType;

    new-instance v0, Lcom/xiaomi/xmpush/thrift/NotificationType;

    const-string v1, "ForceSync"

    const-string v2, "force_sync"

    const/16 v15, 0x17

    invoke-direct {v0, v1, v15, v2}, Lcom/xiaomi/xmpush/thrift/NotificationType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/xiaomi/xmpush/thrift/NotificationType;->ForceSync:Lcom/xiaomi/xmpush/thrift/NotificationType;

    new-instance v0, Lcom/xiaomi/xmpush/thrift/NotificationType;

    const-string v1, "UploadClientLog"

    const-string v2, "upload_client_log"

    const/16 v15, 0x18

    invoke-direct {v0, v1, v15, v2}, Lcom/xiaomi/xmpush/thrift/NotificationType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/xiaomi/xmpush/thrift/NotificationType;->UploadClientLog:Lcom/xiaomi/xmpush/thrift/NotificationType;

    new-instance v0, Lcom/xiaomi/xmpush/thrift/NotificationType;

    const-string v1, "NotificationBarInfo"

    const-string v2, "notification_bar_info"

    const/16 v15, 0x19

    invoke-direct {v0, v1, v15, v2}, Lcom/xiaomi/xmpush/thrift/NotificationType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/xiaomi/xmpush/thrift/NotificationType;->NotificationBarInfo:Lcom/xiaomi/xmpush/thrift/NotificationType;

    new-instance v0, Lcom/xiaomi/xmpush/thrift/NotificationType;

    const-string v1, "SyncMIID"

    const-string v2, "sync_miid"

    const/16 v15, 0x1a

    invoke-direct {v0, v1, v15, v2}, Lcom/xiaomi/xmpush/thrift/NotificationType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/xiaomi/xmpush/thrift/NotificationType;->SyncMIID:Lcom/xiaomi/xmpush/thrift/NotificationType;

    new-instance v0, Lcom/xiaomi/xmpush/thrift/NotificationType;

    const-string v1, "UploadTinyData"

    const-string v2, "upload"

    const/16 v15, 0x1b

    invoke-direct {v0, v1, v15, v2}, Lcom/xiaomi/xmpush/thrift/NotificationType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/xiaomi/xmpush/thrift/NotificationType;->UploadTinyData:Lcom/xiaomi/xmpush/thrift/NotificationType;

    new-instance v0, Lcom/xiaomi/xmpush/thrift/NotificationType;

    const-string v1, "CancelPushMessage"

    const-string v2, "clear_push_message"

    const/16 v15, 0x1c

    invoke-direct {v0, v1, v15, v2}, Lcom/xiaomi/xmpush/thrift/NotificationType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/xiaomi/xmpush/thrift/NotificationType;->CancelPushMessage:Lcom/xiaomi/xmpush/thrift/NotificationType;

    new-instance v0, Lcom/xiaomi/xmpush/thrift/NotificationType;

    const-string v1, "DisablePushMessage"

    const-string v2, "disable_push"

    const/16 v15, 0x1d

    invoke-direct {v0, v1, v15, v2}, Lcom/xiaomi/xmpush/thrift/NotificationType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/xiaomi/xmpush/thrift/NotificationType;->DisablePushMessage:Lcom/xiaomi/xmpush/thrift/NotificationType;

    new-instance v0, Lcom/xiaomi/xmpush/thrift/NotificationType;

    const-string v1, "EnablePushMessage"

    const-string v2, "enable_push"

    const/16 v15, 0x1e

    invoke-direct {v0, v1, v15, v2}, Lcom/xiaomi/xmpush/thrift/NotificationType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/xiaomi/xmpush/thrift/NotificationType;->EnablePushMessage:Lcom/xiaomi/xmpush/thrift/NotificationType;

    new-instance v0, Lcom/xiaomi/xmpush/thrift/NotificationType;

    const-string v1, "ClientABTest"

    const-string v2, "client_ab_test"

    const/16 v15, 0x1f

    invoke-direct {v0, v1, v15, v2}, Lcom/xiaomi/xmpush/thrift/NotificationType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/xiaomi/xmpush/thrift/NotificationType;->ClientABTest:Lcom/xiaomi/xmpush/thrift/NotificationType;

    new-instance v0, Lcom/xiaomi/xmpush/thrift/NotificationType;

    const-string v1, "AwakeSystemApp"

    const-string v2, "awake_system_app"

    const/16 v15, 0x20

    invoke-direct {v0, v1, v15, v2}, Lcom/xiaomi/xmpush/thrift/NotificationType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/xiaomi/xmpush/thrift/NotificationType;->AwakeSystemApp:Lcom/xiaomi/xmpush/thrift/NotificationType;

    new-instance v0, Lcom/xiaomi/xmpush/thrift/NotificationType;

    const-string v1, "AwakeAppResponse"

    const-string v2, "awake_app_response"

    const/16 v15, 0x21

    invoke-direct {v0, v1, v15, v2}, Lcom/xiaomi/xmpush/thrift/NotificationType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/xiaomi/xmpush/thrift/NotificationType;->AwakeAppResponse:Lcom/xiaomi/xmpush/thrift/NotificationType;

    new-instance v0, Lcom/xiaomi/xmpush/thrift/NotificationType;

    const-string v1, "HybridRegister"

    const-string v2, "hb_register"

    const/16 v15, 0x22

    invoke-direct {v0, v1, v15, v2}, Lcom/xiaomi/xmpush/thrift/NotificationType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/xiaomi/xmpush/thrift/NotificationType;->HybridRegister:Lcom/xiaomi/xmpush/thrift/NotificationType;

    new-instance v0, Lcom/xiaomi/xmpush/thrift/NotificationType;

    const-string v1, "HybridRegisterResult"

    const-string v2, "hb_register_res"

    const/16 v15, 0x23

    invoke-direct {v0, v1, v15, v2}, Lcom/xiaomi/xmpush/thrift/NotificationType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/xiaomi/xmpush/thrift/NotificationType;->HybridRegisterResult:Lcom/xiaomi/xmpush/thrift/NotificationType;

    new-instance v0, Lcom/xiaomi/xmpush/thrift/NotificationType;

    const-string v1, "HybridUnregister"

    const-string v2, "hb_unregister"

    const/16 v15, 0x24

    invoke-direct {v0, v1, v15, v2}, Lcom/xiaomi/xmpush/thrift/NotificationType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/xiaomi/xmpush/thrift/NotificationType;->HybridUnregister:Lcom/xiaomi/xmpush/thrift/NotificationType;

    new-instance v0, Lcom/xiaomi/xmpush/thrift/NotificationType;

    const-string v1, "HybridUnregisterResult"

    const-string v2, "hb_unregister_res"

    const/16 v15, 0x25

    invoke-direct {v0, v1, v15, v2}, Lcom/xiaomi/xmpush/thrift/NotificationType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/xiaomi/xmpush/thrift/NotificationType;->HybridUnregisterResult:Lcom/xiaomi/xmpush/thrift/NotificationType;

    new-instance v0, Lcom/xiaomi/xmpush/thrift/NotificationType;

    const-string v1, "ThirdPartyRegUpdate"

    const-string v2, "3rd_party_reg_update"

    const/16 v15, 0x26

    invoke-direct {v0, v1, v15, v2}, Lcom/xiaomi/xmpush/thrift/NotificationType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/xiaomi/xmpush/thrift/NotificationType;->ThirdPartyRegUpdate:Lcom/xiaomi/xmpush/thrift/NotificationType;

    new-instance v0, Lcom/xiaomi/xmpush/thrift/NotificationType;

    const-string v1, "VRUpload"

    const-string v2, "vr_upload"

    const/16 v15, 0x27

    invoke-direct {v0, v1, v15, v2}, Lcom/xiaomi/xmpush/thrift/NotificationType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/xiaomi/xmpush/thrift/NotificationType;->VRUpload:Lcom/xiaomi/xmpush/thrift/NotificationType;

    new-instance v0, Lcom/xiaomi/xmpush/thrift/NotificationType;

    const-string v1, "PushLogUpload"

    const-string v2, "log_upload"

    const/16 v15, 0x28

    invoke-direct {v0, v1, v15, v2}, Lcom/xiaomi/xmpush/thrift/NotificationType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/xiaomi/xmpush/thrift/NotificationType;->PushLogUpload:Lcom/xiaomi/xmpush/thrift/NotificationType;

    new-instance v0, Lcom/xiaomi/xmpush/thrift/NotificationType;

    const-string v1, "APP_WAKEUP"

    const-string v2, "app_wakeup"

    const/16 v15, 0x29

    invoke-direct {v0, v1, v15, v2}, Lcom/xiaomi/xmpush/thrift/NotificationType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/xiaomi/xmpush/thrift/NotificationType;->APP_WAKEUP:Lcom/xiaomi/xmpush/thrift/NotificationType;

    new-instance v0, Lcom/xiaomi/xmpush/thrift/NotificationType;

    const-string v1, "APP_SLEEP"

    const-string v2, "app_sleep"

    const/16 v15, 0x2a

    invoke-direct {v0, v1, v15, v2}, Lcom/xiaomi/xmpush/thrift/NotificationType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/xiaomi/xmpush/thrift/NotificationType;->APP_SLEEP:Lcom/xiaomi/xmpush/thrift/NotificationType;

    new-instance v0, Lcom/xiaomi/xmpush/thrift/NotificationType;

    const-string v1, "NOTIFICATION_SWITCH"

    const-string v2, "notification_switch"

    const/16 v15, 0x2b

    invoke-direct {v0, v1, v15, v2}, Lcom/xiaomi/xmpush/thrift/NotificationType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/xiaomi/xmpush/thrift/NotificationType;->NOTIFICATION_SWITCH:Lcom/xiaomi/xmpush/thrift/NotificationType;

    const/16 v0, 0x2c

    new-array v0, v0, [Lcom/xiaomi/xmpush/thrift/NotificationType;

    sget-object v1, Lcom/xiaomi/xmpush/thrift/NotificationType;->Invalid:Lcom/xiaomi/xmpush/thrift/NotificationType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/xiaomi/xmpush/thrift/NotificationType;->BarClick:Lcom/xiaomi/xmpush/thrift/NotificationType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/xiaomi/xmpush/thrift/NotificationType;->BarCancel:Lcom/xiaomi/xmpush/thrift/NotificationType;

    aput-object v1, v0, v5

    sget-object v1, Lcom/xiaomi/xmpush/thrift/NotificationType;->AppOpen:Lcom/xiaomi/xmpush/thrift/NotificationType;

    aput-object v1, v0, v6

    sget-object v1, Lcom/xiaomi/xmpush/thrift/NotificationType;->PackageUninstall:Lcom/xiaomi/xmpush/thrift/NotificationType;

    aput-object v1, v0, v7

    sget-object v1, Lcom/xiaomi/xmpush/thrift/NotificationType;->AppUninstall:Lcom/xiaomi/xmpush/thrift/NotificationType;

    aput-object v1, v0, v8

    sget-object v1, Lcom/xiaomi/xmpush/thrift/NotificationType;->ClientInfoUpdate:Lcom/xiaomi/xmpush/thrift/NotificationType;

    aput-object v1, v0, v9

    sget-object v1, Lcom/xiaomi/xmpush/thrift/NotificationType;->ClientInfoUpdateOk:Lcom/xiaomi/xmpush/thrift/NotificationType;

    aput-object v1, v0, v10

    sget-object v1, Lcom/xiaomi/xmpush/thrift/NotificationType;->ClientMIIDUpdate:Lcom/xiaomi/xmpush/thrift/NotificationType;

    aput-object v1, v0, v11

    sget-object v1, Lcom/xiaomi/xmpush/thrift/NotificationType;->PullOfflineMessage:Lcom/xiaomi/xmpush/thrift/NotificationType;

    aput-object v1, v0, v12

    sget-object v1, Lcom/xiaomi/xmpush/thrift/NotificationType;->IosSleep:Lcom/xiaomi/xmpush/thrift/NotificationType;

    aput-object v1, v0, v13

    sget-object v1, Lcom/xiaomi/xmpush/thrift/NotificationType;->IosWakeUp:Lcom/xiaomi/xmpush/thrift/NotificationType;

    aput-object v1, v0, v14

    sget-object v1, Lcom/xiaomi/xmpush/thrift/NotificationType;->AwakeApp:Lcom/xiaomi/xmpush/thrift/NotificationType;

    const/16 v2, 0xc

    aput-object v1, v0, v2

    sget-object v1, Lcom/xiaomi/xmpush/thrift/NotificationType;->NormalClientConfigUpdate:Lcom/xiaomi/xmpush/thrift/NotificationType;

    const/16 v2, 0xd

    aput-object v1, v0, v2

    sget-object v1, Lcom/xiaomi/xmpush/thrift/NotificationType;->CustomClientConfigUpdate:Lcom/xiaomi/xmpush/thrift/NotificationType;

    const/16 v2, 0xe

    aput-object v1, v0, v2

    sget-object v1, Lcom/xiaomi/xmpush/thrift/NotificationType;->DailyCheckClientConfig:Lcom/xiaomi/xmpush/thrift/NotificationType;

    const/16 v2, 0xf

    aput-object v1, v0, v2

    sget-object v1, Lcom/xiaomi/xmpush/thrift/NotificationType;->DataCollection:Lcom/xiaomi/xmpush/thrift/NotificationType;

    const/16 v2, 0x10

    aput-object v1, v0, v2

    sget-object v1, Lcom/xiaomi/xmpush/thrift/NotificationType;->RegIdExpired:Lcom/xiaomi/xmpush/thrift/NotificationType;

    const/16 v2, 0x11

    aput-object v1, v0, v2

    sget-object v1, Lcom/xiaomi/xmpush/thrift/NotificationType;->ConnectionDisabled:Lcom/xiaomi/xmpush/thrift/NotificationType;

    const/16 v2, 0x12

    aput-object v1, v0, v2

    sget-object v1, Lcom/xiaomi/xmpush/thrift/NotificationType;->PackageUnregistered:Lcom/xiaomi/xmpush/thrift/NotificationType;

    const/16 v2, 0x13

    aput-object v1, v0, v2

    sget-object v1, Lcom/xiaomi/xmpush/thrift/NotificationType;->DecryptMessageFail:Lcom/xiaomi/xmpush/thrift/NotificationType;

    const/16 v2, 0x14

    aput-object v1, v0, v2

    sget-object v1, Lcom/xiaomi/xmpush/thrift/NotificationType;->SyncInfo:Lcom/xiaomi/xmpush/thrift/NotificationType;

    const/16 v2, 0x15

    aput-object v1, v0, v2

    sget-object v1, Lcom/xiaomi/xmpush/thrift/NotificationType;->SyncInfoResult:Lcom/xiaomi/xmpush/thrift/NotificationType;

    const/16 v2, 0x16

    aput-object v1, v0, v2

    sget-object v1, Lcom/xiaomi/xmpush/thrift/NotificationType;->ForceSync:Lcom/xiaomi/xmpush/thrift/NotificationType;

    const/16 v2, 0x17

    aput-object v1, v0, v2

    sget-object v1, Lcom/xiaomi/xmpush/thrift/NotificationType;->UploadClientLog:Lcom/xiaomi/xmpush/thrift/NotificationType;

    const/16 v2, 0x18

    aput-object v1, v0, v2

    sget-object v1, Lcom/xiaomi/xmpush/thrift/NotificationType;->NotificationBarInfo:Lcom/xiaomi/xmpush/thrift/NotificationType;

    const/16 v2, 0x19

    aput-object v1, v0, v2

    sget-object v1, Lcom/xiaomi/xmpush/thrift/NotificationType;->SyncMIID:Lcom/xiaomi/xmpush/thrift/NotificationType;

    const/16 v2, 0x1a

    aput-object v1, v0, v2

    sget-object v1, Lcom/xiaomi/xmpush/thrift/NotificationType;->UploadTinyData:Lcom/xiaomi/xmpush/thrift/NotificationType;

    const/16 v2, 0x1b

    aput-object v1, v0, v2

    sget-object v1, Lcom/xiaomi/xmpush/thrift/NotificationType;->CancelPushMessage:Lcom/xiaomi/xmpush/thrift/NotificationType;

    const/16 v2, 0x1c

    aput-object v1, v0, v2

    sget-object v1, Lcom/xiaomi/xmpush/thrift/NotificationType;->DisablePushMessage:Lcom/xiaomi/xmpush/thrift/NotificationType;

    const/16 v2, 0x1d

    aput-object v1, v0, v2

    sget-object v1, Lcom/xiaomi/xmpush/thrift/NotificationType;->EnablePushMessage:Lcom/xiaomi/xmpush/thrift/NotificationType;

    const/16 v2, 0x1e

    aput-object v1, v0, v2

    sget-object v1, Lcom/xiaomi/xmpush/thrift/NotificationType;->ClientABTest:Lcom/xiaomi/xmpush/thrift/NotificationType;

    const/16 v2, 0x1f

    aput-object v1, v0, v2

    sget-object v1, Lcom/xiaomi/xmpush/thrift/NotificationType;->AwakeSystemApp:Lcom/xiaomi/xmpush/thrift/NotificationType;

    const/16 v2, 0x20

    aput-object v1, v0, v2

    sget-object v1, Lcom/xiaomi/xmpush/thrift/NotificationType;->AwakeAppResponse:Lcom/xiaomi/xmpush/thrift/NotificationType;

    const/16 v2, 0x21

    aput-object v1, v0, v2

    sget-object v1, Lcom/xiaomi/xmpush/thrift/NotificationType;->HybridRegister:Lcom/xiaomi/xmpush/thrift/NotificationType;

    const/16 v2, 0x22

    aput-object v1, v0, v2

    sget-object v1, Lcom/xiaomi/xmpush/thrift/NotificationType;->HybridRegisterResult:Lcom/xiaomi/xmpush/thrift/NotificationType;

    const/16 v2, 0x23

    aput-object v1, v0, v2

    sget-object v1, Lcom/xiaomi/xmpush/thrift/NotificationType;->HybridUnregister:Lcom/xiaomi/xmpush/thrift/NotificationType;

    const/16 v2, 0x24

    aput-object v1, v0, v2

    sget-object v1, Lcom/xiaomi/xmpush/thrift/NotificationType;->HybridUnregisterResult:Lcom/xiaomi/xmpush/thrift/NotificationType;

    const/16 v2, 0x25

    aput-object v1, v0, v2

    sget-object v1, Lcom/xiaomi/xmpush/thrift/NotificationType;->ThirdPartyRegUpdate:Lcom/xiaomi/xmpush/thrift/NotificationType;

    const/16 v2, 0x26

    aput-object v1, v0, v2

    sget-object v1, Lcom/xiaomi/xmpush/thrift/NotificationType;->VRUpload:Lcom/xiaomi/xmpush/thrift/NotificationType;

    const/16 v2, 0x27

    aput-object v1, v0, v2

    sget-object v1, Lcom/xiaomi/xmpush/thrift/NotificationType;->PushLogUpload:Lcom/xiaomi/xmpush/thrift/NotificationType;

    const/16 v2, 0x28

    aput-object v1, v0, v2

    sget-object v1, Lcom/xiaomi/xmpush/thrift/NotificationType;->APP_WAKEUP:Lcom/xiaomi/xmpush/thrift/NotificationType;

    const/16 v2, 0x29

    aput-object v1, v0, v2

    sget-object v1, Lcom/xiaomi/xmpush/thrift/NotificationType;->APP_SLEEP:Lcom/xiaomi/xmpush/thrift/NotificationType;

    const/16 v2, 0x2a

    aput-object v1, v0, v2

    sget-object v1, Lcom/xiaomi/xmpush/thrift/NotificationType;->NOTIFICATION_SWITCH:Lcom/xiaomi/xmpush/thrift/NotificationType;

    const/16 v2, 0x2b

    aput-object v1, v0, v2

    sput-object v0, Lcom/xiaomi/xmpush/thrift/NotificationType;->$VALUES:[Lcom/xiaomi/xmpush/thrift/NotificationType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lcom/xiaomi/xmpush/thrift/NotificationType;->value:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/xiaomi/xmpush/thrift/NotificationType;
    .locals 1

    const-class v0, Lcom/xiaomi/xmpush/thrift/NotificationType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/xiaomi/xmpush/thrift/NotificationType;

    return-object p0
.end method

.method public static values()[Lcom/xiaomi/xmpush/thrift/NotificationType;
    .locals 1

    sget-object v0, Lcom/xiaomi/xmpush/thrift/NotificationType;->$VALUES:[Lcom/xiaomi/xmpush/thrift/NotificationType;

    invoke-virtual {v0}, [Lcom/xiaomi/xmpush/thrift/NotificationType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/xiaomi/xmpush/thrift/NotificationType;

    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/xmpush/thrift/NotificationType;->value:Ljava/lang/String;

    return-object v0
.end method
