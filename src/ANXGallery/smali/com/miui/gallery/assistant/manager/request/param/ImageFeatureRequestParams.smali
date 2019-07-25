.class public abstract Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureRequestParams;
.super Ljava/lang/Object;
.source "ImageFeatureRequestParams.java"

# interfaces
.implements Lcom/miui/gallery/assistant/manager/request/param/RequestParams;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/assistant/manager/request/param/RequestParams<",
        "TT;>;"
    }
.end annotation


# instance fields
.field protected mAllowedOverMetered:Z

.field protected mDownloadType:Lcom/miui/gallery/sdk/download/DownloadType;

.field protected mMediaFeatureItem:Lcom/miui/gallery/assistant/model/MediaFeatureItem;

.field protected mShouldDownloadIfNotExist:Z


# direct methods
.method public constructor <init>(Lcom/miui/gallery/assistant/model/MediaFeatureItem;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureRequestParams;->mMediaFeatureItem:Lcom/miui/gallery/assistant/model/MediaFeatureItem;

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureRequestParams;->mShouldDownloadIfNotExist:Z

    return-void
.end method

.method public constructor <init>(Lcom/miui/gallery/assistant/model/MediaFeatureItem;ZZLcom/miui/gallery/sdk/download/DownloadType;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureRequestParams;->mMediaFeatureItem:Lcom/miui/gallery/assistant/model/MediaFeatureItem;

    iput-boolean p2, p0, Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureRequestParams;->mShouldDownloadIfNotExist:Z

    iput-boolean p3, p0, Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureRequestParams;->mAllowedOverMetered:Z

    iput-object p4, p0, Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureRequestParams;->mDownloadType:Lcom/miui/gallery/sdk/download/DownloadType;

    return-void
.end method


# virtual methods
.method public getDownloadType()Lcom/miui/gallery/sdk/download/DownloadType;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureRequestParams;->mDownloadType:Lcom/miui/gallery/sdk/download/DownloadType;

    return-object v0
.end method

.method public getMediaFeatureItem()Lcom/miui/gallery/assistant/model/MediaFeatureItem;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureRequestParams;->mMediaFeatureItem:Lcom/miui/gallery/assistant/model/MediaFeatureItem;

    return-object v0
.end method

.method public isAllowedOverMetered()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureRequestParams;->mAllowedOverMetered:Z

    return v0
.end method

.method public isShouldDownloadIfNotExist()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureRequestParams;->mShouldDownloadIfNotExist:Z

    return v0
.end method
