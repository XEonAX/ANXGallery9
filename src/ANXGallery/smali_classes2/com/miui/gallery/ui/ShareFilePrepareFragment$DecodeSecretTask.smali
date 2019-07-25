.class Lcom/miui/gallery/ui/ShareFilePrepareFragment$DecodeSecretTask;
.super Landroid/os/AsyncTask;
.source "ShareFilePrepareFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/ShareFilePrepareFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DecodeSecretTask"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/ShareFilePrepareFragment$DecodeSecretTask$DecodeSecretListener;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Integer;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field private mCacheFolder:Ljava/io/File;

.field private mDecodeSecretListener:Lcom/miui/gallery/ui/ShareFilePrepareFragment$DecodeSecretTask$DecodeSecretListener;

.field private mFinalUris:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/net/Uri;",
            ">;"
        }
    .end annotation
.end field

.field private mFormat:Ljava/text/SimpleDateFormat;

.field private mKeys:[[B

.field private mSecretIds:[J

.field private mUris:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/net/Uri;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/io/File;Ljava/util/List;[[B[JLcom/miui/gallery/ui/ShareFilePrepareFragment$DecodeSecretTask$DecodeSecretListener;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            "Ljava/util/List<",
            "Landroid/net/Uri;",
            ">;[[B[J",
            "Lcom/miui/gallery/ui/ShareFilePrepareFragment$DecodeSecretTask$DecodeSecretListener;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$DecodeSecretTask;->mFinalUris:Ljava/util/List;

    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyy-MM-dd_HH-mm-ss_SSS"

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$DecodeSecretTask;->mFormat:Ljava/text/SimpleDateFormat;

    iput-object p2, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$DecodeSecretTask;->mUris:Ljava/util/List;

    iput-object p3, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$DecodeSecretTask;->mKeys:[[B

    iput-object p4, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$DecodeSecretTask;->mSecretIds:[J

    iput-object p1, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$DecodeSecretTask;->mCacheFolder:Ljava/io/File;

    iput-object p5, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$DecodeSecretTask;->mDecodeSecretListener:Lcom/miui/gallery/ui/ShareFilePrepareFragment$DecodeSecretTask$DecodeSecretListener;

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/ShareFilePrepareFragment$DecodeSecretTask;->doInBackground([Ljava/lang/Void;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Void;
    .locals 12

    iget-object p1, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$DecodeSecretTask;->mFinalUris:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->clear()V

    const/4 p1, 0x0

    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$DecodeSecretTask;->mUris:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x0

    if-ge v0, v1, :cond_7

    invoke-virtual {p0}, Lcom/miui/gallery/ui/ShareFilePrepareFragment$DecodeSecretTask;->isCancelled()Z

    move-result v1

    if-eqz v1, :cond_0

    return-object v2

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$DecodeSecretTask;->mUris:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/miui/gallery/cloud/CloudUtils$SecretAlbumUtils;->isEncryptedVideoByPath(Ljava/lang/String;)Z

    move-result v2

    const/4 v9, 0x1

    if-eqz v2, :cond_1

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v8}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$DecodeSecretTask;->mKeys:[[B

    aget-object v2, v2, v0

    iget-object v3, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$DecodeSecretTask;->mSecretIds:[J

    aget-wide v4, v3, v0

    invoke-static {v1, v2, v4, v5}, Lcom/miui/gallery/util/SecretAlbumCryptoUtils;->decryptVideo2CacheFolder(Landroid/net/Uri;[BJ)Landroid/net/Uri;

    move-result-object v1

    if-eqz v1, :cond_6

    iget-object v2, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$DecodeSecretTask;->mFinalUris:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_3

    :cond_1
    invoke-static {v8}, Lcom/miui/gallery/cloud/CloudUtils$SecretAlbumUtils;->isUnencryptedVideoByPath(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_5

    invoke-static {v8}, Lcom/miui/gallery/cloud/CloudUtils$SecretAlbumUtils;->isUnencryptedImageByPath(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    goto :goto_2

    :cond_2
    new-instance v1, Ljava/io/File;

    iget-object v2, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$DecodeSecretTask;->mCacheFolder:Ljava/io/File;

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "%s.jpg"

    new-array v5, v9, [Ljava/lang/Object;

    iget-object v6, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$DecodeSecretTask;->mFormat:Ljava/text/SimpleDateFormat;

    new-instance v7, Ljava/util/Date;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    invoke-direct {v7, v10, v11}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v6, v7}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, p1

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v3

    iget-object v2, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$DecodeSecretTask;->mKeys:[[B

    aget-object v2, v2, v0

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$DecodeSecretTask;->mKeys:[[B

    aget-object v2, v2, v0

    invoke-static {v8, v3, p1, v2, p1}, Lcom/miui/gallery/cloud/CloudUtils$SecretAlbumUtils;->decryptFile(Ljava/lang/String;Ljava/lang/String;Z[BZ)Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    :cond_3
    const/4 v4, 0x0

    iget-object v2, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$DecodeSecretTask;->mSecretIds:[J

    aget-wide v5, v2, v0

    const/4 v7, 0x0

    move-object v2, v8

    invoke-static/range {v2 .. v7}, Lcom/miui/gallery/cloud/CloudUtils$SecretAlbumUtils;->decryptFile(Ljava/lang/String;Ljava/lang/String;ZJZ)Ljava/lang/String;

    move-result-object v2

    const-string v3, "ShareFilePrepareFragment"

    const-string v4, "decode %s and secret key is null"

    invoke-static {v3, v4, v8}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :goto_1
    if-eqz v2, :cond_4

    iget-object v2, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$DecodeSecretTask;->mFinalUris:Ljava/util/List;

    invoke-static {v1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const-string v2, "ShareFilePrepareFragment"

    const-string v3, "decode %s is success:%s"

    invoke-static {v2, v3, v8, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_3

    :cond_4
    const-string v1, "ShareFilePrepareFragment"

    const-string v2, "decode %s is failed"

    invoke-static {v1, v2, v8}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_3

    :cond_5
    :goto_2
    iget-object v2, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$DecodeSecretTask;->mFinalUris:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_6
    :goto_3
    new-array v1, v9, [Ljava/lang/Integer;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, p1

    invoke-virtual {p0, v1}, Lcom/miui/gallery/ui/ShareFilePrepareFragment$DecodeSecretTask;->publishProgress([Ljava/lang/Object;)V

    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_0

    :cond_7
    return-object v2
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/ShareFilePrepareFragment$DecodeSecretTask;->onPostExecute(Ljava/lang/Void;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/Void;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$DecodeSecretTask;->mDecodeSecretListener:Lcom/miui/gallery/ui/ShareFilePrepareFragment$DecodeSecretTask$DecodeSecretListener;

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/ShareFilePrepareFragment$DecodeSecretTask;->isCancelled()Z

    move-result p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$DecodeSecretTask;->mDecodeSecretListener:Lcom/miui/gallery/ui/ShareFilePrepareFragment$DecodeSecretTask$DecodeSecretListener;

    iget-object v0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$DecodeSecretTask;->mFinalUris:Ljava/util/List;

    invoke-interface {p1, v0}, Lcom/miui/gallery/ui/ShareFilePrepareFragment$DecodeSecretTask$DecodeSecretListener;->onEnd(Ljava/util/List;)V

    :cond_0
    return-void
.end method

.method protected varargs onProgressUpdate([Ljava/lang/Integer;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$DecodeSecretTask;->mDecodeSecretListener:Lcom/miui/gallery/ui/ShareFilePrepareFragment$DecodeSecretTask$DecodeSecretListener;

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    aget-object p1, p1, v0

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    add-int/lit8 p1, p1, 0x1

    iget-object v0, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$DecodeSecretTask;->mDecodeSecretListener:Lcom/miui/gallery/ui/ShareFilePrepareFragment$DecodeSecretTask$DecodeSecretListener;

    int-to-float p1, p1

    iget-object v1, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$DecodeSecretTask;->mUris:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    int-to-float v1, v1

    div-float/2addr p1, v1

    invoke-interface {v0, p1}, Lcom/miui/gallery/ui/ShareFilePrepareFragment$DecodeSecretTask$DecodeSecretListener;->onItemFinish(F)V

    :cond_0
    return-void
.end method

.method protected bridge synthetic onProgressUpdate([Ljava/lang/Object;)V
    .locals 0

    check-cast p1, [Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/ShareFilePrepareFragment$DecodeSecretTask;->onProgressUpdate([Ljava/lang/Integer;)V

    return-void
.end method
