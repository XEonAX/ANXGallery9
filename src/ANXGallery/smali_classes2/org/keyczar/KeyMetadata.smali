.class public Lorg/keyczar/KeyMetadata;
.super Ljava/lang/Object;
.source "KeyMetadata.java"


# instance fields
.field encrypted:Z
    .annotation runtime Lcom/google/gson_nex/annotations/Expose;
    .end annotation
.end field

.field name:Ljava/lang/String;
    .annotation runtime Lcom/google/gson_nex/annotations/Expose;
    .end annotation
.end field

.field purpose:Lorg/keyczar/enums/KeyPurpose;
    .annotation runtime Lcom/google/gson_nex/annotations/Expose;
    .end annotation
.end field

.field type:Lorg/keyczar/interfaces/KeyType;
    .annotation runtime Lcom/google/gson_nex/annotations/Expose;
    .end annotation
.end field

.field protected versionMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lorg/keyczar/KeyVersion;",
            ">;"
        }
    .end annotation
.end field

.field versions:Ljava/util/List;
    .annotation runtime Lcom/google/gson_nex/annotations/Expose;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/keyczar/KeyVersion;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, ""

    iput-object v0, p0, Lorg/keyczar/KeyMetadata;->name:Ljava/lang/String;

    sget-object v0, Lorg/keyczar/enums/KeyPurpose;->TEST:Lorg/keyczar/enums/KeyPurpose;

    iput-object v0, p0, Lorg/keyczar/KeyMetadata;->purpose:Lorg/keyczar/enums/KeyPurpose;

    sget-object v0, Lorg/keyczar/DefaultKeyType;->TEST:Lorg/keyczar/DefaultKeyType;

    iput-object v0, p0, Lorg/keyczar/KeyMetadata;->type:Lorg/keyczar/interfaces/KeyType;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/keyczar/KeyMetadata;->versions:Ljava/util/List;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/keyczar/KeyMetadata;->encrypted:Z

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/keyczar/KeyMetadata;->versionMap:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lorg/keyczar/enums/KeyPurpose;Lorg/keyczar/interfaces/KeyType;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, ""

    iput-object v0, p0, Lorg/keyczar/KeyMetadata;->name:Ljava/lang/String;

    sget-object v0, Lorg/keyczar/enums/KeyPurpose;->TEST:Lorg/keyczar/enums/KeyPurpose;

    iput-object v0, p0, Lorg/keyczar/KeyMetadata;->purpose:Lorg/keyczar/enums/KeyPurpose;

    sget-object v0, Lorg/keyczar/DefaultKeyType;->TEST:Lorg/keyczar/DefaultKeyType;

    iput-object v0, p0, Lorg/keyczar/KeyMetadata;->type:Lorg/keyczar/interfaces/KeyType;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/keyczar/KeyMetadata;->versions:Ljava/util/List;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/keyczar/KeyMetadata;->encrypted:Z

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/keyczar/KeyMetadata;->versionMap:Ljava/util/Map;

    iput-object p1, p0, Lorg/keyczar/KeyMetadata;->name:Ljava/lang/String;

    iput-object p2, p0, Lorg/keyczar/KeyMetadata;->purpose:Lorg/keyczar/enums/KeyPurpose;

    iput-object p3, p0, Lorg/keyczar/KeyMetadata;->type:Lorg/keyczar/interfaces/KeyType;

    return-void
.end method

.method public static read(Ljava/lang/String;)Lorg/keyczar/KeyMetadata;
    .locals 4

    invoke-static {}, Lorg/keyczar/util/Util;->gson()Lcom/google/gson_nex/Gson;

    move-result-object v0

    const-class v1, Lorg/keyczar/KeyMetadata;

    invoke-virtual {v0, p0, v1}, Lcom/google/gson_nex/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lorg/keyczar/KeyMetadata;

    invoke-virtual {p0}, Lorg/keyczar/KeyMetadata;->getVersions()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/keyczar/KeyVersion;

    iget-object v2, p0, Lorg/keyczar/KeyMetadata;->versionMap:Ljava/util/Map;

    invoke-virtual {v1}, Lorg/keyczar/KeyVersion;->getVersionNumber()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_0
    return-object p0
.end method


# virtual methods
.method public addVersion(Lorg/keyczar/KeyVersion;)Z
    .locals 3

    invoke-virtual {p1}, Lorg/keyczar/KeyVersion;->getVersionNumber()I

    move-result v0

    iget-object v1, p0, Lorg/keyczar/KeyMetadata;->versionMap:Ljava/util/Map;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lorg/keyczar/KeyMetadata;->versionMap:Ljava/util/Map;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {v1, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lorg/keyczar/KeyMetadata;->versions:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lorg/keyczar/KeyMetadata;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getPrimaryVersion()Lorg/keyczar/KeyVersion;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/NoPrimaryKeyException;
        }
    .end annotation

    iget-object v0, p0, Lorg/keyczar/KeyMetadata;->versions:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/keyczar/KeyVersion;

    invoke-virtual {v1}, Lorg/keyczar/KeyVersion;->getStatus()Lorg/keyczar/enums/KeyStatus;

    move-result-object v2

    sget-object v3, Lorg/keyczar/enums/KeyStatus;->PRIMARY:Lorg/keyczar/enums/KeyStatus;

    if-ne v2, v3, :cond_0

    return-object v1

    :cond_1
    new-instance v0, Lorg/keyczar/exceptions/NoPrimaryKeyException;

    invoke-direct {v0}, Lorg/keyczar/exceptions/NoPrimaryKeyException;-><init>()V

    throw v0
.end method

.method public getPurpose()Lorg/keyczar/enums/KeyPurpose;
    .locals 1

    iget-object v0, p0, Lorg/keyczar/KeyMetadata;->purpose:Lorg/keyczar/enums/KeyPurpose;

    return-object v0
.end method

.method public getType()Lorg/keyczar/interfaces/KeyType;
    .locals 1

    iget-object v0, p0, Lorg/keyczar/KeyMetadata;->type:Lorg/keyczar/interfaces/KeyType;

    return-object v0
.end method

.method public getVersion(I)Lorg/keyczar/KeyVersion;
    .locals 1

    iget-object v0, p0, Lorg/keyczar/KeyMetadata;->versionMap:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/keyczar/KeyVersion;

    return-object p1
.end method

.method public getVersions()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lorg/keyczar/KeyVersion;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lorg/keyczar/KeyMetadata;->versions:Ljava/util/List;

    return-object v0
.end method

.method public isEncrypted()Z
    .locals 1

    iget-boolean v0, p0, Lorg/keyczar/KeyMetadata;->encrypted:Z

    return v0
.end method

.method public removeVersion(I)Z
    .locals 2

    iget-object v0, p0, Lorg/keyczar/KeyMetadata;->versionMap:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/keyczar/KeyMetadata;->versionMap:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/keyczar/KeyVersion;

    iget-object v1, p0, Lorg/keyczar/KeyMetadata;->versions:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    iget-object v0, p0, Lorg/keyczar/KeyMetadata;->versionMap:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method setEncrypted(Z)V
    .locals 0

    iput-boolean p1, p0, Lorg/keyczar/KeyMetadata;->encrypted:Z

    return-void
.end method

.method setType(Lorg/keyczar/interfaces/KeyType;)V
    .locals 0

    iput-object p1, p0, Lorg/keyczar/KeyMetadata;->type:Lorg/keyczar/interfaces/KeyType;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    invoke-static {}, Lorg/keyczar/util/Util;->gson()Lcom/google/gson_nex/Gson;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/google/gson_nex/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
