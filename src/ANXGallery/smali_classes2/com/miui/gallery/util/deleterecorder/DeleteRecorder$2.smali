.class final Lcom/miui/gallery/util/deleterecorder/DeleteRecorder$2;
.super Ljava/lang/Object;
.source "DeleteRecorder.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/util/deleterecorder/DeleteRecorder;->record(Ljava/util/Collection;Lcom/miui/gallery/util/deleterecorder/DeleteRecorder$RecordCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$callback:Lcom/miui/gallery/util/deleterecorder/DeleteRecorder$RecordCallback;

.field final synthetic val$operationRecords:Ljava/util/Collection;


# direct methods
.method constructor <init>(Ljava/util/Collection;Lcom/miui/gallery/util/deleterecorder/DeleteRecorder$RecordCallback;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/util/deleterecorder/DeleteRecorder$2;->val$operationRecords:Ljava/util/Collection;

    iput-object p2, p0, Lcom/miui/gallery/util/deleterecorder/DeleteRecorder$2;->val$callback:Lcom/miui/gallery/util/deleterecorder/DeleteRecorder$RecordCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/util/deleterecorder/DeleteRecorder$2;->val$operationRecords:Ljava/util/Collection;

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "DeleteRecorder"

    const-string v1, "illegal operationRecords"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    const-string v0, "DeleteRecorder"

    const-string v1, "Start to insert %s"

    const-string v2, "\n"

    iget-object v3, p0, Lcom/miui/gallery/util/deleterecorder/DeleteRecorder$2;->val$operationRecords:Ljava/util/Collection;

    invoke-static {v2, v3}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {}, Lcom/miui/gallery/dao/GalleryEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryEntityManager;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/util/deleterecorder/DeleteRecorder$2;->val$operationRecords:Ljava/util/Collection;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/dao/GalleryEntityManager;->insert(Ljava/util/Collection;)I

    move-result v0

    const-string v1, "DeleteRecorder"

    const-string v2, "Done inserting %d operations, affected %d rows"

    iget-object v3, p0, Lcom/miui/gallery/util/deleterecorder/DeleteRecorder$2;->val$operationRecords:Ljava/util/Collection;

    invoke-interface {v3}, Ljava/util/Collection;->size()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v1, v2, v3, v4}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    :goto_0
    iget-object v1, p0, Lcom/miui/gallery/util/deleterecorder/DeleteRecorder$2;->val$callback:Lcom/miui/gallery/util/deleterecorder/DeleteRecorder$RecordCallback;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/util/deleterecorder/DeleteRecorder$2;->val$callback:Lcom/miui/gallery/util/deleterecorder/DeleteRecorder$RecordCallback;

    invoke-interface {v1, v0}, Lcom/miui/gallery/util/deleterecorder/DeleteRecorder$RecordCallback;->onRecord(I)V

    :cond_1
    return-void
.end method
