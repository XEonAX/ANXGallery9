.class public Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter;
.super Landroid/widget/BaseAdapter;
.source "ImmersionMenuAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter$OnItemCheckChangeListener;,
        Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter$CheckableHolder;,
        Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter$TextHolder;
    }
.end annotation


# instance fields
.field private mInflater:Landroid/view/LayoutInflater;

.field private mOnItemCheckChangeListener:Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter$OnItemCheckChangeListener;

.field private mVisibleItems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/widget/menu/ImmersionMenuItem;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/miui/gallery/widget/menu/ImmersionMenu;)V
    .locals 0

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter;->mInflater:Landroid/view/LayoutInflater;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter;->mVisibleItems:Ljava/util/ArrayList;

    iget-object p1, p0, Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter;->mVisibleItems:Ljava/util/ArrayList;

    invoke-direct {p0, p2, p1}, Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter;->buildVisibleItems(Lcom/miui/gallery/widget/menu/ImmersionMenu;Ljava/util/ArrayList;)V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter;)Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter$OnItemCheckChangeListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter;->mOnItemCheckChangeListener:Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter$OnItemCheckChangeListener;

    return-object p0
.end method

.method private buildVisibleItems(Lcom/miui/gallery/widget/menu/ImmersionMenu;Ljava/util/ArrayList;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/widget/menu/ImmersionMenu;",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/widget/menu/ImmersionMenuItem;",
            ">;)V"
        }
    .end annotation

    invoke-virtual {p2}, Ljava/util/ArrayList;->clear()V

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Lcom/miui/gallery/widget/menu/ImmersionMenu;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    invoke-virtual {p1, v1}, Lcom/miui/gallery/widget/menu/ImmersionMenu;->getItem(I)Lcom/miui/gallery/widget/menu/ImmersionMenuItem;

    move-result-object v2

    invoke-virtual {v2}, Lcom/miui/gallery/widget/menu/ImmersionMenuItem;->isVisible()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {p2, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter;->mVisibleItems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Lcom/miui/gallery/widget/menu/ImmersionMenuItem;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter;->mVisibleItems:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/widget/menu/ImmersionMenuItem;

    return-object p1
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter;->getItem(I)Lcom/miui/gallery/widget/menu/ImmersionMenuItem;

    move-result-object p1

    return-object p1
.end method

.method public getItemId(I)J
    .locals 2

    int-to-long v0, p1

    return-wide v0
.end method

.method public getItemViewType(I)I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter;->mVisibleItems:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/widget/menu/ImmersionMenuItem;

    invoke-virtual {p1}, Lcom/miui/gallery/widget/menu/ImmersionMenuItem;->isCheckable()Z

    move-result p1

    return p1
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 5

    invoke-virtual {p0, p1}, Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter;->getItemViewType(I)I

    move-result v0

    const v1, 0x7f0902c3

    const v2, 0x7f0902d6

    const/4 v3, 0x0

    if-nez v0, :cond_0

    if-nez p2, :cond_2

    iget-object p2, p0, Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter;->mInflater:Landroid/view/LayoutInflater;

    const v0, 0x7f0b009c

    invoke-virtual {p2, v0, p3, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    new-instance p3, Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter$TextHolder;

    invoke-direct {p3, p0}, Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter$TextHolder;-><init>(Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter;)V

    const v0, 0x7f09016a

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p3, Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter$TextHolder;->iconView:Landroid/widget/ImageView;

    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p3, Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter$TextHolder;->textView:Landroid/widget/TextView;

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p3, Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter$TextHolder;->summaryText:Landroid/widget/TextView;

    const v0, 0x7f09017b

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p3, Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter$TextHolder;->informationText:Landroid/widget/TextView;

    const v0, 0x7f090259

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p3, Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter$TextHolder;->redDotView:Landroid/view/View;

    invoke-virtual {p2, p3}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    const/4 v4, 0x1

    if-ne v0, v4, :cond_2

    if-nez p2, :cond_1

    iget-object p2, p0, Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter;->mInflater:Landroid/view/LayoutInflater;

    const v0, 0x7f0b009b

    invoke-virtual {p2, v0, p3, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    new-instance p3, Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter$CheckableHolder;

    invoke-direct {p3, p0}, Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter$CheckableHolder;-><init>(Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter;)V

    move-object v0, p3

    check-cast v0, Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter$CheckableHolder;

    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p3, Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter$TextHolder;->textView:Landroid/widget/TextView;

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p3, Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter$TextHolder;->summaryText:Landroid/widget/TextView;

    const v1, 0x7f09007b

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/CheckBox;

    iput-object v1, v0, Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter$CheckableHolder;->checkBox:Landroid/widget/CheckBox;

    iget-object v1, v0, Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter$CheckableHolder;->checkBox:Landroid/widget/CheckBox;

    invoke-virtual {v1, v0}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    invoke-virtual {p2, p3}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    :cond_1
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter$CheckableHolder;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter;->getItem(I)Lcom/miui/gallery/widget/menu/ImmersionMenuItem;

    move-result-object v0

    iput-object v0, p3, Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter$CheckableHolder;->data:Lcom/miui/gallery/widget/menu/ImmersionMenuItem;

    iget-object p3, p3, Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter$CheckableHolder;->checkBox:Landroid/widget/CheckBox;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/menu/ImmersionMenuItem;->isChecked()Z

    move-result v0

    invoke-virtual {p3, v0}, Landroid/widget/CheckBox;->setChecked(Z)V

    :cond_2
    :goto_0
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p3

    if-eqz p3, :cond_9

    check-cast p3, Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter$TextHolder;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter;->getItem(I)Lcom/miui/gallery/widget/menu/ImmersionMenuItem;

    move-result-object p1

    iget-object v0, p3, Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter$TextHolder;->textView:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/miui/gallery/widget/menu/ImmersionMenuItem;->getTitle()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p1}, Lcom/miui/gallery/widget/menu/ImmersionMenuItem;->getSummary()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/16 v1, 0x8

    if-nez v0, :cond_3

    iget-object v0, p3, Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter$TextHolder;->summaryText:Landroid/widget/TextView;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p3, Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter$TextHolder;->summaryText:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/miui/gallery/widget/menu/ImmersionMenuItem;->getSummary()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1

    :cond_3
    iget-object v0, p3, Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter$TextHolder;->summaryText:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    :goto_1
    iget-object v0, p3, Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter$TextHolder;->iconView:Landroid/widget/ImageView;

    if-eqz v0, :cond_5

    invoke-virtual {p1}, Lcom/miui/gallery/widget/menu/ImmersionMenuItem;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_4

    iget-object v0, p3, Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter$TextHolder;->iconView:Landroid/widget/ImageView;

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object v0, p3, Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter$TextHolder;->iconView:Landroid/widget/ImageView;

    invoke-virtual {p1}, Lcom/miui/gallery/widget/menu/ImmersionMenuItem;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_2

    :cond_4
    iget-object v0, p3, Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter$TextHolder;->iconView:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    :cond_5
    :goto_2
    iget-object v0, p3, Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter$TextHolder;->informationText:Landroid/widget/TextView;

    if-eqz v0, :cond_7

    invoke-virtual {p1}, Lcom/miui/gallery/widget/menu/ImmersionMenuItem;->getInformation()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_6

    iget-object v0, p3, Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter$TextHolder;->informationText:Landroid/widget/TextView;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p3, Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter$TextHolder;->informationText:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/miui/gallery/widget/menu/ImmersionMenuItem;->getInformation()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_3

    :cond_6
    iget-object v0, p3, Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter$TextHolder;->informationText:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    :cond_7
    :goto_3
    iget-object v0, p3, Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter$TextHolder;->redDotView:Landroid/view/View;

    if-eqz v0, :cond_9

    iget-object p3, p3, Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter$TextHolder;->redDotView:Landroid/view/View;

    invoke-virtual {p1}, Lcom/miui/gallery/widget/menu/ImmersionMenuItem;->isRedDotDisplayed()Z

    move-result p1

    if-eqz p1, :cond_8

    goto :goto_4

    :cond_8
    const/4 v3, 0x4

    :goto_4
    invoke-virtual {p3, v3}, Landroid/view/View;->setVisibility(I)V

    :cond_9
    return-object p2
.end method

.method public getViewTypeCount()I
    .locals 1

    const/4 v0, 0x2

    return v0
.end method

.method public setOnItemCheckChangeListener(Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter$OnItemCheckChangeListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter;->mOnItemCheckChangeListener:Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter$OnItemCheckChangeListener;

    return-void
.end method

.method public toggleCheckableItem(Landroid/view/View;)V
    .locals 1

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    instance-of v0, p1, Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter$CheckableHolder;

    if-eqz v0, :cond_0

    check-cast p1, Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter$CheckableHolder;

    iget-object p1, p1, Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter$CheckableHolder;->checkBox:Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->performClick()Z

    :cond_0
    return-void
.end method

.method public update(Lcom/miui/gallery/widget/menu/ImmersionMenu;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter;->mVisibleItems:Ljava/util/ArrayList;

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter;->buildVisibleItems(Lcom/miui/gallery/widget/menu/ImmersionMenu;Ljava/util/ArrayList;)V

    invoke-virtual {p0}, Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter;->notifyDataSetChanged()V

    return-void
.end method
