.class public Lcom/miui/gallery/share/PublishProgressPreference;
.super Landroid/preference/Preference;
.source "PublishProgressPreference.java"


# instance fields
.field private mOpenPublic:Z

.field private mProgressOn:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/miui/gallery/share/PublishProgressPreference;->mProgressOn:Z

    iput-boolean p1, p0, Lcom/miui/gallery/share/PublishProgressPreference;->mOpenPublic:Z

    const p1, 0x7f0b0156

    invoke-virtual {p0, p1}, Lcom/miui/gallery/share/PublishProgressPreference;->setLayoutResource(I)V

    return-void
.end method


# virtual methods
.method public onBindView(Landroid/view/View;)V
    .locals 2

    invoke-super {p0, p1}, Landroid/preference/Preference;->onBindView(Landroid/view/View;)V

    const v0, 0x7f090239

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iget-boolean v1, p0, Lcom/miui/gallery/share/PublishProgressPreference;->mProgressOn:Z

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    const/16 v1, 0x8

    :goto_0
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-boolean v0, p0, Lcom/miui/gallery/share/PublishProgressPreference;->mProgressOn:Z

    if-eqz v0, :cond_2

    const v0, 0x7f090234

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iget-boolean v0, p0, Lcom/miui/gallery/share/PublishProgressPreference;->mOpenPublic:Z

    if-eqz v0, :cond_1

    const v0, 0x7f1005bb

    goto :goto_1

    :cond_1
    const v0, 0x7f100702

    :goto_1
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    :cond_2
    return-void
.end method

.method public setProgress(ZZ)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/share/PublishProgressPreference;->mProgressOn:Z

    iput-boolean p2, p0, Lcom/miui/gallery/share/PublishProgressPreference;->mOpenPublic:Z

    invoke-virtual {p0}, Lcom/miui/gallery/share/PublishProgressPreference;->notifyChanged()V

    return-void
.end method
