.class abstract Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;
.super Ljava/lang/Object;
.source "CloudImageLoader.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/util/uil/CloudImageLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x402
    name = "ViewAware"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable<",
        "Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;",
        ">;"
    }
.end annotation


# instance fields
.field protected final mInternalType:Lcom/miui/gallery/sdk/download/DownloadType;

.field private final mInternalUri:Landroid/net/Uri;

.field private final mRequestTime:J

.field final synthetic this$0:Lcom/miui/gallery/util/uil/CloudImageLoader;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/util/uil/CloudImageLoader;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)V
    .locals 2

    iput-object p1, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;->this$0:Lcom/miui/gallery/util/uil/CloudImageLoader;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;->mRequestTime:J

    iput-object p2, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;->mInternalUri:Landroid/net/Uri;

    iput-object p3, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;->mInternalType:Lcom/miui/gallery/sdk/download/DownloadType;

    return-void
.end method


# virtual methods
.method public compareTo(Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;)I
    .locals 5

    const/4 v0, 0x1

    if-nez p1, :cond_0

    return v0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;->getRequestTime()J

    move-result-wide v1

    invoke-virtual {p1}, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;->getRequestTime()J

    move-result-wide v3

    sub-long/2addr v1, v3

    const-wide/16 v3, 0x0

    cmp-long p1, v1, v3

    if-lez p1, :cond_1

    return v0

    :cond_1
    cmp-long p1, v1, v3

    if-gez p1, :cond_2

    const/4 p1, -0x1

    return p1

    :cond_2
    const/4 p1, 0x0

    return p1
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    check-cast p1, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;->compareTo(Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;)I

    move-result p1

    return p1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3

    const/4 v0, 0x0

    if-eqz p1, :cond_4

    instance-of v1, p1, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;->getWrappedView()Landroid/view/View;

    move-result-object v1

    const/4 v2, 0x1

    if-nez v1, :cond_2

    move-object v1, p1

    check-cast v1, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;

    invoke-virtual {v1}, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;->getWrappedView()Landroid/view/View;

    move-result-object v1

    if-nez v1, :cond_2

    if-ne p0, p1, :cond_1

    const/4 v0, 0x1

    :cond_1
    return v0

    :cond_2
    invoke-virtual {p0}, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;->getWrappedView()Landroid/view/View;

    move-result-object v1

    check-cast p1, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;

    invoke-virtual {p1}, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;->getWrappedView()Landroid/view/View;

    move-result-object p1

    if-ne v1, p1, :cond_3

    const/4 v0, 0x1

    :cond_3
    return v0

    :cond_4
    :goto_0
    return v0
.end method

.method public abstract getDisplayOptions()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;
.end method

.method public abstract getDownloadType()Lcom/miui/gallery/sdk/download/DownloadType;
.end method

.method public abstract getImageAware()Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;
.end method

.method public abstract getImageSize()Lcom/nostra13/universalimageloader/core/assist/ImageSize;
.end method

.method final getInternalDownloadType()Lcom/miui/gallery/sdk/download/DownloadType;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;->mInternalType:Lcom/miui/gallery/sdk/download/DownloadType;

    return-object v0
.end method

.method final getInternalKey()Ljava/lang/String;
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;->getInternalUri()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {p0}, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;->getInternalDownloadType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/util/uil/CloudImageLoader;->access$000(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method final getInternalUri()Landroid/net/Uri;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;->mInternalUri:Landroid/net/Uri;

    return-object v0
.end method

.method public abstract getKey()Ljava/lang/String;
.end method

.method public abstract getLoadingListener()Lcom/miui/gallery/util/uil/CloudImageLoadingListener;
.end method

.method public abstract getLoadingProgressListener()Lcom/miui/gallery/util/uil/CloudImageLoadingProgressListener;
.end method

.method public getRegionDecodeRect()Landroid/graphics/RectF;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public final getRequestTime()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;->mRequestTime:J

    return-wide v0
.end method

.method public abstract getUri()Landroid/net/Uri;
.end method

.method public getWrappedView()Landroid/view/View;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;->getImageAware()Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;->getImageAware()Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;

    move-result-object v0

    invoke-interface {v0}, Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;->getWrappedView()Landroid/view/View;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public hashCode()I
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;->getWrappedView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    goto :goto_0

    :cond_0
    invoke-super {p0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    :goto_0
    return v0
.end method

.method public abstract needDisplay()Z
.end method
