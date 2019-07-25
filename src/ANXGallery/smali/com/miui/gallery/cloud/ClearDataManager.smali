.class public Lcom/miui/gallery/cloud/ClearDataManager;
.super Ljava/lang/Object;
.source "ClearDataManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/cloud/ClearDataManager$SingletonHolder;
    }
.end annotation


# instance fields
.field private mHasClearOnce:Z


# direct methods
.method private constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/cloud/ClearDataManager;->mHasClearOnce:Z

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/cloud/ClearDataManager$1;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/cloud/ClearDataManager;-><init>()V

    return-void
.end method

.method public static getInstance()Lcom/miui/gallery/cloud/ClearDataManager;
    .locals 1

    sget-object v0, Lcom/miui/gallery/cloud/ClearDataManager$SingletonHolder;->Instance:Lcom/miui/gallery/cloud/ClearDataManager;

    return-object v0
.end method


# virtual methods
.method public clearDataBaseIfNeeded(Landroid/content/Context;Landroid/accounts/Account;)Z
    .locals 4

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/cloud/ClearDataManager;->mHasClearOnce:Z

    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->getSyncShouldClearDataBase()Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "ClearDataManager"

    const-string v2, "clear data start"

    invoke-static {v1, v2}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {p1, v0}, Lcom/miui/gallery/util/DeleteDataUtil;->delete(Landroid/content/Context;I)Z

    move-result v1

    const-string v2, "ClearDataManager"

    const-string v3, "clear data result %s"

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {v2, v3, v1}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {p1, p2}, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils;->insertAccountToDB(Landroid/content/Context;Landroid/accounts/Account;)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/cloud/ClearDataManager;->mHasClearOnce:Z

    invoke-static {v0}, Lcom/miui/gallery/util/deprecated/Preference;->setSyncShouldClearDataBase(Z)V

    const-string p2, "ClearDataManager"

    const-string v0, "clear data end"

    invoke-static {p2, v0}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    return p1

    :cond_0
    return v0
.end method
