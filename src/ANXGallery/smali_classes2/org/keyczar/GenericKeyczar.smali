.class public Lorg/keyczar/GenericKeyczar;
.super Lorg/keyczar/Keyczar;
.source "GenericKeyczar.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyczarException;
        }
    .end annotation

    invoke-direct {p0, p1}, Lorg/keyczar/Keyczar;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Lorg/keyczar/interfaces/KeyczarReader;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyczarException;
        }
    .end annotation

    invoke-direct {p0, p1}, Lorg/keyczar/Keyczar;-><init>(Lorg/keyczar/interfaces/KeyczarReader;)V

    return-void
.end method

.method private numVersions()I
    .locals 1

    iget-object v0, p0, Lorg/keyczar/GenericKeyczar;->versionMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result v0

    return v0
.end method


# virtual methods
.method public addVersion(Lorg/keyczar/enums/KeyStatus;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyczarException;
        }
    .end annotation

    iget-object v0, p0, Lorg/keyczar/GenericKeyczar;->kmd:Lorg/keyczar/KeyMetadata;

    invoke-virtual {v0}, Lorg/keyczar/KeyMetadata;->getType()Lorg/keyczar/interfaces/KeyType;

    move-result-object v0

    invoke-interface {v0}, Lorg/keyczar/interfaces/KeyType;->defaultSize()I

    move-result v0

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1, v0}, Lorg/keyczar/GenericKeyczar;->addVersion(Lorg/keyczar/enums/KeyStatus;Lorg/keyczar/enums/RsaPadding;I)V

    return-void
.end method

.method public addVersion(Lorg/keyczar/enums/KeyStatus;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyczarException;
        }
    .end annotation

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, p2}, Lorg/keyczar/GenericKeyczar;->addVersion(Lorg/keyczar/enums/KeyStatus;Lorg/keyczar/enums/RsaPadding;I)V

    return-void
.end method

.method public addVersion(Lorg/keyczar/enums/KeyStatus;Lorg/keyczar/KeyczarKey;)V
    .locals 3

    new-instance v0, Lorg/keyczar/KeyVersion;

    invoke-direct {p0}, Lorg/keyczar/GenericKeyczar;->numVersions()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    const/4 v2, 0x0

    invoke-direct {v0, v1, p1, v2}, Lorg/keyczar/KeyVersion;-><init>(ILorg/keyczar/enums/KeyStatus;Z)V

    sget-object v1, Lorg/keyczar/enums/KeyStatus;->PRIMARY:Lorg/keyczar/enums/KeyStatus;

    if-ne p1, v1, :cond_1

    iget-object p1, p0, Lorg/keyczar/GenericKeyczar;->primaryVersion:Lorg/keyczar/KeyVersion;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lorg/keyczar/GenericKeyczar;->primaryVersion:Lorg/keyczar/KeyVersion;

    sget-object v1, Lorg/keyczar/enums/KeyStatus;->ACTIVE:Lorg/keyczar/enums/KeyStatus;

    invoke-virtual {p1, v1}, Lorg/keyczar/KeyVersion;->setStatus(Lorg/keyczar/enums/KeyStatus;)V

    :cond_0
    iput-object v0, p0, Lorg/keyczar/GenericKeyczar;->primaryVersion:Lorg/keyczar/KeyVersion;

    :cond_1
    invoke-virtual {p0, v0, p2}, Lorg/keyczar/GenericKeyczar;->addKey(Lorg/keyczar/KeyVersion;Lorg/keyczar/KeyczarKey;)V

    return-void
.end method

.method public addVersion(Lorg/keyczar/enums/KeyStatus;Lorg/keyczar/enums/RsaPadding;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyczarException;
        }
    .end annotation

    iget-object v0, p0, Lorg/keyczar/GenericKeyczar;->kmd:Lorg/keyczar/KeyMetadata;

    invoke-virtual {v0}, Lorg/keyczar/KeyMetadata;->getType()Lorg/keyczar/interfaces/KeyType;

    move-result-object v0

    invoke-interface {v0}, Lorg/keyczar/interfaces/KeyType;->defaultSize()I

    move-result v0

    invoke-virtual {p0, p1, p2, v0}, Lorg/keyczar/GenericKeyczar;->addVersion(Lorg/keyczar/enums/KeyStatus;Lorg/keyczar/enums/RsaPadding;I)V

    return-void
.end method

.method public addVersion(Lorg/keyczar/enums/KeyStatus;Lorg/keyczar/enums/RsaPadding;I)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyczarException;
        }
    .end annotation

    :cond_0
    iget-object v0, p0, Lorg/keyczar/GenericKeyczar;->kmd:Lorg/keyczar/KeyMetadata;

    invoke-virtual {v0}, Lorg/keyczar/KeyMetadata;->getType()Lorg/keyczar/interfaces/KeyType;

    move-result-object v0

    invoke-static {v0, p2, p3}, Lorg/keyczar/KeyczarKey;->genKey(Lorg/keyczar/interfaces/KeyType;Lorg/keyczar/enums/RsaPadding;I)Lorg/keyczar/KeyczarKey;

    move-result-object v0

    invoke-virtual {v0}, Lorg/keyczar/KeyczarKey;->hash()[B

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/keyczar/GenericKeyczar;->getKey([B)Lorg/keyczar/KeyczarKey;

    move-result-object v1

    if-nez v1, :cond_0

    invoke-virtual {p0, p1, v0}, Lorg/keyczar/GenericKeyczar;->addVersion(Lorg/keyczar/enums/KeyStatus;Lorg/keyczar/KeyczarKey;)V

    return-void
.end method

.method public demote(I)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyczarException;
        }
    .end annotation

    invoke-virtual {p0, p1}, Lorg/keyczar/GenericKeyczar;->getVersion(I)Lorg/keyczar/KeyVersion;

    move-result-object p1

    sget-object v0, Lorg/keyczar/GenericKeyczar$1;->$SwitchMap$org$keyczar$enums$KeyStatus:[I

    invoke-virtual {p1}, Lorg/keyczar/KeyVersion;->getStatus()Lorg/keyczar/enums/KeyStatus;

    move-result-object v1

    invoke-virtual {v1}, Lorg/keyczar/enums/KeyStatus;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    new-instance p1, Lorg/keyczar/exceptions/KeyczarException;

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "Keyczar.CantDemoteScheduled"

    invoke-static {v1, v0}, Lorg/keyczar/i18n/Messages;->getString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Lorg/keyczar/exceptions/KeyczarException;-><init>(Ljava/lang/String;)V

    throw p1

    :pswitch_1
    sget-object v0, Lorg/keyczar/enums/KeyStatus;->INACTIVE:Lorg/keyczar/enums/KeyStatus;

    invoke-virtual {p1, v0}, Lorg/keyczar/KeyVersion;->setStatus(Lorg/keyczar/enums/KeyStatus;)V

    goto :goto_0

    :pswitch_2
    sget-object v0, Lorg/keyczar/enums/KeyStatus;->ACTIVE:Lorg/keyczar/enums/KeyStatus;

    invoke-virtual {p1, v0}, Lorg/keyczar/KeyVersion;->setStatus(Lorg/keyczar/enums/KeyStatus;)V

    const/4 p1, 0x0

    iput-object p1, p0, Lorg/keyczar/GenericKeyczar;->primaryVersion:Lorg/keyczar/KeyVersion;

    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getKey(Lorg/keyczar/KeyVersion;)Lorg/keyczar/KeyczarKey;
    .locals 1

    iget-object v0, p0, Lorg/keyczar/GenericKeyczar;->versionMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/keyczar/KeyczarKey;

    return-object p1
.end method

.method public getMetadata()Lorg/keyczar/KeyMetadata;
    .locals 1

    iget-object v0, p0, Lorg/keyczar/GenericKeyczar;->kmd:Lorg/keyczar/KeyMetadata;

    return-object v0
.end method

.method public getVersion(I)Lorg/keyczar/KeyVersion;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyczarException;
        }
    .end annotation

    iget-object v0, p0, Lorg/keyczar/GenericKeyczar;->kmd:Lorg/keyczar/KeyMetadata;

    invoke-virtual {v0, p1}, Lorg/keyczar/KeyMetadata;->getVersion(I)Lorg/keyczar/KeyVersion;

    move-result-object v0

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    new-instance v0, Lorg/keyczar/exceptions/KeyczarException;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v1, v2

    const-string p1, "Keyczar.NoSuchVersion"

    invoke-static {p1, v1}, Lorg/keyczar/i18n/Messages;->getString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lorg/keyczar/exceptions/KeyczarException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getVersions()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Lorg/keyczar/KeyVersion;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lorg/keyczar/GenericKeyczar;->versionMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public isAcceptablePurpose(Lorg/keyczar/enums/KeyPurpose;)Z
    .locals 0

    const/4 p1, 0x1

    return p1
.end method

.method public promote(I)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyczarException;
        }
    .end annotation

    invoke-virtual {p0, p1}, Lorg/keyczar/GenericKeyczar;->getVersion(I)Lorg/keyczar/KeyVersion;

    move-result-object p1

    sget-object v0, Lorg/keyczar/GenericKeyczar$1;->$SwitchMap$org$keyczar$enums$KeyStatus:[I

    invoke-virtual {p1}, Lorg/keyczar/KeyVersion;->getStatus()Lorg/keyczar/enums/KeyStatus;

    move-result-object v1

    invoke-virtual {v1}, Lorg/keyczar/enums/KeyStatus;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    sget-object v0, Lorg/keyczar/enums/KeyStatus;->ACTIVE:Lorg/keyczar/enums/KeyStatus;

    invoke-virtual {p1, v0}, Lorg/keyczar/KeyVersion;->setStatus(Lorg/keyczar/enums/KeyStatus;)V

    goto :goto_0

    :pswitch_1
    sget-object v0, Lorg/keyczar/enums/KeyStatus;->PRIMARY:Lorg/keyczar/enums/KeyStatus;

    invoke-virtual {p1, v0}, Lorg/keyczar/KeyVersion;->setStatus(Lorg/keyczar/enums/KeyStatus;)V

    iget-object v0, p0, Lorg/keyczar/GenericKeyczar;->primaryVersion:Lorg/keyczar/KeyVersion;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/keyczar/GenericKeyczar;->primaryVersion:Lorg/keyczar/KeyVersion;

    sget-object v1, Lorg/keyczar/enums/KeyStatus;->ACTIVE:Lorg/keyczar/enums/KeyStatus;

    invoke-virtual {v0, v1}, Lorg/keyczar/KeyVersion;->setStatus(Lorg/keyczar/enums/KeyStatus;)V

    :cond_0
    iput-object p1, p0, Lorg/keyczar/GenericKeyczar;->primaryVersion:Lorg/keyczar/KeyVersion;

    goto :goto_0

    :pswitch_2
    new-instance p1, Lorg/keyczar/exceptions/KeyczarException;

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "Keyczar.CantPromotePrimary"

    invoke-static {v1, v0}, Lorg/keyczar/i18n/Messages;->getString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Lorg/keyczar/exceptions/KeyczarException;-><init>(Ljava/lang/String;)V

    throw p1

    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method publicKeyExport(Ljava/lang/String;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyczarException;
        }
    .end annotation

    if-eqz p1, :cond_0

    sget-object v0, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object p1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :cond_0
    invoke-virtual {p0}, Lorg/keyczar/GenericKeyczar;->getMetadata()Lorg/keyczar/KeyMetadata;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0}, Lorg/keyczar/KeyMetadata;->getType()Lorg/keyczar/interfaces/KeyType;

    move-result-object v2

    sget-object v3, Lorg/keyczar/DefaultKeyType;->DSA_PRIV:Lorg/keyczar/DefaultKeyType;

    if-ne v2, v3, :cond_1

    invoke-virtual {v0}, Lorg/keyczar/KeyMetadata;->getPurpose()Lorg/keyczar/enums/KeyPurpose;

    move-result-object v2

    sget-object v3, Lorg/keyczar/enums/KeyPurpose;->SIGN_AND_VERIFY:Lorg/keyczar/enums/KeyPurpose;

    if-ne v2, v3, :cond_2

    new-instance v1, Lorg/keyczar/KeyMetadata;

    invoke-virtual {v0}, Lorg/keyczar/KeyMetadata;->getName()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lorg/keyczar/enums/KeyPurpose;->VERIFY:Lorg/keyczar/enums/KeyPurpose;

    sget-object v4, Lorg/keyczar/DefaultKeyType;->DSA_PUB:Lorg/keyczar/DefaultKeyType;

    invoke-direct {v1, v2, v3, v4}, Lorg/keyczar/KeyMetadata;-><init>(Ljava/lang/String;Lorg/keyczar/enums/KeyPurpose;Lorg/keyczar/interfaces/KeyType;)V

    goto :goto_0

    :cond_1
    invoke-virtual {v0}, Lorg/keyczar/KeyMetadata;->getType()Lorg/keyczar/interfaces/KeyType;

    move-result-object v2

    sget-object v3, Lorg/keyczar/DefaultKeyType;->RSA_PRIV:Lorg/keyczar/DefaultKeyType;

    if-ne v2, v3, :cond_2

    sget-object v2, Lorg/keyczar/GenericKeyczar$1;->$SwitchMap$org$keyczar$enums$KeyPurpose:[I

    invoke-virtual {v0}, Lorg/keyczar/KeyMetadata;->getPurpose()Lorg/keyczar/enums/KeyPurpose;

    move-result-object v3

    invoke-virtual {v3}, Lorg/keyczar/enums/KeyPurpose;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    new-instance v1, Lorg/keyczar/KeyMetadata;

    invoke-virtual {v0}, Lorg/keyczar/KeyMetadata;->getName()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lorg/keyczar/enums/KeyPurpose;->VERIFY:Lorg/keyczar/enums/KeyPurpose;

    sget-object v4, Lorg/keyczar/DefaultKeyType;->RSA_PUB:Lorg/keyczar/DefaultKeyType;

    invoke-direct {v1, v2, v3, v4}, Lorg/keyczar/KeyMetadata;-><init>(Ljava/lang/String;Lorg/keyczar/enums/KeyPurpose;Lorg/keyczar/interfaces/KeyType;)V

    goto :goto_0

    :pswitch_1
    new-instance v1, Lorg/keyczar/KeyMetadata;

    invoke-virtual {v0}, Lorg/keyczar/KeyMetadata;->getName()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lorg/keyczar/enums/KeyPurpose;->ENCRYPT:Lorg/keyczar/enums/KeyPurpose;

    sget-object v4, Lorg/keyczar/DefaultKeyType;->RSA_PUB:Lorg/keyczar/DefaultKeyType;

    invoke-direct {v1, v2, v3, v4}, Lorg/keyczar/KeyMetadata;-><init>(Ljava/lang/String;Lorg/keyczar/enums/KeyPurpose;Lorg/keyczar/interfaces/KeyType;)V

    :cond_2
    :goto_0
    if-eqz v1, :cond_6

    invoke-virtual {p0}, Lorg/keyczar/GenericKeyczar;->getVersions()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/keyczar/KeyVersion;

    invoke-virtual {p0, v2}, Lorg/keyczar/GenericKeyczar;->getKey(Lorg/keyczar/KeyVersion;)Lorg/keyczar/KeyczarKey;

    move-result-object v3

    check-cast v3, Lorg/keyczar/KeyczarPrivateKey;

    invoke-interface {v3}, Lorg/keyczar/KeyczarPrivateKey;->getPublic()Lorg/keyczar/KeyczarPublicKey;

    move-result-object v3

    invoke-static {}, Lorg/keyczar/KeyczarTool;->getMock()Lorg/keyczar/MockKeyczarReader;

    move-result-object v4

    if-nez v4, :cond_3

    invoke-virtual {v3}, Lorg/keyczar/KeyczarKey;->toString()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Lorg/keyczar/KeyVersion;->getVersionNumber()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v3, v4}, Lorg/keyczar/GenericKeyczar;->writeFile(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    :cond_3
    invoke-static {}, Lorg/keyczar/KeyczarTool;->getMock()Lorg/keyczar/MockKeyczarReader;

    move-result-object v4

    invoke-virtual {v2}, Lorg/keyczar/KeyVersion;->getVersionNumber()I

    move-result v5

    invoke-virtual {v4, v5, v3}, Lorg/keyczar/MockKeyczarReader;->setPublicKey(ILorg/keyczar/KeyczarKey;)V

    :goto_2
    invoke-virtual {v1, v2}, Lorg/keyczar/KeyMetadata;->addVersion(Lorg/keyczar/KeyVersion;)Z

    goto :goto_1

    :cond_4
    invoke-static {}, Lorg/keyczar/KeyczarTool;->getMock()Lorg/keyczar/MockKeyczarReader;

    move-result-object v0

    if-nez v0, :cond_5

    invoke-virtual {v1}, Lorg/keyczar/KeyMetadata;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "meta"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lorg/keyczar/GenericKeyczar;->writeFile(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3

    :cond_5
    invoke-static {}, Lorg/keyczar/KeyczarTool;->getMock()Lorg/keyczar/MockKeyczarReader;

    move-result-object p1

    invoke-virtual {p1, v1}, Lorg/keyczar/MockKeyczarReader;->setPublicKeyMetadata(Lorg/keyczar/KeyMetadata;)V

    :goto_3
    return-void

    :cond_6
    new-instance p1, Lorg/keyczar/exceptions/KeyczarException;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-virtual {v0}, Lorg/keyczar/KeyMetadata;->getType()Lorg/keyczar/interfaces/KeyType;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-virtual {v0}, Lorg/keyczar/KeyMetadata;->getPurpose()Lorg/keyczar/enums/KeyPurpose;

    move-result-object v0

    aput-object v0, v1, v2

    const-string v0, "KeyczarTool.CannotExportPubKey"

    invoke-static {v0, v1}, Lorg/keyczar/i18n/Messages;->getString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Lorg/keyczar/exceptions/KeyczarException;-><init>(Ljava/lang/String;)V

    throw p1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public revoke(I)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyczarException;
        }
    .end annotation

    invoke-virtual {p0, p1}, Lorg/keyczar/GenericKeyczar;->getVersion(I)Lorg/keyczar/KeyVersion;

    move-result-object v0

    invoke-virtual {v0}, Lorg/keyczar/KeyVersion;->getStatus()Lorg/keyczar/enums/KeyStatus;

    move-result-object v0

    sget-object v1, Lorg/keyczar/enums/KeyStatus;->INACTIVE:Lorg/keyczar/enums/KeyStatus;

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lorg/keyczar/GenericKeyczar;->kmd:Lorg/keyczar/KeyMetadata;

    invoke-virtual {v0, p1}, Lorg/keyczar/KeyMetadata;->removeVersion(I)Z

    return-void

    :cond_0
    new-instance p1, Lorg/keyczar/exceptions/KeyczarException;

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "Keyczar.CantRevoke"

    invoke-static {v1, v0}, Lorg/keyczar/i18n/Messages;->getString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Lorg/keyczar/exceptions/KeyczarException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method write(Ljava/lang/String;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyczarException;
        }
    .end annotation

    iget-object v0, p0, Lorg/keyczar/GenericKeyczar;->kmd:Lorg/keyczar/KeyMetadata;

    invoke-virtual {v0}, Lorg/keyczar/KeyMetadata;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "meta"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/keyczar/GenericKeyczar;->writeFile(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lorg/keyczar/GenericKeyczar;->getVersions()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/keyczar/KeyVersion;

    invoke-virtual {p0, v1}, Lorg/keyczar/GenericKeyczar;->getKey(Lorg/keyczar/KeyVersion;)Lorg/keyczar/KeyczarKey;

    move-result-object v2

    invoke-virtual {v2}, Lorg/keyczar/KeyczarKey;->toString()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Lorg/keyczar/KeyVersion;->getVersionNumber()I

    move-result v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v2, v1}, Lorg/keyczar/GenericKeyczar;->writeFile(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method writeEncrypted(Ljava/lang/String;Lorg/keyczar/Encrypter;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyczarException;
        }
    .end annotation

    invoke-virtual {p0}, Lorg/keyczar/GenericKeyczar;->getMetadata()Lorg/keyczar/KeyMetadata;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lorg/keyczar/KeyMetadata;->setEncrypted(Z)V

    invoke-virtual {v0}, Lorg/keyczar/KeyMetadata;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "meta"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/keyczar/GenericKeyczar;->writeFile(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lorg/keyczar/GenericKeyczar;->getVersions()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/keyczar/KeyVersion;

    invoke-virtual {p0, v1}, Lorg/keyczar/GenericKeyczar;->getKey(Lorg/keyczar/KeyVersion;)Lorg/keyczar/KeyczarKey;

    move-result-object v2

    invoke-virtual {v2}, Lorg/keyczar/KeyczarKey;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v2}, Lorg/keyczar/Encrypter;->encrypt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Lorg/keyczar/KeyVersion;->getVersionNumber()I

    move-result v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v2, v1}, Lorg/keyczar/GenericKeyczar;->writeFile(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method writeFile(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyczarException;
        }
    .end annotation

    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    :try_start_0
    new-instance p2, Ljava/io/FileWriter;

    invoke-direct {p2, v0}, Ljava/io/FileWriter;-><init>(Ljava/io/File;)V

    invoke-virtual {p2, p1}, Ljava/io/FileWriter;->write(Ljava/lang/String;)V

    invoke-virtual {p2}, Ljava/io/FileWriter;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    new-instance p2, Lorg/keyczar/exceptions/KeyczarException;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-virtual {v0}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v1, v2

    const-string v0, "KeyczarTool.UnableToWrite"

    invoke-static {v0, v1}, Lorg/keyczar/i18n/Messages;->getString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p2, v0, p1}, Lorg/keyczar/exceptions/KeyczarException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p2
.end method
