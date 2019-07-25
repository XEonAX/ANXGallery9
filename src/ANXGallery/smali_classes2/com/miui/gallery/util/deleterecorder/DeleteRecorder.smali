.class public Lcom/miui/gallery/util/deleterecorder/DeleteRecorder;
.super Ljava/lang/Object;
.source "DeleteRecorder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/util/deleterecorder/DeleteRecorder$RecordCallback;
    }
.end annotation


# direct methods
.method public static clearAllRecords()Z
    .locals 3

    :try_start_0
    invoke-static {}, Lcom/miui/gallery/dao/GalleryEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryEntityManager;

    move-result-object v0

    const-class v1, Lcom/miui/gallery/util/deleterecorder/DeleteRecord;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/dao/GalleryEntityManager;->deleteAll(Ljava/lang/Class;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v0, 0x1

    return v0

    :catch_0
    move-exception v0

    const-string v1, "DeleteRecorder"

    const-string v2, "clearAllRecords occur error %s."

    invoke-static {v1, v2, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    const/4 v0, 0x0

    return v0
.end method

.method public static clearExpiredRecords()Z
    .locals 4

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const-wide v2, 0x9a7ec800L

    sub-long/2addr v0, v2

    const/16 v2, 0x2710

    invoke-static {v2, v0, v1}, Lcom/miui/gallery/util/deleterecorder/DeleteRecorder;->clearExpiredRecords(IJ)Z

    move-result v0

    return v0
.end method

.method public static clearExpiredRecords(IJ)Z
    .locals 5

    invoke-static {}, Lcom/miui/gallery/util/deleterecorder/DeleteRecorder;->queryRecordCount()I

    move-result v0

    const/4 v1, 0x0

    if-gt v0, p0, :cond_0

    const-string p0, "DeleteRecorder"

    const-string p1, "Record count doesn\'t exceed max"

    invoke-static {p0, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :cond_0
    invoke-static {}, Lcom/miui/gallery/dao/GalleryEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryEntityManager;

    move-result-object p0

    const-class v0, Lcom/miui/gallery/util/deleterecorder/DeleteRecord;

    const-string v2, "timestamp<=?"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v1

    invoke-virtual {p0, v0, v2, v3}, Lcom/miui/gallery/dao/GalleryEntityManager;->delete(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_1

    const-string v0, "DeleteRecorder"

    const-string v1, "Failed to delete records before %s"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    :cond_1
    const-string v0, "DeleteRecorder"

    const-string v1, "Done delete records before %s"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :goto_0
    return p0
.end method

.method private static getHashAccount()Ljava/lang/String;
    .locals 2

    invoke-static {}, Lcom/miui/gallery/cloud/AccountCache;->getAccount()Landroid/accounts/Account;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, v0, Landroid/accounts/Account;->name:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v0, v0, Landroid/accounts/Account;->name:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public static onAddAccount()V
    .locals 1

    invoke-static {}, Lcom/miui/gallery/util/deleterecorder/DeleteRecorder;->getHashAccount()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/deleterecorder/DeleteRecorder;->onAddAccount(Ljava/lang/String;)V

    return-void
.end method

.method static onAddAccount(Ljava/lang/String;)V
    .locals 5

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p0, "DeleteRecorder"

    const-string v0, "New account is null, skip clean process"

    invoke-static {p0, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    const/4 v0, 0x0

    const-string v1, "reason=?"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/16 v3, 0x5b

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Lcom/miui/gallery/util/deleterecorder/DeleteRecorder;->queryRecords(Ljava/lang/String;[Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    invoke-static {v1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/util/deleterecorder/DeleteRecord;

    invoke-virtual {v0}, Lcom/miui/gallery/util/deleterecorder/DeleteRecord;->getFilePath()Ljava/lang/String;

    move-result-object v0

    :cond_1
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2

    const-string p0, "DeleteRecorder"

    const-string v0, "Old account is null, skip clean process"

    invoke-static {p0, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_2
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_3

    const-string p0, "DeleteRecorder"

    const-string v0, "New account is same as old account, skip clean process"

    invoke-static {p0, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_3
    invoke-static {}, Lcom/miui/gallery/util/deleterecorder/DeleteRecorder;->clearAllRecords()Z

    move-result p0

    if-nez p0, :cond_4

    const-string p0, "DeleteRecorder"

    const-string v0, "Fail to clear records after logged in with a different account"

    invoke-static {p0, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_4
    const-string p0, "DeleteRecorder"

    const-string v0, "Done clearing records after logged in with a different account"

    invoke-static {p0, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method public static onDeleteAccount()V
    .locals 1

    invoke-static {}, Lcom/miui/gallery/util/deleterecorder/DeleteRecorder;->getHashAccount()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/deleterecorder/DeleteRecorder;->onDeleteAccount(Ljava/lang/String;)V

    return-void
.end method

.method static onDeleteAccount(Ljava/lang/String;)V
    .locals 3

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/util/deleterecorder/DeleteRecord;

    const/16 v1, 0x5b

    const-string v2, "DeleteRecorder"

    invoke-direct {v0, v1, p0, v2}, Lcom/miui/gallery/util/deleterecorder/DeleteRecord;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    invoke-static {v0}, Lcom/miui/gallery/util/deleterecorder/DeleteRecorder;->record(Lcom/miui/gallery/util/deleterecorder/DeleteRecord;)V

    const-string v0, "DeleteRecorder"

    const-string v1, "On record delete account operation, %s"

    invoke-static {v0, v1, p0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method private static queryRecordCount()I
    .locals 12

    const/4 v0, 0x0

    const/4 v1, 0x0

    :try_start_0
    invoke-static {}, Lcom/miui/gallery/dao/GalleryEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryEntityManager;

    move-result-object v2

    const-class v3, Lcom/miui/gallery/util/deleterecorder/DeleteRecord;

    const-string v4, "count(*)"

    filled-new-array {v4}, [Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-virtual/range {v2 .. v10}, Lcom/miui/gallery/dao/GalleryEntityManager;->rawQuery(Ljava/lang/Class;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz v2, :cond_0

    :try_start_1
    invoke-interface {v2}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v2, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move v0, v1

    goto :goto_0

    :catchall_0
    move-exception v0

    move-object v1, v2

    goto :goto_2

    :catch_0
    move-exception v1

    move-object v11, v2

    move-object v2, v1

    move-object v1, v11

    goto :goto_1

    :cond_0
    :goto_0
    invoke-static {v2}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    return v0

    :catchall_1
    move-exception v0

    goto :goto_2

    :catch_1
    move-exception v2

    :goto_1
    :try_start_2
    const-string v3, "DeleteRecorder"

    invoke-static {v3, v2}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    invoke-static {v1}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    return v0

    :goto_2
    invoke-static {v1}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    throw v0
.end method

.method public static queryRecords(Ljava/lang/String;[Ljava/lang/String;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/miui/gallery/util/deleterecorder/DeleteRecord;",
            ">;"
        }
    .end annotation

    invoke-static {}, Lcom/miui/gallery/dao/GalleryEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryEntityManager;

    move-result-object v0

    const-class v1, Lcom/miui/gallery/util/deleterecorder/DeleteRecord;

    invoke-virtual {v0, v1, p0, p1}, Lcom/miui/gallery/dao/GalleryEntityManager;->query(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/String;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static record(Lcom/miui/gallery/util/deleterecorder/DeleteRecord;)V
    .locals 1

    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/miui/gallery/util/deleterecorder/DeleteRecorder;->record(Lcom/miui/gallery/util/deleterecorder/DeleteRecord;Lcom/miui/gallery/util/deleterecorder/DeleteRecorder$RecordCallback;)V

    return-void
.end method

.method public static record(Lcom/miui/gallery/util/deleterecorder/DeleteRecord;Lcom/miui/gallery/util/deleterecorder/DeleteRecorder$RecordCallback;)V
    .locals 2

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getWorkHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/util/deleterecorder/DeleteRecorder$1;

    invoke-direct {v1, p0, p1}, Lcom/miui/gallery/util/deleterecorder/DeleteRecorder$1;-><init>(Lcom/miui/gallery/util/deleterecorder/DeleteRecord;Lcom/miui/gallery/util/deleterecorder/DeleteRecorder$RecordCallback;)V

    invoke-virtual {v0, v1}, Lcom/android/internal/CompatHandler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public static record(Ljava/util/Collection;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Lcom/miui/gallery/util/deleterecorder/DeleteRecord;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/miui/gallery/util/deleterecorder/DeleteRecorder;->record(Ljava/util/Collection;Lcom/miui/gallery/util/deleterecorder/DeleteRecorder$RecordCallback;)V

    return-void
.end method

.method public static record(Ljava/util/Collection;Lcom/miui/gallery/util/deleterecorder/DeleteRecorder$RecordCallback;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Lcom/miui/gallery/util/deleterecorder/DeleteRecord;",
            ">;",
            "Lcom/miui/gallery/util/deleterecorder/DeleteRecorder$RecordCallback;",
            ")V"
        }
    .end annotation

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getWorkHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/util/deleterecorder/DeleteRecorder$2;

    invoke-direct {v1, p0, p1}, Lcom/miui/gallery/util/deleterecorder/DeleteRecorder$2;-><init>(Ljava/util/Collection;Lcom/miui/gallery/util/deleterecorder/DeleteRecorder$RecordCallback;)V

    invoke-virtual {v0, v1}, Lcom/android/internal/CompatHandler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
