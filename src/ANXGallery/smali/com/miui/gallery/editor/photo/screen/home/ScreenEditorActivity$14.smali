.class Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$14;
.super Ljava/lang/Object;
.source "ScreenEditorActivity.java"

# interfaces
.implements Lcom/miui/gallery/editor/photo/screen/base/ScreenRenderCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$14;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onComplete(Z)V
    .locals 1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$14;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->access$4000(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$14;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->access$1800(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;)Lcom/miui/gallery/editor/photo/app/ExportTask;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/app/ExportTask;->showExportDialog()V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$14;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->getRenderData()Lcom/miui/gallery/editor/photo/screen/core/ScreenRenderData;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$14;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->access$400(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;)Z

    move-result v0

    invoke-static {p1, v0}, Lcom/miui/gallery/editor/photo/screen/stat/ScreenEditorStatUtils;->statShowExportFragment(Lcom/miui/gallery/editor/photo/screen/core/ScreenRenderData;Z)V

    return-void

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$14;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->isSharePage()Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$14;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$14;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->access$1800(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;)Lcom/miui/gallery/editor/photo/app/ExportTask;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/app/ExportTask;->getExportUri()Landroid/net/Uri;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->access$2000(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;Landroid/net/Uri;)V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$14;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->finish()V

    goto :goto_0

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$14;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->configShareModeView()V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$14;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->access$100(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;)Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->startSharePageEnterAnimator()V

    :goto_0
    return-void
.end method

.method public setShareBitmap(Landroid/graphics/Bitmap;Z)V
    .locals 1

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$14;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->access$1300(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;)Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;

    move-result-object p2

    const/4 v0, 0x0

    invoke-virtual {p2, p1, v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->setShareBitmap(Landroid/graphics/Bitmap;Z)V

    return-void
.end method
