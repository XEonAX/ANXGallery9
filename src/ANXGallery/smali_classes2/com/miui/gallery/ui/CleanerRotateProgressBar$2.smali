.class Lcom/miui/gallery/ui/CleanerRotateProgressBar$2;
.super Landroid/animation/AnimatorListenerAdapter;
.source "CleanerRotateProgressBar.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/CleanerRotateProgressBar;->setNumber(JZLjava/lang/Runnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/CleanerRotateProgressBar;

.field final synthetic val$listenerAdapter:Landroid/animation/AnimatorListenerAdapter;

.field final synthetic val$number:I


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/CleanerRotateProgressBar;ILandroid/animation/AnimatorListenerAdapter;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/CleanerRotateProgressBar$2;->this$0:Lcom/miui/gallery/ui/CleanerRotateProgressBar;

    iput p2, p0, Lcom/miui/gallery/ui/CleanerRotateProgressBar$2;->val$number:I

    iput-object p3, p0, Lcom/miui/gallery/ui/CleanerRotateProgressBar$2;->val$listenerAdapter:Landroid/animation/AnimatorListenerAdapter;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2

    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/CleanerRotateProgressBar$2;->this$0:Lcom/miui/gallery/ui/CleanerRotateProgressBar;

    iget v0, p0, Lcom/miui/gallery/ui/CleanerRotateProgressBar$2;->val$number:I

    iget-object v1, p0, Lcom/miui/gallery/ui/CleanerRotateProgressBar$2;->val$listenerAdapter:Landroid/animation/AnimatorListenerAdapter;

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/ui/CleanerRotateProgressBar;->changeNumberEndStageAnim(ILandroid/animation/AnimatorListenerAdapter;)V

    return-void
.end method
