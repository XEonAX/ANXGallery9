.class Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper$3;
.super Ljava/lang/Object;
.source "ExtraPhotoWrapper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;->callbackStarted(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;

.field final synthetic val$success:Z


# direct methods
.method constructor <init>(Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;Z)V
    .locals 0

    iput-object p1, p0, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper$3;->this$0:Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;

    iput-boolean p2, p0, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper$3;->val$success:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper$3;->this$0:Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;

    invoke-static {v0}, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;->access$200(Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;)Lcom/miui/extraphoto/sdk/IExtraPhotoService;

    move-result-object v0

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v0, p0, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper$3;->this$0:Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;

    invoke-static {v0}, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;->access$200(Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;)Lcom/miui/extraphoto/sdk/IExtraPhotoService;

    move-result-object v0

    invoke-interface {v0}, Lcom/miui/extraphoto/sdk/IExtraPhotoService;->resumeEcho()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "ExtraPhotoWrapper"

    invoke-static {v1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    :catch_1
    move-exception v0

    const-string v1, "ExtraPhotoWrapper"

    invoke-static {v1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper$3;->this$0:Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;

    invoke-static {v0}, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;->access$300(Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;)Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper$StartCallback;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper$3;->this$0:Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;

    invoke-static {v0}, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;->access$300(Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;)Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper$StartCallback;

    move-result-object v0

    iget-boolean v1, p0, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper$3;->val$success:Z

    invoke-interface {v0, v1}, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper$StartCallback;->onStarted(Z)V

    iget-object v0, p0, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper$3;->this$0:Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;->access$302(Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper$StartCallback;)Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper$StartCallback;

    :cond_1
    return-void
.end method
