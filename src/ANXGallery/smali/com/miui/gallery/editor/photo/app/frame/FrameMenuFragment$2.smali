.class Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment$2;
.super Ljava/lang/Object;
.source "FrameMenuFragment.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment$2;->this$0:Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 0

    int-to-float p2, p2

    invoke-virtual {p1}, Landroid/widget/SeekBar;->getMax()I

    move-result p1

    int-to-float p1, p1

    div-float/2addr p2, p1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment$2;->this$0:Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment;->access$200(Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment;)Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractFrameFragment;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractFrameFragment;->setScaleProgress(F)V

    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment$2;->this$0:Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment$2;->this$0:Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment;->access$000(Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment;)Lcom/miui/gallery/editor/photo/app/frame/FrameAdapter;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/app/frame/FrameAdapter;->getSelection()I

    move-result v1

    invoke-virtual {p1}, Landroid/widget/SeekBar;->getProgress()I

    move-result p1

    invoke-virtual {v0, v1, p1}, Lcom/miui/gallery/editor/photo/app/frame/FrameMenuFragment;->putStatus(II)V

    return-void
.end method
