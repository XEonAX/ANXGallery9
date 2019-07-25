.class Lcom/nexstreaming/nexeditorsdk/nexEngine$2;
.super Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$e;
.source "nexEngine.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nexstreaming/nexeditorsdk/nexEngine;->export(Lcom/nexstreaming/nexeditorsdk/nexExportFormat;Lcom/nexstreaming/nexeditorsdk/nexExportListener;)Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:I

.field final synthetic c:Lcom/nexstreaming/nexeditorsdk/nexExportListener;

.field final synthetic d:Lcom/nexstreaming/nexeditorsdk/nexEngine;


# direct methods
.method constructor <init>(Lcom/nexstreaming/nexeditorsdk/nexEngine;Ljava/lang/String;ILcom/nexstreaming/nexeditorsdk/nexExportListener;)V
    .locals 0

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$2;->d:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    iput-object p2, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$2;->a:Ljava/lang/String;

    iput p3, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$2;->b:I

    iput-object p4, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$2;->c:Lcom/nexstreaming/nexeditorsdk/nexExportListener;

    invoke-direct {p0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$e;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Landroid/graphics/Bitmap;)V
    .locals 4

    sget-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->NONE:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    new-instance v1, Ljava/io/File;

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$2;->a:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    :cond_0
    :try_start_0
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    sget-object v1, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    iget v3, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$2;->b:I

    invoke-virtual {p1, v1, v3, v2}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    invoke-virtual {v2}, Ljava/io/FileOutputStream;->flush()V

    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    sget-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->EXPORT_WRITER_INIT_FAIL:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    :goto_0
    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$2;->c:Lcom/nexstreaming/nexeditorsdk/nexExportListener;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$2;->c:Lcom/nexstreaming/nexeditorsdk/nexExportListener;

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Lcom/nexstreaming/nexeditorsdk/nexExportListener;->onExportDone(Landroid/graphics/Bitmap;)V

    goto :goto_1

    :cond_1
    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$2;->d:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {p1}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$2400(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Lcom/nexstreaming/kminternal/nexvideoeditor/c;

    move-result-object p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$2;->d:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {p1}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$2400(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Lcom/nexstreaming/kminternal/nexvideoeditor/c;

    move-result-object p1

    invoke-interface {p1, v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/c;->b(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;)V

    :cond_2
    :goto_1
    return-void
.end method

.method public a(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;)V
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$2;->c:Lcom/nexstreaming/nexeditorsdk/nexExportListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$2;->c:Lcom/nexstreaming/nexeditorsdk/nexExportListener;

    invoke-virtual {p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->getValue()I

    move-result p1

    invoke-static {p1}, Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;->fromValue(I)Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;

    move-result-object p1

    invoke-interface {v0, p1}, Lcom/nexstreaming/nexeditorsdk/nexExportListener;->onExportFail(Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$2;->d:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$2400(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Lcom/nexstreaming/kminternal/nexvideoeditor/c;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$2;->d:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$2400(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Lcom/nexstreaming/kminternal/nexvideoeditor/c;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/c;->b(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;)V

    :cond_1
    :goto_0
    return-void
.end method
