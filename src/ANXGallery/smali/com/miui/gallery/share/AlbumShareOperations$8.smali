.class final Lcom/miui/gallery/share/AlbumShareOperations$8;
.super Ljava/lang/Object;
.source "AlbumShareOperations.java"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/share/AlbumShareOperations;->updateInvitation(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/share/CloudSharerMediaSet;)Lcom/miui/gallery/share/AsyncResult;
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
        "Ljava/lang/String;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic val$longUrlIn:Ljava/lang/String;

.field final synthetic val$mediaSet:Lcom/miui/gallery/share/CloudSharerMediaSet;

.field final synthetic val$resolver:Landroid/content/ContentResolver;

.field final synthetic val$url:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentResolver;Lcom/miui/gallery/share/CloudSharerMediaSet;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/share/AlbumShareOperations$8;->val$url:Ljava/lang/String;

    iput-object p2, p0, Lcom/miui/gallery/share/AlbumShareOperations$8;->val$longUrlIn:Ljava/lang/String;

    iput-object p3, p0, Lcom/miui/gallery/share/AlbumShareOperations$8;->val$resolver:Landroid/content/ContentResolver;

    iput-object p4, p0, Lcom/miui/gallery/share/AlbumShareOperations$8;->val$mediaSet:Lcom/miui/gallery/share/CloudSharerMediaSet;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call()Lcom/miui/gallery/share/AsyncResult;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/miui/gallery/share/AsyncResult<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/share/AlbumShareOperations$8;->val$url:Ljava/lang/String;

    invoke-static {v0}, Lcom/miui/gallery/lib/MiuiGalleryUtils;->isAlbumShareUrl(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-static {}, Lcom/miui/gallery/util/deviceprovider/ApplicationHelper;->supportShare()Z

    move-result v0

    if-nez v0, :cond_0

    goto/16 :goto_2

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/share/AlbumShareOperations$8;->val$longUrlIn:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/share/AlbumShareOperations$8;->val$longUrlIn:Ljava/lang/String;

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/share/AlbumShareOperations$8;->val$url:Ljava/lang/String;

    invoke-static {v0}, Lcom/miui/gallery/share/AlbumShareOperations;->access$600(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/share/AlbumShareOperations;->access$700(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2

    const/4 v0, -0x7

    invoke-static {v0}, Lcom/miui/gallery/share/AsyncResult;->create(I)Lcom/miui/gallery/share/AsyncResult;

    move-result-object v0

    return-object v0

    :cond_2
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    const-string v2, "shareUrlLong"

    invoke-virtual {v1, v2, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v0}, Lcom/miui/gallery/share/AlbumShareOperations;->parseInvitation(Ljava/lang/String;)Lcom/miui/gallery/share/AlbumShareOperations$IncomingInvitation;

    move-result-object v2

    if-eqz v2, :cond_4

    invoke-virtual {v2}, Lcom/miui/gallery/share/AlbumShareOperations$IncomingInvitation;->hasSharerInfo()Z

    move-result v3

    if-eqz v3, :cond_4

    iget-object v3, p0, Lcom/miui/gallery/share/AlbumShareOperations$8;->val$resolver:Landroid/content/ContentResolver;

    iget-object v4, p0, Lcom/miui/gallery/share/AlbumShareOperations$8;->val$url:Ljava/lang/String;

    invoke-static {v3, v4, v0}, Lcom/miui/gallery/share/AlbumShareOperations;->requestSharerInfo(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Lcom/miui/gallery/share/AsyncResult;

    move-result-object v3

    iget v4, v3, Lcom/miui/gallery/share/AsyncResult;->mError:I

    if-nez v4, :cond_3

    const-string v4, "sharerInfo"

    iget-object v5, v3, Lcom/miui/gallery/share/AsyncResult;->mData:Ljava/lang/Object;

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v1, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    iget v3, v3, Lcom/miui/gallery/share/AsyncResult;->mError:I

    invoke-static {v3, v0}, Lcom/miui/gallery/share/AsyncResult;->create(ILjava/lang/Object;)Lcom/miui/gallery/share/AsyncResult;

    move-result-object v0

    goto :goto_1

    :cond_3
    return-object v3

    :cond_4
    const/4 v3, 0x0

    invoke-static {v3, v0}, Lcom/miui/gallery/share/AsyncResult;->create(ILjava/lang/Object;)Lcom/miui/gallery/share/AsyncResult;

    move-result-object v0

    :goto_1
    if-eqz v2, :cond_5

    invoke-virtual {v2}, Lcom/miui/gallery/share/AlbumShareOperations$IncomingInvitation;->getAlbumName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_5

    const-string v3, "fileName"

    invoke-virtual {v2}, Lcom/miui/gallery/share/AlbumShareOperations$IncomingInvitation;->getAlbumName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v3, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :cond_5
    iget-object v2, p0, Lcom/miui/gallery/share/AlbumShareOperations$8;->val$resolver:Landroid/content/ContentResolver;

    iget-object v3, p0, Lcom/miui/gallery/share/AlbumShareOperations$8;->val$url:Ljava/lang/String;

    iget-object v4, p0, Lcom/miui/gallery/share/AlbumShareOperations$8;->val$mediaSet:Lcom/miui/gallery/share/CloudSharerMediaSet;

    invoke-static {v2, v3, v1, v4}, Lcom/miui/gallery/share/AlbumShareOperations;->access$800(Landroid/content/ContentResolver;Ljava/lang/String;Landroid/content/ContentValues;Lcom/miui/gallery/share/CloudSharerMediaSet;)V

    return-object v0

    :cond_6
    :goto_2
    const/16 v0, -0x3e8

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

    invoke-virtual {p0}, Lcom/miui/gallery/share/AlbumShareOperations$8;->call()Lcom/miui/gallery/share/AsyncResult;

    move-result-object v0

    return-object v0
.end method
