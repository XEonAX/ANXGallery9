.class final Lcom/miui/gallery/util/CryptoUtil$2;
.super Ljava/lang/Object;
.source "CryptoUtil.java"

# interfaces
.implements Lcom/miui/gallery/util/BaseDocumentProviderUtils$WriteHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/util/CryptoUtil;->decryptFile(Ljava/lang/String;Ljava/lang/String;[B)Z
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
.field final synthetic val$cipher:Ljavax/crypto/Cipher;

.field final synthetic val$inputStream:Ljava/io/FileInputStream;


# direct methods
.method constructor <init>(Ljavax/crypto/Cipher;Ljava/io/FileInputStream;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/util/CryptoUtil$2;->val$cipher:Ljavax/crypto/Cipher;

    iput-object p2, p0, Lcom/miui/gallery/util/CryptoUtil$2;->val$inputStream:Ljava/io/FileInputStream;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handle(Ljava/io/FileOutputStream;)Ljava/lang/Boolean;
    .locals 4

    const/4 v0, 0x0

    const/4 v1, 0x0

    :try_start_0
    new-instance v2, Ljavax/crypto/CipherOutputStream;

    iget-object v3, p0, Lcom/miui/gallery/util/CryptoUtil$2;->val$cipher:Ljavax/crypto/Cipher;

    invoke-direct {v2, p1, v3}, Ljavax/crypto/CipherOutputStream;-><init>(Ljava/io/OutputStream;Ljavax/crypto/Cipher;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    const/16 p1, 0x400

    :try_start_1
    new-array p1, p1, [B

    :goto_0
    iget-object v1, p0, Lcom/miui/gallery/util/CryptoUtil$2;->val$inputStream:Ljava/io/FileInputStream;

    invoke-virtual {v1, p1}, Ljava/io/FileInputStream;->read([B)I

    move-result v1

    const/4 v3, -0x1

    if-eq v1, v3, :cond_0

    invoke-virtual {v2, p1, v0, v1}, Ljavax/crypto/CipherOutputStream;->write([BII)V

    goto :goto_0

    :cond_0
    const/4 p1, 0x1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-static {v2}, Lcom/miui/gallery/util/BaseMiscUtil;->closeSilently(Ljava/io/Closeable;)V

    return-object p1

    :catchall_0
    move-exception p1

    move-object v1, v2

    goto :goto_2

    :catch_0
    move-exception p1

    move-object v1, v2

    goto :goto_1

    :catchall_1
    move-exception p1

    goto :goto_2

    :catch_1
    move-exception p1

    :goto_1
    :try_start_2
    const-string v2, "CryptoUtil"

    invoke-static {v2, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    invoke-static {v1}, Lcom/miui/gallery/util/BaseMiscUtil;->closeSilently(Ljava/io/Closeable;)V

    return-object p1

    :goto_2
    invoke-static {v1}, Lcom/miui/gallery/util/BaseMiscUtil;->closeSilently(Ljava/io/Closeable;)V

    throw p1
.end method

.method public bridge synthetic handle(Ljava/io/FileOutputStream;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/util/CryptoUtil$2;->handle(Ljava/io/FileOutputStream;)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method
