.class Lcom/miui/gallery/provider/cache/SearchIconDiskCache$SingletonHolder;
.super Ljava/lang/Object;
.source "SearchIconDiskCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/provider/cache/SearchIconDiskCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SingletonHolder"
.end annotation


# static fields
.field private static INSTANCE:Lcom/miui/gallery/provider/cache/SearchIconDiskCache;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    new-instance v0, Lcom/miui/gallery/provider/cache/SearchIconDiskCache;

    new-instance v1, Ljava/io/File;

    invoke-static {}, Lcom/miui/gallery/util/StorageUtils;->getCacheDirectory()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const/16 v2, 0x15e

    const/high16 v3, 0x3200000

    const/4 v4, 0x0

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/miui/gallery/provider/cache/SearchIconDiskCache;-><init>(Ljava/io/File;IILcom/miui/gallery/provider/cache/SearchIconDiskCache$1;)V

    sput-object v0, Lcom/miui/gallery/provider/cache/SearchIconDiskCache$SingletonHolder;->INSTANCE:Lcom/miui/gallery/provider/cache/SearchIconDiskCache;

    return-void
.end method

.method static synthetic access$100()Lcom/miui/gallery/provider/cache/SearchIconDiskCache;
    .locals 1

    sget-object v0, Lcom/miui/gallery/provider/cache/SearchIconDiskCache$SingletonHolder;->INSTANCE:Lcom/miui/gallery/provider/cache/SearchIconDiskCache;

    return-object v0
.end method
