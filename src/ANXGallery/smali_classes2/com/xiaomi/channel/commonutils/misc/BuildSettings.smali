.class public Lcom/xiaomi/channel/commonutils/misc/BuildSettings;
.super Ljava/lang/Object;
.source "BuildSettings.java"


# static fields
.field public static final IsBetaBuild:Z

.field public static final IsDebugBuild:Z

.field public static final IsDefaultChannel:Z

.field public static final IsForYYBuild:Z

.field public static final IsLogableBuild:Z

.field public static final IsRCBuild:Z

.field public static IsTestBuild:Z

.field public static final ReleaseChannel:Ljava/lang/String;

.field private static envType:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    sget-boolean v0, Lcom/xiaomi/channel/commonutils/misc/DebugSwitch;->sDebugServerHost:Z

    if-eqz v0, :cond_0

    const-string v0, "ONEBOX"

    goto :goto_0

    :cond_0
    const-string v0, "@SHIP.TO.2A2FE0D7@"

    :goto_0
    sput-object v0, Lcom/xiaomi/channel/commonutils/misc/BuildSettings;->ReleaseChannel:Ljava/lang/String;

    sget-object v0, Lcom/xiaomi/channel/commonutils/misc/BuildSettings;->ReleaseChannel:Ljava/lang/String;

    const-string v1, "2A2FE0D7"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    sput-boolean v0, Lcom/xiaomi/channel/commonutils/misc/BuildSettings;->IsDefaultChannel:Z

    sget-boolean v0, Lcom/xiaomi/channel/commonutils/misc/BuildSettings;->IsDefaultChannel:Z

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_2

    const-string v0, "DEBUG"

    sget-object v3, Lcom/xiaomi/channel/commonutils/misc/BuildSettings;->ReleaseChannel:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_1

    :cond_1
    const/4 v0, 0x0

    goto :goto_2

    :cond_2
    :goto_1
    const/4 v0, 0x1

    :goto_2
    sput-boolean v0, Lcom/xiaomi/channel/commonutils/misc/BuildSettings;->IsDebugBuild:Z

    const-string v0, "LOGABLE"

    sget-object v3, Lcom/xiaomi/channel/commonutils/misc/BuildSettings;->ReleaseChannel:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    sput-boolean v0, Lcom/xiaomi/channel/commonutils/misc/BuildSettings;->IsLogableBuild:Z

    sget-object v0, Lcom/xiaomi/channel/commonutils/misc/BuildSettings;->ReleaseChannel:Ljava/lang/String;

    const-string v3, "YY"

    invoke-virtual {v0, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    sput-boolean v0, Lcom/xiaomi/channel/commonutils/misc/BuildSettings;->IsForYYBuild:Z

    sget-object v0, Lcom/xiaomi/channel/commonutils/misc/BuildSettings;->ReleaseChannel:Ljava/lang/String;

    const-string v3, "TEST"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    sput-boolean v0, Lcom/xiaomi/channel/commonutils/misc/BuildSettings;->IsTestBuild:Z

    const-string v0, "BETA"

    sget-object v3, Lcom/xiaomi/channel/commonutils/misc/BuildSettings;->ReleaseChannel:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    sput-boolean v0, Lcom/xiaomi/channel/commonutils/misc/BuildSettings;->IsBetaBuild:Z

    sget-object v0, Lcom/xiaomi/channel/commonutils/misc/BuildSettings;->ReleaseChannel:Ljava/lang/String;

    if-eqz v0, :cond_3

    sget-object v0, Lcom/xiaomi/channel/commonutils/misc/BuildSettings;->ReleaseChannel:Ljava/lang/String;

    const-string v3, "RC"

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    const/4 v1, 0x1

    :cond_3
    sput-boolean v1, Lcom/xiaomi/channel/commonutils/misc/BuildSettings;->IsRCBuild:Z

    sput v2, Lcom/xiaomi/channel/commonutils/misc/BuildSettings;->envType:I

    sget-object v0, Lcom/xiaomi/channel/commonutils/misc/BuildSettings;->ReleaseChannel:Ljava/lang/String;

    const-string v1, "SANDBOX"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    const/4 v0, 0x2

    sput v0, Lcom/xiaomi/channel/commonutils/misc/BuildSettings;->envType:I

    goto :goto_3

    :cond_4
    sget-object v0, Lcom/xiaomi/channel/commonutils/misc/BuildSettings;->ReleaseChannel:Ljava/lang/String;

    const-string v1, "ONEBOX"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    const/4 v0, 0x3

    sput v0, Lcom/xiaomi/channel/commonutils/misc/BuildSettings;->envType:I

    goto :goto_3

    :cond_5
    sput v2, Lcom/xiaomi/channel/commonutils/misc/BuildSettings;->envType:I

    :goto_3
    return-void
.end method

.method public static IsOneBoxBuild()Z
    .locals 2

    sget v0, Lcom/xiaomi/channel/commonutils/misc/BuildSettings;->envType:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static IsSandBoxBuild()Z
    .locals 2

    sget v0, Lcom/xiaomi/channel/commonutils/misc/BuildSettings;->envType:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static getEnvType()I
    .locals 1

    sget v0, Lcom/xiaomi/channel/commonutils/misc/BuildSettings;->envType:I

    return v0
.end method

.method public static setEnvType(I)V
    .locals 0

    sput p0, Lcom/xiaomi/channel/commonutils/misc/BuildSettings;->envType:I

    return-void
.end method
