.class public Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuBottomView;
.super Landroid/widget/LinearLayout;
.source "MoviePreviewMenuBottomView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuBottomView$IMenuBottomViewClickListener;
    }
.end annotation


# instance fields
.field private mEditView:Landroid/widget/TextView;

.field private mListener:Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuBottomView$IMenuBottomViewClickListener;

.field private mPlayArea:Landroid/view/View;

.field private mPlayView:Landroid/widget/ImageView;

.field private mPreViewBottomView:Landroid/view/View;

.field private mSaveView:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-direct {p0, p1}, Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuBottomView;->init(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    invoke-direct {p0, p1}, Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuBottomView;->init(Landroid/content/Context;)V

    return-void
.end method

.method private init(Landroid/content/Context;)V
    .locals 1

    const v0, 0x7f0b00bb

    invoke-static {p1, v0, p0}, Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuBottomView;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuBottomView;->mListener:Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuBottomView$IMenuBottomViewClickListener;

    if-nez v0, :cond_0

    const-string p1, "MoviePreviewMenuBottomView"

    const-string v0, "the listener is null . "

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    const v0, 0x7f090136

    if-eq p1, v0, :cond_1

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget-object p1, p0, Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuBottomView;->mListener:Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuBottomView$IMenuBottomViewClickListener;

    invoke-interface {p1}, Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuBottomView$IMenuBottomViewClickListener;->onSaveBtnClick()V

    goto :goto_0

    :pswitch_1
    iget-object p1, p0, Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuBottomView;->mListener:Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuBottomView$IMenuBottomViewClickListener;

    invoke-interface {p1}, Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuBottomView$IMenuBottomViewClickListener;->onEditBtnClick()V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuBottomView;->mListener:Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuBottomView$IMenuBottomViewClickListener;

    invoke-interface {p1}, Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuBottomView$IMenuBottomViewClickListener;->onPlayAreaClick()V

    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x7f090313
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected onFinishInflate()V
    .locals 1

    invoke-super {p0}, Landroid/widget/LinearLayout;->onFinishInflate()V

    const v0, 0x7f0901af

    invoke-virtual {p0, v0}, Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuBottomView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuBottomView;->mPreViewBottomView:Landroid/view/View;

    const v0, 0x7f090136

    invoke-virtual {p0, v0}, Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuBottomView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuBottomView;->mPlayArea:Landroid/view/View;

    const v0, 0x7f090314

    invoke-virtual {p0, v0}, Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuBottomView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuBottomView;->mSaveView:Landroid/widget/TextView;

    const v0, 0x7f090313

    invoke-virtual {p0, v0}, Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuBottomView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuBottomView;->mEditView:Landroid/widget/TextView;

    const v0, 0x7f090190

    invoke-virtual {p0, v0}, Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuBottomView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuBottomView;->mPlayView:Landroid/widget/ImageView;

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuBottomView;->mPreViewBottomView:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuBottomView;->mSaveView:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuBottomView;->mEditView:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuBottomView;->mPlayArea:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public removeListener()V
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuBottomView;->mListener:Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuBottomView$IMenuBottomViewClickListener;

    return-void
.end method

.method public setIMenuBottomViewClickListener(Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuBottomView$IMenuBottomViewClickListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuBottomView;->mListener:Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuBottomView$IMenuBottomViewClickListener;

    return-void
.end method

.method public updatePlayBtnState(Z)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuBottomView;->mPlayView:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setSelected(Z)V

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuBottomView;->mPlayView:Landroid/widget/ImageView;

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuBottomView;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v1, 0x7f10048b

    :goto_0
    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuBottomView;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v1, 0x7f10048c

    goto :goto_0

    :goto_1
    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    return-void
.end method
