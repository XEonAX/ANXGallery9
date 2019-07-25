.class Lcom/nexstreaming/nexeditorsdk/nexEngine$a;
.super Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$v;
.source "nexEngine.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nexstreaming/nexeditorsdk/nexEngine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "a"
.end annotation


# instance fields
.field final synthetic a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

.field private b:Lcom/nexstreaming/nexeditorsdk/module/nexExternalExportProvider;

.field private c:Lcom/nexstreaming/nexeditorsdk/nexExportListener;


# direct methods
.method public constructor <init>(Lcom/nexstreaming/nexeditorsdk/nexEngine;Lcom/nexstreaming/nexeditorsdk/module/nexExternalExportProvider;Lcom/nexstreaming/nexeditorsdk/nexExportListener;)V
    .locals 0

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$a;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-direct {p0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$v;-><init>()V

    iput-object p2, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$a;->b:Lcom/nexstreaming/nexeditorsdk/module/nexExternalExportProvider;

    iput-object p3, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$a;->c:Lcom/nexstreaming/nexeditorsdk/nexExportListener;

    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$a;->b:Lcom/nexstreaming/nexeditorsdk/module/nexExternalExportProvider;

    invoke-interface {v0}, Lcom/nexstreaming/nexeditorsdk/module/nexExternalExportProvider;->OnLastProcess()I

    return-void
.end method

.method public a(I)Z
    .locals 5

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;->EXPORT_WRITER_START_FAIL:Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;->NONE:Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;

    goto :goto_0

    :pswitch_1
    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;->INVALID_STATE:Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;

    goto :goto_0

    :pswitch_2
    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;->EXPORT_USER_CANCEL:Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;

    goto :goto_0

    :pswitch_3
    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;->EXPORT_WRITER_INIT_FAIL:Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;

    :goto_0
    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$a;->b:Lcom/nexstreaming/nexeditorsdk/module/nexExternalExportProvider;

    invoke-interface {v1, p1}, Lcom/nexstreaming/nexeditorsdk/module/nexExternalExportProvider;->OnEnd(I)Z

    move-result v1

    if-gez p1, :cond_0

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$a;->c:Lcom/nexstreaming/nexeditorsdk/nexExportListener;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$a;->c:Lcom/nexstreaming/nexeditorsdk/nexExportListener;

    invoke-interface {v2, v0}, Lcom/nexstreaming/nexeditorsdk/nexExportListener;->onExportFail(Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;)V

    :cond_0
    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$a;->c:Lcom/nexstreaming/nexeditorsdk/nexExportListener;

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v2, :cond_1

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$a;->c:Lcom/nexstreaming/nexeditorsdk/nexExportListener;

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Lcom/nexstreaming/nexeditorsdk/nexExportListener;->onExportDone(Landroid/graphics/Bitmap;)V

    goto :goto_2

    :cond_1
    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$a;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v2}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$600(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Lcom/nexstreaming/nexeditorsdk/nexEngineListener;

    move-result-object v2

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$a;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v2}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$600(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Lcom/nexstreaming/nexeditorsdk/nexEngineListener;

    move-result-object v2

    if-nez p1, :cond_2

    const/4 p1, 0x0

    goto :goto_1

    :cond_2
    const/4 p1, 0x1

    :goto_1
    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;->getValue()I

    move-result v0

    invoke-interface {v2, p1, v0}, Lcom/nexstreaming/nexeditorsdk/nexEngineListener;->onEncodingDone(ZI)V

    :cond_3
    :goto_2
    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$a;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {p1, v4}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$702(Lcom/nexstreaming/nexeditorsdk/nexEngine;Z)Z

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$a;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {p1, v3}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$102(Lcom/nexstreaming/nexeditorsdk/nexEngine;I)I

    return v1

    :pswitch_data_0
    .packed-switch -0x3
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public a([BI)Z
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$a;->b:Lcom/nexstreaming/nexeditorsdk/module/nexExternalExportProvider;

    invoke-interface {v0, p2, p1}, Lcom/nexstreaming/nexeditorsdk/module/nexExternalExportProvider;->OnPushData(I[B)Z

    move-result p1

    return p1
.end method

.method public b()I
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$a;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    iget-object v0, v0, Lcom/nexstreaming/nexeditorsdk/nexEngine;->async_facedetect_worker_list_:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public b(I)V
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$a;->c:Lcom/nexstreaming/nexeditorsdk/nexExportListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$a;->c:Lcom/nexstreaming/nexeditorsdk/nexExportListener;

    invoke-interface {v0, p1}, Lcom/nexstreaming/nexeditorsdk/nexExportListener;->onExportProgress(I)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$a;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$600(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Lcom/nexstreaming/nexeditorsdk/nexEngineListener;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$a;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$600(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Lcom/nexstreaming/nexeditorsdk/nexEngineListener;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/nexstreaming/nexeditorsdk/nexEngineListener;->onEncodingProgress(I)V

    :cond_1
    :goto_0
    return-void
.end method
