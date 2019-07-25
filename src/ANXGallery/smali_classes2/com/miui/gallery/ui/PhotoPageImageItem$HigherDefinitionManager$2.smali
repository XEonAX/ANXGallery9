.class Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager$2;
.super Ljava/lang/Object;
.source "PhotoPageImageItem.java"

# interfaces
.implements Landroid/view/animation/Animation$AnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->translateByActionBarVisibility(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;

.field final synthetic val$marginTop:I


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;I)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager$2;->this$1:Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;

    iput p2, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager$2;->val$marginTop:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .locals 2

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager$2;->this$1:Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->access$1200(Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;)Landroid/widget/TextView;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/TextView;->clearAnimation()V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager$2;->this$1:Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->access$1300(Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;)Landroid/view/ViewGroup$MarginLayoutParams;

    move-result-object p1

    iget v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager$2;->val$marginTop:I

    const/4 v1, 0x0

    invoke-virtual {p1, v1, v0, v1, v1}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager$2;->this$1:Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->access$1200(Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;)Landroid/widget/TextView;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/TextView;->requestLayout()V

    return-void
.end method

.method public onAnimationRepeat(Landroid/view/animation/Animation;)V
    .locals 0

    return-void
.end method

.method public onAnimationStart(Landroid/view/animation/Animation;)V
    .locals 0

    return-void
.end method
