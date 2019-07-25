.class Lcom/miui/gallery/ui/CloudSpaceStatusFragment$StatusAdapter;
.super Landroid/widget/BaseAdapter;
.source "CloudSpaceStatusFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/CloudSpaceStatusFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "StatusAdapter"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/CloudSpaceStatusFragment$StatusAdapter$ViewHolder;
    }
.end annotation


# instance fields
.field private mList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/ui/CloudSpaceStatusFragment$DataItem;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/miui/gallery/ui/CloudSpaceStatusFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/CloudSpaceStatusFragment;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/ui/CloudSpaceStatusFragment$DataItem;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$StatusAdapter;->this$0:Lcom/miui/gallery/ui/CloudSpaceStatusFragment;

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    iput-object p2, p0, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$StatusAdapter;->mList:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$StatusAdapter;->mList:Ljava/util/List;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$StatusAdapter;->mList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    :goto_0
    return v0
.end method

.method public getItem(I)Lcom/miui/gallery/ui/CloudSpaceStatusFragment$DataItem;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$StatusAdapter;->mList:Ljava/util/List;

    if-eqz v0, :cond_0

    const/4 v0, -0x1

    if-le p1, v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$StatusAdapter;->mList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge p1, v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$StatusAdapter;->mList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$DataItem;

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$StatusAdapter;->getItem(I)Lcom/miui/gallery/ui/CloudSpaceStatusFragment$DataItem;

    move-result-object p1

    return-object p1
.end method

.method public getItemId(I)J
    .locals 2

    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 5

    const/4 v0, 0x0

    const/4 v1, 0x0

    if-nez p2, :cond_0

    iget-object p2, p0, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$StatusAdapter;->this$0:Lcom/miui/gallery/ui/CloudSpaceStatusFragment;

    invoke-virtual {p2}, Lcom/miui/gallery/ui/CloudSpaceStatusFragment;->getActivity()Landroid/app/Activity;

    move-result-object p2

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    const v2, 0x7f0b004f

    invoke-virtual {p2, v2, p3, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    new-instance p3, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$StatusAdapter$ViewHolder;

    invoke-direct {p3, p0, v0}, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$StatusAdapter$ViewHolder;-><init>(Lcom/miui/gallery/ui/CloudSpaceStatusFragment$StatusAdapter;Lcom/miui/gallery/ui/CloudSpaceStatusFragment$1;)V

    const v2, 0x7f0902fa

    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p3, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$StatusAdapter$ViewHolder;->mTitle:Landroid/widget/TextView;

    const v2, 0x7f0902fc

    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, p3, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$StatusAdapter$ViewHolder;->mTitleDivider:Landroid/view/View;

    const v2, 0x7f09004b

    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p3, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$StatusAdapter$ViewHolder;->mAppendTitle:Landroid/widget/TextView;

    const v2, 0x7f0902c3

    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p3, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$StatusAdapter$ViewHolder;->mSummary:Landroid/widget/TextView;

    const v2, 0x7f0902c5

    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, p3, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$StatusAdapter$ViewHolder;->mSummayDivider:Landroid/view/View;

    const v2, 0x7f09004a

    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p3, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$StatusAdapter$ViewHolder;->mAppendSummary:Landroid/widget/TextView;

    const v2, 0x7f090320

    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p3, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$StatusAdapter$ViewHolder;->mValue:Landroid/widget/TextView;

    const v2, 0x7f09004c

    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, p3, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$StatusAdapter$ViewHolder;->mRightArrow:Landroid/view/View;

    invoke-virtual {p2, p3}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    :cond_0
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$StatusAdapter$ViewHolder;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$StatusAdapter;->getItem(I)Lcom/miui/gallery/ui/CloudSpaceStatusFragment$DataItem;

    move-result-object p1

    if-eqz p1, :cond_7

    iget-object v2, p3, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$StatusAdapter$ViewHolder;->mTitle:Landroid/widget/TextView;

    iget-object v3, p1, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$DataItem;->mTitle:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v2, p1, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$DataItem;->mAppendTitle:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    const/16 v3, 0x8

    if-nez v2, :cond_1

    iget-object v2, p3, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$StatusAdapter$ViewHolder;->mAppendTitle:Landroid/widget/TextView;

    iget-object v4, p1, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$DataItem;->mAppendTitle:Ljava/lang/String;

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v2, p3, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$StatusAdapter$ViewHolder;->mTitleDivider:Landroid/view/View;

    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v2, p3, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$StatusAdapter$ViewHolder;->mAppendTitle:Landroid/widget/TextView;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0

    :cond_1
    iget-object v2, p3, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$StatusAdapter$ViewHolder;->mTitleDivider:Landroid/view/View;

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    iget-object v2, p3, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$StatusAdapter$ViewHolder;->mAppendTitle:Landroid/widget/TextView;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setVisibility(I)V

    :goto_0
    iget-object v2, p1, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$DataItem;->mSummary:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_3

    iget-object v2, p3, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$StatusAdapter$ViewHolder;->mSummary:Landroid/widget/TextView;

    iget-object v4, p1, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$DataItem;->mSummary:Ljava/lang/String;

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v2, p3, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$StatusAdapter$ViewHolder;->mSummary:Landroid/widget/TextView;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v2, p1, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$DataItem;->mAppendSummary:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_2

    iget-object v2, p3, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$StatusAdapter$ViewHolder;->mAppendSummary:Landroid/widget/TextView;

    iget-object v4, p1, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$DataItem;->mAppendSummary:Ljava/lang/String;

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v2, p3, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$StatusAdapter$ViewHolder;->mSummayDivider:Landroid/view/View;

    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v2, p3, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$StatusAdapter$ViewHolder;->mAppendSummary:Landroid/widget/TextView;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_1

    :cond_2
    iget-object v2, p3, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$StatusAdapter$ViewHolder;->mSummayDivider:Landroid/view/View;

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    iget-object v2, p3, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$StatusAdapter$ViewHolder;->mAppendSummary:Landroid/widget/TextView;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_1

    :cond_3
    iget-object v2, p3, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$StatusAdapter$ViewHolder;->mSummary:Landroid/widget/TextView;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v2, p3, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$StatusAdapter$ViewHolder;->mSummayDivider:Landroid/view/View;

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    iget-object v2, p3, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$StatusAdapter$ViewHolder;->mAppendSummary:Landroid/widget/TextView;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setVisibility(I)V

    :goto_1
    iget-object v2, p1, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$DataItem;->mValue:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_4

    iget-object v2, p3, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$StatusAdapter$ViewHolder;->mValue:Landroid/widget/TextView;

    iget-object v4, p1, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$DataItem;->mValue:Ljava/lang/String;

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v2, p3, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$StatusAdapter$ViewHolder;->mValue:Landroid/widget/TextView;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_2

    :cond_4
    iget-object v2, p3, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$StatusAdapter$ViewHolder;->mValue:Landroid/widget/TextView;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setVisibility(I)V

    :goto_2
    iget-object p3, p3, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$StatusAdapter$ViewHolder;->mRightArrow:Landroid/view/View;

    iget-boolean v2, p1, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$DataItem;->mIsShowArrow:Z

    if-eqz v2, :cond_5

    goto :goto_3

    :cond_5
    const/16 v1, 0x8

    :goto_3
    invoke-virtual {p3, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object p3, p1, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$DataItem;->mClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {p2, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p1, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$DataItem;->mClickListener:Landroid/view/View$OnClickListener;

    if-nez p1, :cond_6

    new-instance p1, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$StatusAdapter$1;

    invoke-direct {p1, p0}, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$StatusAdapter$1;-><init>(Lcom/miui/gallery/ui/CloudSpaceStatusFragment$StatusAdapter;)V

    invoke-virtual {p2, p1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    goto :goto_4

    :cond_6
    invoke-virtual {p2, v0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    :cond_7
    :goto_4
    return-object p2
.end method
