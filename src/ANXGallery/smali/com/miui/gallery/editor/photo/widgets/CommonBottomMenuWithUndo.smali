.class public Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;
.super Landroid/widget/LinearLayout;
.source "CommonBottomMenuWithUndo.java"

# interfaces
.implements Lcom/miui/gallery/editor/photo/widgets/MenuUpdateListener;


# instance fields
.field private mCancel:Landroid/widget/ImageView;

.field private mOk:Landroid/widget/ImageView;

.field private mRedo:Landroid/widget/ImageView;

.field private mRenderRecordListener:Lcom/miui/gallery/editor/photo/app/RenderRecord;

.field private mShowTitle:Z

.field private mTitle:Landroid/widget/TextView;

.field private mUndo:Landroid/widget/ImageView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;->mShowTitle:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;->mShowTitle:Z

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;)Lcom/miui/gallery/editor/photo/app/RenderRecord;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;->mRenderRecordListener:Lcom/miui/gallery/editor/photo/app/RenderRecord;

    return-object p0
.end method

.method private init()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;->mUndo:Landroid/widget/ImageView;

    new-instance v1, Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo$1;

    invoke-direct {v1, p0}, Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo$1;-><init>(Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;->mRedo:Landroid/widget/ImageView;

    new-instance v1, Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo$2;

    invoke-direct {v1, p0}, Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo$2;-><init>(Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method


# virtual methods
.method public getTitle()Landroid/widget/TextView;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;->mTitle:Landroid/widget/TextView;

    return-object v0
.end method

.method public isShowTitle()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;->mShowTitle:Z

    return v0
.end method

.method protected onFinishInflate()V
    .locals 1

    invoke-super {p0}, Landroid/widget/LinearLayout;->onFinishInflate()V

    const v0, 0x7f09031a

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;->mUndo:Landroid/widget/ImageView;

    const v0, 0x7f09025a

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;->mRedo:Landroid/widget/ImageView;

    const v0, 0x7f0902fa

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;->mTitle:Landroid/widget/TextView;

    const v0, 0x7f090073

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;->mCancel:Landroid/widget/ImageView;

    const v0, 0x7f0901f9

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;->mOk:Landroid/widget/ImageView;

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;->init()V

    return-void
.end method

.method public onMenuEnabled(Z)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;->mUndo:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setClickable(Z)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;->mRedo:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setClickable(Z)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;->mCancel:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setClickable(Z)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;->mOk:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setClickable(Z)V

    return-void
.end method

.method public onMenuUpdated(ZZ)V
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;->mShowTitle:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;->updateBottomBar(Z)V

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;->mShowTitle:Z

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;->mUndo:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setEnabled(Z)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;->mRedo:Landroid/widget/ImageView;

    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setEnabled(Z)V

    return-void
.end method

.method public setRenderRecordListener(Lcom/miui/gallery/editor/photo/app/RenderRecord;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;->mRenderRecordListener:Lcom/miui/gallery/editor/photo/app/RenderRecord;

    return-void
.end method

.method public setTitle(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;->mTitle:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    return-void
.end method

.method public updateBottomBar(Z)V
    .locals 2

    const/16 v0, 0x8

    const/4 v1, 0x0

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;->mTitle:Landroid/widget/TextView;

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;->mUndo:Landroid/widget/ImageView;

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;->mRedo:Landroid/widget/ImageView;

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;->mTitle:Landroid/widget/TextView;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;->mUndo:Landroid/widget/ImageView;

    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;->mRedo:Landroid/widget/ImageView;

    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    :goto_0
    return-void
.end method
