.class public final synthetic Lcom/miui/gallery/editor/photo/screen/home/-$$Lambda$ScreenEditViewAnimatorHelper$q0EIFqQ27MM_eqj0gNFxZ7o5Ft4;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field private final synthetic f$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditViewAnimatorHelper;

.field private final synthetic f$1:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditViewAnimatorHelper$Callback;


# direct methods
.method public synthetic constructor <init>(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditViewAnimatorHelper;Lcom/miui/gallery/editor/photo/screen/home/ScreenEditViewAnimatorHelper$Callback;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/-$$Lambda$ScreenEditViewAnimatorHelper$q0EIFqQ27MM_eqj0gNFxZ7o5Ft4;->f$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditViewAnimatorHelper;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/screen/home/-$$Lambda$ScreenEditViewAnimatorHelper$q0EIFqQ27MM_eqj0gNFxZ7o5Ft4;->f$1:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditViewAnimatorHelper$Callback;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/-$$Lambda$ScreenEditViewAnimatorHelper$q0EIFqQ27MM_eqj0gNFxZ7o5Ft4;->f$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditViewAnimatorHelper;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/home/-$$Lambda$ScreenEditViewAnimatorHelper$q0EIFqQ27MM_eqj0gNFxZ7o5Ft4;->f$1:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditViewAnimatorHelper$Callback;

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditViewAnimatorHelper;->lambda$animatorStart$45(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditViewAnimatorHelper;Lcom/miui/gallery/editor/photo/screen/home/ScreenEditViewAnimatorHelper$Callback;Landroid/animation/ValueAnimator;)V

    return-void
.end method
