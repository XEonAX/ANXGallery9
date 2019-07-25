.class Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$7;
.super Ljava/lang/Object;
.source "ScreenEditorActivity.java"

# interfaces
.implements Lcom/miui/gallery/editor/photo/app/InitializeController$Callbacks;


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

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$7;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public doInitialize()I
    .locals 3

    sget-object v0, Lcom/miui/gallery/editor/photo/core/SdkManager;->INSTANCE:Lcom/miui/gallery/editor/photo/core/SdkManager;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$7;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->getApplication()Landroid/app/Application;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/core/SdkManager;->onAttach(Landroid/app/Application;)V

    sget-object v0, Lcom/miui/gallery/editor/photo/core/SdkManager;->INSTANCE:Lcom/miui/gallery/editor/photo/core/SdkManager;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/SdkManager;->onActivityCreate()V

    const/4 v0, 0x2

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$7;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->access$1200(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;)Lcom/miui/gallery/editor/photo/app/DraftManager;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/miui/gallery/editor/photo/app/DraftManager;->initializeForPreview(Z)Z

    move-result v1
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v1, :cond_0

    const/4 v0, 0x3

    :cond_0
    return v0

    :catch_0
    move-exception v1

    const-string v2, "ScreenEditorActivity"

    invoke-static {v2, v1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    return v0

    :catch_1
    move-exception v0

    const-string v1, "ScreenEditorActivity"

    invoke-static {v1, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 v0, 0x1

    return v0
.end method

.method public onDone()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$7;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->access$000(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;)Lcom/miui/gallery/editor/photo/screen/home/IScreenEditorController;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$7;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->access$1200(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;)Lcom/miui/gallery/editor/photo/app/DraftManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/app/DraftManager;->getPreview()Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/miui/gallery/editor/photo/screen/home/IScreenEditorController;->setPreviewBitmap(Landroid/graphics/Bitmap;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$7;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->access$1300(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;)Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$7;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->access$1200(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;)Lcom/miui/gallery/editor/photo/app/DraftManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/app/DraftManager;->getPreview()Landroid/graphics/Bitmap;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->setShareBitmap(Landroid/graphics/Bitmap;Z)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$7;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->access$1400(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$7;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->access$400(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$7;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->access$100(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;)Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->startEnterAnimator()V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$7;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->access$1502(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;Z)Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$7;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->access$1600(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$7;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->access$1700(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$7;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->access$000(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;)Lcom/miui/gallery/editor/photo/screen/home/IScreenEditorController;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$7;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->access$100(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;)Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;

    move-result-object v1

    iget-object v1, v1, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mThumbnailAnimatorCallback:Lcom/miui/gallery/editor/photo/screen/home/ThumbnailAnimatorCallback;

    invoke-interface {v0, v1}, Lcom/miui/gallery/editor/photo/screen/home/IScreenEditorController;->startScreenThumbnailAnimate(Lcom/miui/gallery/editor/photo/screen/home/ThumbnailAnimatorCallback;)V

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$7;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->access$500(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;)Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$7;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->access$1300(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;)Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$7;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->access$100(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;)Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;

    move-result-object v1

    iget-object v1, v1, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mShareViewAnimatorCallback:Lcom/miui/gallery/editor/photo/screen/home/ThumbnailAnimatorCallback;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenShareView;->startShareViewAnimator(Lcom/miui/gallery/editor/photo/screen/home/ThumbnailAnimatorCallback;)V

    :cond_3
    :goto_0
    return-void
.end method
