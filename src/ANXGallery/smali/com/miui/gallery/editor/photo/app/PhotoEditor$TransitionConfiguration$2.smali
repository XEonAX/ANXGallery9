.class Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration$2;
.super Ljava/lang/Object;
.source "PhotoEditor.java"

# interfaces
.implements Landroid/transition/Transition$TransitionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration$2;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTransitionCancel(Landroid/transition/Transition;)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration$2;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;->access$2200(Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;)Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$2100(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)V

    return-void
.end method

.method public onTransitionEnd(Landroid/transition/Transition;)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration$2;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;->access$2200(Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;)Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$2100(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)V

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
