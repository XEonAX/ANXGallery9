.class public Lcom/miui/gallery/movie/utils/MovieStatUtils;
.super Ljava/lang/Object;
.source "MovieStatUtils.java"


# static fields
.field public static final DOWNLOAD_FAILED:Ljava/lang/String; = "-1"

.field public static final DOWNLOAD_SUCCESS:Ljava/lang/String; = "0"

.field public static final DURATION_LONG:Ljava/lang/String; = "long"

.field public static final DURATION_SHORT:Ljava/lang/String; = "short"

.field public static final FROM_NORMAL:Ljava/lang/String; = "movieAssetsNormal"

.field public static final FROM_STORY:Ljava/lang/String; = "story"

.field public static final PAGER_EDITOR:Ljava/lang/String; = "editor"

.field public static final PAGER_PREVIEW:Ljava/lang/String; = "preview"


# direct methods
.method public static statDownload(Lcom/miui/gallery/movie/entity/MovieResource;)V
    .locals 3

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "type"

    invoke-virtual {p0}, Lcom/miui/gallery/movie/entity/MovieResource;->getStatTypeString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "name"

    invoke-virtual {p0}, Lcom/miui/gallery/movie/entity/MovieResource;->getStatNameString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, v1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "movie"

    const-string v1, "movie_download"

    invoke-static {p0, v1, v0}, Lcom/miui/gallery/movie/utils/MovieSamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public static statDownloadResult(Lcom/miui/gallery/movie/entity/MovieResource;Z)V
    .locals 3

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "type"

    invoke-virtual {p0}, Lcom/miui/gallery/movie/entity/MovieResource;->getStatTypeString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "name"

    invoke-virtual {p0}, Lcom/miui/gallery/movie/entity/MovieResource;->getStatNameString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, v1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "success"

    if-eqz p1, :cond_0

    sget-object p1, Lcom/miui/gallery/movie/utils/MovieStatUtils;->DOWNLOAD_SUCCESS:Ljava/lang/String;

    goto :goto_0

    :cond_0
    sget-object p1, Lcom/miui/gallery/movie/utils/MovieStatUtils;->DOWNLOAD_FAILED:Ljava/lang/String;

    :goto_0
    invoke-virtual {v0, p0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "movie"

    const-string p1, "movie_download_result"

    invoke-static {p0, p1, v0}, Lcom/miui/gallery/movie/utils/MovieSamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public static statDurationClick(Lcom/miui/gallery/movie/entity/MovieInfo;ZZ)V
    .locals 2

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "size"

    iget-object p0, p0, Lcom/miui/gallery/movie/entity/MovieInfo;->imageList:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, v1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "pager"

    if-eqz p1, :cond_0

    sget-object p1, Lcom/miui/gallery/movie/utils/MovieStatUtils;->PAGER_PREVIEW:Ljava/lang/String;

    goto :goto_0

    :cond_0
    sget-object p1, Lcom/miui/gallery/movie/utils/MovieStatUtils;->PAGER_EDITOR:Ljava/lang/String;

    :goto_0
    invoke-virtual {v0, p0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "duration"

    if-eqz p2, :cond_1

    sget-object p1, Lcom/miui/gallery/movie/utils/MovieStatUtils;->DURATION_SHORT:Ljava/lang/String;

    goto :goto_1

    :cond_1
    sget-object p1, Lcom/miui/gallery/movie/utils/MovieStatUtils;->DURATION_LONG:Ljava/lang/String;

    :goto_1
    invoke-virtual {v0, p0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "movie"

    const-string p1, "movie_duration_click"

    invoke-static {p0, p1, v0}, Lcom/miui/gallery/movie/utils/MovieSamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public static statEditorMove(I)V
    .locals 2

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "size"

    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, v1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "movie"

    const-string v1, "movie_editor_move"

    invoke-static {p0, v1, v0}, Lcom/miui/gallery/movie/utils/MovieSamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public static statEnter(IZ)V
    .locals 2

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "size"

    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, v1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "from"

    if-eqz p1, :cond_0

    sget-object p1, Lcom/miui/gallery/movie/utils/MovieStatUtils;->FROM_STORY:Ljava/lang/String;

    goto :goto_0

    :cond_0
    sget-object p1, Lcom/miui/gallery/movie/utils/MovieStatUtils;->FROM_NORMAL:Ljava/lang/String;

    :goto_0
    invoke-virtual {v0, p0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "movie"

    const-string p1, "movie_enter"

    invoke-static {p0, p1, v0}, Lcom/miui/gallery/movie/utils/MovieSamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public static statItemChoose(Lcom/miui/gallery/movie/entity/MovieResource;)V
    .locals 3

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "type"

    invoke-virtual {p0}, Lcom/miui/gallery/movie/entity/MovieResource;->getStatTypeString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "name"

    invoke-virtual {p0}, Lcom/miui/gallery/movie/entity/MovieResource;->getStatNameString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, v1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "movie"

    const-string v1, "movie_item_choose"

    invoke-static {p0, v1, v0}, Lcom/miui/gallery/movie/utils/MovieSamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public static statMovieLibraryDownloadResult(Z)V
    .locals 2

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "success"

    if-eqz p0, :cond_0

    sget-object p0, Lcom/miui/gallery/movie/utils/MovieStatUtils;->DOWNLOAD_SUCCESS:Ljava/lang/String;

    goto :goto_0

    :cond_0
    sget-object p0, Lcom/miui/gallery/movie/utils/MovieStatUtils;->DOWNLOAD_FAILED:Ljava/lang/String;

    :goto_0
    invoke-virtual {v0, v1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "movie"

    const-string v1, "movie_library_download_result"

    invoke-static {p0, v1, v0}, Lcom/miui/gallery/movie/utils/MovieSamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public static statPreviewEnterEditPage(Z)V
    .locals 2

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "duration"

    if-eqz p0, :cond_0

    sget-object p0, Lcom/miui/gallery/movie/utils/MovieStatUtils;->DURATION_SHORT:Ljava/lang/String;

    goto :goto_0

    :cond_0
    sget-object p0, Lcom/miui/gallery/movie/utils/MovieStatUtils;->DURATION_LONG:Ljava/lang/String;

    :goto_0
    invoke-virtual {v0, v1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "movie"

    const-string v1, "movie_editor_preview_edit_click"

    invoke-static {p0, v1, v0}, Lcom/miui/gallery/movie/utils/MovieSamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public static statPreviewPlayBtn(Z)V
    .locals 2

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "duration"

    if-eqz p0, :cond_0

    sget-object p0, Lcom/miui/gallery/movie/utils/MovieStatUtils;->DURATION_SHORT:Ljava/lang/String;

    goto :goto_0

    :cond_0
    sget-object p0, Lcom/miui/gallery/movie/utils/MovieStatUtils;->DURATION_LONG:Ljava/lang/String;

    :goto_0
    invoke-virtual {v0, v1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "movie"

    const-string v1, "movie_editor_preview_play_click"

    invoke-static {p0, v1, v0}, Lcom/miui/gallery/movie/utils/MovieSamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public static statSaveClick(ZLcom/miui/gallery/movie/entity/MovieInfo;)V
    .locals 2

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "pager"

    if-eqz p0, :cond_0

    sget-object p0, Lcom/miui/gallery/movie/utils/MovieStatUtils;->PAGER_PREVIEW:Ljava/lang/String;

    goto :goto_0

    :cond_0
    sget-object p0, Lcom/miui/gallery/movie/utils/MovieStatUtils;->PAGER_EDITOR:Ljava/lang/String;

    :goto_0
    invoke-virtual {v0, v1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "template"

    iget-object v1, p1, Lcom/miui/gallery/movie/entity/MovieInfo;->template:Ljava/lang/String;

    invoke-virtual {v0, p0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "audio"

    iget-object p1, p1, Lcom/miui/gallery/movie/entity/MovieInfo;->audio:Ljava/lang/String;

    invoke-virtual {v0, p0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "movie"

    const-string p1, "movie_save_click"

    invoke-static {p0, p1, v0}, Lcom/miui/gallery/movie/utils/MovieSamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public static statSaveResult(Ljava/lang/String;)V
    .locals 2

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "success"

    invoke-virtual {v0, v1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "movie"

    const-string v1, "movie_save_result"

    invoke-static {p0, v1, v0}, Lcom/miui/gallery/movie/utils/MovieSamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public static statShareClick(Lcom/miui/gallery/movie/entity/MovieInfo;)V
    .locals 3

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "template"

    iget-object v2, p0, Lcom/miui/gallery/movie/entity/MovieInfo;->template:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "audio"

    iget-object p0, p0, Lcom/miui/gallery/movie/entity/MovieInfo;->audio:Ljava/lang/String;

    invoke-virtual {v0, v1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "movie"

    const-string v1, "movie_share_click"

    invoke-static {p0, v1, v0}, Lcom/miui/gallery/movie/utils/MovieSamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method
