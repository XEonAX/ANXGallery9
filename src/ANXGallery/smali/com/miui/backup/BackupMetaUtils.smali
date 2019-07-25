.class Lcom/miui/backup/BackupMetaUtils;
.super Ljava/lang/Object;
.source "BackupMetaUtils.java"


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static translate(Lmiui/app/backup/BackupMeta;)Lcom/miui/backup/BackupMeta;
    .locals 3

    new-instance v0, Lcom/miui/backup/BackupMeta;

    invoke-direct {v0}, Lcom/miui/backup/BackupMeta;-><init>()V

    invoke-virtual {p0}, Lmiui/app/backup/BackupMeta;->getAppVersionCode()I

    move-result v1

    iput v1, v0, Lcom/miui/backup/BackupMeta;->appVersionCode:I

    invoke-virtual {p0}, Lmiui/app/backup/BackupMeta;->getAppVersionName()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/miui/backup/BackupMeta;->appVersionName:Ljava/lang/String;

    invoke-virtual {p0}, Lmiui/app/backup/BackupMeta;->getCreateTime()J

    move-result-wide v1

    iput-wide v1, v0, Lcom/miui/backup/BackupMeta;->createTime:J

    invoke-virtual {p0}, Lmiui/app/backup/BackupMeta;->getDeviceName()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/miui/backup/BackupMeta;->deviceName:Ljava/lang/String;

    invoke-virtual {p0}, Lmiui/app/backup/BackupMeta;->getFeature()I

    move-result v1

    iput v1, v0, Lcom/miui/backup/BackupMeta;->feature:I

    invoke-virtual {p0}, Lmiui/app/backup/BackupMeta;->getMetaVersion()I

    move-result v1

    iput v1, v0, Lcom/miui/backup/BackupMeta;->metaVersion:I

    invoke-virtual {p0}, Lmiui/app/backup/BackupMeta;->getMiuiVersion()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/miui/backup/BackupMeta;->miuiVersion:Ljava/lang/String;

    invoke-virtual {p0}, Lmiui/app/backup/BackupMeta;->getPackageName()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/miui/backup/BackupMeta;->packageName:Ljava/lang/String;

    invoke-virtual {p0}, Lmiui/app/backup/BackupMeta;->getVersion()I

    move-result p0

    iput p0, v0, Lcom/miui/backup/BackupMeta;->version:I

    return-object v0
.end method
