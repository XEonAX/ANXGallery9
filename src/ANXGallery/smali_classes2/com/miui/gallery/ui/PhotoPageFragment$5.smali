.class Lcom/miui/gallery/ui/PhotoPageFragment$5;
.super Ljava/lang/Object;
.source "PhotoPageFragment.java"

# interfaces
.implements Landroid/view/View$OnLayoutChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/PhotoPageFragment;->createBars()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

.field final synthetic val$delayInitMenus:Z


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/PhotoPageFragment;Z)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$5;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iput-boolean p2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$5;->val$delayInitMenus:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLayoutChange(Landroid/view/View;IIIIIIII)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$5;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->isResumed()Z

    move-result p1

    if-eqz p1, :cond_1

    iget-boolean p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$5;->val$delayInitMenus:Z

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$5;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Lcom/miui/gallery/ui/PhotoPageFragment;->setHasOptionsMenu(Z)V

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$5;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$800(Lcom/miui/gallery/ui/PhotoPageFragment;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$5;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$900(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageTopBar;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageTopBar;->getView()Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/view/View;->removeOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    :cond_1
    return-void
.end method
