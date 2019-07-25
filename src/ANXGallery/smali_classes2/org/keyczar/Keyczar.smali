.class public abstract Lorg/keyczar/Keyczar;
.super Ljava/lang/Object;
.source "Keyczar.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/keyczar/Keyczar$KeyHash;
    }
.end annotation


# static fields
.field public static final DEFAULT_ENCODING:Ljava/lang/String; = "UTF-8"

.field public static final FORMAT_BYTES:[B

.field public static final FORMAT_VERSION:B = 0x0t

.field public static final HEADER_SIZE:I = 0x5

.field public static final KEY_HASH_SIZE:I = 0x4


# instance fields
.field final hashMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Lorg/keyczar/Keyczar$KeyHash;",
            "Lorg/keyczar/KeyczarKey;",
            ">;"
        }
    .end annotation
.end field

.field final kmd:Lorg/keyczar/KeyMetadata;

.field primaryVersion:Lorg/keyczar/KeyVersion;

.field final versionMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Lorg/keyczar/KeyVersion;",
            "Lorg/keyczar/KeyczarKey;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const/4 v0, 0x1

    new-array v0, v0, [B

    const/4 v1, 0x0

    aput-byte v1, v0, v1

    sput-object v0, Lorg/keyczar/Keyczar;->FORMAT_BYTES:[B

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyczarException;
        }
    .end annotation

    new-instance v0, Lorg/keyczar/KeyczarFileReader;

    invoke-direct {v0, p1}, Lorg/keyczar/KeyczarFileReader;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lorg/keyczar/Keyczar;-><init>(Lorg/keyczar/interfaces/KeyczarReader;)V

    return-void
.end method

.method public constructor <init>(Lorg/keyczar/interfaces/KeyczarReader;)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyczarException;
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/keyczar/Keyczar;->versionMap:Ljava/util/HashMap;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/keyczar/Keyczar;->hashMap:Ljava/util/HashMap;

    invoke-interface {p1}, Lorg/keyczar/interfaces/KeyczarReader;->getMetadata()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/keyczar/KeyMetadata;->read(Ljava/lang/String;)Lorg/keyczar/KeyMetadata;

    move-result-object v0

    iput-object v0, p0, Lorg/keyczar/Keyczar;->kmd:Lorg/keyczar/KeyMetadata;

    iget-object v0, p0, Lorg/keyczar/Keyczar;->kmd:Lorg/keyczar/KeyMetadata;

    invoke-virtual {v0}, Lorg/keyczar/KeyMetadata;->getPurpose()Lorg/keyczar/enums/KeyPurpose;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/keyczar/Keyczar;->isAcceptablePurpose(Lorg/keyczar/enums/KeyPurpose;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_5

    iget-object v0, p0, Lorg/keyczar/Keyczar;->kmd:Lorg/keyczar/KeyMetadata;

    invoke-virtual {v0}, Lorg/keyczar/KeyMetadata;->isEncrypted()Z

    move-result v0

    if-eqz v0, :cond_1

    instance-of v0, p1, Lorg/keyczar/interfaces/EncryptedReader;

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    new-instance p1, Lorg/keyczar/exceptions/KeyczarException;

    new-array v0, v1, [Ljava/lang/Object;

    const-string v1, "Keyczar.NeedEncryptedReader"

    invoke-static {v1, v0}, Lorg/keyczar/i18n/Messages;->getString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Lorg/keyczar/exceptions/KeyczarException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    :goto_0
    iget-object v0, p0, Lorg/keyczar/Keyczar;->kmd:Lorg/keyczar/KeyMetadata;

    invoke-virtual {v0}, Lorg/keyczar/KeyMetadata;->getVersions()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/keyczar/KeyVersion;

    invoke-virtual {v2}, Lorg/keyczar/KeyVersion;->getStatus()Lorg/keyczar/enums/KeyStatus;

    move-result-object v3

    sget-object v4, Lorg/keyczar/enums/KeyStatus;->PRIMARY:Lorg/keyczar/enums/KeyStatus;

    if-ne v3, v4, :cond_3

    iget-object v3, p0, Lorg/keyczar/Keyczar;->primaryVersion:Lorg/keyczar/KeyVersion;

    if-nez v3, :cond_2

    iput-object v2, p0, Lorg/keyczar/Keyczar;->primaryVersion:Lorg/keyczar/KeyVersion;

    goto :goto_2

    :cond_2
    new-instance p1, Lorg/keyczar/exceptions/KeyczarException;

    new-array v0, v1, [Ljava/lang/Object;

    const-string v1, "Keyczar.SinglePrimary"

    invoke-static {v1, v0}, Lorg/keyczar/i18n/Messages;->getString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Lorg/keyczar/exceptions/KeyczarException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_3
    :goto_2
    iget-object v3, p0, Lorg/keyczar/Keyczar;->kmd:Lorg/keyczar/KeyMetadata;

    invoke-virtual {v3}, Lorg/keyczar/KeyMetadata;->getType()Lorg/keyczar/interfaces/KeyType;

    move-result-object v3

    invoke-virtual {v2}, Lorg/keyczar/KeyVersion;->getVersionNumber()I

    move-result v4

    invoke-interface {p1, v4}, Lorg/keyczar/interfaces/KeyczarReader;->getKey(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lorg/keyczar/KeyczarKey;->readKey(Lorg/keyczar/interfaces/KeyType;Ljava/lang/String;)Lorg/keyczar/KeyczarKey;

    move-result-object v3

    iget-object v4, p0, Lorg/keyczar/Keyczar;->hashMap:Ljava/util/HashMap;

    new-instance v5, Lorg/keyczar/Keyczar$KeyHash;

    invoke-virtual {v3}, Lorg/keyczar/KeyczarKey;->hash()[B

    move-result-object v6

    const/4 v7, 0x0

    invoke-direct {v5, p0, v6, v7}, Lorg/keyczar/Keyczar$KeyHash;-><init>(Lorg/keyczar/Keyczar;[BLorg/keyczar/Keyczar$1;)V

    invoke-virtual {v4, v5, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v4, p0, Lorg/keyczar/Keyczar;->versionMap:Ljava/util/HashMap;

    invoke-virtual {v4, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    :cond_4
    return-void

    :cond_5
    new-instance p1, Lorg/keyczar/exceptions/KeyczarException;

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    iget-object v2, p0, Lorg/keyczar/Keyczar;->kmd:Lorg/keyczar/KeyMetadata;

    invoke-virtual {v2}, Lorg/keyczar/KeyMetadata;->getPurpose()Lorg/keyczar/enums/KeyPurpose;

    move-result-object v2

    aput-object v2, v0, v1

    const-string v1, "Keyczar.UnacceptablePurpose"

    invoke-static {v1, v0}, Lorg/keyczar/i18n/Messages;->getString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Lorg/keyczar/exceptions/KeyczarException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method addKey(Lorg/keyczar/KeyVersion;Lorg/keyczar/KeyczarKey;)V
    .locals 4

    iget-object v0, p0, Lorg/keyczar/Keyczar;->hashMap:Ljava/util/HashMap;

    new-instance v1, Lorg/keyczar/Keyczar$KeyHash;

    invoke-virtual {p2}, Lorg/keyczar/KeyczarKey;->hash()[B

    move-result-object v2

    const/4 v3, 0x0

    invoke-direct {v1, p0, v2, v3}, Lorg/keyczar/Keyczar$KeyHash;-><init>(Lorg/keyczar/Keyczar;[BLorg/keyczar/Keyczar$1;)V

    invoke-virtual {v0, v1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lorg/keyczar/Keyczar;->versionMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p2, p0, Lorg/keyczar/Keyczar;->kmd:Lorg/keyczar/KeyMetadata;

    invoke-virtual {p2, p1}, Lorg/keyczar/KeyMetadata;->addVersion(Lorg/keyczar/KeyVersion;)Z

    return-void
.end method

.method getKey([B)Lorg/keyczar/KeyczarKey;
    .locals 3

    iget-object v0, p0, Lorg/keyczar/Keyczar;->hashMap:Ljava/util/HashMap;

    new-instance v1, Lorg/keyczar/Keyczar$KeyHash;

    const/4 v2, 0x0

    invoke-direct {v1, p0, p1, v2}, Lorg/keyczar/Keyczar$KeyHash;-><init>(Lorg/keyczar/Keyczar;[BLorg/keyczar/Keyczar$1;)V

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/keyczar/KeyczarKey;

    return-object p1
.end method

.method getPrimaryKey()Lorg/keyczar/KeyczarKey;
    .locals 2

    iget-object v0, p0, Lorg/keyczar/Keyczar;->primaryVersion:Lorg/keyczar/KeyVersion;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/keyczar/Keyczar;->versionMap:Ljava/util/HashMap;

    iget-object v1, p0, Lorg/keyczar/Keyczar;->primaryVersion:Lorg/keyczar/KeyVersion;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/keyczar/KeyczarKey;

    return-object v0
.end method

.method abstract isAcceptablePurpose(Lorg/keyczar/enums/KeyPurpose;)Z
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lorg/keyczar/Keyczar;->kmd:Lorg/keyczar/KeyMetadata;

    invoke-virtual {v0}, Lorg/keyczar/KeyMetadata;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
