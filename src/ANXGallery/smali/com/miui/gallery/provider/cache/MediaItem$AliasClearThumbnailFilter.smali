.class Lcom/miui/gallery/provider/cache/MediaItem$AliasClearThumbnailFilter;
.super Lcom/miui/gallery/provider/cache/Filter$CompareFilter;
.source "MediaItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/provider/cache/MediaItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "AliasClearThumbnailFilter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/provider/cache/Filter$CompareFilter<",
        "Lcom/miui/gallery/provider/cache/MediaItem;",
        ">;"
    }
.end annotation


# static fields
.field private static final DELIMITER_PATTERN:Ljava/util/regex/Pattern;


# instance fields
.field private mAliasClearThumbnail:Ljava/lang/String;

.field private mFileSet:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "\'\\s*,\\s*\'"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/provider/cache/MediaItem$AliasClearThumbnailFilter;->DELIMITER_PATTERN:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>(Lcom/miui/gallery/provider/cache/Filter$Comparator;Ljava/lang/String;)V
    .locals 6

    const/4 v0, -0x1

    invoke-direct {p0, v0, p1, p2}, Lcom/miui/gallery/provider/cache/Filter$CompareFilter;-><init>(ILcom/miui/gallery/provider/cache/Filter$Comparator;Ljava/lang/String;)V

    sget-object v1, Lcom/miui/gallery/provider/cache/Filter$Comparator;->EQUALS:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    if-eq p1, v1, :cond_8

    sget-object v1, Lcom/miui/gallery/provider/cache/Filter$Comparator;->NOT_EQUALS:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    if-ne p1, v1, :cond_0

    goto/16 :goto_2

    :cond_0
    sget-object v1, Lcom/miui/gallery/provider/cache/Filter$Comparator;->IN:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    if-eq p1, v1, :cond_1

    sget-object v1, Lcom/miui/gallery/provider/cache/Filter$Comparator;->NOT_IN:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    if-ne p1, v1, :cond_9

    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result p2

    if-lez p2, :cond_7

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v2

    const/16 v3, 0x28

    if-ne v2, v3, :cond_7

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    add-int/2addr p2, v0

    :goto_0
    const/16 v2, 0x20

    if-lez p2, :cond_2

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v3

    if-ne v3, v2, :cond_2

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    add-int/lit8 p2, p2, -0x1

    goto :goto_0

    :cond_2
    const/16 v3, 0x27

    if-lez p2, :cond_3

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v4

    if-ne v4, v3, :cond_3

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    add-int/lit8 p2, p2, -0x1

    :cond_3
    if-lez p2, :cond_6

    add-int/lit8 v1, p2, -0x1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v4

    const/16 v5, 0x29

    if-ne v4, v5, :cond_6

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    add-int/2addr p2, v0

    :goto_1
    if-lez p2, :cond_4

    add-int/lit8 v0, p2, -0x1

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v1

    if-ne v1, v2, :cond_4

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    add-int/lit8 p2, p2, -0x1

    goto :goto_1

    :cond_4
    if-lez p2, :cond_5

    add-int/lit8 v0, p2, -0x1

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v1

    if-ne v1, v3, :cond_5

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    add-int/lit8 p2, p2, -0x1

    :cond_5
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/provider/cache/MediaItem$AliasClearThumbnailFilter;->mFileSet:Ljava/util/Set;

    if-lez p2, :cond_9

    iget-object p2, p0, Lcom/miui/gallery/provider/cache/MediaItem$AliasClearThumbnailFilter;->mFileSet:Ljava/util/Set;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem$AliasClearThumbnailFilter;->DELIMITER_PATTERN:Ljava/util/regex/Pattern;

    invoke-static {p1, v0}, Landroid/text/TextUtils;->split(Ljava/lang/String;Ljava/util/regex/Pattern;)[Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    goto :goto_3

    :cond_6
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "argument must end with \')\'"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_7
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "argument must start with \'(\'"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_8
    :goto_2
    iput-object p2, p0, Lcom/miui/gallery/provider/cache/MediaItem$AliasClearThumbnailFilter;->mAliasClearThumbnail:Ljava/lang/String;

    :cond_9
    :goto_3
    return-void
.end method


# virtual methods
.method public bridge synthetic filter(Lcom/miui/gallery/provider/cache/CacheItem;)Lcom/miui/gallery/provider/cache/CacheItem;
    .locals 0

    check-cast p1, Lcom/miui/gallery/provider/cache/MediaItem;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/provider/cache/MediaItem$AliasClearThumbnailFilter;->filter(Lcom/miui/gallery/provider/cache/MediaItem;)Lcom/miui/gallery/provider/cache/MediaItem;

    move-result-object p1

    return-object p1
.end method

.method public filter(Lcom/miui/gallery/provider/cache/MediaItem;)Lcom/miui/gallery/provider/cache/MediaItem;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaItem$AliasClearThumbnailFilter;->mComparator:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    sget-object v1, Lcom/miui/gallery/provider/cache/Filter$Comparator;->EQUALS:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    if-ne v0, v1, :cond_0

    invoke-virtual {p1}, Lcom/miui/gallery/provider/cache/MediaItem;->getAliasClearThumbnail()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/provider/cache/MediaItem$AliasClearThumbnailFilter;->mAliasClearThumbnail:Ljava/lang/String;

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-object p1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaItem$AliasClearThumbnailFilter;->mComparator:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    sget-object v1, Lcom/miui/gallery/provider/cache/Filter$Comparator;->NOT_NULL:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    if-ne v0, v1, :cond_1

    invoke-virtual {p1}, Lcom/miui/gallery/provider/cache/MediaItem;->getAliasClearThumbnail()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    return-object p1

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaItem$AliasClearThumbnailFilter;->mComparator:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    sget-object v1, Lcom/miui/gallery/provider/cache/Filter$Comparator;->NOT_EQUALS:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    if-ne v0, v1, :cond_2

    invoke-virtual {p1}, Lcom/miui/gallery/provider/cache/MediaItem;->getAliasClearThumbnail()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/provider/cache/MediaItem$AliasClearThumbnailFilter;->mAliasClearThumbnail:Ljava/lang/String;

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    return-object p1

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaItem$AliasClearThumbnailFilter;->mComparator:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    sget-object v1, Lcom/miui/gallery/provider/cache/Filter$Comparator;->IN:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    if-ne v0, v1, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaItem$AliasClearThumbnailFilter;->mFileSet:Ljava/util/Set;

    invoke-virtual {p1}, Lcom/miui/gallery/provider/cache/MediaItem;->getAliasClearThumbnail()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    return-object p1

    :cond_3
    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaItem$AliasClearThumbnailFilter;->mComparator:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    sget-object v1, Lcom/miui/gallery/provider/cache/Filter$Comparator;->NOT_IN:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    if-ne v0, v1, :cond_4

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaItem$AliasClearThumbnailFilter;->mFileSet:Ljava/util/Set;

    invoke-virtual {p1}, Lcom/miui/gallery/provider/cache/MediaItem;->getAliasClearThumbnail()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    return-object p1

    :cond_4
    const/4 p1, 0x0

    return-object p1
.end method
