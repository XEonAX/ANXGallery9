.class Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader;
.super Ljava/lang/Object;
.source "ChooserFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ResolveInfoLoader"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader$IconResult;,
        Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader$LoadTask;,
        Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader$LoadingInfo;,
        Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader$LoadResult;
    }
.end annotation


# instance fields
.field private mCacheKey:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mCacheResult:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader$LoadResult;",
            ">;"
        }
    .end annotation
.end field

.field private mExecutor:Ljava/util/concurrent/ThreadPoolExecutor;


# direct methods
.method public constructor <init>()V
    .locals 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader;->mCacheKey:Ljava/util/Map;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader;->mCacheResult:Ljava/util/Map;

    new-instance v0, Ljava/util/concurrent/ThreadPoolExecutor;

    sget-object v6, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v7, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v7}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    new-instance v8, Lcom/miui/gallery/threadpool/PriorityThreadFactory;

    const-string v1, "thread-pool"

    const/16 v2, 0xa

    invoke-direct {v8, v1, v2}, Lcom/miui/gallery/threadpool/PriorityThreadFactory;-><init>(Ljava/lang/String;I)V

    const/4 v2, 0x1

    const/4 v3, 0x2

    const-wide/16 v4, 0x1

    move-object v1, v0

    invoke-direct/range {v1 .. v8}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader;->mExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    return-void
.end method

.method static synthetic access$500(Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader;Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader$LoadResult;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader;->setResult(Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader$LoadResult;)V

    return-void
.end method

.method private static generateKey(Landroid/content/pm/ResolveInfo;)Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    if-eqz p0, :cond_0

    iget-object v1, p0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v1, v1, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "#"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object p0, p0, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private needApplyResult(Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader$LoadResult;)Z
    .locals 2

    if-eqz p1, :cond_0

    iget-object v0, p1, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader$LoadResult;->mLoadingInfo:Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader$LoadingInfo;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader;->mCacheResult:Ljava/util/Map;

    iget-object v1, p1, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader$LoadResult;->mLoadingInfo:Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader$LoadingInfo;

    iget-object v1, v1, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader$LoadingInfo;->mResolve:Landroid/content/pm/ResolveInfo;

    invoke-static {v1}, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader;->generateKey(Landroid/content/pm/ResolveInfo;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p1, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader$LoadResult;->mLoadingInfo:Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader$LoadingInfo;

    iget-object v0, v0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader$LoadingInfo;->mResolve:Landroid/content/pm/ResolveInfo;

    invoke-static {v0}, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader;->generateKey(Landroid/content/pm/ResolveInfo;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader;->mCacheKey:Ljava/util/Map;

    iget-object p1, p1, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader$LoadResult;->mLoadingInfo:Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader$LoadingInfo;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader$LoadingInfo;->getViewId()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/CharSequence;

    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method private setResult(Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader$LoadResult;)V
    .locals 4

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader;->needApplyResult(Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader$LoadResult;)Z

    move-result v0

    if-eqz v0, :cond_4

    iget-object v0, p1, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader$LoadResult;->mLoadingInfo:Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader$LoadingInfo;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader$LoadingInfo;->getIconView()Landroid/widget/ImageView;

    move-result-object v0

    if-eqz v0, :cond_2

    instance-of v1, v0, Lcom/miui/gallery/widget/CircleImageView;

    if-eqz v1, :cond_1

    iget-boolean v1, p1, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader$LoadResult;->mIsCustomIcon:Z

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    const/16 v1, -0xa

    :goto_0
    move-object v3, v0

    check-cast v3, Lcom/miui/gallery/widget/CircleImageView;

    invoke-virtual {v3, v1, v2}, Lcom/miui/gallery/widget/CircleImageView;->setDrawableInset(IZ)V

    :cond_1
    iget-object v1, p1, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader$LoadResult;->mIcon:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_2
    iget-object v0, p1, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader$LoadResult;->mLoadingInfo:Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader$LoadingInfo;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader$LoadingInfo;->getLabelView()Landroid/widget/TextView;

    move-result-object v0

    if-eqz v0, :cond_3

    iget-object v1, p1, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader$LoadResult;->mLabel:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_3
    iget-object v0, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader;->mCacheKey:Ljava/util/Map;

    iget-object p1, p1, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader$LoadResult;->mLoadingInfo:Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader$LoadingInfo;

    iget-object p1, p1, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader$LoadingInfo;->mResolve:Landroid/content/pm/ResolveInfo;

    invoke-static {p1}, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader;->generateKey(Landroid/content/pm/ResolveInfo;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_4
    return-void
.end method

.method private submit(Landroid/content/Context;Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader$LoadingInfo;)V
    .locals 3

    new-instance v0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader$LoadTask;

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader$LoadTask;-><init>(Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader;Landroid/content/Context;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader;->mExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader$LoadingInfo;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    invoke-virtual {v0, p1, v1}, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader$LoadTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method


# virtual methods
.method public loadInfo(Landroid/content/Context;Landroid/widget/ImageView;Landroid/widget/TextView;Landroid/content/pm/ResolveInfo;Z)V
    .locals 2

    if-nez p4, :cond_0

    return-void

    :cond_0
    invoke-static {p4}, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader;->generateKey(Landroid/content/pm/ResolveInfo;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader$LoadingInfo;

    invoke-direct {v1, p2, p3, p4, p5}, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader$LoadingInfo;-><init>(Landroid/widget/ImageView;Landroid/widget/TextView;Landroid/content/pm/ResolveInfo;Z)V

    iget-object p2, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader;->mCacheKey:Ljava/util/Map;

    invoke-virtual {v1}, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader$LoadingInfo;->getViewId()I

    move-result p3

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-interface {p2, p3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p2, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader;->mCacheResult:Ljava/util/Map;

    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader$LoadResult;

    if-eqz p2, :cond_1

    invoke-virtual {p2, v1}, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader$LoadResult;->setLoadingInfo(Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader$LoadingInfo;)Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader$LoadResult;

    invoke-direct {p0, p2}, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader;->setResult(Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader$LoadResult;)V

    const-string p1, "ChooserFragment"

    const-string p2, "load from cache"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    const-string p2, "ChooserFragment"

    const-string p3, "load from file"

    invoke-static {p2, p3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0, p1, v1}, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader;->submit(Landroid/content/Context;Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader$LoadingInfo;)V

    :goto_0
    return-void
.end method

.method public release()V
    .locals 1

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader;->mCacheKey:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    iget-object v0, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader;->mCacheResult:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    iget-object v0, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader;->mExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {v0}, Ljava/util/concurrent/ThreadPoolExecutor;->shutdownNow()Ljava/util/List;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :goto_0
    return-void
.end method
