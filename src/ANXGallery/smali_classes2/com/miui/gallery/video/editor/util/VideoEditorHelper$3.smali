.class Lcom/miui/gallery/video/editor/util/VideoEditorHelper$3;
.super Ljava/lang/Object;
.source "VideoEditorHelper.java"

# interfaces
.implements Lcom/miui/gallery/ui/ConfirmDialog$ConfirmDialogInterface;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->onBackPressed()Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/video/editor/util/VideoEditorHelper;


# direct methods
.method constructor <init>(Lcom/miui/gallery/video/editor/util/VideoEditorHelper;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper$3;->this$0:Lcom/miui/gallery/video/editor/util/VideoEditorHelper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/app/DialogFragment;)V
    .locals 0

    return-void
.end method

.method public onConfirm(Landroid/app/DialogFragment;)V
    .locals 1

    const-string p1, "video_editor"

    const-string v0, "cancel"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper$3;->this$0:Lcom/miui/gallery/video/editor/util/VideoEditorHelper;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->access$400(Lcom/miui/gallery/video/editor/util/VideoEditorHelper;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper$3;->this$0:Lcom/miui/gallery/video/editor/util/VideoEditorHelper;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->access$500(Lcom/miui/gallery/video/editor/util/VideoEditorHelper;)Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->exit()V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper$3;->this$0:Lcom/miui/gallery/video/editor/util/VideoEditorHelper;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->access$600(Lcom/miui/gallery/video/editor/util/VideoEditorHelper;)V

    :goto_0
    return-void
.end method
