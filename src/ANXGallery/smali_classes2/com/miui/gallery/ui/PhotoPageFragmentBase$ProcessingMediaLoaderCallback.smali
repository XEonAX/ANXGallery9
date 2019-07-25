.class Lcom/miui/gallery/ui/PhotoPageFragmentBase$ProcessingMediaLoaderCallback;
.super Ljava/lang/Object;
.source "PhotoPageFragmentBase.java"

# interfaces
.implements Landroid/app/LoaderManager$LoaderCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPageFragmentBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ProcessingMediaLoaderCallback"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/app/LoaderManager$LoaderCallbacks<",
        "Ljava/util/List<",
        "Lcom/miui/gallery/provider/ProcessingMedia;",
        ">;>;"
    }
.end annotation


# instance fields
.field private isFirstLoad:Z

.field private start:J

.field final synthetic this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/ui/PhotoPageFragmentBase;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ProcessingMediaLoaderCallback;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ProcessingMediaLoaderCallback;->isFirstLoad:Z

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/ui/PhotoPageFragmentBase;Lcom/miui/gallery/ui/PhotoPageFragmentBase$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ProcessingMediaLoaderCallback;-><init>(Lcom/miui/gallery/ui/PhotoPageFragmentBase;)V

    return-void
.end method


# virtual methods
.method public onCreateLoader(ILandroid/os/Bundle;)Landroid/content/Loader;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Landroid/os/Bundle;",
            ")",
            "Landroid/content/Loader<",
            "Ljava/util/List<",
            "Lcom/miui/gallery/provider/ProcessingMedia;",
            ">;>;"
        }
    .end annotation

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p1

    iput-wide p1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ProcessingMediaLoaderCallback;->start:J

    new-instance p1, Lcom/miui/gallery/loader/ProcessingMediaLoader;

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ProcessingMediaLoaderCallback;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    iget-object p2, p2, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {p2}, Lcom/miui/gallery/activity/BaseActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/miui/gallery/loader/ProcessingMediaLoader;-><init>(Landroid/content/Context;)V

    return-object p1
.end method

.method public bridge synthetic onLoadFinished(Landroid/content/Loader;Ljava/lang/Object;)V
    .locals 0

    check-cast p2, Ljava/util/List;

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ProcessingMediaLoaderCallback;->onLoadFinished(Landroid/content/Loader;Ljava/util/List;)V

    return-void
.end method

.method public onLoadFinished(Landroid/content/Loader;Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Loader<",
            "Ljava/util/List<",
            "Lcom/miui/gallery/provider/ProcessingMedia;",
            ">;>;",
            "Ljava/util/List<",
            "Lcom/miui/gallery/provider/ProcessingMedia;",
            ">;)V"
        }
    .end annotation

    invoke-static {p2}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ProcessingMediaLoaderCallback;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p1, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mProcessingMediaMap:Ljava/util/Map;

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/provider/ProcessingMedia;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ProcessingMediaLoaderCallback;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mProcessingMediaMap:Ljava/util/Map;

    invoke-virtual {v0}, Lcom/miui/gallery/provider/ProcessingMedia;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ProcessingMediaLoaderCallback;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->access$400(Lcom/miui/gallery/ui/PhotoPageFragmentBase;)Ljava/lang/Runnable;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/internal/CompatHandler;->removeCallbacks(Ljava/lang/Runnable;)V

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ProcessingMediaLoaderCallback;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->access$500(Lcom/miui/gallery/ui/PhotoPageFragmentBase;)Ljava/lang/Runnable;

    move-result-object v0

    const-wide/16 v1, 0x2710

    invoke-virtual {p1, v0, v1, v2}, Lcom/android/internal/CompatHandler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_1

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ProcessingMediaLoaderCallback;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    const/4 v0, 0x0

    iput-object v0, p1, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mProcessingMediaMap:Ljava/util/Map;

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ProcessingMediaLoaderCallback;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->access$400(Lcom/miui/gallery/ui/PhotoPageFragmentBase;)Ljava/lang/Runnable;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/internal/CompatHandler;->removeCallbacks(Ljava/lang/Runnable;)V

    :goto_1
    invoke-static {}, Lcom/miui/gallery/util/ProcessingMediaHelper;->getInstance()Lcom/miui/gallery/util/ProcessingMediaHelper;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/miui/gallery/util/ProcessingMediaHelper;->calibrateCache(Ljava/util/List;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ProcessingMediaLoaderCallback;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mAdapter:Lcom/miui/gallery/adapter/PhotoPageAdapter;

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ProcessingMediaLoaderCallback;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    iget-object p2, p2, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mProcessingMediaMap:Ljava/util/Map;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->setProcessingMedias(Ljava/util/Map;)V

    iget-boolean p1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ProcessingMediaLoaderCallback;->isFirstLoad:Z

    if-nez p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ProcessingMediaLoaderCallback;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mAdapter:Lcom/miui/gallery/adapter/PhotoPageAdapter;

    invoke-virtual {p1}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->notifyDataSetChanged()V

    goto :goto_2

    :cond_2
    const-string p1, "PhotoPageFragmentBase"

    const-string p2, "ProcessingMediaLoader first load costs [%d] ms"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ProcessingMediaLoaderCallback;->start:J

    sub-long/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {p1, p2, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :goto_2
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ProcessingMediaLoaderCallback;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->access$600(Lcom/miui/gallery/ui/PhotoPageFragmentBase;)Z

    move-result p1

    const/4 p2, 0x0

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ProcessingMediaLoaderCallback;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    invoke-static {p1, p2}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->access$602(Lcom/miui/gallery/ui/PhotoPageFragmentBase;Z)Z

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ProcessingMediaLoaderCallback;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->access$700(Lcom/miui/gallery/ui/PhotoPageFragmentBase;)V

    :cond_3
    iput-boolean p2, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ProcessingMediaLoaderCallback;->isFirstLoad:Z

    return-void
.end method

.method public onLoaderReset(Landroid/content/Loader;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Loader<",
            "Ljava/util/List<",
            "Lcom/miui/gallery/provider/ProcessingMedia;",
            ">;>;)V"
        }
    .end annotation

    return-void
.end method
