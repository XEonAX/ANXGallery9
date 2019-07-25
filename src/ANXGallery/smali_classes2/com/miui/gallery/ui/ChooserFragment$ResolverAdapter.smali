.class Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;
.super Lcom/miui/gallery/widget/PagerAdapter;
.source "ChooserFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/ChooserFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ResolverAdapter"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$DisplayResolvedInfo;,
        Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$CellHolder;,
        Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader;
    }
.end annotation


# instance fields
.field private mCachedViews:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/View;",
            ">;>;"
        }
    .end annotation
.end field

.field private mContext:Landroid/content/Context;

.field private mData:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$DisplayResolvedInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mIsCrop:Z

.field private mListener:Lcom/miui/gallery/ui/ChooserFragment$OnIntentSelectedListener;

.field private mLoader:Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader;

.field private mPm:Landroid/content/pm/PackageManager;

.field private mPriorityComparator:Lcom/miui/gallery/ui/ChooserFragment$PriorityComparator;

.field private mResumed:Z

.field private mTarIntent:Landroid/content/Intent;

.field private mTheme:I


# direct methods
.method constructor <init>(Landroid/content/Context;Landroid/content/Intent;IZZ)V
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/widget/PagerAdapter;-><init>()V

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;->mCachedViews:Ljava/util/LinkedList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;->mData:Ljava/util/List;

    new-instance v0, Lcom/miui/gallery/ui/ChooserFragment$PriorityComparator;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/miui/gallery/ui/ChooserFragment$PriorityComparator;-><init>(Lcom/miui/gallery/ui/ChooserFragment$1;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;->mPriorityComparator:Lcom/miui/gallery/ui/ChooserFragment$PriorityComparator;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;->mResumed:Z

    iput-object p1, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;->mPm:Landroid/content/pm/PackageManager;

    iput-object p2, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;->mTarIntent:Landroid/content/Intent;

    iput p3, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;->mTheme:I

    iput-boolean p4, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;->mIsCrop:Z

    new-instance p1, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader;

    invoke-direct {p1}, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;->mLoader:Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader;

    invoke-direct {p0}, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;->reBuildList()V

    iput-boolean p5, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;->mResumed:Z

    return-void
.end method

.method static synthetic access$1000(Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;->reBuildList()V

    return-void
.end method

.method static synthetic access$700(Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;)Lcom/miui/gallery/ui/ChooserFragment$OnIntentSelectedListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;->mListener:Lcom/miui/gallery/ui/ChooserFragment$OnIntentSelectedListener;

    return-object p0
.end method

.method static synthetic access$800(Landroid/content/pm/ResolveInfo;Landroid/content/pm/ResolveInfo;)Z
    .locals 0

    invoke-static {p0, p1}, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;->isSameResolvedComponent(Landroid/content/pm/ResolveInfo;Landroid/content/pm/ResolveInfo;)Z

    move-result p0

    return p0
.end method

.method private addResolveListDedupe(Ljava/util/List;Ljava/util/List;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/content/pm/ResolveInfo;",
            ">;",
            "Ljava/util/List<",
            "Landroid/content/pm/ResolveInfo;",
            ">;)V"
        }
    .end annotation

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v0

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v0, :cond_3

    invoke-interface {p2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/content/pm/ResolveInfo;

    const/4 v5, 0x0

    :goto_1
    if-ge v5, v1, :cond_1

    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/content/pm/ResolveInfo;

    invoke-static {v4, v6}, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;->isSameResolvedComponent(Landroid/content/pm/ResolveInfo;Landroid/content/pm/ResolveInfo;)Z

    move-result v6

    if-eqz v6, :cond_0

    const/4 v5, 0x1

    goto :goto_2

    :cond_0
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    :cond_1
    const/4 v5, 0x0

    :goto_2
    if-nez v5, :cond_2

    invoke-interface {p1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_3
    return-void
.end method

.method private contains(Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$Component;Ljava/util/List;)Landroid/content/pm/ResolveInfo;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$Component;",
            "Ljava/util/List<",
            "Landroid/content/pm/ResolveInfo;",
            ">;)",
            "Landroid/content/pm/ResolveInfo;"
        }
    .end annotation

    invoke-interface {p2}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    move-result-object p2

    const/4 v0, 0x0

    :cond_0
    :goto_0
    invoke-interface {p2}, Ljava/util/ListIterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {p2}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/pm/ResolveInfo;

    iget-object v2, v1, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v2, v2, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$Component;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v0, v1, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v0, v0, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$Component;->getClassName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    move-object v0, v1

    goto :goto_1

    :cond_1
    move-object v0, v1

    goto :goto_0

    :cond_2
    :goto_1
    return-object v0
.end method

.method private conversePos(II)I
    .locals 0

    mul-int/lit8 p1, p1, 0x5

    add-int/2addr p1, p2

    return p1
.end method

.method private filterResolveInfoList(Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/content/pm/ResolveInfo;",
            ">;)V"
        }
    .end annotation

    if-nez p1, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_3

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/pm/ResolveInfo;

    iget-object v2, v1, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-boolean v2, v2, Landroid/content/pm/ActivityInfo;->exported:Z

    if-nez v2, :cond_1

    invoke-interface {p1, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    :cond_1
    iget-object v1, v1, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v1, v1, Landroid/content/pm/ActivityInfo;->permission:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_2

    iget-object v2, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;->mContext:Landroid/content/Context;

    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v3

    invoke-static {}, Landroid/os/Process;->myUid()I

    move-result v4

    invoke-virtual {v2, v1, v3, v4}, Landroid/content/Context;->checkPermission(Ljava/lang/String;II)I

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {p1, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    add-int/lit8 v0, v0, -0x1

    :cond_2
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_3
    return-void
.end method

.method private generatorChooserItem(Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 9

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;->mCachedViews:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;->mCachedViews:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->remove()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_0

    return-object v0

    :cond_2
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0b003d

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup;

    const/4 v1, 0x0

    :goto_1
    const/4 v3, 0x5

    if-ge v1, v3, :cond_6

    const v3, 0x7f0b003e

    invoke-virtual {v0, v3, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v3

    const v4, 0x7f090173

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/view/ViewGroup;

    const v5, 0x7f09008c

    invoke-virtual {v3, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iget v6, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;->mTheme:I

    const v7, 0x7f0b003f

    if-nez v6, :cond_4

    iget-boolean v6, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;->mIsCrop:Z

    if-eqz v6, :cond_3

    const v7, 0x7f0b0041

    :cond_3
    iget-object v6, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;->mContext:Landroid/content/Context;

    const v8, 0x7f11001c

    invoke-virtual {v5, v6, v8}, Landroid/widget/TextView;->setTextAppearance(Landroid/content/Context;I)V

    goto :goto_2

    :cond_4
    iget-boolean v6, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;->mIsCrop:Z

    if-eqz v6, :cond_5

    const v7, 0x7f0b0040

    :cond_5
    iget-object v6, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;->mContext:Landroid/content/Context;

    const v8, 0x7f11001b

    invoke-virtual {v5, v6, v8}, Landroid/widget/TextView;->setTextAppearance(Landroid/content/Context;I)V

    :goto_2
    invoke-virtual {v0, v7, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_6
    return-object p1
.end method

.method private static isSameResolvedComponent(Landroid/content/pm/ResolveInfo;Landroid/content/pm/ResolveInfo;)Z
    .locals 2

    iget-object v0, p0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v0, v0, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    iget-object v1, p1, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v1, v1, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p0, p0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object p0, p0, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    iget-object p1, p1, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object p1, p1, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method private reBuildList()V
    .locals 11

    iget-object v0, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;->mData:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;->mPm:Landroid/content/pm/PackageManager;

    iget-object v3, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;->mTarIntent:Landroid/content/Intent;

    const/high16 v4, 0x10000

    invoke-virtual {v2, v3, v4}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v2

    if-eqz v2, :cond_3

    invoke-direct {p0, v2}, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;->filterResolveInfoList(Ljava/util/List;)V

    new-instance v3, Ljava/util/LinkedList;

    invoke-direct {v3}, Ljava/util/LinkedList;-><init>()V

    invoke-direct {p0, v3, v2}, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;->addResolveListDedupe(Ljava/util/List;Ljava/util/List;)V

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_3

    const/4 v4, 0x0

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/content/pm/ResolveInfo;

    const/4 v6, 0x1

    :goto_0
    if-ge v6, v2, :cond_2

    invoke-interface {v3, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/content/pm/ResolveInfo;

    iget v8, v5, Landroid/content/pm/ResolveInfo;->priority:I

    iget v9, v7, Landroid/content/pm/ResolveInfo;->priority:I

    if-ne v8, v9, :cond_0

    iget-boolean v8, v5, Landroid/content/pm/ResolveInfo;->isDefault:Z

    iget-boolean v7, v7, Landroid/content/pm/ResolveInfo;->isDefault:Z

    if-eq v8, v7, :cond_1

    :cond_0
    :goto_1
    if-ge v6, v2, :cond_1

    invoke-interface {v3, v6}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    add-int/lit8 v2, v2, -0x1

    goto :goto_1

    :cond_1
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    :cond_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    invoke-static {}, Lcom/miui/gallery/util/ShareComponentSorter;->getInstance()Lcom/miui/gallery/util/ShareComponentSorter;

    move-result-object v7

    invoke-virtual {v7}, Lcom/miui/gallery/util/ShareComponentSorter;->createComparator()Ljava/util/Comparator;

    move-result-object v7

    iget-object v8, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;->mPriorityComparator:Lcom/miui/gallery/ui/ChooserFragment$PriorityComparator;

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlStrategyHelper;->getComponentPriority()Ljava/util/List;

    move-result-object v9

    invoke-virtual {v8, v9, v3}, Lcom/miui/gallery/ui/ChooserFragment$PriorityComparator;->build(Ljava/util/List;Ljava/util/List;)V

    iget-object v8, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;->mPriorityComparator:Lcom/miui/gallery/ui/ChooserFragment$PriorityComparator;

    invoke-static {v8, v7}, Lcom/miui/gallery/ui/ChooserFragment$PriorityComparator;->access$302(Lcom/miui/gallery/ui/ChooserFragment$PriorityComparator;Ljava/util/Comparator;)Ljava/util/Comparator;

    iget-object v7, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;->mPriorityComparator:Lcom/miui/gallery/ui/ChooserFragment$PriorityComparator;

    invoke-static {v3, v7}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    invoke-direct {p0, v3}, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;->sortResolveList(Ljava/util/List;)V

    const-string v7, "ChooserFragment"

    const-string v8, "sortResolveList cost %d"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    sub-long/2addr v9, v5

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-static {v7, v8, v5}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :goto_2
    if-ge v4, v2, :cond_3

    iget-object v5, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;->mData:Ljava/util/List;

    new-instance v6, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$DisplayResolvedInfo;

    iget-object v7, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;->mTarIntent:Landroid/content/Intent;

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/content/pm/ResolveInfo;

    invoke-direct {v6, p0, v7, v8}, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$DisplayResolvedInfo;-><init>(Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;Landroid/content/Intent;Landroid/content/pm/ResolveInfo;)V

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    :cond_3
    const-string v2, "ChooserFragment"

    const-string v3, "reBuildList cost %d"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long/2addr v4, v0

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {v2, v3, v0}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method private sortResolveList(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/content/pm/ResolveInfo;",
            ">;)V"
        }
    .end annotation

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlStrategyHelper;->getShareComponents()Ljava/util/List;

    move-result-object v0

    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$Component;

    invoke-direct {p0, v2, p1}, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;->contains(Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$Component;Ljava/util/List;)Landroid/content/pm/ResolveInfo;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-interface {p1, v2}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    invoke-interface {v1, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    invoke-interface {p1}, Ljava/util/List;->clear()V

    invoke-interface {p1, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    return-void
.end method


# virtual methods
.method public destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 0

    check-cast p3, Landroid/view/View;

    invoke-virtual {p1, p3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;->mCachedViews:Ljava/util/LinkedList;

    new-instance p2, Ljava/lang/ref/WeakReference;

    invoke-direct {p2, p3}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p1, p2}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public getCount()I
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;->mData:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    rem-int/lit8 v1, v0, 0x5

    if-nez v1, :cond_0

    div-int/lit8 v0, v0, 0x5

    goto :goto_0

    :cond_0
    div-int/lit8 v0, v0, 0x5

    add-int/lit8 v0, v0, 0x1

    :goto_0
    return v0
.end method

.method public getItemPosition(Ljava/lang/Object;I)I
    .locals 0

    if-lez p2, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;->getCount()I

    move-result p1

    if-ge p2, p1, :cond_0

    const/4 p1, -0x3

    return p1

    :cond_0
    const/4 p1, -0x2

    return p1
.end method

.method public instantiateItem(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .locals 1

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;->generatorChooserItem(Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p0, v0, p2}, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;->refreshItem(Ljava/lang/Object;I)V

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    return-object v0
.end method

.method public isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z
    .locals 0

    if-ne p1, p2, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public pause()V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;->mResumed:Z

    return-void
.end method

.method public refreshItem(Ljava/lang/Object;I)V
    .locals 13

    check-cast p1, Landroid/view/ViewGroup;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const v1, 0x7f0902cd

    invoke-virtual {p1, v1, v0}, Landroid/view/ViewGroup;->setTag(ILjava/lang/Object;)V

    iget-boolean v0, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;->mResumed:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_4

    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$CellHolder;

    const/4 v5, 0x0

    if-nez v4, :cond_1

    new-instance v4, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$CellHolder;

    invoke-direct {v4, p0, v5}, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$CellHolder;-><init>(Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;Lcom/miui/gallery/ui/ChooserFragment$1;)V

    const v6, 0x7f09008a

    invoke-virtual {v3, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/ImageView;

    iput-object v6, v4, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$CellHolder;->mIcon:Landroid/widget/ImageView;

    const v6, 0x7f09008c

    invoke-virtual {v3, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    iput-object v6, v4, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$CellHolder;->mText:Landroid/widget/TextView;

    invoke-virtual {v3, v4}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    :cond_1
    invoke-direct {p0, p2, v2}, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;->conversePos(II)I

    move-result v6

    if-ltz v6, :cond_3

    iget-object v7, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;->mData:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    if-ge v6, v7, :cond_3

    iget-object v5, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;->mData:Ljava/util/List;

    invoke-interface {v5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$DisplayResolvedInfo;

    invoke-virtual {v4, v5}, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$CellHolder;->needRefresh(Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$DisplayResolvedInfo;)Z

    move-result v6

    if-eqz v6, :cond_2

    iput-object v5, v4, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$CellHolder;->mInfo:Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$DisplayResolvedInfo;

    iget-object v7, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;->mLoader:Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v8

    iget-object v9, v4, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$CellHolder;->mIcon:Landroid/widget/ImageView;

    iget-object v10, v4, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$CellHolder;->mText:Landroid/widget/TextView;

    iget-object v5, v4, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$CellHolder;->mInfo:Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$DisplayResolvedInfo;

    invoke-virtual {v5}, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$DisplayResolvedInfo;->getResolveInfo()Landroid/content/pm/ResolveInfo;

    move-result-object v11

    iget-boolean v12, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;->mIsCrop:Z

    invoke-virtual/range {v7 .. v12}, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader;->loadInfo(Landroid/content/Context;Landroid/widget/ImageView;Landroid/widget/TextView;Landroid/content/pm/ResolveInfo;Z)V

    goto :goto_1

    :cond_2
    iput-object v5, v4, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$CellHolder;->mInfo:Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$DisplayResolvedInfo;

    :goto_1
    invoke-virtual {v3, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v3, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_2

    :cond_3
    invoke-virtual {v3, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const/4 v4, 0x4

    invoke-virtual {v3, v4}, Landroid/view/View;->setVisibility(I)V

    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_4
    return-void
.end method

.method public release()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;->mLoader:Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader;->release()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;->mListener:Lcom/miui/gallery/ui/ChooserFragment$OnIntentSelectedListener;

    return-void
.end method

.method public requery(Landroid/content/Intent;)Z
    .locals 1

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;->mTarIntent:Landroid/content/Intent;

    invoke-virtual {p1, v0}, Landroid/content/Intent;->filterEquals(Landroid/content/Intent;)Z

    move-result v0

    if-nez v0, :cond_0

    iput-object p1, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;->mTarIntent:Landroid/content/Intent;

    invoke-direct {p0}, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;->reBuildList()V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;->notifyDataSetChanged()V

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public resume()V
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;->mResumed:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;->mResumed:Z

    invoke-virtual {p0}, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;->notifyDataSetChanged()V

    :cond_0
    return-void
.end method

.method public setOnIntentSelectedListener(Lcom/miui/gallery/ui/ChooserFragment$OnIntentSelectedListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;->mListener:Lcom/miui/gallery/ui/ChooserFragment$OnIntentSelectedListener;

    return-void
.end method
