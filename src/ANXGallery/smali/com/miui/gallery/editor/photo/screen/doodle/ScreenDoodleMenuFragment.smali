.class public Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;
.super Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseMenuFragment;
.source "ScreenDoodleMenuFragment.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseMenuFragment<",
        "Lcom/miui/gallery/editor/photo/screen/doodle/IScreenDoodleOperation;",
        ">;"
    }
.end annotation


# instance fields
.field private mColorPicker:Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;

.field private mDoodleData:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/common/model/DoodleData;",
            ">;"
        }
    .end annotation
.end field

.field private mIndicator:Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private mIndicatorCallback:Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator$Callback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator$Callback<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private mOnSeekBarChangeListener:Landroid/widget/SeekBar$OnSeekBarChangeListener;

.field private mPaintView:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodlePaintView;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseMenuFragment;-><init>()V

    new-instance v0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment$1;-><init>(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;->mOnSeekBarChangeListener:Landroid/widget/SeekBar$OnSeekBarChangeListener;

    new-instance v0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment$2;-><init>(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;->mIndicatorCallback:Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator$Callback;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;)Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;->mColorPicker:Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;->setColor(I)V

    return-void
.end method

.method public static synthetic lambda$onViewCreated$55(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleAdapter;Landroid/support/v7/widget/RecyclerView;Landroid/view/View;I)Z
    .locals 0

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;->mScreenOperation:Lcom/miui/gallery/editor/photo/screen/base/IScreenOperation;

    check-cast p2, Lcom/miui/gallery/editor/photo/screen/doodle/IScreenDoodleOperation;

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;->mDoodleData:Ljava/util/List;

    invoke-interface {p3, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/miui/gallery/editor/photo/core/common/model/DoodleData;

    invoke-interface {p2, p3, p4}, Lcom/miui/gallery/editor/photo/screen/doodle/IScreenDoodleOperation;->setDoodleData(Lcom/miui/gallery/editor/photo/core/common/model/DoodleData;I)V

    invoke-virtual {p1, p4}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleAdapter;->setSelection(I)V

    invoke-static {p4}, Lcom/miui/gallery/editor/photo/screen/stat/ScreenEditorStatUtils;->statDoodleMenuItemClick(I)V

    const/4 p1, 0x0

    return p1
.end method

.method public static synthetic lambda$onViewCreated$56(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;Landroid/view/View;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;->mPaintView:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodlePaintView;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodlePaintView;->transSize()V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;->mScreenOperation:Lcom/miui/gallery/editor/photo/screen/base/IScreenOperation;

    check-cast p1, Lcom/miui/gallery/editor/photo/screen/doodle/IScreenDoodleOperation;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;->mPaintView:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodlePaintView;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodlePaintView;->getPaintType()Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem$PaintType;

    move-result-object v0

    invoke-interface {p1, v0}, Lcom/miui/gallery/editor/photo/screen/doodle/IScreenDoodleOperation;->setPaintType(Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem$PaintType;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;->mPaintView:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodlePaintView;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodlePaintView;->getPaintType()Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem$PaintType;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem$PaintType;->name()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/screen/stat/ScreenEditorStatUtils;->statDoodleSizeClick(Ljava/lang/String;)V

    return-void
.end method

.method private setColor(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;->mScreenOperation:Lcom/miui/gallery/editor/photo/screen/base/IScreenOperation;

    check-cast v0, Lcom/miui/gallery/editor/photo/screen/doodle/IScreenDoodleOperation;

    invoke-interface {v0, p1}, Lcom/miui/gallery/editor/photo/screen/doodle/IScreenDoodleOperation;->setColor(I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;->mPaintView:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodlePaintView;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodlePaintView;->setPaintColor(I)V

    return-void
.end method


# virtual methods
.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    const p3, 0x7f0b012a

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 9

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseMenuFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    invoke-static {}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleManager;->getScreenDoodleData()Ljava/util/List;

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;->mDoodleData:Ljava/util/List;

    new-instance p2, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleAdapter;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;->mDoodleData:Ljava/util/List;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;->mScreenOperation:Lcom/miui/gallery/editor/photo/screen/base/IScreenOperation;

    check-cast v1, Lcom/miui/gallery/editor/photo/screen/doodle/IScreenDoodleOperation;

    invoke-interface {v1}, Lcom/miui/gallery/editor/photo/screen/doodle/IScreenDoodleOperation;->getCurrentMenuItemIndex()I

    move-result v1

    invoke-direct {p2, v0, v1}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleAdapter;-><init>(Ljava/util/List;I)V

    const v0, 0x7f090258

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView;

    new-instance v1, Lcom/miui/gallery/editor/photo/screen/doodle/-$$Lambda$ScreenDoodleMenuFragment$iW7XkxyV3hPxcIIvvw9Qo5i3Jmw;

    invoke-direct {v1, p0, p2}, Lcom/miui/gallery/editor/photo/screen/doodle/-$$Lambda$ScreenDoodleMenuFragment$iW7XkxyV3hPxcIIvvw9Qo5i3Jmw;-><init>(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleAdapter;)V

    invoke-virtual {p2, v1}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleAdapter;->setOnItemClickListener(Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView$OnItemClickListener;)V

    const v1, 0x7f0900e7

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodlePaintView;

    iput-object v1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;->mPaintView:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodlePaintView;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;->mPaintView:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodlePaintView;

    new-instance v2, Lcom/miui/gallery/editor/photo/screen/doodle/-$$Lambda$ScreenDoodleMenuFragment$bfHaOm2b_3Nal6h7Jx6kABy_-NQ;

    invoke-direct {v2, p0}, Lcom/miui/gallery/editor/photo/screen/doodle/-$$Lambda$ScreenDoodleMenuFragment$bfHaOm2b_3Nal6h7Jx6kABy_-NQ;-><init>(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;)V

    invoke-virtual {v1, v2}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodlePaintView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;->mPaintView:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodlePaintView;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;->mScreenOperation:Lcom/miui/gallery/editor/photo/screen/base/IScreenOperation;

    check-cast v2, Lcom/miui/gallery/editor/photo/screen/doodle/IScreenDoodleOperation;

    invoke-interface {v2}, Lcom/miui/gallery/editor/photo/screen/doodle/IScreenDoodleOperation;->getPaintType()Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem$PaintType;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodlePaintView;->setPaintType(Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem$PaintType;)V

    invoke-static {}, Lcom/miui/gallery/util/ScreenUtils;->getScreenWidth()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0603eb

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v2

    const/high16 v3, 0x40000000    # 2.0f

    mul-float v2, v2, v3

    sub-float/2addr v1, v2

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;->mDoodleData:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0603e9

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v3

    mul-float v2, v2, v3

    sub-float/2addr v1, v2

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;->mDoodleData:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    int-to-float v2, v2

    div-float/2addr v1, v2

    float-to-int v5, v1

    new-instance v1, Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView$BlankDivider;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object v2, v1

    invoke-direct/range {v2 .. v8}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView$BlankDivider;-><init>(IIIIII)V

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    invoke-virtual {v0, p2}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;->getActivity()Landroid/app/Activity;

    move-result-object p2

    const v0, 0x7f0b006b

    const/4 v1, 0x0

    invoke-static {p2, v0, v1}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    new-instance v0, Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f060330

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;->mIndicatorCallback:Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator$Callback;

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;->mOnSeekBarChangeListener:Landroid/widget/SeekBar$OnSeekBarChangeListener;

    invoke-direct {v0, p2, v1, v2, v3}, Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;-><init>(Landroid/view/View;ILcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator$Callback;Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;->mIndicator:Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;

    const v0, 0x7f0900a6

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;->mColorPicker:Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;->mColorPicker:Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;

    new-instance v0, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorGradientDrawable;

    sget-object v1, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;->COLORS:[I

    invoke-direct {v0, v1}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorGradientDrawable;-><init>([I)V

    invoke-virtual {p1, v0}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;->setProgressDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;->mColorPicker:Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;->mColorPicker:Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;->getMax()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    invoke-virtual {p1, v0}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;->setProgress(I)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;->mColorPicker:Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;->mColorPicker:Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;->getColor()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;->setThumbColor(I)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;->mColorPicker:Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;->getColor()I

    move-result p1

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;->setColor(I)V

    invoke-virtual {p2}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    check-cast p1, Landroid/graphics/drawable/GradientDrawable;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;->mColorPicker:Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;

    invoke-virtual {p2}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;->getColor()I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;->mColorPicker:Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;->mIndicator:Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    return-void
.end method
