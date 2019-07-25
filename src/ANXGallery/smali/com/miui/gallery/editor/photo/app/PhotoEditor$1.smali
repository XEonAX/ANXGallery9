.class Lcom/miui/gallery/editor/photo/app/PhotoEditor$1;
.super Ljava/lang/Object;
.source "PhotoEditor.java"

# interfaces
.implements Lcom/miui/gallery/editor/photo/app/InitializeController$Callbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/app/PhotoEditor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$1;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public doInitialize()I
    .locals 3

    sget-object v0, Lcom/miui/gallery/editor/photo/core/SdkManager;->INSTANCE:Lcom/miui/gallery/editor/photo/core/SdkManager;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$1;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->getApplication()Landroid/app/Application;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/core/SdkManager;->onAttach(Landroid/app/Application;)V

    sget-object v0, Lcom/miui/gallery/editor/photo/core/SdkManager;->INSTANCE:Lcom/miui/gallery/editor/photo/core/SdkManager;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/SdkManager;->onActivityCreate()V

    const/4 v0, 0x2

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$1;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$000(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Lcom/miui/gallery/editor/photo/app/DraftManager;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$1;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$100(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Lcom/miui/gallery/editor/photo/origin/EditorOriginHandler;

    move-result-object v2

    invoke-virtual {v2}, Lcom/miui/gallery/editor/photo/origin/EditorOriginHandler;->isInMainProcess()Z

    move-result v2

    invoke-virtual {v1, v2}, Lcom/miui/gallery/editor/photo/app/DraftManager;->initializeForPreview(Z)Z

    move-result v1
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    if-eqz v1, :cond_1

    const/4 v0, 0x3

    :cond_1
    return v0

    :catch_0
    move-exception v1

    const-string v2, "PhotoEditor"

    invoke-static {v2, v1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    return v0

    :catch_1
    move-exception v0

    const-string v1, "PhotoEditor"

    invoke-static {v1, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 v0, 0x1

    return v0
.end method

.method public onDone()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$1;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$200(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Landroid/app/FragmentManager;

    move-result-object v0

    const-string v1, "preview"

    invoke-virtual {v0, v1}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Lcom/miui/gallery/editor/photo/app/PreviewFragment;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/app/Fragment;->isAdded()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    invoke-virtual {v1, v0}, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->setLoadDone(Z)V

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->showForLoadDown()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$1;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$000(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Lcom/miui/gallery/editor/photo/app/DraftManager;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$1;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$000(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Lcom/miui/gallery/editor/photo/app/DraftManager;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$1;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$300(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Lcom/miui/gallery/editor/photo/app/DraftManager$OnPreviewRefreshListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/app/DraftManager;->setOnPreviewRefreshListener(Lcom/miui/gallery/editor/photo/app/DraftManager$OnPreviewRefreshListener;)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$1;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$400(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;->onImageLoaded()V

    return-void
.end method
