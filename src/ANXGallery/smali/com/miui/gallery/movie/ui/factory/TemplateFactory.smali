.class public Lcom/miui/gallery/movie/ui/factory/TemplateFactory;
.super Ljava/lang/Object;
.source "TemplateFactory.java"


# direct methods
.method public static getLocalTemplateEntities()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/movie/entity/TemplateResource;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    new-instance v1, Lcom/miui/gallery/movie/entity/TemplateResource;

    invoke-direct {v1}, Lcom/miui/gallery/movie/entity/TemplateResource;-><init>()V

    const v2, 0x7f0701d1

    iput v2, v1, Lcom/miui/gallery/movie/entity/TemplateResource;->imageId:I

    const v2, 0x7f1004a5

    iput v2, v1, Lcom/miui/gallery/movie/entity/TemplateResource;->stringId:I

    const/4 v2, 0x1

    iput-boolean v2, v1, Lcom/miui/gallery/movie/entity/TemplateResource;->isPackageAssets:Z

    const-string v2, "movieAssetsNormal"

    iput-object v2, v1, Lcom/miui/gallery/movie/entity/TemplateResource;->nameKey:Ljava/lang/String;

    const/16 v2, 0x11

    iput v2, v1, Lcom/miui/gallery/movie/entity/TemplateResource;->downloadState:I

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object v0
.end method

.method public static getTemplateDir(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/miui/gallery/movie/MovieConfig;->sTemplateDir:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
