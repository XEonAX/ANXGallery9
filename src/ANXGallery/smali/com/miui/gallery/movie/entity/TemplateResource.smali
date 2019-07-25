.class public Lcom/miui/gallery/movie/entity/TemplateResource;
.super Lcom/miui/gallery/movie/entity/MovieResource;
.source "TemplateResource.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/movie/entity/MovieResource;-><init>()V

    return-void
.end method


# virtual methods
.method public getDownloadSrcPath()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/movie/entity/TemplateResource;->pathKey:Ljava/lang/String;

    invoke-static {v0}, Lcom/miui/gallery/movie/ui/factory/TemplateFactory;->getTemplateDir(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getStatNameString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "template-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/miui/gallery/movie/entity/TemplateResource;->label:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getStatTypeString()Ljava/lang/String;
    .locals 1

    const-string v0, "template"

    return-object v0
.end method
