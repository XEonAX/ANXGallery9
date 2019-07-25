.class public Lcom/miui/gallery/app/BottomMenuFragmentDelegate;
.super Lcom/miui/gallery/app/BottomMenuDelegateImpl;
.source "BottomMenuFragmentDelegate.java"


# instance fields
.field private mExtraThemeRes:I

.field private mFragment:Lmiui/app/Fragment;

.field private mInvalidateMenuFlags:B

.field private final mInvalidateMenuRunnable:Ljava/lang/Runnable;

.field private mMenu:Lcom/miui/gallery/view/menu/MenuBuilder;

.field private mThemedContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Lmiui/app/Fragment;)V
    .locals 1

    invoke-virtual {p1}, Lmiui/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/miui/gallery/app/BottomMenuDelegateImpl;-><init>(Landroid/app/Activity;)V

    new-instance v0, Lcom/miui/gallery/app/BottomMenuFragmentDelegate$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/app/BottomMenuFragmentDelegate$1;-><init>(Lcom/miui/gallery/app/BottomMenuFragmentDelegate;)V

    iput-object v0, p0, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;->mInvalidateMenuRunnable:Ljava/lang/Runnable;

    iput-object p1, p0, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;->mFragment:Lmiui/app/Fragment;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/app/BottomMenuFragmentDelegate;)B
    .locals 0

    iget-byte p0, p0, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;->mInvalidateMenuFlags:B

    return p0
.end method

.method static synthetic access$002(Lcom/miui/gallery/app/BottomMenuFragmentDelegate;B)B
    .locals 0

    iput-byte p1, p0, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;->mInvalidateMenuFlags:B

    return p1
.end method

.method static synthetic access$100(Lcom/miui/gallery/app/BottomMenuFragmentDelegate;)Lcom/miui/gallery/view/menu/MenuBuilder;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;->mMenu:Lcom/miui/gallery/view/menu/MenuBuilder;

    return-object p0
.end method

.method static synthetic access$102(Lcom/miui/gallery/app/BottomMenuFragmentDelegate;Lcom/miui/gallery/view/menu/MenuBuilder;)Lcom/miui/gallery/view/menu/MenuBuilder;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;->mMenu:Lcom/miui/gallery/view/menu/MenuBuilder;

    return-object p1
.end method


# virtual methods
.method public getThemedContext()Landroid/content/Context;
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;->mThemedContext:Landroid/content/Context;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;->mActivity:Landroid/app/Activity;

    iput-object v0, p0, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;->mThemedContext:Landroid/content/Context;

    iget v0, p0, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;->mExtraThemeRes:I

    if-eqz v0, :cond_0

    new-instance v0, Landroid/view/ContextThemeWrapper;

    iget-object v1, p0, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;->mThemedContext:Landroid/content/Context;

    iget v2, p0, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;->mExtraThemeRes:I

    invoke-direct {v0, v1, v2}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    iput-object v0, p0, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;->mThemedContext:Landroid/content/Context;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;->mThemedContext:Landroid/content/Context;

    return-object v0
.end method

.method final installBottomMenu()V
    .locals 4

    iget-boolean v0, p0, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;->mIsBottomMenuInstalled:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;->mFragment:Lmiui/app/Fragment;

    invoke-virtual {v0}, Lmiui/app/Fragment;->getView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_1

    instance-of v1, v0, Landroid/view/ViewGroup;

    if-eqz v1, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;->getThemedContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const v2, 0x7f0b0129

    check-cast v0, Landroid/view/ViewGroup;

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v0, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/widget/BottomMenu;

    iput-object v1, p0, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;->mBottomMenu:Lcom/miui/gallery/widget/BottomMenu;

    iget-object v1, p0, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;->mBottomMenu:Lcom/miui/gallery/widget/BottomMenu;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    iget-object v0, p0, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;->mBottomMenu:Lcom/miui/gallery/widget/BottomMenu;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/BottomMenu;->bringToFront()V

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;->updateOptionsMenu(I)V

    invoke-virtual {p0}, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;->invalidateBottomMenu()V

    iput-boolean v0, p0, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;->mIsBottomMenuInstalled:Z

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;->mBottomMenu:Lcom/miui/gallery/widget/BottomMenu;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/BottomMenu;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;->mBottomMenu:Lcom/miui/gallery/widget/BottomMenu;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/BottomMenu;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;->mBottomMenu:Lcom/miui/gallery/widget/BottomMenu;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/BottomMenu;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;->mBottomMenu:Lcom/miui/gallery/widget/BottomMenu;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->endViewTransition(Landroid/view/View;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public invalidateBottomMenu()V
    .locals 2

    iget-byte v0, p0, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;->mInvalidateMenuFlags:B

    and-int/lit8 v0, v0, 0x10

    if-nez v0, :cond_0

    iget-byte v0, p0, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;->mInvalidateMenuFlags:B

    or-int/lit8 v0, v0, 0x10

    int-to-byte v0, v0

    iput-byte v0, p0, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;->mInvalidateMenuFlags:B

    iget-object v0, p0, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;->mFragment:Lmiui/app/Fragment;

    invoke-virtual {v0}, Lmiui/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;->mInvalidateMenuRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method

.method public onCreatePanelMenu(ILandroid/view/Menu;)Z
    .locals 1

    const/4 v0, 0x0

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;->mFragment:Lmiui/app/Fragment;

    check-cast p1, Lcom/miui/gallery/app/IBottomMenu;

    invoke-interface {p1}, Lcom/miui/gallery/app/IBottomMenu;->isMenuVisible()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;->mFragment:Lmiui/app/Fragment;

    invoke-virtual {p1, p2}, Lmiui/app/Fragment;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0

    :cond_1
    return v0
.end method

.method public onMenuItemSelected(ILandroid/view/MenuItem;)Z
    .locals 0

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;->mFragment:Lmiui/app/Fragment;

    invoke-virtual {p1, p2}, Lmiui/app/Fragment;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result p1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public onMenuItemSelected(Lcom/miui/gallery/view/menu/MenuBuilder;Landroid/view/MenuItem;)Z
    .locals 0

    const/4 p1, 0x0

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;->onMenuItemSelected(ILandroid/view/MenuItem;)Z

    move-result p1

    return p1
.end method

.method public onPreparePanel(ILandroid/view/View;Landroid/view/Menu;)Z
    .locals 0

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;->mFragment:Lmiui/app/Fragment;

    check-cast p1, Lcom/miui/gallery/app/IBottomMenu;

    invoke-interface {p1}, Lcom/miui/gallery/app/IBottomMenu;->isMenuVisible()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;->mFragment:Lmiui/app/Fragment;

    invoke-virtual {p1, p3}, Lmiui/app/Fragment;->onPrepareOptionsMenu(Landroid/view/Menu;)V

    :cond_0
    const/4 p1, 0x1

    return p1

    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;->installBottomMenu()V

    return-void
.end method

.method public setExtraThemeRes(I)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;->mExtraThemeRes:I

    return-void
.end method

.method public updateOptionsMenu(I)V
    .locals 1

    iget-byte v0, p0, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;->mInvalidateMenuFlags:B

    and-int/lit8 p1, p1, 0x1

    or-int/2addr p1, v0

    int-to-byte p1, p1

    iput-byte p1, p0, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;->mInvalidateMenuFlags:B

    return-void
.end method
