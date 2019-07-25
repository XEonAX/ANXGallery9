.class public Lcom/miui/gallery/error/BaseErrorCodeTranslator;
.super Ljava/lang/Object;
.source "BaseErrorCodeTranslator.java"

# interfaces
.implements Lcom/miui/gallery/error/core/ErrorCodeTranslator;


# instance fields
.field private mTask:Landroid/os/AsyncTask;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/AsyncTask<",
            "Lcom/miui/gallery/error/core/ErrorCode;",
            "Ljava/lang/Void;",
            "Lcom/miui/gallery/error/core/ErrorTip;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/error/BaseErrorCodeTranslator;)Landroid/os/AsyncTask;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/error/BaseErrorCodeTranslator;->mTask:Landroid/os/AsyncTask;

    return-object p0
.end method

.method static synthetic access$002(Lcom/miui/gallery/error/BaseErrorCodeTranslator;Landroid/os/AsyncTask;)Landroid/os/AsyncTask;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/error/BaseErrorCodeTranslator;->mTask:Landroid/os/AsyncTask;

    return-object p1
.end method

.method static synthetic access$100(Lcom/miui/gallery/error/BaseErrorCodeTranslator;Landroid/content/Context;Lcom/miui/gallery/error/core/ErrorCode;)Lcom/miui/gallery/error/core/ErrorTip;
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/error/BaseErrorCodeTranslator;->translateInternal(Landroid/content/Context;Lcom/miui/gallery/error/core/ErrorCode;)Lcom/miui/gallery/error/core/ErrorTip;

    move-result-object p0

    return-object p0
.end method

.method private translateInternal(Landroid/content/Context;Lcom/miui/gallery/error/core/ErrorCode;)Lcom/miui/gallery/error/core/ErrorTip;
    .locals 5

    sget-object v0, Lcom/miui/gallery/error/BaseErrorCodeTranslator$2;->$SwitchMap$com$miui$gallery$error$core$ErrorCode:[I

    invoke-virtual {p2}, Lcom/miui/gallery/error/core/ErrorCode;->ordinal()I

    move-result p2

    aget p2, v0, p2

    packed-switch p2, :pswitch_data_0

    new-instance p1, Lcom/miui/gallery/error/ErrorUnknownTip;

    sget-object p2, Lcom/miui/gallery/error/core/ErrorCode;->UNKNOWN:Lcom/miui/gallery/error/core/ErrorCode;

    invoke-direct {p1, p2}, Lcom/miui/gallery/error/ErrorUnknownTip;-><init>(Lcom/miui/gallery/error/core/ErrorCode;)V

    return-object p1

    :pswitch_0
    new-instance p1, Lcom/miui/gallery/error/ErrorWriteExifTip;

    sget-object p2, Lcom/miui/gallery/error/core/ErrorCode;->WRITE_EXIF_ERROR:Lcom/miui/gallery/error/core/ErrorCode;

    invoke-direct {p1, p2}, Lcom/miui/gallery/error/ErrorWriteExifTip;-><init>(Lcom/miui/gallery/error/core/ErrorCode;)V

    return-object p1

    :pswitch_1
    new-instance p1, Lcom/miui/gallery/error/ErrorNotSyncedTip;

    sget-object p2, Lcom/miui/gallery/error/core/ErrorCode;->NOT_SYNCED:Lcom/miui/gallery/error/core/ErrorCode;

    invoke-direct {p1, p2}, Lcom/miui/gallery/error/ErrorNotSyncedTip;-><init>(Lcom/miui/gallery/error/core/ErrorCode;)V

    return-object p1

    :pswitch_2
    new-instance p1, Lcom/miui/gallery/error/ErrorBuildThumbnailTip;

    sget-object p2, Lcom/miui/gallery/error/core/ErrorCode;->THUMBNAIL_BUILD_ERROR:Lcom/miui/gallery/error/core/ErrorCode;

    invoke-direct {p1, p2}, Lcom/miui/gallery/error/ErrorBuildThumbnailTip;-><init>(Lcom/miui/gallery/error/core/ErrorCode;)V

    return-object p1

    :pswitch_3
    new-instance p1, Lcom/miui/gallery/error/ErrorOverQuotaTip;

    sget-object p2, Lcom/miui/gallery/error/core/ErrorCode;->OVER_QUOTA:Lcom/miui/gallery/error/core/ErrorCode;

    invoke-direct {p1, p2}, Lcom/miui/gallery/error/ErrorOverQuotaTip;-><init>(Lcom/miui/gallery/error/core/ErrorCode;)V

    return-object p1

    :pswitch_4
    new-instance p1, Lcom/miui/gallery/error/ErrorSocketTimeoutTip;

    sget-object p2, Lcom/miui/gallery/error/core/ErrorCode;->SOCKET_TIMEOUT:Lcom/miui/gallery/error/core/ErrorCode;

    invoke-direct {p1, p2}, Lcom/miui/gallery/error/ErrorSocketTimeoutTip;-><init>(Lcom/miui/gallery/error/core/ErrorCode;)V

    return-object p1

    :pswitch_5
    new-instance p1, Lcom/miui/gallery/error/ErrorConnectTimeoutTip;

    sget-object p2, Lcom/miui/gallery/error/core/ErrorCode;->CONNECT_TIMEOUT:Lcom/miui/gallery/error/core/ErrorCode;

    invoke-direct {p1, p2}, Lcom/miui/gallery/error/ErrorConnectTimeoutTip;-><init>(Lcom/miui/gallery/error/core/ErrorCode;)V

    return-object p1

    :pswitch_6
    new-instance p1, Lcom/miui/gallery/error/ErrorNoAccountTip;

    sget-object p2, Lcom/miui/gallery/error/core/ErrorCode;->NO_ACCOUNT:Lcom/miui/gallery/error/core/ErrorCode;

    invoke-direct {p1, p2}, Lcom/miui/gallery/error/ErrorNoAccountTip;-><init>(Lcom/miui/gallery/error/core/ErrorCode;)V

    return-object p1

    :pswitch_7
    new-instance p1, Lcom/miui/gallery/error/ErrorNetworkRestrictTip;

    sget-object p2, Lcom/miui/gallery/error/core/ErrorCode;->NETWORK_RESTRICT:Lcom/miui/gallery/error/core/ErrorCode;

    invoke-direct {p1, p2}, Lcom/miui/gallery/error/ErrorNetworkRestrictTip;-><init>(Lcom/miui/gallery/error/core/ErrorCode;)V

    return-object p1

    :pswitch_8
    new-instance p1, Lcom/miui/gallery/error/ErrorDecodeTip;

    sget-object p2, Lcom/miui/gallery/error/core/ErrorCode;->DECODE_ERROR:Lcom/miui/gallery/error/core/ErrorCode;

    invoke-direct {p1, p2}, Lcom/miui/gallery/error/ErrorDecodeTip;-><init>(Lcom/miui/gallery/error/core/ErrorCode;)V

    return-object p1

    :pswitch_9
    new-instance p1, Lcom/miui/gallery/error/ErrorSecondaryStorageWriteTip;

    sget-object p2, Lcom/miui/gallery/error/core/ErrorCode;->SECONDARY_STORAGE_WRITE_ERROR:Lcom/miui/gallery/error/core/ErrorCode;

    invoke-direct {p1, p2}, Lcom/miui/gallery/error/ErrorSecondaryStorageWriteTip;-><init>(Lcom/miui/gallery/error/core/ErrorCode;)V

    return-object p1

    :pswitch_a
    new-instance p1, Lcom/miui/gallery/error/ErrorPrimaryStorageWriteTip;

    sget-object p2, Lcom/miui/gallery/error/core/ErrorCode;->PRIMARY_STORAGE_WRITE_ERROR:Lcom/miui/gallery/error/core/ErrorCode;

    invoke-direct {p1, p2}, Lcom/miui/gallery/error/ErrorPrimaryStorageWriteTip;-><init>(Lcom/miui/gallery/error/core/ErrorCode;)V

    return-object p1

    :pswitch_b
    new-instance p1, Lcom/miui/gallery/error/ErrorStorageFullTip;

    sget-object p2, Lcom/miui/gallery/error/core/ErrorCode;->STORAGE_LOW:Lcom/miui/gallery/error/core/ErrorCode;

    invoke-direct {p1, p2}, Lcom/miui/gallery/error/ErrorStorageFullTip;-><init>(Lcom/miui/gallery/error/core/ErrorCode;)V

    return-object p1

    :pswitch_c
    const/4 p2, 0x0

    invoke-static {p1}, Lcom/miui/gallery/util/StorageUtils;->hasExternalSDCard(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {p1}, Lcom/miui/gallery/util/StorageUtils;->getMountedVolumePaths(Landroid/content/Context;)Ljava/util/List;

    move-result-object p1

    if-eqz p1, :cond_1

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Lcom/miui/gallery/util/StorageUtils;->getAvailableBytes(Ljava/lang/String;)J

    move-result-wide v0

    const-wide/32 v2, 0x6400000

    cmp-long v4, v0, v2

    if-lez v4, :cond_0

    const/4 p2, 0x1

    :cond_1
    if-eqz p2, :cond_2

    new-instance p1, Lcom/miui/gallery/error/ErrorChangeStorageTip;

    sget-object p2, Lcom/miui/gallery/error/core/ErrorCode;->STORAGE_FULL:Lcom/miui/gallery/error/core/ErrorCode;

    invoke-direct {p1, p2}, Lcom/miui/gallery/error/ErrorChangeStorageTip;-><init>(Lcom/miui/gallery/error/core/ErrorCode;)V

    goto :goto_0

    :cond_2
    new-instance p1, Lcom/miui/gallery/error/ErrorStorageFullTip;

    sget-object p2, Lcom/miui/gallery/error/core/ErrorCode;->STORAGE_FULL:Lcom/miui/gallery/error/core/ErrorCode;

    invoke-direct {p1, p2}, Lcom/miui/gallery/error/ErrorStorageFullTip;-><init>(Lcom/miui/gallery/error/core/ErrorCode;)V

    :goto_0
    return-object p1

    :pswitch_d
    new-instance p1, Lcom/miui/gallery/error/ErrorSyncOffTip;

    sget-object p2, Lcom/miui/gallery/error/core/ErrorCode;->SYNC_OFF:Lcom/miui/gallery/error/core/ErrorCode;

    invoke-direct {p1, p2}, Lcom/miui/gallery/error/ErrorSyncOffTip;-><init>(Lcom/miui/gallery/error/core/ErrorCode;)V

    return-object p1

    :pswitch_e
    new-instance p1, Lcom/miui/gallery/error/ErrorNoWifiTip;

    sget-object p2, Lcom/miui/gallery/error/core/ErrorCode;->NO_WIFI_CONNECTED:Lcom/miui/gallery/error/core/ErrorCode;

    invoke-direct {p1, p2}, Lcom/miui/gallery/error/ErrorNoWifiTip;-><init>(Lcom/miui/gallery/error/core/ErrorCode;)V

    return-object p1

    :pswitch_f
    new-instance p1, Lcom/miui/gallery/error/ErrorNoNetworkTip;

    sget-object p2, Lcom/miui/gallery/error/core/ErrorCode;->NO_NETWORK:Lcom/miui/gallery/error/core/ErrorCode;

    invoke-direct {p1, p2}, Lcom/miui/gallery/error/ErrorNoNetworkTip;-><init>(Lcom/miui/gallery/error/core/ErrorCode;)V

    return-object p1

    :pswitch_10
    new-instance p1, Lcom/miui/gallery/error/ErrorNoCTAPermissionTip;

    sget-object p2, Lcom/miui/gallery/error/core/ErrorCode;->NO_CTA_PERMISSION:Lcom/miui/gallery/error/core/ErrorCode;

    invoke-direct {p1, p2}, Lcom/miui/gallery/error/ErrorNoCTAPermissionTip;-><init>(Lcom/miui/gallery/error/core/ErrorCode;)V

    return-object p1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public translate(Landroid/content/Context;Lcom/miui/gallery/error/core/ErrorCode;Lcom/miui/gallery/error/core/ErrorTranslateCallback;)V
    .locals 2

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/error/BaseErrorCodeTranslator$1;

    invoke-direct {v1, p0, p1, p3, p2}, Lcom/miui/gallery/error/BaseErrorCodeTranslator$1;-><init>(Lcom/miui/gallery/error/BaseErrorCodeTranslator;Landroid/content/Context;Lcom/miui/gallery/error/core/ErrorTranslateCallback;Lcom/miui/gallery/error/core/ErrorCode;)V

    invoke-virtual {v0, v1}, Lcom/android/internal/CompatHandler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
