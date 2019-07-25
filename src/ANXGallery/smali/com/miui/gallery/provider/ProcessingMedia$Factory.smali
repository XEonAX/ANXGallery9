.class final Lcom/miui/gallery/provider/ProcessingMedia$Factory;
.super Ljava/lang/Object;
.source "ProcessingMedia.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/provider/ProcessingMedia;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Factory"
.end annotation


# instance fields
.field private final context:Landroid/content/Context;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/provider/ProcessingMedia$Factory;->context:Landroid/content/Context;

    return-void
.end method

.method private getMediaStoreUri(JI)Landroid/net/Uri;
    .locals 1

    const/4 v0, 0x3

    if-ne p3, v0, :cond_0

    sget-object p3, Landroid/provider/MediaStore$Video$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {p3}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object p3

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p1}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p1

    goto :goto_0

    :cond_0
    sget-object p3, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {p3}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object p3

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p1}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p1

    :goto_0
    return-object p1
.end method

.method private getProcessingUri(J)Landroid/net/Uri;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/provider/ProcessingMedia$Factory;->context:Landroid/content/Context;

    invoke-static {v0, p1, p2}, Lcom/miui/gallery/photosapi/PhotosOemApi;->getQueryProcessingUri(Landroid/content/Context;J)Landroid/net/Uri;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method build(JLjava/lang/String;ILcom/miui/gallery/provider/ProcessingMedia$ProcessingMetadata;)Lcom/miui/gallery/provider/ProcessingMedia;
    .locals 10

    if-nez p4, :cond_0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/provider/ProcessingMedia$Factory;->getProcessingUri(J)Landroid/net/Uri;

    move-result-object v0

    :goto_0
    move-object v2, v0

    goto :goto_1

    :cond_0
    invoke-direct {p0, p1, p2, p4}, Lcom/miui/gallery/provider/ProcessingMedia$Factory;->getMediaStoreUri(JI)Landroid/net/Uri;

    move-result-object v0

    goto :goto_0

    :goto_1
    new-instance v0, Lcom/miui/gallery/provider/ProcessingMedia;

    const/4 v6, 0x0

    const/4 v9, 0x0

    move-object v1, v0

    move-wide v3, p1

    move-object v5, p3

    move v7, p4

    move-object v8, p5

    invoke-direct/range {v1 .. v9}, Lcom/miui/gallery/provider/ProcessingMedia;-><init>(Landroid/net/Uri;JLjava/lang/String;Ljava/lang/String;ILcom/miui/gallery/provider/ProcessingMedia$ProcessingMetadata;Lcom/miui/gallery/provider/ProcessingMedia$1;)V

    return-object v0
.end method
