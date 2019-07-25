.class public Lcom/miui/gallery/video/editor/manager/VideoEditorDataManager;
.super Ljava/lang/Object;
.source "VideoEditorDataManager.java"


# direct methods
.method public static loadAudioData(Lcom/miui/gallery/video/editor/factory/VideoEditorModuleFactory;Ljava/util/List;)Ljava/util/ArrayList;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/video/editor/factory/VideoEditorModuleFactory;",
            "Ljava/util/List<",
            "Lcom/miui/gallery/video/editor/model/LocalResource;",
            ">;)",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/video/editor/LocalAudio;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/video/editor/model/LocalResource;

    if-eqz v1, :cond_0

    new-instance v2, Lcom/miui/gallery/video/editor/LocalAudio;

    invoke-direct {v2, v1}, Lcom/miui/gallery/video/editor/LocalAudio;-><init>(Lcom/miui/gallery/video/editor/model/LocalResource;)V

    if-eqz p0, :cond_1

    instance-of v3, p0, Lcom/miui/gallery/video/editor/factory/AudioFactory;

    if-eqz v3, :cond_1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-wide v4, v1, Lcom/miui/gallery/video/editor/model/LocalResource;->id:J

    invoke-virtual {p0, v4, v5}, Lcom/miui/gallery/video/editor/factory/VideoEditorModuleFactory;->getTemplateDir(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Lcom/miui/gallery/video/editor/LocalAudio;->getFileName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_1

    const/16 v3, 0x11

    invoke-virtual {v2, v3}, Lcom/miui/gallery/video/editor/LocalAudio;->setDownloadState(I)V

    invoke-virtual {v2, v1}, Lcom/miui/gallery/video/editor/LocalAudio;->setSrcPath(Ljava/lang/String;)V

    :cond_1
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_2
    return-object v0
.end method

.method public static loadSmartEffects(Ljava/util/List;)Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/video/editor/model/LocalResource;",
            ">;)",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/video/editor/SmartEffect;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-static {p0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/video/editor/model/LocalResource;

    if-eqz v1, :cond_0

    new-instance v2, Lcom/miui/gallery/video/editor/SmartEffect;

    invoke-direct {v2, v1}, Lcom/miui/gallery/video/editor/SmartEffect;-><init>(Lcom/miui/gallery/video/editor/model/LocalResource;)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method public static loadWaterMarks(Ljava/util/List;)Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/video/editor/model/LocalResource;",
            ">;)",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/video/editor/TextStyle;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-static {p0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/video/editor/model/LocalResource;

    if-nez v1, :cond_1

    goto :goto_0

    :cond_1
    invoke-static {}, Lcom/miui/gallery/util/BuildUtil;->isInternational()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-virtual {v1}, Lcom/miui/gallery/video/editor/model/LocalResource;->isInternational()Z

    move-result v2

    if-eqz v2, :cond_0

    :cond_2
    new-instance v2, Lcom/miui/gallery/video/editor/TextStyle;

    invoke-direct {v2, v1}, Lcom/miui/gallery/video/editor/TextStyle;-><init>(Lcom/miui/gallery/video/editor/model/LocalResource;)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_3
    return-object v0
.end method
