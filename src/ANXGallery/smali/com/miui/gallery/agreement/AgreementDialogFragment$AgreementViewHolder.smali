.class Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementViewHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;
.source "AgreementDialogFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/agreement/AgreementDialogFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "AgreementViewHolder"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementViewHolder$OnCheckChangedListener;
    }
.end annotation


# instance fields
.field private mAgreement:Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;

.field mCheckBox:Landroid/widget/CheckBox;

.field private mCheckChangedListener:Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementViewHolder$OnCheckChangedListener;

.field mText:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 1

    invoke-direct {p0, p1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    sget v0, Lcom/miui/gallery/permission/R$id;->title:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementViewHolder;->mText:Landroid/widget/TextView;

    sget v0, Lcom/miui/gallery/permission/R$id;->checkbox:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/CheckBox;

    iput-object p1, p0, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementViewHolder;->mCheckBox:Landroid/widget/CheckBox;

    return-void
.end method

.method public static getView(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 2

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, p1, p0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method private parseAgreementText(Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;)Ljava/lang/CharSequence;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p1, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;->mText:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p1}, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;->access$200(Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    iget-boolean p1, p1, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;->mRequired:Z

    if-eqz p1, :cond_0

    sget p1, Lcom/miui/gallery/permission/R$string;->agreement_required_tip:I

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    :cond_0
    sget p1, Lcom/miui/gallery/permission/R$string;->agreement_optional_tip:I

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_1
    :goto_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method public bindAgreement(Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementViewHolder$OnCheckChangedListener;)V
    .locals 4

    iput-object p1, p0, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementViewHolder;->mAgreement:Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;

    iget-object v0, p0, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementViewHolder;->mText:Landroid/widget/TextView;

    invoke-direct {p0, p1}, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementViewHolder;->parseAgreementText(Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    iget-object v1, p1, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;->mLink:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementViewHolder;->mText:Landroid/widget/TextView;

    sget v3, Lcom/miui/gallery/permission/R$dimen;->agreement_item_arrow_padding:I

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    iget-object v0, p0, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v1, Lmiui/R$drawable;->arrow_right:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementViewHolder;->mText:Landroid/widget/TextView;

    invoke-virtual {v1, v2, v2, v0, v2}, Landroid/widget/TextView;->setCompoundDrawablesRelativeWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementViewHolder;->mText:Landroid/widget/TextView;

    invoke-virtual {v0, v2, v2, v2, v2}, Landroid/widget/TextView;->setCompoundDrawablesRelativeWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    :goto_0
    invoke-static {p1}, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;->access$200(Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementViewHolder;->mText:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v3, Lcom/miui/gallery/permission/R$style;->TextAppearance_PreferenceList:I

    invoke-virtual {v0, v1, v3}, Landroid/widget/TextView;->setTextAppearance(Landroid/content/Context;I)V

    goto :goto_1

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementViewHolder;->mText:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v3, Lcom/miui/gallery/permission/R$style;->TextAppearance_Agreement:I

    invoke-virtual {v0, v1, v3}, Landroid/widget/TextView;->setTextAppearance(Landroid/content/Context;I)V

    :goto_1
    iget-object v0, p1, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;->mLink:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementViewHolder;->mText:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_2

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementViewHolder;->mText:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :goto_2
    iget-object v0, p0, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementViewHolder;->mCheckBox:Landroid/widget/CheckBox;

    invoke-static {p1}, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;->access$100(Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;)Z

    move-result p1

    invoke-virtual {v0, p1}, Landroid/widget/CheckBox;->setChecked(Z)V

    iget-object p1, p0, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementViewHolder;->mCheckBox:Landroid/widget/CheckBox;

    invoke-virtual {p1, p0}, Landroid/widget/CheckBox;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iput-object p2, p0, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementViewHolder;->mCheckChangedListener:Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementViewHolder$OnCheckChangedListener;

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sget v1, Lcom/miui/gallery/permission/R$id;->title:I

    if-ne v0, v1, :cond_0

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementViewHolder;->mAgreement:Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;

    invoke-static {v0, v1}, Lcom/miui/gallery/agreement/AgreementsUtils;->viewAgreement(Landroid/content/Context;Lcom/miui/gallery/agreement/core/Agreement;)V

    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    sget v0, Lcom/miui/gallery/permission/R$id;->checkbox:I

    if-ne p1, v0, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementViewHolder;->mAgreement:Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;

    iget-object v0, p0, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementViewHolder;->mCheckBox:Landroid/widget/CheckBox;

    invoke-virtual {v0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v0

    invoke-static {p1, v0}, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;->access$102(Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;Z)Z

    iget-object p1, p0, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementViewHolder;->mCheckChangedListener:Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementViewHolder$OnCheckChangedListener;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementViewHolder;->mCheckChangedListener:Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementViewHolder$OnCheckChangedListener;

    iget-object v0, p0, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementViewHolder;->mAgreement:Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;

    invoke-interface {p1, v0}, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementViewHolder$OnCheckChangedListener;->onCheckChanged(Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;)V

    :cond_1
    return-void
.end method
