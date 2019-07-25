.class Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager$1;
.super Ljava/lang/Object;
.source "PhotoPageFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager$1;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    const-string v0, "PhotoPageFragment"

    const-string v1, "editor return to photo, image loading time out."

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager$1;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;->access$6400(Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;)V

    return-void
.end method
