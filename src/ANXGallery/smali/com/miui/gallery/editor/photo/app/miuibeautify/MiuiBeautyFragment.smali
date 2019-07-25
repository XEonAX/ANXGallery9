.class public Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;
.super Lcom/miui/gallery/editor/photo/app/MenuFragment;
.source "MiuiBeautyFragment.java"

# interfaces
.implements Lcom/miui/gallery/editor/photo/app/RenderRecord;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment$DetectFaceTask;,
        Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment$ChildFragmentData;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/editor/photo/app/MenuFragment<",
        "Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;",
        "Lcom/miui/gallery/editor/photo/core/SdkProvider<",
        "Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautifyData;",
        "Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;",
        ">;>;",
        "Lcom/miui/gallery/editor/photo/app/RenderRecord;"
    }
.end annotation


# static fields
.field public static BEAUTY_RECORDS_MAX:I = 0xa


# instance fields
.field private mAnimAppearDelay:I

.field private mAnimAppearDuration:I

.field private mAnimDisappearDuration:I

.field private mAnimOffset:I

.field private mAnimalLayout:Landroid/view/View;

.field private mBeautyParameters:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautifyData;",
            ">;"
        }
    .end annotation
.end field

.field private mBottomMenuPanel:Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;

.field private mChildMenuCallback:Lcom/miui/gallery/editor/photo/app/miuibeautify/ChildMenuFragment$Callbacks;

.field private mCurrentDataIndex:I

.field private mDetectFace:Z

.field private mDetectTaskDone:Z

.field private mFragmentData:[Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment$ChildFragmentData;

.field private mIcons:[I

.field private mInMainLayout:Z

.field private mOnItemClickListener:Lcom/miui/gallery/ui/SimpleRecyclerView$OnItemClickListener;

.field private mProgressDialog:Lmiui/app/ProgressDialog;

.field private mRecordCurr:I

.field private mRecordHead:I

.field private mRecordTail:I

.field private mTitle:Landroid/widget/TextView;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 7

    sget-object v0, Lcom/miui/gallery/editor/photo/core/Effect;->MIUIBEAUTIFY:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/app/MenuFragment;-><init>(Lcom/miui/gallery/editor/photo/core/Effect;)V

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mRecordHead:I

    iput v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mRecordCurr:I

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mInMainLayout:Z

    new-instance v2, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment$1;

    invoke-direct {v2, p0}, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment$1;-><init>(Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;)V

    iput-object v2, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mOnItemClickListener:Lcom/miui/gallery/ui/SimpleRecyclerView$OnItemClickListener;

    new-instance v2, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment$2;

    invoke-direct {v2, p0}, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment$2;-><init>(Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;)V

    iput-object v2, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mChildMenuCallback:Lcom/miui/gallery/editor/photo/app/miuibeautify/ChildMenuFragment$Callbacks;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mSdkProvider:Lcom/miui/gallery/editor/photo/core/SdkProvider;

    invoke-virtual {v2}, Lcom/miui/gallery/editor/photo/core/SdkProvider;->list()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    add-int/2addr v2, v1

    new-array v1, v2, [Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment$ChildFragmentData;

    iput-object v1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mFragmentData:[Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment$ChildFragmentData;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mFragmentData:[Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment$ChildFragmentData;

    new-instance v2, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment$ChildFragmentData;

    const-class v3, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyFragment;

    const/4 v4, 0x0

    invoke-direct {v2, v3, v4}, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment$ChildFragmentData;-><init>(Ljava/lang/Class;Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyEffect;)V

    aput-object v2, v1, v0

    invoke-static {}, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyManager;->getBeautyEffects()[Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyEffect;

    move-result-object v1

    :goto_0
    array-length v2, v1

    if-ge v0, v2, :cond_2

    aget-object v2, v1, v0

    iget-object v2, v2, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyEffect;->mBeautyType:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    sget-object v3, Lcom/miui/filtersdk/beauty/BeautyParameterType;->WHITEN_STRENGTH:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    if-ne v2, v3, :cond_0

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mFragmentData:[Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment$ChildFragmentData;

    add-int/lit8 v3, v0, 0x1

    new-instance v4, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment$ChildFragmentData;

    const-class v5, Lcom/miui/gallery/editor/photo/app/miuibeautify/DoubleParameterBeautyFragment;

    aget-object v6, v1, v0

    invoke-direct {v4, v5, v6}, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment$ChildFragmentData;-><init>(Ljava/lang/Class;Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyEffect;)V

    aput-object v4, v2, v3

    goto :goto_1

    :cond_0
    aget-object v2, v1, v0

    iget-object v2, v2, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyEffect;->mBeautyType:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    sget-object v3, Lcom/miui/filtersdk/beauty/BeautyParameterType;->DEBLEMISH:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    if-ne v2, v3, :cond_1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mFragmentData:[Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment$ChildFragmentData;

    add-int/lit8 v3, v0, 0x1

    new-instance v4, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment$ChildFragmentData;

    const-class v5, Lcom/miui/gallery/editor/photo/app/miuibeautify/SwitchParameterBeautyFragment;

    aget-object v6, v1, v0

    invoke-direct {v4, v5, v6}, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment$ChildFragmentData;-><init>(Ljava/lang/Class;Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyEffect;)V

    aput-object v4, v2, v3

    goto :goto_1

    :cond_1
    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mFragmentData:[Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment$ChildFragmentData;

    add-int/lit8 v3, v0, 0x1

    new-instance v4, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment$ChildFragmentData;

    const-class v5, Lcom/miui/gallery/editor/photo/app/miuibeautify/SingleParameterBeautyFragment;

    aget-object v6, v1, v0

    invoke-direct {v4, v5, v6}, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment$ChildFragmentData;-><init>(Ljava/lang/Class;Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyEffect;)V

    aput-object v4, v2, v3

    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;)[Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment$ChildFragmentData;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mFragmentData:[Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment$ChildFragmentData;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;)Lcom/miui/gallery/editor/photo/app/miuibeautify/ChildMenuFragment$Callbacks;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mChildMenuCallback:Lcom/miui/gallery/editor/photo/app/miuibeautify/ChildMenuFragment$Callbacks;

    return-object p0
.end method

.method static synthetic access$1000(Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;)Ljava/util/List;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mBeautyParameters:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$1100(Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;)Lcom/miui/gallery/editor/photo/core/RenderFragment;
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->getRenderFragment()Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1200(Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;)Landroid/widget/TextView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mTitle:Landroid/widget/TextView;

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->updateView(Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic access$300(Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;)Lcom/miui/gallery/editor/photo/core/RenderFragment;
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->getRenderFragment()Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mInMainLayout:Z

    return p0
.end method

.method static synthetic access$402(Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mInMainLayout:Z

    return p1
.end method

.method static synthetic access$500(Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mDetectTaskDone:Z

    return p0
.end method

.method static synthetic access$600(Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mDetectFace:Z

    return p0
.end method

.method static synthetic access$700(Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->showAnimal(Z)V

    return-void
.end method

.method static synthetic access$800(Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;)Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mBottomMenuPanel:Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;

    return-object p0
.end method

.method static synthetic access$900(Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mCurrentDataIndex:I

    return p0
.end method

.method static synthetic access$902(Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;I)I
    .locals 0

    iput p1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mCurrentDataIndex:I

    return p1
.end method

.method private backToMainMenu()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mBottomMenuPanel:Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mBottomMenuPanel:Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;->isShowTitle()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;->updateBottomBar(Z)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mInMainLayout:Z

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->getChildFragmentManager()Landroid/app/FragmentManager;

    move-result-object v1

    const v2, 0x7f090087

    invoke-virtual {v1, v2}, Landroid/app/FragmentManager;->findFragmentById(I)Landroid/app/Fragment;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->showAnimal(Z)V

    invoke-virtual {v1}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/app/FragmentTransaction;->remove(Landroid/app/Fragment;)Landroid/app/FragmentTransaction;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/FragmentTransaction;->commit()I

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mTitle:Landroid/widget/TextView;

    const v1, 0x7f100522

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    return-void
.end method

.method private hasChildFragment()Z
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->getChildFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    const v1, 0x7f090087

    invoke-virtual {v0, v1}, Landroid/app/FragmentManager;->findFragmentById(I)Landroid/app/Fragment;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private initAnimal()V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f060333

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mAnimOffset:I

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0a0034

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mAnimAppearDuration:I

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0a0035

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mAnimDisappearDuration:I

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0a0033

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mAnimAppearDelay:I

    return-void
.end method

.method private showAnimal(Z)V
    .locals 7

    new-instance v0, Landroid/animation/ObjectAnimator;

    invoke-direct {v0}, Landroid/animation/ObjectAnimator;-><init>()V

    const/4 v1, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x2

    if-eqz p1, :cond_0

    sget-object p1, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    new-array v5, v4, [F

    iget v6, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mAnimOffset:I

    neg-int v6, v6

    int-to-float v6, v6

    aput v6, v5, v3

    aput v1, v5, v2

    invoke-static {p1, v5}, Landroid/animation/PropertyValuesHolder;->ofFloat(Landroid/util/Property;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object p1

    sget-object v1, Landroid/view/View;->ALPHA:Landroid/util/Property;

    new-array v5, v4, [F

    fill-array-data v5, :array_0

    invoke-static {v1, v5}, Landroid/animation/PropertyValuesHolder;->ofFloat(Landroid/util/Property;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v1

    new-array v4, v4, [Landroid/animation/PropertyValuesHolder;

    aput-object p1, v4, v3

    aput-object v1, v4, v2

    invoke-virtual {v0, v4}, Landroid/animation/ObjectAnimator;->setValues([Landroid/animation/PropertyValuesHolder;)V

    iget p1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mAnimAppearDuration:I

    int-to-long v1, p1

    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    iget p1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mAnimAppearDelay:I

    int-to-long v1, p1

    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setStartDelay(J)V

    new-instance p1, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {p1}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    invoke-virtual {v0, p1}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    goto :goto_0

    :cond_0
    sget-object p1, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    new-array v5, v4, [F

    aput v1, v5, v3

    iget v1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mAnimOffset:I

    neg-int v1, v1

    int-to-float v1, v1

    aput v1, v5, v2

    invoke-static {p1, v5}, Landroid/animation/PropertyValuesHolder;->ofFloat(Landroid/util/Property;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object p1

    sget-object v1, Landroid/view/View;->ALPHA:Landroid/util/Property;

    new-array v5, v4, [F

    fill-array-data v5, :array_1

    invoke-static {v1, v5}, Landroid/animation/PropertyValuesHolder;->ofFloat(Landroid/util/Property;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v1

    new-array v4, v4, [Landroid/animation/PropertyValuesHolder;

    aput-object p1, v4, v3

    aput-object v1, v4, v2

    invoke-virtual {v0, v4}, Landroid/animation/ObjectAnimator;->setValues([Landroid/animation/PropertyValuesHolder;)V

    iget p1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mAnimDisappearDuration:I

    int-to-long v1, p1

    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    new-instance p1, Lmiui/view/animation/QuarticEaseOutInterpolator;

    invoke-direct {p1}, Lmiui/view/animation/QuarticEaseOutInterpolator;-><init>()V

    invoke-virtual {v0, p1}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mAnimalLayout:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/animation/ObjectAnimator;->setTarget(Ljava/lang/Object;)V

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    return-void

    nop

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method private updateView(Ljava/lang/Object;)V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->getView()Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/app/menu/MiuiBeautyView;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/app/menu/MiuiBeautyView;->updateGuideLine(Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public detectFaceNum()I
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->getPreview()Landroid/graphics/Bitmap;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    invoke-static {v0, v1, v2}, Lcom/miui/arcsoftbeauty/ArcsoftBeautyJni;->detectFaceNum(Landroid/graphics/Bitmap;II)I

    move-result v0

    return v0
.end method

.method protected hideProcessDialog()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mProgressDialog:Lmiui/app/ProgressDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mProgressDialog:Lmiui/app/ProgressDialog;

    invoke-virtual {v0}, Lmiui/app/ProgressDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mProgressDialog:Lmiui/app/ProgressDialog;

    invoke-virtual {v0}, Lmiui/app/ProgressDialog;->dismiss()V

    :cond_0
    return-void
.end method

.method public nextRecord()V
    .locals 6

    iget v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mRecordCurr:I

    const/4 v1, 0x1

    add-int/2addr v0, v1

    sget v2, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->BEAUTY_RECORDS_MAX:I

    rem-int/2addr v0, v2

    iput v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mRecordCurr:I

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->getRenderFragment()Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;

    instance-of v2, v0, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyRenderFragment;

    if-eqz v2, :cond_0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyRenderFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyRenderFragment;->nextRecord()V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mBottomMenuPanel:Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;

    iget v2, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mRecordCurr:I

    iget v3, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mRecordHead:I

    const/4 v4, 0x0

    if-eq v2, v3, :cond_1

    const/4 v2, 0x1

    goto :goto_0

    :cond_1
    const/4 v2, 0x0

    :goto_0
    iget v3, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mRecordCurr:I

    iget v5, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mRecordTail:I

    if-eq v3, v5, :cond_2

    goto :goto_1

    :cond_2
    const/4 v1, 0x0

    :goto_1
    invoke-virtual {v0, v2, v1}, Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;->onMenuUpdated(ZZ)V

    return-void
.end method

.method protected notifyDiscard()V
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->hasChildFragment()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->getRenderFragment()Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v1}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;->add(Lcom/miui/gallery/editor/photo/core/Metadata;Ljava/lang/Object;)V

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;->render()V

    instance-of v1, v0, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyRenderFragment;

    if-eqz v1, :cond_0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyRenderFragment;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyRenderFragment;->setCompareOrigin(Z)V

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyRenderFragment;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyRenderFragment;->enableComparison(Z)V

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->backToMainMenu()V

    goto :goto_0

    :cond_1
    invoke-super {p0}, Lcom/miui/gallery/editor/photo/app/MenuFragment;->notifyDiscard()V

    :goto_0
    return-void
.end method

.method protected notifySave()V
    .locals 6

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->hasChildFragment()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->getRenderFragment()Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;

    instance-of v1, v0, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyRenderFragment;

    if-eqz v1, :cond_1

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyRenderFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyRenderFragment;->isBeautyParamWorked()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyRenderFragment;->recordCurrent()V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->recordCurrent()V

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mBottomMenuPanel:Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;

    iget v2, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mRecordCurr:I

    iget v3, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mRecordHead:I

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-eq v2, v3, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    invoke-virtual {v1, v2, v4}, Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;->onMenuUpdated(ZZ)V

    invoke-virtual {v0, v5}, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyRenderFragment;->setCompareOrigin(Z)V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "name"

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mBeautyParameters:Ljava/util/List;

    iget v3, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mCurrentDataIndex:I

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautifyData;

    iget-object v2, v2, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautifyData;->name:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "_miuibeautify"

    const-string v2, "miui_beauty_item_save"

    invoke-static {v1, v2, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    :cond_1
    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->backToMainMenu()V

    goto :goto_1

    :cond_2
    invoke-super {p0}, Lcom/miui/gallery/editor/photo/app/MenuFragment;->notifySave()V

    :goto_1
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 4

    invoke-super {p0, p1}, Lcom/miui/gallery/editor/photo/app/MenuFragment;->onCreate(Landroid/os/Bundle;)V

    new-instance p1, Ljava/util/ArrayList;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mSdkProvider:Lcom/miui/gallery/editor/photo/core/SdkProvider;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/SdkProvider;->list()Ljava/util/List;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mBeautyParameters:Ljava/util/List;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mBeautyParameters:Ljava/util/List;

    new-instance v1, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyData;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const v3, 0x7f10052e

    invoke-virtual {v2, v3}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-direct {v1, v3, v2}, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyData;-><init>(SLjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mBeautyParameters:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    const/16 p1, 0xb

    new-array p1, p1, [I

    fill-array-data p1, :array_0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mIcons:[I

    return-void

    :array_0
    .array-data 4
        0x7f070199
        0x7f07017d
        0x7f070181
        0x7f070182
        0x7f07017c
        0x7f07017b
        0x7f07017a
        0x7f070179
        0x7f070180
        0x7f07017f
        0x7f07017e
    .end array-data
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 0

    new-instance p1, Lcom/miui/gallery/editor/photo/app/menu/MiuiBeautyView;

    invoke-virtual {p2}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/miui/gallery/editor/photo/app/menu/MiuiBeautyView;-><init>(Landroid/content/Context;)V

    return-object p1
.end method

.method public onDetach()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/editor/photo/app/MenuFragment;->onDetach()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mProgressDialog:Lmiui/app/ProgressDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mProgressDialog:Lmiui/app/ProgressDialog;

    invoke-virtual {v0}, Lmiui/app/ProgressDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mProgressDialog:Lmiui/app/ProgressDialog;

    invoke-virtual {v0}, Lmiui/app/ProgressDialog;->dismiss()V

    :cond_0
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 4

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/editor/photo/app/MenuFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    new-instance p2, Lcom/miui/gallery/editor/photo/app/miuibeautify/BeautyParameterAdapter;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mBeautyParameters:Ljava/util/List;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mIcons:[I

    invoke-direct {p2, v0, v1}, Lcom/miui/gallery/editor/photo/app/miuibeautify/BeautyParameterAdapter;-><init>(Ljava/util/List;[I)V

    const v0, 0x7f09020c

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/ui/SimpleRecyclerView;

    invoke-virtual {v0, p2}, Lcom/miui/gallery/ui/SimpleRecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mOnItemClickListener:Lcom/miui/gallery/ui/SimpleRecyclerView$OnItemClickListener;

    invoke-virtual {p2, v1}, Lcom/miui/gallery/editor/photo/app/miuibeautify/BeautyParameterAdapter;->setOnItemClickListener(Lcom/miui/gallery/ui/SimpleRecyclerView$OnItemClickListener;)V

    new-instance p2, Lcom/miui/gallery/ui/SimpleRecyclerView$BlankDivider;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const/4 v2, 0x0

    const v3, 0x7f06033e

    invoke-direct {p2, v1, v3, v2}, Lcom/miui/gallery/ui/SimpleRecyclerView$BlankDivider;-><init>(Landroid/content/res/Resources;II)V

    invoke-virtual {v0, p2}, Lcom/miui/gallery/ui/SimpleRecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/widgets/overscroll/HorizontalOverScrollBounceEffectDecorator;->setOverScrollEffect(Landroid/support/v7/widget/RecyclerView;)V

    const p2, 0x7f090066

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mBottomMenuPanel:Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mBottomMenuPanel:Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;

    const v0, 0x7f100522

    invoke-virtual {p2, v0}, Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;->setTitle(I)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mBottomMenuPanel:Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;

    invoke-virtual {p2, p0}, Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;->setRenderRecordListener(Lcom/miui/gallery/editor/photo/app/RenderRecord;)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mBottomMenuPanel:Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;

    const/4 v0, 0x1

    invoke-virtual {p2, v0}, Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;->updateBottomBar(Z)V

    const p2, 0x7f090198

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mAnimalLayout:Landroid/view/View;

    const p2, 0x7f0902fa

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mTitle:Landroid/widget/TextView;

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->initAnimal()V

    new-instance p1, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment$DetectFaceTask;

    invoke-direct {p1, p0}, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment$DetectFaceTask;-><init>(Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;)V

    new-array p2, v2, [Ljava/lang/Void;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment$DetectFaceTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public previousRecord()V
    .locals 6

    iget v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mRecordCurr:I

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    sget v2, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->BEAUTY_RECORDS_MAX:I

    rem-int/2addr v0, v2

    iput v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mRecordCurr:I

    iget v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mRecordCurr:I

    if-gez v0, :cond_0

    iget v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mRecordCurr:I

    add-int/lit8 v0, v0, 0xa

    iput v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mRecordCurr:I

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->getRenderFragment()Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;

    instance-of v2, v0, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyRenderFragment;

    if-eqz v2, :cond_1

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyRenderFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyRenderFragment;->previousRecord()V

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mBottomMenuPanel:Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;

    iget v2, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mRecordCurr:I

    iget v3, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mRecordHead:I

    const/4 v4, 0x0

    if-eq v2, v3, :cond_2

    const/4 v2, 0x1

    goto :goto_0

    :cond_2
    const/4 v2, 0x0

    :goto_0
    iget v3, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mRecordCurr:I

    iget v5, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mRecordTail:I

    if-eq v3, v5, :cond_3

    goto :goto_1

    :cond_3
    const/4 v1, 0x0

    :goto_1
    invoke-virtual {v0, v2, v1}, Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;->onMenuUpdated(ZZ)V

    return-void
.end method

.method public recordCurrent()V
    .locals 2

    iget v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mRecordCurr:I

    add-int/lit8 v0, v0, 0x1

    sget v1, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->BEAUTY_RECORDS_MAX:I

    rem-int/2addr v0, v1

    iput v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mRecordCurr:I

    iget v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mRecordCurr:I

    iput v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mRecordTail:I

    iget v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mRecordCurr:I

    iget v1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mRecordHead:I

    if-ne v0, v1, :cond_0

    iget v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mRecordCurr:I

    add-int/lit8 v0, v0, 0x1

    sget v1, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->BEAUTY_RECORDS_MAX:I

    rem-int/2addr v0, v1

    iput v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mRecordHead:I

    :cond_0
    return-void
.end method

.method public setDetectFace(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mDetectFace:Z

    return-void
.end method

.method public setDetectTaskDone(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mDetectTaskDone:Z

    return-void
.end method

.method protected showProcessDialog()V
    .locals 3

    new-instance v0, Lmiui/app/ProgressDialog;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lmiui/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mProgressDialog:Lmiui/app/ProgressDialog;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mProgressDialog:Lmiui/app/ProgressDialog;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const v2, 0x7f100540

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lmiui/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mProgressDialog:Lmiui/app/ProgressDialog;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lmiui/app/ProgressDialog;->setCanceledOnTouchOutside(Z)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mProgressDialog:Lmiui/app/ProgressDialog;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lmiui/app/ProgressDialog;->setIndeterminate(Z)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/MiuiBeautyFragment;->mProgressDialog:Lmiui/app/ProgressDialog;

    invoke-virtual {v0}, Lmiui/app/ProgressDialog;->show()V

    return-void
.end method
