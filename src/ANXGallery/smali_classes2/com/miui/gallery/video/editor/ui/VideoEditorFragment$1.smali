.class Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$1;
.super Ljava/lang/Object;
.source "VideoEditorFragment.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalFocusChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$1;->this$0:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGlobalFocusChanged(Landroid/view/View;Landroid/view/View;)V
    .locals 2

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$1;->this$0:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    invoke-static {p1}, Lcom/android/internal/WindowCompat;->isNotch(Landroid/app/Activity;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$1;->this$0:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    invoke-static {p1}, Lcom/android/internal/WindowCompat;->getTopNotchHeight(Landroid/app/Activity;)I

    move-result p1

    iget-object p2, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$1;->this$0:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    invoke-static {p2}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->access$100(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;)Landroid/support/constraint/Guideline;

    move-result-object p2

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$1;->this$0:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f06011a

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    add-int/2addr p1, v0

    invoke-virtual {p2, p1}, Landroid/support/constraint/Guideline;->setGuidelineBegin(I)V

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$1;->this$0:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->access$200(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$1;->this$0:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    iget-object p2, p2, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->mOnGlobalFocusChangeListener:Landroid/view/ViewTreeObserver$OnGlobalFocusChangeListener;

    invoke-virtual {p1, p2}, Landroid/view/ViewTreeObserver;->removeOnGlobalFocusChangeListener(Landroid/view/ViewTreeObserver$OnGlobalFocusChangeListener;)V

    return-void
.end method
