.class Lcom/miui/gallery/editor/photo/app/PhotoEditor$7;
.super Ljava/lang/Object;
.source "PhotoEditor.java"

# interfaces
.implements Lcom/miui/gallery/editor/photo/utils/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/app/PhotoEditor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/editor/photo/utils/Callback<",
        "Landroid/graphics/Bitmap;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$7;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$7;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$902(Lcom/miui/gallery/editor/photo/app/PhotoEditor;Z)Z

    return-void
.end method

.method public onDone(Landroid/graphics/Bitmap;)V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$7;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$902(Lcom/miui/gallery/editor/photo/app/PhotoEditor;Z)Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$7;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$200(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Landroid/app/FragmentManager;

    move-result-object v0

    const-string v2, "preview"

    invoke-virtual {v0, v2}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$7;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$000(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Lcom/miui/gallery/editor/photo/app/DraftManager;

    move-result-object v2

    const/4 v3, 0x1

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$7;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$000(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Lcom/miui/gallery/editor/photo/app/DraftManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/miui/gallery/editor/photo/app/DraftManager;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1

    :cond_0
    const/4 v1, 0x1

    :cond_1
    if-eqz v0, :cond_2

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->refreshPreview(Landroid/graphics/Bitmap;)V

    xor-int/lit8 p1, v1, 0x1

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->enableComparison(Z)V

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$7;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    xor-int/lit8 v0, v1, 0x1

    invoke-static {p1, v0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$1900(Lcom/miui/gallery/editor/photo/app/PhotoEditor;Z)V

    return-void
.end method

.method public bridge synthetic onDone(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Landroid/graphics/Bitmap;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/app/PhotoEditor$7;->onDone(Landroid/graphics/Bitmap;)V

    return-void
.end method

.method public bridge synthetic onError(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/app/PhotoEditor$7;->onError(Ljava/lang/Void;)V

    return-void
.end method

.method public onError(Ljava/lang/Void;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$7;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$902(Lcom/miui/gallery/editor/photo/app/PhotoEditor;Z)Z

    return-void
.end method

.method public onExecute(Landroid/graphics/Bitmap;)V
    .locals 0

    return-void
.end method

.method public bridge synthetic onExecute(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Landroid/graphics/Bitmap;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/app/PhotoEditor$7;->onExecute(Landroid/graphics/Bitmap;)V

    return-void
.end method

.method public onPrepare()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$7;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$902(Lcom/miui/gallery/editor/photo/app/PhotoEditor;Z)Z

    return-void
.end method
