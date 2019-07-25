.class public Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;
.super Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;
.source "PhotoNaviFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment$EffectModuleLoadListener;,
        Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment$NavigatorHolder;,
        Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment$Adapter;
    }
.end annotation


# instance fields
.field private mAdapter:Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment$Adapter;

.field private mDialog:Landroid/app/Dialog;

.field private mNavigator:Lcom/miui/gallery/ui/SimpleRecyclerView;

.field private mOnItemSelectedListener:Lcom/miui/gallery/ui/SimpleRecyclerView$OnItemClickListener;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;-><init>()V

    new-instance v0, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment$1;-><init>(Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;->mOnItemSelectedListener:Lcom/miui/gallery/ui/SimpleRecyclerView$OnItemClickListener;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;)Ljava/util/List;
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;->getNaviData()Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;ZZ)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;->loadEffectModule(Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;ZZ)V

    return-void
.end method

.method static synthetic access$200(Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;Ljava/lang/String;Ljava/lang/String;IILandroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnClickListener;)V
    .locals 0

    invoke-direct/range {p0 .. p6}, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;->showDialog(Ljava/lang/String;Ljava/lang/String;IILandroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnClickListener;)V

    return-void
.end method

.method static synthetic access$300(Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;Lcom/miui/gallery/editor/photo/core/Effect;)V
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;->notifyNavigate(Lcom/miui/gallery/editor/photo/core/Effect;)V

    return-void
.end method

.method private checkAndLoadEffectModule()V
    .locals 5

    invoke-static {}, Lcom/miui/gallery/module/GalleryModuleManager;->getInstance()Lcom/miui/gallery/module/GalleryModuleManager;

    move-result-object v0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;->getNaviData()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;

    iget-boolean v3, v2, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;->isPlugin:Z

    if-nez v3, :cond_1

    goto :goto_0

    :cond_1
    iget-object v3, v2, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;->pluginModuleName:Ljava/lang/String;

    invoke-virtual {v0, v3}, Lcom/miui/gallery/module/GalleryModuleManager;->isModuleLoaded(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_0

    invoke-virtual {v0, v3}, Lcom/miui/gallery/module/GalleryModuleManager;->isModuleLoading(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    invoke-static {}, Lcom/miui/gallery/cloud/NetworkUtils;->isNetworkConnected()Z

    move-result v3

    const/4 v4, 0x0

    if-eqz v3, :cond_3

    invoke-static {}, Lcom/miui/gallery/cloud/NetworkUtils;->isActiveNetworkMetered()Z

    move-result v3

    if-eqz v3, :cond_2

    goto :goto_1

    :cond_2
    const/4 v3, 0x0

    goto :goto_2

    :cond_3
    :goto_1
    const/4 v3, 0x1

    :goto_2
    invoke-direct {p0, v2, v3, v4}, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;->loadEffectModule(Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;ZZ)V

    goto :goto_0

    :cond_4
    return-void
.end method

.method private loadEffectModule(Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;ZZ)V
    .locals 2

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment$2;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment$2;-><init>(Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;ZZ)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;)Lcom/miui/gallery/threadpool/Future;

    return-void
.end method

.method private showDialog(Ljava/lang/String;Ljava/lang/String;IILandroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnClickListener;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;->mDialog:Landroid/app/Dialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;->mDialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    :cond_0
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1, p2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1, p3, p5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1, p4, p6}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;->mDialog:Landroid/app/Dialog;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;->mDialog:Landroid/app/Dialog;

    invoke-virtual {p1}, Landroid/app/Dialog;->show()V

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;->onCreate(Landroid/os/Bundle;)V

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;->checkAndLoadEffectModule()V

    return-void
.end method

.method protected onCreateNavigator(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 0

    new-instance p1, Lcom/miui/gallery/editor/ui/menu/type/EditNavMenuView;

    invoke-virtual {p2}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/miui/gallery/editor/ui/menu/type/EditNavMenuView;-><init>(Landroid/content/Context;)V

    return-object p1
.end method

.method public onDestroy()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;->onDestroy()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;->mDialog:Landroid/app/Dialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;->mDialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;->mDialog:Landroid/app/Dialog;

    :cond_0
    return-void
.end method

.method public onDestroyView()V
    .locals 3

    invoke-super {p0}, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;->onDestroyView()V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;->getView()Landroid/view/View;

    move-result-object v0

    const v1, 0x7f09010b

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;->getView()Landroid/view/View;

    move-result-object v0

    const v2, 0x7f0900dc

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method protected onNavigatorCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 7

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;->onNavigatorCreated(Landroid/view/View;Landroid/os/Bundle;)V

    const p2, 0x7f090258

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/ui/SimpleRecyclerView;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;->mNavigator:Lcom/miui/gallery/ui/SimpleRecyclerView;

    new-instance p1, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment$Adapter;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;->getNaviData()Ljava/util/List;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment$Adapter;-><init>(Ljava/util/List;)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;->mAdapter:Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment$Adapter;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;->mNavigator:Lcom/miui/gallery/ui/SimpleRecyclerView;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;->mAdapter:Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment$Adapter;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/ui/SimpleRecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;->mAdapter:Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment$Adapter;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;->mOnItemSelectedListener:Lcom/miui/gallery/ui/SimpleRecyclerView$OnItemClickListener;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment$Adapter;->setOnItemClickListener(Lcom/miui/gallery/ui/SimpleRecyclerView$OnItemClickListener;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f06033b

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f06033a

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;->mNavigator:Lcom/miui/gallery/ui/SimpleRecyclerView;

    new-instance p2, Lcom/miui/gallery/ui/SimpleRecyclerView$BlankDivider;

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v0, p2

    move v1, v2

    invoke-direct/range {v0 .. v6}, Lcom/miui/gallery/ui/SimpleRecyclerView$BlankDivider;-><init>(IIIIII)V

    invoke-virtual {p1, p2}, Lcom/miui/gallery/ui/SimpleRecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;->mNavigator:Lcom/miui/gallery/ui/SimpleRecyclerView;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/widgets/overscroll/HorizontalOverScrollBounceEffectDecorator;->setOverScrollEffect(Landroid/support/v7/widget/RecyclerView;)V

    return-void
.end method
