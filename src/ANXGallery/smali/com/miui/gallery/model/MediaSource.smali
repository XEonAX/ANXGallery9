.class public Lcom/miui/gallery/model/MediaSource;
.super Lcom/miui/gallery/model/PhotoLoaderSource;
.source "MediaSource.java"


# static fields
.field private static sUriMatcher:Landroid/content/UriMatcher;


# direct methods
.method public constructor <init>()V
    .locals 4

    invoke-direct {p0}, Lcom/miui/gallery/model/PhotoLoaderSource;-><init>()V

    sget-object v0, Lcom/miui/gallery/model/MediaSource;->sUriMatcher:Landroid/content/UriMatcher;

    if-nez v0, :cond_0

    new-instance v0, Landroid/content/UriMatcher;

    const/4 v1, -0x1

    invoke-direct {v0, v1}, Landroid/content/UriMatcher;-><init>(I)V

    sput-object v0, Lcom/miui/gallery/model/MediaSource;->sUriMatcher:Landroid/content/UriMatcher;

    sget-object v0, Lcom/miui/gallery/model/MediaSource;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "media"

    const-string v2, "external/images/media/#"

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/model/MediaSource;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "media"

    const-string v2, "external/video/media/#"

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/model/MediaSource;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "media"

    const-string v2, "external/file/#"

    const/4 v3, 0x2

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/model/MediaSource;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "media"

    const-string v2, "internal/images/media/#"

    const/4 v3, 0x3

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/model/MediaSource;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "media"

    const-string v2, "internal/video/media/#"

    const/4 v3, 0x4

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/model/MediaSource;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "media"

    const-string v2, "internal/file/#"

    const/4 v3, 0x5

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    :cond_0
    return-void
.end method


# virtual methods
.method public createDataLoader(Landroid/content/Context;Landroid/net/Uri;Landroid/os/Bundle;)Lcom/miui/gallery/loader/BaseLoader;
    .locals 2

    sget-object v0, Lcom/miui/gallery/model/MediaSource;->sUriMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v0, p2}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v0

    packed-switch v0, :pswitch_data_0

    const/4 p1, 0x0

    return-object p1

    :pswitch_0
    new-instance v0, Lcom/miui/gallery/loader/MediaSetLoader;

    const/4 v1, 0x1

    invoke-direct {v0, p1, p2, p3, v1}, Lcom/miui/gallery/loader/MediaSetLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;Landroid/os/Bundle;Z)V

    return-object v0

    :pswitch_1
    new-instance v0, Lcom/miui/gallery/loader/MediaSetLoader;

    const/4 v1, 0x0

    invoke-direct {v0, p1, p2, p3, v1}, Lcom/miui/gallery/loader/MediaSetLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;Landroid/os/Bundle;Z)V

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public match(Landroid/net/Uri;Landroid/os/Bundle;)Z
    .locals 1

    if-eqz p1, :cond_0

    const-string p2, "content"

    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_0

    const-string p2, "media"

    invoke-virtual {p1}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method
