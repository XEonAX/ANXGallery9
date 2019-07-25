.class Lcom/miui/gallery/util/CheckDownloadOriginHelper$CheckOriginTask;
.super Landroid/os/AsyncTask;
.source "CheckDownloadOriginHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/util/CheckDownloadOriginHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "CheckOriginTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/util/List<",
        "Lcom/miui/gallery/util/CheckDownloadOriginHelper$MediaItem;",
        ">;>;"
    }
.end annotation


# instance fields
.field private final PROJECTION:[Ljava/lang/String;

.field private mContext:Landroid/content/Context;

.field final synthetic this$0:Lcom/miui/gallery/util/CheckDownloadOriginHelper;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/util/CheckDownloadOriginHelper;Landroid/content/Context;)V
    .locals 2

    iput-object p1, p0, Lcom/miui/gallery/util/CheckDownloadOriginHelper$CheckOriginTask;->this$0:Lcom/miui/gallery/util/CheckDownloadOriginHelper;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    const-string p1, "_id"

    const-string v0, "size"

    const-string v1, "localFile"

    filled-new-array {p1, v0, v1}, [Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/util/CheckDownloadOriginHelper$CheckOriginTask;->PROJECTION:[Ljava/lang/String;

    iput-object p2, p0, Lcom/miui/gallery/util/CheckDownloadOriginHelper$CheckOriginTask;->mContext:Landroid/content/Context;

    return-void
.end method

.method private isLocalAlbum()Z
    .locals 9

    const-string v3, "_id = ? AND attributes&1 =0 "

    iget-object v0, p0, Lcom/miui/gallery/util/CheckDownloadOriginHelper$CheckOriginTask;->mContext:Landroid/content/Context;

    sget-object v1, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    const/4 v7, 0x0

    new-array v2, v7, [Ljava/lang/String;

    const/4 v8, 0x1

    new-array v4, v8, [Ljava/lang/String;

    iget-object v5, p0, Lcom/miui/gallery/util/CheckDownloadOriginHelper$CheckOriginTask;->this$0:Lcom/miui/gallery/util/CheckDownloadOriginHelper;

    invoke-static {v5}, Lcom/miui/gallery/util/CheckDownloadOriginHelper;->access$400(Lcom/miui/gallery/util/CheckDownloadOriginHelper;)J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v7

    new-instance v6, Lcom/miui/gallery/util/CheckDownloadOriginHelper$CheckOriginTask$1;

    invoke-direct {v6, p0}, Lcom/miui/gallery/util/CheckDownloadOriginHelper$CheckOriginTask$1;-><init>(Lcom/miui/gallery/util/CheckDownloadOriginHelper$CheckOriginTask;)V

    const/4 v5, 0x0

    invoke-static/range {v0 .. v6}, Lcom/miui/gallery/util/SafeDBUtil;->safeQuery(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/util/SafeDBUtil$QueryHandler;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v7, 0x1

    :cond_0
    return v7
.end method

.method private queryMediaItemByIds()Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/util/CheckDownloadOriginHelper$MediaItem;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "_id IN ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ","

    iget-object v2, p0, Lcom/miui/gallery/util/CheckDownloadOriginHelper$CheckOriginTask;->this$0:Lcom/miui/gallery/util/CheckDownloadOriginHelper;

    invoke-static {v2}, Lcom/miui/gallery/util/CheckDownloadOriginHelper;->access$500(Lcom/miui/gallery/util/CheckDownloadOriginHelper;)[J

    move-result-object v2

    invoke-static {v2}, Lcom/miui/gallery/util/MiscUtil;->arrayToList([J)Ljava/util/List;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ") AND "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "localFlag"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    iget-object v2, p0, Lcom/miui/gallery/util/CheckDownloadOriginHelper$CheckOriginTask;->mContext:Landroid/content/Context;

    sget-object v3, Lcom/miui/gallery/provider/GalleryContract$Media;->URI:Landroid/net/Uri;

    iget-object v4, p0, Lcom/miui/gallery/util/CheckDownloadOriginHelper$CheckOriginTask;->PROJECTION:[Ljava/lang/String;

    new-instance v8, Lcom/miui/gallery/util/CheckDownloadOriginHelper$CheckOriginTask$2;

    invoke-direct {v8, p0}, Lcom/miui/gallery/util/CheckDownloadOriginHelper$CheckOriginTask$2;-><init>(Lcom/miui/gallery/util/CheckDownloadOriginHelper$CheckOriginTask;)V

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-static/range {v2 .. v8}, Lcom/miui/gallery/util/SafeDBUtil;->safeQuery(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/util/SafeDBUtil$QueryHandler;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    return-object v0
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/util/CheckDownloadOriginHelper$CheckOriginTask;->doInBackground([Ljava/lang/Void;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Void;",
            ")",
            "Ljava/util/List<",
            "Lcom/miui/gallery/util/CheckDownloadOriginHelper$MediaItem;",
            ">;"
        }
    .end annotation

    invoke-direct {p0}, Lcom/miui/gallery/util/CheckDownloadOriginHelper$CheckOriginTask;->isLocalAlbum()Z

    move-result p1

    const/4 v0, 0x0

    if-nez p1, :cond_0

    const-string p1, "CheckDownloadOriginHelper"

    const-string v1, "album is not local"

    invoke-static {p1, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/util/CheckDownloadOriginHelper$CheckOriginTask;->queryMediaItemByIds()Ljava/util/List;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v1

    if-nez v1, :cond_1

    return-object v0

    :cond_1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/util/CheckDownloadOriginHelper$MediaItem;

    iget-object v2, v1, Lcom/miui/gallery/util/CheckDownloadOriginHelper$MediaItem;->mPath:Ljava/lang/String;

    invoke-static {v2}, Lcom/miui/gallery/util/FileUtils;->isFileExist(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    goto :goto_0

    :cond_2
    if-nez v0, :cond_3

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    :cond_3
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_4
    return-object v0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Ljava/util/List;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/util/CheckDownloadOriginHelper$CheckOriginTask;->onPostExecute(Ljava/util/List;)V

    return-void
.end method

.method protected onPostExecute(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/util/CheckDownloadOriginHelper$MediaItem;",
            ">;)V"
        }
    .end annotation

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/util/CheckDownloadOriginHelper$CheckOriginTask;->this$0:Lcom/miui/gallery/util/CheckDownloadOriginHelper;

    invoke-static {v0}, Lcom/miui/gallery/util/CheckDownloadOriginHelper;->access$100(Lcom/miui/gallery/util/CheckDownloadOriginHelper;)Lcom/miui/gallery/util/CheckDownloadOriginHelper$CheckDownloadOriginListener;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/util/CheckDownloadOriginHelper$CheckOriginTask;->this$0:Lcom/miui/gallery/util/CheckDownloadOriginHelper;

    invoke-static {v0}, Lcom/miui/gallery/util/CheckDownloadOriginHelper;->access$100(Lcom/miui/gallery/util/CheckDownloadOriginHelper;)Lcom/miui/gallery/util/CheckDownloadOriginHelper$CheckDownloadOriginListener;

    move-result-object v0

    invoke-interface {v0}, Lcom/miui/gallery/util/CheckDownloadOriginHelper$CheckDownloadOriginListener;->onStartDownload()V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/util/CheckDownloadOriginHelper$CheckOriginTask;->this$0:Lcom/miui/gallery/util/CheckDownloadOriginHelper;

    const/4 v1, 0x0

    invoke-static {v0, p1, v1}, Lcom/miui/gallery/util/CheckDownloadOriginHelper;->access$000(Lcom/miui/gallery/util/CheckDownloadOriginHelper;Ljava/util/List;Z)V

    goto :goto_0

    :cond_1
    const-string p1, "CheckDownloadOriginHelper"

    const-string v0, "no item to download"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/util/CheckDownloadOriginHelper$CheckOriginTask;->this$0:Lcom/miui/gallery/util/CheckDownloadOriginHelper;

    invoke-static {p1}, Lcom/miui/gallery/util/CheckDownloadOriginHelper;->access$100(Lcom/miui/gallery/util/CheckDownloadOriginHelper;)Lcom/miui/gallery/util/CheckDownloadOriginHelper$CheckDownloadOriginListener;

    move-result-object p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/util/CheckDownloadOriginHelper$CheckOriginTask;->this$0:Lcom/miui/gallery/util/CheckDownloadOriginHelper;

    invoke-static {p1}, Lcom/miui/gallery/util/CheckDownloadOriginHelper;->access$100(Lcom/miui/gallery/util/CheckDownloadOriginHelper;)Lcom/miui/gallery/util/CheckDownloadOriginHelper$CheckDownloadOriginListener;

    move-result-object p1

    invoke-interface {p1}, Lcom/miui/gallery/util/CheckDownloadOriginHelper$CheckDownloadOriginListener;->onComplete()V

    :cond_2
    :goto_0
    return-void
.end method
