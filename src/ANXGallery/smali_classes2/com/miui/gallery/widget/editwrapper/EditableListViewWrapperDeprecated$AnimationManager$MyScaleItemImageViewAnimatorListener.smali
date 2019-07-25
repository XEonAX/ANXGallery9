.class Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$MyScaleItemImageViewAnimatorListener;
.super Ljava/lang/Object;
.source "EditableListViewWrapperDeprecated.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MyScaleItemImageViewAnimatorListener"
.end annotation


# instance fields
.field private mImage:Landroid/widget/ImageView;

.field public mPrimaryMatrix:Landroid/graphics/Matrix;

.field final synthetic this$1:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;Landroid/widget/ImageView;)V
    .locals 1

    iput-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$MyScaleItemImageViewAnimatorListener;->this$1:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Landroid/graphics/Matrix;

    invoke-virtual {p2}, Landroid/widget/ImageView;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    iput-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$MyScaleItemImageViewAnimatorListener;->mPrimaryMatrix:Landroid/graphics/Matrix;

    iput-object p2, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$MyScaleItemImageViewAnimatorListener;->mImage:Landroid/widget/ImageView;

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 2

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$MyScaleItemImageViewAnimatorListener;->this$1:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;

    iget-object v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager$MyScaleItemImageViewAnimatorListener;->mImage:Landroid/widget/ImageView;

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;->access$1300(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;Landroid/widget/ImageView;F)V

    return-void
.end method
