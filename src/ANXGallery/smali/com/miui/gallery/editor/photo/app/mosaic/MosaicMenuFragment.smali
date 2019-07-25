.class public Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;
.super Lcom/miui/gallery/editor/photo/app/MenuFragment;
.source "MosaicMenuFragment.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/editor/photo/app/MenuFragment<",
        "Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractMosaicFragment;",
        "Lcom/miui/gallery/editor/photo/core/SdkProvider<",
        "Lcom/miui/gallery/editor/photo/core/common/model/MosaicData;",
        "Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractMosaicFragment;",
        ">;>;"
    }
.end annotation


# instance fields
.field private mEraserClickListener:Landroid/view/View$OnClickListener;

.field private mEraserData:Lcom/miui/gallery/editor/photo/core/common/model/MosaicData;

.field private mEraserView:Landroid/widget/ImageView;

.field private mEraserViewBg:Landroid/widget/ImageView;

.field private mMenuHeight:I

.field private mMosaicAdapter:Lcom/miui/gallery/editor/photo/app/mosaic/MosaicAdapter;

.field private mMosaicDataList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/common/model/MosaicData;",
            ">;"
        }
    .end annotation
.end field

.field private mOnItemClickListener:Lcom/miui/gallery/ui/SimpleRecyclerView$OnItemClickListener;

.field private mOnSeekBarChangeListener:Landroid/widget/SeekBar$OnSeekBarChangeListener;

.field private mOperationClickListener:Landroid/view/View$OnClickListener;

.field private mOperationPanel:Landroid/view/View;

.field private mOperationUpdateListener:Lcom/miui/gallery/editor/photo/app/OperationUpdateListener;

.field private mPaintPopupWindow:Lcom/miui/gallery/editor/photo/widgets/PaintSizePopupWindow;

.field private mRecyclerView:Lcom/miui/gallery/ui/SimpleRecyclerView;

.field private mRevert:Landroid/view/View;

.field private mRevoke:Landroid/view/View;

.field private mSeekBar:Landroid/widget/SeekBar;

.field private mTitleView:Landroid/widget/TextView;


# direct methods
.method public constructor <init>()V
    .locals 1

    sget-object v0, Lcom/miui/gallery/editor/photo/core/Effect;->MOSAIC:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/app/MenuFragment;-><init>(Lcom/miui/gallery/editor/photo/core/Effect;)V

    new-instance v0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment$1;-><init>(Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->mOnItemClickListener:Lcom/miui/gallery/ui/SimpleRecyclerView$OnItemClickListener;

    new-instance v0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment$2;-><init>(Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->mEraserClickListener:Landroid/view/View$OnClickListener;

    new-instance v0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment$3;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment$3;-><init>(Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->mOnSeekBarChangeListener:Landroid/widget/SeekBar$OnSeekBarChangeListener;

    new-instance v0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment$4;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment$4;-><init>(Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->mOperationUpdateListener:Lcom/miui/gallery/editor/photo/app/OperationUpdateListener;

    new-instance v0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment$5;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment$5;-><init>(Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->mOperationClickListener:Landroid/view/View$OnClickListener;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;)Landroid/widget/ImageView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->mEraserView:Landroid/widget/ImageView;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;)Landroid/widget/ImageView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->mEraserViewBg:Landroid/widget/ImageView;

    return-object p0
.end method

.method static synthetic access$1000(Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->refreshOperationPanel()V

    return-void
.end method

.method static synthetic access$1100(Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;)Lcom/miui/gallery/editor/photo/core/RenderFragment;
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->getRenderFragment()Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1200(Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;)Lcom/miui/gallery/editor/photo/core/RenderFragment;
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->getRenderFragment()Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->setSelection(I)V

    return-void
.end method

.method static synthetic access$300(Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;)Lcom/miui/gallery/editor/photo/app/mosaic/MosaicAdapter;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->mMosaicAdapter:Lcom/miui/gallery/editor/photo/app/mosaic/MosaicAdapter;

    return-object p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;)Lcom/miui/gallery/editor/photo/core/common/model/MosaicData;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->mEraserData:Lcom/miui/gallery/editor/photo/core/common/model/MosaicData;

    return-object p0
.end method

.method static synthetic access$500(Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;)Lcom/miui/gallery/editor/photo/core/RenderFragment;
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->getRenderFragment()Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$600(Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;)Lcom/miui/gallery/editor/photo/widgets/PaintSizePopupWindow;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->mPaintPopupWindow:Lcom/miui/gallery/editor/photo/widgets/PaintSizePopupWindow;

    return-object p0
.end method

.method static synthetic access$700(Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;)Lcom/miui/gallery/editor/photo/core/RenderFragment;
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->getRenderFragment()Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$800(Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;)Lcom/miui/gallery/ui/SimpleRecyclerView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->mRecyclerView:Lcom/miui/gallery/ui/SimpleRecyclerView;

    return-object p0
.end method

.method static synthetic access$900(Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->mMenuHeight:I

    return p0
.end method

.method private refreshOperationPanel()V
    .locals 5

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->getRenderFragment()Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractMosaicFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractMosaicFragment;->canRevoke()Z

    move-result v0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->getRenderFragment()Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractMosaicFragment;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractMosaicFragment;->canRevert()Z

    move-result v1

    const/4 v2, 0x0

    const/16 v3, 0x8

    if-nez v0, :cond_0

    if-nez v1, :cond_0

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->mTitleView:Landroid/widget/TextView;

    invoke-virtual {v4, v2}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->mOperationPanel:Landroid/view/View;

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    :cond_0
    iget-object v4, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->mTitleView:Landroid/widget/TextView;

    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->mOperationPanel:Landroid/view/View;

    invoke-virtual {v3, v2}, Landroid/view/View;->setVisibility(I)V

    :goto_0
    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->mRevoke:Landroid/view/View;

    invoke-virtual {v2, v0}, Landroid/view/View;->setEnabled(Z)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->mRevert:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    return-void
.end method

.method private setSelection(I)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->mMosaicAdapter:Lcom/miui/gallery/editor/photo/app/mosaic/MosaicAdapter;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicAdapter;->setSelection(I)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->getRenderFragment()Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractMosaicFragment;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->mMosaicDataList:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/editor/photo/core/common/model/MosaicData;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractMosaicFragment;->setMosaicData(Lcom/miui/gallery/editor/photo/core/common/model/MosaicData;)V

    return-void
.end method


# virtual methods
.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 0

    new-instance p1, Lcom/miui/gallery/editor/photo/app/menu/MosaicView;

    invoke-virtual {p2}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/miui/gallery/editor/photo/app/menu/MosaicView;-><init>(Landroid/content/Context;)V

    return-object p1
.end method

.method public onDestroy()V
    .locals 0

    invoke-super {p0}, Lcom/miui/gallery/editor/photo/app/MenuFragment;->onDestroy()V

    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 9

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/editor/photo/app/MenuFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    new-instance p2, Lcom/miui/gallery/editor/photo/widgets/PaintSizePopupWindow;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-direct {p2, v0}, Lcom/miui/gallery/editor/photo/widgets/PaintSizePopupWindow;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->mPaintPopupWindow:Lcom/miui/gallery/editor/photo/widgets/PaintSizePopupWindow;

    const p2, 0x7f090290

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/SeekBar;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->mSeekBar:Landroid/widget/SeekBar;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->mSeekBar:Landroid/widget/SeekBar;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->mOnSeekBarChangeListener:Landroid/widget/SeekBar$OnSeekBarChangeListener;

    invoke-virtual {p2, v0}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    new-instance p2, Ljava/util/ArrayList;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->mSdkProvider:Lcom/miui/gallery/editor/photo/core/SdkProvider;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/SdkProvider;->list()Ljava/util/List;

    move-result-object v0

    invoke-direct {p2, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->mMosaicDataList:Ljava/util/List;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->mMosaicDataList:Ljava/util/List;

    const/4 v0, 0x0

    invoke-interface {p2, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/editor/photo/core/common/model/MosaicData;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->mEraserData:Lcom/miui/gallery/editor/photo/core/common/model/MosaicData;

    const p2, 0x7f09022b

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/ui/SimpleRecyclerView;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->mRecyclerView:Lcom/miui/gallery/ui/SimpleRecyclerView;

    new-instance p2, Lcom/miui/gallery/editor/photo/widgets/recyclerview/ScrollControlLinearLayoutManager;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {p2, v1}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/ScrollControlLinearLayoutManager;-><init>(Landroid/content/Context;)V

    invoke-virtual {p2, v0}, Landroid/support/v7/widget/LinearLayoutManager;->setOrientation(I)V

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->mRecyclerView:Lcom/miui/gallery/ui/SimpleRecyclerView;

    invoke-virtual {v1, p2}, Lcom/miui/gallery/ui/SimpleRecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const v1, 0x7f0601af

    invoke-virtual {p2, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-virtual {p2, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v5

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->mRecyclerView:Lcom/miui/gallery/ui/SimpleRecyclerView;

    new-instance v1, Lcom/miui/gallery/ui/SimpleRecyclerView$BlankDivider;

    const/4 v3, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object v2, v1

    invoke-direct/range {v2 .. v8}, Lcom/miui/gallery/ui/SimpleRecyclerView$BlankDivider;-><init>(IIIIII)V

    invoke-virtual {p2, v1}, Lcom/miui/gallery/ui/SimpleRecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    new-instance p2, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicAdapter;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->mMosaicDataList:Ljava/util/List;

    invoke-direct {p2, v1, v2}, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicAdapter;-><init>(Landroid/content/Context;Ljava/util/List;)V

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->mMosaicAdapter:Lcom/miui/gallery/editor/photo/app/mosaic/MosaicAdapter;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->mRecyclerView:Lcom/miui/gallery/ui/SimpleRecyclerView;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->mMosaicAdapter:Lcom/miui/gallery/editor/photo/app/mosaic/MosaicAdapter;

    invoke-virtual {p2, v1}, Lcom/miui/gallery/ui/SimpleRecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->mRecyclerView:Lcom/miui/gallery/ui/SimpleRecyclerView;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/widgets/overscroll/HorizontalOverScrollBounceEffectDecorator;->setOverScrollEffect(Landroid/support/v7/widget/RecyclerView;)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->mMosaicAdapter:Lcom/miui/gallery/editor/photo/app/mosaic/MosaicAdapter;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->mOnItemClickListener:Lcom/miui/gallery/ui/SimpleRecyclerView$OnItemClickListener;

    invoke-virtual {p2, v1}, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicAdapter;->setOnItemClickListener(Lcom/miui/gallery/ui/SimpleRecyclerView$OnItemClickListener;)V

    const p2, 0x7f090103

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/ImageView;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->mEraserView:Landroid/widget/ImageView;

    const p2, 0x7f090104

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/ImageView;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->mEraserViewBg:Landroid/widget/ImageView;

    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object p2

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->mEraserData:Lcom/miui/gallery/editor/photo/core/common/model/MosaicData;

    iget-object v1, v1, Lcom/miui/gallery/editor/photo/core/common/model/MosaicData;->iconPath:Ljava/lang/String;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->mEraserView:Landroid/widget/ImageView;

    invoke-virtual {p2, v1, v2}, Lcom/nostra13/universalimageloader/core/ImageLoader;->displayImage(Ljava/lang/String;Landroid/widget/ImageView;)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->mEraserView:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->mEraserClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {p2, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const p2, 0x7f0902fa

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->mTitleView:Landroid/widget/TextView;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->mTitleView:Landroid/widget/TextView;

    const v1, 0x7f100531

    invoke-virtual {p2, v1}, Landroid/widget/TextView;->setText(I)V

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->setSelection(I)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->mSeekBar:Landroid/widget/SeekBar;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->mSeekBar:Landroid/widget/SeekBar;

    invoke-virtual {v0}, Landroid/widget/SeekBar;->getMax()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    invoke-virtual {p2, v0}, Landroid/widget/SeekBar;->setProgress(I)V

    const p2, 0x7f0901fd

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->mOperationPanel:Landroid/view/View;

    const p2, 0x7f0901ff

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->mRevoke:Landroid/view/View;

    const p2, 0x7f0901fe

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->mRevert:Landroid/view/View;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->mRevoke:Landroid/view/View;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->mOperationClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->mRevert:Landroid/view/View;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->mOperationClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->getRenderFragment()Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractMosaicFragment;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->mOperationUpdateListener:Lcom/miui/gallery/editor/photo/app/OperationUpdateListener;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractMosaicFragment;->setOperationUpdateListener(Lcom/miui/gallery/editor/photo/app/OperationUpdateListener;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f060339

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->mMenuHeight:I

    return-void
.end method
