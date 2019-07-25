.class Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$2;
.super Ljava/lang/Object;
.source "ScreenAnimatorHelper.java"

# interfaces
.implements Lcom/miui/gallery/editor/photo/screen/home/ThumbnailAnimatorCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$2;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getThumbnailRect()[I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$2;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->access$400(Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;)[I

    move-result-object v0

    return-object v0
.end method

.method public getThumbnailStartLeft()I
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$2;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->access$400(Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;)[I

    move-result-object v0

    const/4 v1, 0x0

    aget v0, v0, v1

    return v0
.end method

.method public getThumbnailStartTop()I
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$2;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->access$400(Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;)[I

    move-result-object v0

    const/4 v1, 0x1

    aget v0, v0, v1

    return v0
.end method

.method public onAnimationStart()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$2;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->access$200(Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$2;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->startEnterAnimator()V

    return-void
.end method

.method public onAnimationUpdate(F)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$2;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->access$100(Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;)Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;

    move-result-object v0

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;->getShareBottomLine()Landroid/support/constraint/Guideline;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$2;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->access$300(Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;)Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0603fe

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    int-to-float v1, v1

    mul-float v1, v1, p1

    float-to-int v1, v1

    invoke-virtual {v0, v1}, Landroid/support/constraint/Guideline;->setGuidelineEnd(I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$2;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->access$100(Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;)Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;

    move-result-object v0

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;->getShareTopLine()Landroid/support/constraint/Guideline;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$2;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->access$300(Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;)Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f060404

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    int-to-float v1, v1

    mul-float v1, v1, p1

    float-to-int p1, v1

    invoke-virtual {v0, p1}, Landroid/support/constraint/Guideline;->setGuidelineBegin(I)V

    return-void
.end method

.method public onPrepareAnimatorStart()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$2;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->access$000(Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;)Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->configShareModeView()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$2;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->access$100(Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;)Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;

    move-result-object v0

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;->getShareBottomLine()Landroid/support/constraint/Guideline;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/constraint/Guideline;->setGuidelineEnd(I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$2;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->access$100(Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;)Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;

    move-result-object v0

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;->getShareTopLine()Landroid/support/constraint/Guideline;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/support/constraint/Guideline;->setGuidelineBegin(I)V

    return-void
.end method
