.class public Lorg/keyczar/SessionDecrypter;
.super Ljava/lang/Object;
.source "SessionDecrypter.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private final symmetricCrypter:Lorg/keyczar/Crypter;


# direct methods
.method public constructor <init>(Lorg/keyczar/Crypter;[B)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyczarException;
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1, p2}, Lorg/keyczar/Crypter;->decrypt([B)[B

    move-result-object p1

    invoke-static {p1}, Lorg/keyczar/AesKey;->fromPackedKey([B)Lorg/keyczar/AesKey;

    move-result-object p1

    new-instance p2, Lorg/keyczar/ImportedKeyReader;

    invoke-direct {p2, p1}, Lorg/keyczar/ImportedKeyReader;-><init>(Lorg/keyczar/AesKey;)V

    new-instance p1, Lorg/keyczar/Crypter;

    invoke-direct {p1, p2}, Lorg/keyczar/Crypter;-><init>(Lorg/keyczar/interfaces/KeyczarReader;)V

    iput-object p1, p0, Lorg/keyczar/SessionDecrypter;->symmetricCrypter:Lorg/keyczar/Crypter;

    return-void
.end method


# virtual methods
.method public decrypt([B)[B
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyczarException;
        }
    .end annotation

    iget-object v0, p0, Lorg/keyczar/SessionDecrypter;->symmetricCrypter:Lorg/keyczar/Crypter;

    invoke-virtual {v0, p1}, Lorg/keyczar/Crypter;->decrypt([B)[B

    move-result-object p1

    return-object p1
.end method
