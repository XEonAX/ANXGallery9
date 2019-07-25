.class public Lcom/miui/gallery/cloudcontrol/CloudControlDBHelper;
.super Ljava/lang/Object;
.source "CloudControlDBHelper.java"


# direct methods
.method private static deleteItem(Landroid/content/Context;Lcom/miui/gallery/cloudcontrol/FeatureProfile;)I
    .locals 4

    const-string v0, "CloudControlDBHelper"

    const-string v1, "deleteItem: %s"

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$CloudControl;->URI:Landroid/net/Uri;

    const-string v1, "featureName = ?"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    invoke-virtual {p1}, Lcom/miui/gallery/cloudcontrol/FeatureProfile;->getName()Ljava/lang/String;

    move-result-object p1

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-static {p0, v0, v1, v2}, Lcom/miui/gallery/util/SafeDBUtil;->safeDelete(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    move-result p0

    if-lez p0, :cond_0

    const/4 v3, 0x2

    :cond_0
    return v3
.end method

.method private static insertItem(Landroid/content/Context;Lcom/miui/gallery/cloudcontrol/FeatureProfile;)I
    .locals 3

    const-string v0, "CloudControlDBHelper"

    const-string v1, "insertItem: %s"

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    const-string v1, "status"

    invoke-virtual {p1}, Lcom/miui/gallery/cloudcontrol/FeatureProfile;->getStatus()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "strategy"

    invoke-virtual {p1}, Lcom/miui/gallery/cloudcontrol/FeatureProfile;->getStrategy()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "featureName"

    invoke-virtual {p1}, Lcom/miui/gallery/cloudcontrol/FeatureProfile;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    sget-object p1, Lcom/miui/gallery/provider/GalleryContract$CloudControl;->URI:Landroid/net/Uri;

    invoke-static {p0, p1, v0}, Lcom/miui/gallery/util/SafeDBUtil;->safeInsert(Landroid/content/Context;Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method private static queryItem(Landroid/content/Context;Ljava/lang/String;)Lcom/miui/gallery/cloudcontrol/FeatureDBItem;
    .locals 7

    sget-object v1, Lcom/miui/gallery/provider/GalleryContract$CloudControl;->URI:Landroid/net/Uri;

    sget-object v2, Lcom/miui/gallery/cloudcontrol/FeatureDBItem;->PROJECTION:[Ljava/lang/String;

    const-string v3, "featureName = ?"

    const/4 v0, 0x1

    new-array v4, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    aput-object p1, v4, v0

    new-instance v6, Lcom/miui/gallery/cloudcontrol/CloudControlDBHelper$1;

    invoke-direct {v6}, Lcom/miui/gallery/cloudcontrol/CloudControlDBHelper$1;-><init>()V

    const/4 v5, 0x0

    move-object v0, p0

    invoke-static/range {v0 .. v6}, Lcom/miui/gallery/util/SafeDBUtil;->safeQuery(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/util/SafeDBUtil$QueryHandler;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/cloudcontrol/FeatureDBItem;

    return-object p0
.end method

.method public static tryInsertToDB(Landroid/content/Context;Lcom/miui/gallery/cloudcontrol/FeatureProfile;)I
    .locals 5

    invoke-virtual {p1}, Lcom/miui/gallery/cloudcontrol/FeatureProfile;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/miui/gallery/cloudcontrol/CloudControlDBHelper;->queryItem(Landroid/content/Context;Ljava/lang/String;)Lcom/miui/gallery/cloudcontrol/FeatureDBItem;

    move-result-object v0

    invoke-virtual {p1}, Lcom/miui/gallery/cloudcontrol/FeatureProfile;->getStatus()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x4

    if-eqz v1, :cond_1

    invoke-virtual {p1}, Lcom/miui/gallery/cloudcontrol/FeatureProfile;->getStatus()Ljava/lang/String;

    move-result-object v1

    sget-object v3, Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;->REMOVE:Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;

    invoke-virtual {v3}, Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    if-eqz v0, :cond_0

    invoke-static {p0, p1}, Lcom/miui/gallery/cloudcontrol/CloudControlDBHelper;->deleteItem(Landroid/content/Context;Lcom/miui/gallery/cloudcontrol/FeatureProfile;)I

    move-result p0

    return p0

    :cond_0
    return v2

    :cond_1
    if-eqz v0, :cond_5

    invoke-virtual {v0}, Lcom/miui/gallery/cloudcontrol/FeatureDBItem;->getStatus()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_3

    invoke-virtual {v0}, Lcom/miui/gallery/cloudcontrol/FeatureDBItem;->getStatus()Ljava/lang/String;

    move-result-object v1

    sget-object v3, Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;->ENABLE:Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;

    invoke-virtual {v3}, Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    sget-object v1, Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;->DISABLE:Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;

    invoke-virtual {v1}, Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/miui/gallery/cloudcontrol/FeatureProfile;->getStatus()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    const-string v1, "CloudControlDBHelper"

    const-string v3, "Status \'disable\' can\'t overwrite \'enable\': %s"

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v3, v4}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_2
    sget-object v1, Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;->ENABLE:Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;

    invoke-virtual {v1}, Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/miui/gallery/cloudcontrol/FeatureProfile;->setStatus(Ljava/lang/String;)V

    :cond_3
    invoke-virtual {v0, p1}, Lcom/miui/gallery/cloudcontrol/FeatureDBItem;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    const-string p0, "CloudControlDBHelper"

    const-string v0, "Unchanged item: %s, ignore"

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, v0, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return v2

    :cond_4
    invoke-static {p0, p1}, Lcom/miui/gallery/cloudcontrol/CloudControlDBHelper;->updateItem(Landroid/content/Context;Lcom/miui/gallery/cloudcontrol/FeatureProfile;)I

    move-result p0

    return p0

    :cond_5
    invoke-static {p0, p1}, Lcom/miui/gallery/cloudcontrol/CloudControlDBHelper;->insertItem(Landroid/content/Context;Lcom/miui/gallery/cloudcontrol/FeatureProfile;)I

    move-result p0

    return p0
.end method

.method private static updateItem(Landroid/content/Context;Lcom/miui/gallery/cloudcontrol/FeatureProfile;)I
    .locals 5

    const-string v0, "CloudControlDBHelper"

    const-string v1, "updateItem: %s"

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    const-string v1, "status"

    invoke-virtual {p1}, Lcom/miui/gallery/cloudcontrol/FeatureProfile;->getStatus()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "strategy"

    invoke-virtual {p1}, Lcom/miui/gallery/cloudcontrol/FeatureProfile;->getStrategy()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v1, Lcom/miui/gallery/provider/GalleryContract$CloudControl;->URI:Landroid/net/Uri;

    const-string v2, "featureName = ?"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    invoke-virtual {p1}, Lcom/miui/gallery/cloudcontrol/FeatureProfile;->getName()Ljava/lang/String;

    move-result-object p1

    const/4 v4, 0x0

    aput-object p1, v3, v4

    invoke-static {p0, v1, v0, v2, v3}, Lcom/miui/gallery/util/SafeDBUtil;->safeUpdate(Landroid/content/Context;Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result p0

    if-lez p0, :cond_0

    const/4 v4, 0x3

    :cond_0
    return v4
.end method
