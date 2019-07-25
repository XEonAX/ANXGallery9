.class public Lcom/miui/gallery/ui/ChooserFragment;
.super Landroid/app/Fragment;
.source "ChooserFragment.java"

# interfaces
.implements Lcom/miui/gallery/widget/ViewPager$OnPageChangeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/ChooserFragment$Component;,
        Lcom/miui/gallery/ui/ChooserFragment$PriorityComparator;,
        Lcom/miui/gallery/ui/ChooserFragment$OnIntentSelectedListener;,
        Lcom/miui/gallery/ui/ChooserFragment$SortInitializeListener;,
        Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;,
        Lcom/miui/gallery/ui/ChooserFragment$PagerPoint;
    }
.end annotation


# instance fields
.field private mAdapter:Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;

.field private mListener:Lcom/miui/gallery/ui/ChooserFragment$OnIntentSelectedListener;

.field private mPoint:Lcom/miui/gallery/ui/ChooserFragment$PagerPoint;

.field private mSorterInitializedListener:Lcom/miui/gallery/util/ShareComponentSorter$OnInitializedListener;

.field private mViewPager:Lcom/miui/gallery/widget/ViewPager;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/app/Fragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/ui/ChooserFragment;)Lcom/miui/gallery/ui/ChooserFragment$OnIntentSelectedListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/ChooserFragment;->mListener:Lcom/miui/gallery/ui/ChooserFragment$OnIntentSelectedListener;

    return-object p0
.end method

.method static synthetic access$900(Lcom/miui/gallery/ui/ChooserFragment;)Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/ChooserFragment;->mAdapter:Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;

    return-object p0
.end method

.method public static newInstance(Landroid/content/Intent;IZ)Lcom/miui/gallery/ui/ChooserFragment;
    .locals 3

    new-instance v0, Lcom/miui/gallery/ui/ChooserFragment;

    invoke-direct {v0}, Lcom/miui/gallery/ui/ChooserFragment;-><init>()V

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "key_target_intent"

    invoke-virtual {v1, v2, p0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    const-string p0, "key_theme"

    invoke-virtual {v1, p0, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string p0, "init_visible"

    invoke-virtual {v1, p0, p2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/ChooserFragment;->setArguments(Landroid/os/Bundle;)V

    return-object v0
.end method


# virtual methods
.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 8

    invoke-virtual {p0}, Lcom/miui/gallery/ui/ChooserFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p3

    if-eqz p3, :cond_2

    const-string v0, "key_target_intent"

    invoke-virtual {p3, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Landroid/content/Intent;

    if-eqz v3, :cond_2

    const-string v0, "key_theme"

    const/4 v7, 0x0

    invoke-virtual {p3, v0, v7}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v4

    invoke-virtual {p0}, Lcom/miui/gallery/ui/ChooserFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f040008

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v5

    const-string v0, "init_visible"

    const/4 v1, 0x1

    invoke-virtual {p3, v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v6

    const p3, 0x7f0b0042

    invoke-virtual {p1, p3, p2, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const p2, 0x7f09008b

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/widget/ViewPager;

    iput-object p2, p0, Lcom/miui/gallery/ui/ChooserFragment;->mViewPager:Lcom/miui/gallery/widget/ViewPager;

    iget-object p2, p0, Lcom/miui/gallery/ui/ChooserFragment;->mViewPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {p2, v1}, Lcom/miui/gallery/widget/ViewPager;->setRightOffscreenPageLimit(I)V

    iget-object p2, p0, Lcom/miui/gallery/ui/ChooserFragment;->mViewPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {p2, v1}, Lcom/miui/gallery/widget/ViewPager;->setLeftOffscreenPageLimit(I)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/ChooserFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    if-nez v4, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/ChooserFragment;->getActivity()Landroid/app/Activity;

    move-result-object p3

    invoke-static {p3}, Lcom/miui/gallery/util/MiscUtil;->isNightMode(Landroid/content/Context;)Z

    move-result p3

    if-nez p3, :cond_0

    const p3, 0x7f0702db

    goto :goto_0

    :cond_0
    const p3, 0x7f0702da

    :goto_0
    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    invoke-virtual {p0}, Lcom/miui/gallery/ui/ChooserFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    const v0, 0x7f070259

    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p3

    new-instance v0, Lcom/miui/gallery/ui/ChooserFragment$PagerPoint;

    const v1, 0x7f090208

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    invoke-direct {v0, v1, p2, p3}, Lcom/miui/gallery/ui/ChooserFragment$PagerPoint;-><init>(Landroid/widget/LinearLayout;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/ChooserFragment;->mPoint:Lcom/miui/gallery/ui/ChooserFragment$PagerPoint;

    new-instance p2, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/ChooserFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    move-object v1, p2

    invoke-direct/range {v1 .. v6}, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;-><init>(Landroid/content/Context;Landroid/content/Intent;IZZ)V

    iput-object p2, p0, Lcom/miui/gallery/ui/ChooserFragment;->mAdapter:Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;

    iget-object p2, p0, Lcom/miui/gallery/ui/ChooserFragment;->mPoint:Lcom/miui/gallery/ui/ChooserFragment$PagerPoint;

    iget-object p3, p0, Lcom/miui/gallery/ui/ChooserFragment;->mAdapter:Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;

    invoke-virtual {p3}, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;->getCount()I

    move-result p3

    invoke-virtual {p2, p3, v7}, Lcom/miui/gallery/ui/ChooserFragment$PagerPoint;->notifyPointCountChanged(II)V

    iget-object p2, p0, Lcom/miui/gallery/ui/ChooserFragment;->mViewPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {p2, p0}, Lcom/miui/gallery/widget/ViewPager;->setOnPageChangeListener(Lcom/miui/gallery/widget/ViewPager$OnPageChangeListener;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/ChooserFragment;->mViewPager:Lcom/miui/gallery/widget/ViewPager;

    iget-object p3, p0, Lcom/miui/gallery/ui/ChooserFragment;->mAdapter:Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;

    invoke-virtual {p2, p3}, Lcom/miui/gallery/widget/ViewPager;->setAdapter(Lcom/miui/gallery/widget/PagerAdapter;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/ChooserFragment;->mAdapter:Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;

    new-instance p3, Lcom/miui/gallery/ui/ChooserFragment$1;

    invoke-direct {p3, p0}, Lcom/miui/gallery/ui/ChooserFragment$1;-><init>(Lcom/miui/gallery/ui/ChooserFragment;)V

    invoke-virtual {p2, p3}, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;->setOnIntentSelectedListener(Lcom/miui/gallery/ui/ChooserFragment$OnIntentSelectedListener;)V

    invoke-static {}, Lcom/miui/gallery/util/ShareComponentSorter;->getInstance()Lcom/miui/gallery/util/ShareComponentSorter;

    move-result-object p2

    invoke-virtual {p2}, Lcom/miui/gallery/util/ShareComponentSorter;->initialized()Z

    move-result p2

    if-nez p2, :cond_1

    const-string p2, "ChooserFragment"

    const-string p3, "sorter not initialized"

    invoke-static {p2, p3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance p2, Lcom/miui/gallery/ui/ChooserFragment$SortInitializeListener;

    const/4 p3, 0x0

    invoke-direct {p2, p0, p3}, Lcom/miui/gallery/ui/ChooserFragment$SortInitializeListener;-><init>(Lcom/miui/gallery/ui/ChooserFragment;Lcom/miui/gallery/ui/ChooserFragment$1;)V

    iput-object p2, p0, Lcom/miui/gallery/ui/ChooserFragment;->mSorterInitializedListener:Lcom/miui/gallery/util/ShareComponentSorter$OnInitializedListener;

    invoke-static {}, Lcom/miui/gallery/util/ShareComponentSorter;->getInstance()Lcom/miui/gallery/util/ShareComponentSorter;

    move-result-object p2

    iget-object p3, p0, Lcom/miui/gallery/ui/ChooserFragment;->mSorterInitializedListener:Lcom/miui/gallery/util/ShareComponentSorter$OnInitializedListener;

    invoke-virtual {p2, p3}, Lcom/miui/gallery/util/ShareComponentSorter;->registerOnInitializedListener(Lcom/miui/gallery/util/ShareComponentSorter$OnInitializedListener;)V

    invoke-static {}, Lcom/miui/gallery/util/ShareComponentSorter;->getInstance()Lcom/miui/gallery/util/ShareComponentSorter;

    move-result-object p2

    invoke-virtual {p0}, Lcom/miui/gallery/ui/ChooserFragment;->getActivity()Landroid/app/Activity;

    move-result-object p3

    invoke-virtual {p3}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object p3

    invoke-virtual {p2, p3}, Lcom/miui/gallery/util/ShareComponentSorter;->initialize(Landroid/content/Context;)V

    :cond_1
    return-object p1

    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "target intent couldn\'t be null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public onDestroy()V
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/ui/ChooserFragment;->mListener:Lcom/miui/gallery/ui/ChooserFragment$OnIntentSelectedListener;

    iget-object v0, p0, Lcom/miui/gallery/ui/ChooserFragment;->mAdapter:Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/ChooserFragment;->mAdapter:Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;->release()V

    :cond_0
    invoke-super {p0}, Landroid/app/Fragment;->onDestroy()V

    return-void
.end method

.method public onDestroyView()V
    .locals 2

    invoke-super {p0}, Landroid/app/Fragment;->onDestroyView()V

    iget-object v0, p0, Lcom/miui/gallery/ui/ChooserFragment;->mSorterInitializedListener:Lcom/miui/gallery/util/ShareComponentSorter$OnInitializedListener;

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/util/ShareComponentSorter;->getInstance()Lcom/miui/gallery/util/ShareComponentSorter;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/ChooserFragment;->mSorterInitializedListener:Lcom/miui/gallery/util/ShareComponentSorter$OnInitializedListener;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/util/ShareComponentSorter;->removeOnInitializedListener(Lcom/miui/gallery/util/ShareComponentSorter$OnInitializedListener;)V

    :cond_0
    return-void
.end method

.method public onPageScrollStateChanged(I)V
    .locals 0

    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0

    return-void
.end method

.method public onPageSelected(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/ChooserFragment;->mPoint:Lcom/miui/gallery/ui/ChooserFragment$PagerPoint;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/ChooserFragment$PagerPoint;->notifyActivePointChanged(I)V

    return-void
.end method

.method public onVisibilityChanged(Z)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/ChooserFragment;->mAdapter:Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;

    if-eqz v0, :cond_1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/ChooserFragment;->mAdapter:Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;->resume()V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/ChooserFragment;->mAdapter:Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;->pause()V

    :cond_1
    :goto_0
    return-void
.end method

.method public requery(Landroid/content/Intent;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/ChooserFragment;->mAdapter:Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;->requery(Landroid/content/Intent;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/ChooserFragment;->mViewPager:Lcom/miui/gallery/widget/ViewPager;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/widget/ViewPager;->setCurrentItem(I)V

    iget-object p1, p0, Lcom/miui/gallery/ui/ChooserFragment;->mPoint:Lcom/miui/gallery/ui/ChooserFragment$PagerPoint;

    iget-object v0, p0, Lcom/miui/gallery/ui/ChooserFragment;->mAdapter:Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;->getCount()I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/ui/ChooserFragment;->mViewPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {v1}, Lcom/miui/gallery/widget/ViewPager;->getCurrentItem()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/ui/ChooserFragment$PagerPoint;->notifyPointCountChanged(II)V

    :cond_0
    return-void
.end method

.method public setOnIntentSelectedListener(Lcom/miui/gallery/ui/ChooserFragment$OnIntentSelectedListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/ChooserFragment;->mListener:Lcom/miui/gallery/ui/ChooserFragment$OnIntentSelectedListener;

    return-void
.end method
