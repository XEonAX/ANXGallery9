.class public Lcom/miui/gallery/util/GalleryDataCache;
.super Ljava/lang/Object;
.source "GalleryDataCache.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/util/GalleryDataCache$SingletonHolder;
    }
.end annotation


# instance fields
.field private mCacheMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/util/GalleryDataCache;->mCacheMap:Ljava/util/Map;

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/util/GalleryDataCache$1;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/util/GalleryDataCache;-><init>()V

    return-void
.end method

.method public static getInstance()Lcom/miui/gallery/util/GalleryDataCache;
    .locals 1

    sget-object v0, Lcom/miui/gallery/util/GalleryDataCache$SingletonHolder;->INSTANCE:Lcom/miui/gallery/util/GalleryDataCache;

    return-object v0
.end method


# virtual methods
.method public put(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/util/GalleryDataCache;->mCacheMap:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public remove(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            ")TV;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/util/GalleryDataCache;->mCacheMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return-object p1
.end method
