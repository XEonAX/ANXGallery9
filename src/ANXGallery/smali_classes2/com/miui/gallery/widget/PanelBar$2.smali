.class Lcom/miui/gallery/widget/PanelBar$2;
.super Landroid/animation/AnimatorListenerAdapter;
.source "PanelBar.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/widget/PanelBar;->removeItem(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/widget/PanelBar;

.field final synthetic val$oldItem:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/miui/gallery/widget/PanelBar;Landroid/view/View;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/widget/PanelBar$2;->this$0:Lcom/miui/gallery/widget/PanelBar;

    iput-object p2, p0, Lcom/miui/gallery/widget/PanelBar$2;->val$oldItem:Landroid/view/View;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/widget/PanelBar$2;->this$0:Lcom/miui/gallery/widget/PanelBar;

    iget-object v0, p0, Lcom/miui/gallery/widget/PanelBar$2;->val$oldItem:Landroid/view/View;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/widget/PanelBar;->endViewTransition(Landroid/view/View;)V

    return-void
.end method
