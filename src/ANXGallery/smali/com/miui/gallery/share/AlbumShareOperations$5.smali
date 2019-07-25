.class final Lcom/miui/gallery/share/AlbumShareOperations$5;
.super Ljava/lang/Object;
.source "AlbumShareOperations.java"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/share/AlbumShareOperations;->requestInvitationForSms(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/miui/gallery/share/AsyncResult;
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
        "Lcom/miui/gallery/share/AlbumShareOperations$OutgoingInvitation;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic val$ownerRelation:Ljava/lang/String;

.field final synthetic val$ownerRelationText:Ljava/lang/String;

.field final synthetic val$relation:Ljava/lang/String;

.field final synthetic val$relationText:Ljava/lang/String;

.field final synthetic val$serverId:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/share/AlbumShareOperations$5;->val$serverId:Ljava/lang/String;

    iput-object p2, p0, Lcom/miui/gallery/share/AlbumShareOperations$5;->val$relation:Ljava/lang/String;

    iput-object p3, p0, Lcom/miui/gallery/share/AlbumShareOperations$5;->val$ownerRelation:Ljava/lang/String;

    iput-object p4, p0, Lcom/miui/gallery/share/AlbumShareOperations$5;->val$ownerRelationText:Ljava/lang/String;

    iput-object p5, p0, Lcom/miui/gallery/share/AlbumShareOperations$5;->val$relationText:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call()Lcom/miui/gallery/share/AsyncResult;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/miui/gallery/share/AsyncResult<",
            "Lcom/miui/gallery/share/AlbumShareOperations$OutgoingInvitation;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/share/AlbumShareOperations$5;->val$serverId:Ljava/lang/String;

    const-string v1, "smsShareData"

    const-string v2, "smsShareDataDeadline"

    const v3, 0x2932e00

    invoke-static {v0, v1, v2, v3}, Lcom/miui/gallery/share/AlbumShareOperations;->access$100(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    invoke-static {v0}, Lcom/miui/gallery/share/AlbumShareOperations$OutgoingInvitation;->fromCache(Ljava/lang/String;)Lcom/miui/gallery/share/AlbumShareOperations$OutgoingInvitation;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {v2, v0}, Lcom/miui/gallery/share/AsyncResult;->create(ILjava/lang/Object;)Lcom/miui/gallery/share/AsyncResult;

    move-result-object v0

    return-object v0

    :cond_0
    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$CTA;->canConnectNetwork()Z

    move-result v0

    if-nez v0, :cond_1

    const/16 v0, -0xb

    invoke-static {v0}, Lcom/miui/gallery/share/AsyncResult;->create(I)Lcom/miui/gallery/share/AsyncResult;

    move-result-object v0

    return-object v0

    :cond_1
    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/account/AccountHelper;->getXiaomiAccount(Landroid/content/Context;)Landroid/accounts/Account;

    move-result-object v7

    if-nez v7, :cond_2

    const/4 v0, -0x4

    invoke-static {v0}, Lcom/miui/gallery/share/AsyncResult;->create(I)Lcom/miui/gallery/share/AsyncResult;

    move-result-object v0

    return-object v0

    :cond_2
    invoke-static {v0, v7}, Lcom/miui/gallery/cloud/CloudUtils;->getExtToken(Landroid/content/Context;Landroid/accounts/Account;)Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;

    move-result-object v8

    if-nez v8, :cond_3

    const/4 v0, -0x3

    invoke-static {v0}, Lcom/miui/gallery/share/AsyncResult;->create(I)Lcom/miui/gallery/share/AsyncResult;

    move-result-object v0

    return-object v0

    :cond_3
    invoke-static {}, Lcom/miui/gallery/share/AlbumShareOperations;->myName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_4

    const/4 v0, -0x5

    invoke-static {v0}, Lcom/miui/gallery/share/AsyncResult;->create(I)Lcom/miui/gallery/share/AsyncResult;

    move-result-object v0

    return-object v0

    :cond_4
    iget-object v1, p0, Lcom/miui/gallery/share/AlbumShareOperations$5;->val$serverId:Ljava/lang/String;

    invoke-static {v1}, Lcom/miui/gallery/cloud/HostManager$AlbumShareOperation;->getSmsShareUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {}, Lcom/google/common/collect/Lists;->newArrayList()Ljava/util/ArrayList;

    move-result-object v5

    const-string v1, "userName"

    invoke-static {v5, v1, v0, v8}, Lcom/miui/gallery/share/AlbumShareOperations;->access$200(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;)V

    iget-object v0, p0, Lcom/miui/gallery/share/AlbumShareOperations$5;->val$relation:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_5

    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "ownerRelation"

    iget-object v6, p0, Lcom/miui/gallery/share/AlbumShareOperations$5;->val$ownerRelation:Ljava/lang/String;

    invoke-virtual {v0, v1, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "ownerRelationText"

    iget-object v6, p0, Lcom/miui/gallery/share/AlbumShareOperations$5;->val$ownerRelationText:Ljava/lang/String;

    invoke-virtual {v0, v1, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "sharerRelation"

    iget-object v6, p0, Lcom/miui/gallery/share/AlbumShareOperations$5;->val$relation:Ljava/lang/String;

    invoke-virtual {v0, v1, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "sharerRelationText"

    iget-object v6, p0, Lcom/miui/gallery/share/AlbumShareOperations$5;->val$relationText:Ljava/lang/String;

    invoke-virtual {v0, v1, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    const-string v1, "relationShip"

    invoke-static {v5, v1, v0, v8}, Lcom/miui/gallery/share/AlbumShareOperations;->access$200(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;)V

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    const/4 v0, -0x7

    invoke-static {v0}, Lcom/miui/gallery/share/AsyncResult;->create(I)Lcom/miui/gallery/share/AsyncResult;

    move-result-object v0

    return-object v0

    :cond_5
    :goto_0
    const/4 v6, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-static/range {v4 .. v10}, Lcom/miui/gallery/cloud/CloudUtils;->postToXiaomi(Ljava/lang/String;Ljava/util/List;Lorg/json/JSONObject;Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;IZ)Lorg/json/JSONObject;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/cloud/CheckResult;->parseErrorCode(Lorg/json/JSONObject;)I

    move-result v1

    if-eqz v1, :cond_6

    invoke-static {v1}, Lcom/miui/gallery/share/AsyncResult;->create(I)Lcom/miui/gallery/share/AsyncResult;

    move-result-object v0

    return-object v0

    :cond_6
    const-string v1, "data"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/share/AlbumShareOperations$OutgoingInvitation;

    const-string v4, "text"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "url"

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v4, v0}, Lcom/miui/gallery/share/AlbumShareOperations$OutgoingInvitation;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/share/AlbumShareOperations$5;->val$relation:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/miui/gallery/share/AlbumShareOperations$5;->val$serverId:Ljava/lang/String;

    const-string v4, "smsShareData"

    const-string v5, "smsShareDataDeadline"

    invoke-virtual {v1}, Lcom/miui/gallery/share/AlbumShareOperations$OutgoingInvitation;->toCache()Ljava/lang/String;

    move-result-object v6

    invoke-static {v0, v4, v5, v6, v3}, Lcom/miui/gallery/share/AlbumShareOperations;->access$300(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    :cond_7
    const-string v0, "AlbumShareOperations"

    const-string v3, "request sms url success."

    invoke-static {v0, v3}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v2, v1}, Lcom/miui/gallery/share/AsyncResult;->create(ILjava/lang/Object;)Lcom/miui/gallery/share/AsyncResult;

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

    invoke-virtual {p0}, Lcom/miui/gallery/share/AlbumShareOperations$5;->call()Lcom/miui/gallery/share/AsyncResult;

    move-result-object v0

    return-object v0
.end method
