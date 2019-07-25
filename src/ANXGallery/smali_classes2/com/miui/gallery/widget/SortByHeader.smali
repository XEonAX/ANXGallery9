.class public Lcom/miui/gallery/widget/SortByHeader;
.super Landroid/widget/LinearLayout;
.source "SortByHeader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/widget/SortByHeader$SortBy;
    }
.end annotation


# instance fields
.field private mDateTimeContainer:Landroid/view/View;

.field private mNameContainer:Landroid/view/View;

.field private mOnSortByClickListener:Landroid/view/View$OnClickListener;

.field private mSizeContainer:Landroid/view/View;

.field private mSortByDateArrow:Landroid/widget/ImageView;

.field private mSortByDateTime:Landroid/widget/TextView;

.field private mSortByFileName:Landroid/widget/TextView;

.field private mSortByFileSize:Landroid/widget/TextView;

.field private mSortByNameArrow:Landroid/widget/ImageView;

.field private mSortBySizeArrow:Landroid/widget/ImageView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method private setSortByDateSelected(ZI)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/SortByHeader;->mDateTimeContainer:Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/SortByHeader;->mSortByDateTime:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setSelected(Z)V

    iget-object v0, p0, Lcom/miui/gallery/widget/SortByHeader;->mSortByDateArrow:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setSelected(Z)V

    iget-object p1, p0, Lcom/miui/gallery/widget/SortByHeader;->mSortByDateArrow:Landroid/widget/ImageView;

    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    :cond_0
    return-void
.end method

.method private setSortByNameSelected(ZI)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/SortByHeader;->mNameContainer:Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/SortByHeader;->mSortByFileName:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setSelected(Z)V

    iget-object v0, p0, Lcom/miui/gallery/widget/SortByHeader;->mSortByNameArrow:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setSelected(Z)V

    iget-object p1, p0, Lcom/miui/gallery/widget/SortByHeader;->mSortByNameArrow:Landroid/widget/ImageView;

    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    :cond_0
    return-void
.end method

.method private setSortBySizeSelected(ZI)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/SortByHeader;->mSizeContainer:Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/SortByHeader;->mSortByFileSize:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setSelected(Z)V

    iget-object v0, p0, Lcom/miui/gallery/widget/SortByHeader;->mSortBySizeArrow:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setSelected(Z)V

    iget-object p1, p0, Lcom/miui/gallery/widget/SortByHeader;->mSortBySizeArrow:Landroid/widget/ImageView;

    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    :cond_0
    return-void
.end method


# virtual methods
.method protected onFinishInflate()V
    .locals 1

    invoke-super {p0}, Landroid/widget/LinearLayout;->onFinishInflate()V

    const v0, 0x7f0900c3

    invoke-virtual {p0, v0}, Lcom/miui/gallery/widget/SortByHeader;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/widget/SortByHeader;->mDateTimeContainer:Landroid/view/View;

    const v0, 0x7f0901eb

    invoke-virtual {p0, v0}, Lcom/miui/gallery/widget/SortByHeader;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/widget/SortByHeader;->mNameContainer:Landroid/view/View;

    const v0, 0x7f0902ab

    invoke-virtual {p0, v0}, Lcom/miui/gallery/widget/SortByHeader;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/widget/SortByHeader;->mSizeContainer:Landroid/view/View;

    const v0, 0x7f0900c2

    invoke-virtual {p0, v0}, Lcom/miui/gallery/widget/SortByHeader;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/miui/gallery/widget/SortByHeader;->mSortByDateTime:Landroid/widget/TextView;

    const v0, 0x7f0900c4

    invoke-virtual {p0, v0}, Lcom/miui/gallery/widget/SortByHeader;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/miui/gallery/widget/SortByHeader;->mSortByDateArrow:Landroid/widget/ImageView;

    const v0, 0x7f0901ea

    invoke-virtual {p0, v0}, Lcom/miui/gallery/widget/SortByHeader;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/miui/gallery/widget/SortByHeader;->mSortByFileName:Landroid/widget/TextView;

    const v0, 0x7f0901ec

    invoke-virtual {p0, v0}, Lcom/miui/gallery/widget/SortByHeader;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/miui/gallery/widget/SortByHeader;->mSortByNameArrow:Landroid/widget/ImageView;

    const v0, 0x7f0902aa

    invoke-virtual {p0, v0}, Lcom/miui/gallery/widget/SortByHeader;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/miui/gallery/widget/SortByHeader;->mSortByFileSize:Landroid/widget/TextView;

    const v0, 0x7f0902ac

    invoke-virtual {p0, v0}, Lcom/miui/gallery/widget/SortByHeader;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/miui/gallery/widget/SortByHeader;->mSortBySizeArrow:Landroid/widget/ImageView;

    return-void
.end method

.method public setOnSortByClickListener(Landroid/view/View$OnClickListener;)V
    .locals 1

    iput-object p1, p0, Lcom/miui/gallery/widget/SortByHeader;->mOnSortByClickListener:Landroid/view/View$OnClickListener;

    iget-object p1, p0, Lcom/miui/gallery/widget/SortByHeader;->mDateTimeContainer:Landroid/view/View;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/widget/SortByHeader;->mDateTimeContainer:Landroid/view/View;

    iget-object v0, p0, Lcom/miui/gallery/widget/SortByHeader;->mOnSortByClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/widget/SortByHeader;->mNameContainer:Landroid/view/View;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/widget/SortByHeader;->mNameContainer:Landroid/view/View;

    iget-object v0, p0, Lcom/miui/gallery/widget/SortByHeader;->mOnSortByClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/widget/SortByHeader;->mSizeContainer:Landroid/view/View;

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/widget/SortByHeader;->mSizeContainer:Landroid/view/View;

    iget-object v0, p0, Lcom/miui/gallery/widget/SortByHeader;->mOnSortByClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_2
    return-void
.end method

.method public updateCurrentSortView(Lcom/miui/gallery/widget/SortByHeader$SortBy;I)V
    .locals 3

    sget-object v0, Lcom/miui/gallery/widget/SortByHeader$1;->$SwitchMap$com$miui$gallery$widget$SortByHeader$SortBy:[I

    invoke-virtual {p1}, Lcom/miui/gallery/widget/SortByHeader$SortBy;->ordinal()I

    move-result p1

    aget p1, v0, p1

    const/4 v0, 0x1

    const v1, 0x7f07026b

    const/4 v2, 0x0

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    invoke-direct {p0, v0, p2}, Lcom/miui/gallery/widget/SortByHeader;->setSortByNameSelected(ZI)V

    invoke-direct {p0, v2, v1}, Lcom/miui/gallery/widget/SortByHeader;->setSortBySizeSelected(ZI)V

    invoke-direct {p0, v2, v1}, Lcom/miui/gallery/widget/SortByHeader;->setSortByDateSelected(ZI)V

    goto :goto_0

    :pswitch_1
    invoke-direct {p0, v0, p2}, Lcom/miui/gallery/widget/SortByHeader;->setSortByDateSelected(ZI)V

    invoke-direct {p0, v2, v1}, Lcom/miui/gallery/widget/SortByHeader;->setSortBySizeSelected(ZI)V

    invoke-direct {p0, v2, v1}, Lcom/miui/gallery/widget/SortByHeader;->setSortByNameSelected(ZI)V

    goto :goto_0

    :pswitch_2
    invoke-direct {p0, v0, p2}, Lcom/miui/gallery/widget/SortByHeader;->setSortBySizeSelected(ZI)V

    invoke-direct {p0, v2, v1}, Lcom/miui/gallery/widget/SortByHeader;->setSortByDateSelected(ZI)V

    invoke-direct {p0, v2, v1}, Lcom/miui/gallery/widget/SortByHeader;->setSortByNameSelected(ZI)V

    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
