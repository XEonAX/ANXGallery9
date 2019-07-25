.class public final synthetic Lcom/miui/gallery/editor/photo/screen/home/-$$Lambda$ScreenAnimatorHelper$ahzuG8tb6RCh_Xk8CzTk7NQ5Io4;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field private final synthetic f$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;

.field private final synthetic f$1:I

.field private final synthetic f$2:I

.field private final synthetic f$3:I


# direct methods
.method public synthetic constructor <init>(Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;III)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/-$$Lambda$ScreenAnimatorHelper$ahzuG8tb6RCh_Xk8CzTk7NQ5Io4;->f$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;

    iput p2, p0, Lcom/miui/gallery/editor/photo/screen/home/-$$Lambda$ScreenAnimatorHelper$ahzuG8tb6RCh_Xk8CzTk7NQ5Io4;->f$1:I

    iput p3, p0, Lcom/miui/gallery/editor/photo/screen/home/-$$Lambda$ScreenAnimatorHelper$ahzuG8tb6RCh_Xk8CzTk7NQ5Io4;->f$2:I

    iput p4, p0, Lcom/miui/gallery/editor/photo/screen/home/-$$Lambda$ScreenAnimatorHelper$ahzuG8tb6RCh_Xk8CzTk7NQ5Io4;->f$3:I

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/-$$Lambda$ScreenAnimatorHelper$ahzuG8tb6RCh_Xk8CzTk7NQ5Io4;->f$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;

    iget v1, p0, Lcom/miui/gallery/editor/photo/screen/home/-$$Lambda$ScreenAnimatorHelper$ahzuG8tb6RCh_Xk8CzTk7NQ5Io4;->f$1:I

    iget v2, p0, Lcom/miui/gallery/editor/photo/screen/home/-$$Lambda$ScreenAnimatorHelper$ahzuG8tb6RCh_Xk8CzTk7NQ5Io4;->f$2:I

    iget v3, p0, Lcom/miui/gallery/editor/photo/screen/home/-$$Lambda$ScreenAnimatorHelper$ahzuG8tb6RCh_Xk8CzTk7NQ5Io4;->f$3:I

    invoke-static {v0, v1, v2, v3, p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->lambda$startEditPageExitAnimator$68(Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;IIILandroid/animation/ValueAnimator;)V

    return-void
.end method
