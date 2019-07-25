.class Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$ServerIdFilter;
.super Lcom/miui/gallery/provider/cache/Filter$CompareFilter;
.source "MediaItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ServerIdFilter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/provider/cache/Filter$CompareFilter<",
        "Lcom/miui/gallery/provider/cache/MediaItem;",
        ">;"
    }
.end annotation


# static fields
.field private static final ID_PATTERN:Ljava/util/regex/Pattern;


# instance fields
.field private mIdSet:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mServerId:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "[0-9]+"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$ServerIdFilter;->ID_PATTERN:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>(Lcom/miui/gallery/provider/cache/Filter$Comparator;Ljava/lang/String;)V
    .locals 1

    const/4 v0, -0x1

    invoke-direct {p0, v0, p1, p2}, Lcom/miui/gallery/provider/cache/Filter$CompareFilter;-><init>(ILcom/miui/gallery/provider/cache/Filter$Comparator;Ljava/lang/String;)V

    sget-object v0, Lcom/miui/gallery/provider/cache/Filter$Comparator;->EQUALS:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    if-ne p1, v0, :cond_0

    iput-object p2, p0, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$ServerIdFilter;->mServerId:Ljava/lang/String;

    goto :goto_1

    :cond_0
    sget-object v0, Lcom/miui/gallery/provider/cache/Filter$Comparator;->IN:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    if-ne p1, v0, :cond_1

    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$ServerIdFilter;->mIdSet:Ljava/util/Set;

    sget-object p1, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$ServerIdFilter;->ID_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {p1, p2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p1

    :goto_0
    invoke-virtual {p1}, Ljava/util/regex/Matcher;->find()Z

    move-result p2

    if-eqz p2, :cond_1

    iget-object p2, p0, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$ServerIdFilter;->mIdSet:Ljava/util/Set;

    invoke-virtual {p1}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p2, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    :goto_1
    return-void
.end method


# virtual methods
.method public bridge synthetic filter(Lcom/miui/gallery/provider/cache/CacheItem;)Lcom/miui/gallery/provider/cache/CacheItem;
    .locals 0

    check-cast p1, Lcom/miui/gallery/provider/cache/MediaItem;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$ServerIdFilter;->filter(Lcom/miui/gallery/provider/cache/MediaItem;)Lcom/miui/gallery/provider/cache/MediaItem;

    move-result-object p1

    return-object p1
.end method

.method public filter(Lcom/miui/gallery/provider/cache/MediaItem;)Lcom/miui/gallery/provider/cache/MediaItem;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$ServerIdFilter;->mComparator:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    sget-object v1, Lcom/miui/gallery/provider/cache/Filter$Comparator;->EQUALS:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    if-ne v0, v1, :cond_0

    invoke-static {p1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$1600(Lcom/miui/gallery/provider/cache/MediaItem;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$ServerIdFilter;->mServerId:Ljava/lang/String;

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-object p1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$ServerIdFilter;->mComparator:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    sget-object v1, Lcom/miui/gallery/provider/cache/Filter$Comparator;->IN:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$ServerIdFilter;->mIdSet:Ljava/util/Set;

    invoke-static {p1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$1600(Lcom/miui/gallery/provider/cache/MediaItem;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    return-object p1

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$ServerIdFilter;->mComparator:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    sget-object v1, Lcom/miui/gallery/provider/cache/Filter$Comparator;->NOT_NULL:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    if-ne v0, v1, :cond_2

    invoke-static {p1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$1600(Lcom/miui/gallery/provider/cache/MediaItem;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2

    return-object p1

    :cond_2
    const/4 p1, 0x0

    return-object p1
.end method
