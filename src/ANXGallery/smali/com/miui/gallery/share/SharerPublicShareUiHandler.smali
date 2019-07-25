.class public Lcom/miui/gallery/share/SharerPublicShareUiHandler;
.super Lcom/miui/gallery/share/PublicShareUiHandler;
.source "SharerPublicShareUiHandler.java"


# direct methods
.method public constructor <init>(Lcom/miui/gallery/share/ShareAlbumBaseActivity;Ljava/lang/String;Lcom/miui/gallery/share/CloudSharerMediaSet;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/share/PublicShareUiHandler;-><init>(Lcom/miui/gallery/share/ShareAlbumBaseActivity;Ljava/lang/String;Lcom/miui/gallery/share/CloudSharerMediaSet;)V

    return-void
.end method

.method private tryToRequestPublicUrl()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/share/SharerPublicShareUiHandler;->mFuturePublic:Lcom/miui/gallery/threadpool/Future;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/share/SharerPublicShareUiHandler;->mFuturePublic:Lcom/miui/gallery/threadpool/Future;

    invoke-interface {v0}, Lcom/miui/gallery/threadpool/Future;->isDone()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/share/SharerPublicShareUiHandler;->mFuturePublic:Lcom/miui/gallery/threadpool/Future;

    invoke-interface {v0}, Lcom/miui/gallery/threadpool/Future;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    new-instance v0, Lcom/miui/gallery/share/SharerPublicShareUiHandler$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/share/SharerPublicShareUiHandler$1;-><init>(Lcom/miui/gallery/share/SharerPublicShareUiHandler;)V

    iget-object v1, p0, Lcom/miui/gallery/share/SharerPublicShareUiHandler;->mAlbumId:Ljava/lang/String;

    invoke-virtual {p0, v1, v0}, Lcom/miui/gallery/share/SharerPublicShareUiHandler;->requestPublicUrl(Ljava/lang/String;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)Lcom/miui/gallery/threadpool/Future;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/share/SharerPublicShareUiHandler;->mFuturePublic:Lcom/miui/gallery/threadpool/Future;

    :cond_1
    return-void
.end method


# virtual methods
.method protected initPreferences()V
    .locals 0

    invoke-super {p0}, Lcom/miui/gallery/share/PublicShareUiHandler;->initPreferences()V

    invoke-direct {p0}, Lcom/miui/gallery/share/SharerPublicShareUiHandler;->tryToRequestPublicUrl()V

    return-void
.end method

.method protected final requestPublicUrl(Ljava/lang/String;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)Lcom/miui/gallery/threadpool/Future;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener<",
            "Ljava/lang/Void;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/miui/gallery/threadpool/Future<",
            "*>;"
        }
    .end annotation

    invoke-static {p1, p2}, Lcom/miui/gallery/share/AlbumShareUIManager;->requestPublicUrlForSharerAsync(Ljava/lang/String;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)Lcom/miui/gallery/threadpool/Future;

    move-result-object p1

    return-object p1
.end method
