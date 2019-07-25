.class public Lcom/miui/gallery/model/StorageSource;
.super Lcom/miui/gallery/model/PhotoLoaderSource;
.source "StorageSource.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/model/PhotoLoaderSource;-><init>()V

    return-void
.end method

.method private static isContentSchemeWithExtraPhotoItems(Landroid/net/Uri;Landroid/os/Bundle;)Z
    .locals 1

    if-eqz p0, :cond_0

    if-eqz p1, :cond_0

    const-string v0, "content"

    invoke-virtual {p0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const-string p0, "com.miui.gallery.extra.photo_items"

    invoke-virtual {p1, p0}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p0

    invoke-static {p0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method private static isFileScheme(Landroid/net/Uri;)Z
    .locals 1

    if-eqz p0, :cond_0

    const-string v0, "file"

    invoke-virtual {p0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method


# virtual methods
.method public createDataLoader(Landroid/content/Context;Landroid/net/Uri;Landroid/os/Bundle;)Lcom/miui/gallery/loader/BaseLoader;
    .locals 1

    new-instance v0, Lcom/miui/gallery/loader/StorageSetLoader;

    invoke-direct {v0, p1, p2, p3}, Lcom/miui/gallery/loader/StorageSetLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;Landroid/os/Bundle;)V

    return-object v0
.end method

.method public match(Landroid/net/Uri;Landroid/os/Bundle;)Z
    .locals 0

    invoke-static {p1, p2}, Lcom/miui/gallery/model/StorageSource;->isContentSchemeWithExtraPhotoItems(Landroid/net/Uri;Landroid/os/Bundle;)Z

    move-result p2

    if-nez p2, :cond_1

    invoke-static {p1}, Lcom/miui/gallery/model/StorageSource;->isFileScheme(Landroid/net/Uri;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    return p1
.end method
