.class Lcom/miui/gallery/ui/PhotoPageFragment$BaseEditorManager;
.super Ljava/lang/Object;
.source "PhotoPageFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPageFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "BaseEditorManager"
.end annotation


# instance fields
.field mResultHandled:Z

.field mTargetFilePath:Ljava/lang/String;

.field mTargetId:J

.field private mUpdateTask:Lcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask;

.field final synthetic this$0:Lcom/miui/gallery/ui/PhotoPageFragment;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/ui/PhotoPageFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$BaseEditorManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$BaseEditorManager;->mTargetFilePath:Ljava/lang/String;

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/ui/PhotoPageFragment;Lcom/miui/gallery/ui/PhotoPageFragment$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$BaseEditorManager;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment;)V

    return-void
.end method


# virtual methods
.method insertAndNotifyDataSet(Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/miui/gallery/ui/PhotoPageFragment$BaseEditorManager;->insertAndNotifyDataSet(Ljava/lang/String;Z)V

    return-void
.end method

.method insertAndNotifyDataSet(Ljava/lang/String;Z)V
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/miui/gallery/ui/PhotoPageFragment$BaseEditorManager;->insertAndNotifyDataSet(Ljava/lang/String;ZZ)V

    return-void
.end method

.method insertAndNotifyDataSet(Ljava/lang/String;ZZ)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$BaseEditorManager;->mUpdateTask:Lcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment$1;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$BaseEditorManager;->mUpdateTask:Lcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$BaseEditorManager;->mUpdateTask:Lcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask;

    new-instance v1, Lcom/miui/gallery/ui/PhotoPageFragment$BaseEditorManager$1;

    invoke-direct {v1, p0, p3}, Lcom/miui/gallery/ui/PhotoPageFragment$BaseEditorManager$1;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment$BaseEditorManager;Z)V

    invoke-virtual {v0, p1, p2, v1}, Lcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask;->execute(Ljava/lang/String;ZLcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask$Callback;)V

    return-void
.end method

.method notifyDataSetChange(J)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$BaseEditorManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "photo_focused_id"

    invoke-virtual {v0, v1, p1, p2}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$BaseEditorManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->onContentChanged()V

    return-void
.end method

.method notifyDataSetChange(Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/miui/gallery/ui/PhotoPageFragment$BaseEditorManager;->notifyDataSetChange(Ljava/lang/String;Z)V

    return-void
.end method

.method notifyDataSetChange(Ljava/lang/String;Z)V
    .locals 2

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$BaseEditorManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment;->mAdapter:Lcom/miui/gallery/adapter/PhotoPageAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->getDataSet()Lcom/miui/gallery/model/BaseDataSet;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$BaseEditorManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageFragment;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {v1}, Lcom/miui/gallery/widget/ViewPager;->getCurrentItem()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, p1, v1}, Lcom/miui/gallery/model/BaseDataSet;->addNewFile(Ljava/lang/String;I)Z

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$BaseEditorManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "photo_focused_path"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p2, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$BaseEditorManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->loadInBackground()V

    goto :goto_0

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$BaseEditorManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->onContentChanged()V

    :goto_0
    return-void
.end method

.method public onActivityResult(ILandroid/content/Intent;)V
    .locals 0

    const-string p1, "BaseEditorManager"

    const-string p2, "EditorManager.onActivityResult"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onImageLoadFinish(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public onStartEditor()V
    .locals 2

    const-string v0, "BaseEditorManager"

    const-string v1, "EditorManager.onStartEditor"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public release()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$BaseEditorManager;->mUpdateTask:Lcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$BaseEditorManager;->mUpdateTask:Lcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask;->cancel()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$BaseEditorManager;->mUpdateTask:Lcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask;

    :cond_0
    return-void
.end method

.method setTargetId(J)V
    .locals 0

    iput-wide p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$BaseEditorManager;->mTargetId:J

    return-void
.end method

.method setTargetPath(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$BaseEditorManager;->mTargetFilePath:Ljava/lang/String;

    return-void
.end method
