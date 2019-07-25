.class public Lcn/kuaipan/android/utils/TwoKeyHashMap;
.super Ljava/util/AbstractMap;
.source "TwoKeyHashMap.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcn/kuaipan/android/utils/TwoKeyHashMap$ValueIteratorImpl;,
        Lcn/kuaipan/android/utils/TwoKeyHashMap$ValuesCollectionImpl;,
        Lcn/kuaipan/android/utils/TwoKeyHashMap$EntryIteratorImpl;,
        Lcn/kuaipan/android/utils/TwoKeyHashMap$EntrySetImpl;,
        Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        "K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/AbstractMap<",
        "Ljava/lang/String;",
        "TV;>;"
    }
.end annotation


# instance fields
.field private arr:[Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry<",
            "TE;TK;TV;>;"
        }
    .end annotation
.end field

.field private arrSize:I

.field private entrySet:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/util/Map$Entry<",
            "Ljava/lang/String;",
            "TV;>;>;"
        }
    .end annotation
.end field

.field private loadFactor:F

.field private modCount:I

.field private size:I

.field threshold:I

.field private values:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection<",
            "TV;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    const/16 v0, 0x10

    const/high16 v1, 0x3f400000    # 0.75f

    invoke-direct {p0, v0, v1}, Lcn/kuaipan/android/utils/TwoKeyHashMap;-><init>(IF)V

    return-void
.end method

.method public constructor <init>(IF)V
    .locals 1

    invoke-direct {p0}, Ljava/util/AbstractMap;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->threshold:I

    if-ltz p1, :cond_3

    const/4 v0, 0x0

    cmpg-float v0, p2, v0

    if-lez v0, :cond_2

    iput p2, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->loadFactor:F

    const p2, 0x7fffffff

    if-ne p1, p2, :cond_0

    add-int/lit8 p1, p1, -0x1

    :cond_0
    const/4 p2, 0x1

    if-lez p1, :cond_1

    goto :goto_0

    :cond_1
    const/4 p1, 0x1

    :goto_0
    iput p1, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->arrSize:I

    iget p1, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->arrSize:I

    int-to-float p1, p1

    iget v0, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->loadFactor:F

    mul-float p1, p1, v0

    float-to-int p1, p1

    iput p1, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->threshold:I

    iget p1, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->arrSize:I

    add-int/2addr p1, p2

    new-array p1, p1, [Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;

    iput-object p1, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->arr:[Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;

    return-void

    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "initialLoadFactor should be > 0"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "initialCapacity should be >= 0"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method static synthetic access$000(Lcn/kuaipan/android/utils/TwoKeyHashMap;)I
    .locals 0

    iget p0, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->size:I

    return p0
.end method

.method static synthetic access$010(Lcn/kuaipan/android/utils/TwoKeyHashMap;)I
    .locals 2

    iget v0, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->size:I

    add-int/lit8 v1, v0, -0x1

    iput v1, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->size:I

    return v0
.end method

.method static synthetic access$100(Lcn/kuaipan/android/utils/TwoKeyHashMap;Ljava/lang/Object;Ljava/lang/Object;)Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;
    .locals 0

    invoke-direct {p0, p1, p2}, Lcn/kuaipan/android/utils/TwoKeyHashMap;->findEntry(Ljava/lang/Object;Ljava/lang/Object;)Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$200(Lcn/kuaipan/android/utils/TwoKeyHashMap;Ljava/lang/Object;Ljava/lang/Object;)Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;
    .locals 0

    invoke-direct {p0, p1, p2}, Lcn/kuaipan/android/utils/TwoKeyHashMap;->removeEntry(Ljava/lang/Object;Ljava/lang/Object;)Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$300(Lcn/kuaipan/android/utils/TwoKeyHashMap;)I
    .locals 0

    iget p0, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->modCount:I

    return p0
.end method

.method static synthetic access$308(Lcn/kuaipan/android/utils/TwoKeyHashMap;)I
    .locals 2

    iget v0, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->modCount:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->modCount:I

    return v0
.end method

.method static synthetic access$400(Lcn/kuaipan/android/utils/TwoKeyHashMap;)[Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;
    .locals 0

    iget-object p0, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->arr:[Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;

    return-object p0
.end method

.method private final findEntry(Ljava/lang/Object;Ljava/lang/Object;)Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ")",
            "Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry<",
            "TE;TK;TV;>;"
        }
    .end annotation

    if-nez p1, :cond_0

    if-nez p2, :cond_0

    iget-object p1, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->arr:[Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;

    iget p2, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->arrSize:I

    aget-object p1, p1, p2

    return-object p1

    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v0

    invoke-virtual {p2}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    const v1, 0x7fffffff

    and-int/2addr v1, v0

    iget v2, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->arrSize:I

    rem-int/2addr v1, v2

    iget-object v2, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->arr:[Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;

    aget-object v1, v2, v1

    :goto_0
    if-eqz v1, :cond_2

    iget v2, v1, Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;->hash:I

    if-ne v0, v2, :cond_1

    invoke-virtual {v1}, Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;->getKey1()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {v1}, Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;->getKey2()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p2, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    return-object v1

    :cond_1
    iget-object v1, v1, Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;->next:Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;

    goto :goto_0

    :cond_2
    const/4 p1, 0x0

    return-object p1
.end method

.method private final removeEntry(Ljava/lang/Object;Ljava/lang/Object;)Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ")",
            "Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry<",
            "TE;TK;TV;>;"
        }
    .end annotation

    const/4 v0, 0x0

    if-nez p1, :cond_1

    if-nez p2, :cond_1

    iget p1, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->arrSize:I

    iget-object p2, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->arr:[Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;

    aget-object p2, p2, p1

    if-eqz p2, :cond_0

    iget-object p2, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->arr:[Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;

    aget-object p2, p2, p1

    iget-object v1, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->arr:[Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;

    aput-object v0, v1, p1

    iget p1, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->size:I

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->size:I

    iget p1, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->modCount:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->modCount:I

    return-object p2

    :cond_0
    return-object v0

    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    invoke-virtual {p2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v1, v2

    const v2, 0x7fffffff

    and-int/2addr v2, v1

    iget v3, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->arrSize:I

    rem-int/2addr v2, v3

    iget-object v3, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->arr:[Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;

    aget-object v3, v3, v2

    move-object v4, v3

    :goto_0
    if-eqz v3, :cond_4

    iget v5, v3, Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;->hash:I

    if-ne v1, v5, :cond_3

    invoke-virtual {v3}, Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;->getKey1()Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {p1, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-virtual {v3}, Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;->getKey2()Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {p2, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    if-ne v4, v3, :cond_2

    iget-object p1, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->arr:[Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;

    iget-object p2, v3, Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;->next:Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;

    aput-object p2, p1, v2

    goto :goto_1

    :cond_2
    iget-object p1, v3, Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;->next:Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;

    iput-object p1, v4, Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;->next:Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;

    :goto_1
    iget p1, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->size:I

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->size:I

    iget p1, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->modCount:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->modCount:I

    return-object v3

    :cond_3
    iget-object v4, v3, Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;->next:Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;

    move-object v6, v4

    move-object v4, v3

    move-object v3, v6

    goto :goto_0

    :cond_4
    return-object v0
.end method


# virtual methods
.method public clear()V
    .locals 4

    iget v0, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->modCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->modCount:I

    const/4 v0, 0x0

    iput v0, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->size:I

    iget-object v1, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->arr:[Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;

    iget-object v2, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->arr:[Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;

    array-length v2, v2

    const/4 v3, 0x0

    invoke-static {v1, v0, v2, v3}, Ljava/util/Arrays;->fill([Ljava/lang/Object;IILjava/lang/Object;)V

    return-void
.end method

.method createEntry(ILjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;)Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITE;TK;TV;",
            "Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry<",
            "TE;TK;TV;>;)",
            "Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry<",
            "TE;TK;TV;>;"
        }
    .end annotation

    new-instance v6, Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;

    move-object v0, v6

    move v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v5}, Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;-><init>(ILjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;)V

    return-object v6
.end method

.method createEntrySetIterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Ljava/util/Map$Entry<",
            "Ljava/lang/String;",
            "TV;>;>;"
        }
    .end annotation

    new-instance v0, Lcn/kuaipan/android/utils/TwoKeyHashMap$EntryIteratorImpl;

    invoke-direct {v0, p0}, Lcn/kuaipan/android/utils/TwoKeyHashMap$EntryIteratorImpl;-><init>(Lcn/kuaipan/android/utils/TwoKeyHashMap;)V

    return-object v0
.end method

.method createValueCollectionIterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "TV;>;"
        }
    .end annotation

    new-instance v0, Lcn/kuaipan/android/utils/TwoKeyHashMap$ValueIteratorImpl;

    invoke-direct {v0, p0}, Lcn/kuaipan/android/utils/TwoKeyHashMap$ValueIteratorImpl;-><init>(Lcn/kuaipan/android/utils/TwoKeyHashMap;)V

    return-object v0
.end method

.method public entrySet()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/util/Map$Entry<",
            "Ljava/lang/String;",
            "TV;>;>;"
        }
    .end annotation

    iget-object v0, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->entrySet:Ljava/util/Set;

    if-nez v0, :cond_0

    new-instance v0, Lcn/kuaipan/android/utils/TwoKeyHashMap$EntrySetImpl;

    invoke-direct {v0, p0}, Lcn/kuaipan/android/utils/TwoKeyHashMap$EntrySetImpl;-><init>(Lcn/kuaipan/android/utils/TwoKeyHashMap;)V

    iput-object v0, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->entrySet:Ljava/util/Set;

    :cond_0
    iget-object v0, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->entrySet:Ljava/util/Set;

    return-object v0
.end method

.method public get(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ")TV;"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Lcn/kuaipan/android/utils/TwoKeyHashMap;->findEntry(Ljava/lang/Object;Ljava/lang/Object;)Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p1, Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;->value:Ljava/lang/Object;

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public isEmpty()Z
    .locals 1

    iget v0, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->size:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public put(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;TK;TV;)TV;"
        }
    .end annotation

    const/4 v0, 0x0

    if-nez p1, :cond_1

    if-nez p2, :cond_1

    iget p1, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->arrSize:I

    iget-object p2, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->arr:[Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;

    aget-object p2, p2, p1

    if-nez p2, :cond_0

    iget-object p2, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->arr:[Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v6, 0x0

    move-object v1, p0

    move-object v5, p3

    invoke-virtual/range {v1 .. v6}, Lcn/kuaipan/android/utils/TwoKeyHashMap;->createEntry(ILjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;)Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;

    move-result-object p3

    aput-object p3, p2, p1

    iget p1, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->size:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->size:I

    iget p1, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->modCount:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->modCount:I

    return-object v0

    :cond_0
    iget-object p2, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->arr:[Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;

    aget-object p2, p2, p1

    iget-object p2, p2, Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;->value:Ljava/lang/Object;

    iget-object v0, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->arr:[Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;

    aget-object p1, v0, p1

    iput-object p3, p1, Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;->value:Ljava/lang/Object;

    return-object p2

    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    invoke-virtual {p2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int v4, v1, v2

    const v1, 0x7fffffff

    and-int/2addr v1, v4

    iget v2, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->arrSize:I

    rem-int/2addr v1, v2

    iget-object v2, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->arr:[Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;

    aget-object v2, v2, v1

    :goto_0
    if-eqz v2, :cond_3

    iget v3, v2, Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;->hash:I

    if-ne v4, v3, :cond_2

    invoke-virtual {v2}, Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;->getKey1()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-virtual {v2}, Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;->getKey2()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    iget-object p1, v2, Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;->value:Ljava/lang/Object;

    iput-object p3, v2, Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;->value:Ljava/lang/Object;

    return-object p1

    :cond_2
    iget-object v2, v2, Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;->next:Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;

    goto :goto_0

    :cond_3
    iget-object v2, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->arr:[Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;

    iget-object v3, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->arr:[Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;

    aget-object v8, v3, v1

    move-object v3, p0

    move-object v5, p1

    move-object v6, p2

    move-object v7, p3

    invoke-virtual/range {v3 .. v8}, Lcn/kuaipan/android/utils/TwoKeyHashMap;->createEntry(ILjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;)Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;

    move-result-object p1

    aput-object p1, v2, v1

    iget p1, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->size:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->size:I

    iget p1, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->modCount:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->modCount:I

    iget p1, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->size:I

    iget p2, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->threshold:I

    if-le p1, p2, :cond_4

    invoke-virtual {p0}, Lcn/kuaipan/android/utils/TwoKeyHashMap;->rehash()V

    :cond_4
    return-object v0
.end method

.method rehash()V
    .locals 8

    iget v0, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->arrSize:I

    add-int/lit8 v0, v0, 0x1

    mul-int/lit8 v0, v0, 0x2

    add-int/lit8 v0, v0, 0x1

    if-gez v0, :cond_0

    const v0, 0x7ffffffe

    :cond_0
    add-int/lit8 v1, v0, 0x1

    new-array v1, v1, [Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;

    const/4 v2, 0x0

    :goto_0
    iget-object v3, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->arr:[Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;

    array-length v3, v3

    add-int/lit8 v3, v3, -0x1

    const v4, 0x7fffffff

    if-ge v2, v3, :cond_2

    iget-object v3, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->arr:[Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;

    aget-object v3, v3, v2

    :goto_1
    if-eqz v3, :cond_1

    iget-object v5, v3, Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;->next:Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;

    iget v6, v3, Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;->hash:I

    and-int/2addr v6, v4

    rem-int/2addr v6, v0

    aget-object v7, v1, v6

    iput-object v7, v3, Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;->next:Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;

    aput-object v3, v1, v6

    move-object v3, v5

    goto :goto_1

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    iget-object v2, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->arr:[Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;

    iget v3, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->arrSize:I

    aget-object v2, v2, v3

    aput-object v2, v1, v0

    iput v0, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->arrSize:I

    iget v0, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->arrSize:I

    if-ne v0, v4, :cond_3

    iget v0, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->loadFactor:F

    const/high16 v2, 0x41200000    # 10.0f

    mul-float v0, v0, v2

    iput v0, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->loadFactor:F

    :cond_3
    iget v0, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->arrSize:I

    int-to-float v0, v0

    iget v2, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->loadFactor:F

    mul-float v0, v0, v2

    float-to-int v0, v0

    iput v0, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->threshold:I

    iput-object v1, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->arr:[Lcn/kuaipan/android/utils/TwoKeyHashMap$Entry;

    return-void
.end method

.method public size()I
    .locals 1

    iget v0, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->size:I

    return v0
.end method

.method public values()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "TV;>;"
        }
    .end annotation

    iget-object v0, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->values:Ljava/util/Collection;

    if-nez v0, :cond_0

    new-instance v0, Lcn/kuaipan/android/utils/TwoKeyHashMap$ValuesCollectionImpl;

    invoke-direct {v0, p0}, Lcn/kuaipan/android/utils/TwoKeyHashMap$ValuesCollectionImpl;-><init>(Lcn/kuaipan/android/utils/TwoKeyHashMap;)V

    iput-object v0, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->values:Ljava/util/Collection;

    :cond_0
    iget-object v0, p0, Lcn/kuaipan/android/utils/TwoKeyHashMap;->values:Ljava/util/Collection;

    return-object v0
.end method
