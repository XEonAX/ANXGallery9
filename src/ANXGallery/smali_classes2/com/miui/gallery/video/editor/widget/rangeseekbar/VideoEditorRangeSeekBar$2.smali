.class Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$2;
.super Ljava/lang/Object;
.source "VideoEditorRangeSeekBar.java"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->hideProgressBar(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;


# direct methods
.method constructor <init>(Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$2;->this$0:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$2;->this$0:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->access$202(Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;Z)Z

    iget-object p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$2;->this$0:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->access$302(Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;Landroid/animation/Animator;)Landroid/animation/Animator;

    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method
