.class public Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;
.super Ljava/lang/Object;
.source "AppInfoHolder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/mipush/sdk/AppInfoHolder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ClientInfoData"
.end annotation


# instance fields
.field public appID:Ljava/lang/String;

.field public appRegion:Ljava/lang/String;

.field public appToken:Ljava/lang/String;

.field public deviceId:Ljava/lang/String;

.field public envType:I

.field public isPaused:Z

.field public isValid:Z

.field private mContext:Landroid/content/Context;

.field public regID:Ljava/lang/String;

.field public regResource:Ljava/lang/String;

.field public regSecret:Ljava/lang/String;

.field public versionName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->isValid:Z

    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->isPaused:Z

    iput v0, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->envType:I

    iput-object p1, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->mContext:Landroid/content/Context;

    return-void
.end method

.method private getVersionName()Ljava/lang/String;
    .locals 2

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/xiaomi/channel/commonutils/android/AppInfoUtils;->getVersionName(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static toString(Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;)Ljava/lang/String;
    .locals 3

    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "appId"

    iget-object v2, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->appID:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "appToken"

    iget-object v2, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->appToken:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "regId"

    iget-object v2, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->regID:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "regSec"

    iget-object v2, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->regSecret:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "devId"

    iget-object v2, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->deviceId:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "vName"

    iget-object v2, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->versionName:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "valid"

    iget-boolean v2, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->isValid:Z

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    const-string v1, "paused"

    iget-boolean v2, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->isPaused:Z

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    const-string v1, "envType"

    iget v2, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->envType:I

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string v1, "regResource"

    iget-object p0, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->regResource:Ljava/lang/String;

    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    invoke-static {p0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/Throwable;)V

    const/4 p0, 0x0

    return-object p0
.end method


# virtual methods
.method public clear()V
    .locals 2

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->getSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->appID:Ljava/lang/String;

    iput-object v0, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->appToken:Ljava/lang/String;

    iput-object v0, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->regID:Ljava/lang/String;

    iput-object v0, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->regSecret:Ljava/lang/String;

    iput-object v0, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->deviceId:Ljava/lang/String;

    iput-object v0, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->versionName:Ljava/lang/String;

    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->isValid:Z

    iput-boolean v1, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->isPaused:Z

    iput-object v0, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->appRegion:Ljava/lang/String;

    const/4 v0, 0x1

    iput v0, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->envType:I

    return-void
.end method

.method public invalidate()V
    .locals 3

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->isValid:Z

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->getSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "valid"

    iget-boolean v2, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->isValid:Z

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    return-void
.end method

.method public isVaild()Z
    .locals 2

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->appID:Ljava/lang/String;

    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->appToken:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->isVaild(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isVaild(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->appID:Ljava/lang/String;

    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->appToken:Ljava/lang/String;

    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->regID:Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->regSecret:Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->deviceId:Ljava/lang/String;

    iget-object p2, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->mContext:Landroid/content/Context;

    invoke-static {p2}, Lcom/xiaomi/channel/commonutils/android/DeviceInfo;->getInstanceId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->deviceId:Ljava/lang/String;

    iget-object p2, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->mContext:Landroid/content/Context;

    invoke-static {p2}, Lcom/xiaomi/channel/commonutils/android/DeviceInfo;->getSimpleDeviceId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_1

    :cond_0
    const/4 p1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public setEnvType(I)V
    .locals 0

    iput p1, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->envType:I

    return-void
.end method

.method public setHybridRegIdAndSecret(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->regID:Ljava/lang/String;

    iput-object p2, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->regSecret:Ljava/lang/String;

    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->mContext:Landroid/content/Context;

    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/android/DeviceInfo;->getInstanceId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->deviceId:Ljava/lang/String;

    invoke-direct {p0}, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->getVersionName()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->versionName:Ljava/lang/String;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->isValid:Z

    return-void
.end method

.method public setIdAndToken(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    iput-object p1, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->appID:Ljava/lang/String;

    iput-object p2, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->appToken:Ljava/lang/String;

    iput-object p3, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->regResource:Ljava/lang/String;

    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->mContext:Landroid/content/Context;

    invoke-static {p1}, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->getSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string v0, "appId"

    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->appID:Ljava/lang/String;

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    const-string v0, "appToken"

    invoke-interface {p1, v0, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    const-string p2, "regResource"

    invoke-interface {p1, p2, p3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    return-void
.end method

.method public setPaused(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->isPaused:Z

    return-void
.end method

.method public setRegIdAndSecret(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    iput-object p1, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->regID:Ljava/lang/String;

    iput-object p2, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->regSecret:Ljava/lang/String;

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/android/DeviceInfo;->getInstanceId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->deviceId:Ljava/lang/String;

    invoke-direct {p0}, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->getVersionName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->versionName:Ljava/lang/String;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->isValid:Z

    iput-object p3, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->appRegion:Ljava/lang/String;

    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->getSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "regId"

    invoke-interface {v1, v2, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    const-string p1, "regSec"

    invoke-interface {v1, p1, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    const-string p1, "devId"

    iget-object p2, p0, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->deviceId:Ljava/lang/String;

    invoke-interface {v1, p1, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    const-string p1, "vName"

    invoke-direct {p0}, Lcom/xiaomi/mipush/sdk/AppInfoHolder$ClientInfoData;->getVersionName()Ljava/lang/String;

    move-result-object p2

    invoke-interface {v1, p1, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    const-string p1, "valid"

    invoke-interface {v1, p1, v0}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    const-string p1, "appRegion"

    invoke-interface {v1, p1, p3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    return-void
.end method
