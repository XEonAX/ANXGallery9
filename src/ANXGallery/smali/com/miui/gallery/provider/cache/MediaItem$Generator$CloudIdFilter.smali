.class Lcom/miui/gallery/provider/cache/MediaItem$Generator$CloudIdFilter;
.super Lcom/miui/gallery/provider/cache/Filter$CompareFilter;
.source "MediaItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/provider/cache/MediaItem$Generator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "CloudIdFilter"
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
.field private mId:J

.field private mIdSet:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "\\d+"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/provider/cache/MediaItem$Generator$CloudIdFilter;->ID_PATTERN:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>(Lcom/miui/gallery/provider/cache/Filter$Comparator;Ljava/lang/String;)V
    .locals 2

    const/4 v0, 0x0

    invoke-direct {p0, v0, p1, p2}, Lcom/miui/gallery/provider/cache/Filter$CompareFilter;-><init>(ILcom/miui/gallery/provider/cache/Filter$Comparator;Ljava/lang/String;)V

    sget-object v0, Lcom/miui/gallery/provider/cache/Filter$Comparator;->EQUALS:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    if-ne p1, v0, :cond_0

    invoke-static {p2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide p1

    iput-wide p1, p0, Lcom/miui/gallery/provider/cache/MediaItem$Generator$CloudIdFilter;->mId:J

    goto :goto_1

    :cond_0
    sget-object v0, Lcom/miui/gallery/provider/cache/Filter$Comparator;->IN:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    if-ne p1, v0, :cond_1

    new-instance p1, Landroid/util/ArraySet;

    invoke-direct {p1}, Landroid/util/ArraySet;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem$Generator$CloudIdFilter;->mIdSet:Ljava/util/Set;

    sget-object p1, Lcom/miui/gallery/provider/cache/MediaItem$Generator$CloudIdFilter;->ID_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {p1, p2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p1

    :goto_0
    invoke-virtual {p1}, Ljava/util/regex/Matcher;->find()Z

    move-result p2

    if-eqz p2, :cond_1

    iget-object p2, p0, Lcom/miui/gallery/provider/cache/MediaItem$Generator$CloudIdFilter;->mIdSet:Ljava/util/Set;

    invoke-virtual {p1}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

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

    invoke-virtual {p0, p1}, Lcom/miui/gallery/provider/cache/MediaItem$Generator$CloudIdFilter;->filter(Lcom/miui/gallery/provider/cache/MediaItem;)Lcom/miui/gallery/provider/cache/MediaItem;

    move-result-object p1

    return-object p1
.end method

.method public filter(Lcom/miui/gallery/provider/cache/MediaItem;)Lcom/miui/gallery/provider/cache/MediaItem;
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaItem$Generator$CloudIdFilter;->mComparator:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    sget-object v1, Lcom/miui/gallery/provider/cache/Filter$Comparator;->EQUALS:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    if-ne v0, v1, :cond_0

    invoke-static {p1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$400(Lcom/miui/gallery/provider/cache/MediaItem;)J

    move-result-wide v0

    iget-wide v2, p0, Lcom/miui/gallery/provider/cache/MediaItem$Generator$CloudIdFilter;->mId:J

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    return-object p1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaItem$Generator$CloudIdFilter;->mComparator:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    sget-object v1, Lcom/miui/gallery/provider/cache/Filter$Comparator;->IN:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaItem$Generator$CloudIdFilter;->mIdSet:Ljava/util/Set;

    invoke-static {p1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$400(Lcom/miui/gallery/provider/cache/MediaItem;)J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    return-object p1

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method
