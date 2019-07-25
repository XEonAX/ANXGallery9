.class Lcom/miui/gallery/net/library/LibraryDownloadManager$1;
.super Ljava/lang/Object;
.source "LibraryDownloadManager.java"

# interfaces
.implements Lcom/miui/gallery/net/download/Request$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/net/library/LibraryDownloadManager;->download(JZLjava/util/Set;Lcom/miui/gallery/assistant/library/LibraryManager$DownloadListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/net/library/LibraryDownloadManager;

.field final synthetic val$downloadingSet:Ljava/util/Set;

.field final synthetic val$libraryId:J

.field final synthetic val$libraryItem:Lcom/miui/gallery/assistant/library/LibraryItem;


# direct methods
.method constructor <init>(Lcom/miui/gallery/net/library/LibraryDownloadManager;JLcom/miui/gallery/assistant/library/LibraryItem;Ljava/util/Set;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/net/library/LibraryDownloadManager$1;->this$0:Lcom/miui/gallery/net/library/LibraryDownloadManager;

    iput-wide p2, p0, Lcom/miui/gallery/net/library/LibraryDownloadManager$1;->val$libraryId:J

    iput-object p4, p0, Lcom/miui/gallery/net/library/LibraryDownloadManager$1;->val$libraryItem:Lcom/miui/gallery/assistant/library/LibraryItem;

    iput-object p5, p0, Lcom/miui/gallery/net/library/LibraryDownloadManager$1;->val$downloadingSet:Ljava/util/Set;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onComplete(I)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/net/library/LibraryDownloadManager$1;->this$0:Lcom/miui/gallery/net/library/LibraryDownloadManager;

    invoke-static {v0}, Lcom/miui/gallery/net/library/LibraryDownloadManager;->access$100(Lcom/miui/gallery/net/library/LibraryDownloadManager;)Ljava/util/Set;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/net/library/LibraryDownloadManager$1;->val$libraryItem:Lcom/miui/gallery/assistant/library/LibraryItem;

    invoke-virtual {v1}, Lcom/miui/gallery/assistant/library/LibraryItem;->getId()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    if-nez p1, :cond_1

    const-string p1, "LibraryDownloadManager"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Library "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/miui/gallery/net/library/LibraryDownloadManager$1;->val$libraryItem:Lcom/miui/gallery/assistant/library/LibraryItem;

    invoke-virtual {v1}, Lcom/miui/gallery/assistant/library/LibraryItem;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " download success!"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/net/library/LibraryDownloadManager$1;->val$downloadingSet:Ljava/util/Set;

    iget-object v0, p0, Lcom/miui/gallery/net/library/LibraryDownloadManager$1;->val$libraryItem:Lcom/miui/gallery/assistant/library/LibraryItem;

    invoke-interface {p1, v0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    iget-object p1, p0, Lcom/miui/gallery/net/library/LibraryDownloadManager$1;->val$downloadingSet:Ljava/util/Set;

    invoke-interface {p1}, Ljava/util/Set;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/net/library/LibraryDownloadManager$1;->this$0:Lcom/miui/gallery/net/library/LibraryDownloadManager;

    iget-object v0, p0, Lcom/miui/gallery/net/library/LibraryDownloadManager$1;->val$downloadingSet:Ljava/util/Set;

    invoke-static {p1, v0}, Lcom/miui/gallery/net/library/LibraryDownloadManager;->access$200(Lcom/miui/gallery/net/library/LibraryDownloadManager;Ljava/util/Set;)Z

    move-result p1

    if-eqz p1, :cond_2

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/net/library/LibraryDownloadManager$1;->this$0:Lcom/miui/gallery/net/library/LibraryDownloadManager;

    iget-wide v0, p0, Lcom/miui/gallery/net/library/LibraryDownloadManager$1;->val$libraryId:J

    const/4 v2, 0x0

    invoke-static {p1, v0, v1, v2}, Lcom/miui/gallery/net/library/LibraryDownloadManager;->access$300(Lcom/miui/gallery/net/library/LibraryDownloadManager;JI)V

    goto :goto_0

    :cond_1
    const-string p1, "LibraryDownloadManager"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Library "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/miui/gallery/net/library/LibraryDownloadManager$1;->val$libraryItem:Lcom/miui/gallery/assistant/library/LibraryItem;

    invoke-virtual {v1}, Lcom/miui/gallery/assistant/library/LibraryItem;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " download failed!"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/net/library/LibraryDownloadManager$1;->this$0:Lcom/miui/gallery/net/library/LibraryDownloadManager;

    iget-wide v0, p0, Lcom/miui/gallery/net/library/LibraryDownloadManager$1;->val$libraryId:J

    const/4 v2, 0x1

    invoke-static {p1, v0, v1, v2}, Lcom/miui/gallery/net/library/LibraryDownloadManager;->access$300(Lcom/miui/gallery/net/library/LibraryDownloadManager;JI)V

    :cond_2
    :goto_0
    return-void
.end method

.method public onProgressUpdate(I)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/net/library/LibraryDownloadManager$1;->this$0:Lcom/miui/gallery/net/library/LibraryDownloadManager;

    iget-wide v1, p0, Lcom/miui/gallery/net/library/LibraryDownloadManager$1;->val$libraryId:J

    invoke-static {v0, v1, v2, p1}, Lcom/miui/gallery/net/library/LibraryDownloadManager;->access$000(Lcom/miui/gallery/net/library/LibraryDownloadManager;JI)V

    return-void
.end method

.method public onStart()V
    .locals 0

    return-void
.end method
