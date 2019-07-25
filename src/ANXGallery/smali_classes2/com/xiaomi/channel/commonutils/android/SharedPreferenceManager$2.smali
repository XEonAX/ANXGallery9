.class Lcom/xiaomi/channel/commonutils/android/SharedPreferenceManager$2;
.super Ljava/lang/Object;
.source "SharedPreferenceManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xiaomi/channel/commonutils/android/SharedPreferenceManager;->setStringnValue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/xiaomi/channel/commonutils/android/SharedPreferenceManager;

.field final synthetic val$file:Ljava/lang/String;

.field final synthetic val$key:Ljava/lang/String;

.field final synthetic val$value:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/xiaomi/channel/commonutils/android/SharedPreferenceManager;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/channel/commonutils/android/SharedPreferenceManager$2;->this$0:Lcom/xiaomi/channel/commonutils/android/SharedPreferenceManager;

    iput-object p2, p0, Lcom/xiaomi/channel/commonutils/android/SharedPreferenceManager$2;->val$file:Ljava/lang/String;

    iput-object p3, p0, Lcom/xiaomi/channel/commonutils/android/SharedPreferenceManager$2;->val$key:Ljava/lang/String;

    iput-object p4, p0, Lcom/xiaomi/channel/commonutils/android/SharedPreferenceManager$2;->val$value:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Lcom/xiaomi/channel/commonutils/android/SharedPreferenceManager$2;->this$0:Lcom/xiaomi/channel/commonutils/android/SharedPreferenceManager;

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/android/SharedPreferenceManager;->access$000(Lcom/xiaomi/channel/commonutils/android/SharedPreferenceManager;)Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/xiaomi/channel/commonutils/android/SharedPreferenceManager$2;->val$file:Ljava/lang/String;

    const/4 v2, 0x4

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget-object v1, p0, Lcom/xiaomi/channel/commonutils/android/SharedPreferenceManager$2;->val$key:Ljava/lang/String;

    iget-object v2, p0, Lcom/xiaomi/channel/commonutils/android/SharedPreferenceManager$2;->val$value:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    return-void
.end method
