.class public Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoCheckManager;
.super Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;
.source "PhotoPageVideoItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPageVideoItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "VideoCheckManager"
.end annotation


# instance fields
.field protected mVideoSmallText:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/miui/gallery/ui/PhotoPageVideoItem;


# direct methods
.method protected constructor <init>(Lcom/miui/gallery/ui/PhotoPageVideoItem;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoCheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageVideoItem;

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;-><init>(Lcom/miui/gallery/ui/PhotoPageItem;)V

    return-void
.end method


# virtual methods
.method public endCheck()V
    .locals 2

    invoke-super {p0}, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->endCheck()V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoCheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageVideoItem;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageVideoItem;->access$100(Lcom/miui/gallery/ui/PhotoPageVideoItem;)Landroid/view/View;

    move-result-object v0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoCheckManager;->mVideoSmallText:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    return-void
.end method

.method protected ensureInflated()V
    .locals 2

    invoke-super {p0}, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->ensureInflated()V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoCheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageVideoItem;

    const v1, 0x7f090345

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/PhotoPageVideoItem;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoCheckManager;->mVideoSmallText:Landroid/widget/TextView;

    return-void
.end method

.method public varargs refreshCheck([Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;)V
    .locals 2

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->refreshCheck([Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoCheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageVideoItem;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageVideoItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoCheckManager;->mVideoSmallText:Landroid/widget/TextView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoCheckManager;->mVideoSmallText:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoCheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageVideoItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageVideoItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem;->getDuration()I

    move-result v0

    int-to-long v0, v0

    invoke-static {v0, v1}, Lcom/miui/gallery/util/FormatUtil;->formatVideoDuration(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoCheckManager;->mVideoSmallText:Landroid/widget/TextView;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    :goto_0
    return-void
.end method

.method public varargs startCheck([Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;)V
    .locals 2

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->startCheck([Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceModeInterface;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoCheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageVideoItem;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageVideoItem;->access$100(Lcom/miui/gallery/ui/PhotoPageVideoItem;)Landroid/view/View;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoCheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageVideoItem;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageVideoItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoCheckManager;->mVideoSmallText:Landroid/widget/TextView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoCheckManager;->mVideoSmallText:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoCheckManager;->this$0:Lcom/miui/gallery/ui/PhotoPageVideoItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageVideoItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem;->getDuration()I

    move-result v0

    int-to-long v0, v0

    invoke-static {v0, v1}, Lcom/miui/gallery/util/FormatUtil;->formatVideoDuration(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method
