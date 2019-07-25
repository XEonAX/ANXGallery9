.class public final enum Lorg/keyczar/DefaultKeyType;
.super Ljava/lang/Enum;
.source "DefaultKeyType.java"

# interfaces
.implements Lorg/keyczar/interfaces/KeyType;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/keyczar/DefaultKeyType$DefaultKeyBuilder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/keyczar/DefaultKeyType;",
        ">;",
        "Lorg/keyczar/interfaces/KeyType;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/keyczar/DefaultKeyType;

.field public static final enum AES:Lorg/keyczar/DefaultKeyType;

.field public static final enum DSA_PRIV:Lorg/keyczar/DefaultKeyType;

.field public static final enum DSA_PUB:Lorg/keyczar/DefaultKeyType;

.field public static final enum EC_PRIV:Lorg/keyczar/DefaultKeyType;

.field public static final enum EC_PUB:Lorg/keyczar/DefaultKeyType;

.field public static final enum HMAC_SHA1:Lorg/keyczar/DefaultKeyType;

.field public static final enum RSA_PRIV:Lorg/keyczar/DefaultKeyType;

.field public static final enum RSA_PUB:Lorg/keyczar/DefaultKeyType;

.field public static final enum TEST:Lorg/keyczar/DefaultKeyType;

.field private static typeMapping:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lorg/keyczar/interfaces/KeyType;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final acceptableSizes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private final outputSizeMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 16

    new-instance v0, Lorg/keyczar/DefaultKeyType;

    const-string v1, "AES"

    const/4 v2, 0x3

    new-array v3, v2, [Ljava/lang/Integer;

    const/16 v4, 0x80

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/4 v6, 0x0

    aput-object v5, v3, v6

    const/16 v5, 0xc0

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    const/4 v8, 0x1

    aput-object v7, v3, v8

    const/16 v7, 0x100

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const/4 v10, 0x2

    aput-object v9, v3, v10

    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    invoke-direct {v0, v1, v6, v3, v6}, Lorg/keyczar/DefaultKeyType;-><init>(Ljava/lang/String;ILjava/util/List;I)V

    sput-object v0, Lorg/keyczar/DefaultKeyType;->AES:Lorg/keyczar/DefaultKeyType;

    new-instance v0, Lorg/keyczar/DefaultKeyType;

    const-string v1, "HMAC_SHA1"

    new-array v3, v8, [Ljava/lang/Integer;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v3, v6

    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    const/16 v9, 0x14

    invoke-direct {v0, v1, v8, v3, v9}, Lorg/keyczar/DefaultKeyType;-><init>(Ljava/lang/String;ILjava/util/List;I)V

    sput-object v0, Lorg/keyczar/DefaultKeyType;->HMAC_SHA1:Lorg/keyczar/DefaultKeyType;

    new-instance v0, Lorg/keyczar/DefaultKeyType;

    const-string v1, "DSA_PRIV"

    new-array v3, v8, [Ljava/lang/Integer;

    const/16 v9, 0x400

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v3, v6

    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    const/16 v11, 0x30

    invoke-direct {v0, v1, v10, v3, v11}, Lorg/keyczar/DefaultKeyType;-><init>(Ljava/lang/String;ILjava/util/List;I)V

    sput-object v0, Lorg/keyczar/DefaultKeyType;->DSA_PRIV:Lorg/keyczar/DefaultKeyType;

    new-instance v0, Lorg/keyczar/DefaultKeyType;

    const-string v1, "DSA_PUB"

    new-array v3, v8, [Ljava/lang/Integer;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v3, v6

    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3, v11}, Lorg/keyczar/DefaultKeyType;-><init>(Ljava/lang/String;ILjava/util/List;I)V

    sput-object v0, Lorg/keyczar/DefaultKeyType;->DSA_PUB:Lorg/keyczar/DefaultKeyType;

    new-instance v0, Lorg/keyczar/DefaultKeyType;

    const-string v1, "RSA_PRIV"

    new-array v3, v2, [Ljava/lang/Integer;

    const/16 v11, 0x1000

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v3, v6

    const/16 v12, 0x800

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v3, v8

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v3, v10

    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    new-array v13, v2, [Ljava/lang/Integer;

    const/16 v14, 0x200

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v13, v6

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v13, v8

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v13, v10

    invoke-static {v13}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v13

    const/4 v15, 0x4

    invoke-direct {v0, v1, v15, v3, v13}, Lorg/keyczar/DefaultKeyType;-><init>(Ljava/lang/String;ILjava/util/List;Ljava/util/List;)V

    sput-object v0, Lorg/keyczar/DefaultKeyType;->RSA_PRIV:Lorg/keyczar/DefaultKeyType;

    new-instance v0, Lorg/keyczar/DefaultKeyType;

    const-string v1, "RSA_PUB"

    new-array v3, v2, [Ljava/lang/Integer;

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v3, v6

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v3, v8

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v3, v10

    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    new-array v9, v2, [Ljava/lang/Integer;

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v9, v6

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v9, v8

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v9, v10

    invoke-static {v9}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    const/4 v9, 0x5

    invoke-direct {v0, v1, v9, v3, v4}, Lorg/keyczar/DefaultKeyType;-><init>(Ljava/lang/String;ILjava/util/List;Ljava/util/List;)V

    sput-object v0, Lorg/keyczar/DefaultKeyType;->RSA_PUB:Lorg/keyczar/DefaultKeyType;

    new-instance v0, Lorg/keyczar/DefaultKeyType;

    const-string v1, "EC_PRIV"

    new-array v3, v15, [Ljava/lang/Integer;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v6

    const/16 v4, 0x180

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v8

    const/16 v4, 0x209

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v10

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v2

    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    const/4 v4, 0x6

    const/16 v11, 0x46

    invoke-direct {v0, v1, v4, v3, v11}, Lorg/keyczar/DefaultKeyType;-><init>(Ljava/lang/String;ILjava/util/List;I)V

    sput-object v0, Lorg/keyczar/DefaultKeyType;->EC_PRIV:Lorg/keyczar/DefaultKeyType;

    new-instance v0, Lorg/keyczar/DefaultKeyType;

    const-string v1, "EC_PUB"

    new-array v3, v15, [Ljava/lang/Integer;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v3, v6

    const/16 v7, 0x180

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v3, v8

    const/16 v7, 0x209

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v3, v10

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v2

    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    const/4 v5, 0x7

    const/16 v7, 0x46

    invoke-direct {v0, v1, v5, v3, v7}, Lorg/keyczar/DefaultKeyType;-><init>(Ljava/lang/String;ILjava/util/List;I)V

    sput-object v0, Lorg/keyczar/DefaultKeyType;->EC_PUB:Lorg/keyczar/DefaultKeyType;

    new-instance v0, Lorg/keyczar/DefaultKeyType;

    const-string v1, "TEST"

    new-array v3, v8, [Ljava/lang/Integer;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v6

    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    const/16 v5, 0x8

    invoke-direct {v0, v1, v5, v3, v6}, Lorg/keyczar/DefaultKeyType;-><init>(Ljava/lang/String;ILjava/util/List;I)V

    sput-object v0, Lorg/keyczar/DefaultKeyType;->TEST:Lorg/keyczar/DefaultKeyType;

    const/16 v0, 0x9

    new-array v0, v0, [Lorg/keyczar/DefaultKeyType;

    sget-object v1, Lorg/keyczar/DefaultKeyType;->AES:Lorg/keyczar/DefaultKeyType;

    aput-object v1, v0, v6

    sget-object v1, Lorg/keyczar/DefaultKeyType;->HMAC_SHA1:Lorg/keyczar/DefaultKeyType;

    aput-object v1, v0, v8

    sget-object v1, Lorg/keyczar/DefaultKeyType;->DSA_PRIV:Lorg/keyczar/DefaultKeyType;

    aput-object v1, v0, v10

    sget-object v1, Lorg/keyczar/DefaultKeyType;->DSA_PUB:Lorg/keyczar/DefaultKeyType;

    aput-object v1, v0, v2

    sget-object v1, Lorg/keyczar/DefaultKeyType;->RSA_PRIV:Lorg/keyczar/DefaultKeyType;

    aput-object v1, v0, v15

    sget-object v1, Lorg/keyczar/DefaultKeyType;->RSA_PUB:Lorg/keyczar/DefaultKeyType;

    aput-object v1, v0, v9

    sget-object v1, Lorg/keyczar/DefaultKeyType;->EC_PRIV:Lorg/keyczar/DefaultKeyType;

    aput-object v1, v0, v4

    sget-object v1, Lorg/keyczar/DefaultKeyType;->EC_PUB:Lorg/keyczar/DefaultKeyType;

    const/4 v2, 0x7

    aput-object v1, v0, v2

    sget-object v1, Lorg/keyczar/DefaultKeyType;->TEST:Lorg/keyczar/DefaultKeyType;

    const/16 v2, 0x8

    aput-object v1, v0, v2

    sput-object v0, Lorg/keyczar/DefaultKeyType;->$VALUES:[Lorg/keyczar/DefaultKeyType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/util/List;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;I)V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lorg/keyczar/DefaultKeyType;->outputSizeMap:Ljava/util/Map;

    iput-object p3, p0, Lorg/keyczar/DefaultKeyType;->acceptableSizes:Ljava/util/List;

    iget-object p1, p0, Lorg/keyczar/DefaultKeyType;->acceptableSizes:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    iget-object p3, p0, Lorg/keyczar/DefaultKeyType;->outputSizeMap:Ljava/util/Map;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p3, p2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lorg/keyczar/DefaultKeyType;->name()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, p0}, Lorg/keyczar/DefaultKeyType;->addToMapping(Ljava/lang/String;Lorg/keyczar/interfaces/KeyType;)V

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/util/List;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lorg/keyczar/DefaultKeyType;->outputSizeMap:Ljava/util/Map;

    iput-object p3, p0, Lorg/keyczar/DefaultKeyType;->acceptableSizes:Ljava/util/List;

    const/4 p1, 0x0

    :goto_0
    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result p2

    if-ge p1, p2, :cond_0

    iget-object p2, p0, Lorg/keyczar/DefaultKeyType;->outputSizeMap:Ljava/util/Map;

    iget-object v0, p0, Lorg/keyczar/DefaultKeyType;->acceptableSizes:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    invoke-interface {p4, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-interface {p2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lorg/keyczar/DefaultKeyType;->name()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, p0}, Lorg/keyczar/DefaultKeyType;->addToMapping(Ljava/lang/String;Lorg/keyczar/interfaces/KeyType;)V

    return-void
.end method

.method private static addToMapping(Ljava/lang/String;Lorg/keyczar/interfaces/KeyType;)V
    .locals 1

    sget-object v0, Lorg/keyczar/DefaultKeyType;->typeMapping:Ljava/util/Map;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lorg/keyczar/DefaultKeyType;->typeMapping:Ljava/util/Map;

    :cond_0
    sget-object v0, Lorg/keyczar/DefaultKeyType;->typeMapping:Ljava/util/Map;

    invoke-interface {v0, p0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public static getTypeByName(Ljava/lang/String;)Lorg/keyczar/interfaces/KeyType;
    .locals 1

    sget-object v0, Lorg/keyczar/DefaultKeyType;->typeMapping:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lorg/keyczar/interfaces/KeyType;

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/keyczar/DefaultKeyType;
    .locals 1

    const-class v0, Lorg/keyczar/DefaultKeyType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lorg/keyczar/DefaultKeyType;

    return-object p0
.end method

.method public static values()[Lorg/keyczar/DefaultKeyType;
    .locals 1

    sget-object v0, Lorg/keyczar/DefaultKeyType;->$VALUES:[Lorg/keyczar/DefaultKeyType;

    invoke-virtual {v0}, [Lorg/keyczar/DefaultKeyType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/keyczar/DefaultKeyType;

    return-object v0
.end method


# virtual methods
.method public defaultSize()I
    .locals 2

    iget-object v0, p0, Lorg/keyczar/DefaultKeyType;->acceptableSizes:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public getAcceptableSizes()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lorg/keyczar/DefaultKeyType;->acceptableSizes:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getBuilder()Lorg/keyczar/interfaces/KeyType$Builder;
    .locals 2

    new-instance v0, Lorg/keyczar/DefaultKeyType$DefaultKeyBuilder;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lorg/keyczar/DefaultKeyType$DefaultKeyBuilder;-><init>(Lorg/keyczar/DefaultKeyType;Lorg/keyczar/DefaultKeyType$1;)V

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    invoke-virtual {p0}, Lorg/keyczar/DefaultKeyType;->name()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getOutputSize()I
    .locals 1

    invoke-virtual {p0}, Lorg/keyczar/DefaultKeyType;->defaultSize()I

    move-result v0

    invoke-virtual {p0, v0}, Lorg/keyczar/DefaultKeyType;->getOutputSize(I)I

    move-result v0

    return v0
.end method

.method public getOutputSize(I)I
    .locals 1

    iget-object v0, p0, Lorg/keyczar/DefaultKeyType;->outputSizeMap:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    return p1
.end method

.method getRsaBuilder(Lorg/keyczar/enums/RsaPadding;)Lorg/keyczar/interfaces/KeyType$Builder;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyczarException;
        }
    .end annotation

    sget-object v0, Lorg/keyczar/DefaultKeyType;->RSA_PRIV:Lorg/keyczar/DefaultKeyType;

    if-ne p0, v0, :cond_0

    new-instance v0, Lorg/keyczar/DefaultKeyType$DefaultKeyBuilder;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lorg/keyczar/DefaultKeyType$DefaultKeyBuilder;-><init>(Lorg/keyczar/DefaultKeyType;Lorg/keyczar/enums/RsaPadding;Lorg/keyczar/DefaultKeyType$1;)V

    return-object v0

    :cond_0
    new-instance p1, Lorg/keyczar/exceptions/KeyczarException;

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    const-string v1, "InvalidKeyType"

    invoke-static {v1, v0}, Lorg/keyczar/i18n/Messages;->getString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Lorg/keyczar/exceptions/KeyczarException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public isAcceptableSize(I)Z
    .locals 1

    iget-object v0, p0, Lorg/keyczar/DefaultKeyType;->acceptableSizes:Ljava/util/List;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method
