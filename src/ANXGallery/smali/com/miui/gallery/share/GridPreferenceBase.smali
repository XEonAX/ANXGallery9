.class public abstract Lcom/miui/gallery/share/GridPreferenceBase;
.super Landroid/preference/Preference;
.source "GridPreferenceBase.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/share/GridPreferenceBase$MyDataSetObserver;,
        Lcom/miui/gallery/share/GridPreferenceBase$OnItemClickListener;
    }
.end annotation


# instance fields
.field protected mAdapter:Landroid/widget/ListAdapter;

.field protected final mClickListener:Landroid/view/View$OnClickListener;

.field protected mColumnCount:I

.field protected mColumnWidth:I

.field private mDataSetObserver:Landroid/database/DataSetObserver;

.field private mItemClickListener:Lcom/miui/gallery/share/GridPreferenceBase$OnItemClickListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/share/GridPreferenceBase;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/miui/gallery/share/GridPreferenceBase;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Landroid/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance p1, Lcom/miui/gallery/share/GridPreferenceBase$1;

    invoke-direct {p1, p0}, Lcom/miui/gallery/share/GridPreferenceBase$1;-><init>(Lcom/miui/gallery/share/GridPreferenceBase;)V

    iput-object p1, p0, Lcom/miui/gallery/share/GridPreferenceBase;->mClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {p0}, Lcom/miui/gallery/share/GridPreferenceBase;->getLayoutResourceId()I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/share/GridPreferenceBase;->setLayoutResource(I)V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/share/GridPreferenceBase;)Lcom/miui/gallery/share/GridPreferenceBase$OnItemClickListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/share/GridPreferenceBase;->mItemClickListener:Lcom/miui/gallery/share/GridPreferenceBase$OnItemClickListener;

    return-object p0
.end method


# virtual methods
.method protected abstract getLayoutResourceId()I
.end method

.method protected getTagInfo()I
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/share/GridPreferenceBase;->getLayoutResourceId()I

    move-result v0

    return v0
.end method

.method protected onBindView(Landroid/view/View;)V
    .locals 0

    invoke-super {p0, p1}, Landroid/preference/Preference;->onBindView(Landroid/view/View;)V

    invoke-virtual {p0, p1}, Lcom/miui/gallery/share/GridPreferenceBase;->updateGrid(Landroid/view/View;)V

    return-void
.end method

.method public setAdapter(Landroid/widget/ListAdapter;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/share/GridPreferenceBase;->mAdapter:Landroid/widget/ListAdapter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/share/GridPreferenceBase;->mDataSetObserver:Landroid/database/DataSetObserver;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/share/GridPreferenceBase;->mAdapter:Landroid/widget/ListAdapter;

    iget-object v1, p0, Lcom/miui/gallery/share/GridPreferenceBase;->mDataSetObserver:Landroid/database/DataSetObserver;

    invoke-interface {v0, v1}, Landroid/widget/ListAdapter;->unregisterDataSetObserver(Landroid/database/DataSetObserver;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/share/GridPreferenceBase;->mDataSetObserver:Landroid/database/DataSetObserver;

    :cond_0
    iput-object p1, p0, Lcom/miui/gallery/share/GridPreferenceBase;->mAdapter:Landroid/widget/ListAdapter;

    iget-object p1, p0, Lcom/miui/gallery/share/GridPreferenceBase;->mAdapter:Landroid/widget/ListAdapter;

    if-eqz p1, :cond_1

    new-instance p1, Lcom/miui/gallery/share/GridPreferenceBase$MyDataSetObserver;

    invoke-direct {p1, p0}, Lcom/miui/gallery/share/GridPreferenceBase$MyDataSetObserver;-><init>(Lcom/miui/gallery/share/GridPreferenceBase;)V

    iput-object p1, p0, Lcom/miui/gallery/share/GridPreferenceBase;->mDataSetObserver:Landroid/database/DataSetObserver;

    iget-object p1, p0, Lcom/miui/gallery/share/GridPreferenceBase;->mAdapter:Landroid/widget/ListAdapter;

    iget-object v0, p0, Lcom/miui/gallery/share/GridPreferenceBase;->mDataSetObserver:Landroid/database/DataSetObserver;

    invoke-interface {p1, v0}, Landroid/widget/ListAdapter;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/share/GridPreferenceBase;->update()V

    return-void
.end method

.method public setColumnCountAndWidth(II)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/share/GridPreferenceBase;->mColumnCount:I

    iput p2, p0, Lcom/miui/gallery/share/GridPreferenceBase;->mColumnWidth:I

    invoke-virtual {p0}, Lcom/miui/gallery/share/GridPreferenceBase;->notifyChanged()V

    return-void
.end method

.method public setOnItemClickListener(Lcom/miui/gallery/share/GridPreferenceBase$OnItemClickListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/share/GridPreferenceBase;->mItemClickListener:Lcom/miui/gallery/share/GridPreferenceBase$OnItemClickListener;

    return-void
.end method

.method public update()V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/share/GridPreferenceBase;->notifyChanged()V

    return-void
.end method

.method protected abstract updateGrid(Landroid/view/View;)V
.end method
