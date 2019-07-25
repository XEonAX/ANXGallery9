.class Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback$2;
.super Ljava/lang/Object;
.source "PeoplePageFragment.java"

# interfaces
.implements Lcom/miui/gallery/threadpool/ThreadPool$Job;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->changeUndefinedToVisible(Ljava/util/ArrayList;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/threadpool/ThreadPool$Job<",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;

.field final synthetic val$ids:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;Ljava/util/ArrayList;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback$2;->this$1:Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;

    iput-object p2, p0, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback$2;->val$ids:Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback$2;->run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method public run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Void;
    .locals 2

    new-instance p1, Landroid/content/ContentValues;

    invoke-direct {p1}, Landroid/content/ContentValues;-><init>()V

    const-string v0, "visibilityType"

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback$2;->val$ids:Ljava/util/ArrayList;

    invoke-static {p1, v0}, Lcom/miui/gallery/provider/FaceManager;->safeUpdatePeopleFaceByIds(Landroid/content/ContentValues;Ljava/util/ArrayList;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback$2;->this$1:Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;

    invoke-static {p1}, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->access$2300(Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;)Ljava/util/ArrayList;

    move-result-object p1

    monitor-enter p1

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback$2;->this$1:Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;

    invoke-static {v0}, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->access$2300(Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    iget-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback$2;->this$1:Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;

    invoke-static {v0}, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;->access$2300(Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;)Ljava/util/ArrayList;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback$2;->val$ids:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    monitor-exit p1

    const/4 p1, 0x0

    return-object p1

    :catchall_0
    move-exception v0

    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
