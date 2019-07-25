.class Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementDialog$AgreementAdapter;
.super Landroid/support/v7/widget/RecyclerView$Adapter;
.source "AgreementDialogFragment.java"

# interfaces
.implements Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementViewHolder$OnCheckChangedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AgreementAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/v7/widget/RecyclerView$Adapter<",
        "Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementViewHolder;",
        ">;",
        "Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementViewHolder$OnCheckChangedListener;"
    }
.end annotation


# instance fields
.field private mAgreements:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementDialog;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementDialog;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementDialog$AgreementAdapter;->this$0:Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementDialog;

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementDialog$AgreementAdapter;->mAgreements:Ljava/util/List;

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementDialog;Lcom/miui/gallery/agreement/AgreementDialogFragment$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementDialog$AgreementAdapter;-><init>(Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementDialog;)V

    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementDialog$AgreementAdapter;->mAgreements:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    check-cast p1, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementDialog$AgreementAdapter;->onBindViewHolder(Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementViewHolder;I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementDialog$AgreementAdapter;->mAgreements:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;

    invoke-virtual {p1, p2, p0}, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementViewHolder;->bindAgreement(Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementViewHolder$OnCheckChangedListener;)V

    return-void
.end method

.method public onCheckChanged(Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;)V
    .locals 7

    invoke-static {p1}, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;->access$200(Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;)Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementDialog$AgreementAdapter;->mAgreements:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v3, 0x0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_8

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;

    invoke-static {v4}, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;->access$100(Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;)Z

    move-result v5

    invoke-static {p1}, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;->access$100(Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;)Z

    move-result v6

    if-eq v5, v6, :cond_0

    invoke-static {p1}, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;->access$100(Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;)Z

    move-result v3

    invoke-static {v4, v3}, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;->access$102(Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;Z)Z

    const/4 v3, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    iget-object v3, p0, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementDialog$AgreementAdapter;->mAgreements:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    move-object v4, v0

    const/4 v0, 0x1

    :cond_2
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;

    invoke-static {v5}, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;->access$200(Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;)Z

    move-result v6

    if-nez v6, :cond_3

    invoke-static {p1}, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;->access$100(Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;)Z

    move-result v6

    invoke-static {v5}, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;->access$100(Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;)Z

    move-result v5

    if-eq v6, v5, :cond_2

    const/4 v0, 0x0

    goto :goto_1

    :cond_3
    move-object v4, v5

    goto :goto_1

    :cond_4
    if-eqz v0, :cond_6

    invoke-static {v4}, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;->access$100(Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;)Z

    move-result v0

    invoke-static {p1}, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;->access$100(Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;)Z

    move-result v3

    if-eq v0, v3, :cond_5

    const/4 v3, 0x1

    goto :goto_2

    :cond_5
    const/4 v3, 0x0

    :goto_2
    invoke-static {p1}, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;->access$100(Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;)Z

    move-result p1

    invoke-static {v4, p1}, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;->access$102(Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;Z)Z

    goto :goto_4

    :cond_6
    invoke-static {v4}, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;->access$100(Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;)Z

    move-result p1

    if-ne p1, v1, :cond_7

    const/4 v3, 0x1

    goto :goto_3

    :cond_7
    const/4 v3, 0x0

    :goto_3
    invoke-static {v4, v2}, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;->access$102(Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;Z)Z

    :cond_8
    :goto_4
    if-eqz v3, :cond_9

    invoke-virtual {p0}, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementDialog$AgreementAdapter;->notifyDataSetChanged()V

    :cond_9
    iget-object p1, p0, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementDialog$AgreementAdapter;->mAgreements:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_a
    :goto_5
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_b

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;

    iget-boolean v3, v0, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;->mRequired:Z

    if-eqz v3, :cond_a

    invoke-static {v0}, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;->access$100(Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;)Z

    move-result v0

    if-nez v0, :cond_a

    const/4 v1, 0x0

    goto :goto_5

    :cond_b
    iget-object p1, p0, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementDialog$AgreementAdapter;->this$0:Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementDialog;

    invoke-virtual {p1, v1}, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementDialog;->setActionButtonEnabled(Z)V

    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementDialog$AgreementAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementViewHolder;

    move-result-object p1

    return-object p1
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementViewHolder;
    .locals 1

    new-instance p2, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementViewHolder;

    sget v0, Lcom/miui/gallery/permission/R$layout;->user_agreement_item:I

    invoke-static {p1, v0}, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementViewHolder;->getView(Landroid/view/ViewGroup;I)Landroid/view/View;

    move-result-object p1

    invoke-direct {p2, p1}, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementViewHolder;-><init>(Landroid/view/View;)V

    return-object p2
.end method

.method public setAgreements(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/agreement/core/Agreement;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementDialog$AgreementAdapter;->mAgreements:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    if-eqz p1, :cond_1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/agreement/core/Agreement;

    new-instance v3, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;

    invoke-direct {v3, v0, v2}, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;-><init>(Lcom/miui/gallery/agreement/core/Agreement;Z)V

    invoke-static {v3, v1}, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;->access$102(Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;Z)Z

    iget-object v0, p0, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementDialog$AgreementAdapter;->mAgreements:Ljava/util/List;

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementDialog$AgreementAdapter;->mAgreements:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_1

    new-instance p1, Lcom/miui/gallery/agreement/core/Agreement;

    iget-object v0, p0, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementDialog$AgreementAdapter;->this$0:Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementDialog;

    invoke-virtual {v0}, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementDialog;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v3, Lcom/miui/gallery/permission/R$string;->select_all:I

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v3, 0x0

    invoke-direct {p1, v0, v3, v2}, Lcom/miui/gallery/agreement/core/Agreement;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    new-instance v0, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;

    invoke-direct {v0, p1, v1}, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;-><init>(Lcom/miui/gallery/agreement/core/Agreement;Z)V

    invoke-static {v0, v1}, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;->access$102(Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;Z)Z

    iget-object p1, p0, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementDialog$AgreementAdapter;->mAgreements:Ljava/util/List;

    invoke-interface {p1, v2, v0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementDialog$AgreementAdapter;->notifyDataSetChanged()V

    return-void
.end method
