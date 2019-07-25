.class Lcom/miui/gallery/ui/CleanerRotateProgressBar$3$1;
.super Landroid/animation/AnimatorListenerAdapter;
.source "CleanerRotateProgressBar.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/CleanerRotateProgressBar$3;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/ui/CleanerRotateProgressBar$3;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/CleanerRotateProgressBar$3;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/CleanerRotateProgressBar$3$1;->this$1:Lcom/miui/gallery/ui/CleanerRotateProgressBar$3;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/ui/CleanerRotateProgressBar$3$1;->this$1:Lcom/miui/gallery/ui/CleanerRotateProgressBar$3;

    iget-object p1, p1, Lcom/miui/gallery/ui/CleanerRotateProgressBar$3;->this$0:Lcom/miui/gallery/ui/CleanerRotateProgressBar;

    iget-object p1, p1, Lcom/miui/gallery/ui/CleanerRotateProgressBar;->mSpaceNumberView:Lcom/miui/gallery/widget/EndTopCornerTextView;

    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Lcom/miui/gallery/widget/EndTopCornerTextView;->setVisibility(I)V

    iget-object p1, p0, Lcom/miui/gallery/ui/CleanerRotateProgressBar$3$1;->this$1:Lcom/miui/gallery/ui/CleanerRotateProgressBar$3;

    iget-object p1, p1, Lcom/miui/gallery/ui/CleanerRotateProgressBar$3;->this$0:Lcom/miui/gallery/ui/CleanerRotateProgressBar;

    iget-object p1, p1, Lcom/miui/gallery/ui/CleanerRotateProgressBar;->mEmptyValueView:Landroid/widget/ImageView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object p1, p0, Lcom/miui/gallery/ui/CleanerRotateProgressBar$3$1;->this$1:Lcom/miui/gallery/ui/CleanerRotateProgressBar$3;

    iget-object p1, p1, Lcom/miui/gallery/ui/CleanerRotateProgressBar$3;->this$0:Lcom/miui/gallery/ui/CleanerRotateProgressBar;

    iget-object p1, p1, Lcom/miui/gallery/ui/CleanerRotateProgressBar;->mEmptyValueView:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    check-cast p1, Landroid/graphics/drawable/AnimationDrawable;

    invoke-virtual {p1}, Landroid/graphics/drawable/AnimationDrawable;->start()V

    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 2

    iget-object p1, p0, Lcom/miui/gallery/ui/CleanerRotateProgressBar$3$1;->this$1:Lcom/miui/gallery/ui/CleanerRotateProgressBar$3;

    iget-object p1, p1, Lcom/miui/gallery/ui/CleanerRotateProgressBar$3;->this$0:Lcom/miui/gallery/ui/CleanerRotateProgressBar;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/miui/gallery/ui/CleanerRotateProgressBar;->showRingCircle(Z)V

    iget-object p1, p0, Lcom/miui/gallery/ui/CleanerRotateProgressBar$3$1;->this$1:Lcom/miui/gallery/ui/CleanerRotateProgressBar$3;

    iget-object p1, p1, Lcom/miui/gallery/ui/CleanerRotateProgressBar$3;->this$0:Lcom/miui/gallery/ui/CleanerRotateProgressBar;

    iget-object v0, p0, Lcom/miui/gallery/ui/CleanerRotateProgressBar$3$1;->this$1:Lcom/miui/gallery/ui/CleanerRotateProgressBar$3;

    iget-object v0, v0, Lcom/miui/gallery/ui/CleanerRotateProgressBar$3;->this$0:Lcom/miui/gallery/ui/CleanerRotateProgressBar;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/CleanerRotateProgressBar;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f100278

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/ui/CleanerRotateProgressBar;->setDescription(Ljava/lang/String;)V

    return-void
.end method
