.class public Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;
.super Lcom/miui/gallery/widget/GalleryDialogFragment;
.source "TextEditDialog.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$StatusListener;,
        Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$ConfigChangeListener;,
        Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$LayoutListener;,
        Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$Tab;
    }
.end annotation


# instance fields
.field private mConfigChangeListener:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$ConfigChangeListener;

.field private mContainerView:Landroid/widget/FrameLayout;

.field private mCurrentTab:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$Tab;

.field private mDialogSubMenuList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogSubMenu;",
            ">;"
        }
    .end annotation
.end field

.field private mEditText:Landroid/widget/EditText;

.field private mEditView:Landroid/widget/RelativeLayout;

.field private mInitializeData:Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;

.field private mKeyBoardHeight:I

.field private mNavigationClickListener:Landroid/view/View$OnClickListener;

.field private mNavigationContainer:Landroid/widget/LinearLayout;

.field private mScreenHeight:I

.field private mStatusListener:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$StatusListener;

.field private mTabContainer:Landroid/widget/FrameLayout;

.field private mTextWatcher:Landroid/text/TextWatcher;

.field private mWholeView:Landroid/view/ViewGroup;

.field private mWillEditText:Ljava/lang/String;

.field private mWillSelection:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/widget/GalleryDialogFragment;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mWillSelection:Z

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mScreenHeight:I

    sget-object v1, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$Tab;->KEYBOARD:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$Tab;

    iput-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mCurrentTab:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$Tab;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mDialogSubMenuList:Ljava/util/List;

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mKeyBoardHeight:I

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$2;-><init>(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mNavigationClickListener:Landroid/view/View$OnClickListener;

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;)Landroid/widget/EditText;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mEditText:Landroid/widget/EditText;

    return-object p0
.end method

.method static synthetic access$1000(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->showKeyboard()V

    return-void
.end method

.method static synthetic access$1100(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->hideKeyboard()V

    return-void
.end method

.method static synthetic access$1200(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;)Landroid/widget/FrameLayout;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mTabContainer:Landroid/widget/FrameLayout;

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;)Landroid/widget/FrameLayout;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mContainerView:Landroid/widget/FrameLayout;

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mScreenHeight:I

    return p0
.end method

.method static synthetic access$400(Landroid/view/View;ILandroid/graphics/Rect;)I
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->getHeightDifference(Landroid/view/View;ILandroid/graphics/Rect;)I

    move-result p0

    return p0
.end method

.method static synthetic access$500(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mKeyBoardHeight:I

    return p0
.end method

.method static synthetic access$502(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;I)I
    .locals 0

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mKeyBoardHeight:I

    return p1
.end method

.method static synthetic access$600(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->notifyKeyboardHeightChange()V

    return-void
.end method

.method static synthetic access$700(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->notifyHeightChange(I)V

    return-void
.end method

.method static synthetic access$800(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;)Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$Tab;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mCurrentTab:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$Tab;

    return-object p0
.end method

.method static synthetic access$802(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$Tab;)Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$Tab;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mCurrentTab:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$Tab;

    return-object p1
.end method

.method static synthetic access$900(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;)Ljava/util/List;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mDialogSubMenuList:Ljava/util/List;

    return-object p0
.end method

.method private static getHeightDifference(Landroid/view/View;ILandroid/graphics/Rect;)I
    .locals 2

    const/4 v0, 0x2

    new-array v0, v0, [I

    invoke-virtual {p0, v0}, Landroid/view/View;->getLocationOnScreen([I)V

    const/4 v1, 0x1

    aget v0, v0, v1

    sub-int v0, p1, v0

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v1

    sub-int/2addr v0, v1

    invoke-virtual {p0, p2}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    iget p0, p2, Landroid/graphics/Rect;->bottom:I

    iget p2, p2, Landroid/graphics/Rect;->top:I

    sub-int/2addr p0, p2

    sub-int/2addr p1, p0

    sub-int/2addr p1, v0

    return p1
.end method

.method private hideKeyboard()V
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->isAdded()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    const-string v0, "TextEditDialog"

    const-string v1, "hideKeyboard"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const-string v1, "input_method"

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mEditText:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    return-void
.end method

.method private initView(Landroid/view/LayoutInflater;)V
    .locals 7

    const v0, 0x7f0b0171

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mWholeView:Landroid/view/ViewGroup;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mWholeView:Landroid/view/ViewGroup;

    const v0, 0x7f0902dd

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mNavigationContainer:Landroid/widget/LinearLayout;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mWholeView:Landroid/view/ViewGroup;

    const v0, 0x7f0902dc

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/FrameLayout;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mTabContainer:Landroid/widget/FrameLayout;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mWholeView:Landroid/view/ViewGroup;

    const v0, 0x7f0902da

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/RelativeLayout;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mEditView:Landroid/widget/RelativeLayout;

    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v0, 0x0

    const/4 v1, -0x2

    invoke-direct {p1, v0, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v1, 0x3f800000    # 1.0f

    iput v1, p1, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    invoke-static {}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$Tab;->values()[Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$Tab;

    move-result-object v1

    array-length v2, v1

    :goto_0
    if-ge v0, v2, :cond_1

    aget-object v3, v1, v0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->getActivity()Landroid/app/Activity;

    move-result-object v4

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mConfigChangeListener:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$ConfigChangeListener;

    iget-object v6, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mTabContainer:Landroid/widget/FrameLayout;

    invoke-virtual {v3, v4, v5, v6}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$Tab;->getSubMenu(Landroid/content/Context;Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$ConfigChangeListener;Landroid/view/ViewGroup;)Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogSubMenu;

    move-result-object v4

    invoke-virtual {v3}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$Tab;->ordinal()I

    move-result v3

    if-nez v3, :cond_0

    const/4 v3, 0x1

    invoke-virtual {v4, v3}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogSubMenu;->setChecked(Z)V

    :cond_0
    invoke-virtual {v4}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogSubMenu;->getNavigationButton()Landroid/view/View;

    move-result-object v3

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mNavigationClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v3, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mNavigationContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v5, v3, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mDialogSubMenuList:Ljava/util/List;

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mWholeView:Landroid/view/ViewGroup;

    const v0, 0x7f0902d8

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/EditText;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mEditText:Landroid/widget/EditText;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mWholeView:Landroid/view/ViewGroup;

    const v0, 0x7f0902d9

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p1

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/-$$Lambda$TextEditDialog$ym2qSQCKPRCgYo5F0irFlklH890;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/-$$Lambda$TextEditDialog$ym2qSQCKPRCgYo5F0irFlklH890;-><init>(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mWholeView:Landroid/view/ViewGroup;

    const v0, 0x7f0902db

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p1

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/-$$Lambda$TextEditDialog$10Ve33_AomylQm6eAyh5yGMR3_w;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/-$$Lambda$TextEditDialog$10Ve33_AomylQm6eAyh5yGMR3_w;-><init>(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p1, Landroid/animation/LayoutTransition;

    invoke-direct {p1}, Landroid/animation/LayoutTransition;-><init>()V

    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Landroid/animation/LayoutTransition;->enableTransitionType(I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mWholeView:Landroid/view/ViewGroup;

    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->setLayoutTransition(Landroid/animation/LayoutTransition;)V

    return-void
.end method

.method public static synthetic lambda$initView$47(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;Landroid/view/View;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mEditText:Landroid/widget/EditText;

    const-string v0, ""

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public static synthetic lambda$initView$48(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;Landroid/view/View;)V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->dismissSafely()V

    return-void
.end method

.method public static synthetic lambda$onCreateDialog$49(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;Landroid/content/DialogInterface;)V
    .locals 2

    const-string p1, "TextEditDialog"

    const-string v0, "onShow"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mEditText:Landroid/widget/EditText;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setFocusable(Z)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mEditText:Landroid/widget/EditText;

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setFocusableInTouchMode(Z)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mEditText:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->requestFocus()Z

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mCurrentTab:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$Tab;

    sget-object v0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$Tab;->KEYBOARD:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$Tab;

    if-ne p1, v0, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->showKeyboard()V

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mWillEditText:Ljava/lang/String;

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mEditText:Landroid/widget/EditText;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mWillEditText:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    iget-boolean p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mWillSelection:Z

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mEditText:Landroid/widget/EditText;

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mWillEditText:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Landroid/widget/EditText;->setSelection(II)V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mEditText:Landroid/widget/EditText;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mWillEditText:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setSelection(I)V

    :cond_2
    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mTextWatcher:Landroid/text/TextWatcher;

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mEditText:Landroid/widget/EditText;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mTextWatcher:Landroid/text/TextWatcher;

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    :cond_3
    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->notifyShow()V

    iget p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mKeyBoardHeight:I

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->notifyHeightChange(I)V

    return-void
.end method

.method private notifyDismiss()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mStatusListener:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$StatusListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mStatusListener:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$StatusListener;

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$StatusListener;->onDismiss()V

    :cond_0
    return-void
.end method

.method private notifyHeightChange(I)V
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mStatusListener:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$StatusListener;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mEditView:Landroid/widget/RelativeLayout;

    invoke-virtual {v0}, Landroid/widget/RelativeLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mNavigationContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getHeight()I

    move-result v1

    iget v0, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    add-int/2addr v1, v0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mEditView:Landroid/widget/RelativeLayout;

    invoke-virtual {v0}, Landroid/widget/RelativeLayout;->getHeight()I

    move-result v0

    add-int/2addr v1, v0

    invoke-static {}, Lcom/miui/gallery/util/ScreenUtils;->getScreenHeight()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mScreenHeight:I

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mScreenHeight:I

    sub-int/2addr v0, p1

    sub-int/2addr v0, v1

    const-string v2, "TextEditDialog"

    const-string v3, "navigation: %d height:%d,bottom:%d,%d"

    const/4 v4, 0x4

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v4, v5

    const/4 v1, 0x1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v1

    const/4 v1, 0x2

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v1

    const/4 v1, 0x3

    iget v5, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mScreenHeight:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v1

    invoke-static {v2, v3, v4}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mStatusListener:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$StatusListener;

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mScreenHeight:I

    invoke-interface {p1, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$StatusListener;->onBottomChange(I)V

    const-string p1, "TextEditDialog"

    const-string v0, "notifyHeightChange: %d"

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mScreenHeight:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mStatusListener:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$StatusListener;

    invoke-interface {p1, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$StatusListener;->onBottomChange(I)V

    const-string p1, "TextEditDialog"

    const-string v1, "notifyHeightChange: %d"

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {p1, v1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_1
    :goto_0
    return-void
.end method

.method private notifyKeyboardHeightChange()V
    .locals 4

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mKeyBoardHeight:I

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mTabContainer:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getVisibility()I

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mTabContainer:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getHeight()I

    move-result v0

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mKeyBoardHeight:I

    if-eq v0, v1, :cond_2

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mTabContainer:Landroid/widget/FrameLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mTabContainer:Landroid/widget/FrameLayout;

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x1

    iget v3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mKeyBoardHeight:I

    invoke-direct {v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_2
    return-void
.end method

.method private notifyShow()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mStatusListener:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$StatusListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mStatusListener:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$StatusListener;

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$StatusListener;->onShow()V

    :cond_0
    return-void
.end method

.method private showKeyboard()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mEditText:Landroid/widget/EditText;

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$1;

    invoke-direct {v1, p0}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$1;-><init>(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;)V

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->post(Ljava/lang/Runnable;)Z

    return-void
.end method


# virtual methods
.method public isShowing()Z
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 4

    new-instance p1, Landroid/app/Dialog;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const v1, 0x7f1100b1

    invoke-direct {p1, v0, v1}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/-$$Lambda$TextEditDialog$oavLggpL4wpbIbEqPkVu7_DEWFc;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/-$$Lambda$TextEditDialog$oavLggpL4wpbIbEqPkVu7_DEWFc;-><init>(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;)V

    invoke-virtual {p1, v0}, Landroid/app/Dialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-eqz v0, :cond_0

    new-instance v2, Landroid/graphics/Point;

    invoke-direct {v2}, Landroid/graphics/Point;-><init>()V

    invoke-virtual {v0}, Landroid/view/Window;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v3

    invoke-interface {v3}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/view/Display;->getSize(Landroid/graphics/Point;)V

    iget v2, v2, Landroid/graphics/Point;->y:I

    iput v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mScreenHeight:I

    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->windowAnimations:I

    :cond_0
    return-object p1
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2

    new-instance p2, Landroid/widget/FrameLayout;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->getActivity()Landroid/app/Activity;

    move-result-object p3

    invoke-direct {p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mContainerView:Landroid/widget/FrameLayout;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mContainerView:Landroid/widget/FrameLayout;

    new-instance p3, Landroid/view/ViewGroup$LayoutParams;

    const/4 v0, -0x1

    const/4 v1, -0x2

    invoke-direct {p3, v0, v1}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {p2, p3}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mContainerView:Landroid/widget/FrameLayout;

    invoke-virtual {p2}, Landroid/widget/FrameLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object p2

    new-instance p3, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$LayoutListener;

    const/4 v0, 0x0

    invoke-direct {p3, p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$LayoutListener;-><init>(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$1;)V

    invoke-virtual {p2, p3}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mWholeView:Landroid/view/ViewGroup;

    if-nez p2, :cond_0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->initView(Landroid/view/LayoutInflater;)V

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mContainerView:Landroid/widget/FrameLayout;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mWholeView:Landroid/view/ViewGroup;

    invoke-virtual {p1, p2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mContainerView:Landroid/widget/FrameLayout;

    return-object p1
.end method

.method public onDestroyView()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mDialogSubMenuList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogSubMenu;

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogSubMenu;->release()V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mContainerView:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->removeAllViews()V

    invoke-super {p0}, Lcom/miui/gallery/widget/GalleryDialogFragment;->onDestroyView()V

    return-void
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/widget/GalleryDialogFragment;->onDismiss(Landroid/content/DialogInterface;)V

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->notifyHeightChange(I)V

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->notifyDismiss()V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mTextWatcher:Landroid/text/TextWatcher;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mEditText:Landroid/widget/EditText;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mTextWatcher:Landroid/text/TextWatcher;

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->removeTextChangedListener(Landroid/text/TextWatcher;)V

    :cond_0
    return-void
.end method

.method public onPause()V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->dismissSafely()V

    invoke-super {p0}, Lcom/miui/gallery/widget/GalleryDialogFragment;->onPause()V

    return-void
.end method

.method public onStart()V
    .locals 3

    invoke-super {p0}, Lcom/miui/gallery/widget/GalleryDialogFragment;->onStart()V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-eqz v0, :cond_0

    const/16 v1, 0x50

    invoke-virtual {v0, v1}, Landroid/view/Window;->setGravity(I)V

    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v1

    const/4 v2, -0x1

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->width:I

    const/4 v2, -0x2

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->height:I

    const/4 v2, 0x0

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->dimAmount:F

    invoke-virtual {v0, v1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v1}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-eqz v0, :cond_1

    const/16 v1, 0x30

    invoke-virtual {v0, v1}, Landroid/view/Window;->setSoftInputMode(I)V

    :cond_1
    const-string v0, "TextEditDialog"

    const-string v1, "onStart"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->notifyKeyboardHeightChange()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mDialogSubMenuList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogSubMenu;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mInitializeData:Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;

    invoke-virtual {v1, v2}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogSubMenu;->initializeData(Ljava/lang/Object;)V

    goto :goto_0

    :cond_2
    return-void
.end method

.method public setConfigChangeListener(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$ConfigChangeListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mConfigChangeListener:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$ConfigChangeListener;

    return-void
.end method

.method public setInitializeData(Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mInitializeData:Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;

    return-void
.end method

.method public setStatusListener(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$StatusListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mStatusListener:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$StatusListener;

    return-void
.end method

.method public setTextWatch(Landroid/text/TextWatcher;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mTextWatcher:Landroid/text/TextWatcher;

    return-void
.end method

.method public setWillEditText(Ljava/lang/String;Z)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mWillEditText:Ljava/lang/String;

    iput-boolean p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->mWillSelection:Z

    return-void
.end method
