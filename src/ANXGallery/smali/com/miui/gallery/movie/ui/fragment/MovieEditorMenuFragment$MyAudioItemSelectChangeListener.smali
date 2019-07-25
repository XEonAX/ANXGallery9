.class Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$MyAudioItemSelectChangeListener;
.super Ljava/lang/Object;
.source "MovieEditorMenuFragment.java"

# interfaces
.implements Lcom/miui/gallery/movie/ui/adapter/BaseAdapter$ItemSelectChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MyAudioItemSelectChangeListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$MyAudioItemSelectChangeListener;->this$0:Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$MyAudioItemSelectChangeListener;-><init>(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;)V

    return-void
.end method


# virtual methods
.method public onItemSelect(Landroid/support/v7/widget/RecyclerView;Lcom/miui/gallery/movie/ui/adapter/BaseAdapter$BaseHolder;IZ)Z
    .locals 3

    iget-object p2, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$MyAudioItemSelectChangeListener;->this$0:Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;

    invoke-static {p2}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->access$200(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;)Lcom/miui/gallery/movie/ui/adapter/AudioAdapter;

    move-result-object p2

    invoke-virtual {p2, p3}, Lcom/miui/gallery/movie/ui/adapter/AudioAdapter;->getItemData(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/movie/entity/AudioResource;

    const/4 v0, 0x0

    if-eqz p2, :cond_5

    invoke-virtual {p2}, Lcom/miui/gallery/movie/entity/AudioResource;->getResType()I

    move-result v1

    const/4 v2, 0x2

    if-ne v1, v2, :cond_0

    new-instance p1, Landroid/content/Intent;

    invoke-direct {p1}, Landroid/content/Intent;-><init>()V

    const-string p2, "audio/*"

    invoke-virtual {p1, p2}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    const-string p2, "android.intent.action.GET_CONTENT"

    invoke-virtual {p1, p2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const-string p2, "com.miui.player"

    invoke-virtual {p1, p2}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    const/16 p2, 0x3e8

    :try_start_0
    iget-object p3, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$MyAudioItemSelectChangeListener;->this$0:Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;

    invoke-virtual {p3, p1, p2}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const-string p1, "MovieEditorMenuFragment"

    const-string p3, "com.miui.player not found,try all picker"

    invoke-static {p1, p3}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    :try_start_1
    new-instance p1, Landroid/content/Intent;

    invoke-direct {p1}, Landroid/content/Intent;-><init>()V

    const-string p3, "audio/*"

    invoke-virtual {p1, p3}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    const-string p3, "android.intent.action.GET_CONTENT"

    invoke-virtual {p1, p3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    iget-object p3, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$MyAudioItemSelectChangeListener;->this$0:Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;

    invoke-virtual {p3, p1, p2}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_1
    .catch Landroid/content/ActivityNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    :catch_1
    const-string p1, "MovieEditorMenuFragment"

    const-string p2, "picker not found"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return v0

    :cond_0
    if-eqz p4, :cond_5

    invoke-virtual {p2}, Lcom/miui/gallery/movie/entity/AudioResource;->getDownloadState()I

    move-result p4

    const/16 v1, 0x11

    if-eq p4, v1, :cond_4

    if-nez p4, :cond_1

    goto :goto_2

    :cond_1
    const/16 p1, 0x13

    if-eq p4, p1, :cond_3

    const/16 p1, 0x14

    if-ne p4, p1, :cond_2

    goto :goto_1

    :cond_2
    return v0

    :cond_3
    :goto_1
    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$MyAudioItemSelectChangeListener;->this$0:Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;

    invoke-static {p1, p2}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->access$1300(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;Lcom/miui/gallery/movie/entity/MovieResource;)V

    return v0

    :cond_4
    :goto_2
    invoke-static {p1, p3}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/ScrollControlLinearLayoutManager;->onItemClick(Landroid/support/v7/widget/RecyclerView;I)V

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$MyAudioItemSelectChangeListener;->this$0:Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;

    invoke-static {p1}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->access$1000(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;)Lcom/miui/gallery/movie/entity/MovieInfo;

    move-result-object p1

    iget-object p3, p2, Lcom/miui/gallery/movie/entity/AudioResource;->nameKey:Ljava/lang/String;

    iput-object p3, p1, Lcom/miui/gallery/movie/entity/MovieInfo;->audio:Ljava/lang/String;

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$MyAudioItemSelectChangeListener;->this$0:Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;

    invoke-static {p1}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->access$1100(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;)Lcom/miui/gallery/movie/core/MovieManager;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/miui/gallery/movie/core/MovieManager;->setAudio(Lcom/miui/gallery/movie/entity/AudioResource;)V

    invoke-static {p2}, Lcom/miui/gallery/movie/utils/MovieStatUtils;->statItemChoose(Lcom/miui/gallery/movie/entity/MovieResource;)V

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment$MyAudioItemSelectChangeListener;->this$0:Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;

    invoke-static {p1}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->access$1200(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;)V

    const/4 p1, 0x1

    return p1

    :cond_5
    return v0
.end method
