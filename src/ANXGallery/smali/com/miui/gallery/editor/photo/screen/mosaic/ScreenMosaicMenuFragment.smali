.class public Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicMenuFragment;
.super Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseMenuFragment;
.source "ScreenMosaicMenuFragment.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseMenuFragment<",
        "Lcom/miui/gallery/editor/photo/screen/mosaic/IScreenMosaicOperation;",
        ">;"
    }
.end annotation


# instance fields
.field private mMenuHeight:I

.field private mMosaicAdapter:Lcom/miui/gallery/editor/photo/screen/mosaic/MosaicAdapter;

.field private mMosaicDataList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicData;",
            ">;"
        }
    .end annotation
.end field

.field private mOnItemClickListener:Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView$OnItemClickListener;

.field private mOnSeekBarChangeListener:Landroid/widget/SeekBar$OnSeekBarChangeListener;

.field private mPaintPopupWindow:Lcom/miui/gallery/editor/photo/widgets/PaintSizePopupWindow;

.field private mRecyclerView:Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;

.field private mSeekBar:Landroid/widget/SeekBar;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseMenuFragment;-><init>()V

    new-instance v0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicMenuFragment$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicMenuFragment$1;-><init>(Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicMenuFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicMenuFragment;->mOnSeekBarChangeListener:Landroid/widget/SeekBar$OnSeekBarChangeListener;

    new-instance v0, Lcom/miui/gallery/editor/photo/screen/mosaic/-$$Lambda$ScreenMosaicMenuFragment$4k1V4ADuF2Pr9And2Q20sPjxgG8;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/screen/mosaic/-$$Lambda$ScreenMosaicMenuFragment$4k1V4ADuF2Pr9And2Q20sPjxgG8;-><init>(Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicMenuFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicMenuFragment;->mOnItemClickListener:Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView$OnItemClickListener;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicMenuFragment;)Lcom/miui/gallery/editor/photo/widgets/PaintSizePopupWindow;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicMenuFragment;->mPaintPopupWindow:Lcom/miui/gallery/editor/photo/widgets/PaintSizePopupWindow;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicMenuFragment;)Lcom/miui/gallery/editor/photo/screen/base/IScreenOperation;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicMenuFragment;->mScreenOperation:Lcom/miui/gallery/editor/photo/screen/base/IScreenOperation;

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicMenuFragment;)Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicMenuFragment;->mRecyclerView:Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicMenuFragment;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicMenuFragment;->mMenuHeight:I

    return p0
.end method

.method public static synthetic lambda$new$76(Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicMenuFragment;Landroid/support/v7/widget/RecyclerView;Landroid/view/View;I)Z
    .locals 0

    invoke-static {p1, p3}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/ScrollControlLinearLayoutManager;->onItemClick(Landroid/support/v7/widget/RecyclerView;I)V

    invoke-direct {p0, p3}, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicMenuFragment;->setSelection(I)V

    invoke-static {p3}, Lcom/miui/gallery/editor/photo/screen/stat/ScreenEditorStatUtils;->statMosaicMenuItemClick(I)V

    const/4 p1, 0x1

    return p1
.end method

.method private setSelection(I)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicMenuFragment;->mMosaicAdapter:Lcom/miui/gallery/editor/photo/screen/mosaic/MosaicAdapter;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/screen/mosaic/MosaicAdapter;->setSelection(I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicMenuFragment;->mScreenOperation:Lcom/miui/gallery/editor/photo/screen/base/IScreenOperation;

    check-cast v0, Lcom/miui/gallery/editor/photo/screen/mosaic/IScreenMosaicOperation;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicMenuFragment;->mMosaicDataList:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicData;

    invoke-interface {v0, v1, p1}, Lcom/miui/gallery/editor/photo/screen/mosaic/IScreenMosaicOperation;->setMosaicData(Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicData;I)V

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseMenuFragment;->onCreate(Landroid/os/Bundle;)V

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    const p3, 0x7f0b0130

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 7

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseMenuFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    new-instance p2, Lcom/miui/gallery/editor/photo/widgets/PaintSizePopupWindow;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicMenuFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-direct {p2, v0}, Lcom/miui/gallery/editor/photo/widgets/PaintSizePopupWindow;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicMenuFragment;->mPaintPopupWindow:Lcom/miui/gallery/editor/photo/widgets/PaintSizePopupWindow;

    const p2, 0x7f090290

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/SeekBar;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicMenuFragment;->mSeekBar:Landroid/widget/SeekBar;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicMenuFragment;->mSeekBar:Landroid/widget/SeekBar;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicMenuFragment;->mSeekBar:Landroid/widget/SeekBar;

    invoke-virtual {v0}, Landroid/widget/SeekBar;->getMax()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    invoke-virtual {p2, v0}, Landroid/widget/SeekBar;->setProgress(I)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicMenuFragment;->mSeekBar:Landroid/widget/SeekBar;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicMenuFragment;->mOnSeekBarChangeListener:Landroid/widget/SeekBar$OnSeekBarChangeListener;

    invoke-virtual {p2, v0}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    sget-object p2, Lcom/miui/gallery/editor/photo/screen/core/ScreenProviderManager;->INSTANCE:Lcom/miui/gallery/editor/photo/screen/core/ScreenProviderManager;

    const-class v0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicProvider;

    invoke-virtual {p2, v0}, Lcom/miui/gallery/editor/photo/screen/core/ScreenProviderManager;->getProvider(Ljava/lang/Class;)Lcom/miui/gallery/editor/photo/screen/core/ScreenProvider;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicProvider;

    new-instance v0, Ljava/util/ArrayList;

    invoke-virtual {p2}, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicProvider;->list()Ljava/util/List;

    move-result-object p2

    invoke-direct {v0, p2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicMenuFragment;->mMosaicDataList:Ljava/util/List;

    const p2, 0x7f09022b

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicMenuFragment;->mRecyclerView:Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;

    new-instance p1, Lcom/miui/gallery/editor/photo/screen/mosaic/MosaicAdapter;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicMenuFragment;->getActivity()Landroid/app/Activity;

    move-result-object p2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicMenuFragment;->mMosaicDataList:Ljava/util/List;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicMenuFragment;->mScreenOperation:Lcom/miui/gallery/editor/photo/screen/base/IScreenOperation;

    check-cast v1, Lcom/miui/gallery/editor/photo/screen/mosaic/IScreenMosaicOperation;

    invoke-interface {v1}, Lcom/miui/gallery/editor/photo/screen/mosaic/IScreenMosaicOperation;->getCurrentMenuItemIndex()I

    move-result v1

    invoke-direct {p1, p2, v0, v1}, Lcom/miui/gallery/editor/photo/screen/mosaic/MosaicAdapter;-><init>(Landroid/content/Context;Ljava/util/List;I)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicMenuFragment;->mMosaicAdapter:Lcom/miui/gallery/editor/photo/screen/mosaic/MosaicAdapter;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicMenuFragment;->mRecyclerView:Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicMenuFragment;->mMosaicAdapter:Lcom/miui/gallery/editor/photo/screen/mosaic/MosaicAdapter;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicMenuFragment;->mMosaicAdapter:Lcom/miui/gallery/editor/photo/screen/mosaic/MosaicAdapter;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicMenuFragment;->mOnItemClickListener:Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView$OnItemClickListener;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/screen/mosaic/MosaicAdapter;->setOnItemClickListener(Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView$OnItemClickListener;)V

    invoke-static {}, Lcom/miui/gallery/util/ScreenUtils;->getScreenWidth()I

    move-result p1

    int-to-float p1, p1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicMenuFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const v0, 0x7f0603f5

    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p2

    const/high16 v0, 0x40000000    # 2.0f

    mul-float p2, p2, v0

    sub-float/2addr p1, p2

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicMenuFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const v0, 0x7f0603f4

    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicMenuFragment;->mMosaicAdapter:Lcom/miui/gallery/editor/photo/screen/mosaic/MosaicAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/screen/mosaic/MosaicAdapter;->getItemCount()I

    move-result v0

    int-to-float v0, v0

    mul-float p2, p2, v0

    sub-float/2addr p1, p2

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicMenuFragment;->mMosaicAdapter:Lcom/miui/gallery/editor/photo/screen/mosaic/MosaicAdapter;

    invoke-virtual {p2}, Lcom/miui/gallery/editor/photo/screen/mosaic/MosaicAdapter;->getItemCount()I

    move-result p2

    add-int/lit8 p2, p2, -0x1

    int-to-float p2, p2

    div-float/2addr p1, p2

    float-to-int v3, p1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicMenuFragment;->mRecyclerView:Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;

    new-instance p2, Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView$BlankDivider;

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v0, p2

    invoke-direct/range {v0 .. v6}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView$BlankDivider;-><init>(IIIIII)V

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicMenuFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f060339

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicMenuFragment;->mMenuHeight:I

    return-void
.end method
