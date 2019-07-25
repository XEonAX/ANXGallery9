.class public Lcom/miui/gallery/ui/PhotoPageTopBar;
.super Ljava/lang/Object;
.source "PhotoPageTopBar.java"


# instance fields
.field private mLocation:Landroid/widget/TextView;

.field private mOperationView:Landroid/view/View;

.field private mSubTitle:Landroid/widget/TextView;

.field private mTitle:Landroid/widget/TextView;

.field private mTopLayout:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/view/View$OnClickListener;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const v0, 0x7f0b0107

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageTopBar;->mTopLayout:Landroid/view/View;

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageTopBar;->mTopLayout:Landroid/view/View;

    const v0, 0x7f090003

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageTopBar;->mTopLayout:Landroid/view/View;

    const p2, 0x7f090302

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageTopBar;->mTitle:Landroid/widget/TextView;

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageTopBar;->mTopLayout:Landroid/view/View;

    const p2, 0x7f090301

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageTopBar;->mSubTitle:Landroid/widget/TextView;

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageTopBar;->mTopLayout:Landroid/view/View;

    const p2, 0x7f090300

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageTopBar;->mLocation:Landroid/widget/TextView;

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageTopBar;->mTopLayout:Landroid/view/View;

    const p2, 0x7f0901fc

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageTopBar;->mOperationView:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public getOperationView()Landroid/view/View;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageTopBar;->mOperationView:Landroid/view/View;

    return-object v0
.end method

.method public getView()Landroid/view/View;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageTopBar;->mTopLayout:Landroid/view/View;

    return-object v0
.end method

.method public hide()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageTopBar;->mTopLayout:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public isShowing()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageTopBar;->mTopLayout:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public setLocation(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    invoke-static {p2}, Lcom/miui/gallery/data/LocationUtil;->isLocationValidate(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageTopBar;->mLocation:Landroid/widget/TextView;

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageTopBar;->mLocation:Landroid/widget/TextView;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageTopBar;->mLocation:Landroid/widget/TextView;

    const/4 p2, 0x4

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setVisibility(I)V

    :goto_0
    return-void
.end method

.method public setSubTitle(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageTopBar;->mSubTitle:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageTopBar;->mTitle:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public show()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageTopBar;->mTopLayout:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method
