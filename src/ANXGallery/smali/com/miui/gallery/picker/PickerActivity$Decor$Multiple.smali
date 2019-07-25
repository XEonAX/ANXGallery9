.class Lcom/miui/gallery/picker/PickerActivity$Decor$Multiple;
.super Lcom/miui/gallery/picker/PickerActivity$Decor;
.source "PickerActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/picker/PickerActivity$Decor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Multiple"
.end annotation


# instance fields
.field private mDoneButton:Landroid/widget/Button;

.field private mTitle:Landroid/widget/TextView;


# direct methods
.method protected constructor <init>(Lcom/miui/gallery/picker/PickerActivity;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/picker/PickerActivity$Decor;-><init>(Lcom/miui/gallery/picker/PickerActivity;)V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/picker/PickerActivity$Decor$Multiple;)Landroid/widget/Button;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/picker/PickerActivity$Decor$Multiple;->mDoneButton:Landroid/widget/Button;

    return-object p0
.end method


# virtual methods
.method public applyActionBar()V
    .locals 6

    const-string v0, "PickerActivity"

    const-string v1, "applyActionBar"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/picker/PickerActivity$Decor$Multiple;->mActivity:Lcom/miui/gallery/picker/PickerActivity;

    invoke-virtual {v0}, Lcom/miui/gallery/picker/PickerActivity;->getActionBar()Lmiui/app/ActionBar;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lmiui/app/ActionBar;->setDisplayShowCustomEnabled(Z)V

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lmiui/app/ActionBar;->setTabsMode(Z)V

    const v3, 0x7f0b0112

    invoke-virtual {v0, v3}, Lmiui/app/ActionBar;->setCustomView(I)V

    invoke-virtual {v0}, Lmiui/app/ActionBar;->getCustomView()Landroid/view/View;

    move-result-object v0

    const v3, 0x1020016

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lcom/miui/gallery/picker/PickerActivity$Decor$Multiple;->mTitle:Landroid/widget/TextView;

    invoke-static {}, Lcom/miui/gallery/util/BuildUtil;->isInternational()Z

    move-result v3

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/miui/gallery/picker/PickerActivity$Decor$Multiple;->mTitle:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/miui/gallery/picker/PickerActivity$Decor$Multiple;->mActivity:Lcom/miui/gallery/picker/PickerActivity;

    const v5, 0x7f11002b

    invoke-virtual {v3, v4, v5}, Landroid/widget/TextView;->setTextAppearance(Landroid/content/Context;I)V

    goto :goto_0

    :cond_0
    iget-object v3, p0, Lcom/miui/gallery/picker/PickerActivity$Decor$Multiple;->mTitle:Landroid/widget/TextView;

    sget-object v4, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    :goto_0
    const v3, 0x1020019

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    iget-object v4, p0, Lcom/miui/gallery/picker/PickerActivity$Decor$Multiple;->mActivity:Lcom/miui/gallery/picker/PickerActivity;

    const/4 v5, 0x3

    invoke-static {v4, v3, v5}, Lmiui/gallery/support/MiuiSdkCompat;->setEditActionModeButton(Landroid/content/Context;Landroid/widget/Button;I)V

    new-instance v4, Lcom/miui/gallery/picker/PickerActivity$Decor$Multiple$1;

    invoke-direct {v4, p0}, Lcom/miui/gallery/picker/PickerActivity$Decor$Multiple$1;-><init>(Lcom/miui/gallery/picker/PickerActivity$Decor$Multiple;)V

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v3, 0x102001a

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/miui/gallery/picker/PickerActivity$Decor$Multiple;->mDoneButton:Landroid/widget/Button;

    iget-object v0, p0, Lcom/miui/gallery/picker/PickerActivity$Decor$Multiple;->mActivity:Lcom/miui/gallery/picker/PickerActivity;

    iget-object v3, p0, Lcom/miui/gallery/picker/PickerActivity$Decor$Multiple;->mDoneButton:Landroid/widget/Button;

    const/4 v4, 0x2

    invoke-static {v0, v3, v4}, Lmiui/gallery/support/MiuiSdkCompat;->setEditActionModeButton(Landroid/content/Context;Landroid/widget/Button;I)V

    iget-object v0, p0, Lcom/miui/gallery/picker/PickerActivity$Decor$Multiple;->mDoneButton:Landroid/widget/Button;

    new-instance v3, Lcom/miui/gallery/picker/PickerActivity$Decor$Multiple$2;

    invoke-direct {v3, p0}, Lcom/miui/gallery/picker/PickerActivity$Decor$Multiple$2;-><init>(Lcom/miui/gallery/picker/PickerActivity$Decor$Multiple;)V

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/miui/gallery/picker/PickerActivity$Decor$Multiple;->mDoneButton:Landroid/widget/Button;

    iget-object v3, p0, Lcom/miui/gallery/picker/PickerActivity$Decor$Multiple;->mActivity:Lcom/miui/gallery/picker/PickerActivity;

    iget-object v3, v3, Lcom/miui/gallery/picker/PickerActivity;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

    invoke-interface {v3}, Lcom/miui/gallery/picker/helper/Picker;->count()I

    move-result v3

    iget-object v4, p0, Lcom/miui/gallery/picker/PickerActivity$Decor$Multiple;->mActivity:Lcom/miui/gallery/picker/PickerActivity;

    iget-object v4, v4, Lcom/miui/gallery/picker/PickerActivity;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

    invoke-interface {v4}, Lcom/miui/gallery/picker/helper/Picker;->baseline()I

    move-result v4

    if-lt v3, v4, :cond_1

    goto :goto_1

    :cond_1
    const/4 v1, 0x0

    :goto_1
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    iget-object v0, p0, Lcom/miui/gallery/picker/PickerActivity$Decor$Multiple;->mActivity:Lcom/miui/gallery/picker/PickerActivity;

    iget-object v0, v0, Lcom/miui/gallery/picker/PickerActivity;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

    new-instance v1, Lcom/miui/gallery/picker/PickerActivity$Decor$Multiple$3;

    invoke-direct {v1, p0}, Lcom/miui/gallery/picker/PickerActivity$Decor$Multiple$3;-><init>(Lcom/miui/gallery/picker/PickerActivity$Decor$Multiple;)V

    invoke-interface {v0, v1}, Lcom/miui/gallery/picker/helper/Picker;->registerObserver(Landroid/database/DataSetObserver;)V

    return-void
.end method

.method public applyTheme()V
    .locals 0

    return-void
.end method

.method public setPickerTitle(Ljava/lang/CharSequence;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/picker/PickerActivity$Decor$Multiple;->mTitle:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public setTitle(Ljava/lang/CharSequence;)V
    .locals 0

    return-void
.end method
