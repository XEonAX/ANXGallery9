.class public Lcom/miui/gallery/card/SyncTagUtil;
.super Ljava/lang/Object;
.source "SyncTagUtil.java"


# direct methods
.method public static ensureAccount(Landroid/accounts/Account;)V
    .locals 4

    if-eqz p0, :cond_0

    invoke-static {}, Lcom/miui/gallery/dao/GalleryEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryEntityManager;

    move-result-object v0

    const-class v1, Lcom/miui/gallery/card/SyncTag;

    invoke-static {p0}, Lcom/miui/gallery/card/SyncTagUtil;->getAcountSelection(Landroid/accounts/Account;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Lcom/miui/gallery/dao/GalleryEntityManager;->query(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/card/SyncTag;

    invoke-direct {v0, p0}, Lcom/miui/gallery/card/SyncTag;-><init>(Landroid/accounts/Account;)V

    invoke-static {}, Lcom/miui/gallery/dao/GalleryEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryEntityManager;

    move-result-object p0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/dao/GalleryEntityManager;->insert(Lcom/miui/gallery/dao/base/Entity;)Z

    :cond_0
    return-void
.end method

.method private static getAcountSelection(Landroid/accounts/Account;)Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "accountName = \'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Landroid/accounts/Account;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\' AND "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "accountType"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " = \'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Landroid/accounts/Account;->type:Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "\'"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getCardSyncInfo(Landroid/accounts/Account;)Ljava/lang/String;
    .locals 0

    invoke-static {p0}, Lcom/miui/gallery/card/SyncTagUtil;->getSyncTagByAccount(Landroid/accounts/Account;)Lcom/miui/gallery/card/SyncTag;

    move-result-object p0

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/card/SyncTag;->getCardSyncInfo()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_0
    const-string p0, ""

    return-object p0
.end method

.method public static getCardSyncTag(Landroid/accounts/Account;)J
    .locals 2

    invoke-static {p0}, Lcom/miui/gallery/card/SyncTagUtil;->getSyncTagByAccount(Landroid/accounts/Account;)Lcom/miui/gallery/card/SyncTag;

    move-result-object p0

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/card/SyncTag;->getCardSyncTag()J

    move-result-wide v0

    return-wide v0

    :cond_0
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method private static getSyncTagByAccount(Landroid/accounts/Account;)Lcom/miui/gallery/card/SyncTag;
    .locals 12

    if-eqz p0, :cond_0

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "%s,%s"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v4, 0x1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v2, v4

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-static {}, Lcom/miui/gallery/dao/GalleryEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryEntityManager;

    move-result-object v6

    invoke-static {p0}, Lcom/miui/gallery/card/SyncTagUtil;->getAcountSelection(Landroid/accounts/Account;)Ljava/lang/String;

    move-result-object v8

    const-class v7, Lcom/miui/gallery/card/SyncTag;

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-virtual/range {v6 .. v11}, Lcom/miui/gallery/dao/base/EntityManager;->query(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object p0

    invoke-static {p0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/card/SyncTag;

    return-object p0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public static setCardSyncInfo(Landroid/accounts/Account;Ljava/lang/String;)V
    .locals 3

    if-nez p0, :cond_0

    return-void

    :cond_0
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    const-string v1, "cardSyncInfo"

    invoke-virtual {v0, v1, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/miui/gallery/dao/GalleryEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryEntityManager;

    move-result-object p1

    const-class v1, Lcom/miui/gallery/card/SyncTag;

    invoke-static {p0}, Lcom/miui/gallery/card/SyncTagUtil;->getAcountSelection(Landroid/accounts/Account;)Ljava/lang/String;

    move-result-object p0

    const/4 v2, 0x0

    invoke-virtual {p1, v1, v0, p0, v2}, Lcom/miui/gallery/dao/GalleryEntityManager;->update(Ljava/lang/Class;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)Z

    return-void
.end method

.method public static setCardSyncTag(Landroid/accounts/Account;J)V
    .locals 2

    if-nez p0, :cond_0

    return-void

    :cond_0
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    const-string v1, "cardSyncTag"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    invoke-static {}, Lcom/miui/gallery/dao/GalleryEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryEntityManager;

    move-result-object p1

    const-class p2, Lcom/miui/gallery/card/SyncTag;

    invoke-static {p0}, Lcom/miui/gallery/card/SyncTagUtil;->getAcountSelection(Landroid/accounts/Account;)Ljava/lang/String;

    move-result-object p0

    const/4 v1, 0x0

    invoke-virtual {p1, p2, v0, p0, v1}, Lcom/miui/gallery/dao/GalleryEntityManager;->update(Ljava/lang/Class;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)Z

    return-void
.end method
