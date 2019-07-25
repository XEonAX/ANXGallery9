.class public Lorg/keyczar/ImportedKeyReader;
.super Ljava/lang/Object;
.source "ImportedKeyReader.java"

# interfaces
.implements Lorg/keyczar/interfaces/KeyczarReader;


# annotations
.annotation build Lorg/keyczar/annotations/Experimental;
.end annotation


# instance fields
.field private final keys:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/keyczar/KeyczarKey;",
            ">;"
        }
    .end annotation
.end field

.field private final metadata:Lorg/keyczar/KeyMetadata;


# direct methods
.method constructor <init>(Lorg/keyczar/AesKey;)V
    .locals 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lorg/keyczar/KeyMetadata;

    const-string v1, "Imported AES"

    sget-object v2, Lorg/keyczar/enums/KeyPurpose;->DECRYPT_AND_ENCRYPT:Lorg/keyczar/enums/KeyPurpose;

    sget-object v3, Lorg/keyczar/DefaultKeyType;->AES:Lorg/keyczar/DefaultKeyType;

    invoke-direct {v0, v1, v2, v3}, Lorg/keyczar/KeyMetadata;-><init>(Ljava/lang/String;Lorg/keyczar/enums/KeyPurpose;Lorg/keyczar/interfaces/KeyType;)V

    iput-object v0, p0, Lorg/keyczar/ImportedKeyReader;->metadata:Lorg/keyczar/KeyMetadata;

    new-instance v0, Lorg/keyczar/KeyVersion;

    sget-object v1, Lorg/keyczar/enums/KeyStatus;->PRIMARY:Lorg/keyczar/enums/KeyStatus;

    const/4 v2, 0x0

    invoke-direct {v0, v2, v1, v2}, Lorg/keyczar/KeyVersion;-><init>(ILorg/keyczar/enums/KeyStatus;Z)V

    iget-object v1, p0, Lorg/keyczar/ImportedKeyReader;->metadata:Lorg/keyczar/KeyMetadata;

    invoke-virtual {v1, v0}, Lorg/keyczar/KeyMetadata;->addVersion(Lorg/keyczar/KeyVersion;)Z

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/keyczar/ImportedKeyReader;->keys:Ljava/util/List;

    iget-object v0, p0, Lorg/keyczar/ImportedKeyReader;->keys:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method constructor <init>(Lorg/keyczar/HmacKey;)V
    .locals 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lorg/keyczar/KeyMetadata;

    const-string v1, "Imported HMAC"

    sget-object v2, Lorg/keyczar/enums/KeyPurpose;->SIGN_AND_VERIFY:Lorg/keyczar/enums/KeyPurpose;

    sget-object v3, Lorg/keyczar/DefaultKeyType;->HMAC_SHA1:Lorg/keyczar/DefaultKeyType;

    invoke-direct {v0, v1, v2, v3}, Lorg/keyczar/KeyMetadata;-><init>(Ljava/lang/String;Lorg/keyczar/enums/KeyPurpose;Lorg/keyczar/interfaces/KeyType;)V

    iput-object v0, p0, Lorg/keyczar/ImportedKeyReader;->metadata:Lorg/keyczar/KeyMetadata;

    new-instance v0, Lorg/keyczar/KeyVersion;

    sget-object v1, Lorg/keyczar/enums/KeyStatus;->PRIMARY:Lorg/keyczar/enums/KeyStatus;

    const/4 v2, 0x0

    invoke-direct {v0, v2, v1, v2}, Lorg/keyczar/KeyVersion;-><init>(ILorg/keyczar/enums/KeyStatus;Z)V

    iget-object v1, p0, Lorg/keyczar/ImportedKeyReader;->metadata:Lorg/keyczar/KeyMetadata;

    invoke-virtual {v1, v0}, Lorg/keyczar/KeyMetadata;->addVersion(Lorg/keyczar/KeyVersion;)Z

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/keyczar/ImportedKeyReader;->keys:Ljava/util/List;

    iget-object v0, p0, Lorg/keyczar/ImportedKeyReader;->keys:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method constructor <init>(Lorg/keyczar/KeyMetadata;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/keyczar/KeyMetadata;",
            "Ljava/util/List<",
            "Lorg/keyczar/KeyczarKey;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/keyczar/ImportedKeyReader;->metadata:Lorg/keyczar/KeyMetadata;

    iput-object p2, p0, Lorg/keyczar/ImportedKeyReader;->keys:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public getKey()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyczarException;
        }
    .end annotation

    invoke-virtual {p0}, Lorg/keyczar/ImportedKeyReader;->getMetadata()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/keyczar/KeyMetadata;->read(Ljava/lang/String;)Lorg/keyczar/KeyMetadata;

    move-result-object v0

    invoke-virtual {v0}, Lorg/keyczar/KeyMetadata;->getPrimaryVersion()Lorg/keyczar/KeyVersion;

    move-result-object v0

    invoke-virtual {v0}, Lorg/keyczar/KeyVersion;->getVersionNumber()I

    move-result v0

    invoke-virtual {p0, v0}, Lorg/keyczar/ImportedKeyReader;->getKey(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getKey(I)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lorg/keyczar/ImportedKeyReader;->keys:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/keyczar/KeyczarKey;

    invoke-virtual {p1}, Lorg/keyczar/KeyczarKey;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getMetadata()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lorg/keyczar/ImportedKeyReader;->metadata:Lorg/keyczar/KeyMetadata;

    invoke-virtual {v0}, Lorg/keyczar/KeyMetadata;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
