.class abstract Lcom/miui/gallery/provider/cache/Filter;
.super Ljava/lang/Object;
.source "Filter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/provider/cache/Filter$FilterFactory;,
        Lcom/miui/gallery/provider/cache/Filter$DummyFilter;,
        Lcom/miui/gallery/provider/cache/Filter$CompoundFilter;,
        Lcom/miui/gallery/provider/cache/Filter$CompareFilter;,
        Lcom/miui/gallery/provider/cache/Filter$Comparator;,
        Lcom/miui/gallery/provider/cache/Filter$Compound;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Lcom/miui/gallery/provider/cache/CacheItem;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field private static final COMPARATOR:Ljava/util/regex/Pattern;

.field public static final NOT_SUPPORTED_FILTER:Lcom/miui/gallery/provider/cache/Filter$CompareFilter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/provider/cache/Filter$CompareFilter<",
            "Lcom/miui/gallery/provider/cache/MediaItem;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const-string v0, "(?i)(<(?!=)|<=|>(?!=)|>=|=(?!=)|==|!=|(?<=\\s)LIKE(?=\\s)|(?<=\\s)IN(?=\\s|\\()|(?<=\\s)NOT\\s+IN(?=\\s|\\()|(?<=\\s)IS\\s+NULL(?=\\s|$)|(?<=\\s)NOT\\s+NULL(?=\\s|$))"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/provider/cache/Filter;->COMPARATOR:Ljava/util/regex/Pattern;

    new-instance v0, Lcom/miui/gallery/provider/cache/Filter$1;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {v0, v2, v1, v1}, Lcom/miui/gallery/provider/cache/Filter$1;-><init>(ILcom/miui/gallery/provider/cache/Filter$Comparator;Ljava/lang/String;)V

    sput-object v0, Lcom/miui/gallery/provider/cache/Filter;->NOT_SUPPORTED_FILTER:Lcom/miui/gallery/provider/cache/Filter$CompareFilter;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static build(Ljava/lang/String;Lcom/miui/gallery/provider/cache/Filter$FilterFactory;)Lcom/miui/gallery/provider/cache/Filter;
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/miui/gallery/provider/cache/CacheItem;",
            ">(",
            "Ljava/lang/String;",
            "Lcom/miui/gallery/provider/cache/Filter$FilterFactory<",
            "TT;>;)",
            "Lcom/miui/gallery/provider/cache/Filter<",
            "TT;>;"
        }
    .end annotation

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    new-instance p0, Lcom/miui/gallery/provider/cache/Filter$DummyFilter;

    invoke-direct {p0, v1}, Lcom/miui/gallery/provider/cache/Filter$DummyFilter;-><init>(Lcom/miui/gallery/provider/cache/Filter$1;)V

    return-object p0

    :cond_0
    invoke-static {p0}, Lcom/miui/gallery/provider/cache/Filter;->split(Ljava/lang/String;)[[Ljava/lang/String;

    move-result-object p0

    const/4 v0, 0x0

    aget-object v2, p0, v0

    const/4 v3, 0x1

    aget-object p0, p0, v3

    array-length v4, v2

    move-object v6, v1

    const/4 v5, 0x0

    const/4 v7, 0x0

    :goto_0
    if-ge v5, v4, :cond_5

    aget-object v8, v2, v5

    invoke-virtual {v8}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    const-string v9, ".provider.cache.Filter"

    const-string v10, "build for %s"

    invoke-static {v9, v10, v8}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {v8}, Lcom/miui/gallery/provider/cache/Filter;->inBracket(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_1

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v9

    sub-int/2addr v9, v3

    invoke-virtual {v8, v3, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8, p1}, Lcom/miui/gallery/provider/cache/Filter;->build(Ljava/lang/String;Lcom/miui/gallery/provider/cache/Filter$FilterFactory;)Lcom/miui/gallery/provider/cache/Filter;

    move-result-object v8

    goto :goto_1

    :cond_1
    sget-object v9, Lcom/miui/gallery/provider/cache/Filter;->COMPARATOR:Ljava/util/regex/Pattern;

    invoke-virtual {v9, v8}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v9

    invoke-virtual {v9}, Ljava/util/regex/Matcher;->find()Z

    move-result v10

    if-eqz v10, :cond_3

    invoke-virtual {v9}, Ljava/util/regex/Matcher;->start()I

    move-result v10

    invoke-virtual {v8, v0, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v10

    invoke-interface {p1}, Lcom/miui/gallery/provider/cache/Filter$FilterFactory;->getMapper()Lcom/miui/gallery/provider/cache/CacheItem$ColumnMapper;

    move-result-object v11

    invoke-interface {v11, v10}, Lcom/miui/gallery/provider/cache/CacheItem$ColumnMapper;->getIndex(Ljava/lang/String;)I

    move-result v10

    if-gez v10, :cond_2

    const-string v11, ".provider.cache.Filter"

    const-string v12, "Found a unrecognized column"

    invoke-static {v11, v12}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2
    invoke-virtual {v9}, Ljava/util/regex/Matcher;->end()I

    move-result v11

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v12

    invoke-virtual {v8, v11, v12}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/miui/gallery/provider/cache/Filter;->translateParams(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v9}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lcom/miui/gallery/provider/cache/Filter$Comparator;->from(Ljava/lang/String;)Lcom/miui/gallery/provider/cache/Filter$Comparator;

    move-result-object v9

    invoke-interface {p1, v10, v9, v8}, Lcom/miui/gallery/provider/cache/Filter$FilterFactory;->getFilter(ILcom/miui/gallery/provider/cache/Filter$Comparator;Ljava/lang/String;)Lcom/miui/gallery/provider/cache/Filter$CompareFilter;

    move-result-object v8

    goto :goto_1

    :cond_3
    const-string v8, ".provider.cache.Filter"

    const-string v9, "Found a unrecognized operation"

    invoke-static {v8, v9}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v8, -0x1

    invoke-interface {p1, v8, v1, v1}, Lcom/miui/gallery/provider/cache/Filter$FilterFactory;->getFilter(ILcom/miui/gallery/provider/cache/Filter$Comparator;Ljava/lang/String;)Lcom/miui/gallery/provider/cache/Filter$CompareFilter;

    move-result-object v8

    :goto_1
    if-nez v6, :cond_4

    move-object v6, v8

    goto :goto_2

    :cond_4
    add-int/lit8 v7, v7, 0x1

    new-instance v9, Lcom/miui/gallery/provider/cache/Filter$CompoundFilter;

    add-int/lit8 v10, v7, -0x1

    aget-object v10, p0, v10

    invoke-direct {v9, v10, v6, v8}, Lcom/miui/gallery/provider/cache/Filter$CompoundFilter;-><init>(Ljava/lang/String;Lcom/miui/gallery/provider/cache/Filter;Lcom/miui/gallery/provider/cache/Filter;)V

    move-object v6, v9

    :goto_2
    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_0

    :cond_5
    const-string p0, ".provider.cache.Filter"

    const-string p1, "filter build finish: %s"

    invoke-static {p0, p1, v6}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-object v6
.end method

.method private static findCompound(ILjava/lang/String;)Lcom/miui/gallery/provider/cache/Filter$Compound;
    .locals 7

    add-int/lit8 v0, p0, 0x4

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x0

    if-lt v0, v1, :cond_0

    return-object v2

    :cond_0
    add-int/lit8 v1, p0, 0x1

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x61

    const/16 v5, 0x28

    if-eq v3, v4, :cond_1

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x41

    if-ne v3, v4, :cond_4

    :cond_1
    add-int/lit8 v3, p0, 0x2

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v6, 0x6e

    if-eq v4, v6, :cond_2

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x4e

    if-ne v3, v4, :cond_4

    :cond_2
    add-int/lit8 v3, p0, 0x3

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v6, 0x64

    if-eq v4, v6, :cond_3

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x44

    if-ne v3, v4, :cond_4

    :cond_3
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->isSpaceChar(C)Z

    move-result v3

    if-nez v3, :cond_9

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    if-ne v0, v5, :cond_4

    goto :goto_1

    :cond_4
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v3, 0x6f

    if-eq v0, v3, :cond_5

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x4f

    if-ne v0, v1, :cond_7

    :cond_5
    add-int/lit8 v0, p0, 0x2

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v3, 0x72

    if-eq v1, v3, :cond_6

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x52

    if-ne v0, v1, :cond_7

    :cond_6
    add-int/lit8 p0, p0, 0x3

    invoke-virtual {p1, p0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-static {v0}, Ljava/lang/Character;->isSpaceChar(C)Z

    move-result v0

    if-nez v0, :cond_8

    invoke-virtual {p1, p0}, Ljava/lang/String;->charAt(I)C

    move-result p0

    if-ne p0, v5, :cond_7

    goto :goto_0

    :cond_7
    return-object v2

    :cond_8
    :goto_0
    sget-object p0, Lcom/miui/gallery/provider/cache/Filter$Compound;->OR:Lcom/miui/gallery/provider/cache/Filter$Compound;

    return-object p0

    :cond_9
    :goto_1
    sget-object p0, Lcom/miui/gallery/provider/cache/Filter$Compound;->AND:Lcom/miui/gallery/provider/cache/Filter$Compound;

    return-object p0
.end method

.method public static from(Ljava/lang/String;[Ljava/lang/String;Lcom/miui/gallery/provider/cache/Filter$FilterFactory;)Lcom/miui/gallery/provider/cache/Filter;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/miui/gallery/provider/cache/CacheItem;",
            ">(",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            "Lcom/miui/gallery/provider/cache/Filter$FilterFactory<",
            "TT;>;)",
            "Lcom/miui/gallery/provider/cache/Filter<",
            "TT;>;"
        }
    .end annotation

    invoke-static {p0, p1}, Lcom/miui/gallery/provider/cache/Filter;->insertArgs(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, p2}, Lcom/miui/gallery/provider/cache/Filter;->build(Ljava/lang/String;Lcom/miui/gallery/provider/cache/Filter$FilterFactory;)Lcom/miui/gallery/provider/cache/Filter;

    move-result-object p0

    return-object p0
.end method

.method private static inBracket(Ljava/lang/String;)Z
    .locals 4

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/4 v2, 0x1

    const/16 v3, 0x28

    if-ne v1, v3, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    sub-int/2addr v1, v2

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result p0

    const/16 v1, 0x29

    if-ne p0, v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method private static insertArgs(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    if-eqz p1, :cond_3

    array-length v0, p1

    const/4 v1, 0x1

    if-ge v0, v1, :cond_0

    goto :goto_2

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v1, v3, :cond_2

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x3f

    if-ne v3, v4, :cond_1

    add-int/lit8 v3, v2, 0x1

    aget-object v2, p1, v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move v2, v3

    goto :goto_1

    :cond_1
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_3
    :goto_2
    return-object p0
.end method

.method private static isIdentifier(C)Z
    .locals 1

    const/16 v0, 0x5f

    if-eq p0, v0, :cond_1

    invoke-static {p0}, Ljava/lang/Character;->isLetterOrDigit(C)Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x1

    :goto_1
    return p0
.end method

.method private static split(Ljava/lang/String;)[[Ljava/lang/String;
    .locals 9

    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    const/4 v7, 0x1

    if-ge v4, v6, :cond_5

    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v6

    invoke-static {v6}, Lcom/miui/gallery/provider/cache/Filter;->isIdentifier(C)Z

    move-result v8

    if-eqz v8, :cond_0

    goto :goto_2

    :cond_0
    const/16 v8, 0x28

    if-ne v6, v8, :cond_1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    :cond_1
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v6

    const/16 v8, 0x29

    if-ne v6, v8, :cond_2

    invoke-virtual {v0}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    :cond_2
    invoke-virtual {v0}, Ljava/util/Stack;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_4

    invoke-static {v4, p0}, Lcom/miui/gallery/provider/cache/Filter;->findCompound(ILjava/lang/String;)Lcom/miui/gallery/provider/cache/Filter$Compound;

    move-result-object v6

    if-eqz v6, :cond_4

    invoke-virtual {p0, v5, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v6}, Lcom/miui/gallery/provider/cache/Filter$Compound;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v5, Lcom/miui/gallery/provider/cache/Filter$Compound;->AND:Lcom/miui/gallery/provider/cache/Filter$Compound;

    if-ne v6, v5, :cond_3

    add-int/lit8 v4, v4, 0x3

    goto :goto_1

    :cond_3
    add-int/lit8 v4, v4, 0x2

    :goto_1
    add-int/lit8 v5, v4, 0x1

    :cond_4
    :goto_2
    add-int/2addr v4, v7

    goto :goto_0

    :cond_5
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p0, v5, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result p0

    new-array p0, p0, [Ljava/lang/String;

    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Ljava/lang/String;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    const/4 v1, 0x2

    new-array v1, v1, [[Ljava/lang/String;

    aput-object p0, v1, v3

    aput-object v0, v1, v7

    return-object v1
.end method

.method private static translateParams(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_0

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v2, 0x27

    if-ne v0, v2, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    sub-int/2addr v0, v1

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    if-ne v0, v2, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    sub-int/2addr v0, v1

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_0
    return-object p0
.end method


# virtual methods
.method public abstract filter(Lcom/miui/gallery/provider/cache/CacheItem;)Lcom/miui/gallery/provider/cache/CacheItem;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)TT;"
        }
    .end annotation
.end method
