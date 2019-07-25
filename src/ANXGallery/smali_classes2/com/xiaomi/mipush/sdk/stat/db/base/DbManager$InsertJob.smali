.class public Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$InsertJob;
.super Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;
.source "DbManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "InsertJob"
.end annotation


# instance fields
.field private mContentValues:Landroid/content/ContentValues;


# direct methods
.method public constructor <init>(Ljava/lang/String;Landroid/content/ContentValues;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;-><init>(Ljava/lang/String;)V

    iput-object p2, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$InsertJob;->mContentValues:Landroid/content/ContentValues;

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

    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$InsertJob;->mTableName:Ljava/lang/String;

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$InsertJob;->mContentValues:Landroid/content/ContentValues;

    const/4 v1, 0x0

    invoke-virtual {p2, p1, v1, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    return-void
.end method
