.class public Lcom/xiaomi/mipush/sdk/AppInfoHolder;
.super Ljava/lang/Object;
.source "AppInfoHolder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;
    }
.end annotation


# static fields
.field private static volatile sInstance:Lcom/xiaomi/mipush/sdk/AppInfoHolder;


# instance fields
.field appRegRequestId:Ljava/lang/String;

.field private mContext:Landroid/content/Context;

.field private mHybridAppInfoCache:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;",
            ">;"
        }
    .end annotation
.end field

.field private mInfoData:Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->mContext:Landroid/content/Context;

    invoke-direct {p0}, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->init()V

    return-void
.end method

.method public static getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/AppInfoHolder;
    .locals 2

    sget-object v0, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->sInstance:Lcom/xiaomi/mipush/sdk/AppInfoHolder;

    if-nez v0, :cond_1

    const-class v0, Lcom/xiaomi/mipush/sdk/AppInfoHolder;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->sInstance:Lcom/xiaomi/mipush/sdk/AppInfoHolder;

    if-nez v1, :cond_0

    new-instance v1, Lcom/xiaomi/mipush/sdk/AppInfoHolder;

    invoke-direct {v1, p0}, Lcom/xiaomi/mipush/sdk/AppInfoHolder;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->sInstance:Lcom/xiaomi/mipush/sdk/AppInfoHolder;

    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :cond_1
    :goto_0
    sget-object p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->sInstance:Lcom/xiaomi/mipush/sdk/AppInfoHolder;

    return-object p0
.end method

.method public static getSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .locals 2

    const-string v0, "mipush"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    return-object p0
.end method

.method private init()V
    .locals 6

    new-instance v0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;

    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->mInfoData:Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->mHybridAppInfoCache:Ljava/util/Map;

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->getSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->mInfoData:Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;

    const-string v2, "appId"

    const/4 v3, 0x0

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->appID:Ljava/lang/String;

    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->mInfoData:Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;

    const-string v2, "appToken"

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->appToken:Ljava/lang/String;

    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->mInfoData:Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;

    const-string v2, "regId"

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->regID:Ljava/lang/String;

    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->mInfoData:Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;

    const-string v2, "regSec"

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->regSecret:Ljava/lang/String;

    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->mInfoData:Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;

    const-string v2, "devId"

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->deviceId:Ljava/lang/String;

    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->mInfoData:Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;

    iget-object v1, v1, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->deviceId:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->mInfoData:Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;

    iget-object v1, v1, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->deviceId:Ljava/lang/String;

    const-string v2, "a-"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->mInfoData:Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;

    iget-object v2, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->mContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/xiaomi/channel/commonutils/android/DeviceInfo;->getInstanceId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->deviceId:Ljava/lang/String;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "devId"

    iget-object v4, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->mInfoData:Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;

    iget-object v4, v4, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->deviceId:Ljava/lang/String;

    invoke-interface {v1, v2, v4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    :cond_0
    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->mInfoData:Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;

    const-string v2, "vName"

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->versionName:Ljava/lang/String;

    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->mInfoData:Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;

    const-string v2, "valid"

    const/4 v4, 0x1

    invoke-interface {v0, v2, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    iput-boolean v2, v1, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->isValid:Z

    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->mInfoData:Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;

    const-string v2, "paused"

    const/4 v5, 0x0

    invoke-interface {v0, v2, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    iput-boolean v2, v1, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->isPaused:Z

    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->mInfoData:Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;

    const-string v2, "envType"

    invoke-interface {v0, v2, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    iput v2, v1, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->envType:I

    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->mInfoData:Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;

    const-string v2, "regResource"

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->regResource:Ljava/lang/String;

    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->mInfoData:Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;

    const-string v2, "appRegion"

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v1, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->appRegion:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public appRegistered()Z
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->mInfoData:Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;

    invoke-virtual {v0}, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->isVaild()Z

    move-result v0

    return v0
.end method

.method public appRegistered(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->mInfoData:Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;

    invoke-virtual {v0, p1, p2}, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->isVaild(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public checkAppInfo()Z
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->mInfoData:Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;

    invoke-virtual {v0}, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->isVaild()Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "Don\'t send message before initialization succeeded!"

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    const/4 v0, 0x0

    return v0

    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method public checkVersionNameChanged()Z
    .locals 2

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/xiaomi/channel/commonutils/android/AppInfoUtils;->getVersionName(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->mInfoData:Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;

    iget-object v1, v1, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->versionName:Ljava/lang/String;

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public clear()V
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->mInfoData:Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;

    invoke-virtual {v0}, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->clear()V

    return-void
.end method

.method public getAppID()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->mInfoData:Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;

    iget-object v0, v0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->appID:Ljava/lang/String;

    return-object v0
.end method

.method public getAppToken()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->mInfoData:Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;

    iget-object v0, v0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->appToken:Ljava/lang/String;

    return-object v0
.end method

.method public getEnvType()I
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->mInfoData:Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;

    iget v0, v0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->envType:I

    return v0
.end method

.method public getRegID()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->mInfoData:Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;

    iget-object v0, v0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->regID:Ljava/lang/String;

    return-object v0
.end method

.method public getRegResource()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->mInfoData:Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;

    iget-object v0, v0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->regResource:Ljava/lang/String;

    return-object v0
.end method

.method public getRegSecret()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->mInfoData:Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;

    iget-object v0, v0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->regSecret:Ljava/lang/String;

    return-object v0
.end method

.method public invalidate()V
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->mInfoData:Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;

    invoke-virtual {v0}, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->invalidate()V

    return-void
.end method

.method public invalidated()Z
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->mInfoData:Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;

    iget-boolean v0, v0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->isValid:Z

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public isPaused()Z
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->mInfoData:Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;

    iget-boolean v0, v0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->isPaused:Z

    return v0
.end method

.method public putAppIDAndToken(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->mInfoData:Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;

    invoke-virtual {v0, p1, p2, p3}, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->setIdAndToken(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public putRegIDAndSecret(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->mInfoData:Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;

    invoke-virtual {v0, p1, p2, p3}, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->setRegIdAndSecret(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public saveHybridAppInfo(Ljava/lang/String;Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;)V
    .locals 2

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->mHybridAppInfoCache:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p2}, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->toString(Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;)Ljava/lang/String;

    move-result-object p2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "hybrid_app_info_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->getSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    return-void
.end method

.method public setEnvType(I)V
    .locals 2

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->mInfoData:Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;

    invoke-virtual {v0, p1}, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->setEnvType(I)V

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->getSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "envType"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    return-void
.end method

.method public setPaused(Z)V
    .locals 2

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->mInfoData:Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;

    invoke-virtual {v0, p1}, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->setPaused(Z)V

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->getSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "paused"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    return-void
.end method

.method public updateVersionName(Ljava/lang/String;)V
    .locals 2

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->getSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "vName"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->mInfoData:Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;

    iput-object p1, v0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->versionName:Ljava/lang/String;

    return-void
.end method
