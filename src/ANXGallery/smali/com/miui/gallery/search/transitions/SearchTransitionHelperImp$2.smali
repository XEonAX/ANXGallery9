.class Lcom/miui/gallery/search/transitions/SearchTransitionHelperImp$2;
.super Ljava/lang/Object;
.source "SearchTransitionHelperImp.java"

# interfaces
.implements Landroid/transition/Transition$TransitionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/search/transitions/SearchTransitionHelperImp;->generateTransition(Z)Landroid/transition/Transition;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/search/transitions/SearchTransitionHelperImp;


# direct methods
.method constructor <init>(Lcom/miui/gallery/search/transitions/SearchTransitionHelperImp;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/search/transitions/SearchTransitionHelperImp$2;->this$0:Lcom/miui/gallery/search/transitions/SearchTransitionHelperImp;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTransitionCancel(Landroid/transition/Transition;)V
    .locals 0

    return-void
.end method

.method public onTransitionEnd(Landroid/transition/Transition;)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/search/transitions/SearchTransitionHelperImp$2;->this$0:Lcom/miui/gallery/search/transitions/SearchTransitionHelperImp;

    iget-object p1, p1, Lcom/miui/gallery/search/transitions/SearchTransitionHelperImp;->mEnterTransitionListener:Lcom/miui/gallery/search/transitions/SearchTransitionHelper$SearchTransitionListener;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/search/transitions/SearchTransitionHelperImp$2;->this$0:Lcom/miui/gallery/search/transitions/SearchTransitionHelperImp;

    iget-object p1, p1, Lcom/miui/gallery/search/transitions/SearchTransitionHelperImp;->mEnterTransitionListener:Lcom/miui/gallery/search/transitions/SearchTransitionHelper$SearchTransitionListener;

    invoke-interface {p1}, Lcom/miui/gallery/search/transitions/SearchTransitionHelper$SearchTransitionListener;->onTransitionEnd()V

    :cond_0
    return-void
.end method

.method public onTransitionPause(Landroid/transition/Transition;)V
    .locals 0

    return-void
.end method

.method public onTransitionResume(Landroid/transition/Transition;)V
    .locals 0

    return-void
.end method

.method public onTransitionStart(Landroid/transition/Transition;)V
    .locals 0

    return-void
.end method
