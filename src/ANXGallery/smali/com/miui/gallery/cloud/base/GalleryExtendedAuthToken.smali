.class public Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;
.super Ljava/lang/Object;
.source "GalleryExtendedAuthToken.java"


# instance fields
.field private mToken:Lcom/xiaomi/micloudsdk/data/ExtendedAuthToken;


# direct methods
.method public constructor <init>(Lcom/xiaomi/micloudsdk/data/ExtendedAuthToken;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;->mToken:Lcom/xiaomi/micloudsdk/data/ExtendedAuthToken;

    return-void
.end method

.method public static parse(Ljava/lang/String;)Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;
    .locals 2

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return-object v1

    :cond_0
    invoke-static {p0}, Lcom/xiaomi/micloudsdk/data/ExtendedAuthToken;->parse(Ljava/lang/String;)Lcom/xiaomi/micloudsdk/data/ExtendedAuthToken;

    move-result-object p0

    if-nez p0, :cond_1

    return-object v1

    :cond_1
    new-instance v0, Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;

    invoke-direct {v0, p0}, Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;-><init>(Lcom/xiaomi/micloudsdk/data/ExtendedAuthToken;)V

    return-object v0
.end method


# virtual methods
.method public getSecurity()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;->mToken:Lcom/xiaomi/micloudsdk/data/ExtendedAuthToken;

    iget-object v0, v0, Lcom/xiaomi/micloudsdk/data/ExtendedAuthToken;->security:Ljava/lang/String;

    return-object v0
.end method
