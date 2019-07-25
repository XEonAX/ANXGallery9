.class public final synthetic Lcom/miui/gallery/editor/photo/app/-$$Lambda$PreviewFragment$9T5imptqnC_YXmDiezFWi1c8434;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field private final synthetic f$0:Lcom/miui/gallery/editor/photo/app/PreviewFragment;

.field private final synthetic f$1:Landroid/support/constraint/ConstraintLayout$LayoutParams;


# direct methods
.method public synthetic constructor <init>(Lcom/miui/gallery/editor/photo/app/PreviewFragment;Landroid/support/constraint/ConstraintLayout$LayoutParams;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/-$$Lambda$PreviewFragment$9T5imptqnC_YXmDiezFWi1c8434;->f$0:Lcom/miui/gallery/editor/photo/app/PreviewFragment;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/-$$Lambda$PreviewFragment$9T5imptqnC_YXmDiezFWi1c8434;->f$1:Landroid/support/constraint/ConstraintLayout$LayoutParams;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/-$$Lambda$PreviewFragment$9T5imptqnC_YXmDiezFWi1c8434;->f$0:Lcom/miui/gallery/editor/photo/app/PreviewFragment;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/-$$Lambda$PreviewFragment$9T5imptqnC_YXmDiezFWi1c8434;->f$1:Landroid/support/constraint/ConstraintLayout$LayoutParams;

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->lambda$prepareShowEditFragment$87(Lcom/miui/gallery/editor/photo/app/PreviewFragment;Landroid/support/constraint/ConstraintLayout$LayoutParams;Landroid/animation/ValueAnimator;)V

    return-void
.end method
