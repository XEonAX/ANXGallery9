.class Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager$ActionBarMaskRunnable;
.super Ljava/lang/Object;
.source "PhotoPageFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ActionBarMaskRunnable"
.end annotation


# instance fields
.field final isAnim:Z

.field final isShowMask:Z

.field final synthetic this$1:Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;ZZ)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager$ActionBarMaskRunnable;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager$ActionBarMaskRunnable;->isShowMask:Z

    iput-boolean p3, p0, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager$ActionBarMaskRunnable;->isAnim:Z

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager$ActionBarMaskRunnable;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;->access$1300(Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;)Lcom/miui/gallery/ui/PhotoPageMaskView;

    move-result-object v0

    iget-boolean v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager$ActionBarMaskRunnable;->isShowMask:Z

    iget-boolean v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager$ActionBarMaskRunnable;->isAnim:Z

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/ui/PhotoPageMaskView;->setActionBarMaskVisible(ZZ)Z

    return-void
.end method
