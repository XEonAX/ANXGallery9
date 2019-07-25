.class public Lcom/miui/gallery/widget/menu/PhoneImmersionMenu;
.super Lmiui/widget/ImmersionListPopupWindow;
.source "PhoneImmersionMenu.java"


# instance fields
.field private mAdapter:Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter;

.field private mImmersionMenuListener:Lcom/miui/gallery/widget/menu/ImmersionMenuListener;

.field private mLastAnchor:Landroid/view/View;

.field private mLastParent:Landroid/view/ViewGroup;

.field private mMenu:Lcom/miui/gallery/widget/menu/ImmersionMenu;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/miui/gallery/widget/menu/ImmersionMenuListener;)V
    .locals 1

    invoke-direct {p0, p1}, Lmiui/widget/ImmersionListPopupWindow;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/miui/gallery/widget/menu/PhoneImmersionMenu;->mImmersionMenuListener:Lcom/miui/gallery/widget/menu/ImmersionMenuListener;

    if-eqz p2, :cond_0

    new-instance v0, Lcom/miui/gallery/widget/menu/ImmersionMenu;

    invoke-direct {v0, p1}, Lcom/miui/gallery/widget/menu/ImmersionMenu;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/miui/gallery/widget/menu/PhoneImmersionMenu;->mMenu:Lcom/miui/gallery/widget/menu/ImmersionMenu;

    iget-object v0, p0, Lcom/miui/gallery/widget/menu/PhoneImmersionMenu;->mMenu:Lcom/miui/gallery/widget/menu/ImmersionMenu;

    invoke-interface {p2, v0}, Lcom/miui/gallery/widget/menu/ImmersionMenuListener;->onCreateImmersionMenu(Lcom/miui/gallery/widget/menu/ImmersionMenu;)V

    :cond_0
    new-instance p2, Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter;

    iget-object v0, p0, Lcom/miui/gallery/widget/menu/PhoneImmersionMenu;->mMenu:Lcom/miui/gallery/widget/menu/ImmersionMenu;

    invoke-direct {p2, p1, v0}, Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter;-><init>(Landroid/content/Context;Lcom/miui/gallery/widget/menu/ImmersionMenu;)V

    iput-object p2, p0, Lcom/miui/gallery/widget/menu/PhoneImmersionMenu;->mAdapter:Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter;

    iget-object p1, p0, Lcom/miui/gallery/widget/menu/PhoneImmersionMenu;->mAdapter:Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/widget/menu/PhoneImmersionMenu;->setAdapter(Landroid/widget/ListAdapter;)V

    new-instance p1, Lcom/miui/gallery/widget/menu/PhoneImmersionMenu$1;

    invoke-direct {p1, p0}, Lcom/miui/gallery/widget/menu/PhoneImmersionMenu$1;-><init>(Lcom/miui/gallery/widget/menu/PhoneImmersionMenu;)V

    invoke-virtual {p0, p1}, Lcom/miui/gallery/widget/menu/PhoneImmersionMenu;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    iget-object p1, p0, Lcom/miui/gallery/widget/menu/PhoneImmersionMenu;->mAdapter:Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter;

    new-instance p2, Lcom/miui/gallery/widget/menu/PhoneImmersionMenu$2;

    invoke-direct {p2, p0}, Lcom/miui/gallery/widget/menu/PhoneImmersionMenu$2;-><init>(Lcom/miui/gallery/widget/menu/PhoneImmersionMenu;)V

    invoke-virtual {p1, p2}, Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter;->setOnItemCheckChangeListener(Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter$OnItemCheckChangeListener;)V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/widget/menu/PhoneImmersionMenu;)Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/widget/menu/PhoneImmersionMenu;->mAdapter:Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/widget/menu/PhoneImmersionMenu;)Landroid/view/View;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/widget/menu/PhoneImmersionMenu;->mLastAnchor:Landroid/view/View;

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/widget/menu/PhoneImmersionMenu;)Landroid/view/ViewGroup;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/widget/menu/PhoneImmersionMenu;->mLastParent:Landroid/view/ViewGroup;

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/widget/menu/PhoneImmersionMenu;)Lcom/miui/gallery/widget/menu/ImmersionMenu;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/widget/menu/PhoneImmersionMenu;->mMenu:Lcom/miui/gallery/widget/menu/ImmersionMenu;

    return-object p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/widget/menu/PhoneImmersionMenu;)Lcom/miui/gallery/widget/menu/ImmersionMenuListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/widget/menu/PhoneImmersionMenu;->mImmersionMenuListener:Lcom/miui/gallery/widget/menu/ImmersionMenuListener;

    return-object p0
.end method


# virtual methods
.method protected getBlurBackground(Landroid/content/Context;Landroid/view/View;)Landroid/graphics/drawable/Drawable;
    .locals 2

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0500b3

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    invoke-super {p0, p1, p2}, Lmiui/widget/ImmersionListPopupWindow;->getBlurBackground(Landroid/content/Context;Landroid/view/View;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    return-object p1
.end method

.method public getImmersionMenu()Lcom/miui/gallery/widget/menu/ImmersionMenu;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/menu/PhoneImmersionMenu;->mMenu:Lcom/miui/gallery/widget/menu/ImmersionMenu;

    return-object v0
.end method

.method public show(Landroid/view/View;Landroid/view/ViewGroup;)V
    .locals 2

    iput-object p1, p0, Lcom/miui/gallery/widget/menu/PhoneImmersionMenu;->mLastAnchor:Landroid/view/View;

    iput-object p2, p0, Lcom/miui/gallery/widget/menu/PhoneImmersionMenu;->mLastParent:Landroid/view/ViewGroup;

    iget-object v0, p0, Lcom/miui/gallery/widget/menu/PhoneImmersionMenu;->mImmersionMenuListener:Lcom/miui/gallery/widget/menu/ImmersionMenuListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/menu/PhoneImmersionMenu;->mImmersionMenuListener:Lcom/miui/gallery/widget/menu/ImmersionMenuListener;

    iget-object v1, p0, Lcom/miui/gallery/widget/menu/PhoneImmersionMenu;->mMenu:Lcom/miui/gallery/widget/menu/ImmersionMenu;

    invoke-interface {v0, v1}, Lcom/miui/gallery/widget/menu/ImmersionMenuListener;->onPrepareImmersionMenu(Lcom/miui/gallery/widget/menu/ImmersionMenu;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/menu/PhoneImmersionMenu;->mMenu:Lcom/miui/gallery/widget/menu/ImmersionMenu;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/widget/menu/PhoneImmersionMenu;->update(Lcom/miui/gallery/widget/menu/ImmersionMenu;)V

    :cond_0
    invoke-super {p0, p1, p2}, Lmiui/widget/ImmersionListPopupWindow;->show(Landroid/view/View;Landroid/view/ViewGroup;)V

    return-void
.end method

.method public update(Lcom/miui/gallery/widget/menu/ImmersionMenu;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/menu/PhoneImmersionMenu;->mAdapter:Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter;->update(Lcom/miui/gallery/widget/menu/ImmersionMenu;)V

    return-void
.end method
