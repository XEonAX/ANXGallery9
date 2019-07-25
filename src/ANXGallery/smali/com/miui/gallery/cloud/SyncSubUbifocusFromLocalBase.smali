.class public abstract Lcom/miui/gallery/cloud/SyncSubUbifocusFromLocalBase;
.super Lcom/miui/gallery/cloud/SyncFromLocalBase;
.source "SyncSubUbifocusFromLocalBase.java"


# instance fields
.field private mAutoCreateImageItems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/cloud/RequestCloudItem;",
            ">;"
        }
    .end annotation
.end field

.field private mManualCreateImageItems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/cloud/RequestCloudItem;",
            ">;"
        }
    .end annotation
.end field

.field private mNoDelay:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;Z)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/cloud/SyncFromLocalBase;-><init>(Landroid/content/Context;Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;)V

    iput-boolean p4, p0, Lcom/miui/gallery/cloud/SyncSubUbifocusFromLocalBase;->mNoDelay:Z

    return-void
.end method


# virtual methods
.method protected handleRequestCloudItemList()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/cloud/SyncSubUbifocusFromLocalBase;->mManualCreateImageItems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    const-string v0, "SyncUbifocusFromLocal"

    const-string v1, "start upload manual create images"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/SyncLog;->v(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/cloud/SyncSubUbifocusFromLocalBase;->mManualCreateImageItems:Ljava/util/ArrayList;

    invoke-static {v0}, Lcom/miui/gallery/cloud/UpDownloadManager;->dispatchList(Ljava/util/List;)I

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/cloud/SyncSubUbifocusFromLocalBase;->mAutoCreateImageItems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_1

    const-string v0, "SyncUbifocusFromLocal"

    const-string v1, "start upload auto create images"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/SyncLog;->v(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/cloud/SyncSubUbifocusFromLocalBase;->mAutoCreateImageItems:Ljava/util/ArrayList;

    invoke-static {v0}, Lcom/miui/gallery/cloud/UpDownloadManager;->dispatchList(Ljava/util/List;)I

    :cond_1
    return-void
.end method

.method protected initRequestCloudItemList()V
    .locals 1

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/cloud/SyncSubUbifocusFromLocalBase;->mManualCreateImageItems:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/cloud/SyncSubUbifocusFromLocalBase;->mAutoCreateImageItems:Ljava/util/ArrayList;

    return-void
.end method

.method protected putToRequestCloudItemList(Lcom/miui/gallery/data/DBItem;)V
    .locals 3

    check-cast p1, Lcom/miui/gallery/data/DBImage;

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getLocalFlag()I

    move-result v0

    const/4 v1, 0x1

    packed-switch v0, :pswitch_data_0

    const-string v0, "SyncUbifocusFromLocal"

    const-string v1, "unsupport local flag %d"

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getLocalFlag()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/SyncLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    :pswitch_0
    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getServerType()I

    move-result v0

    if-eq v0, v1, :cond_0

    const-string v0, "SyncUbifocusFromLocal"

    const-string v1, "unsupport local flag= %d serverType= %d"

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getLocalFlag()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getServerType()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {v0, v1, v2, p1}, Lcom/miui/gallery/util/SyncLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/miui/gallery/cloud/RequestCloudItem;

    const/4 v1, 0x5

    iget-boolean v2, p0, Lcom/miui/gallery/cloud/SyncSubUbifocusFromLocalBase;->mNoDelay:Z

    invoke-direct {v0, v1, p1, v2}, Lcom/miui/gallery/cloud/RequestCloudItem;-><init>(ILcom/miui/gallery/data/DBImage;Z)V

    iget-object p1, p0, Lcom/miui/gallery/cloud/SyncSubUbifocusFromLocalBase;->mManualCreateImageItems:Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :pswitch_1
    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getServerType()I

    move-result v0

    if-eq v0, v1, :cond_1

    const-string v0, "SyncUbifocusFromLocal"

    const-string v1, "unsupport local flag=%d serverType=%d"

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getLocalFlag()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getServerType()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {v0, v1, v2, p1}, Lcom/miui/gallery/util/SyncLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0

    :cond_1
    new-instance v0, Lcom/miui/gallery/cloud/RequestCloudItem;

    const/4 v1, 0x4

    iget-boolean v2, p0, Lcom/miui/gallery/cloud/SyncSubUbifocusFromLocalBase;->mNoDelay:Z

    invoke-direct {v0, v1, p1, v2}, Lcom/miui/gallery/cloud/RequestCloudItem;-><init>(ILcom/miui/gallery/data/DBImage;Z)V

    iget-object p1, p0, Lcom/miui/gallery/cloud/SyncSubUbifocusFromLocalBase;->mAutoCreateImageItems:Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x7
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
