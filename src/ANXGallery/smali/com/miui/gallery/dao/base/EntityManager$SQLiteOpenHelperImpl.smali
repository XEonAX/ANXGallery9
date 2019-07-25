.class Lcom/miui/gallery/dao/base/EntityManager$SQLiteOpenHelperImpl;
.super Landroid/database/sqlite/SQLiteOpenHelper;
.source "EntityManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/dao/base/EntityManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SQLiteOpenHelperImpl"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/dao/base/EntityManager;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/dao/base/EntityManager;Landroid/content/Context;Ljava/lang/String;I)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/dao/base/EntityManager$SQLiteOpenHelperImpl;->this$0:Lcom/miui/gallery/dao/base/EntityManager;

    const/4 p1, 0x0

    invoke-direct {p0, p2, p3, p1, p4}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/dao/base/EntityManager$SQLiteOpenHelperImpl;->this$0:Lcom/miui/gallery/dao/base/EntityManager;

    invoke-static {v0}, Lcom/miui/gallery/dao/base/EntityManager;->access$000(Lcom/miui/gallery/dao/base/EntityManager;)V

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/dao/base/EntityManager$SQLiteOpenHelperImpl;->this$0:Lcom/miui/gallery/dao/base/EntityManager;

    invoke-static {v0}, Lcom/miui/gallery/dao/base/EntityManager;->access$100(Lcom/miui/gallery/dao/base/EntityManager;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Class;

    invoke-static {p1, v1}, Lcom/miui/gallery/dao/base/EntityManager;->createTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/Class;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v0, "EntityManager"

    const-string v1, "Db onCreate error.\n"

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method public onDowngrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/dao/base/EntityManager$SQLiteOpenHelperImpl;->this$0:Lcom/miui/gallery/dao/base/EntityManager;

    invoke-virtual {v0, p1, p2, p3}, Lcom/miui/gallery/dao/base/EntityManager;->onDatabaseDowngrade(Landroid/database/sqlite/SQLiteDatabase;II)V

    return-void
.end method

.method public onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/dao/base/EntityManager$SQLiteOpenHelperImpl;->this$0:Lcom/miui/gallery/dao/base/EntityManager;

    invoke-static {v0}, Lcom/miui/gallery/dao/base/EntityManager;->access$000(Lcom/miui/gallery/dao/base/EntityManager;)V

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/dao/base/EntityManager$SQLiteOpenHelperImpl;->this$0:Lcom/miui/gallery/dao/base/EntityManager;

    invoke-static {v0}, Lcom/miui/gallery/dao/base/EntityManager;->access$100(Lcom/miui/gallery/dao/base/EntityManager;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/miui/gallery/dao/base/EntityManager;->checkTableChange(Landroid/database/sqlite/SQLiteDatabase;Ljava/util/List;)V

    iget-object v0, p0, Lcom/miui/gallery/dao/base/EntityManager$SQLiteOpenHelperImpl;->this$0:Lcom/miui/gallery/dao/base/EntityManager;

    invoke-virtual {v0, p1, p2, p3}, Lcom/miui/gallery/dao/base/EntityManager;->onDatabaseUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string p2, "EntityManager"

    const-string p3, "Db onUpgrade error.\n"

    invoke-static {p2, p3, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :goto_0
    return-void
.end method
