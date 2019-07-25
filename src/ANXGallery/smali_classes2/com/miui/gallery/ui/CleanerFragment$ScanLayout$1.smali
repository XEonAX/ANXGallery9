.class Lcom/miui/gallery/ui/CleanerFragment$ScanLayout$1;
.super Ljava/lang/Object;
.source "CleanerFragment.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;->initFlexAnimator(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/CleanerFragment$ScanLayout$1;->this$1:Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 1

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment$ScanLayout$1;->this$1:Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-static {v0, p1}, Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;->access$200(Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;I)V

    :cond_0
    return-void
.end method
