.class Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$TitleFilter;
.super Lcom/miui/gallery/provider/cache/Filter$CompareFilter;
.source "MediaItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "TitleFilter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/provider/cache/Filter$CompareFilter<",
        "Lcom/miui/gallery/provider/cache/MediaItem;",
        ">;"
    }
.end annotation


# instance fields
.field private mFilterType:I


# direct methods
.method public constructor <init>(Lcom/miui/gallery/provider/cache/Filter$Comparator;Ljava/lang/String;)V
    .locals 1

    const/4 v0, -0x1

    invoke-direct {p0, v0, p1, p2}, Lcom/miui/gallery/provider/cache/Filter$CompareFilter;-><init>(ILcom/miui/gallery/provider/cache/Filter$Comparator;Ljava/lang/String;)V

    iput v0, p0, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$TitleFilter;->mFilterType:I

    iget-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$TitleFilter;->mArgument:Ljava/lang/String;

    const-string p2, "PANO"

    invoke-virtual {p1, p2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    iput p1, p0, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$TitleFilter;->mFilterType:I

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$TitleFilter;->mArgument:Ljava/lang/String;

    const-string p2, "Screenshot"

    invoke-virtual {p1, p2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 p1, 0x2

    iput p1, p0, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$TitleFilter;->mFilterType:I

    :cond_1
    :goto_0
    return-void
.end method

.method private isPanoItem(Lcom/miui/gallery/provider/cache/MediaItem;)Z
    .locals 1

    invoke-direct {p0, p1}, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$TitleFilter;->isPanoItemSize(Lcom/miui/gallery/provider/cache/MediaItem;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0, p1}, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$TitleFilter;->isPanoItemNamed(Lcom/miui/gallery/provider/cache/MediaItem;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0, p1}, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$TitleFilter;->isSecretAlbumItem(Lcom/miui/gallery/provider/cache/MediaItem;)Z

    move-result p1

    if-nez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private isPanoItemNamed(Lcom/miui/gallery/provider/cache/MediaItem;)Z
    .locals 1

    if-eqz p1, :cond_0

    invoke-static {p1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$500(Lcom/miui/gallery/provider/cache/MediaItem;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {p1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$500(Lcom/miui/gallery/provider/cache/MediaItem;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "PANO"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private isPanoItemSize(Lcom/miui/gallery/provider/cache/MediaItem;)Z
    .locals 3

    const/4 v0, 0x0

    if-eqz p1, :cond_1

    invoke-static {p1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$700(Lcom/miui/gallery/provider/cache/MediaItem;)Ljava/lang/Integer;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-static {p1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$800(Lcom/miui/gallery/provider/cache/MediaItem;)Ljava/lang/Integer;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-static {p1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$700(Lcom/miui/gallery/provider/cache/MediaItem;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/16 v2, 0x438

    if-le v1, v2, :cond_0

    invoke-static {p1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$800(Lcom/miui/gallery/provider/cache/MediaItem;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {p1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$700(Lcom/miui/gallery/provider/cache/MediaItem;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    int-to-float v1, v1

    invoke-static {p1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$800(Lcom/miui/gallery/provider/cache/MediaItem;)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    int-to-float p1, p1

    div-float/2addr v1, p1

    const/high16 p1, 0x40400000    # 3.0f

    cmpl-float p1, v1, p1

    if-lez p1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0

    :cond_1
    return v0
.end method

.method private isScreenshotItem(Lcom/miui/gallery/provider/cache/MediaItem;)Z
    .locals 1

    if-eqz p1, :cond_0

    invoke-static {p1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$500(Lcom/miui/gallery/provider/cache/MediaItem;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {p1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$500(Lcom/miui/gallery/provider/cache/MediaItem;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "Screenshot"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private isSecretAlbumItem(Lcom/miui/gallery/provider/cache/MediaItem;)Z
    .locals 4

    if-eqz p1, :cond_0

    invoke-static {p1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$900(Lcom/miui/gallery/provider/cache/MediaItem;)Ljava/lang/Long;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {p1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$900(Lcom/miui/gallery/provider/cache/MediaItem;)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    const-wide/16 v2, -0x3e8

    cmp-long p1, v0, v2

    if-nez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method


# virtual methods
.method public bridge synthetic filter(Lcom/miui/gallery/provider/cache/CacheItem;)Lcom/miui/gallery/provider/cache/CacheItem;
    .locals 0

    check-cast p1, Lcom/miui/gallery/provider/cache/MediaItem;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$TitleFilter;->filter(Lcom/miui/gallery/provider/cache/MediaItem;)Lcom/miui/gallery/provider/cache/MediaItem;

    move-result-object p1

    return-object p1
.end method

.method public filter(Lcom/miui/gallery/provider/cache/MediaItem;)Lcom/miui/gallery/provider/cache/MediaItem;
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$TitleFilter;->mComparator:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    sget-object v1, Lcom/miui/gallery/provider/cache/Filter$Comparator;->LIKE:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    const/4 v2, 0x0

    if-ne v0, v1, :cond_2

    iget v0, p0, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$TitleFilter;->mFilterType:I

    if-lez v0, :cond_2

    iget v0, p0, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$TitleFilter;->mFilterType:I

    packed-switch v0, :pswitch_data_0

    goto :goto_2

    :pswitch_0
    invoke-direct {p0, p1}, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$TitleFilter;->isScreenshotItem(Lcom/miui/gallery/provider/cache/MediaItem;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    move-object p1, v2

    :goto_0
    return-object p1

    :pswitch_1
    invoke-direct {p0, p1}, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$TitleFilter;->isPanoItem(Lcom/miui/gallery/provider/cache/MediaItem;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_1

    :cond_1
    move-object p1, v2

    :goto_1
    return-object p1

    :cond_2
    :goto_2
    return-object v2

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
