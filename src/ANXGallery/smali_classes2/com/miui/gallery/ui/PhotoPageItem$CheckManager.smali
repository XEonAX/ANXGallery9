.class public Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;
.super Ljava/lang/Object;
.source "PhotoPageItem.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPageItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "CheckManager"
.end annotation


# instance fields
.field protected mCheckOriginLayout:Landroid/view/View;

.field protected mCheckRenderLayout:Landroid/view/View;

.field protected mCheckRoot:Landroid/view/View;

.field protected mOriginCheckBox:Landroid/widget/CheckBox;

.field protected mOriginInterface:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;

.field protected mOriginText:Landroid/widget/TextView;

.field protected mSelectCheckBox:Landroid/widget/CheckBox;

.field protected mSelectInterface:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;

.field protected mSelectLayout:Landroid/view/View;

.field private mVisiblePending:Z

.field final synthetic this$0:Lcom/miui/gallery/ui/PhotoPageItem;


# direct methods
.method protected constructor <init>(Lcom/miui/gallery/ui/PhotoPageItem;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$2800(Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;Landroid/graphics/RectF;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->relayout(Landroid/graphics/RectF;)V

    return-void
.end method

.method private formatContentDescriptionWithCheckState(Ljava/lang/CharSequence;Z)Ljava/lang/String;
    .locals 3

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageItem;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    if-eqz p2, :cond_0

    const p2, 0x7f1000fb

    goto :goto_0

    :cond_0
    const p2, 0x7f1006fe

    :goto_0
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_2

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageItem;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    if-eqz p2, :cond_2

    const p2, 0x7f1000fc

    goto :goto_1

    :cond_2
    const p2, 0x7f1006ff

    :goto_1
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-virtual {v0, p2, v1}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    :goto_2
    return-object p1
.end method

.method private relayout(Landroid/graphics/RectF;)V
    .locals 7

    if-eqz p1, :cond_2

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->inAction()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageItem;->getWidth()I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    invoke-virtual {v1}, Lcom/miui/gallery/ui/PhotoPageItem;->getHeight()I

    move-result v1

    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result v2

    invoke-static {}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->getMinSlideWidth()F

    move-result v3

    cmpl-float v2, v2, v3

    const/4 v3, 0x0

    if-lez v2, :cond_0

    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    move-result v2

    invoke-static {}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->getMinSlideHeight()F

    move-result v4

    cmpl-float v2, v2, v4

    if-lez v2, :cond_0

    iget v0, p1, Landroid/graphics/RectF;->left:F

    const/4 v1, 0x0

    invoke-static {v1, v0}, Ljava/lang/Math;->max(FF)F

    move-result v0

    float-to-int v0, v0

    iget v2, p1, Landroid/graphics/RectF;->top:F

    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    move-result v1

    float-to-int v1, v1

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    invoke-virtual {v2}, Lcom/miui/gallery/ui/PhotoPageItem;->getWidth()I

    move-result v2

    int-to-float v2, v2

    iget v4, p1, Landroid/graphics/RectF;->right:F

    invoke-static {v2, v4}, Ljava/lang/Math;->min(FF)F

    move-result v2

    float-to-int v2, v2

    iget-object v4, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    invoke-virtual {v4}, Lcom/miui/gallery/ui/PhotoPageItem;->getHeight()I

    move-result v4

    int-to-float v4, v4

    iget p1, p1, Landroid/graphics/RectF;->bottom:F

    invoke-static {v4, p1}, Ljava/lang/Math;->min(FF)F

    move-result p1

    float-to-int p1, p1

    goto :goto_0

    :cond_0
    move v2, v0

    move p1, v1

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_0
    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->ensureInflated()V

    iget-object v4, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->mCheckRoot:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->isLaidOut()Z

    move-result v4

    if-eqz v4, :cond_1

    iget-object v4, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->mCheckRoot:Landroid/view/View;

    invoke-virtual {v4, v0, v1, v2, p1}, Landroid/view/View;->layout(IIII)V

    :cond_1
    const-string v4, "PhotoPageItem"

    const-string v5, "relayout l[%d], t[%d], r[%d], b[%d]  isLaidOut %s"

    const/4 v6, 0x5

    new-array v6, v6, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v6, v3

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v1, 0x1

    aput-object v0, v6, v1

    const/4 v0, 0x2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v6, v0

    const/4 v0, 0x3

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v6, v0

    const/4 p1, 0x4

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->mCheckRoot:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->isLaidOut()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    aput-object v0, v6, p1

    invoke-static {v4, v5, v6}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->mCheckRoot:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result p1

    if-eqz p1, :cond_2

    iget-boolean p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->mVisiblePending:Z

    if-eqz p1, :cond_2

    iput-boolean v3, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->mVisiblePending:Z

    invoke-direct {p0, v1}, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->setCheckRootVisible(Z)V

    :cond_2
    return-void
.end method

.method private setCheckRootVisible(Z)V
    .locals 1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->mCheckRoot:Landroid/view/View;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->mCheckRoot:Landroid/view/View;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    :goto_0
    return-void
.end method


# virtual methods
.method protected varargs dispatchInterfaces([Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;)V
    .locals 3

    const/4 v0, 0x0

    if-eqz p1, :cond_2

    array-length v1, p1

    if-lez v1, :cond_0

    const/4 v1, 0x0

    aget-object v1, p1, v1

    goto :goto_0

    :cond_0
    move-object v1, v0

    :goto_0
    iput-object v1, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->mOriginInterface:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;

    array-length v1, p1

    const/4 v2, 0x1

    if-le v1, v2, :cond_1

    aget-object v0, p1, v2

    :cond_1
    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->mSelectInterface:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;

    goto :goto_1

    :cond_2
    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->mOriginInterface:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->mSelectInterface:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;

    :goto_1
    return-void
.end method

.method public endCheck()V
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->ensureInflated()V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->mCheckOriginLayout:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->mSelectLayout:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->mCheckRenderLayout:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const/4 v0, 0x0

    new-array v2, v0, [Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;

    invoke-virtual {p0, v2}, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->dispatchInterfaces([Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;)V

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->mVisiblePending:Z

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->mCheckRoot:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v2

    if-nez v2, :cond_0

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {p0, v2}, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->onAlphaChanged(F)V

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->setCheckRootVisible(Z)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->mCheckRoot:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    return-void
.end method

.method protected ensureInflated()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->mCheckRoot:Landroid/view/View;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    const v1, 0x7f090204

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/PhotoPageItem;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewStub;

    invoke-virtual {v0}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->mCheckRoot:Landroid/view/View;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->mCheckRoot:Landroid/view/View;

    const v1, 0x7f090083

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->mSelectLayout:Landroid/view/View;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->mCheckRoot:Landroid/view/View;

    const v1, 0x7f090082

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->mSelectCheckBox:Landroid/widget/CheckBox;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->mCheckRoot:Landroid/view/View;

    const v1, 0x7f09007e

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->mCheckOriginLayout:Landroid/view/View;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->mCheckRoot:Landroid/view/View;

    const v1, 0x7f09007f

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->mOriginText:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->mCheckRoot:Landroid/view/View;

    const v1, 0x7f09007d

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->mOriginCheckBox:Landroid/widget/CheckBox;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    const v1, 0x7f090081

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/PhotoPageItem;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->mCheckRenderLayout:Landroid/view/View;

    :cond_0
    return-void
.end method

.method public getContentDescription()Ljava/lang/String;
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->mSelectInterface:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;

    if-nez v0, :cond_0

    goto :goto_1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageItem;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->mSelectInterface:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object v2, v2, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v2}, Lcom/miui/gallery/model/BaseDataItem;->getKey()J

    move-result-wide v2

    invoke-interface {v1, v2, v3}, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;->isChecked(J)Z

    move-result v1

    if-eqz v1, :cond_1

    const v1, 0x7f1000fc

    goto :goto_0

    :cond_1
    const v1, 0x7f1006ff

    :goto_0
    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object v4, v4, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    iget-object v5, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    invoke-virtual {v5}, Lcom/miui/gallery/ui/PhotoPageItem;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/miui/gallery/model/BaseDataItem;->getContentDescription(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_2
    :goto_1
    const/4 v0, 0x0

    return-object v0
.end method

.method protected inAction()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->mCheckRoot:Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->mCheckRoot:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->mVisiblePending:Z

    if-eqz v0, :cond_2

    :cond_1
    const/4 v0, 0x1

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public onAlphaChanged(F)V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->ensureInflated()V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->mCheckRoot:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setAlpha(F)V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    const v0, 0x7f09007c

    if-eq p1, v0, :cond_1

    const v0, 0x7f09007e

    if-eq p1, v0, :cond_0

    const v0, 0x7f090083

    if-eq p1, v0, :cond_1

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->mOriginCheckBox:Landroid/widget/CheckBox;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->mOriginInterface:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;

    invoke-virtual {p0, p1, v0}, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->toggleCheckBox(Landroid/widget/CheckBox;Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;)V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->mSelectCheckBox:Landroid/widget/CheckBox;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->mSelectInterface:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;

    invoke-virtual {p0, p1, v0}, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->toggleCheckBox(Landroid/widget/CheckBox;Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;)V

    :goto_0
    return-void
.end method

.method public final onMatrixChanged(Landroid/graphics/RectF;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->relayout(Landroid/graphics/RectF;)V

    return-void
.end method

.method protected originChecked()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem;->isVideo()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem;->isGif()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public varargs refreshCheck([Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;)V
    .locals 7

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->ensureInflated()V

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->dispatchInterfaces([Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->mCheckRoot:Landroid/view/View;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageItem;->getContentDescriptionForTalkBack()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->mSelectCheckBox:Landroid/widget/CheckBox;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->mSelectInterface:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v1}, Lcom/miui/gallery/model/BaseDataItem;->getKey()J

    move-result-wide v1

    invoke-interface {v0, v1, v2}, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;->isChecked(J)Z

    move-result v0

    invoke-virtual {p0, p1, v0}, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->setCheckBoxState(Landroid/widget/CheckBox;Z)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->mOriginCheckBox:Landroid/widget/CheckBox;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->mOriginInterface:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v1}, Lcom/miui/gallery/model/BaseDataItem;->getKey()J

    move-result-wide v1

    invoke-interface {v0, v1, v2}, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;->isChecked(J)Z

    move-result v0

    invoke-virtual {p0, p1, v0}, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->setCheckBoxState(Landroid/widget/CheckBox;Z)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->mOriginText:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageItem;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f100659

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    invoke-virtual {v4}, Lcom/miui/gallery/ui/PhotoPageItem;->getContext()Landroid/content/Context;

    move-result-object v4

    iget-object v5, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object v5, v5, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v5}, Lcom/miui/gallery/model/BaseDataItem;->getSize()J

    move-result-wide v5

    invoke-static {v4, v5, v6}, Lcom/miui/gallery/util/FormatUtil;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-virtual {v0, v1, v3}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->originChecked()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->mCheckOriginLayout:Landroid/view/View;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->mCheckOriginLayout:Landroid/view/View;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->mOriginInterface:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    const v1, 0x7f0902cd

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/PhotoPageItem;->getTag(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v1}, Lcom/miui/gallery/model/BaseDataItem;->getKey()J

    move-result-wide v3

    invoke-interface {p1, v0, v3, v4, v2}, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;->setChecked(IJZ)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->mCheckOriginLayout:Landroid/view/View;

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->mCheckOriginLayout:Landroid/view/View;

    invoke-virtual {p1, v5}, Landroid/view/View;->setVisibility(I)V

    :cond_1
    :goto_0
    return-void
.end method

.method protected setCheckBoxState(Landroid/widget/CheckBox;Z)V
    .locals 2

    invoke-virtual {p1, p2}, Landroid/widget/CheckBox;->setChecked(Z)V

    invoke-virtual {p1}, Landroid/widget/CheckBox;->getId()I

    move-result p1

    const v0, 0x7f09007d

    if-eq p1, v0, :cond_2

    const v0, 0x7f090080

    if-eq p1, v0, :cond_1

    const v0, 0x7f090082

    if-eq p1, v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageItem;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/model/BaseDataItem;->getContentDescription(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->formatContentDescriptionWithCheckState(Ljava/lang/CharSequence;Z)Ljava/lang/String;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->mSelectLayout:Landroid/view/View;

    invoke-virtual {p2, p1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->mCheckRoot:Landroid/view/View;

    invoke-virtual {p2, p1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->mCheckRenderLayout:Landroid/view/View;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageItem;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f1003a5

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->formatContentDescriptionWithCheckState(Ljava/lang/CharSequence;Z)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_0

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->mCheckOriginLayout:Landroid/view/View;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->mOriginText:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->formatContentDescriptionWithCheckState(Ljava/lang/CharSequence;Z)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    :goto_0
    return-void
.end method

.method public varargs startCheck([Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;)V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->ensureInflated()V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->mCheckRoot:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->mSelectLayout:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->mCheckOriginLayout:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->mCheckRoot:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoView;->getDisplayRect()Landroid/graphics/RectF;

    move-result-object v0

    const/4 v1, 0x1

    if-nez v0, :cond_0

    iput-boolean v1, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->mVisiblePending:Z

    goto :goto_0

    :cond_0
    invoke-direct {p0, v1}, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->setCheckRootVisible(Z)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoView;->getDisplayRect()Landroid/graphics/RectF;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->relayout(Landroid/graphics/RectF;)V

    :cond_1
    :goto_0
    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->refreshCheck([Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;)V

    return-void
.end method

.method protected toggleCheckBox(Landroid/widget/CheckBox;Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;)V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v0

    if-eqz p2, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    const v2, 0x7f0902cd

    invoke-virtual {v1, v2}, Lcom/miui/gallery/ui/PhotoPageItem;->getTag(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object v2, v2, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v2}, Lcom/miui/gallery/model/BaseDataItem;->getKey()J

    move-result-wide v2

    xor-int/lit8 v4, v0, 0x1

    invoke-interface {p2, v1, v2, v3, v4}, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;->onItemCheckedChanged(IJZ)V

    :cond_1
    xor-int/lit8 p2, v0, 0x1

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->setCheckBoxState(Landroid/widget/CheckBox;Z)V

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    invoke-virtual {p2}, Lcom/miui/gallery/ui/PhotoPageItem;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    if-nez v0, :cond_2

    const v0, 0x7f1000fb

    goto :goto_0

    :cond_2
    const v0, 0x7f1006fe

    :goto_0
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/miui/gallery/util/TalkBackUtil;->requestAnnouncementEvent(Landroid/view/View;Ljava/lang/String;)V

    return-void
.end method
