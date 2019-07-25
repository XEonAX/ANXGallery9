.class Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$MyStateChangeListener;
.super Ljava/lang/Object;
.source "VideoEditorFragment.java"

# interfaces
.implements Lcom/miui/gallery/video/editor/VideoEditor$StateChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MyStateChangeListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$MyStateChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$MyStateChangeListener;-><init>(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;)V

    return-void
.end method


# virtual methods
.method public onStateChanged(I)V
    .locals 1

    const/16 v0, -0x1f4

    if-eq p1, v0, :cond_2

    const/16 v0, 0xc8

    if-eq p1, v0, :cond_1

    const/16 v0, 0x1f4

    if-eq p1, v0, :cond_0

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$MyStateChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->access$1300(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;)Landroid/widget/ProgressBar;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/video/editor/util/ToolsUtil;->hideView(Landroid/view/View;)V

    goto :goto_0

    :pswitch_1
    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$MyStateChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->access$1300(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;)Landroid/widget/ProgressBar;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/video/editor/util/ToolsUtil;->hideView(Landroid/view/View;)V

    goto :goto_0

    :pswitch_2
    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$MyStateChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->access$1300(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;)Landroid/widget/ProgressBar;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/video/editor/util/ToolsUtil;->hideView(Landroid/view/View;)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$MyStateChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->access$1400(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;)V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$MyStateChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->access$1300(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;)Landroid/widget/ProgressBar;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/video/editor/util/ToolsUtil;->hideView(Landroid/view/View;)V

    goto :goto_0

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$MyStateChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->access$1200(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;)Landroid/app/Activity;

    move-result-object p1

    const v0, 0x7f10072e

    invoke-static {p1, v0}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$MyStateChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->exit()V

    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$MyStateChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->access$700(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;)Lcom/miui/gallery/video/editor/util/VideoEditorHelper;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->updatePlayView()V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_2
        :pswitch_0
    .end packed-switch
.end method

.method public onTimeChanged(I)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$MyStateChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->access$600(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;)Lcom/miui/gallery/video/editor/widget/DisplayWrapper;

    move-result-object p1

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/miui/gallery/video/editor/widget/DisplayWrapper;->showPlayProgress(Z)V

    return-void
.end method
