.class Lcom/miui/gallery/card/ui/cardlist/CardAdapter$CardHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;
.source "CardAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/card/ui/cardlist/CardAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "CardHolder"
.end annotation


# instance fields
.field private final mAntiDoubleClickListener:Lcom/miui/gallery/widget/AntiDoubleClickListener;

.field private mCard:Lcom/miui/gallery/card/Card;

.field private final mCardCoverView:Lcom/miui/gallery/widget/CardCoverView;

.field private final mDescription:Landroid/widget/TextView;

.field private final mTitle:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/miui/gallery/card/ui/cardlist/CardAdapter;


# direct methods
.method constructor <init>(Lcom/miui/gallery/card/ui/cardlist/CardAdapter;Landroid/view/View;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/card/ui/cardlist/CardAdapter$CardHolder;->this$0:Lcom/miui/gallery/card/ui/cardlist/CardAdapter;

    invoke-direct {p0, p2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    new-instance p1, Lcom/miui/gallery/card/ui/cardlist/CardAdapter$CardHolder$1;

    invoke-direct {p1, p0}, Lcom/miui/gallery/card/ui/cardlist/CardAdapter$CardHolder$1;-><init>(Lcom/miui/gallery/card/ui/cardlist/CardAdapter$CardHolder;)V

    iput-object p1, p0, Lcom/miui/gallery/card/ui/cardlist/CardAdapter$CardHolder;->mAntiDoubleClickListener:Lcom/miui/gallery/widget/AntiDoubleClickListener;

    const p1, 0x7f090075

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/widget/CardCoverView;

    iput-object p1, p0, Lcom/miui/gallery/card/ui/cardlist/CardAdapter$CardHolder;->mCardCoverView:Lcom/miui/gallery/widget/CardCoverView;

    const p1, 0x7f0902fa

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/miui/gallery/card/ui/cardlist/CardAdapter$CardHolder;->mTitle:Landroid/widget/TextView;

    const p1, 0x7f0900d0

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/miui/gallery/card/ui/cardlist/CardAdapter$CardHolder;->mDescription:Landroid/widget/TextView;

    iget-object p1, p0, Lcom/miui/gallery/card/ui/cardlist/CardAdapter$CardHolder;->mCardCoverView:Lcom/miui/gallery/widget/CardCoverView;

    iget-object p2, p0, Lcom/miui/gallery/card/ui/cardlist/CardAdapter$CardHolder;->mAntiDoubleClickListener:Lcom/miui/gallery/widget/AntiDoubleClickListener;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/widget/CardCoverView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/card/ui/cardlist/CardAdapter$CardHolder;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/card/ui/cardlist/CardAdapter$CardHolder;->deliveryAction()V

    return-void
.end method

.method private deliveryAction()V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/card/ui/cardlist/CardAdapter$CardHolder;->mCard:Lcom/miui/gallery/card/Card;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/card/ui/cardlist/CardAdapter$CardHolder;->mCard:Lcom/miui/gallery/card/Card;

    invoke-virtual {v0}, Lcom/miui/gallery/card/Card;->getDetailUrl()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v0, "CardAdapter"

    const-string v1, "deliveryAction empty"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "card_id"

    iget-object v3, p0, Lcom/miui/gallery/card/ui/cardlist/CardAdapter$CardHolder;->mCard:Lcom/miui/gallery/card/Card;

    invoke-virtual {v3}, Lcom/miui/gallery/card/Card;->getId()J

    move-result-wide v3

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    const-string v2, "card_url"

    iget-object v3, p0, Lcom/miui/gallery/card/ui/cardlist/CardAdapter$CardHolder;->mCard:Lcom/miui/gallery/card/Card;

    invoke-virtual {v3}, Lcom/miui/gallery/card/Card;->getActionUrl()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v2, p0, Lcom/miui/gallery/card/ui/cardlist/CardAdapter$CardHolder;->this$0:Lcom/miui/gallery/card/ui/cardlist/CardAdapter;

    invoke-static {v2}, Lcom/miui/gallery/card/ui/cardlist/CardAdapter;->access$100(Lcom/miui/gallery/card/ui/cardlist/CardAdapter;)Landroid/app/Activity;

    move-result-object v2

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-static {v2, v0, v1}, Lcom/miui/gallery/util/ActionURIHandler;->handleUri(Landroid/app/Activity;Landroid/net/Uri;Landroid/os/Bundle;)V

    goto :goto_0

    :cond_1
    const-string v0, "CardAdapter"

    const-string v1, "card object is null"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    invoke-direct {p0}, Lcom/miui/gallery/card/ui/cardlist/CardAdapter$CardHolder;->recordCardClick()V

    return-void
.end method

.method private recordCardClick()V
    .locals 3

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "scenarioId"

    iget-object v2, p0, Lcom/miui/gallery/card/ui/cardlist/CardAdapter$CardHolder;->mCard:Lcom/miui/gallery/card/Card;

    invoke-virtual {v2}, Lcom/miui/gallery/card/Card;->getScenarioId()I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "assistant"

    const-string v2, "assistant_card_click"

    invoke-static {v1, v2, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method


# virtual methods
.method public bindData(Lcom/miui/gallery/card/Card;)V
    .locals 4

    if-eqz p1, :cond_5

    iput-object p1, p0, Lcom/miui/gallery/card/ui/cardlist/CardAdapter$CardHolder;->mCard:Lcom/miui/gallery/card/Card;

    iget-object v0, p0, Lcom/miui/gallery/card/ui/cardlist/CardAdapter$CardHolder;->this$0:Lcom/miui/gallery/card/ui/cardlist/CardAdapter;

    invoke-static {v0}, Lcom/miui/gallery/card/ui/cardlist/CardAdapter;->access$100(Lcom/miui/gallery/card/ui/cardlist/CardAdapter;)Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/card/Card;->getImageResId(Landroid/content/Context;)I

    move-result v0

    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->getImageUri()Landroid/net/Uri;

    move-result-object v1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/card/ui/cardlist/CardAdapter$CardHolder;->mCardCoverView:Lcom/miui/gallery/widget/CardCoverView;

    iget-object v3, p0, Lcom/miui/gallery/card/ui/cardlist/CardAdapter$CardHolder;->this$0:Lcom/miui/gallery/card/ui/cardlist/CardAdapter;

    iget-object v3, v3, Lcom/miui/gallery/card/ui/cardlist/CardAdapter;->mDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    invoke-virtual {v1, v0, v3}, Lcom/miui/gallery/widget/CardCoverView;->update(ILcom/nostra13/universalimageloader/core/DisplayImageOptions;)V

    goto :goto_1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/card/ui/cardlist/CardAdapter$CardHolder;->mCard:Lcom/miui/gallery/card/Card;

    invoke-virtual {v0}, Lcom/miui/gallery/card/Card;->getCoverMediaFeatureItems()Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/card/ui/cardlist/CardAdapter$CardHolder;->mCard:Lcom/miui/gallery/card/Card;

    invoke-virtual {v0}, Lcom/miui/gallery/card/Card;->getCoverMediaFeatureItems()Ljava/util/List;

    move-result-object v0

    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->getSelectedMediaSha1s()Ljava/util/List;

    move-result-object v1

    iget-object v3, p0, Lcom/miui/gallery/card/ui/cardlist/CardAdapter$CardHolder;->mCardCoverView:Lcom/miui/gallery/widget/CardCoverView;

    if-eqz v1, :cond_1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    invoke-virtual {v3, v1}, Lcom/miui/gallery/widget/CardCoverView;->setImageCount(I)V

    if-eqz v0, :cond_3

    iget-object v1, p0, Lcom/miui/gallery/card/ui/cardlist/CardAdapter$CardHolder;->mCardCoverView:Lcom/miui/gallery/widget/CardCoverView;

    iget-object v3, p0, Lcom/miui/gallery/card/ui/cardlist/CardAdapter$CardHolder;->this$0:Lcom/miui/gallery/card/ui/cardlist/CardAdapter;

    iget-object v3, v3, Lcom/miui/gallery/card/ui/cardlist/CardAdapter;->mDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    invoke-virtual {v1, v0, v3}, Lcom/miui/gallery/widget/CardCoverView;->update(Ljava/util/List;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)V

    goto :goto_1

    :cond_2
    invoke-static {}, Lcom/miui/gallery/card/CardManager;->getInstance()Lcom/miui/gallery/card/CardManager;

    move-result-object v0

    iget-object v3, p0, Lcom/miui/gallery/card/ui/cardlist/CardAdapter$CardHolder;->mCard:Lcom/miui/gallery/card/Card;

    invoke-virtual {v0, v3}, Lcom/miui/gallery/card/CardManager;->updateCard(Lcom/miui/gallery/card/Card;)V

    if-eqz v1, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/card/ui/cardlist/CardAdapter$CardHolder;->mCardCoverView:Lcom/miui/gallery/widget/CardCoverView;

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v3, p0, Lcom/miui/gallery/card/ui/cardlist/CardAdapter$CardHolder;->this$0:Lcom/miui/gallery/card/ui/cardlist/CardAdapter;

    iget-object v3, v3, Lcom/miui/gallery/card/ui/cardlist/CardAdapter;->mDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    invoke-virtual {v0, v1, v3}, Lcom/miui/gallery/widget/CardCoverView;->update(Ljava/lang/String;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)V

    :cond_3
    :goto_1
    iget-object v0, p0, Lcom/miui/gallery/card/ui/cardlist/CardAdapter$CardHolder;->mTitle:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->getTitle()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->getDescription()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_4

    iget-object p1, p0, Lcom/miui/gallery/card/ui/cardlist/CardAdapter$CardHolder;->mDescription:Landroid/widget/TextView;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_2

    :cond_4
    iget-object v0, p0, Lcom/miui/gallery/card/ui/cardlist/CardAdapter$CardHolder;->mDescription:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/miui/gallery/card/ui/cardlist/CardAdapter$CardHolder;->mDescription:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->getDescription()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_5
    :goto_2
    return-void
.end method
