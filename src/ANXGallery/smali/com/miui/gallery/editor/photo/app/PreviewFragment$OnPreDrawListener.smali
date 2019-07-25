.class Lcom/miui/gallery/editor/photo/app/PreviewFragment$OnPreDrawListener;
.super Ljava/lang/Object;
.source "PreviewFragment.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/app/PreviewFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "OnPreDrawListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/app/PreviewFragment;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/editor/photo/app/PreviewFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment$OnPreDrawListener;->this$0:Lcom/miui/gallery/editor/photo/app/PreviewFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/editor/photo/app/PreviewFragment;Lcom/miui/gallery/editor/photo/app/PreviewFragment$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/app/PreviewFragment$OnPreDrawListener;-><init>(Lcom/miui/gallery/editor/photo/app/PreviewFragment;)V

    return-void
.end method

.method public static synthetic lambda$onPreDraw$86(Lcom/miui/gallery/editor/photo/app/PreviewFragment$OnPreDrawListener;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment$OnPreDrawListener;->this$0:Lcom/miui/gallery/editor/photo/app/PreviewFragment;

    iget-object v0, v0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->mOnViewReadyListener:Lcom/miui/gallery/editor/photo/app/PreviewFragment$OnViewReadyListener;

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/app/PreviewFragment$OnViewReadyListener;->onViewReady()V

    return-void
.end method


# virtual methods
.method public onPreDraw()Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment$OnPreDrawListener;->this$0:Lcom/miui/gallery/editor/photo/app/PreviewFragment;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->access$100(Lcom/miui/gallery/editor/photo/app/PreviewFragment;)Landroid/widget/ImageView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ImageView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/editor/photo/app/-$$Lambda$PreviewFragment$OnPreDrawListener$RU1_YrNrDfzRKlEUZY4WoxQ68As;

    invoke-direct {v1, p0}, Lcom/miui/gallery/editor/photo/app/-$$Lambda$PreviewFragment$OnPreDrawListener$RU1_YrNrDfzRKlEUZY4WoxQ68As;-><init>(Lcom/miui/gallery/editor/photo/app/PreviewFragment$OnPreDrawListener;)V

    invoke-virtual {v0, v1}, Lcom/android/internal/CompatHandler;->post(Ljava/lang/Runnable;)Z

    const/4 v0, 0x1

    return v0
.end method
