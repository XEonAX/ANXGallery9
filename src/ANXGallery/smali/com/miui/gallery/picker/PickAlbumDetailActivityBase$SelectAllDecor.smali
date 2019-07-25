.class public Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;
.super Lcom/miui/gallery/picker/PickerActivity$Decor;
.source "PickAlbumDetailActivityBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/picker/PickAlbumDetailActivityBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SelectAllDecor"
.end annotation


# instance fields
.field private mActivity:Lcom/miui/gallery/picker/PickAlbumDetailActivityBase;

.field private mAllSelected:Z

.field private mCancelButton:Landroid/widget/Button;

.field private mDoneButton:Landroid/widget/Button;

.field private mPickerTitle:Landroid/widget/TextView;

.field private mSelectAllButton:Landroid/widget/Button;

.field private mTitle:Landroid/widget/TextView;


# direct methods
.method protected constructor <init>(Lcom/miui/gallery/picker/PickAlbumDetailActivityBase;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/picker/PickerActivity$Decor;-><init>(Lcom/miui/gallery/picker/PickerActivity;)V

    iput-object p1, p0, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;->mActivity:Lcom/miui/gallery/picker/PickAlbumDetailActivityBase;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;)Lcom/miui/gallery/picker/PickAlbumDetailActivityBase;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;->mActivity:Lcom/miui/gallery/picker/PickAlbumDetailActivityBase;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;->mAllSelected:Z

    return p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;->updateDoneButtonVisibility()V

    return-void
.end method

.method static synthetic access$300(Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;->updateSelectAll()V

    return-void
.end method

.method private setup()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;->mActivity:Lcom/miui/gallery/picker/PickAlbumDetailActivityBase;

    iget-object v1, p0, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;->mDoneButton:Landroid/widget/Button;

    const/4 v2, 0x2

    invoke-static {v0, v1, v2}, Lmiui/gallery/support/MiuiSdkCompat;->setEditActionModeButton(Landroid/content/Context;Landroid/widget/Button;I)V

    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;->mActivity:Lcom/miui/gallery/picker/PickAlbumDetailActivityBase;

    iget-object v1, p0, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;->mCancelButton:Landroid/widget/Button;

    const/4 v2, 0x3

    invoke-static {v0, v1, v2}, Lmiui/gallery/support/MiuiSdkCompat;->setEditActionModeButton(Landroid/content/Context;Landroid/widget/Button;I)V

    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;->mActivity:Lcom/miui/gallery/picker/PickAlbumDetailActivityBase;

    invoke-virtual {v0}, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase;->getPicker()Lcom/miui/gallery/picker/helper/Picker;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;->mTitle:Landroid/widget/TextView;

    new-instance v2, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor$1;

    invoke-direct {v2, p0}, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor$1;-><init>(Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;)V

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v1, p0, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;->mCancelButton:Landroid/widget/Button;

    new-instance v2, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor$2;

    invoke-direct {v2, p0}, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor$2;-><init>(Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v1, p0, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;->mDoneButton:Landroid/widget/Button;

    new-instance v2, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor$3;

    invoke-direct {v2, p0}, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor$3;-><init>(Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v1, p0, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;->mSelectAllButton:Landroid/widget/Button;

    new-instance v2, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor$4;

    invoke-direct {v2, p0}, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor$4;-><init>(Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-direct {p0}, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;->updateSelectAll()V

    new-instance v1, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor$5;

    invoke-direct {v1, p0}, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor$5;-><init>(Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;)V

    invoke-interface {v0, v1}, Lcom/miui/gallery/picker/helper/Picker;->registerObserver(Landroid/database/DataSetObserver;)V

    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;->mActivity:Lcom/miui/gallery/picker/PickAlbumDetailActivityBase;

    new-instance v1, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor$6;

    invoke-direct {v1, p0}, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor$6;-><init>(Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;)V

    iput-object v1, v0, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase;->mItemStateListener:Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$ItemStateListener;

    return-void
.end method

.method private updateDoneButtonVisibility()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;->mDoneButton:Landroid/widget/Button;

    iget-object v1, p0, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;->mActivity:Lcom/miui/gallery/picker/PickAlbumDetailActivityBase;

    iget-object v1, v1, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

    invoke-interface {v1}, Lcom/miui/gallery/picker/helper/Picker;->count()I

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;->mActivity:Lcom/miui/gallery/picker/PickAlbumDetailActivityBase;

    iget-object v2, v2, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

    invoke-interface {v2}, Lcom/miui/gallery/picker/helper/Picker;->baseline()I

    move-result v2

    if-lt v1, v2, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    return-void
.end method

.method private updateSelectAll()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;->mActivity:Lcom/miui/gallery/picker/PickAlbumDetailActivityBase;

    iget-object v0, v0, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase;->mAlbumDetailFragment:Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;->mActivity:Lcom/miui/gallery/picker/PickAlbumDetailActivityBase;

    iget-object v0, v0, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase;->mAlbumDetailFragment:Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;

    invoke-virtual {v0}, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;->isAllSelected()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;->mActivity:Lcom/miui/gallery/picker/PickAlbumDetailActivityBase;

    invoke-virtual {v0}, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase;->getPicker()Lcom/miui/gallery/picker/helper/Picker;

    move-result-object v0

    invoke-interface {v0}, Lcom/miui/gallery/picker/helper/Picker;->isFull()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;->mActivity:Lcom/miui/gallery/picker/PickAlbumDetailActivityBase;

    iget-object v0, v0, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase;->mAlbumDetailFragment:Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;

    invoke-virtual {v0}, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;->isNoneSelected()Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;->mAllSelected:Z

    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;->mActivity:Lcom/miui/gallery/picker/PickAlbumDetailActivityBase;

    iget-object v1, p0, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;->mSelectAllButton:Landroid/widget/Button;

    iget-boolean v2, p0, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;->mAllSelected:Z

    invoke-static {v0, v1, v2}, Lmiui/gallery/support/MiuiSdkCompat;->setEditActionModeButton(Landroid/content/Context;Landroid/widget/Button;I)V

    return-void
.end method


# virtual methods
.method public applyActionBar()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;->mActivity:Lcom/miui/gallery/picker/PickAlbumDetailActivityBase;

    invoke-virtual {v0}, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase;->getActionBar()Lmiui/app/ActionBar;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lmiui/app/ActionBar;->setDisplayShowCustomEnabled(Z)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lmiui/app/ActionBar;->setTabsMode(Z)V

    const v1, 0x7f0b010f

    invoke-virtual {v0, v1}, Lmiui/app/ActionBar;->setCustomView(I)V

    invoke-virtual {v0}, Lmiui/app/ActionBar;->getCustomView()Landroid/view/View;

    move-result-object v0

    const v1, 0x1020016

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;->mTitle:Landroid/widget/TextView;

    const v1, 0x7f090220

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;->mPickerTitle:Landroid/widget/TextView;

    invoke-static {}, Lcom/miui/gallery/util/BuildUtil;->isInternational()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;->mPickerTitle:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;->mActivity:Lcom/miui/gallery/picker/PickAlbumDetailActivityBase;

    const v3, 0x7f11002b

    invoke-virtual {v1, v2, v3}, Landroid/widget/TextView;->setTextAppearance(Landroid/content/Context;I)V

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;->mPickerTitle:Landroid/widget/TextView;

    sget-object v2, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    :goto_0
    const v1, 0x1020019

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    iput-object v1, p0, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;->mCancelButton:Landroid/widget/Button;

    const v1, 0x102001a

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    iput-object v1, p0, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;->mDoneButton:Landroid/widget/Button;

    invoke-direct {p0}, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;->updateDoneButtonVisibility()V

    const v1, 0x102001b

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;->mSelectAllButton:Landroid/widget/Button;

    invoke-direct {p0}, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;->setup()V

    return-void
.end method

.method public applyTheme()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;->mActivity:Lcom/miui/gallery/picker/PickAlbumDetailActivityBase;

    const v1, 0x7f110090

    invoke-virtual {v0, v1}, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase;->setTheme(I)V

    return-void
.end method

.method public setPickerTitle(Ljava/lang/CharSequence;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;->mPickerTitle:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public setTitle(Ljava/lang/CharSequence;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;->mTitle:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method
