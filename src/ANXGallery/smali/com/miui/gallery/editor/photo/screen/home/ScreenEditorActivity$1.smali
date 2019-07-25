.class Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$1;
.super Landroid/animation/AnimatorListenerAdapter;
.source "ScreenEditorActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->changeWithMode(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$1;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$1;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->access$000(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;)Lcom/miui/gallery/editor/photo/screen/home/IScreenEditorController;

    move-result-object p1

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Lcom/miui/gallery/editor/photo/screen/home/IScreenEditorController;->checkTextEditor(Z)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$1;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->showBottomViewWithMode(I)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$1;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->configEditModeView()V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$1;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->access$100(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;)Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->startEditPageEnterAnimator()V

    return-void
.end method
