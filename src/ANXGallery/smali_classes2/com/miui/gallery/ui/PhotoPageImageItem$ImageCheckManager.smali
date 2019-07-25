.class public Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;
.super Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;
.source "PhotoPageImageItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPageImageItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "ImageCheckManager"
.end annotation


# instance fields
.field private mCheckStateListener:Landroid/widget/CompoundButton$OnCheckedChangeListener;

.field mPostLoadListener:Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;

.field private mRenderCallback:Lcom/miui/gallery/editor/photo/sdk/AutoRenderer$Callback;

.field protected mRenderCheckBox:Landroid/widget/CheckBox;

.field protected mRenderInterface:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;

.field protected mSimilarBestMark:Landroid/view/View;

.field final synthetic this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;


# direct methods
.method protected constructor <init>(Lcom/miui/gallery/ui/PhotoPageImageItem;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;-><init>(Lcom/miui/gallery/ui/PhotoPageItem;)V

    new-instance p1, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager$1;

    invoke-direct {p1, p0}, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager$1;-><init>(Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;)V

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->mCheckStateListener:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    new-instance p1, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager$2;

    invoke-direct {p1, p0}, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager$2;-><init>(Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;)V

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->mRenderCallback:Lcom/miui/gallery/editor/photo/sdk/AutoRenderer$Callback;

    new-instance p1, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager$3;

    invoke-direct {p1, p0}, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager$3;-><init>(Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;)V

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->mPostLoadListener:Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;

    return-void
.end method

.method static synthetic access$300(Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;)Z
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->renderChecked()Z

    move-result p0

    return p0
.end method

.method static synthetic access$700(Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;)Lcom/miui/gallery/editor/photo/sdk/AutoRenderer$Callback;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->mRenderCallback:Lcom/miui/gallery/editor/photo/sdk/AutoRenderer$Callback;

    return-object p0
.end method

.method private renderChecked()Z
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->mRenderInterface:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->mRenderInterface:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageImageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v1}, Lcom/miui/gallery/model/BaseDataItem;->getKey()J

    move-result-wide v1

    invoke-interface {v0, v1, v2}, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;->isChecked(J)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method


# virtual methods
.method protected varargs dispatchInterfaces([Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;)V
    .locals 2

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->dispatchInterfaces([Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;)V

    if-eqz p1, :cond_0

    array-length v0, p1

    const/4 v1, 0x2

    if-le v0, v1, :cond_0

    aget-object p1, p1, v1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->mRenderInterface:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;

    return-void
.end method

.method public endCheck()V
    .locals 2

    invoke-super {p0}, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->endCheck()V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->mRenderCheckBox:Landroid/widget/CheckBox;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->mRenderCheckBox:Landroid/widget/CheckBox;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->mRenderCheckBox:Landroid/widget/CheckBox;

    const v1, 0x7f1003a5

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setText(I)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageImageItem;->access$500(Lcom/miui/gallery/ui/PhotoPageImageItem;)V

    return-void
.end method

.method protected ensureInflated()V
    .locals 8

    invoke-super {p0}, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->ensureInflated()V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    const v1, 0x7f0902a8

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/PhotoPageImageItem;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->mSimilarBestMark:Landroid/view/View;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->getInstance()Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;

    move-result-object v2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem;->getKey()J

    move-result-wide v3

    const/4 v5, 0x0

    const/4 v6, 0x0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem;->getBurstKeys()Ljava/util/List;

    move-result-object v7

    invoke-virtual/range {v2 .. v7}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->shouldShowSelectionStar(JZZLjava/util/List;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->mSimilarBestMark:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->mSimilarBestMark:Landroid/view/View;

    const/16 v2, 0x8

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    const v2, 0x7f090080

    invoke-virtual {v0, v2}, Lcom/miui/gallery/ui/PhotoPageImageItem;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->mRenderCheckBox:Landroid/widget/CheckBox;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->mRenderCheckBox:Landroid/widget/CheckBox;

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setClickable(Z)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->mRenderCheckBox:Landroid/widget/CheckBox;

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setFocusable(Z)V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const v1, 0x7f090081

    if-eq v0, v1, :cond_0

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->onClick(Landroid/view/View;)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageImageItem;->access$600(Lcom/miui/gallery/ui/PhotoPageImageItem;)Z

    move-result p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->mRenderCheckBox:Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isEnabled()Z

    move-result p1

    if-nez p1, :cond_1

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->mRenderCheckBox:Landroid/widget/CheckBox;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->mRenderInterface:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;

    invoke-virtual {p0, p1, v0}, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->toggleCheckBox(Landroid/widget/CheckBox;Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;)V

    :cond_2
    :goto_0
    return-void
.end method

.method public varargs refreshCheck([Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;)V
    .locals 3

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->refreshCheck([Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageImageItem;->access$400(Lcom/miui/gallery/ui/PhotoPageImageItem;)Lcom/miui/gallery/editor/photo/sdk/AutoRenderer;

    move-result-object p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->mCheckRenderLayout:Landroid/view/View;

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->mRenderCheckBox:Landroid/widget/CheckBox;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->mCheckStateListener:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    invoke-virtual {p1, v0}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->mRenderCheckBox:Landroid/widget/CheckBox;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/CheckBox;->setVisibility(I)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->mRenderInterface:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageImageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->mRenderCheckBox:Landroid/widget/CheckBox;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->mRenderInterface:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageImageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v1}, Lcom/miui/gallery/model/BaseDataItem;->getKey()J

    move-result-wide v1

    invoke-interface {v0, v1, v2}, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;->isChecked(J)Z

    move-result v0

    invoke-virtual {p0, p1, v0}, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->setCheckBoxState(Landroid/widget/CheckBox;Z)V

    goto :goto_2

    :cond_0
    const-string p1, "PhotoPageImageItem"

    const-string v0, "renderInterface[%s] or data[%s] not prepared"

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->mRenderInterface:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;

    if-nez v1, :cond_1

    const-string v1, "NULL"

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->mRenderInterface:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;

    :goto_0
    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    iget-object v2, v2, Lcom/miui/gallery/ui/PhotoPageImageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    if-nez v2, :cond_2

    const-string v2, "NULL"

    goto :goto_1

    :cond_2
    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    iget-object v2, v2, Lcom/miui/gallery/ui/PhotoPageImageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    :goto_1
    invoke-static {p1, v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_2

    :cond_3
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->mCheckRenderLayout:Landroid/view/View;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->mRenderCheckBox:Landroid/widget/CheckBox;

    invoke-virtual {p1, v0}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->mRenderCheckBox:Landroid/widget/CheckBox;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/widget/CheckBox;->setVisibility(I)V

    :goto_2
    return-void
.end method

.method public varargs startCheck([Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    new-instance v1, Lcom/miui/gallery/editor/photo/sdk/AutoRenderer;

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    invoke-virtual {v2}, Lcom/miui/gallery/ui/PhotoPageImageItem;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/miui/gallery/editor/photo/sdk/AutoRenderer;-><init>(Landroid/content/Context;)V

    invoke-static {v0, v1}, Lcom/miui/gallery/ui/PhotoPageImageItem;->access$402(Lcom/miui/gallery/ui/PhotoPageImageItem;Lcom/miui/gallery/editor/photo/sdk/AutoRenderer;)Lcom/miui/gallery/editor/photo/sdk/AutoRenderer;

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->startCheck([Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->mCheckRenderLayout:Landroid/view/View;

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method
