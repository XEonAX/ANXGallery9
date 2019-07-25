.class public Lcom/miui/gallery/ui/PeoplePageGridHeaderItem;
.super Landroid/widget/RelativeLayout;
.source "PeoplePageGridHeaderItem.java"


# instance fields
.field protected mGroupName:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method public bindData(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PeoplePageGridHeaderItem;->mGroupName:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method protected onFinishInflate()V
    .locals 1

    invoke-super {p0}, Landroid/widget/RelativeLayout;->onFinishInflate()V

    const v0, 0x7f09014e

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/PeoplePageGridHeaderItem;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/miui/gallery/ui/PeoplePageGridHeaderItem;->mGroupName:Landroid/widget/TextView;

    return-void
.end method
