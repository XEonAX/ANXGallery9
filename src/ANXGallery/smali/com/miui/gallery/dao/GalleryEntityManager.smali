.class public Lcom/miui/gallery/dao/GalleryEntityManager;
.super Lcom/miui/gallery/dao/base/EntityManager;
.source "GalleryEntityManager.java"


# static fields
.field private static instance:Lcom/miui/gallery/dao/GalleryEntityManager;


# direct methods
.method private constructor <init>()V
    .locals 3

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "gallery_sub.db"

    const/16 v2, 0xc

    invoke-direct {p0, v0, v1, v2}, Lcom/miui/gallery/dao/base/EntityManager;-><init>(Landroid/content/Context;Ljava/lang/String;I)V

    return-void
.end method

.method public static declared-synchronized getInstance()Lcom/miui/gallery/dao/GalleryEntityManager;
    .locals 2

    const-class v0, Lcom/miui/gallery/dao/GalleryEntityManager;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/miui/gallery/dao/GalleryEntityManager;->instance:Lcom/miui/gallery/dao/GalleryEntityManager;

    if-nez v1, :cond_0

    new-instance v1, Lcom/miui/gallery/dao/GalleryEntityManager;

    invoke-direct {v1}, Lcom/miui/gallery/dao/GalleryEntityManager;-><init>()V

    sput-object v1, Lcom/miui/gallery/dao/GalleryEntityManager;->instance:Lcom/miui/gallery/dao/GalleryEntityManager;

    :cond_0
    sget-object v1, Lcom/miui/gallery/dao/GalleryEntityManager;->instance:Lcom/miui/gallery/dao/GalleryEntityManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method


# virtual methods
.method protected onDatabaseDowngrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 1

    const-string p1, "GalleryEntityManager"

    const-string v0, "onDatabaseDowngrade from %s to %s"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-static {p1, v0, p2, p3}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method protected onDatabaseUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 4

    const-string v0, "GalleryEntityManager"

    const-string v1, "onDatabaseUpgrade: from %d to %d"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v0, v1, v2, v3}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    const/4 v0, 0x7

    if-ne p2, v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, " UPDATE "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-class v1, Lcom/miui/gallery/card/Card;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " SET "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "localFlag"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "updateTime"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " = "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "createTime"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ", "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "createdBy"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " = "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_0
    const/16 v0, 0xc

    if-ne p3, v0, :cond_1

    packed-switch p2, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    const-string p2, "GalleryEntityManager"

    const-string p3, "drop table %s & %s"

    const-class v0, Lcom/miui/gallery/util/face/PeopleItem;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    const-class v1, Lcom/miui/gallery/model/Album;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-static {p2, p3, v0, v1}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    const-class p2, Lcom/miui/gallery/util/face/PeopleItem;

    invoke-virtual {p2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lcom/miui/gallery/dao/GalleryEntityManager;->getDropTableSql(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-class p2, Lcom/miui/gallery/model/Album;

    invoke-virtual {p2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lcom/miui/gallery/dao/GalleryEntityManager;->getDropTableSql(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    goto :goto_0

    :pswitch_1
    const-string p2, "GalleryEntityManager"

    const-string p3, "drop table %s"

    const-class v0, Lcom/miui/gallery/model/Album;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, p3, v0}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    const-class p2, Lcom/miui/gallery/model/Album;

    invoke-virtual {p2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lcom/miui/gallery/dao/GalleryEntityManager;->getDropTableSql(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_1
    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0xa
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected onInitTableList()V
    .locals 1

    const-class v0, Lcom/miui/gallery/card/Card;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/dao/GalleryEntityManager;->addTable(Ljava/lang/Class;)V

    const-class v0, Lcom/miui/gallery/pendingtask/base/PendingTaskInfo;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/dao/GalleryEntityManager;->addTable(Ljava/lang/Class;)V

    const-class v0, Lcom/miui/gallery/model/PersistentResponse;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/dao/GalleryEntityManager;->addTable(Ljava/lang/Class;)V

    const-class v0, Lcom/miui/gallery/provider/cloudmanager/MediaRemarkInfo;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/dao/GalleryEntityManager;->addTable(Ljava/lang/Class;)V

    const-class v0, Lcom/miui/gallery/provider/peoplecover/PeopleCover;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/dao/GalleryEntityManager;->addTable(Ljava/lang/Class;)V

    const-class v0, Lcom/miui/gallery/util/deleterecorder/DeleteRecord;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/dao/GalleryEntityManager;->addTable(Ljava/lang/Class;)V

    const-class v0, Lcom/miui/gallery/card/scenario/Record;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/dao/GalleryEntityManager;->addTable(Ljava/lang/Class;)V

    const-class v0, Lcom/miui/gallery/assistant/model/ImageFeature;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/dao/GalleryEntityManager;->addTable(Ljava/lang/Class;)V

    const-class v0, Lcom/miui/gallery/assistant/library/Library;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/dao/GalleryEntityManager;->addTable(Ljava/lang/Class;)V

    const-class v0, Lcom/miui/gallery/card/SyncTag;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/dao/GalleryEntityManager;->addTable(Ljava/lang/Class;)V

    return-void
.end method
