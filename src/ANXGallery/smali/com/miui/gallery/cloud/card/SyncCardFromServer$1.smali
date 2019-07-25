.class Lcom/miui/gallery/cloud/card/SyncCardFromServer$1;
.super Ljava/lang/Object;
.source "SyncCardFromServer.java"

# interfaces
.implements Lcom/miui/gallery/cloud/base/SyncTask;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/cloud/card/SyncCardFromServer;->sync()Lcom/miui/gallery/cloud/base/GallerySyncResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/cloud/base/SyncTask<",
        "Lcom/miui/gallery/cloud/card/model/CardInfoList;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/cloud/card/SyncCardFromServer;


# direct methods
.method constructor <init>(Lcom/miui/gallery/cloud/card/SyncCardFromServer;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/cloud/card/SyncCardFromServer$1;->this$0:Lcom/miui/gallery/cloud/card/SyncCardFromServer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getIdentifier()Ljava/lang/String;
    .locals 1

    invoke-static {}, Lcom/miui/gallery/cloud/HostManager$Story;->getCardInfosUrl()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public run()Lcom/miui/gallery/cloud/base/GallerySyncResult;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/miui/gallery/cloud/base/GallerySyncResult<",
            "Lcom/miui/gallery/cloud/card/model/CardInfoList;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/cloud/card/SyncCardFromServer$1;->this$0:Lcom/miui/gallery/cloud/card/SyncCardFromServer;

    iget-object v1, p0, Lcom/miui/gallery/cloud/card/SyncCardFromServer$1;->this$0:Lcom/miui/gallery/cloud/card/SyncCardFromServer;

    iget-object v1, v1, Lcom/miui/gallery/cloud/card/SyncCardFromServer;->mAccount:Landroid/accounts/Account;

    invoke-static {v1}, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils;->getCardSyncTag(Landroid/accounts/Account;)J

    move-result-wide v1

    iget-object v3, p0, Lcom/miui/gallery/cloud/card/SyncCardFromServer$1;->this$0:Lcom/miui/gallery/cloud/card/SyncCardFromServer;

    iget-object v3, v3, Lcom/miui/gallery/cloud/card/SyncCardFromServer;->mAccount:Landroid/accounts/Account;

    invoke-static {v3}, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils;->getCardSyncInfo(Landroid/accounts/Account;)Ljava/lang/String;

    move-result-object v3

    const-wide/16 v4, 0xa

    invoke-virtual/range {v0 .. v5}, Lcom/miui/gallery/cloud/card/SyncCardFromServer;->getCardInfoList(JLjava/lang/String;J)Lcom/miui/gallery/cloud/card/model/CardInfoList;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    invoke-direct {v1}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;-><init>()V

    sget-object v2, Lcom/miui/gallery/cloud/base/GallerySyncCode;->OK:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    invoke-virtual {v1, v2}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->setCode(Lcom/miui/gallery/cloud/base/GallerySyncCode;)Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->setData(Ljava/lang/Object;)Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->build()Lcom/miui/gallery/cloud/base/GallerySyncResult;

    move-result-object v0

    return-object v0
.end method
