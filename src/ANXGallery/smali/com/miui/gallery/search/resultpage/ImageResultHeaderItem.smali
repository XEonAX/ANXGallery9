.class public Lcom/miui/gallery/search/resultpage/ImageResultHeaderItem;
.super Landroid/widget/RelativeLayout;
.source "ImageResultHeaderItem.java"

# interfaces
.implements Lcom/miui/gallery/ui/CheckableView;


# instance fields
.field private mExpandIcon:Landroid/widget/ImageView;

.field private mExpandable:Z

.field protected mSelectGroupOrNot:Landroid/view/View;

.field protected mSelectGroupOrNotContainer:Landroid/view/View;

.field protected mSubTitle:Landroid/widget/TextView;

.field protected mTitle:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x3

    invoke-virtual {p0, p1}, Lcom/miui/gallery/search/resultpage/ImageResultHeaderItem;->setLayoutDirection(I)V

    return-void
.end method


# virtual methods
.method public bindData(Ljava/lang/String;Ljava/lang/String;ZILandroid/view/View$OnClickListener;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/ImageResultHeaderItem;->mTitle:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    const/4 v0, 0x0

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/ImageResultHeaderItem;->mSubTitle:Landroid/widget/TextView;

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/ImageResultHeaderItem;->mSubTitle:Landroid/widget/TextView;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/ImageResultHeaderItem;->mSubTitle:Landroid/widget/TextView;

    const/4 p2, 0x4

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setVisibility(I)V

    :goto_0
    iput-boolean p3, p0, Lcom/miui/gallery/search/resultpage/ImageResultHeaderItem;->mExpandable:Z

    iget-boolean p1, p0, Lcom/miui/gallery/search/resultpage/ImageResultHeaderItem;->mExpandable:Z

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/ImageResultHeaderItem;->mExpandIcon:Landroid/widget/ImageView;

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/ImageResultHeaderItem;->mExpandIcon:Landroid/widget/ImageView;

    invoke-virtual {p1, p4}, Landroid/widget/ImageView;->setImageResource(I)V

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/ImageResultHeaderItem;->mExpandIcon:Landroid/widget/ImageView;

    invoke-virtual {p1, p5}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_1

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/ImageResultHeaderItem;->mExpandIcon:Landroid/widget/ImageView;

    const/16 p2, 0x8

    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/ImageResultHeaderItem;->mExpandIcon:Landroid/widget/ImageView;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :goto_1
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

    const v0, 0x7f09015c

    invoke-virtual {p0, v0}, Lcom/miui/gallery/search/resultpage/ImageResultHeaderItem;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/miui/gallery/search/resultpage/ImageResultHeaderItem;->mTitle:Landroid/widget/TextView;

    const v0, 0x7f09015b

    invoke-virtual {p0, v0}, Lcom/miui/gallery/search/resultpage/ImageResultHeaderItem;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/miui/gallery/search/resultpage/ImageResultHeaderItem;->mSubTitle:Landroid/widget/TextView;

    const v0, 0x7f0900e4

    invoke-virtual {p0, v0}, Lcom/miui/gallery/search/resultpage/ImageResultHeaderItem;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/search/resultpage/ImageResultHeaderItem;->mSelectGroupOrNot:Landroid/view/View;

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/ImageResultHeaderItem;->mSelectGroupOrNot:Landroid/view/View;

    check-cast v0, Landroid/widget/TextView;

    sget v1, Lmiui/R$string;->select_all:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    const v0, 0x7f0900e5

    invoke-virtual {p0, v0}, Lcom/miui/gallery/search/resultpage/ImageResultHeaderItem;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/search/resultpage/ImageResultHeaderItem;->mSelectGroupOrNotContainer:Landroid/view/View;

    const v0, 0x7f090109

    invoke-virtual {p0, v0}, Lcom/miui/gallery/search/resultpage/ImageResultHeaderItem;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/miui/gallery/search/resultpage/ImageResultHeaderItem;->mExpandIcon:Landroid/widget/ImageView;

    return-void
.end method

.method public setCheckable(Z)V
    .locals 3

    const/4 v0, 0x0

    const/16 v1, 0x8

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/ImageResultHeaderItem;->mSelectGroupOrNotContainer:Landroid/view/View;

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/ImageResultHeaderItem;->mExpandIcon:Landroid/widget/ImageView;

    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_1

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/ImageResultHeaderItem;->mSelectGroupOrNotContainer:Landroid/view/View;

    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/ImageResultHeaderItem;->mExpandIcon:Landroid/widget/ImageView;

    iget-boolean v2, p0, Lcom/miui/gallery/search/resultpage/ImageResultHeaderItem;->mExpandable:Z

    if-eqz v2, :cond_1

    goto :goto_0

    :cond_1
    const/16 v0, 0x8

    :goto_0
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    :goto_1
    return-void
.end method

.method public setCheckableListener(Landroid/view/View$OnClickListener;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/ImageResultHeaderItem;->mSelectGroupOrNotContainer:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public setChecked(Z)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/ImageResultHeaderItem;->mSelectGroupOrNot:Landroid/view/View;

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/miui/gallery/search/resultpage/ImageResultHeaderItem;->getContext()Landroid/content/Context;

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
