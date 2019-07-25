.class Lcom/miui/gallery/video/editor/util/VideoEditorHelper$2;
.super Ljava/lang/Object;
.source "VideoEditorHelper.java"

# interfaces
.implements Lcom/miui/gallery/video/editor/ui/EncodeProgressDialog$OnCompletedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->onSave()V
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

    iput-object p1, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper$2;->this$0:Lcom/miui/gallery/video/editor/util/VideoEditorHelper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompleted(Ljava/lang/String;ZII)V
    .locals 4

    const-string v0, "VideoEditorHelper"

    const-string v1, "video save success: %s, and video encode error errorCode :%s"

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-static {p3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v1, v2, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    if-eqz p2, :cond_0

    const-string p2, "video_editor"

    const-string p3, "video_editor_export_success"

    invoke-static {p2, p3}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p2, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper$2;->this$0:Lcom/miui/gallery/video/editor/util/VideoEditorHelper;

    invoke-static {p2}, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->access$200(Lcom/miui/gallery/video/editor/util/VideoEditorHelper;)Lcom/miui/gallery/video/editor/util/VideoEditorHelper$VideoSaveManager;

    move-result-object p2

    invoke-virtual {p2, p1}, Lcom/miui/gallery/video/editor/util/VideoEditorHelper$VideoSaveManager;->handleVideoSave(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    const/4 p1, -0x1

    const/4 p2, 0x0

    if-ne p4, p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper$2;->this$0:Lcom/miui/gallery/video/editor/util/VideoEditorHelper;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->setVideoSaving(Z)V

    return-void

    :cond_1
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    const-string p4, "errorCode"

    invoke-static {p3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p1, p4, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p3, "video_editor"

    const-string p4, "video_editor_export_failed"

    invoke-static {p3, p4, p1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper$2;->this$0:Lcom/miui/gallery/video/editor/util/VideoEditorHelper;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->access$300(Lcom/miui/gallery/video/editor/util/VideoEditorHelper;)Landroid/app/Activity;

    move-result-object p1

    iget-object p3, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper$2;->this$0:Lcom/miui/gallery/video/editor/util/VideoEditorHelper;

    invoke-static {p3}, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->access$300(Lcom/miui/gallery/video/editor/util/VideoEditorHelper;)Landroid/app/Activity;

    move-result-object p3

    invoke-virtual {p3}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    const p4, 0x7f10072d

    invoke-virtual {p3, p4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p3

    invoke-static {p1, p3}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper$2;->this$0:Lcom/miui/gallery/video/editor/util/VideoEditorHelper;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->setVideoSaving(Z)V

    :goto_0
    return-void
.end method
