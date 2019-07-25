.class Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper;
.super Ljava/lang/Object;
.source "MediaScanner.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/scanner/MediaScanner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "MediaScannerHelper"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper$FileComparator;,
        Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper$MediaFileFilter;,
        Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper$FileEntry;
    }
.end annotation


# static fields
.field private static sAlbumPatternMap:Landroid/util/ArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/ArrayMap<",
            "Ljava/util/regex/Pattern;",
            "Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$Attributes;",
            ">;"
        }
    .end annotation
.end field

.field private static sFileComparator:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation
.end field

.field private static sHideAlbumPatterns:[Ljava/util/regex/Pattern;

.field private static sIgnoreAlbumPatterns:[Ljava/util/regex/Pattern;

.field private static sNonHiddenPathPrefixList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final sSyncLock:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper;->sSyncLock:Ljava/lang/Object;

    return-void
.end method

.method private static getAlbumPatternMap()Landroid/util/ArrayMap;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/ArrayMap<",
            "Ljava/util/regex/Pattern;",
            "Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$Attributes;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper;->sSyncLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper;->sAlbumPatternMap:Landroid/util/ArrayMap;

    if-nez v1, :cond_1

    new-instance v1, Landroid/util/ArrayMap;

    invoke-direct {v1}, Landroid/util/ArrayMap;-><init>()V

    sput-object v1, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper;->sAlbumPatternMap:Landroid/util/ArrayMap;

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlStrategyHelper;->getAlbumPatterns()Ljava/util/List;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$AlbumPattern;

    invoke-virtual {v2}, Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$AlbumPattern;->getPattern()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_0

    invoke-virtual {v2}, Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$AlbumPattern;->getAttributes()Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$Attributes;

    move-result-object v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v3, :cond_0

    :try_start_1
    invoke-virtual {v2}, Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$AlbumPattern;->getPattern()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x2

    invoke-static {v3, v4}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v3

    sget-object v4, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper;->sAlbumPatternMap:Landroid/util/ArrayMap;

    invoke-virtual {v2}, Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$AlbumPattern;->getAttributes()Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$Attributes;

    move-result-object v2

    invoke-virtual {v4, v3, v2}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/util/regex/PatternSyntaxException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception v2

    :try_start_2
    const-string v3, "MediaScanner"

    const-string v4, "Invalid album regex pattern: %s"

    invoke-virtual {v2}, Ljava/util/regex/PatternSyntaxException;->getPattern()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v4, v2}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    :cond_1
    sget-object v1, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper;->sAlbumPatternMap:Landroid/util/ArrayMap;

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1
.end method

.method public static getAttributesByPath(Ljava/lang/String;)Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$Attributes;
    .locals 4

    const/4 v0, 0x0

    if-eqz p0, :cond_3

    sget-object v1, Lcom/miui/gallery/util/StorageUtils;->KEY_FOR_EMPTY_RELATIVE_PATH:Ljava/lang/String;

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper;->getAlbumPatternMap()Landroid/util/ArrayMap;

    move-result-object v1

    if-eqz v1, :cond_2

    invoke-virtual {v1}, Landroid/util/ArrayMap;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/regex/Pattern;

    invoke-virtual {v3, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/regex/Matcher;->find()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$Attributes;

    return-object p0

    :cond_2
    return-object v0

    :cond_3
    :goto_0
    return-object v0
.end method

.method public static getFileComparator()Ljava/util/Comparator;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Comparator<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper;->sFileComparator:Ljava/util/Comparator;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper$FileComparator;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper$FileComparator;-><init>(Lcom/miui/gallery/scanner/MediaScanner$1;)V

    sput-object v0, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper;->sFileComparator:Ljava/util/Comparator;

    :cond_0
    sget-object v0, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper;->sFileComparator:Ljava/util/Comparator;

    return-object v0
.end method

.method private static getHideAlbumPatterns()[Ljava/util/regex/Pattern;
    .locals 6

    sget-object v0, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper;->sSyncLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper;->sHideAlbumPatterns:[Ljava/util/regex/Pattern;

    if-nez v1, :cond_0

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlStrategyHelper;->getHiddenAlbums()Lcom/miui/gallery/cloudcontrol/strategies/HiddenAlbumsStrategy;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/miui/gallery/cloudcontrol/strategies/HiddenAlbumsStrategy;->getPatterns()Ljava/util/List;

    move-result-object v1

    invoke-static {v1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    new-array v2, v2, [Ljava/util/regex/Pattern;

    sput-object v2, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper;->sHideAlbumPatterns:[Ljava/util/regex/Pattern;

    const/4 v2, 0x0

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    sget-object v4, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper;->sHideAlbumPatterns:[Ljava/util/regex/Pattern;
    :try_end_1
    .catch Ljava/util/regex/PatternSyntaxException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    add-int/lit8 v5, v2, 0x1

    :try_start_2
    invoke-static {v3}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v3

    aput-object v3, v4, v2
    :try_end_2
    .catch Ljava/util/regex/PatternSyntaxException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move v2, v5

    goto :goto_0

    :catch_0
    move-exception v2

    goto :goto_1

    :catch_1
    move-exception v3

    move v5, v2

    move-object v2, v3

    :goto_1
    :try_start_3
    const-string v3, "MediaScanner"

    const-string v4, "Invalid hide album regex pattern: %s"

    invoke-virtual {v2}, Ljava/util/regex/PatternSyntaxException;->getPattern()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v4, v2}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    sget-object v2, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper;->sHideAlbumPatterns:[Ljava/util/regex/Pattern;

    add-int/lit8 v3, v5, 0x1

    const/4 v4, 0x0

    aput-object v4, v2, v5

    move v2, v3

    goto :goto_0

    :cond_0
    sget-object v1, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper;->sHideAlbumPatterns:[Ljava/util/regex/Pattern;

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v1
.end method

.method private static getIgnoreAlbumPatterns()[Ljava/util/regex/Pattern;
    .locals 6

    sget-object v0, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper;->sSyncLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper;->sIgnoreAlbumPatterns:[Ljava/util/regex/Pattern;

    if-nez v1, :cond_0

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlStrategyHelper;->getIgnoreAlbums()Lcom/miui/gallery/cloudcontrol/strategies/IgnoreAlbumsStrategy;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/miui/gallery/cloudcontrol/strategies/IgnoreAlbumsStrategy;->getPatterns()Ljava/util/List;

    move-result-object v1

    invoke-static {v1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    new-array v2, v2, [Ljava/util/regex/Pattern;

    sput-object v2, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper;->sIgnoreAlbumPatterns:[Ljava/util/regex/Pattern;

    const/4 v2, 0x0

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    sget-object v4, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper;->sIgnoreAlbumPatterns:[Ljava/util/regex/Pattern;
    :try_end_1
    .catch Ljava/util/regex/PatternSyntaxException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    add-int/lit8 v5, v2, 0x1

    :try_start_2
    invoke-static {v3}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v3

    aput-object v3, v4, v2
    :try_end_2
    .catch Ljava/util/regex/PatternSyntaxException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move v2, v5

    goto :goto_0

    :catch_0
    move-exception v2

    goto :goto_1

    :catch_1
    move-exception v3

    move v5, v2

    move-object v2, v3

    :goto_1
    :try_start_3
    const-string v3, "MediaScanner"

    const-string v4, "Invalid ignore album regex pattern: %s"

    invoke-virtual {v2}, Ljava/util/regex/PatternSyntaxException;->getPattern()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v4, v2}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    sget-object v2, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper;->sIgnoreAlbumPatterns:[Ljava/util/regex/Pattern;

    add-int/lit8 v3, v5, 0x1

    const/4 v4, 0x0

    aput-object v4, v2, v5

    move v2, v3

    goto :goto_0

    :cond_0
    sget-object v1, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper;->sIgnoreAlbumPatterns:[Ljava/util/regex/Pattern;

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v1
.end method

.method private static getNonHiddenPathPrefixList()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper;->sSyncLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper;->sNonHiddenPathPrefixList:Ljava/util/List;

    if-nez v1, :cond_0

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    sput-object v1, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper;->sNonHiddenPathPrefixList:Ljava/util/List;

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlStrategyHelper;->getHiddenAlbums()Lcom/miui/gallery/cloudcontrol/strategies/HiddenAlbumsStrategy;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/miui/gallery/cloudcontrol/strategies/HiddenAlbumsStrategy;->getNonHiddenPathPrefix()Ljava/util/List;

    move-result-object v2

    invoke-static {v2}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v2

    if-eqz v2, :cond_0

    sget-object v2, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper;->sNonHiddenPathPrefixList:Ljava/util/List;

    invoke-virtual {v1}, Lcom/miui/gallery/cloudcontrol/strategies/HiddenAlbumsStrategy;->getNonHiddenPathPrefix()Ljava/util/List;

    move-result-object v1

    invoke-interface {v2, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    :cond_0
    sget-object v1, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper;->sNonHiddenPathPrefixList:Ljava/util/List;

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public static isInHideList(Ljava/lang/String;)Z
    .locals 6

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_8

    sget-object v0, Lcom/miui/gallery/util/StorageUtils;->KEY_FOR_EMPTY_RELATIVE_PATH:Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_1

    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    move v2, v0

    move-object v0, p0

    :cond_1
    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/cloudcontrol/CloudControlStrategyHelper;->getAlbumByPath(Ljava/lang/String;)Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$Album;

    move-result-object v2

    const/4 v3, 0x1

    if-eqz v2, :cond_2

    invoke-virtual {v2}, Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$Album;->getAttributes()Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$Attributes;

    move-result-object v4

    if-eqz v4, :cond_2

    invoke-virtual {v2}, Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$Album;->getAttributes()Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$Attributes;

    move-result-object v2

    invoke-virtual {v2}, Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$Attributes;->isHide()Z

    move-result v2

    if-eqz v2, :cond_2

    return v3

    :cond_2
    sget-char v2, Ljava/io/File;->separatorChar:C

    invoke-virtual {v0, v2}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v2

    const/4 v4, -0x1

    if-ne v2, v4, :cond_1

    sget-object v0, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-ne v0, v4, :cond_3

    return v1

    :cond_3
    invoke-static {}, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper;->getNonHiddenPathPrefixList()Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    return v1

    :cond_5
    invoke-static {}, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper;->getHideAlbumPatterns()[Ljava/util/regex/Pattern;

    move-result-object v0

    if-eqz v0, :cond_7

    array-length v2, v0

    if-lez v2, :cond_7

    array-length v2, v0

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v2, :cond_7

    aget-object v5, v0, v4

    if-eqz v5, :cond_6

    invoke-virtual {v5, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/regex/Matcher;->find()Z

    move-result v5

    if-eqz v5, :cond_6

    invoke-static {p0}, Lcom/miui/gallery/scanner/MediaScanner;->access$600(Ljava/lang/String;)V

    return v3

    :cond_6
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_7
    return v1

    :cond_8
    :goto_1
    return v1
.end method

.method public static isInIgnoreList(Ljava/lang/String;)Z
    .locals 5

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_6

    sget-object v0, Lcom/miui/gallery/util/StorageUtils;->KEY_FOR_EMPTY_RELATIVE_PATH:Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    :cond_0
    sget-object v0, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v2, -0x1

    if-ne v0, v2, :cond_1

    return v1

    :cond_1
    invoke-static {}, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper;->getNonHiddenPathPrefixList()Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    return v1

    :cond_3
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p0

    invoke-static {}, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper;->getIgnoreAlbumPatterns()[Ljava/util/regex/Pattern;

    move-result-object v0

    if-eqz v0, :cond_5

    array-length v2, v0

    if-lez v2, :cond_5

    array-length v2, v0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_5

    aget-object v4, v0, v3

    if-eqz v4, :cond_4

    invoke-virtual {v4, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/regex/Matcher;->find()Z

    move-result v4

    if-eqz v4, :cond_4

    const/4 p0, 0x1

    return p0

    :cond_4
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_5
    return v1

    :cond_6
    :goto_1
    return v1
.end method

.method public static isOnlyLinkFileFolder(Ljava/lang/String;)Z
    .locals 0

    invoke-static {p0}, Lcom/miui/gallery/cloud/DownloadPathHelper;->isShareFolderRelativePath(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public static newFileFilter(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;Z)Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper$MediaFileFilter;
    .locals 1

    new-instance v0, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper$MediaFileFilter;

    invoke-direct {v0, p0, p1, p2}, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper$MediaFileFilter;-><init>(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;Z)V

    return-object v0
.end method
