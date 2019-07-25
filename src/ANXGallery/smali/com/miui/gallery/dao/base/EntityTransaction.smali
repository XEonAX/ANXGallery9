.class public Lcom/miui/gallery/dao/base/EntityTransaction;
.super Ljava/lang/Object;
.source "EntityTransaction.java"


# instance fields
.field private db:Landroid/database/sqlite/SQLiteDatabase;


# direct methods
.method public constructor <init>(Landroid/database/sqlite/SQLiteOpenHelper;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/dao/base/EntityTransaction;->db:Landroid/database/sqlite/SQLiteDatabase;

    return-void
.end method


# virtual methods
.method public begin()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/dao/base/EntityTransaction;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    return-void
.end method

.method public commit()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/dao/base/EntityTransaction;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V

    return-void
.end method

.method public end()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/dao/base/EntityTransaction;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/dao/base/EntityTransaction;->db:Landroid/database/sqlite/SQLiteDatabase;

    return-void
.end method
