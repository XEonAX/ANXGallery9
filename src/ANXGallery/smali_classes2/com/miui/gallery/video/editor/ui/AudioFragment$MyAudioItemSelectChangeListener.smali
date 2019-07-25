.class Lcom/miui/gallery/video/editor/ui/AudioFragment$MyAudioItemSelectChangeListener;
.super Ljava/lang/Object;
.source "AudioFragment.java"

# interfaces
.implements Lcom/miui/gallery/video/editor/widget/SingleChoiceRecyclerView$SingleChoiceRecyclerViewAdapter$ItemSelectChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/video/editor/ui/AudioFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MyAudioItemSelectChangeListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/video/editor/ui/AudioFragment;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/video/editor/ui/AudioFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/ui/AudioFragment$MyAudioItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/AudioFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/video/editor/ui/AudioFragment;Lcom/miui/gallery/video/editor/ui/AudioFragment$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/video/editor/ui/AudioFragment$MyAudioItemSelectChangeListener;-><init>(Lcom/miui/gallery/video/editor/ui/AudioFragment;)V

    return-void
.end method


# virtual methods
.method public onItemSelect(Lcom/miui/gallery/video/editor/widget/SingleChoiceRecyclerView$SingleChoiceRecyclerViewAdapter;IZ)Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/AudioFragment$MyAudioItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/AudioFragment;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/ui/AudioFragment;->access$500(Lcom/miui/gallery/video/editor/ui/AudioFragment;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/AudioFragment$MyAudioItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/AudioFragment;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/ui/AudioFragment;->access$600(Lcom/miui/gallery/video/editor/ui/AudioFragment;)Lcom/miui/gallery/video/editor/widget/SingleChoiceRecyclerView;

    move-result-object v0

    invoke-static {v0, p2}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/ScrollControlLinearLayoutManager;->onItemClick(Landroid/support/v7/widget/RecyclerView;I)V

    check-cast p1, Lcom/miui/gallery/video/editor/adapter/AudioRecyclerViewAdapter;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/video/editor/adapter/AudioRecyclerViewAdapter;->getAuido(I)Lcom/miui/gallery/video/editor/LocalAudio;

    move-result-object p1

    if-eqz p1, :cond_4

    invoke-virtual {p1}, Lcom/miui/gallery/video/editor/LocalAudio;->isCustom()Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance p1, Landroid/content/Intent;

    invoke-direct {p1}, Landroid/content/Intent;-><init>()V

    const-string p3, "audio/*"

    invoke-virtual {p1, p3}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    const-string p3, "android.intent.action.GET_CONTENT"

    invoke-virtual {p1, p3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const-string p3, "com.miui.player"

    invoke-virtual {p1, p3}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    const/16 p3, 0x3e8

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/AudioFragment$MyAudioItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/AudioFragment;

    invoke-virtual {v0, p1, p3}, Lcom/miui/gallery/video/editor/ui/AudioFragment;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const-string p1, "AudioFragment"

    const-string v0, "com.miui.player not found,try all picker"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    :try_start_1
    new-instance p1, Landroid/content/Intent;

    invoke-direct {p1}, Landroid/content/Intent;-><init>()V

    const-string v0, "audio/*"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    const-string v0, "android.intent.action.GET_CONTENT"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/AudioFragment$MyAudioItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/AudioFragment;

    invoke-virtual {v0, p1, p3}, Lcom/miui/gallery/video/editor/ui/AudioFragment;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_1
    .catch Landroid/content/ActivityNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    :catch_1
    const-string p1, "AudioFragment"

    const-string p3, "picker not found"

    invoke-static {p1, p3}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/AudioFragment$MyAudioItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/AudioFragment;

    invoke-static {p1, p2}, Lcom/miui/gallery/video/editor/ui/AudioFragment;->access$400(Lcom/miui/gallery/video/editor/ui/AudioFragment;I)V

    return v1

    :cond_1
    invoke-virtual {p1}, Lcom/miui/gallery/video/editor/LocalAudio;->isNone()Z

    move-result v0

    if-eqz v0, :cond_2

    if-eqz p3, :cond_2

    iget-object p3, p0, Lcom/miui/gallery/video/editor/ui/AudioFragment$MyAudioItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/AudioFragment;

    invoke-static {p3, p2}, Lcom/miui/gallery/video/editor/ui/AudioFragment;->access$400(Lcom/miui/gallery/video/editor/ui/AudioFragment;I)V

    iget-object p2, p0, Lcom/miui/gallery/video/editor/ui/AudioFragment$MyAudioItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/AudioFragment;

    invoke-static {p2, p1}, Lcom/miui/gallery/video/editor/ui/AudioFragment;->access$700(Lcom/miui/gallery/video/editor/ui/AudioFragment;Lcom/miui/gallery/video/editor/LocalAudio;)V

    goto :goto_1

    :cond_2
    invoke-virtual {p1}, Lcom/miui/gallery/video/editor/LocalAudio;->isExtra()Z

    move-result v0

    if-eqz v0, :cond_4

    if-eqz p3, :cond_4

    invoke-virtual {p1}, Lcom/miui/gallery/video/editor/LocalAudio;->isDownloaded()Z

    move-result p3

    if-eqz p3, :cond_3

    iget-object p3, p0, Lcom/miui/gallery/video/editor/ui/AudioFragment$MyAudioItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/AudioFragment;

    invoke-static {p3, p2}, Lcom/miui/gallery/video/editor/ui/AudioFragment;->access$400(Lcom/miui/gallery/video/editor/ui/AudioFragment;I)V

    iget-object p2, p0, Lcom/miui/gallery/video/editor/ui/AudioFragment$MyAudioItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/AudioFragment;

    invoke-static {p2, p1}, Lcom/miui/gallery/video/editor/ui/AudioFragment;->access$700(Lcom/miui/gallery/video/editor/ui/AudioFragment;Lcom/miui/gallery/video/editor/LocalAudio;)V

    goto :goto_1

    :cond_3
    iget-object p3, p0, Lcom/miui/gallery/video/editor/ui/AudioFragment$MyAudioItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/AudioFragment;

    iget-object p3, p3, Lcom/miui/gallery/video/editor/ui/AudioFragment;->mIDownloadListener:Lcom/miui/gallery/video/editor/interfaces/IVideoEditorListener$IDownloadListener;

    invoke-interface {p3, p1, p2}, Lcom/miui/gallery/video/editor/interfaces/IVideoEditorListener$IDownloadListener;->downloadResourceWithCheck(Lcom/miui/gallery/video/editor/model/VideoEditorBaseModel;I)V

    iget-object p2, p0, Lcom/miui/gallery/video/editor/ui/AudioFragment$MyAudioItemSelectChangeListener;->this$0:Lcom/miui/gallery/video/editor/ui/AudioFragment;

    invoke-static {p2, p1}, Lcom/miui/gallery/video/editor/ui/AudioFragment;->access$802(Lcom/miui/gallery/video/editor/ui/AudioFragment;Lcom/miui/gallery/video/editor/LocalAudio;)Lcom/miui/gallery/video/editor/LocalAudio;

    :cond_4
    :goto_1
    return v1
.end method
