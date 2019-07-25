.class Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment$3;
.super Ljava/lang/Object;
.source "FilterAdjustFragment.java"

# interfaces
.implements Lcom/miui/gallery/video/editor/widget/AdjustView$IAdjustEffectChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->initListener()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment$3;->this$0:Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public adjustBrightness(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment$3;->this$0:Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->access$900(Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;)Lcom/miui/gallery/video/editor/VideoEditor;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/miui/gallery/video/editor/VideoEditor;->adjustBrightness(I)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment$3;->this$0:Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->access$1000(Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;)Lcom/miui/gallery/video/editor/VideoEditor;

    move-result-object p1

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/miui/gallery/video/editor/VideoEditor;->setVideoEditorAdjust(Z)V

    return-void
.end method

.method public adjustContrast(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment$3;->this$0:Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->access$1300(Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;)Lcom/miui/gallery/video/editor/VideoEditor;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/miui/gallery/video/editor/VideoEditor;->adjustContrast(I)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment$3;->this$0:Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->access$1400(Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;)Lcom/miui/gallery/video/editor/VideoEditor;

    move-result-object p1

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/miui/gallery/video/editor/VideoEditor;->setVideoEditorAdjust(Z)V

    return-void
.end method

.method public adjustSaturation(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment$3;->this$0:Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->access$1100(Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;)Lcom/miui/gallery/video/editor/VideoEditor;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/miui/gallery/video/editor/VideoEditor;->adjustSaturation(I)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment$3;->this$0:Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->access$1200(Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;)Lcom/miui/gallery/video/editor/VideoEditor;

    move-result-object p1

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/miui/gallery/video/editor/VideoEditor;->setVideoEditorAdjust(Z)V

    return-void
.end method

.method public adjustSharpness(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment$3;->this$0:Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->access$1500(Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;)Lcom/miui/gallery/video/editor/VideoEditor;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/miui/gallery/video/editor/VideoEditor;->adjustSharpness(I)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment$3;->this$0:Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->access$1600(Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;)Lcom/miui/gallery/video/editor/VideoEditor;

    move-result-object p1

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/miui/gallery/video/editor/VideoEditor;->setVideoEditorAdjust(Z)V

    return-void
.end method

.method public adjustVignetteRange(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment$3;->this$0:Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->access$1700(Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;)Lcom/miui/gallery/video/editor/VideoEditor;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/miui/gallery/video/editor/VideoEditor;->adjustVignetteRange(I)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment$3;->this$0:Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;->access$1800(Lcom/miui/gallery/video/editor/fragment/FilterAdjustFragment;)Lcom/miui/gallery/video/editor/VideoEditor;

    move-result-object p1

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/miui/gallery/video/editor/VideoEditor;->setVideoEditorAdjust(Z)V

    return-void
.end method
