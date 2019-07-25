.class public Lcom/miui/gallery/movie/entity/AudioResource;
.super Lcom/miui/gallery/movie/entity/MovieResource;
.source "AudioResource.java"


# instance fields
.field private resType:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/movie/entity/MovieResource;-><init>()V

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;II)V
    .locals 0

    invoke-direct {p0, p2, p3, p4}, Lcom/miui/gallery/movie/entity/MovieResource;-><init>(Ljava/lang/String;II)V

    iput p1, p0, Lcom/miui/gallery/movie/entity/AudioResource;->resType:I

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/movie/entity/AudioResource;->isPackageAssets:Z

    const/16 p1, 0x11

    iput p1, p0, Lcom/miui/gallery/movie/entity/AudioResource;->downloadState:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/movie/entity/MovieResource;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/movie/entity/AudioResource;->srcPath:Ljava/lang/String;

    const-string p1, "local"

    iput-object p1, p0, Lcom/miui/gallery/movie/entity/AudioResource;->nameKey:Ljava/lang/String;

    const/4 p1, 0x2

    iput p1, p0, Lcom/miui/gallery/movie/entity/AudioResource;->resType:I

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/movie/entity/AudioResource;->isPackageAssets:Z

    return-void
.end method


# virtual methods
.method public getDownloadSrcPath()Ljava/lang/String;
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/movie/entity/AudioResource;->isPackageAssets:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/movie/entity/AudioResource;->srcPath:Ljava/lang/String;

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/movie/entity/AudioResource;->pathKey:Ljava/lang/String;

    invoke-static {v0}, Lcom/miui/gallery/movie/ui/factory/AudioFactory;->getAudioDownloadPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getResType()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/movie/entity/AudioResource;->resType:I

    return v0
.end method

.method public getStatNameString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "audio-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/miui/gallery/movie/entity/AudioResource;->label:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getStatTypeString()Ljava/lang/String;
    .locals 1

    const-string v0, "audio"

    return-object v0
.end method
