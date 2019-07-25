.class Lcom/miui/gallery/editor/photo/app/PhotoEditor$8;
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

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$8;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$8;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$902(Lcom/miui/gallery/editor/photo/app/PhotoEditor;Z)Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$8;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$2000(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Lcom/miui/gallery/editor/photo/app/MenuFragment;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$8;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v1, v0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$1500(Lcom/miui/gallery/editor/photo/app/PhotoEditor;Lcom/miui/gallery/editor/photo/app/MenuFragment;)V

    return-void
.end method

.method public onDone(Landroid/graphics/Bitmap;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$8;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$200(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Landroid/app/FragmentManager;

    move-result-object p1

    const-string v0, "preview"

    invoke-virtual {p1, v0}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/editor/photo/app/PreviewFragment;

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$8;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$000(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Lcom/miui/gallery/editor/photo/app/DraftManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/app/DraftManager;->isRemoveWatermarkShow()Z

    move-result v0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->setRemoveWatermarkEnable(Z)V

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$8;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$902(Lcom/miui/gallery/editor/photo/app/PhotoEditor;Z)Z

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$8;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$2000(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Lcom/miui/gallery/editor/photo/app/MenuFragment;

    move-result-object p1

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/app/MenuFragment;->hideProcessDialog()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$8;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v0, p1}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$1500(Lcom/miui/gallery/editor/photo/app/PhotoEditor;Lcom/miui/gallery/editor/photo/app/MenuFragment;)V

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$8;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$000(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Lcom/miui/gallery/editor/photo/app/DraftManager;

    move-result-object p1

    const/4 v0, 0x1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$8;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$000(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Lcom/miui/gallery/editor/photo/app/DraftManager;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/app/DraftManager;->getStepCount()I

    move-result p1

    if-le p1, v0, :cond_2

    return-void

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$8;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {p1, v0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$1900(Lcom/miui/gallery/editor/photo/app/PhotoEditor;Z)V

    return-void
.end method

.method public bridge synthetic onDone(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Landroid/graphics/Bitmap;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/app/PhotoEditor$8;->onDone(Landroid/graphics/Bitmap;)V

    return-void
.end method

.method public bridge synthetic onError(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/app/PhotoEditor$8;->onError(Ljava/lang/Void;)V

    return-void
.end method

.method public onError(Ljava/lang/Void;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$8;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$902(Lcom/miui/gallery/editor/photo/app/PhotoEditor;Z)Z

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$8;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    const v0, 0x7f100462

    invoke-static {p1, v0}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    return-void
.end method

.method public onExecute(Landroid/graphics/Bitmap;)V
    .locals 0

    return-void
.end method

.method public bridge synthetic onExecute(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Landroid/graphics/Bitmap;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/app/PhotoEditor$8;->onExecute(Landroid/graphics/Bitmap;)V

    return-void
.end method

.method public onPrepare()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$8;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$902(Lcom/miui/gallery/editor/photo/app/PhotoEditor;Z)Z

    return-void
.end method
