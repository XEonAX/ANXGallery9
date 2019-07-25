.class Lcom/miui/gallery/ui/CleanerRotateProgressBar$3;
.super Ljava/lang/Object;
.source "CleanerRotateProgressBar.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/CleanerRotateProgressBar;->showEmptyAnim(J)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/CleanerRotateProgressBar;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/CleanerRotateProgressBar;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/CleanerRotateProgressBar$3;->this$0:Lcom/miui/gallery/ui/CleanerRotateProgressBar;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/CleanerRotateProgressBar$3;->this$0:Lcom/miui/gallery/ui/CleanerRotateProgressBar;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/miui/gallery/ui/CleanerRotateProgressBar;->access$002(Lcom/miui/gallery/ui/CleanerRotateProgressBar;Z)Z

    iget-object v0, p0, Lcom/miui/gallery/ui/CleanerRotateProgressBar$3;->this$0:Lcom/miui/gallery/ui/CleanerRotateProgressBar;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/CleanerRotateProgressBar;->cancelAllAnim()V

    iget-object v0, p0, Lcom/miui/gallery/ui/CleanerRotateProgressBar$3;->this$0:Lcom/miui/gallery/ui/CleanerRotateProgressBar;

    iget-object v0, v0, Lcom/miui/gallery/ui/CleanerRotateProgressBar;->mSpaceNumberView:Lcom/miui/gallery/widget/EndTopCornerTextView;

    const-string v1, "alpha"

    const/4 v2, 0x2

    new-array v2, v2, [F

    fill-array-data v2, :array_0

    invoke-static {v0, v1, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    const-wide/16 v1, 0xfa

    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    new-instance v1, Lmiui/view/animation/CubicEaseInOutInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/CubicEaseInOutInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    new-instance v1, Lcom/miui/gallery/ui/CleanerRotateProgressBar$3$1;

    invoke-direct {v1, p0}, Lcom/miui/gallery/ui/CleanerRotateProgressBar$3$1;-><init>(Lcom/miui/gallery/ui/CleanerRotateProgressBar$3;)V

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    return-void

    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method
