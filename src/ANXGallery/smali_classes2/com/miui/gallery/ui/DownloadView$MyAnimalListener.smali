.class abstract Lcom/miui/gallery/ui/DownloadView$MyAnimalListener;
.super Ljava/lang/Object;
.source "DownloadView.java"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/DownloadView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x402
    name = "MyAnimalListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/DownloadView;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/ui/DownloadView;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/DownloadView$MyAnimalListener;->this$0:Lcom/miui/gallery/ui/DownloadView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/ui/DownloadView;Lcom/miui/gallery/ui/DownloadView$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/DownloadView$MyAnimalListener;-><init>(Lcom/miui/gallery/ui/DownloadView;)V

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method
