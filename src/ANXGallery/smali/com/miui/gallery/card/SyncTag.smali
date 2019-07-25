.class public Lcom/miui/gallery/card/SyncTag;
.super Lcom/miui/gallery/dao/base/Entity;
.source "SyncTag.java"


# instance fields
.field private mAccountName:Ljava/lang/String;

.field private mAccountType:Ljava/lang/String;

.field private mCardSyncInfo:Ljava/lang/String;

.field private mCardSyncTag:J


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/dao/base/Entity;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/accounts/Account;)V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/dao/base/Entity;-><init>()V

    iget-object v0, p1, Landroid/accounts/Account;->name:Ljava/lang/String;

    iput-object v0, p0, Lcom/miui/gallery/card/SyncTag;->mAccountName:Ljava/lang/String;

    iget-object p1, p1, Landroid/accounts/Account;->type:Ljava/lang/String;

    iput-object p1, p0, Lcom/miui/gallery/card/SyncTag;->mAccountType:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getCardSyncInfo()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/card/SyncTag;->mCardSyncInfo:Ljava/lang/String;

    return-object v0
.end method

.method public getCardSyncTag()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/card/SyncTag;->mCardSyncTag:J

    return-wide v0
.end method

.method protected getTableColumns()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/dao/base/TableColumn;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const-string v1, "accountName"

    const-string v2, "TEXT"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/card/SyncTag;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "accountType"

    const-string v2, "TEXT"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/card/SyncTag;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "cardSyncTag"

    const-string v2, "INTEGER"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/card/SyncTag;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "cardSyncInfo"

    const-string v2, "TEXT"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/card/SyncTag;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method protected onConvertToContents(Landroid/content/ContentValues;)V
    .locals 3

    const-string v0, "accountName"

    iget-object v1, p0, Lcom/miui/gallery/card/SyncTag;->mAccountName:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "accountType"

    iget-object v1, p0, Lcom/miui/gallery/card/SyncTag;->mAccountType:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "cardSyncTag"

    iget-wide v1, p0, Lcom/miui/gallery/card/SyncTag;->mCardSyncTag:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v0, "cardSyncInfo"

    iget-object v1, p0, Lcom/miui/gallery/card/SyncTag;->mCardSyncInfo:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method protected onInitFromCursor(Landroid/database/Cursor;)V
    .locals 2

    const-string v0, "accountName"

    invoke-static {p1, v0}, Lcom/miui/gallery/card/SyncTag;->getString(Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/card/SyncTag;->mAccountName:Ljava/lang/String;

    const-string v0, "accountType"

    invoke-static {p1, v0}, Lcom/miui/gallery/card/SyncTag;->getString(Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/card/SyncTag;->mAccountType:Ljava/lang/String;

    const-string v0, "cardSyncTag"

    invoke-static {p1, v0}, Lcom/miui/gallery/card/SyncTag;->getLong(Landroid/database/Cursor;Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/card/SyncTag;->mCardSyncTag:J

    const-string v0, "cardSyncInfo"

    invoke-static {p1, v0}, Lcom/miui/gallery/card/SyncTag;->getString(Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/card/SyncTag;->mCardSyncInfo:Ljava/lang/String;

    return-void
.end method
