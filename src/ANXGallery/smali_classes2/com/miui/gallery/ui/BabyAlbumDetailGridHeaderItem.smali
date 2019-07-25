.class public Lcom/miui/gallery/ui/BabyAlbumDetailGridHeaderItem;
.super Lcom/miui/gallery/ui/TimeLineGridHeaderItem;
.source "BabyAlbumDetailGridHeaderItem.java"


# instance fields
.field private mAge:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/ui/TimeLineGridHeaderItem;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method public bindData(JLjava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-static {p1, p2}, Lcom/miui/gallery/util/GalleryDateUtils;->formatRelativeDate(J)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1, p3}, Lcom/miui/gallery/ui/BabyAlbumDetailGridHeaderItem;->bindData(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/BabyAlbumDetailGridHeaderItem;->mAge:Landroid/widget/TextView;

    invoke-virtual {p1, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method protected onFinishInflate()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/ui/TimeLineGridHeaderItem;->onFinishInflate()V

    const v0, 0x7f090027

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/BabyAlbumDetailGridHeaderItem;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailGridHeaderItem;->mAge:Landroid/widget/TextView;

    return-void
.end method

.method public setCheckable(Z)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/TimeLineGridHeaderItem;->setCheckable(Z)V

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/BabyAlbumDetailGridHeaderItem;->mAge:Landroid/widget/TextView;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/BabyAlbumDetailGridHeaderItem;->mAge:Landroid/widget/TextView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    :goto_0
    return-void
.end method
