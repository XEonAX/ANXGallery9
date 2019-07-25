.class Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity$ParseTask;
.super Landroid/os/AsyncTask;
.source "MovieStoryPickActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ParseTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity$ParseTask;->this$0:Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity$ParseTask;-><init>(Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;)V

    return-void
.end method

.method private getSelection()Ljava/lang/String;
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity$ParseTask;->this$0:Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;

    invoke-static {v0}, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;->access$300(Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;)Ljava/util/Set;

    move-result-object v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity$ParseTask;->this$0:Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;

    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    invoke-static {v0, v1}, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;->access$302(Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;Ljava/util/Set;)Ljava/util/Set;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity$ParseTask;->this$0:Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;

    invoke-static {v0}, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;->access$300(Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;)Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity$ParseTask;->this$0:Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;

    invoke-static {v0}, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;->access$400(Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;)Lcom/miui/gallery/picker/helper/Picker;

    move-result-object v0

    invoke-interface {v0}, Lcom/miui/gallery/picker/helper/Picker;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iget-object v2, p0, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity$ParseTask;->this$0:Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;

    invoke-static {v2}, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;->access$300(Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;)Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    const-string v0, "%s IN (\'%s\')"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    const-string v3, "sha1"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "\',\'"

    iget-object v4, p0, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity$ParseTask;->this$0:Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;

    invoke-static {v4}, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;->access$300(Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;)Ljava/util/Set;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getUri()Landroid/net/Uri;
    .locals 3

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Media;->URI_OWNER_ALBUM_MEDIA:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "remove_duplicate_items"

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Boolean;
    .locals 9

    const/4 p1, 0x0

    const/4 v0, 0x0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity$ParseTask;->this$0:Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;

    invoke-virtual {v1}, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    invoke-direct {p0}, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity$ParseTask;->getUri()Landroid/net/Uri;

    move-result-object v3

    sget-object v4, Lcom/miui/gallery/movie/ui/adapter/StoryMoviePickAdapter;->PROJECTION:[Ljava/lang/String;

    invoke-direct {p0}, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity$ParseTask;->getSelection()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    const-string v7, "alias_create_time DESC "

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz v1, :cond_1

    :try_start_1
    invoke-interface {v1}, Landroid/database/Cursor;->getCount()I

    move-result v0

    iget-object v2, p0, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity$ParseTask;->this$0:Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3, v0}, Ljava/util/ArrayList;-><init>(I)V

    invoke-static {v2, v3}, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;->access$102(Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;Ljava/util/List;)Ljava/util/List;

    :goto_0
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity$ParseTask;->this$0:Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;

    invoke-static {v0}, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;->access$100(Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;)Ljava/util/List;

    move-result-object v0

    new-instance v2, Lcom/miui/gallery/card/model/MediaInfo;

    invoke-direct {v2, v1}, Lcom/miui/gallery/card/model/MediaInfo;-><init>(Landroid/database/Cursor;)V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x1

    goto :goto_1

    :catch_0
    move-exception v0

    goto :goto_2

    :catchall_0
    :cond_1
    :goto_1
    invoke-static {v1}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1

    :catchall_1
    move-object v1, v0

    goto :goto_1

    :catch_1
    move-exception v1

    move-object v8, v1

    move-object v1, v0

    move-object v0, v8

    :goto_2
    :try_start_2
    const-string v2, "MovieStoryPickActivity"

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity$ParseTask;->doInBackground([Ljava/lang/Void;)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method

.method protected onPostExecute(Ljava/lang/Boolean;)V
    .locals 7

    invoke-virtual {p0}, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity$ParseTask;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p1, "MovieStoryPickActivity"

    const-string v0, "onPostExecute: the task is cancel."

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-nez p1, :cond_1

    const-string p1, "MovieStoryPickActivity"

    const-string v0, "onPostExecute: fail."

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity$ParseTask;->this$0:Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;

    invoke-static {p1}, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;->access$100(Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;)Ljava/util/List;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result p1

    if-nez p1, :cond_2

    const-string p1, "MovieStoryPickActivity"

    const-string v0, "mMediaInfos is invalid ."

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_2
    :try_start_0
    iget-object p1, p0, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity$ParseTask;->this$0:Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;->access$202(Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity$ParseTask;)Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity$ParseTask;

    const/4 p1, 0x0

    move-object v1, v0

    :goto_0
    iget-object v2, p0, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity$ParseTask;->this$0:Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;

    invoke-static {v2}, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;->access$100(Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge p1, v2, :cond_5

    iget-object v2, p0, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity$ParseTask;->this$0:Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;

    invoke-static {v2}, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;->access$100(Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_3

    goto :goto_1

    :cond_3
    iget-object v2, p0, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity$ParseTask;->this$0:Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;

    invoke-static {v2}, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;->access$100(Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/card/model/MediaInfo;

    invoke-virtual {v2}, Lcom/miui/gallery/card/model/MediaInfo;->getUri()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/miui/gallery/provider/GalleryOpenProvider;->translateToContent(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    iget-object v3, p0, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity$ParseTask;->this$0:Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;

    invoke-static {v3}, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;->access$100(Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/miui/gallery/card/model/MediaInfo;

    invoke-virtual {v3}, Lcom/miui/gallery/card/model/MediaInfo;->getSha1()Ljava/lang/String;

    move-result-object v3

    if-nez v1, :cond_4

    new-instance v1, Landroid/content/ClipData;

    const-string v4, "data"

    const-string v5, "image/*"

    const-string v6, "text/uri-list"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    new-instance v6, Landroid/content/ClipData$Item;

    invoke-direct {v6, v3, v0, v2}, Landroid/content/ClipData$Item;-><init>(Ljava/lang/CharSequence;Landroid/content/Intent;Landroid/net/Uri;)V

    invoke-direct {v1, v4, v5, v6}, Landroid/content/ClipData;-><init>(Ljava/lang/CharSequence;[Ljava/lang/String;Landroid/content/ClipData$Item;)V

    goto :goto_1

    :cond_4
    new-instance v4, Landroid/content/ClipData$Item;

    invoke-direct {v4, v3, v0, v2}, Landroid/content/ClipData$Item;-><init>(Ljava/lang/CharSequence;Landroid/content/Intent;Landroid/net/Uri;)V

    invoke-virtual {v1, v4}, Landroid/content/ClipData;->addItem(Landroid/content/ClipData$Item;)V

    :goto_1
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_5
    iget-object p1, p0, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity$ParseTask;->this$0:Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;

    invoke-virtual {p1}, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;->getResultIntent()Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p1, v1}, Landroid/content/Intent;->setClipData(Landroid/content/ClipData;)V

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity$ParseTask;->this$0:Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;

    const/4 v1, -0x1

    invoke-virtual {v0, v1, p1}, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;->setResult(ILandroid/content/Intent;)V

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity$ParseTask;->this$0:Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;

    invoke-virtual {p1}, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;->finish()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception p1

    const-string v0, "MovieStoryPickActivity"

    invoke-virtual {p1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    :goto_2
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity$ParseTask;->onPostExecute(Ljava/lang/Boolean;)V

    return-void
.end method
