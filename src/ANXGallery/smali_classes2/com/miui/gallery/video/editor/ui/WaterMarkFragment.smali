.class public Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;
.super Lcom/miui/gallery/video/editor/ui/MenuFragment;
.source "WaterMarkFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$MyTextItemSelectChangeListener;
    }
.end annotation


# instance fields
.field private final AUTO_TEXT_WATER_MARK_INDEX:I

.field private mAdapter:Lcom/miui/gallery/video/editor/adapter/WatermarkRecyclerViewAdapter;

.field private mAllActionButton:Landroid/widget/TextView;

.field private mAutoText:Landroid/widget/EditText;

.field private mDownloadingTextStyle:Lcom/miui/gallery/video/editor/TextStyle;

.field private mEndActionButton:Landroid/widget/TextView;

.field private mInputText:Ljava/lang/String;

.field private mIsKeyboardShowing:Z

.field private mIvCancel:Landroid/widget/ImageView;

.field private mIvOk:Landroid/widget/ImageView;

.field private mLastSelectedTextStyle:Lcom/miui/gallery/video/editor/TextStyle;

.field private mLinearLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

.field private mOnGlobalLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

.field private final mPopWindowEnterAnimTime:J

.field private mSavedSelectedWaterMarkIndex:I

.field private mSelectTimeLayout:Landroid/support/constraint/ConstraintLayout;

.field private mSelectedTextStyle:Lcom/miui/gallery/video/editor/TextStyle;

.field private mSelectedTextTime:I

.field private mSingleChoiceRecyclerView:Lcom/miui/gallery/video/editor/widget/SingleChoiceRecyclerView;

.field private mStartActionButton:Landroid/widget/TextView;

.field private mTextAppearAnimator:Landroid/animation/ObjectAnimator;

.field private mTextCancel:Landroid/widget/ImageView;

.field private mTextEditable:Z

.field private mTextPopWindow:Landroid/widget/PopupWindow;

.field private mTextRoot:Landroid/view/View;

.field private mTextSave:Landroid/widget/ImageView;

.field private mTextStyles:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/video/editor/TextStyle;",
            ">;"
        }
    .end annotation
.end field

.field private mTitleLayout:Landroid/support/constraint/ConstraintLayout;

.field private mVideoEditorResourceRequest:Lcom/miui/gallery/video/editor/net/VideoEditorResourceRequest;

.field private mWaterMarkManager:Lcom/miui/gallery/video/editor/manager/WaterMarkManager;


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/ui/MenuFragment;-><init>()V

    const-wide/16 v0, 0x118

    iput-wide v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mPopWindowEnterAnimTime:J

    const/4 v0, 0x1

    iput v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->AUTO_TEXT_WATER_MARK_INDEX:I

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mSelectedTextTime:I

    const-string v1, ""

    iput-object v1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mInputText:Ljava/lang/String;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mTextStyles:Ljava/util/ArrayList;

    iput-boolean v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mIsKeyboardShowing:Z

    iput-boolean v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mTextEditable:Z

    new-instance v0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$11;

    invoke-direct {v0, p0}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$11;-><init>(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mOnGlobalLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;Ljava/util/List;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->refreshData(Ljava/util/List;)V

    return-void
.end method

.method static synthetic access$1002(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;Lcom/miui/gallery/video/editor/TextStyle;)Lcom/miui/gallery/video/editor/TextStyle;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mLastSelectedTextStyle:Lcom/miui/gallery/video/editor/TextStyle;

    return-object p1
.end method

.method static synthetic access$1100(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;)Lcom/miui/gallery/video/editor/TextStyle;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mSelectedTextStyle:Lcom/miui/gallery/video/editor/TextStyle;

    return-object p0
.end method

.method static synthetic access$1102(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;Lcom/miui/gallery/video/editor/TextStyle;)Lcom/miui/gallery/video/editor/TextStyle;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mSelectedTextStyle:Lcom/miui/gallery/video/editor/TextStyle;

    return-object p1
.end method

.method static synthetic access$1200(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mSelectedTextTime:I

    return p0
.end method

.method static synthetic access$1300(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->updateSelectedItemPosition(I)V

    return-void
.end method

.method static synthetic access$1400(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->updateBottomBtnState()V

    return-void
.end method

.method static synthetic access$1502(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;Lcom/miui/gallery/video/editor/TextStyle;)Lcom/miui/gallery/video/editor/TextStyle;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mDownloadingTextStyle:Lcom/miui/gallery/video/editor/TextStyle;

    return-object p1
.end method

.method static synthetic access$1600(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mInputText:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$1700(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->updateEffectInfo()V

    return-void
.end method

.method static synthetic access$1800(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;)Z
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->applyPlay()Z

    move-result p0

    return p0
.end method

.method static synthetic access$1900(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->showEditPopWindow()V

    return-void
.end method

.method static synthetic access$200(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;)Ljava/util/ArrayList;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mTextStyles:Ljava/util/ArrayList;

    return-object p0
.end method

.method static synthetic access$2000(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->showSoftInput()V

    return-void
.end method

.method static synthetic access$2100(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;)Landroid/widget/EditText;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mAutoText:Landroid/widget/EditText;

    return-object p0
.end method

.method static synthetic access$2200(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;)Landroid/view/View;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mTextRoot:Landroid/view/View;

    return-object p0
.end method

.method static synthetic access$2300(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mIsKeyboardShowing:Z

    return p0
.end method

.method static synthetic access$2302(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mIsKeyboardShowing:Z

    return p1
.end method

.method static synthetic access$2400(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;)Landroid/animation/ObjectAnimator;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mTextAppearAnimator:Landroid/animation/ObjectAnimator;

    return-object p0
.end method

.method static synthetic access$2500(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->dismissTextPopWindow()V

    return-void
.end method

.method static synthetic access$300(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;)Lcom/miui/gallery/video/editor/adapter/WatermarkRecyclerViewAdapter;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mAdapter:Lcom/miui/gallery/video/editor/adapter/WatermarkRecyclerViewAdapter;

    return-object p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;)Lcom/miui/gallery/video/editor/manager/WaterMarkManager;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mWaterMarkManager:Lcom/miui/gallery/video/editor/manager/WaterMarkManager;

    return-object p0
.end method

.method static synthetic access$502(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;I)I
    .locals 0

    iput p1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mSavedSelectedWaterMarkIndex:I

    return p1
.end method

.method static synthetic access$600(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;)Z
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->hasOtherItemDownloading()Z

    move-result p0

    return p0
.end method

.method static synthetic access$700(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;)Lcom/miui/gallery/video/editor/widget/SingleChoiceRecyclerView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mSingleChoiceRecyclerView:Lcom/miui/gallery/video/editor/widget/SingleChoiceRecyclerView;

    return-object p0
.end method

.method static synthetic access$800(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->updateBottomBtnTitle(I)V

    return-void
.end method

.method static synthetic access$900(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mTextEditable:Z

    return p0
.end method

.method static synthetic access$902(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mTextEditable:Z

    return p1
.end method

.method private applyPlay()Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    new-instance v1, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$9;

    invoke-direct {v1, p0}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$9;-><init>(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/video/editor/VideoEditor;->apply(Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;)Z

    move-result v0

    return v0
.end method

.method private dismissTextPopWindow()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mTextPopWindow:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->dismiss()V

    return-void
.end method

.method private hasOtherItemDownloading()Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mTextStyles:Ljava/util/ArrayList;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mTextStyles:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mTextStyles:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/video/editor/TextStyle;

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/miui/gallery/video/editor/TextStyle;->isDownloading()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method private hideSoftInput()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mAutoText:Landroid/widget/EditText;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mAutoText:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mContext:Landroid/content/Context;

    const-string v1, "input_method"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mAutoText:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    :cond_1
    return-void
.end method

.method private initEditPopWindow()V
    .locals 4

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0b0184

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mTextRoot:Landroid/view/View;

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mTextRoot:Landroid/view/View;

    const v1, 0x7f090106

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mAutoText:Landroid/widget/EditText;

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mTextRoot:Landroid/view/View;

    const v1, 0x7f09032e

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mTextCancel:Landroid/widget/ImageView;

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mTextRoot:Landroid/view/View;

    const v1, 0x7f09032f

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mTextSave:Landroid/widget/ImageView;

    new-instance v0, Landroid/widget/PopupWindow;

    iget-object v1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mTextRoot:Landroid/view/View;

    const/4 v2, -0x1

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v2, v3}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;IIZ)V

    iput-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mTextPopWindow:Landroid/widget/PopupWindow;

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mTextPopWindow:Landroid/widget/PopupWindow;

    invoke-virtual {v0, v3}, Landroid/widget/PopupWindow;->setFocusable(Z)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mTextPopWindow:Landroid/widget/PopupWindow;

    invoke-virtual {v0, v3}, Landroid/widget/PopupWindow;->setOutsideTouchable(Z)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mTextPopWindow:Landroid/widget/PopupWindow;

    new-instance v1, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {v1}, Landroid/graphics/drawable/BitmapDrawable;-><init>()V

    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mTextPopWindow:Landroid/widget/PopupWindow;

    const/16 v1, 0x10

    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setSoftInputMode(I)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mTextCancel:Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mTextSave:Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private initEnterAnim()V
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mTextRoot:Landroid/view/View;

    if-nez v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Landroid/animation/ObjectAnimator;

    invoke-direct {v0}, Landroid/animation/ObjectAnimator;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mTextAppearAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f060564

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    sget-object v1, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    const/4 v2, 0x2

    new-array v3, v2, [F

    int-to-float v0, v0

    const/4 v4, 0x0

    aput v0, v3, v4

    const/4 v0, 0x0

    const/4 v5, 0x1

    aput v0, v3, v5

    invoke-static {v1, v3}, Landroid/animation/PropertyValuesHolder;->ofFloat(Landroid/util/Property;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v0

    sget-object v1, Landroid/view/View;->ALPHA:Landroid/util/Property;

    new-array v3, v2, [F

    fill-array-data v3, :array_0

    invoke-static {v1, v3}, Landroid/animation/PropertyValuesHolder;->ofFloat(Landroid/util/Property;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v1

    iget-object v3, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mTextAppearAnimator:Landroid/animation/ObjectAnimator;

    new-array v2, v2, [Landroid/animation/PropertyValuesHolder;

    aput-object v0, v2, v4

    aput-object v1, v2, v5

    invoke-virtual {v3, v2}, Landroid/animation/ObjectAnimator;->setValues([Landroid/animation/PropertyValuesHolder;)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mTextAppearAnimator:Landroid/animation/ObjectAnimator;

    new-instance v1, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mTextAppearAnimator:Landroid/animation/ObjectAnimator;

    const-wide/16 v1, 0x118

    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mTextAppearAnimator:Landroid/animation/ObjectAnimator;

    new-instance v1, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$7;

    invoke-direct {v1, p0}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$7;-><init>(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;)V

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mTextAppearAnimator:Landroid/animation/ObjectAnimator;

    iget-object v1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mTextRoot:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->setTarget(Ljava/lang/Object;)V

    return-void

    nop

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private initListener()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mStartActionButton:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mEndActionButton:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mAllActionButton:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mIvCancel:Landroid/widget/ImageView;

    new-instance v1, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$1;

    invoke-direct {v1, p0}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$1;-><init>(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mIvOk:Landroid/widget/ImageView;

    new-instance v1, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$2;

    invoke-direct {v1, p0}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$2;-><init>(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private initRecylerView(Landroid/view/View;)V
    .locals 4

    const v0, 0x7f090258

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/video/editor/widget/SingleChoiceRecyclerView;

    iput-object p1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mSingleChoiceRecyclerView:Lcom/miui/gallery/video/editor/widget/SingleChoiceRecyclerView;

    new-instance p1, Lcom/miui/gallery/editor/photo/widgets/recyclerview/ScrollControlLinearLayoutManager;

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    invoke-direct {p1, v0, v1, v1}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/ScrollControlLinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    iput-object p1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mLinearLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mSingleChoiceRecyclerView:Lcom/miui/gallery/video/editor/widget/SingleChoiceRecyclerView;

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mLinearLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/video/editor/widget/SingleChoiceRecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    new-instance p1, Lcom/miui/gallery/video/editor/adapter/WatermarkRecyclerViewAdapter;

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mTextStyles:Ljava/util/ArrayList;

    invoke-direct {p1, v0, v2}, Lcom/miui/gallery/video/editor/adapter/WatermarkRecyclerViewAdapter;-><init>(Landroid/content/Context;Ljava/util/List;)V

    iput-object p1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mAdapter:Lcom/miui/gallery/video/editor/adapter/WatermarkRecyclerViewAdapter;

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mAdapter:Lcom/miui/gallery/video/editor/adapter/WatermarkRecyclerViewAdapter;

    new-instance v0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$MyTextItemSelectChangeListener;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v2}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$MyTextItemSelectChangeListener;-><init>(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$1;)V

    invoke-virtual {p1, v0}, Lcom/miui/gallery/video/editor/adapter/WatermarkRecyclerViewAdapter;->setItemSelectChangeListener(Lcom/miui/gallery/video/editor/widget/SingleChoiceRecyclerView$SingleChoiceRecyclerViewAdapter$ItemSelectChangeListener;)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mSingleChoiceRecyclerView:Lcom/miui/gallery/video/editor/widget/SingleChoiceRecyclerView;

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mAdapter:Lcom/miui/gallery/video/editor/adapter/WatermarkRecyclerViewAdapter;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/video/editor/widget/SingleChoiceRecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mSingleChoiceRecyclerView:Lcom/miui/gallery/video/editor/widget/SingleChoiceRecyclerView;

    new-instance v0, Lcom/miui/gallery/video/editor/ui/SimpleRecyclerView$BlankDivider;

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f06021a

    invoke-direct {v0, v2, v3, v1}, Lcom/miui/gallery/video/editor/ui/SimpleRecyclerView$BlankDivider;-><init>(Landroid/content/res/Resources;II)V

    invoke-virtual {p1, v0}, Lcom/miui/gallery/video/editor/widget/SingleChoiceRecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mSingleChoiceRecyclerView:Lcom/miui/gallery/video/editor/widget/SingleChoiceRecyclerView;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/widgets/overscroll/HorizontalOverScrollBounceEffectDecorator;->setOverScrollEffect(Landroid/support/v7/widget/RecyclerView;)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mAdapter:Lcom/miui/gallery/video/editor/adapter/WatermarkRecyclerViewAdapter;

    iget v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mSavedSelectedWaterMarkIndex:I

    invoke-virtual {p1, v0}, Lcom/miui/gallery/video/editor/adapter/WatermarkRecyclerViewAdapter;->setSelectedItemPosition(I)V

    iget p1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mSavedSelectedWaterMarkIndex:I

    invoke-direct {p0, p1}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->updateBottomBtnTitle(I)V

    return-void
.end method

.method private refreshData(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/video/editor/model/VideoEditorBaseLocalResource;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mModuleFactory:Lcom/miui/gallery/video/editor/factory/VideoEditorModuleFactory;

    iget-object v1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mContext:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/video/editor/factory/VideoEditorModuleFactory;->getLocalTemplateEntities(Landroid/content/Context;)Ljava/util/List;

    move-result-object v0

    if-eqz p1, :cond_0

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    :cond_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result p1

    if-lez p1, :cond_1

    new-instance p1, Lcom/miui/gallery/video/editor/model/LocalResource;

    const v1, 0x7f07032d

    const-string v2, "ve_type_local"

    invoke-direct {p1, v1, v2}, Lcom/miui/gallery/video/editor/model/LocalResource;-><init>(ILjava/lang/String;)V

    const/4 v1, 0x1

    invoke-interface {v0, v1, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    :cond_1
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v0}, Lcom/miui/gallery/video/editor/manager/VideoEditorDataManager;->loadWaterMarks(Ljava/util/List;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    invoke-static {}, Lcom/miui/gallery/video/editor/manager/NexAssetTemplateManager;->getInstance()Lcom/miui/gallery/video/editor/manager/NexAssetTemplateManager;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$4;

    invoke-direct {v1, p0, p1}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$4;-><init>(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;Ljava/util/ArrayList;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/video/editor/manager/NexAssetTemplateManager;->loadWaterMarkTemplateList(Lcom/miui/gallery/video/editor/manager/NexAssetTemplateManager$ILoadWaterMarkListener;)V

    return-void
.end method

.method private showEditPopWindow()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mTextRoot:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mOnGlobalLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mTextPopWindow:Landroid/widget/PopupWindow;

    iget-object v1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mSingleChoiceRecyclerView:Lcom/miui/gallery/video/editor/widget/SingleChoiceRecyclerView;

    const/4 v2, 0x0

    const/16 v3, 0x33

    invoke-virtual {v0, v1, v3, v2, v2}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mTextRoot:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    return-void
.end method

.method private showSoftInput()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mAutoText:Landroid/widget/EditText;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mAutoText:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->requestFocus()Z

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mAutoText:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->requestFocusFromTouch()Z

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mAutoText:Landroid/widget/EditText;

    new-instance v1, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$8;

    invoke-direct {v1, p0}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$8;-><init>(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method private updateBottomBtnState()V
    .locals 4

    iget v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mSelectedTextTime:I

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mStartActionButton:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setSelected(Z)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mEndActionButton:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setSelected(Z)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mAllActionButton:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setSelected(Z)V

    goto :goto_0

    :cond_0
    iget v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mSelectedTextTime:I

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mStartActionButton:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setSelected(Z)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mEndActionButton:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setSelected(Z)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mAllActionButton:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setSelected(Z)V

    goto :goto_0

    :cond_1
    iget v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mSelectedTextTime:I

    const/4 v3, 0x2

    if-ne v0, v3, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mStartActionButton:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setSelected(Z)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mEndActionButton:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setSelected(Z)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mAllActionButton:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setSelected(Z)V

    :cond_2
    :goto_0
    return-void
.end method

.method private updateBottomBtnTitle(I)V
    .locals 4

    const/4 v0, 0x0

    if-nez p1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mAllActionButton:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->isSelected()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mAllActionButton:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setSelected(Z)V

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mSelectTimeLayout:Landroid/support/constraint/ConstraintLayout;

    const/16 v2, 0x8

    if-nez p1, :cond_1

    const/16 v3, 0x8

    goto :goto_0

    :cond_1
    const/4 v3, 0x0

    :goto_0
    invoke-virtual {v1, v3}, Landroid/support/constraint/ConstraintLayout;->setVisibility(I)V

    iget-object v1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mTitleLayout:Landroid/support/constraint/ConstraintLayout;

    if-nez p1, :cond_2

    goto :goto_1

    :cond_2
    const/16 v0, 0x8

    :goto_1
    invoke-virtual {v1, v0}, Landroid/support/constraint/ConstraintLayout;->setVisibility(I)V

    return-void
.end method

.method private updateEffectInfo()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mSelectedTextStyle:Lcom/miui/gallery/video/editor/TextStyle;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mSelectedTextStyle:Lcom/miui/gallery/video/editor/TextStyle;

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/TextStyle;->isLocal()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mInputText:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->updateWithInputNoText()V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    iget v1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mSelectedTextTime:I

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/video/editor/VideoEditor;->setWarterMark(ILjava/lang/String;)Z

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    iget-object v1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mInputText:Ljava/lang/String;

    iget v2, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mSelectedTextTime:I

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/video/editor/VideoEditor;->setAutoWaterMark(Ljava/lang/String;I)Z

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mTextStyles:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mSelectedTextStyle:Lcom/miui/gallery/video/editor/TextStyle;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    invoke-direct {p0, v0}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->updateSelectedItemPosition(I)V

    invoke-direct {p0, v0}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->updateBottomBtnTitle(I)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mTextEditable:Z

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mSelectedTextStyle:Lcom/miui/gallery/video/editor/TextStyle;

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/TextStyle;->isNone()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    const-string v1, ""

    iget v2, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mSelectedTextTime:I

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/video/editor/VideoEditor;->setAutoWaterMark(Ljava/lang/String;I)Z

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    iget v1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mSelectedTextTime:I

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/video/editor/VideoEditor;->setWarterMark(ILjava/lang/String;)Z

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mSelectedTextStyle:Lcom/miui/gallery/video/editor/TextStyle;

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/TextStyle;->isExtra()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mSelectedTextStyle:Lcom/miui/gallery/video/editor/TextStyle;

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/TextStyle;->isDownloaded()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    iget v1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mSelectedTextTime:I

    iget-object v2, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mSelectedTextStyle:Lcom/miui/gallery/video/editor/TextStyle;

    invoke-virtual {v2}, Lcom/miui/gallery/video/editor/TextStyle;->getTemplateId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/video/editor/VideoEditor;->setWarterMark(ILjava/lang/String;)Z

    :cond_3
    :goto_0
    return-void
.end method

.method private updateSelectedItemPosition(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mAdapter:Lcom/miui/gallery/video/editor/adapter/WatermarkRecyclerViewAdapter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mAdapter:Lcom/miui/gallery/video/editor/adapter/WatermarkRecyclerViewAdapter;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/video/editor/adapter/WatermarkRecyclerViewAdapter;->setSelectedItemPosition(I)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mAdapter:Lcom/miui/gallery/video/editor/adapter/WatermarkRecyclerViewAdapter;

    invoke-virtual {p1}, Lcom/miui/gallery/video/editor/adapter/WatermarkRecyclerViewAdapter;->clearLastSelectedPostion()V

    :cond_0
    return-void
.end method

.method private updateWithInputNoText()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mAdapter:Lcom/miui/gallery/video/editor/adapter/WatermarkRecyclerViewAdapter;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mAdapter:Lcom/miui/gallery/video/editor/adapter/WatermarkRecyclerViewAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/adapter/WatermarkRecyclerViewAdapter;->getSelectedItemPosition()I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mLastSelectedTextStyle:Lcom/miui/gallery/video/editor/TextStyle;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mLastSelectedTextStyle:Lcom/miui/gallery/video/editor/TextStyle;

    invoke-virtual {v1}, Lcom/miui/gallery/video/editor/TextStyle;->isLocal()Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mLastSelectedTextStyle:Lcom/miui/gallery/video/editor/TextStyle;

    iput-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mSelectedTextStyle:Lcom/miui/gallery/video/editor/TextStyle;

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mTextStyles:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mSelectedTextStyle:Lcom/miui/gallery/video/editor/TextStyle;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    invoke-direct {p0, v0}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->updateSelectedItemPosition(I)V

    invoke-direct {p0, v0}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->updateBottomBtnTitle(I)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    const-string v1, ""

    iget v2, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mSelectedTextTime:I

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/video/editor/VideoEditor;->setAutoWaterMark(Ljava/lang/String;I)Z

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    iget v1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mSelectedTextTime:I

    iget-object v2, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mSelectedTextStyle:Lcom/miui/gallery/video/editor/TextStyle;

    invoke-virtual {v2}, Lcom/miui/gallery/video/editor/TextStyle;->getTemplateId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/video/editor/VideoEditor;->setWarterMark(ILjava/lang/String;)Z

    return-void

    :cond_2
    :goto_0
    invoke-direct {p0, v0}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->updateSelectedItemPosition(I)V

    invoke-direct {p0, v0}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->updateBottomBtnTitle(I)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    const-string v1, ""

    iget v2, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mSelectedTextTime:I

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/video/editor/VideoEditor;->setAutoWaterMark(Ljava/lang/String;I)Z

    return-void
.end method


# virtual methods
.method public doApply()Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    if-nez v0, :cond_0

    const-string v0, "WaterMarkFragment"

    const-string v1, "doApply: videoEditor is null."

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    return v0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    new-instance v1, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$5;

    invoke-direct {v1, p0}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$5;-><init>(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/video/editor/VideoEditor;->apply(Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;)Z

    move-result v0

    return v0
.end method

.method public doCancel()Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    if-nez v0, :cond_0

    const-string v0, "WaterMarkFragment"

    const-string v1, "doCancel: videoEditor is null."

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    return v0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/VideoEditor;->restoreEditState()V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mVideoEditor:Lcom/miui/gallery/video/editor/VideoEditor;

    new-instance v1, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$6;

    invoke-direct {v1, p0}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$6;-><init>(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/video/editor/VideoEditor;->apply(Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;)Z

    move-result v0

    return v0
.end method

.method public getCurrentEffect()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mAdapter:Lcom/miui/gallery/video/editor/adapter/WatermarkRecyclerViewAdapter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mAdapter:Lcom/miui/gallery/video/editor/adapter/WatermarkRecyclerViewAdapter;

    iget-object v1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mAdapter:Lcom/miui/gallery/video/editor/adapter/WatermarkRecyclerViewAdapter;

    invoke-virtual {v1}, Lcom/miui/gallery/video/editor/adapter/WatermarkRecyclerViewAdapter;->getSelectedItemPosition()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/video/editor/adapter/WatermarkRecyclerViewAdapter;->getTextStyle(I)Lcom/miui/gallery/video/editor/TextStyle;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/TextStyle;->getLabel()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public getEffectId()I
    .locals 1

    const v0, 0x7f090341

    return v0
.end method

.method public loadResourceData()V
    .locals 3

    new-instance v0, Lcom/miui/gallery/video/editor/factory/WaterMartFactory;

    invoke-direct {v0}, Lcom/miui/gallery/video/editor/factory/WaterMartFactory;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mModuleFactory:Lcom/miui/gallery/video/editor/factory/VideoEditorModuleFactory;

    new-instance v0, Lcom/miui/gallery/video/editor/net/VideoEditorResourceRequest;

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->getEffectId()I

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mModuleFactory:Lcom/miui/gallery/video/editor/factory/VideoEditorModuleFactory;

    invoke-direct {v0, v1, v2}, Lcom/miui/gallery/video/editor/net/VideoEditorResourceRequest;-><init>(ILcom/miui/gallery/video/editor/factory/VideoEditorModuleFactory;)V

    iput-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mVideoEditorResourceRequest:Lcom/miui/gallery/video/editor/net/VideoEditorResourceRequest;

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mVideoEditorResourceRequest:Lcom/miui/gallery/video/editor/net/VideoEditorResourceRequest;

    new-instance v1, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$3;

    invoke-direct {v1, p0}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$3;-><init>(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/video/editor/net/VideoEditorResourceRequest;->execute(Lcom/miui/gallery/net/base/ResponseListener;)V

    return-void
.end method

.method public notifyDateSetChanged(I)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mAdapter:Lcom/miui/gallery/video/editor/adapter/WatermarkRecyclerViewAdapter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mAdapter:Lcom/miui/gallery/video/editor/adapter/WatermarkRecyclerViewAdapter;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lcom/miui/gallery/video/editor/adapter/WatermarkRecyclerViewAdapter;->notifyItemChanged(ILjava/lang/Object;)V

    :cond_0
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const/4 v1, 0x0

    const v2, 0x7f09033c

    if-ne v0, v2, :cond_0

    iput v1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mSelectedTextTime:I

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->updateBottomBtnState()V

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->updateEffectInfo()V

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const v2, 0x7f09033a

    if-ne v0, v2, :cond_1

    const/4 p1, 0x1

    iput p1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mSelectedTextTime:I

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->updateBottomBtnState()V

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->updateEffectInfo()V

    goto :goto_0

    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const v2, 0x7f090339

    if-ne v0, v2, :cond_2

    const/4 p1, 0x2

    iput p1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mSelectedTextTime:I

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->updateBottomBtnState()V

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->updateEffectInfo()V

    goto :goto_0

    :cond_2
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const v2, 0x7f09032f

    if-ne v0, v2, :cond_3

    iput-boolean v1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mIsKeyboardShowing:Z

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mAutoText:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mInputText:Ljava/lang/String;

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->updateEffectInfo()V

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->hideSoftInput()V

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->dismissTextPopWindow()V

    goto :goto_0

    :cond_3
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    const v0, 0x7f09032e

    if-ne p1, v0, :cond_4

    iput-boolean v1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mIsKeyboardShowing:Z

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->updateEffectInfo()V

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->hideSoftInput()V

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->dismissTextPopWindow()V

    :cond_4
    :goto_0
    invoke-direct {p0}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->applyPlay()Z

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/video/editor/ui/MenuFragment;->onCreate(Landroid/os/Bundle;)V

    new-instance p1, Lcom/miui/gallery/video/editor/manager/WaterMarkManager;

    invoke-direct {p1}, Lcom/miui/gallery/video/editor/manager/WaterMarkManager;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mWaterMarkManager:Lcom/miui/gallery/video/editor/manager/WaterMarkManager;

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->loadResourceData()V

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 0

    new-instance p1, Lcom/miui/gallery/video/editor/ui/menu/WaterMarkView;

    invoke-virtual {p2}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/miui/gallery/video/editor/ui/menu/WaterMarkView;-><init>(Landroid/content/Context;)V

    return-object p1
.end method

.method public onDestroyView()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mDownloadingTextStyle:Lcom/miui/gallery/video/editor/TextStyle;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mDownloadingTextStyle:Lcom/miui/gallery/video/editor/TextStyle;

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/TextStyle;->isDownloading()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mDownloadingTextStyle:Lcom/miui/gallery/video/editor/TextStyle;

    const/16 v1, 0x14

    invoke-virtual {v0, v1}, Lcom/miui/gallery/video/editor/TextStyle;->setDownloadState(I)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mAdapter:Lcom/miui/gallery/video/editor/adapter/WatermarkRecyclerViewAdapter;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mAdapter:Lcom/miui/gallery/video/editor/adapter/WatermarkRecyclerViewAdapter;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/video/editor/adapter/WatermarkRecyclerViewAdapter;->setItemSelectChangeListener(Lcom/miui/gallery/video/editor/widget/SingleChoiceRecyclerView$SingleChoiceRecyclerViewAdapter$ItemSelectChangeListener;)V

    iput-object v1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mAdapter:Lcom/miui/gallery/video/editor/adapter/WatermarkRecyclerViewAdapter;

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mVideoEditorResourceRequest:Lcom/miui/gallery/video/editor/net/VideoEditorResourceRequest;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mVideoEditorResourceRequest:Lcom/miui/gallery/video/editor/net/VideoEditorResourceRequest;

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/net/VideoEditorResourceRequest;->cancel()V

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mTextRoot:Landroid/view/View;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mTextRoot:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mOnGlobalLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    :cond_3
    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mTextPopWindow:Landroid/widget/PopupWindow;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mTextPopWindow:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->dismiss()V

    :cond_4
    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mTextAppearAnimator:Landroid/animation/ObjectAnimator;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mTextAppearAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->removeAllListeners()V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mTextAppearAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->cancel()V

    :cond_5
    const-string v0, ""

    iput-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mInputText:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->cancelRequest()V

    invoke-super {p0}, Lcom/miui/gallery/video/editor/ui/MenuFragment;->onDestroyView()V

    return-void
.end method

.method public onDownlaodCompleted(Lcom/miui/gallery/video/editor/model/VideoEditorBaseModel;I)V
    .locals 3

    check-cast p1, Lcom/miui/gallery/video/editor/TextStyle;

    invoke-static {}, Lcom/miui/gallery/video/editor/manager/NexAssetTemplateManager;->getInstance()Lcom/miui/gallery/video/editor/manager/NexAssetTemplateManager;

    move-result-object v0

    invoke-virtual {p1}, Lcom/miui/gallery/video/editor/TextStyle;->getAssetId()I

    move-result v1

    new-instance v2, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$10;

    invoke-direct {v2, p0, p1, p2}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$10;-><init>(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;Lcom/miui/gallery/video/editor/TextStyle;I)V

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/video/editor/manager/NexAssetTemplateManager;->installWaterMarkAssetPackageToSdk(ILcom/miui/gallery/video/editor/manager/NexAssetTemplateManager$ILoadAssetTemplate;)V

    return-void
.end method

.method public onPause()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/video/editor/ui/MenuFragment;->onPause()V

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->hideSoftInput()V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mTextPopWindow:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->dismiss()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mIsKeyboardShowing:Z

    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/video/editor/ui/MenuFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    const p2, 0x7f09033c

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    iput-object p2, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mStartActionButton:Landroid/widget/TextView;

    const p2, 0x7f09033a

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    iput-object p2, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mEndActionButton:Landroid/widget/TextView;

    const p2, 0x7f090339

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    iput-object p2, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mAllActionButton:Landroid/widget/TextView;

    const p2, 0x7f09029a

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/support/constraint/ConstraintLayout;

    iput-object p2, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mSelectTimeLayout:Landroid/support/constraint/ConstraintLayout;

    const p2, 0x7f0902fd

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/support/constraint/ConstraintLayout;

    iput-object p2, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mTitleLayout:Landroid/support/constraint/ConstraintLayout;

    const p2, 0x7f090073

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/ImageView;

    iput-object p2, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mIvCancel:Landroid/widget/ImageView;

    const p2, 0x7f0901f9

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/ImageView;

    iput-object p2, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mIvOk:Landroid/widget/ImageView;

    invoke-direct {p0, p1}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->initRecylerView(Landroid/view/View;)V

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->updateBottomBtnState()V

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->initListener()V

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->initEditPopWindow()V

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->initEnterAnim()V

    return-void
.end method

.method public onViewStateRestored(Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/video/editor/ui/MenuFragment;->onViewStateRestored(Landroid/os/Bundle;)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mAdapter:Lcom/miui/gallery/video/editor/adapter/WatermarkRecyclerViewAdapter;

    invoke-virtual {p1}, Lcom/miui/gallery/video/editor/adapter/WatermarkRecyclerViewAdapter;->getSelectedItemPosition()I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->mSavedSelectedWaterMarkIndex:I

    return-void
.end method
