.class public Lcom/miui/gallery/video/editor/model/LocalResource;
.super Lcom/miui/gallery/net/resource/Resource;
.source "LocalResource.java"


# instance fields
.field public imageId:I

.field public isInternational:I

.field public nameKey:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/net/resource/Resource;-><init>()V

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/net/resource/Resource;-><init>()V

    iput-object p2, p0, Lcom/miui/gallery/video/editor/model/LocalResource;->type:Ljava/lang/String;

    iput p1, p0, Lcom/miui/gallery/video/editor/model/LocalResource;->imageId:I

    const/4 p1, 0x0

    iput p1, p0, Lcom/miui/gallery/video/editor/model/LocalResource;->isInternational:I

    return-void
.end method


# virtual methods
.method public isInternational()Z
    .locals 1

    iget v0, p0, Lcom/miui/gallery/video/editor/model/LocalResource;->isInternational:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
