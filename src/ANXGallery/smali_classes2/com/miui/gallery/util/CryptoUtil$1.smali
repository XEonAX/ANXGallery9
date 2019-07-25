.class final Lcom/miui/gallery/util/CryptoUtil$1;
.super Ljava/lang/Object;
.source "CryptoUtil.java"

# interfaces
.implements Lcom/miui/gallery/util/BaseDocumentProviderUtils$WriteHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/util/CryptoUtil;->encryptFile(Ljava/lang/String;Ljava/lang/String;[B)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/util/BaseDocumentProviderUtils$WriteHandler<",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$inputStream:Ljavax/crypto/CipherInputStream;


# direct methods
.method constructor <init>(Ljavax/crypto/CipherInputStream;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/util/CryptoUtil$1;->val$inputStream:Ljavax/crypto/CipherInputStream;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handle(Ljava/io/FileOutputStream;)Ljava/lang/Boolean;
    .locals 4

    const/16 v0, 0x400

    const/4 v1, 0x0

    :try_start_0
    new-array v0, v0, [B

    :goto_0
    iget-object v2, p0, Lcom/miui/gallery/util/CryptoUtil$1;->val$inputStream:Ljavax/crypto/CipherInputStream;

    invoke-virtual {v2, v0}, Ljavax/crypto/CipherInputStream;->read([B)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_0

    invoke-virtual {p1, v0, v1, v2}, Ljava/io/FileOutputStream;->write([BII)V

    goto :goto_0

    :cond_0
    const/4 p1, 0x1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    const-string v0, "CryptoUtil"

    invoke-static {v0, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic handle(Ljava/io/FileOutputStream;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/util/CryptoUtil$1;->handle(Ljava/io/FileOutputStream;)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method
