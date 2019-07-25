.class public Lcom/miui/gallery/share/DescriptPreference;
.super Landroid/preference/Preference;
.source "DescriptPreference.java"


# instance fields
.field private mDescriptDetail:Ljava/lang/CharSequence;

.field private mDescriptDetailVisibility:I

.field private mDescriptTitle:Ljava/lang/CharSequence;

.field private mDescriptTitleVisibility:I

.field private mRootRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/miui/gallery/share/DescriptPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Landroid/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    iput p1, p0, Lcom/miui/gallery/share/DescriptPreference;->mDescriptTitleVisibility:I

    const/16 p2, 0x8

    iput p2, p0, Lcom/miui/gallery/share/DescriptPreference;->mDescriptDetailVisibility:I

    const p2, 0x7f0b0157

    invoke-virtual {p0, p2}, Lcom/miui/gallery/share/DescriptPreference;->setLayoutResource(I)V

    invoke-virtual {p0, p1}, Lcom/miui/gallery/share/DescriptPreference;->setPersistent(Z)V

    return-void
.end method

.method private refresh()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/share/DescriptPreference;->mRootRef:Ljava/lang/ref/WeakReference;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/share/DescriptPreference;->mRootRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    if-nez v0, :cond_1

    return-void

    :cond_1
    const v1, 0x7f0900cf

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iget v2, p0, Lcom/miui/gallery/share/DescriptPreference;->mDescriptTitleVisibility:I

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v2, p0, Lcom/miui/gallery/share/DescriptPreference;->mDescriptTitle:Ljava/lang/CharSequence;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v1, 0x7f0900ce

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget v1, p0, Lcom/miui/gallery/share/DescriptPreference;->mDescriptDetailVisibility:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v1, p0, Lcom/miui/gallery/share/DescriptPreference;->mDescriptDetail:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method


# virtual methods
.method protected onBindView(Landroid/view/View;)V
    .locals 1

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/miui/gallery/share/DescriptPreference;->mRootRef:Ljava/lang/ref/WeakReference;

    invoke-direct {p0}, Lcom/miui/gallery/share/DescriptPreference;->refresh()V

    return-void
.end method

.method public setDescriptDetail(Ljava/lang/CharSequence;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/share/DescriptPreference;->mDescriptDetail:Ljava/lang/CharSequence;

    return-void
.end method

.method public setDescriptDetailVisibility(I)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/share/DescriptPreference;->mDescriptDetailVisibility:I

    return-void
.end method

.method public setDescriptTitle(I)V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/share/DescriptPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/share/DescriptPreference;->setDescriptTitle(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public setDescriptTitle(Ljava/lang/CharSequence;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/share/DescriptPreference;->mDescriptTitle:Ljava/lang/CharSequence;

    return-void
.end method
