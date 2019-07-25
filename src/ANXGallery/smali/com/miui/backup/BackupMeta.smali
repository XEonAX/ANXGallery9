.class public Lcom/miui/backup/BackupMeta;
.super Ljava/lang/Object;
.source "BackupMeta.java"


# static fields
.field public static final META_VERSION:I = 0x1


# instance fields
.field public appVersionCode:I

.field public appVersionName:Ljava/lang/String;

.field public createTime:J

.field public deviceName:Ljava/lang/String;

.field public feature:I

.field public metaVersion:I

.field public miuiVersion:Ljava/lang/String;

.field public packageName:Ljava/lang/String;

.field public version:I


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput v0, p0, Lcom/miui/backup/BackupMeta;->metaVersion:I

    return-void
.end method


# virtual methods
.method public getAppVersionCode()I
    .locals 1

    iget v0, p0, Lcom/miui/backup/BackupMeta;->appVersionCode:I

    return v0
.end method

.method public getAppVersionName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/backup/BackupMeta;->appVersionName:Ljava/lang/String;

    return-object v0
.end method

.method public getCreateTime()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/backup/BackupMeta;->createTime:J

    return-wide v0
.end method

.method public getDeviceName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/backup/BackupMeta;->deviceName:Ljava/lang/String;

    return-object v0
.end method

.method public getFeature()I
    .locals 1

    iget v0, p0, Lcom/miui/backup/BackupMeta;->feature:I

    return v0
.end method

.method public getMetaVersion()I
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public getMiuiVersion()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/backup/BackupMeta;->miuiVersion:Ljava/lang/String;

    return-object v0
.end method

.method public getPackageName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/backup/BackupMeta;->packageName:Ljava/lang/String;

    return-object v0
.end method

.method public getVersion()I
    .locals 1

    iget v0, p0, Lcom/miui/backup/BackupMeta;->version:I

    return v0
.end method
