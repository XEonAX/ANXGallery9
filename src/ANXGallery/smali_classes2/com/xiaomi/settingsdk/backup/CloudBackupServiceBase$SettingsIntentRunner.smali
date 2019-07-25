.class Lcom/xiaomi/settingsdk/backup/CloudBackupServiceBase$SettingsIntentRunner;
.super Ljava/lang/Object;
.source "CloudBackupServiceBase.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/settingsdk/backup/CloudBackupServiceBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SettingsIntentRunner"
.end annotation


# instance fields
.field private final mIntent:Landroid/content/Intent;

.field private final mStartId:Ljava/lang/Integer;

.field final synthetic this$0:Lcom/xiaomi/settingsdk/backup/CloudBackupServiceBase;


# direct methods
.method public constructor <init>(Lcom/xiaomi/settingsdk/backup/CloudBackupServiceBase;Landroid/content/Intent;Ljava/lang/Integer;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/settingsdk/backup/CloudBackupServiceBase$SettingsIntentRunner;->this$0:Lcom/xiaomi/settingsdk/backup/CloudBackupServiceBase;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/xiaomi/settingsdk/backup/CloudBackupServiceBase$SettingsIntentRunner;->mIntent:Landroid/content/Intent;

    iput-object p3, p0, Lcom/xiaomi/settingsdk/backup/CloudBackupServiceBase$SettingsIntentRunner;->mStartId:Ljava/lang/Integer;

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Lcom/xiaomi/settingsdk/backup/CloudBackupServiceBase$SettingsIntentRunner;->this$0:Lcom/xiaomi/settingsdk/backup/CloudBackupServiceBase;

    iget-object v1, p0, Lcom/xiaomi/settingsdk/backup/CloudBackupServiceBase$SettingsIntentRunner;->mIntent:Landroid/content/Intent;

    iget-object v2, p0, Lcom/xiaomi/settingsdk/backup/CloudBackupServiceBase$SettingsIntentRunner;->mStartId:Ljava/lang/Integer;

    invoke-static {v0, v1, v2}, Lcom/xiaomi/settingsdk/backup/CloudBackupServiceBase;->access$000(Lcom/xiaomi/settingsdk/backup/CloudBackupServiceBase;Landroid/content/Intent;Ljava/lang/Integer;)V

    return-void
.end method
