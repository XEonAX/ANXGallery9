.class Lcom/miui/gallery/editor/photo/app/PreviewFragment$1;
.super Ljava/lang/Object;
.source "PreviewFragment.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/app/PreviewFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/app/PreviewFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/app/PreviewFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/PreviewFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/PreviewFragment;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->access$200(Lcom/miui/gallery/editor/photo/app/PreviewFragment;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PreviewFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/PreviewFragment;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->access$300(Lcom/miui/gallery/editor/photo/app/PreviewFragment;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    return-void
.end method
