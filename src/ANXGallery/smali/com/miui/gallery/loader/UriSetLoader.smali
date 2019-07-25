.class public Lcom/miui/gallery/loader/UriSetLoader;
.super Lcom/miui/gallery/loader/BaseLoader;
.source "UriSetLoader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/loader/UriSetLoader$UriDataSet;
    }
.end annotation


# instance fields
.field private mMimeType:Ljava/lang/String;

.field private mUri:Landroid/net/Uri;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/net/Uri;Landroid/os/Bundle;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/loader/BaseLoader;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/miui/gallery/loader/UriSetLoader;->mUri:Landroid/net/Uri;

    const-string p1, "mime_type"

    invoke-virtual {p3, p1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/loader/UriSetLoader;->mMimeType:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public loadInBackground()Lcom/miui/gallery/model/BaseDataSet;
    .locals 5

    new-instance v0, Lcom/miui/gallery/model/UriItem;

    iget-object v1, p0, Lcom/miui/gallery/loader/UriSetLoader;->mUri:Landroid/net/Uri;

    invoke-direct {v0, v1}, Lcom/miui/gallery/model/UriItem;-><init>(Landroid/net/Uri;)V

    iget-object v1, p0, Lcom/miui/gallery/loader/UriSetLoader;->mMimeType:Ljava/lang/String;

    const-string v2, "file"

    iget-object v3, p0, Lcom/miui/gallery/loader/UriSetLoader;->mUri:Landroid/net/Uri;

    invoke-virtual {v3}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    if-eqz v1, :cond_0

    const-string v2, "image/*"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    :cond_0
    iget-object v2, p0, Lcom/miui/gallery/loader/UriSetLoader;->mUri:Landroid/net/Uri;

    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/webkit/MimeTypeMap;->getFileExtensionFromUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_1

    invoke-static {}, Landroid/webkit/MimeTypeMap;->getSingleton()Landroid/webkit/MimeTypeMap;

    move-result-object v3

    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Landroid/webkit/MimeTypeMap;->getMimeTypeFromExtension(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_1

    move-object v1, v2

    :cond_1
    iget-object v2, p0, Lcom/miui/gallery/loader/UriSetLoader;->mUri:Landroid/net/Uri;

    invoke-virtual {v2}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    int-to-long v2, v2

    invoke-virtual {v0, v2, v3}, Lcom/miui/gallery/model/UriItem;->setKey(J)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object v2

    new-instance v3, Ljava/io/File;

    iget-object v4, p0, Lcom/miui/gallery/loader/UriSetLoader;->mUri:Landroid/net/Uri;

    invoke-virtual {v4}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->lastModified()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Lcom/miui/gallery/model/BaseDataItem;->setCreateTime(J)Lcom/miui/gallery/model/BaseDataItem;

    goto :goto_0

    :cond_2
    if-eqz v1, :cond_3

    const-string v2, "image/*"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    :cond_3
    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/loader/UriSetLoader;->mUri:Landroid/net/Uri;

    invoke-virtual {v1, v2}, Landroid/content/ContentResolver;->getType(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v1

    :cond_4
    iget-object v2, p0, Lcom/miui/gallery/loader/UriSetLoader;->mUri:Landroid/net/Uri;

    invoke-virtual {v2}, Landroid/net/Uri;->hashCode()I

    move-result v2

    int-to-long v2, v2

    invoke-virtual {v0, v2, v3}, Lcom/miui/gallery/model/UriItem;->setKey(J)Lcom/miui/gallery/model/BaseDataItem;

    :goto_0
    invoke-virtual {v0, v1}, Lcom/miui/gallery/model/UriItem;->setMimeType(Ljava/lang/String;)Lcom/miui/gallery/model/BaseDataItem;

    new-instance v1, Lcom/miui/gallery/loader/UriSetLoader$UriDataSet;

    invoke-direct {v1, v0}, Lcom/miui/gallery/loader/UriSetLoader$UriDataSet;-><init>(Lcom/miui/gallery/model/UriItem;)V

    return-object v1
.end method

.method public bridge synthetic loadInBackground()Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/loader/UriSetLoader;->loadInBackground()Lcom/miui/gallery/model/BaseDataSet;

    move-result-object v0

    return-object v0
.end method
