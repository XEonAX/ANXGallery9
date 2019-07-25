.class final Lcom/miui/gallery/util/deleterecorder/DeleteRecorder$1;
.super Ljava/lang/Object;
.source "DeleteRecorder.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/util/deleterecorder/DeleteRecorder;->record(Lcom/miui/gallery/util/deleterecorder/DeleteRecord;Lcom/miui/gallery/util/deleterecorder/DeleteRecorder$RecordCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$callback:Lcom/miui/gallery/util/deleterecorder/DeleteRecorder$RecordCallback;

.field final synthetic val$record:Lcom/miui/gallery/util/deleterecorder/DeleteRecord;


# direct methods
.method constructor <init>(Lcom/miui/gallery/util/deleterecorder/DeleteRecord;Lcom/miui/gallery/util/deleterecorder/DeleteRecorder$RecordCallback;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/util/deleterecorder/DeleteRecorder$1;->val$record:Lcom/miui/gallery/util/deleterecorder/DeleteRecord;

    iput-object p2, p0, Lcom/miui/gallery/util/deleterecorder/DeleteRecorder$1;->val$callback:Lcom/miui/gallery/util/deleterecorder/DeleteRecorder$RecordCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/util/deleterecorder/DeleteRecorder$1;->val$record:Lcom/miui/gallery/util/deleterecorder/DeleteRecord;

    if-nez v0, :cond_0

    const-string v0, "DeleteRecorder"

    const-string v1, "illegal record"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    const-string v0, "DeleteRecorder"

    const-string v1, "Start to insert %s"

    iget-object v2, p0, Lcom/miui/gallery/util/deleterecorder/DeleteRecorder$1;->val$record:Lcom/miui/gallery/util/deleterecorder/DeleteRecord;

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {}, Lcom/miui/gallery/dao/GalleryEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryEntityManager;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/util/deleterecorder/DeleteRecorder$1;->val$record:Lcom/miui/gallery/util/deleterecorder/DeleteRecord;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/dao/GalleryEntityManager;->insert(Lcom/miui/gallery/dao/base/Entity;)Z

    move-result v0

    const-string v1, "DeleteRecorder"

    const-string v2, "Done inserting operation, result %s"

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :goto_0
    iget-object v1, p0, Lcom/miui/gallery/util/deleterecorder/DeleteRecorder$1;->val$callback:Lcom/miui/gallery/util/deleterecorder/DeleteRecorder$RecordCallback;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/util/deleterecorder/DeleteRecorder$1;->val$callback:Lcom/miui/gallery/util/deleterecorder/DeleteRecorder$RecordCallback;

    invoke-interface {v1, v0}, Lcom/miui/gallery/util/deleterecorder/DeleteRecorder$RecordCallback;->onRecord(I)V

    :cond_1
    return-void
.end method
