.class public Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$DeleteJob;
.super Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;
.source "DbManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DeleteJob"
.end annotation


# instance fields
.field private mWhereClause:Ljava/lang/String;

.field protected mWhereValues:[Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;-><init>(Ljava/lang/String;)V

    iput-object p2, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$DeleteJob;->mWhereClause:Ljava/lang/String;

    iput-object p3, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$DeleteJob;->mWhereValues:[Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public doRun(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$DeleteJob;->mTableName:Ljava/lang/String;

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$DeleteJob;->mWhereClause:Ljava/lang/String;

    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$DeleteJob;->mWhereValues:[Ljava/lang/String;

    invoke-virtual {p2, p1, v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    return-void
.end method
