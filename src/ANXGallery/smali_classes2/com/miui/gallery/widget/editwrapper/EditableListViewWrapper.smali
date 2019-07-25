.class public Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;
.super Ljava/lang/Object;
.source "EditableListViewWrapper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckState;,
        Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;,
        Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$SimpleWrapper;,
        Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$StickyHeaderAdapterWrapper;,
        Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$MultiChoiceModeCallback;,
        Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;
    }
.end annotation


# instance fields
.field private mAdapterWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$SimpleWrapper;

.field private mAdapterWrappers:Landroid/util/ArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/ArrayMap<",
            "Landroid/support/v7/widget/RecyclerView$Adapter;",
            "Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$SimpleWrapper;",
            ">;"
        }
    .end annotation
.end field

.field private mAnimationManager:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;

.field private mCheckItemListener:Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemClickListener;

.field private mCheckState:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;

.field private mChoiceActionMode:Landroid/view/ActionMode;

.field private mEditActionMode:Lmiui/view/EditActionMode;

.field private mEnterActionModeListener:Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemLongClickListener;

.field private mHeaderAdapterWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$StickyHeaderAdapterWrapper;

.field private mIsInActionMode:Z

.field private mIsInChoiceMode:Z

.field private mItemClickDelegate:Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemClickListener;

.field private mListScrollState:I

.field private mMultiChoiceModeCallback:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$MultiChoiceModeCallback;

.field private mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

.field private mRestoreCheckStateObserver:Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;

.field private mScrollDelegate:Landroid/support/v7/widget/RecyclerView$OnScrollListener;

.field private mScrollListener:Landroid/support/v7/widget/RecyclerView$OnScrollListener;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;

    invoke-direct {v0, p0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;-><init>(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;)V

    iput-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mAnimationManager:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mListScrollState:I

    new-instance v0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$1;-><init>(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;)V

    iput-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mScrollDelegate:Landroid/support/v7/widget/RecyclerView$OnScrollListener;

    new-instance v0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$2;-><init>(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;)V

    iput-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mEnterActionModeListener:Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemLongClickListener;

    new-instance v0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$3;

    invoke-direct {v0, p0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$3;-><init>(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;)V

    iput-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mCheckItemListener:Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemClickListener;

    new-instance v0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$5;

    invoke-direct {v0, p0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$5;-><init>(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;)V

    iput-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mRestoreCheckStateObserver:Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;

    if-eqz p1, :cond_0

    iput-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    new-instance p1, Landroid/util/ArrayMap;

    invoke-direct {p1}, Landroid/util/ArrayMap;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mAdapterWrappers:Landroid/util/ArrayMap;

    iget-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mAnimationManager:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    iget-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mScrollDelegate:Landroid/support/v7/widget/RecyclerView$OnScrollListener;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->addOnScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V

    new-instance p1, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    iget-object v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mAnimationManager:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;

    invoke-direct {p1, v0, v1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;-><init>(Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;)V

    iput-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mCheckState:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "recyclerView can\'t be null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method static synthetic access$000(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mListScrollState:I

    return p0
.end method

.method static synthetic access$002(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;I)I
    .locals 0

    iput p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mListScrollState:I

    return p1
.end method

.method static synthetic access$100(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;)Landroid/support/v7/widget/RecyclerView$OnScrollListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mScrollListener:Landroid/support/v7/widget/RecyclerView$OnScrollListener;

    return-object p0
.end method

.method static synthetic access$1000(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;)Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$MultiChoiceModeCallback;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mMultiChoiceModeCallback:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$MultiChoiceModeCallback;

    return-object p0
.end method

.method static synthetic access$1300(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;)Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    return-object p0
.end method

.method static synthetic access$1400(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->enterChoiceMode()V

    return-void
.end method

.method static synthetic access$1502(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mIsInActionMode:Z

    return p1
.end method

.method static synthetic access$1602(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;Lmiui/view/EditActionMode;)Lmiui/view/EditActionMode;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mEditActionMode:Lmiui/view/EditActionMode;

    return-object p1
.end method

.method static synthetic access$1702(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mIsInChoiceMode:Z

    return p1
.end method

.method static synthetic access$1800(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->exitChoiceMode()V

    return-void
.end method

.method static synthetic access$1900(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;Lcom/miui/gallery/ui/CheckableView;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->setCheckableHeaderView(Lcom/miui/gallery/ui/CheckableView;I)V

    return-void
.end method

.method static synthetic access$2000(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;I)Z
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->setGroupCheck(I)Z

    move-result p0

    return p0
.end method

.method static synthetic access$2100(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->notifyDataChanged()V

    return-void
.end method

.method static synthetic access$2200(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->handleDataChanged()V

    return-void
.end method

.method static synthetic access$400(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;I)Z
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->isListHeaderOrFooter(I)Z

    move-result p0

    return p0
.end method

.method static synthetic access$500(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;)Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mAnimationManager:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;

    return-object p0
.end method

.method static synthetic access$700(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;)Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mCheckState:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;

    return-object p0
.end method

.method static synthetic access$800(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->updateActionMode()V

    return-void
.end method

.method static synthetic access$900(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;)Landroid/view/ActionMode;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mChoiceActionMode:Landroid/view/ActionMode;

    return-object p0
.end method

.method static synthetic access$902(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;Landroid/view/ActionMode;)Landroid/view/ActionMode;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mChoiceActionMode:Landroid/view/ActionMode;

    return-object p1
.end method

.method private checkMultiChoiceModeCallback()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mMultiChoiceModeCallback:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$MultiChoiceModeCallback;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mMultiChoiceModeCallback:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$MultiChoiceModeCallback;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$MultiChoiceModeCallback;->hasWrappedCallback()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "no MultiChoiceModeListener is set"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private enterChoiceMode()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->setLongClickable(Z)V

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    iget-object v2, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mCheckItemListener:Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemClickListener;

    invoke-virtual {v0, v2}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->setOnItemClickListener(Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemClickListener;)V

    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->getChildCount()I

    move-result v0

    if-ge v1, v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    instance-of v2, v0, Lcom/miui/gallery/ui/Checkable;

    if-eqz v2, :cond_0

    check-cast v0, Lcom/miui/gallery/ui/Checkable;

    const/4 v2, 0x1

    invoke-interface {v0, v2}, Lcom/miui/gallery/ui/Checkable;->setCheckable(Z)V

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mAnimationManager:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;->startEnterActionModeAni()V

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mCheckState:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;->clear()V

    invoke-direct {p0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->notifyDataChanged()V

    return-void
.end method

.method private exitChoiceMode()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->setLongClickable(Z)V

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    iget-object v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mItemClickDelegate:Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemClickListener;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->setOnItemClickListener(Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemClickListener;)V

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_0
    iget-object v2, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    invoke-virtual {v2}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_1

    iget-object v2, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    invoke-virtual {v2, v1}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    instance-of v3, v2, Lcom/miui/gallery/ui/Checkable;

    if-eqz v3, :cond_0

    check-cast v2, Lcom/miui/gallery/ui/Checkable;

    invoke-interface {v2, v0}, Lcom/miui/gallery/ui/Checkable;->setCheckable(Z)V

    invoke-interface {v2, v0}, Lcom/miui/gallery/ui/Checkable;->setChecked(Z)V

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mAnimationManager:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;->startExistActionModeAni()V

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mCheckState:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;->clear()V

    invoke-direct {p0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->notifyDataChanged()V

    return-void
.end method

.method private handleDataChanged()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mCheckState:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;->handleDataChanged()V

    invoke-direct {p0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->updateActionMode()V

    return-void
.end method

.method private isListHeaderOrFooter(I)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mAdapterWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$SimpleWrapper;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$SimpleWrapper;->isHeaderOrFooterPosition(I)Z

    move-result p1

    return p1
.end method

.method private notifyDataChanged()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    return-void
.end method

.method private setCheckableHeaderView(Lcom/miui/gallery/ui/CheckableView;I)V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->isInChoiceMode()Z

    move-result v0

    invoke-interface {p1, v0}, Lcom/miui/gallery/ui/CheckableView;->setCheckable(Z)V

    invoke-virtual {p0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->isInChoiceMode()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$4;

    invoke-direct {v0, p0, p2}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$4;-><init>(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;I)V

    invoke-interface {p1, v0}, Lcom/miui/gallery/ui/CheckableView;->setCheckableListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mCheckState:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;

    invoke-virtual {v0, p2}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;->getGroupCheckState(I)Z

    move-result p2

    invoke-interface {p1, p2}, Lcom/miui/gallery/ui/CheckableView;->setChecked(Z)V

    :cond_0
    return-void
.end method

.method private setGroupCheck(I)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mHeaderAdapterWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$StickyHeaderAdapterWrapper;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mCheckState:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;->setGroupCheckState(I)Z

    move-result p1

    invoke-direct {p0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->updateOnScreenViewsState()V

    invoke-direct {p0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->updateActionMode()V

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private updateActionMode()V
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mChoiceActionMode:Landroid/view/ActionMode;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mCheckState:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;->getCount()I

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mChoiceActionMode:Landroid/view/ActionMode;

    iget-object v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    invoke-virtual {v1}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lmiui/R$string;->select_item:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/ActionMode;->setTitle(Ljava/lang/CharSequence;)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lmiui/R$plurals;->items_selected:I

    iget-object v2, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mCheckState:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;

    invoke-virtual {v2}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;->getCount()I

    move-result v2

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mCheckState:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;

    invoke-virtual {v5}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;->getCount()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mChoiceActionMode:Landroid/view/ActionMode;

    invoke-virtual {v1, v0}, Landroid/view/ActionMode;->setTitle(Ljava/lang/CharSequence;)V

    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mEditActionMode:Lmiui/view/EditActionMode;

    if-nez v0, :cond_2

    return-void

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mEditActionMode:Lmiui/view/EditActionMode;

    const v2, 0x102001a

    invoke-virtual {p0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->isAllItemsChecked()Z

    move-result v3

    invoke-static {v0, v1, v2, v3}, Lmiui/gallery/support/MiuiSdkCompat;->setEditActionModeButton(Landroid/content/Context;Lmiui/view/EditActionMode;II)V

    return-void
.end method

.method private updateOnScreenViewsState()V
    .locals 6

    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    invoke-virtual {v1}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    invoke-virtual {v1, v0}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    instance-of v2, v1, Lcom/miui/gallery/ui/Checkable;

    if-eqz v2, :cond_0

    move-object v2, v1

    check-cast v2, Lcom/miui/gallery/ui/Checkable;

    iget-object v3, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mCheckState:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;

    iget-object v4, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    invoke-virtual {v4, v1}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->getChildItemId(Landroid/view/View;)J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;->getCheckState(J)Z

    move-result v1

    invoke-interface {v2, v1}, Lcom/miui/gallery/ui/Checkable;->setChecked(Z)V

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method


# virtual methods
.method public enableChoiceMode(Z)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->setLongClickable(Z)V

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mEnterActionModeListener:Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemLongClickListener;

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    invoke-virtual {v0, p1}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->setOnItemLongClickListener(Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemLongClickListener;)V

    return-void
.end method

.method public getCheckedItemCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mCheckState:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;->getCount()I

    move-result v0

    return v0
.end method

.method public getCheckedItemOrderedPositions()[I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mCheckState:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;->getCheckedItemOrderedPositions()[I

    move-result-object v0

    return-object v0
.end method

.method public getCheckedItemPositions()Landroid/util/SparseBooleanArray;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mCheckState:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;->getCheckedItemPositions()Landroid/util/SparseBooleanArray;

    move-result-object v0

    return-object v0
.end method

.method public getCheckedItems()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mAdapterWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$SimpleWrapper;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mAdapterWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$SimpleWrapper;

    invoke-virtual {v1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$SimpleWrapper;->getWrapped()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v1

    instance-of v1, v1, Lcom/miui/gallery/adapter/BaseMediaAdapter;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mAdapterWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$SimpleWrapper;

    invoke-virtual {v1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$SimpleWrapper;->getWrapped()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/adapter/BaseMediaAdapter;

    invoke-virtual {p0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->getCheckedItemOrderedPositions()[I

    move-result-object v2

    if-eqz v2, :cond_1

    array-length v3, v2

    if-lez v3, :cond_1

    const/4 v3, 0x0

    :goto_0
    array-length v4, v2

    if-ge v3, v4, :cond_1

    aget v4, v2, v3

    invoke-virtual {v1, v4}, Lcom/miui/gallery/adapter/BaseMediaAdapter;->getCheckedItem(I)Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem;

    move-result-object v4

    if-eqz v4, :cond_0

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method public handleDataInvalid()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mCheckState:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;->clear()V

    invoke-direct {p0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->updateActionMode()V

    return-void
.end method

.method public isAllItemsChecked()Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mCheckState:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;->getCount()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mAdapterWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$SimpleWrapper;

    invoke-virtual {v1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$SimpleWrapper;->getSourceItemCount()I

    move-result v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isCheckedItemContainVideo()Z
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mAdapterWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$SimpleWrapper;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mAdapterWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$SimpleWrapper;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$SimpleWrapper;->getWrapped()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v0

    instance-of v0, v0, Lcom/miui/gallery/adapter/BaseMediaAdapter;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mAdapterWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$SimpleWrapper;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$SimpleWrapper;->getWrapped()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/adapter/BaseMediaAdapter;

    invoke-virtual {p0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->getCheckedItemPositions()Landroid/util/SparseBooleanArray;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-virtual {v2}, Landroid/util/SparseBooleanArray;->size()I

    move-result v3

    if-lez v3, :cond_1

    const/4 v3, 0x0

    :goto_0
    invoke-virtual {v2}, Landroid/util/SparseBooleanArray;->size()I

    move-result v4

    if-ge v3, v4, :cond_1

    invoke-virtual {v2, v3}, Landroid/util/SparseBooleanArray;->valueAt(I)Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-virtual {v2, v3}, Landroid/util/SparseBooleanArray;->keyAt(I)I

    move-result v4

    invoke-virtual {v0, v4}, Lcom/miui/gallery/adapter/BaseMediaAdapter;->getMimeType(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/miui/gallery/util/FileMimeUtil;->isVideoFromMimeType(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    return v1
.end method

.method public isInActionMode()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mIsInActionMode:Z

    return v0
.end method

.method public isInChoiceMode()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mIsInChoiceMode:Z

    return v0
.end method

.method public setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mAdapterWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$SimpleWrapper;

    iget-object v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mAdapterWrappers:Landroid/util/ArrayMap;

    invoke-virtual {v1, p1}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$SimpleWrapper;

    iput-object v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mAdapterWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$SimpleWrapper;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mAdapterWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$SimpleWrapper;

    if-ne v0, v1, :cond_0

    const-string p1, "EditableListViewWrapper"

    const-string v0, "setAdapter the same adapter"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mCheckState:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;->clear()V

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mAdapterWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$SimpleWrapper;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mAdapterWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$SimpleWrapper;

    iget-object v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mRestoreCheckStateObserver:Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$SimpleWrapper;->unregisterAdapterDataObserver(Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;)V

    :cond_1
    if-nez p1, :cond_2

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mAdapterWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$SimpleWrapper;

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    invoke-virtual {p0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->handleDataInvalid()V

    return-void

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mAdapterWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$SimpleWrapper;

    if-nez v0, :cond_3

    new-instance v0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$SimpleWrapper;

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$SimpleWrapper;-><init>(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;Landroid/support/v7/widget/RecyclerView$Adapter;)V

    iput-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mAdapterWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$SimpleWrapper;

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mAdapterWrappers:Landroid/util/ArrayMap;

    iget-object v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mAdapterWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$SimpleWrapper;

    invoke-virtual {v0, p1, v1}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_3
    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mAdapterWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$SimpleWrapper;

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$Adapter;->hasStableIds()Z

    move-result p1

    invoke-virtual {v0, p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$SimpleWrapper;->setHasStableIds(Z)V

    iget-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mAdapterWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$SimpleWrapper;

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mRestoreCheckStateObserver:Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$SimpleWrapper;->registerAdapterDataObserver(Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;)V

    iget-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mAdapterWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$SimpleWrapper;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    iget-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mCheckState:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mAdapterWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$SimpleWrapper;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;->bind(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckState$Source;)V

    invoke-direct {p0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->handleDataChanged()V

    return-void
.end method

.method public setAllItemsCheckState(Z)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mCheckState:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;->setAllChecked(Z)V

    invoke-direct {p0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->updateOnScreenViewsState()V

    invoke-direct {p0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->updateActionMode()V

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mMultiChoiceModeCallback:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$MultiChoiceModeCallback;

    invoke-static {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$MultiChoiceModeCallback;->access$600(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$MultiChoiceModeCallback;)Lcom/miui/gallery/widget/editwrapper/MultiChoiceModeListener;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mChoiceActionMode:Landroid/view/ActionMode;

    invoke-interface {v0, v1, p1}, Lcom/miui/gallery/widget/editwrapper/MultiChoiceModeListener;->onAllItemsCheckedStateChanged(Landroid/view/ActionMode;Z)V

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mAnimationManager:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;

    iget-object v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    invoke-virtual {v0, v1, p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;->startScaleAllItemImageViewAnimation(Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;Z)V

    return-void
.end method

.method public setEmptyView(Landroid/view/View;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->setEmptyView(Landroid/view/View;)V

    return-void
.end method

.method public setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    return-void
.end method

.method public setMultiChoiceModeListener(Lcom/miui/gallery/widget/editwrapper/MultiChoiceModeListener;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mMultiChoiceModeCallback:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$MultiChoiceModeCallback;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$MultiChoiceModeCallback;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$MultiChoiceModeCallback;-><init>(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$1;)V

    iput-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mMultiChoiceModeCallback:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$MultiChoiceModeCallback;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mMultiChoiceModeCallback:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$MultiChoiceModeCallback;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$MultiChoiceModeCallback;->setWrapped(Lcom/miui/gallery/widget/editwrapper/MultiChoiceModeListener;)V

    return-void
.end method

.method public setOnItemClickListener(Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemClickListener;)V
    .locals 1

    iput-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mItemClickDelegate:Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemClickListener;

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->setOnItemClickListener(Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemClickListener;)V

    return-void
.end method

.method public setOnScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mScrollListener:Landroid/support/v7/widget/RecyclerView$OnScrollListener;

    return-void
.end method

.method public setStickyHeaderAdapter(Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    instance-of v0, v0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;

    if-eqz v0, :cond_0

    new-instance v0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$StickyHeaderAdapterWrapper;

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$StickyHeaderAdapterWrapper;-><init>(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;)V

    iput-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mHeaderAdapterWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$StickyHeaderAdapterWrapper;

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    check-cast v0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;

    iget-object v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mHeaderAdapterWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$StickyHeaderAdapterWrapper;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;->setStickyHeaderAdapter(Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;)V

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mCheckState:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;->bindStickyHeaderAdapter(Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;)V

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "the recycler view should be StickyHeaderRecyclerView"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setStickyHeaderLayoutManager(Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    instance-of v0, v0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    check-cast v0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;->setStickyHeaderLayoutManager(Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;)V

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "the recycler view should be StickyHeaderRecyclerView"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public startActionMode()V
    .locals 3

    invoke-direct {p0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->checkMultiChoiceModeCallback()V

    iget-boolean v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mIsInChoiceMode:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    iget-object v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mMultiChoiceModeCallback:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$MultiChoiceModeCallback;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->startActionMode(Landroid/view/ActionMode$Callback;)Landroid/view/ActionMode;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mChoiceActionMode:Landroid/view/ActionMode;

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mChoiceActionMode:Landroid/view/ActionMode;

    instance-of v0, v0, Lmiui/view/EditActionMode;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mChoiceActionMode:Landroid/view/ActionMode;

    check-cast v0, Lmiui/view/EditActionMode;

    iput-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mEditActionMode:Lmiui/view/EditActionMode;

    :cond_1
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mIsInChoiceMode:Z

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mMultiChoiceModeCallback:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$MultiChoiceModeCallback;

    invoke-static {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$MultiChoiceModeCallback;->access$600(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$MultiChoiceModeCallback;)Lcom/miui/gallery/widget/editwrapper/MultiChoiceModeListener;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mChoiceActionMode:Landroid/view/ActionMode;

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Lcom/miui/gallery/widget/editwrapper/MultiChoiceModeListener;->onAllItemsCheckedStateChanged(Landroid/view/ActionMode;Z)V

    return-void
.end method

.method public stopActionMode()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mChoiceActionMode:Landroid/view/ActionMode;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->mChoiceActionMode:Landroid/view/ActionMode;

    invoke-virtual {v0}, Landroid/view/ActionMode;->finish()V

    :cond_0
    return-void
.end method
