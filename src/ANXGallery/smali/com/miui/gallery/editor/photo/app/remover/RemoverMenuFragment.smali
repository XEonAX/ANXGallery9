.class public Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;
.super Lcom/miui/gallery/editor/photo/app/MenuFragment;
.source "RemoverMenuFragment.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/editor/photo/app/MenuFragment<",
        "Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractRemoverFragment;",
        "Lcom/miui/gallery/editor/photo/core/SdkProvider<",
        "Lcom/miui/gallery/editor/photo/core/common/model/RemoverData;",
        "Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractRemoverFragment;",
        ">;>;"
    }
.end annotation


# instance fields
.field private mAdapter:Lcom/miui/gallery/editor/photo/app/remover/RemoverAdapter;

.field private mBottomMenuPanel:Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;

.field private mCurrentType:I

.field private mDataList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/common/model/RemoverData;",
            ">;"
        }
    .end annotation
.end field

.field private mIsNightMode:Z

.field private mOnItemClickListener:Lcom/miui/gallery/ui/SimpleRecyclerView$OnItemClickListener;

.field private mPaintSizePopupWindow:Lcom/miui/gallery/editor/photo/widgets/PaintSizePopupWindow;

.field private mProgressDialog:Lmiui/app/ProgressDialog;

.field private mRecyclerView:Lcom/miui/gallery/ui/SimpleRecyclerView;

.field private mSeekBar:Lcom/miui/gallery/editor/photo/widgets/seekbar/BasicSeekBar;


# direct methods
.method public constructor <init>()V
    .locals 1

    sget-object v0, Lcom/miui/gallery/editor/photo/core/Effect;->REMOVER:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/app/MenuFragment;-><init>(Lcom/miui/gallery/editor/photo/core/Effect;)V

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->mCurrentType:I

    new-instance v0, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment$3;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment$3;-><init>(Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->mOnItemClickListener:Lcom/miui/gallery/ui/SimpleRecyclerView$OnItemClickListener;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;I)I
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->getPaintSizeByProgress(I)I

    move-result p0

    return p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;)Lcom/miui/gallery/editor/photo/widgets/PaintSizePopupWindow;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->mPaintSizePopupWindow:Lcom/miui/gallery/editor/photo/widgets/PaintSizePopupWindow;

    return-object p0
.end method

.method static synthetic access$1000(Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;)Lcom/miui/gallery/editor/photo/core/RenderFragment;
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->getRenderFragment()Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;)Lcom/miui/gallery/editor/photo/core/RenderFragment;
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->getRenderFragment()Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;)Lcom/miui/gallery/ui/SimpleRecyclerView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->mRecyclerView:Lcom/miui/gallery/ui/SimpleRecyclerView;

    return-object p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->mIsNightMode:Z

    return p0
.end method

.method static synthetic access$500(Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;)Lcom/miui/gallery/editor/photo/app/remover/RemoverAdapter;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->mAdapter:Lcom/miui/gallery/editor/photo/app/remover/RemoverAdapter;

    return-object p0
.end method

.method static synthetic access$600(Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;)Ljava/util/List;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->mDataList:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$702(Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;I)I
    .locals 0

    iput p1, p0, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->mCurrentType:I

    return p1
.end method

.method static synthetic access$800(Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;)Lcom/miui/gallery/editor/photo/core/RenderFragment;
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->getRenderFragment()Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$900(Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;)Lcom/miui/gallery/editor/photo/widgets/seekbar/BasicSeekBar;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->mSeekBar:Lcom/miui/gallery/editor/photo/widgets/seekbar/BasicSeekBar;

    return-object p0
.end method

.method private getPaintSizeByProgress(I)I
    .locals 2

    iget v0, p0, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->mCurrentType:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    const/16 v0, 0x23

    const/16 v1, 0xa1

    goto :goto_0

    :cond_0
    const/16 v0, 0x14

    const/16 v1, 0x64

    :goto_0
    sub-int/2addr v1, v0

    mul-int v1, v1, p1

    int-to-float p1, v1

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->mSeekBar:Lcom/miui/gallery/editor/photo/widgets/seekbar/BasicSeekBar;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BasicSeekBar;->getMax()I

    move-result v1

    int-to-float v1, v1

    div-float/2addr p1, v1

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    add-int/2addr v0, p1

    return v0
.end method


# virtual methods
.method protected hideProcessDialog()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->mProgressDialog:Lmiui/app/ProgressDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->mProgressDialog:Lmiui/app/ProgressDialog;

    invoke-virtual {v0}, Lmiui/app/ProgressDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->mProgressDialog:Lmiui/app/ProgressDialog;

    invoke-virtual {v0}, Lmiui/app/ProgressDialog;->dismiss()V

    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/editor/photo/app/MenuFragment;->onCreate(Landroid/os/Bundle;)V

    new-instance p1, Ljava/util/ArrayList;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->mSdkProvider:Lcom/miui/gallery/editor/photo/core/SdkProvider;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/SdkProvider;->list()Ljava/util/List;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->mDataList:Ljava/util/List;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/utils/MiscUtils;->isNightMode(Landroid/content/Context;)Z

    move-result p1

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->mIsNightMode:Z

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 0

    new-instance p1, Lcom/miui/gallery/editor/photo/app/menu/RemoverView;

    invoke-virtual {p2}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/miui/gallery/editor/photo/app/menu/RemoverView;-><init>(Landroid/content/Context;)V

    return-object p1
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 8

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/editor/photo/app/MenuFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    const p2, 0x7f090258

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/ui/SimpleRecyclerView;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->mRecyclerView:Lcom/miui/gallery/ui/SimpleRecyclerView;

    new-instance p2, Lcom/miui/gallery/editor/photo/app/remover/RemoverAdapter;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->mDataList:Ljava/util/List;

    new-instance v1, Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Selector;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0500f8

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    invoke-direct {v1, v2}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Selector;-><init>(I)V

    invoke-direct {p2, v0, v1}, Lcom/miui/gallery/editor/photo/app/remover/RemoverAdapter;-><init>(Ljava/util/List;Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Selector;)V

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->mAdapter:Lcom/miui/gallery/editor/photo/app/remover/RemoverAdapter;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->mRecyclerView:Lcom/miui/gallery/ui/SimpleRecyclerView;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->mAdapter:Lcom/miui/gallery/editor/photo/app/remover/RemoverAdapter;

    invoke-virtual {p2, v0}, Lcom/miui/gallery/ui/SimpleRecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->mAdapter:Lcom/miui/gallery/editor/photo/app/remover/RemoverAdapter;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->mOnItemClickListener:Lcom/miui/gallery/ui/SimpleRecyclerView$OnItemClickListener;

    invoke-virtual {p2, v0}, Lcom/miui/gallery/editor/photo/app/remover/RemoverAdapter;->setOnItemClickListener(Lcom/miui/gallery/ui/SimpleRecyclerView$OnItemClickListener;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const v0, 0x7f0601c6

    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const v0, 0x7f0601c4

    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->mRecyclerView:Lcom/miui/gallery/ui/SimpleRecyclerView;

    new-instance v0, Lcom/miui/gallery/ui/SimpleRecyclerView$BlankDivider;

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v1, v0

    move v2, v3

    invoke-direct/range {v1 .. v7}, Lcom/miui/gallery/ui/SimpleRecyclerView$BlankDivider;-><init>(IIIIII)V

    invoke-virtual {p2, v0}, Lcom/miui/gallery/ui/SimpleRecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->mAdapter:Lcom/miui/gallery/editor/photo/app/remover/RemoverAdapter;

    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Lcom/miui/gallery/editor/photo/app/remover/RemoverAdapter;->setSelection(I)V

    new-instance p2, Lcom/miui/gallery/editor/photo/widgets/PaintSizePopupWindow;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {p2, v1}, Lcom/miui/gallery/editor/photo/widgets/PaintSizePopupWindow;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->mPaintSizePopupWindow:Lcom/miui/gallery/editor/photo/widgets/PaintSizePopupWindow;

    const p2, 0x7f090290

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/editor/photo/widgets/seekbar/BasicSeekBar;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->mSeekBar:Lcom/miui/gallery/editor/photo/widgets/seekbar/BasicSeekBar;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->mSeekBar:Lcom/miui/gallery/editor/photo/widgets/seekbar/BasicSeekBar;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->mSeekBar:Lcom/miui/gallery/editor/photo/widgets/seekbar/BasicSeekBar;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BasicSeekBar;->getMax()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    invoke-virtual {p2, v1}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BasicSeekBar;->setProgress(I)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->mSeekBar:Lcom/miui/gallery/editor/photo/widgets/seekbar/BasicSeekBar;

    new-instance v1, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment$1;

    invoke-direct {v1, p0}, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment$1;-><init>(Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;)V

    invoke-virtual {p2, v1}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BasicSeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->getRenderFragment()Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractRemoverFragment;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->mSeekBar:Lcom/miui/gallery/editor/photo/widgets/seekbar/BasicSeekBar;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BasicSeekBar;->getProgress()I

    move-result v1

    add-int/lit8 v1, v1, 0x23

    int-to-float v1, v1

    invoke-virtual {p2, v1}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractRemoverFragment;->setPaintSize(F)V

    const p2, 0x7f090066

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->mBottomMenuPanel:Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->mBottomMenuPanel:Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;

    const p2, 0x7f10053e

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;->setTitle(I)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->mBottomMenuPanel:Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;->getTitle()Landroid/widget/TextView;

    move-result-object p1

    const p2, 0x7f0700ff

    invoke-virtual {p1, v0, v0, p2, v0}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const v0, 0x7f0601c7

    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p2

    float-to-int p2, p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    new-instance p2, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment$2;

    invoke-direct {p2, p0}, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment$2;-><init>(Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;)V

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->getRenderFragment()Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractRemoverFragment;

    instance-of p2, p1, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;

    if-eqz p2, :cond_0

    check-cast p1, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->mBottomMenuPanel:Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;

    invoke-virtual {p2, p1}, Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;->setRenderRecordListener(Lcom/miui/gallery/editor/photo/app/RenderRecord;)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->mBottomMenuPanel:Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;->setMenuUpdateListener(Lcom/miui/gallery/editor/photo/widgets/MenuUpdateListener;)V

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->mBottomMenuPanel:Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;->updateBottomBar(Z)V

    return-void
.end method

.method protected showProcessDialog()V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const v1, 0x7f1005eb

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->genProgressDialog(Ljava/lang/String;)Lmiui/app/ProgressDialog;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->mProgressDialog:Lmiui/app/ProgressDialog;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->mProgressDialog:Lmiui/app/ProgressDialog;

    invoke-virtual {v0}, Lmiui/app/ProgressDialog;->show()V

    return-void
.end method
