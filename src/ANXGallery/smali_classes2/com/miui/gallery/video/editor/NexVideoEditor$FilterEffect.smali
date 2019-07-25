.class Lcom/miui/gallery/video/editor/NexVideoEditor$FilterEffect;
.super Ljava/lang/Object;
.source "NexVideoEditor.java"

# interfaces
.implements Lcom/miui/gallery/video/editor/NexVideoEditor$Change;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/video/editor/NexVideoEditor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FilterEffect"
.end annotation


# instance fields
.field private mFilter:Lcom/miui/gallery/video/editor/Filter;

.field final synthetic this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/video/editor/NexVideoEditor;Lcom/miui/gallery/video/editor/Filter;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$FilterEffect;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$FilterEffect;->mFilter:Lcom/miui/gallery/video/editor/Filter;

    return-void
.end method

.method static synthetic access$2500(Lcom/miui/gallery/video/editor/NexVideoEditor$FilterEffect;)Lcom/miui/gallery/video/editor/Filter;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$FilterEffect;->mFilter:Lcom/miui/gallery/video/editor/Filter;

    return-object p0
.end method


# virtual methods
.method public applyChange()V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$FilterEffect;->mFilter:Lcom/miui/gallery/video/editor/Filter;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$FilterEffect;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$2600(Lcom/miui/gallery/video/editor/NexVideoEditor;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$FilterEffect;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$2700(Lcom/miui/gallery/video/editor/NexVideoEditor;)Lcom/nexstreaming/nexeditorsdk/nexProject;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$FilterEffect;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$2700(Lcom/miui/gallery/video/editor/NexVideoEditor;)Lcom/nexstreaming/nexeditorsdk/nexProject;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalClipCount(Z)I

    move-result v0

    iget-object v2, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$FilterEffect;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    iget-object v3, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$FilterEffect;->mFilter:Lcom/miui/gallery/video/editor/Filter;

    invoke-virtual {v3}, Lcom/miui/gallery/video/editor/Filter;->getFilterId()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$2800(Lcom/miui/gallery/video/editor/NexVideoEditor;Ljava/lang/String;)Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    move-result-object v2

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v0, :cond_1

    iget-object v4, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$FilterEffect;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {v4}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$2700(Lcom/miui/gallery/video/editor/NexVideoEditor;)Lcom/nexstreaming/nexeditorsdk/nexProject;

    move-result-object v4

    invoke-virtual {v4, v3, v1}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getClip(IZ)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v4

    invoke-virtual {v4, v2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setColorEffect(Lcom/nexstreaming/nexeditorsdk/nexColorEffect;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$FilterEffect;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    iget-object v1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$FilterEffect;->mFilter:Lcom/miui/gallery/video/editor/Filter;

    invoke-virtual {v1}, Lcom/miui/gallery/video/editor/Filter;->getFilterId()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$2800(Lcom/miui/gallery/video/editor/NexVideoEditor;Ljava/lang/String;)Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$FilterEffect;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {v1}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$1400(Lcom/miui/gallery/video/editor/NexVideoEditor;)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setColorEffect(Lcom/nexstreaming/nexeditorsdk/nexColorEffect;)V

    :cond_1
    const-string v0, "NONE"

    iget-object v1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$FilterEffect;->mFilter:Lcom/miui/gallery/video/editor/Filter;

    invoke-virtual {v1}, Lcom/miui/gallery/video/editor/Filter;->getFilterId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$FilterEffect;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$1600(Lcom/miui/gallery/video/editor/NexVideoEditor;)Ljava/util/HashMap;

    move-result-object v0

    const-string v1, "filter"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$FilterEffect;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$1600(Lcom/miui/gallery/video/editor/NexVideoEditor;)Ljava/util/HashMap;

    move-result-object v0

    const-string v1, "filter"

    invoke-virtual {v0, v1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    :cond_3
    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$FilterEffect;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$1400(Lcom/miui/gallery/video/editor/NexVideoEditor;)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setColorEffect(Lcom/nexstreaming/nexeditorsdk/nexColorEffect;)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$FilterEffect;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$1600(Lcom/miui/gallery/video/editor/NexVideoEditor;)Ljava/util/HashMap;

    move-result-object v0

    const-string v1, "filter"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :goto_1
    return-void
.end method
