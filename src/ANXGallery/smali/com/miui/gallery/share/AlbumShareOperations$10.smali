.class final Lcom/miui/gallery/share/AlbumShareOperations$10;
.super Ljava/lang/Object;
.source "AlbumShareOperations.java"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/share/AlbumShareOperations;->denyInvitation(Landroid/content/ContentResolver;Ljava/lang/String;Lcom/miui/gallery/share/CloudSharerMediaSet;)Lcom/miui/gallery/share/AsyncResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable<",
        "Lcom/miui/gallery/share/AsyncResult<",
        "Ljava/lang/Void;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic val$mediaSet:Lcom/miui/gallery/share/CloudSharerMediaSet;

.field final synthetic val$resolver:Landroid/content/ContentResolver;

.field final synthetic val$url:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/content/ContentResolver;Ljava/lang/String;Lcom/miui/gallery/share/CloudSharerMediaSet;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/share/AlbumShareOperations$10;->val$resolver:Landroid/content/ContentResolver;

    iput-object p2, p0, Lcom/miui/gallery/share/AlbumShareOperations$10;->val$url:Ljava/lang/String;

    iput-object p3, p0, Lcom/miui/gallery/share/AlbumShareOperations$10;->val$mediaSet:Lcom/miui/gallery/share/CloudSharerMediaSet;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call()Lcom/miui/gallery/share/AsyncResult;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/miui/gallery/share/AsyncResult<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$CTA;->canConnectNetwork()Z

    move-result v0

    if-nez v0, :cond_0

    const/16 v0, -0xb

    invoke-static {v0}, Lcom/miui/gallery/share/AsyncResult;->create(I)Lcom/miui/gallery/share/AsyncResult;

    move-result-object v0

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/share/AlbumShareOperations$10;->val$resolver:Landroid/content/ContentResolver;

    iget-object v1, p0, Lcom/miui/gallery/share/AlbumShareOperations$10;->val$url:Ljava/lang/String;

    iget-object v2, p0, Lcom/miui/gallery/share/AlbumShareOperations$10;->val$mediaSet:Lcom/miui/gallery/share/CloudSharerMediaSet;

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/share/AlbumShareOperations;->access$900(Landroid/content/ContentResolver;Ljava/lang/String;Lcom/miui/gallery/share/CloudSharerMediaSet;)Ljava/util/ArrayList;

    move-result-object v0

    if-nez v0, :cond_1

    const/16 v0, -0x3e9

    invoke-static {v0}, Lcom/miui/gallery/share/AsyncResult;->create(I)Lcom/miui/gallery/share/AsyncResult;

    move-result-object v0

    return-object v0

    :cond_1
    invoke-static {}, Lcom/miui/gallery/cloud/HostManager$AlbumShareOperation;->getRefuseInvitationUrl()Ljava/lang/String;

    move-result-object v1

    invoke-static {}, Lcom/google/common/collect/Lists;->newArrayList()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/http/NameValuePair;

    invoke-interface {v3}, Lorg/apache/http/NameValuePair;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3}, Lorg/apache/http/NameValuePair;->getValue()Ljava/lang/String;

    move-result-object v3

    const/4 v5, 0x0

    invoke-static {v2, v4, v3, v5}, Lcom/miui/gallery/share/AlbumShareOperations;->access$200(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;)V

    goto :goto_0

    :cond_2
    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-static/range {v1 .. v7}, Lcom/miui/gallery/cloud/CloudUtils;->postToXiaomi(Ljava/lang/String;Ljava/util/List;Lorg/json/JSONObject;Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;IZ)Lorg/json/JSONObject;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/cloud/CheckResult;->parseErrorCode(Lorg/json/JSONObject;)I

    move-result v0

    invoke-static {v0}, Lcom/miui/gallery/cloud/ServerErrorCode;->isClientError(I)Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-static {v0}, Lcom/miui/gallery/share/AsyncResult;->create(I)Lcom/miui/gallery/share/AsyncResult;

    move-result-object v0

    return-object v0

    :cond_3
    iget-object v1, p0, Lcom/miui/gallery/share/AlbumShareOperations$10;->val$resolver:Landroid/content/ContentResolver;

    sget-object v2, Lcom/miui/gallery/cloud/GalleryCloudUtils;->SHARE_ALBUM_URI:Landroid/net/Uri;

    const-string v3, "%s=? AND %s=?"

    const/4 v4, 0x2

    new-array v5, v4, [Ljava/lang/Object;

    const-string v6, "shareUrl"

    const/4 v7, 0x0

    aput-object v6, v5, v7

    const-string v6, "albumStatus"

    const/4 v8, 0x1

    aput-object v6, v5, v8

    invoke-static {v3, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    new-array v4, v4, [Ljava/lang/String;

    iget-object v5, p0, Lcom/miui/gallery/share/AlbumShareOperations$10;->val$url:Ljava/lang/String;

    aput-object v5, v4, v7

    const-string v5, "invited"

    aput-object v5, v4, v8

    invoke-virtual {v1, v2, v3, v4}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    invoke-static {v0}, Lcom/miui/gallery/share/AsyncResult;->create(I)Lcom/miui/gallery/share/AsyncResult;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic call()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/miui/gallery/share/AlbumShareOperations$10;->call()Lcom/miui/gallery/share/AsyncResult;

    move-result-object v0

    return-object v0
.end method
