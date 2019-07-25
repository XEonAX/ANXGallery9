.class public Lcom/miui/gallery/ui/RecentTimelineGridHeaderItem;
.super Landroid/widget/RelativeLayout;
.source "RecentTimelineGridHeaderItem.java"

# interfaces
.implements Lcom/miui/gallery/ui/CheckableView;


# instance fields
.field protected mAlbumFrom:Landroid/widget/TextView;

.field protected mDateTime:Landroid/widget/TextView;

.field protected mFileCount:Landroid/widget/TextView;

.field protected mSelectGroupOrNot:Landroid/view/View;

.field protected mSelectGroupOrNotContainer:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x3

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/RecentTimelineGridHeaderItem;->setLayoutDirection(I)V

    return-void
.end method


# virtual methods
.method protected bindAlbumFrom(Ljava/lang/String;Z)V
    .locals 5

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/RecentTimelineGridHeaderItem;->mAlbumFrom:Landroid/widget/TextView;

    const/16 p2, 0x8

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/RecentTimelineGridHeaderItem;->mAlbumFrom:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/miui/gallery/ui/RecentTimelineGridHeaderItem;->mAlbumFrom:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/RecentTimelineGridHeaderItem;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f100034

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    aput-object p1, v4, v1

    invoke-virtual {v2, v3, v4}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    if-eqz p2, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/RecentTimelineGridHeaderItem;->mAlbumFrom:Landroid/widget/TextView;

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    iget-object p1, p0, Lcom/miui/gallery/ui/RecentTimelineGridHeaderItem;->mAlbumFrom:Landroid/widget/TextView;

    invoke-virtual {p1, v1, v1, v1, v1}, Landroid/widget/TextView;->setCompoundDrawablesRelativeWithIntrinsicBounds(IIII)V

    :cond_1
    :goto_0
    return-void
.end method

.method public bindData(Ljava/lang/String;ILjava/lang/String;Z)V
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/RecentTimelineGridHeaderItem;->bindTimeLabel(Ljava/lang/String;)V

    invoke-virtual {p0, p2}, Lcom/miui/gallery/ui/RecentTimelineGridHeaderItem;->bindFileCount(I)V

    invoke-virtual {p0, p3, p4}, Lcom/miui/gallery/ui/RecentTimelineGridHeaderItem;->bindAlbumFrom(Ljava/lang/String;Z)V

    return-void
.end method

.method protected bindFileCount(I)V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/ui/RecentTimelineGridHeaderItem;->mFileCount:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/RecentTimelineGridHeaderItem;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const v3, 0x7f0e0035

    invoke-virtual {v1, v3, p1, v2}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method protected bindTimeLabel(Ljava/lang/String;)V
    .locals 1

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/RecentTimelineGridHeaderItem;->mDateTime:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/RecentTimelineGridHeaderItem;->mDateTime:Landroid/widget/TextView;

    const-string v0, ""

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_0
    return-void
.end method

.method public isChecked()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method protected onFinishInflate()V
    .locals 2

    invoke-super {p0}, Landroid/widget/RelativeLayout;->onFinishInflate()V

    const v0, 0x7f0900c2

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/RecentTimelineGridHeaderItem;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/miui/gallery/ui/RecentTimelineGridHeaderItem;->mDateTime:Landroid/widget/TextView;

    const v0, 0x7f090124

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/RecentTimelineGridHeaderItem;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/miui/gallery/ui/RecentTimelineGridHeaderItem;->mFileCount:Landroid/widget/TextView;

    const v0, 0x7f090036

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/RecentTimelineGridHeaderItem;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/miui/gallery/ui/RecentTimelineGridHeaderItem;->mAlbumFrom:Landroid/widget/TextView;

    const v0, 0x7f0900e4

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/RecentTimelineGridHeaderItem;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/ui/RecentTimelineGridHeaderItem;->mSelectGroupOrNot:Landroid/view/View;

    iget-object v0, p0, Lcom/miui/gallery/ui/RecentTimelineGridHeaderItem;->mSelectGroupOrNot:Landroid/view/View;

    check-cast v0, Landroid/widget/TextView;

    sget v1, Lmiui/R$string;->select_all:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    const v0, 0x7f0900e5

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/RecentTimelineGridHeaderItem;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/ui/RecentTimelineGridHeaderItem;->mSelectGroupOrNotContainer:Landroid/view/View;

    return-void
.end method

.method public setAlbumFromClickedListener(Landroid/view/View$OnClickListener;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/RecentTimelineGridHeaderItem;->mAlbumFrom:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public setCheckable(Z)V
    .locals 2

    const/16 v0, 0x8

    const/4 v1, 0x0

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/RecentTimelineGridHeaderItem;->mSelectGroupOrNotContainer:Landroid/view/View;

    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object p1, p0, Lcom/miui/gallery/ui/RecentTimelineGridHeaderItem;->mAlbumFrom:Landroid/widget/TextView;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/RecentTimelineGridHeaderItem;->mSelectGroupOrNotContainer:Landroid/view/View;

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    iget-object p1, p0, Lcom/miui/gallery/ui/RecentTimelineGridHeaderItem;->mAlbumFrom:Landroid/widget/TextView;

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setVisibility(I)V

    :goto_0
    return-void
.end method

.method public setCheckableListener(Landroid/view/View$OnClickListener;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/RecentTimelineGridHeaderItem;->mSelectGroupOrNotContainer:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public setChecked(Z)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/RecentTimelineGridHeaderItem;->mSelectGroupOrNot:Landroid/view/View;

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/RecentTimelineGridHeaderItem;->getContext()Landroid/content/Context;

    move-result-object v1

    if-eqz p1, :cond_0

    sget p1, Lmiui/R$string;->deselect_all:I

    goto :goto_0

    :cond_0
    sget p1, Lmiui/R$string;->select_all:I

    :goto_0
    invoke-virtual {v1, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public toggle()V
    .locals 0

    return-void
.end method
