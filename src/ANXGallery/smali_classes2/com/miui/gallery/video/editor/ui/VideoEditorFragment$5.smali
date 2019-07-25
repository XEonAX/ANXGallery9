.class Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$5;
.super Ljava/lang/Object;
.source "VideoEditorFragment.java"

# interfaces
.implements Lcom/miui/gallery/video/editor/interfaces/IVideoEditorListener$IVideoEditorFragmentCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$5;->this$0:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public changeEditMenu(Lcom/miui/gallery/video/editor/model/MenuFragmentData;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$5;->this$0:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->access$700(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;)Lcom/miui/gallery/video/editor/util/VideoEditorHelper;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->changeEditMenu(Lcom/miui/gallery/video/editor/model/MenuFragmentData;)V

    return-void
.end method

.method public getNavigatorData(I)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Lcom/miui/gallery/video/editor/model/MenuFragmentData;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$5;->this$0:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->access$700(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;)Lcom/miui/gallery/video/editor/util/VideoEditorHelper;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->getNavigatorData(I)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public getVideoEditor()Lcom/miui/gallery/video/editor/VideoEditor;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$5;->this$0:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->access$400(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;)Lcom/miui/gallery/video/editor/VideoEditor;

    move-result-object v0

    return-object v0
.end method

.method public isLoadSuccess()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$5;->this$0:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->access$800(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;)Z

    move-result v0

    return v0
.end method

.method public onCancel()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$5;->this$0:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->access$700(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;)Lcom/miui/gallery/video/editor/util/VideoEditorHelper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->onCancel()V

    return-void
.end method

.method public onSave()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$5;->this$0:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->access$700(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;)Lcom/miui/gallery/video/editor/util/VideoEditorHelper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->onSave()V

    return-void
.end method

.method public showNavEditMenu()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$5;->this$0:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->access$700(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;)Lcom/miui/gallery/video/editor/util/VideoEditorHelper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->showNavEditMenu()V

    return-void
.end method

.method public updateAudioVoiceView(Z)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$5;->this$0:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->access$700(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;)Lcom/miui/gallery/video/editor/util/VideoEditorHelper;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->updateAudioVoiceView(Z)V

    return-void
.end method

.method public updateAutoTrimView()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$5;->this$0:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->access$700(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;)Lcom/miui/gallery/video/editor/util/VideoEditorHelper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->updateAutoTrimView()V

    return-void
.end method

.method public updatePalyBtnView()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$5;->this$0:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->access$700(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;)Lcom/miui/gallery/video/editor/util/VideoEditorHelper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->updatePlayView()V

    return-void
.end method
