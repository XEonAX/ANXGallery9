.class public Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;
.super Ljava/lang/Object;
.source "EditableListViewWrapperDeprecated.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;,
        Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckStateWithGroup;,
        Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$TimeLineWrapper;,
        Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$SimpleTimeLineWrapper;,
        Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$SimpleWrapper;,
        Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$MultiChoiceModeCallback;,
        Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;
    }
.end annotation


# instance fields
.field private mAdapterWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$SimpleWrapper;

.field private mAdapterWrappers:Landroid/util/ArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/ArrayMap<",
            "Landroid/widget/ListAdapter;",
            "Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$SimpleWrapper;",
            ">;"
        }
    .end annotation
.end field

.field private mAnimationManager:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;

.field private mCheckItemListener:Landroid/widget/AdapterView$OnItemClickListener;

.field private mCheckState:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;

.field private mChoiceActionMode:Landroid/view/ActionMode;

.field private mEditActionMode:Lmiui/view/EditActionMode;

.field private mEnterActionModeListener:Landroid/widget/AdapterView$OnItemLongClickListener;

.field private mIsInActionMode:Z

.field private mIsInChoiceMode:Z

.field private mItemClickDelegate:Landroid/widget/AdapterView$OnItemClickListener;

.field private mListHeaderCount:I

.field private mListScrollState:I

.field private mListView:Landroid/widget/AbsListView;

.field private mMultiChoiceModeCallback:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$MultiChoiceModeCallback;

.field private mRestoreCheckStateObserver:Landroid/database/DataSetObserver;

.field private mScrollDelegate:Landroid/widget/AbsListView$OnScrollListener;

.field private mScrollListener:Landroid/widget/AbsListView$OnScrollListener;


# direct methods
.method public constructor <init>(Landroid/widget/AbsListView;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;

    invoke-direct {v0, p0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;-><init>(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;)V

    iput-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mAnimationManager:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mListScrollState:I

    new-instance v0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$1;-><init>(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;)V

    iput-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mScrollDelegate:Landroid/widget/AbsListView$OnScrollListener;

    new-instance v0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$2;-><init>(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;)V

    iput-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mEnterActionModeListener:Landroid/widget/AdapterView$OnItemLongClickListener;

    new-instance v0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$3;

    invoke-direct {v0, p0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$3;-><init>(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;)V

    iput-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mCheckItemListener:Landroid/widget/AdapterView$OnItemClickListener;

    new-instance v0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$5;

    invoke-direct {v0, p0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$5;-><init>(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;)V

    iput-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mRestoreCheckStateObserver:Landroid/database/DataSetObserver;

    if-eqz p1, :cond_0

    iput-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mListView:Landroid/widget/AbsListView;

    new-instance p1, Landroid/util/ArrayMap;

    invoke-direct {p1}, Landroid/util/ArrayMap;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mAdapterWrappers:Landroid/util/ArrayMap;

    iget-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mListView:Landroid/widget/AbsListView;

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mAnimationManager:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;

    invoke-virtual {p1, v0}, Landroid/widget/AbsListView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    iget-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mListView:Landroid/widget/AbsListView;

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mScrollDelegate:Landroid/widget/AbsListView$OnScrollListener;

    invoke-virtual {p1, v0}, Landroid/widget/AbsListView;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "listview can\'t be null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method static synthetic access$000(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mListScrollState:I

    return p0
.end method

.method static synthetic access$002(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;I)I
    .locals 0

    iput p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mListScrollState:I

    return p1
.end method

.method static synthetic access$100(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;)Landroid/widget/AbsListView$OnScrollListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mScrollListener:Landroid/widget/AbsListView$OnScrollListener;

    return-object p0
.end method

.method static synthetic access$1000(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;)Landroid/view/ActionMode;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mChoiceActionMode:Landroid/view/ActionMode;

    return-object p0
.end method

.method static synthetic access$1002(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;Landroid/view/ActionMode;)Landroid/view/ActionMode;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mChoiceActionMode:Landroid/view/ActionMode;

    return-object p1
.end method

.method static synthetic access$1100(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;)Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$MultiChoiceModeCallback;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mMultiChoiceModeCallback:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$MultiChoiceModeCallback;

    return-object p0
.end method

.method static synthetic access$1400(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;)Landroid/widget/AbsListView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mListView:Landroid/widget/AbsListView;

    return-object p0
.end method

.method static synthetic access$1500(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->enterChoiceMode()V

    return-void
.end method

.method static synthetic access$1602(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mIsInActionMode:Z

    return p1
.end method

.method static synthetic access$1702(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;Lmiui/view/EditActionMode;)Lmiui/view/EditActionMode;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mEditActionMode:Lmiui/view/EditActionMode;

    return-object p1
.end method

.method static synthetic access$1802(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mIsInChoiceMode:Z

    return p1
.end method

.method static synthetic access$1900(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->exitChoiceMode()V

    return-void
.end method

.method static synthetic access$2000(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;I)Z
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->setGroupCheck(I)Z

    move-result p0

    return p0
.end method

.method static synthetic access$2100(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->notifyDataChanged()V

    return-void
.end method

.method static synthetic access$2200(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;Lcom/miui/gallery/ui/CheckableView;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->setCheckableHeaderView(Lcom/miui/gallery/ui/CheckableView;I)V

    return-void
.end method

.method static synthetic access$2300(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->handleDataChanged()V

    return-void
.end method

.method static synthetic access$500(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mListHeaderCount:I

    return p0
.end method

.method static synthetic access$600(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;)Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mAnimationManager:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;

    return-object p0
.end method

.method static synthetic access$800(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;)Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mCheckState:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;

    return-object p0
.end method

.method static synthetic access$900(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->updateActionMode()V

    return-void
.end method

.method private checkMultiChoiceModeCallback()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mMultiChoiceModeCallback:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$MultiChoiceModeCallback;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mMultiChoiceModeCallback:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$MultiChoiceModeCallback;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$MultiChoiceModeCallback;->hasWrappedCallback()Z

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

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mListView:Landroid/widget/AbsListView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/AbsListView;->setLongClickable(Z)V

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mListView:Landroid/widget/AbsListView;

    iget-object v2, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mCheckItemListener:Landroid/widget/AdapterView$OnItemClickListener;

    invoke-virtual {v0, v2}, Landroid/widget/AbsListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mListView:Landroid/widget/AbsListView;

    invoke-virtual {v0}, Landroid/widget/AbsListView;->getChildCount()I

    move-result v0

    if-ge v1, v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mListView:Landroid/widget/AbsListView;

    invoke-virtual {v0, v1}, Landroid/widget/AbsListView;->getChildAt(I)Landroid/view/View;

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
    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mAnimationManager:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;->startEnterActionModeAni()V

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mCheckState:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->clear()V

    invoke-direct {p0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->notifyDataChanged()V

    return-void
.end method

.method private exitChoiceMode()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mListView:Landroid/widget/AbsListView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/AbsListView;->setLongClickable(Z)V

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mListView:Landroid/widget/AbsListView;

    iget-object v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mItemClickDelegate:Landroid/widget/AdapterView$OnItemClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/AbsListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_0
    iget-object v2, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mListView:Landroid/widget/AbsListView;

    invoke-virtual {v2}, Landroid/widget/AbsListView;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_1

    iget-object v2, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mListView:Landroid/widget/AbsListView;

    invoke-virtual {v2, v1}, Landroid/widget/AbsListView;->getChildAt(I)Landroid/view/View;

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
    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mAnimationManager:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;->startExistActionModeAni()V

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mCheckState:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->clear()V

    invoke-direct {p0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->notifyDataChanged()V

    return-void
.end method

.method private handleDataChanged()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mCheckState:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->handleDataChanged()V

    invoke-direct {p0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->updateActionMode()V

    return-void
.end method

.method private notifyDataChanged()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mListView:Landroid/widget/AbsListView;

    instance-of v0, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mListView:Landroid/widget/AbsListView;

    check-cast v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    invoke-virtual {v0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->notifyChanged()V

    :cond_0
    return-void
.end method

.method private setCheckableHeaderView(Lcom/miui/gallery/ui/CheckableView;I)V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->isInChoiceMode()Z

    move-result v0

    invoke-interface {p1, v0}, Lcom/miui/gallery/ui/CheckableView;->setCheckable(Z)V

    invoke-virtual {p0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->isInChoiceMode()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$4;

    invoke-direct {v0, p0, p2}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$4;-><init>(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;I)V

    invoke-interface {p1, v0}, Lcom/miui/gallery/ui/CheckableView;->setCheckableListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mCheckState:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;

    check-cast v0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckStateWithGroup;

    invoke-virtual {v0, p2}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckStateWithGroup;->getGroupCheckState(I)Z

    move-result p2

    invoke-interface {p1, p2}, Lcom/miui/gallery/ui/CheckableView;->setChecked(Z)V

    :cond_0
    return-void
.end method

.method private setGroupCheck(I)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mListView:Landroid/widget/AbsListView;

    instance-of v0, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mCheckState:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;

    check-cast v0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckStateWithGroup;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckStateWithGroup;->setGroupCheckState(I)Z

    move-result p1

    invoke-direct {p0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->updateOnScreenViewsState()V

    invoke-direct {p0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->updateActionMode()V

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private updateActionMode()V
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mChoiceActionMode:Landroid/view/ActionMode;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mCheckState:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->getCount()I

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mChoiceActionMode:Landroid/view/ActionMode;

    iget-object v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mListView:Landroid/widget/AbsListView;

    invoke-virtual {v1}, Landroid/widget/AbsListView;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lmiui/R$string;->select_item:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/ActionMode;->setTitle(Ljava/lang/CharSequence;)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mListView:Landroid/widget/AbsListView;

    invoke-virtual {v0}, Landroid/widget/AbsListView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lmiui/R$plurals;->items_selected:I

    iget-object v2, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mCheckState:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;

    invoke-virtual {v2}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->getCount()I

    move-result v2

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mCheckState:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;

    invoke-virtual {v5}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->getCount()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mChoiceActionMode:Landroid/view/ActionMode;

    invoke-virtual {v1, v0}, Landroid/view/ActionMode;->setTitle(Ljava/lang/CharSequence;)V

    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mEditActionMode:Lmiui/view/EditActionMode;

    if-nez v0, :cond_2

    return-void

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mListView:Landroid/widget/AbsListView;

    invoke-virtual {v0}, Landroid/widget/AbsListView;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mEditActionMode:Lmiui/view/EditActionMode;

    const v2, 0x102001a

    invoke-virtual {p0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->isAllItemsChecked()Z

    move-result v3

    invoke-static {v0, v1, v2, v3}, Lmiui/gallery/support/MiuiSdkCompat;->setEditActionModeButton(Landroid/content/Context;Lmiui/view/EditActionMode;II)V

    return-void
.end method

.method private updateOnScreenViewsState()V
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mListView:Landroid/widget/AbsListView;

    invoke-virtual {v0}, Landroid/widget/AbsListView;->getFirstVisiblePosition()I

    move-result v0

    iget v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mListHeaderCount:I

    :goto_0
    iget-object v2, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mListView:Landroid/widget/AbsListView;

    invoke-virtual {v2}, Landroid/widget/AbsListView;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_1

    iget-object v2, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mListView:Landroid/widget/AbsListView;

    invoke-virtual {v2, v1}, Landroid/widget/AbsListView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    instance-of v3, v2, Lcom/miui/gallery/ui/Checkable;

    if-eqz v3, :cond_0

    check-cast v2, Lcom/miui/gallery/ui/Checkable;

    iget-object v3, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mCheckState:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;

    iget-object v4, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mListView:Landroid/widget/AbsListView;

    add-int v5, v0, v1

    invoke-virtual {v4, v5}, Landroid/widget/AbsListView;->getItemIdAtPosition(I)J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->getCheckState(J)Z

    move-result v3

    invoke-interface {v2, v3}, Lcom/miui/gallery/ui/Checkable;->setChecked(Z)V

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method


# virtual methods
.method public clearChoices()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mCheckState:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->clear()V

    invoke-direct {p0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->updateActionMode()V

    invoke-direct {p0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->updateOnScreenViewsState()V

    return-void
.end method

.method public disableScaleImageViewAniWhenInActionMode()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mAnimationManager:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;->disableScaleImageViewAni()V

    return-void
.end method

.method public enableScaleImageViewAniWhenInActionMode()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mAnimationManager:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;->enableScaleImageViewAni()V

    return-void
.end method

.method public getAdapter()Landroid/widget/ListAdapter;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mAdapterWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$SimpleWrapper;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mAdapterWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$SimpleWrapper;

    invoke-static {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$SimpleWrapper;->access$200(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$SimpleWrapper;)Landroid/widget/ListAdapter;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public getCheckedItemCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mCheckState:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->getCount()I

    move-result v0

    return v0
.end method

.method public getCheckedItemIds()[J
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mCheckState:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->getCheckedItemIds()[J

    move-result-object v0

    return-object v0
.end method

.method public getCheckedItemOrderedPositions()[I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mCheckState:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->getCheckedItemOrderedPositions()[I

    move-result-object v0

    return-object v0
.end method

.method public getCheckedItemPositions()Landroid/util/SparseBooleanArray;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mCheckState:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->getCheckedItemPositions()Landroid/util/SparseBooleanArray;

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

    iget-object v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mAdapterWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$SimpleWrapper;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mAdapterWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$SimpleWrapper;

    invoke-virtual {v1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$SimpleWrapper;->getWrapped()Landroid/widget/ListAdapter;

    move-result-object v1

    instance-of v1, v1, Lcom/miui/gallery/adapter/BaseMediaAdapterDeprecated;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mAdapterWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$SimpleWrapper;

    invoke-virtual {v1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$SimpleWrapper;->getWrapped()Landroid/widget/ListAdapter;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/adapter/BaseMediaAdapterDeprecated;

    invoke-virtual {p0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->getCheckedItemOrderedPositions()[I

    move-result-object v2

    if-eqz v2, :cond_1

    array-length v3, v2

    if-lez v3, :cond_1

    const/4 v3, 0x0

    :goto_0
    array-length v4, v2

    if-ge v3, v4, :cond_1

    aget v4, v2, v3

    invoke-virtual {v1, v4}, Lcom/miui/gallery/adapter/BaseMediaAdapterDeprecated;->getCheckedItem(I)Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem;

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

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mCheckState:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->clear()V

    invoke-direct {p0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->updateActionMode()V

    return-void
.end method

.method public isAllItemsChecked()Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mCheckState:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->getCount()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mAdapterWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$SimpleWrapper;

    invoke-virtual {v1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$SimpleWrapper;->getCount()I

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

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mAdapterWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$SimpleWrapper;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mAdapterWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$SimpleWrapper;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$SimpleWrapper;->getWrapped()Landroid/widget/ListAdapter;

    move-result-object v0

    instance-of v0, v0, Lcom/miui/gallery/adapter/BaseMediaAdapterDeprecated;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mAdapterWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$SimpleWrapper;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$SimpleWrapper;->getWrapped()Landroid/widget/ListAdapter;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/adapter/BaseMediaAdapterDeprecated;

    invoke-virtual {p0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->getCheckedItemPositions()Landroid/util/SparseBooleanArray;

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

    invoke-virtual {v0, v4}, Lcom/miui/gallery/adapter/BaseMediaAdapterDeprecated;->getMimeType(I)Ljava/lang/String;

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

    iget-boolean v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mIsInActionMode:Z

    return v0
.end method

.method public isInChoiceMode()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mIsInChoiceMode:Z

    return v0
.end method

.method public setAdapter(Landroid/widget/ListAdapter;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mAdapterWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$SimpleWrapper;

    iget-object v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mAdapterWrappers:Landroid/util/ArrayMap;

    invoke-virtual {v1, p1}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$SimpleWrapper;

    iput-object v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mAdapterWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$SimpleWrapper;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mAdapterWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$SimpleWrapper;

    if-ne v0, v1, :cond_0

    const-string p1, "EditableListViewWrapperDeprecated"

    const-string v0, "setAdapter the same adapter"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mAdapterWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$SimpleWrapper;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mAdapterWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$SimpleWrapper;

    iget-object v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mRestoreCheckStateObserver:Landroid/database/DataSetObserver;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$SimpleWrapper;->unregisterDataSetObserver(Landroid/database/DataSetObserver;)V

    :cond_1
    new-instance v0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;-><init>(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$1;)V

    iput-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mCheckState:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;

    if-nez p1, :cond_2

    iput-object v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mAdapterWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$SimpleWrapper;

    iget-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mListView:Landroid/widget/AbsListView;

    invoke-virtual {p1, v1}, Landroid/widget/AbsListView;->setAdapter(Landroid/widget/ListAdapter;)V

    invoke-virtual {p0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->handleDataInvalid()V

    return-void

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mAdapterWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$SimpleWrapper;

    if-nez v0, :cond_5

    instance-of v0, p1, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapter;

    if-eqz v0, :cond_3

    new-instance v0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$TimeLineWrapper;

    move-object v1, p1

    check-cast v1, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapter;

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$TimeLineWrapper;-><init>(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapter;)V

    iput-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mAdapterWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$SimpleWrapper;

    goto :goto_0

    :cond_3
    instance-of v0, p1, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapter;

    if-eqz v0, :cond_4

    new-instance v0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$SimpleTimeLineWrapper;

    move-object v1, p1

    check-cast v1, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapter;

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$SimpleTimeLineWrapper;-><init>(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapter;)V

    iput-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mAdapterWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$SimpleWrapper;

    goto :goto_0

    :cond_4
    new-instance v0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$SimpleWrapper;

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$SimpleWrapper;-><init>(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;Landroid/widget/ListAdapter;)V

    iput-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mAdapterWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$SimpleWrapper;

    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mAdapterWrappers:Landroid/util/ArrayMap;

    iget-object v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mAdapterWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$SimpleWrapper;

    invoke-virtual {v0, p1, v1}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_5
    instance-of v0, p1, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapter;

    if-nez v0, :cond_6

    instance-of p1, p1, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapter;

    if-eqz p1, :cond_7

    :cond_6
    new-instance p1, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckStateWithGroup;

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mListView:Landroid/widget/AbsListView;

    iget-object v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mAnimationManager:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;

    invoke-direct {p1, v0, v1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckStateWithGroup;-><init>(Landroid/widget/AbsListView;Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;)V

    iput-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mCheckState:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;

    :cond_7
    iget-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mAdapterWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$SimpleWrapper;

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mRestoreCheckStateObserver:Landroid/database/DataSetObserver;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$SimpleWrapper;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    iget-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mListView:Landroid/widget/AbsListView;

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mAdapterWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$SimpleWrapper;

    invoke-virtual {p1, v0}, Landroid/widget/AbsListView;->setAdapter(Landroid/widget/ListAdapter;)V

    iget-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mCheckState:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mAdapterWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$SimpleWrapper;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->bind(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Source;)V

    invoke-direct {p0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->handleDataChanged()V

    return-void
.end method

.method public setAllItemsCheckState(Z)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mCheckState:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->setAllChecked(Z)V

    invoke-direct {p0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->updateOnScreenViewsState()V

    invoke-direct {p0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->updateActionMode()V

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mMultiChoiceModeCallback:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$MultiChoiceModeCallback;

    invoke-static {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$MultiChoiceModeCallback;->access$700(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$MultiChoiceModeCallback;)Lcom/miui/gallery/widget/editwrapper/MultiChoiceModeListener;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mChoiceActionMode:Landroid/view/ActionMode;

    invoke-interface {v0, v1, p1}, Lcom/miui/gallery/widget/editwrapper/MultiChoiceModeListener;->onAllItemsCheckedStateChanged(Landroid/view/ActionMode;Z)V

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mListView:Landroid/widget/AbsListView;

    instance-of v0, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mAnimationManager:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;

    iget-object v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mListView:Landroid/widget/AbsListView;

    check-cast v1, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    invoke-virtual {v0, v1, p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;->startScaleAllItemImageViewAnimation(Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;Z)V

    :cond_0
    return-void
.end method

.method public setChoiceMode(I)V
    .locals 1

    const/4 v0, 0x3

    if-ne v0, p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mListView:Landroid/widget/AbsListView;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/widget/AbsListView;->setLongClickable(Z)V

    iget-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mListView:Landroid/widget/AbsListView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/AbsListView;->setChoiceMode(I)V

    iget-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mListView:Landroid/widget/AbsListView;

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mEnterActionModeListener:Landroid/widget/AdapterView$OnItemLongClickListener;

    invoke-virtual {p1, v0}, Landroid/widget/AbsListView;->setOnItemLongClickListener(Landroid/widget/AdapterView$OnItemLongClickListener;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mListView:Landroid/widget/AbsListView;

    invoke-virtual {v0, p1}, Landroid/widget/AbsListView;->setChoiceMode(I)V

    :goto_0
    return-void
.end method

.method public setEmptyView(Landroid/view/View;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mListView:Landroid/widget/AbsListView;

    invoke-virtual {v0, p1}, Landroid/widget/AbsListView;->setEmptyView(Landroid/view/View;)V

    return-void
.end method

.method public setItemChecked(IZ)V
    .locals 2

    iget v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mListHeaderCount:I

    if-ge p1, v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mChoiceActionMode:Landroid/view/ActionMode;

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->startActionMode()V

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mCheckState:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;

    iget v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mListHeaderCount:I

    sub-int v1, p1, v1

    invoke-virtual {v0, v1, p2}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->setCheckState(IZ)V

    iget-object p2, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mListView:Landroid/widget/AbsListView;

    invoke-virtual {p2}, Landroid/widget/AbsListView;->getFirstVisiblePosition()I

    move-result p2

    if-le p1, p2, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mListView:Landroid/widget/AbsListView;

    invoke-virtual {v0}, Landroid/widget/AbsListView;->getChildCount()I

    move-result v0

    add-int/2addr v0, p2

    if-ge p1, v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mListView:Landroid/widget/AbsListView;

    sub-int/2addr p1, p2

    invoke-virtual {v0, p1}, Landroid/widget/AbsListView;->getChildAt(I)Landroid/view/View;

    move-result-object p1

    instance-of p2, p1, Lcom/miui/gallery/ui/Checkable;

    if-eqz p2, :cond_2

    check-cast p1, Lcom/miui/gallery/ui/Checkable;

    const/4 p2, 0x1

    invoke-interface {p1, p2}, Lcom/miui/gallery/ui/Checkable;->setChecked(Z)V

    :cond_2
    return-void
.end method

.method public setMultiChoiceModeListener(Lcom/miui/gallery/widget/editwrapper/MultiChoiceModeListener;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mMultiChoiceModeCallback:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$MultiChoiceModeCallback;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$MultiChoiceModeCallback;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$MultiChoiceModeCallback;-><init>(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$1;)V

    iput-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mMultiChoiceModeCallback:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$MultiChoiceModeCallback;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mMultiChoiceModeCallback:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$MultiChoiceModeCallback;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$MultiChoiceModeCallback;->setWrapped(Lcom/miui/gallery/widget/editwrapper/MultiChoiceModeListener;)V

    return-void
.end method

.method public setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V
    .locals 1

    iput-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mItemClickDelegate:Landroid/widget/AdapterView$OnItemClickListener;

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mListView:Landroid/widget/AbsListView;

    invoke-virtual {v0, p1}, Landroid/widget/AbsListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    return-void
.end method

.method public setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mScrollListener:Landroid/widget/AbsListView$OnScrollListener;

    return-void
.end method

.method public startActionMode()V
    .locals 3

    invoke-direct {p0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->checkMultiChoiceModeCallback()V

    iget-boolean v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mIsInChoiceMode:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mListView:Landroid/widget/AbsListView;

    iget-object v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mMultiChoiceModeCallback:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$MultiChoiceModeCallback;

    invoke-virtual {v0, v1}, Landroid/widget/AbsListView;->startActionMode(Landroid/view/ActionMode$Callback;)Landroid/view/ActionMode;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mChoiceActionMode:Landroid/view/ActionMode;

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mChoiceActionMode:Landroid/view/ActionMode;

    instance-of v0, v0, Lmiui/view/EditActionMode;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mChoiceActionMode:Landroid/view/ActionMode;

    check-cast v0, Lmiui/view/EditActionMode;

    iput-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mEditActionMode:Lmiui/view/EditActionMode;

    :cond_1
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mIsInChoiceMode:Z

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mMultiChoiceModeCallback:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$MultiChoiceModeCallback;

    invoke-static {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$MultiChoiceModeCallback;->access$700(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$MultiChoiceModeCallback;)Lcom/miui/gallery/widget/editwrapper/MultiChoiceModeListener;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mChoiceActionMode:Landroid/view/ActionMode;

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Lcom/miui/gallery/widget/editwrapper/MultiChoiceModeListener;->onAllItemsCheckedStateChanged(Landroid/view/ActionMode;Z)V

    return-void
.end method

.method public startChoiceMode()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->checkMultiChoiceModeCallback()V

    iget-boolean v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mIsInChoiceMode:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mIsInChoiceMode:Z

    invoke-direct {p0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->enterChoiceMode()V

    return-void
.end method

.method public stopActionMode()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mChoiceActionMode:Landroid/view/ActionMode;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->mChoiceActionMode:Landroid/view/ActionMode;

    invoke-virtual {v0}, Landroid/view/ActionMode;->finish()V

    :cond_0
    return-void
.end method
