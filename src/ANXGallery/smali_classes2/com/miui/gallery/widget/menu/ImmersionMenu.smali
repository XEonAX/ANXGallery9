.class public Lcom/miui/gallery/widget/menu/ImmersionMenu;
.super Ljava/lang/Object;
.source "ImmersionMenu.java"


# instance fields
.field private mContext:Landroid/content/Context;

.field private mItems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/widget/menu/ImmersionMenuItem;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/widget/menu/ImmersionMenu;->mItems:Ljava/util/ArrayList;

    iput-object p1, p0, Lcom/miui/gallery/widget/menu/ImmersionMenu;->mContext:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public add(ILjava/lang/CharSequence;)Lcom/miui/gallery/widget/menu/ImmersionMenuItem;
    .locals 1

    const/4 v0, -0x1

    invoke-virtual {p0, p1, p2, v0}, Lcom/miui/gallery/widget/menu/ImmersionMenu;->add(ILjava/lang/CharSequence;I)Lcom/miui/gallery/widget/menu/ImmersionMenuItem;

    move-result-object p1

    return-object p1
.end method

.method public add(ILjava/lang/CharSequence;I)Lcom/miui/gallery/widget/menu/ImmersionMenuItem;
    .locals 2

    new-instance v0, Lcom/miui/gallery/widget/menu/ImmersionMenuItem;

    iget-object v1, p0, Lcom/miui/gallery/widget/menu/ImmersionMenu;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1, p1, p2}, Lcom/miui/gallery/widget/menu/ImmersionMenuItem;-><init>(Landroid/content/Context;ILjava/lang/CharSequence;)V

    if-ltz p3, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/widget/menu/ImmersionMenu;->mItems:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-gt p3, p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/widget/menu/ImmersionMenu;->mItems:Ljava/util/ArrayList;

    invoke-virtual {p1, p3, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/widget/menu/ImmersionMenu;->mItems:Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_0
    return-object v0
.end method

.method public findItem(I)Lcom/miui/gallery/widget/menu/ImmersionMenuItem;
    .locals 4

    invoke-virtual {p0}, Lcom/miui/gallery/widget/menu/ImmersionMenu;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_2

    iget-object v2, p0, Lcom/miui/gallery/widget/menu/ImmersionMenu;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/widget/menu/ImmersionMenuItem;

    invoke-virtual {v2}, Lcom/miui/gallery/widget/menu/ImmersionMenuItem;->getItemId()I

    move-result v3

    if-ne v3, p1, :cond_0

    return-object v2

    :cond_0
    invoke-virtual {v2}, Lcom/miui/gallery/widget/menu/ImmersionMenuItem;->hasSubMenu()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {v2}, Lcom/miui/gallery/widget/menu/ImmersionMenuItem;->getSubMenu()Lcom/miui/gallery/widget/menu/ImmersionSubMenu;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/miui/gallery/widget/menu/ImmersionSubMenu;->findItem(I)Lcom/miui/gallery/widget/menu/ImmersionMenuItem;

    move-result-object v2

    if-eqz v2, :cond_1

    return-object v2

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    const/4 p1, 0x0

    return-object p1
.end method

.method public getItem(I)Lcom/miui/gallery/widget/menu/ImmersionMenuItem;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/menu/ImmersionMenu;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/widget/menu/ImmersionMenuItem;

    return-object p1
.end method

.method public size()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/menu/ImmersionMenu;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method
