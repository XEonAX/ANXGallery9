.class Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$1;
.super Ljava/lang/Object;
.source "SelectableDrawable.java"

# interfaces
.implements Landroid/graphics/drawable/Drawable$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$1;->this$0:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public invalidateDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$1;->this$0:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->getCallback()Landroid/graphics/drawable/Drawable$Callback;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$1;->this$0:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->access$300(Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;)Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;->access$000(Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eq p1, v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$1;->this$0:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->access$300(Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;)Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;->access$100(Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-ne p1, v0, :cond_1

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$1;->this$0:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->getCallback()Landroid/graphics/drawable/Drawable$Callback;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$1;->this$0:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;

    invoke-interface {p1, v0}, Landroid/graphics/drawable/Drawable$Callback;->invalidateDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_1
    return-void
.end method

.method public scheduleDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;J)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$1;->this$0:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->getCallback()Landroid/graphics/drawable/Drawable$Callback;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$1;->this$0:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->access$300(Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;)Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;->access$000(Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eq p1, v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$1;->this$0:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->access$300(Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;)Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;->access$100(Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-ne p1, v0, :cond_1

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$1;->this$0:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->getCallback()Landroid/graphics/drawable/Drawable$Callback;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$1;->this$0:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;

    invoke-interface {p1, v0, p2, p3, p4}, Landroid/graphics/drawable/Drawable$Callback;->scheduleDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;J)V

    :cond_1
    return-void
.end method

.method public unscheduleDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$1;->this$0:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->getCallback()Landroid/graphics/drawable/Drawable$Callback;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$1;->this$0:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->access$300(Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;)Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;->access$000(Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eq p1, v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$1;->this$0:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->access$300(Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;)Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;->access$100(Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$ChildrenState;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-ne p1, v0, :cond_1

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$1;->this$0:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;->getCallback()Landroid/graphics/drawable/Drawable$Callback;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable$1;->this$0:Lcom/miui/gallery/editor/photo/drawable/SelectableDrawable;

    invoke-interface {p1, v0, p2}, Landroid/graphics/drawable/Drawable$Callback;->unscheduleDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;)V

    :cond_1
    return-void
.end method
