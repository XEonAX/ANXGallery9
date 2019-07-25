.class Lcom/miui/gallery/widget/BottomMenu$2;
.super Landroid/animation/AnimatorListenerAdapter;
.source "BottomMenu.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/widget/BottomMenu;->getMenuBarAnimator(Z)Landroid/animation/Animator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/widget/BottomMenu;


# direct methods
.method constructor <init>(Lcom/miui/gallery/widget/BottomMenu;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/widget/BottomMenu$2;->this$0:Lcom/miui/gallery/widget/BottomMenu;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/widget/BottomMenu$2;->this$0:Lcom/miui/gallery/widget/BottomMenu;

    invoke-static {p1}, Lcom/miui/gallery/widget/BottomMenu;->access$100(Lcom/miui/gallery/widget/BottomMenu;)Lcom/miui/gallery/view/menu/ActionMenuView;

    move-result-object p1

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Lcom/miui/gallery/view/menu/ActionMenuView;->setVisibility(I)V

    return-void
.end method
