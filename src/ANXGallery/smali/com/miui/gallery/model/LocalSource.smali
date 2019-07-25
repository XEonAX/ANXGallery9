.class public Lcom/miui/gallery/model/LocalSource;
.super Lcom/miui/gallery/model/PhotoLoaderSource;
.source "LocalSource.java"


# static fields
.field private static sUriMatcher:Landroid/content/UriMatcher;


# direct methods
.method public constructor <init>()V
    .locals 5

    invoke-direct {p0}, Lcom/miui/gallery/model/PhotoLoaderSource;-><init>()V

    sget-object v0, Lcom/miui/gallery/model/LocalSource;->sUriMatcher:Landroid/content/UriMatcher;

    if-nez v0, :cond_0

    new-instance v0, Landroid/content/UriMatcher;

    const/4 v1, -0x1

    invoke-direct {v0, v1}, Landroid/content/UriMatcher;-><init>(I)V

    sput-object v0, Lcom/miui/gallery/model/LocalSource;->sUriMatcher:Landroid/content/UriMatcher;

    sget-object v0, Lcom/miui/gallery/model/LocalSource;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "media"

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/model/LocalSource;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "album_media"

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/model/LocalSource;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "share_album_media/#"

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/model/LocalSource;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "cloud_and_share"

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/model/LocalSource;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.open"

    const-string v2, "raw/*"

    const/4 v4, 0x1

    invoke-virtual {v0, v1, v2, v4}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/model/LocalSource;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "recent_discovered_media"

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    :cond_0
    return-void
.end method


# virtual methods
.method public createDataLoader(Landroid/content/Context;Landroid/net/Uri;Landroid/os/Bundle;)Lcom/miui/gallery/loader/BaseLoader;
    .locals 2

    sget-object v0, Lcom/miui/gallery/model/LocalSource;->sUriMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v0, p2}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v0

    packed-switch v0, :pswitch_data_0

    const/4 p1, 0x0

    return-object p1

    :pswitch_0
    new-instance v0, Lcom/miui/gallery/loader/StorageSetLoader;

    new-instance v1, Ljava/io/File;

    invoke-virtual {p2}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object p2

    invoke-direct {v1, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object p2

    invoke-direct {v0, p1, p2, p3}, Lcom/miui/gallery/loader/StorageSetLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;Landroid/os/Bundle;)V

    goto :goto_0

    :pswitch_1
    new-instance v0, Lcom/miui/gallery/loader/CloudSetLoader;

    invoke-direct {v0, p1, p2, p3}, Lcom/miui/gallery/loader/CloudSetLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;Landroid/os/Bundle;)V

    :goto_0
    return-object v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public match(Landroid/net/Uri;Landroid/os/Bundle;)Z
    .locals 1

    if-eqz p1, :cond_1

    const-string p2, "content"

    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1

    const-string p2, "com.miui.gallery.cloud.provider"

    invoke-virtual {p1}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_0

    const-string p2, "com.miui.gallery.open"

    invoke-virtual {p1}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1

    :cond_0
    sget-object p2, Lcom/miui/gallery/model/LocalSource;->sUriMatcher:Landroid/content/UriMatcher;

    invoke-virtual {p2, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result p1

    const/4 p2, -0x1

    if-eq p1, p2, :cond_1

    const/4 p1, 0x1

    return p1

    :cond_1
    const/4 p1, 0x0

    return p1
.end method
