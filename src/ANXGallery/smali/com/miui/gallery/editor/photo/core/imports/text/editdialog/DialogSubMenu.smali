.class abstract Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogSubMenu;
.super Ljava/lang/Object;
.source "DialogSubMenu.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "E:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field protected mListener:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private mNavigationButton:Landroid/view/View;

.field private mNavigationDrawableRes:I

.field private mNavigationStringRes:I

.field private mRadioButton:Landroid/widget/TextView;

.field private mSubMenuView:Landroid/view/ViewGroup;


# direct methods
.method constructor <init>(Landroid/content/Context;Landroid/view/ViewGroup;II)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogSubMenu;->mNavigationStringRes:I

    iput p4, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogSubMenu;->mNavigationDrawableRes:I

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogSubMenu;->initNavigationRadioButton(Landroid/content/Context;)Landroid/view/View;

    move-result-object p3

    iput-object p3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogSubMenu;->mNavigationButton:Landroid/view/View;

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogSubMenu;->initSubMenuView(Landroid/content/Context;Landroid/view/ViewGroup;)Landroid/view/ViewGroup;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogSubMenu;->mSubMenuView:Landroid/view/ViewGroup;

    return-void
.end method

.method private initNavigationRadioButton(Landroid/content/Context;)Landroid/view/View;
    .locals 5

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const/4 v1, 0x0

    const v2, 0x7f0b016d

    invoke-virtual {v0, v2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    const v2, 0x7f0902df

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogSubMenu;->mRadioButton:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogSubMenu;->mRadioButton:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    iget v4, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogSubMenu;->mNavigationDrawableRes:I

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v2, v3, v1, v1, v1}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogSubMenu;->mRadioButton:Landroid/widget/TextView;

    iget v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogSubMenu;->mNavigationStringRes:I

    invoke-virtual {p1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-object v0
.end method


# virtual methods
.method getNavigationButton()Landroid/view/View;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogSubMenu;->mNavigationButton:Landroid/view/View;

    return-object v0
.end method

.method getSubMenuView()Landroid/view/ViewGroup;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogSubMenu;->mSubMenuView:Landroid/view/ViewGroup;

    return-object v0
.end method

.method abstract initSubMenuView(Landroid/content/Context;Landroid/view/ViewGroup;)Landroid/view/ViewGroup;
.end method

.method public abstract initializeData(Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)V"
        }
    .end annotation
.end method

.method public release()V
    .locals 0

    return-void
.end method

.method public setChecked(Z)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogSubMenu;->mRadioButton:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setSelected(Z)V

    return-void
.end method
