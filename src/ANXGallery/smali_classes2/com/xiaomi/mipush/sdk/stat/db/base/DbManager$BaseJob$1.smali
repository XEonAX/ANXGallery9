.class Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob$1;
.super Ljava/lang/Object;
.source "DbManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;

.field final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;Landroid/content/Context;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob$1;->this$0:Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;

    iput-object p2, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob$1;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    const/4 v0, 0x0

    :try_start_0
    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob$1;->this$0:Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;

    invoke-virtual {v1}, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_0

    :try_start_1
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->isOpen()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob$1;->this$0:Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;

    iget-object v2, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob$1;->val$context:Landroid/content/Context;

    invoke-virtual {v0, v2, v1}, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;->doRun(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;)V

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    :catch_0
    move-exception v0

    goto :goto_2

    :cond_0
    :goto_0
    if-eqz v1, :cond_1

    :try_start_2
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto :goto_1

    :catch_1
    move-exception v0

    goto :goto_4

    :cond_1
    :goto_1
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob$1;->this$0:Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;

    iget-object v0, v0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;->mDbHelper:Lcom/xiaomi/mipush/sdk/stat/db/base/BaseDbHelper;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob$1;->this$0:Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;

    iget-object v0, v0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;->mDbHelper:Lcom/xiaomi/mipush/sdk/stat/db/base/BaseDbHelper;

    invoke-virtual {v0}, Lcom/xiaomi/mipush/sdk/stat/db/base/BaseDbHelper;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_5

    :catchall_0
    move-exception v1

    move-object v3, v1

    move-object v1, v0

    move-object v0, v3

    goto :goto_6

    :catch_2
    move-exception v1

    move-object v3, v1

    move-object v1, v0

    move-object v0, v3

    :goto_2
    :try_start_3
    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    if-eqz v1, :cond_2

    :try_start_4
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto :goto_3

    :catch_3
    move-exception v0

    goto :goto_4

    :cond_2
    :goto_3
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob$1;->this$0:Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;

    iget-object v0, v0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;->mDbHelper:Lcom/xiaomi/mipush/sdk/stat/db/base/BaseDbHelper;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob$1;->this$0:Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;

    iget-object v0, v0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;->mDbHelper:Lcom/xiaomi/mipush/sdk/stat/db/base/BaseDbHelper;

    invoke-virtual {v0}, Lcom/xiaomi/mipush/sdk/stat/db/base/BaseDbHelper;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    goto :goto_5

    :goto_4
    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/Throwable;)V

    :cond_3
    :goto_5
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob$1;->this$0:Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;

    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob$1;->val$context:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;->finish(Landroid/content/Context;)V

    return-void

    :catchall_1
    move-exception v0

    :goto_6
    if-eqz v1, :cond_4

    :try_start_5
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto :goto_7

    :catch_4
    move-exception v1

    goto :goto_8

    :cond_4
    :goto_7
    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob$1;->this$0:Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;

    iget-object v1, v1, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;->mDbHelper:Lcom/xiaomi/mipush/sdk/stat/db/base/BaseDbHelper;

    if-eqz v1, :cond_5

    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob$1;->this$0:Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;

    iget-object v1, v1, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;->mDbHelper:Lcom/xiaomi/mipush/sdk/stat/db/base/BaseDbHelper;

    invoke-virtual {v1}, Lcom/xiaomi/mipush/sdk/stat/db/base/BaseDbHelper;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_4

    goto :goto_9

    :goto_8
    invoke-static {v1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/Throwable;)V

    :cond_5
    :goto_9
    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob$1;->this$0:Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;

    iget-object v2, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob$1;->val$context:Landroid/content/Context;

    invoke-virtual {v1, v2}, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;->finish(Landroid/content/Context;)V

    throw v0
.end method
