.class public Lcom/miui/gallery/imageloader/GalleryImageLoaderCache;
.super Ljava/lang/Object;
.source "GalleryImageLoaderCache.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/imageloader/GalleryImageLoaderCache$IPhotoBytesCache;,
        Lcom/miui/gallery/imageloader/GalleryImageLoaderCache$IMicroThumbCache;
    }
.end annotation


# static fields
.field private static sGalleryImageLoaderCache:Lcom/miui/gallery/imageloader/GalleryImageLoaderCache;


# instance fields
.field private mMicroThumbCache:Lcom/miui/gallery/imageloader/GalleryImageLoaderCache$IMicroThumbCache;

.field private mPhotoBytesCache:Lcom/miui/gallery/imageloader/GalleryImageLoaderCache$IPhotoBytesCache;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/miui/gallery/imageloader/GalleryImageLoaderCache;

    invoke-direct {v0}, Lcom/miui/gallery/imageloader/GalleryImageLoaderCache;-><init>()V

    sput-object v0, Lcom/miui/gallery/imageloader/GalleryImageLoaderCache;->sGalleryImageLoaderCache:Lcom/miui/gallery/imageloader/GalleryImageLoaderCache;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getInstance()Lcom/miui/gallery/imageloader/GalleryImageLoaderCache;
    .locals 1

    sget-object v0, Lcom/miui/gallery/imageloader/GalleryImageLoaderCache;->sGalleryImageLoaderCache:Lcom/miui/gallery/imageloader/GalleryImageLoaderCache;

    return-object v0
.end method


# virtual methods
.method public getMicroThumbCache()Lcom/miui/gallery/imageloader/GalleryImageLoaderCache$IMicroThumbCache;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/imageloader/GalleryImageLoaderCache;->mMicroThumbCache:Lcom/miui/gallery/imageloader/GalleryImageLoaderCache$IMicroThumbCache;

    return-object v0
.end method

.method public getPhotoBytesCache()Lcom/miui/gallery/imageloader/GalleryImageLoaderCache$IPhotoBytesCache;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/imageloader/GalleryImageLoaderCache;->mPhotoBytesCache:Lcom/miui/gallery/imageloader/GalleryImageLoaderCache$IPhotoBytesCache;

    return-object v0
.end method

.method public setMicroThumbCache(Lcom/miui/gallery/imageloader/GalleryImageLoaderCache$IMicroThumbCache;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/imageloader/GalleryImageLoaderCache;->mMicroThumbCache:Lcom/miui/gallery/imageloader/GalleryImageLoaderCache$IMicroThumbCache;

    return-void
.end method

.method public setPhotoBytesCache(Lcom/miui/gallery/imageloader/GalleryImageLoaderCache$IPhotoBytesCache;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/imageloader/GalleryImageLoaderCache;->mPhotoBytesCache:Lcom/miui/gallery/imageloader/GalleryImageLoaderCache$IPhotoBytesCache;

    return-void
.end method
