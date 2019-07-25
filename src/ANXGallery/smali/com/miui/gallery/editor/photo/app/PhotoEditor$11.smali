.class Lcom/miui/gallery/editor/photo/app/PhotoEditor$11;
.super Ljava/lang/Object;
.source "PhotoEditor.java"

# interfaces
.implements Lcom/miui/gallery/editor/photo/app/ExportFragment$Callbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/app/PhotoEditor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private mStartTime:J

.field final synthetic this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$11;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private sampleExportTime(Ljava/lang/String;J)V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$11;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$1300(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Lcom/miui/gallery/editor/photo/app/Sampler;

    move-result-object v0

    const-string v1, "_main"

    const-wide/16 v2, 0x64

    div-long/2addr p2, v2

    invoke-virtual {v0, v1, p1, p2, p3}, Lcom/miui/gallery/editor/photo/app/Sampler;->recordNumericEvent(Ljava/lang/String;Ljava/lang/String;J)V

    return-void
.end method


# virtual methods
.method public doExport()Z
    .locals 8

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$11;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$000(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Lcom/miui/gallery/editor/photo/app/DraftManager;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iput-wide v1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$11;->mStartTime:J

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$11;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$1100(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Lcom/miui/gallery/editor/photo/app/ExportTask;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/miui/gallery/editor/photo/app/ExportTask;->prepareToExport(Lcom/miui/gallery/editor/photo/app/DraftManager;)V

    const-string v1, "PhotoEditor"

    const-string v2, "doExport start"

    invoke-static {v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$11;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$100(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Lcom/miui/gallery/editor/photo/origin/EditorOriginHandler;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$11;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$1100(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Lcom/miui/gallery/editor/photo/app/ExportTask;

    move-result-object v2

    invoke-virtual {v2}, Lcom/miui/gallery/editor/photo/app/ExportTask;->getExportUri()Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Lcom/miui/gallery/editor/photo/origin/EditorOriginHandler;->doExport(Lcom/miui/gallery/editor/photo/app/DraftManager;Landroid/net/Uri;)Z

    move-result v1

    const-string v2, "PhotoEditor"

    const-string v3, "doExport end, use time: %d"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iget-wide v6, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$11;->mStartTime:J

    sub-long/2addr v4, v6

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$11;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$1100(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Lcom/miui/gallery/editor/photo/app/ExportTask;

    move-result-object v2

    invoke-virtual {v2, v0, v1}, Lcom/miui/gallery/editor/photo/app/ExportTask;->onExport(Lcom/miui/gallery/editor/photo/app/DraftManager;Z)Z

    move-result v0

    const-string v1, "compress_finished"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$11;->mStartTime:J

    sub-long/2addr v2, v4

    invoke-direct {p0, v1, v2, v3}, Lcom/miui/gallery/editor/photo/app/PhotoEditor$11;->sampleExportTime(Ljava/lang/String;J)V

    return v0
.end method

.method public onCancelled(Z)V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$11;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$1100(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Lcom/miui/gallery/editor/photo/app/ExportTask;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/app/ExportTask;->onCancelled(Z)V

    const-string p1, "compress_cancelled"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$11;->mStartTime:J

    sub-long/2addr v0, v2

    invoke-direct {p0, p1, v0, v1}, Lcom/miui/gallery/editor/photo/app/PhotoEditor$11;->sampleExportTime(Ljava/lang/String;J)V

    return-void
.end method

.method public onExported(Z)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$11;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$1100(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Lcom/miui/gallery/editor/photo/app/ExportTask;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/app/ExportTask;->onPostExport(Z)V

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$11;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$1100(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Lcom/miui/gallery/editor/photo/app/ExportTask;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/app/ExportTask;->isExternalCall()Z

    move-result p1

    if-nez p1, :cond_0

    const-string p1, "PhotoEditor"

    const-string v0, "internal call, pass result"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance p1, Landroid/content/Intent;

    invoke-direct {p1}, Landroid/content/Intent;-><init>()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$11;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$1100(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Lcom/miui/gallery/editor/photo/app/ExportTask;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/app/ExportTask;->getExportUri()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/provider/GalleryOpenProvider;->translateToContent(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    const-string v1, "image/jpeg"

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    const-string v0, "photo_secret_id"

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$11;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$1100(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Lcom/miui/gallery/editor/photo/app/ExportTask;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/app/ExportTask;->getSecretId()J

    move-result-wide v1

    invoke-virtual {p1, v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$11;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    const/4 v1, -0x1

    invoke-virtual {v0, v1, p1}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->setActivityResult(ILandroid/content/Intent;)V

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$11;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    const/4 v0, 0x1

    invoke-static {p1, v0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$1000(Lcom/miui/gallery/editor/photo/app/PhotoEditor;Z)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$11;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {p1}, Lcom/miui/gallery/compat/app/ActivityCompat;->finishAfterTransition(Landroid/app/Activity;)V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$11;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$1100(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Lcom/miui/gallery/editor/photo/app/ExportTask;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/app/ExportTask;->closeExportDialog()V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$11;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    const v0, 0x7f100462

    invoke-static {p1, v0}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    :goto_0
    return-void
.end method
