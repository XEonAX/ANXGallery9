.class Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$4$1;
.super Ljava/lang/Object;
.source "VideoEditorFragment.java"

# interfaces
.implements Lcom/miui/gallery/video/editor/ui/AutoTrimProgressDialog$OnCompletedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$4;->onCompleted()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$4;


# direct methods
.method constructor <init>(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$4;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$4$1;->this$1:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$4;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompleted(ZLjava/lang/String;ILjava/lang/String;)V
    .locals 1

    iget-object p3, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$4$1;->this$1:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$4;

    iget-object p3, p3, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$4;->this$0:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    invoke-static {p3}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->access$400(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;)Lcom/miui/gallery/video/editor/VideoEditor;

    move-result-object p3

    if-nez p3, :cond_0

    const-string p1, "VideoEditorFragment"

    const-string p2, "the video editor is null with auto trim. "

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    iget-object p3, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$4$1;->this$1:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$4;

    iget-object p3, p3, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$4;->this$0:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    invoke-static {p3}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->access$600(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;)Lcom/miui/gallery/video/editor/widget/DisplayWrapper;

    move-result-object p3

    const/4 v0, 0x1

    invoke-virtual {p3, v0}, Lcom/miui/gallery/video/editor/widget/DisplayWrapper;->setAutoTrimEnable(Z)V

    iget-object p3, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$4$1;->this$1:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$4;

    iget-object p3, p3, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$4;->this$0:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    invoke-static {p3}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->access$700(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;)Lcom/miui/gallery/video/editor/util/VideoEditorHelper;

    move-result-object p3

    const/4 v0, 0x0

    invoke-virtual {p3, v0}, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->setVideoSaving(Z)V

    const/4 p3, 0x0

    if-eqz p1, :cond_1

    const-string p1, "VideoEditorFragment"

    const-string p4, "AutoTrimAction is success."

    invoke-static {p1, p4}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "video_editor"

    const-string p4, "video_editor_autotrim_success"

    invoke-static {p1, p4}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {p2}, Lcom/miui/gallery/video/editor/util/TempFileCollector;->add(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$4$1;->this$1:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$4;

    iget-object p1, p1, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$4;->this$0:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->access$400(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;)Lcom/miui/gallery/video/editor/VideoEditor;

    move-result-object p1

    new-instance p4, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$MyVideoLoadCompletedListener;

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$4$1;->this$1:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$4;

    iget-object v0, v0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$4;->this$0:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    invoke-direct {p4, v0, p3}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$MyVideoLoadCompletedListener;-><init>(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$1;)V

    invoke-virtual {p1, p2, p4}, Lcom/miui/gallery/video/editor/VideoEditor;->load(Ljava/lang/String;Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;)V

    goto :goto_0

    :cond_1
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    const-string p2, "errormsg"

    invoke-static {p4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, p2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p2, "video_editor"

    const-string v0, "video_editor_autotrim_failed"

    invoke-static {p2, v0, p1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$4$1;->this$1:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$4;

    iget-object p1, p1, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$4;->val$v:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$4$1;->this$1:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$4;

    iget-object p2, p2, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$4;->val$v:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const v0, 0x7f10072d

    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    const-string p1, "VideoEditorFragment"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "AutoTrimAction is fail, and video encode error  msg :"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$4$1;->this$1:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$4;

    iget-object p1, p1, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$4;->this$0:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->access$400(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;)Lcom/miui/gallery/video/editor/VideoEditor;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$4$1;->this$1:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$4;

    iget-object p2, p2, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$4;->this$0:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    invoke-static {p2}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->access$1000(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;)Landroid/net/Uri;

    move-result-object p2

    invoke-virtual {p2}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object p2

    new-instance p4, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$MyVideoLoadCompletedListener;

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$4$1;->this$1:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$4;

    iget-object v0, v0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$4;->this$0:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    invoke-direct {p4, v0, p3}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$MyVideoLoadCompletedListener;-><init>(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$1;)V

    invoke-virtual {p1, p2, p4}, Lcom/miui/gallery/video/editor/VideoEditor;->load(Ljava/lang/String;Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;)V

    :goto_0
    return-void
.end method
