.class public Lcom/miui/gallery/ui/AlbumPageListLocalItem;
.super Lcom/miui/gallery/ui/AlbumPageListItemBase;
.source "AlbumPageListLocalItem.java"


# instance fields
.field protected mAlbumNameDesc:Landroid/widget/TextView;

.field protected mMoreAlbumHint:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/ui/AlbumPageListItemBase;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public static getFormedNameNotExceedMaxWidth(Landroid/content/Context;Ljava/util/ArrayList;Landroid/widget/TextView;)Ljava/lang/String;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;",
            "Landroid/widget/TextView;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    invoke-virtual {p2}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    move-result-object p2

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f060022

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p2, v1}, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F

    move-result v2

    int-to-float v0, v0

    cmpl-float v3, v2, v0

    if-lez v3, :cond_0

    return-object v1

    :cond_0
    const v3, 0x7f1004ae

    invoke-virtual {p0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2, p0}, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F

    move-result v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v1, 0x1

    :goto_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v1, v5, :cond_3

    add-float/2addr v2, v3

    cmpl-float v5, v2, v0

    if-lez v5, :cond_1

    goto :goto_1

    :cond_1
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {p2, v5}, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F

    move-result v6

    add-float/2addr v2, v6

    cmpl-float v6, v2, v0

    if-lez v6, :cond_2

    goto :goto_1

    :cond_2
    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_3
    :goto_1
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public bindAlbumNameDesc(Landroid/content/Context;Lcom/miui/gallery/model/Album;)V
    .locals 3

    instance-of v0, p2, Lcom/miui/gallery/model/OtherAlbum;

    if-eqz v0, :cond_0

    move-object v0, p2

    check-cast v0, Lcom/miui/gallery/model/OtherAlbum;

    iget-object v1, p0, Lcom/miui/gallery/ui/AlbumPageListLocalItem;->mAlbumNameDesc:Landroid/widget/TextView;

    invoke-virtual {v0}, Lcom/miui/gallery/model/OtherAlbum;->getAlbumNames()Ljava/util/ArrayList;

    move-result-object v0

    iget-object v2, p0, Lcom/miui/gallery/ui/AlbumPageListLocalItem;->mAlbumNameDesc:Landroid/widget/TextView;

    invoke-static {p1, v0, v2}, Lcom/miui/gallery/ui/AlbumPageListLocalItem;->getFormedNameNotExceedMaxWidth(Landroid/content/Context;Ljava/util/ArrayList;Landroid/widget/TextView;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/AlbumPageListLocalItem;->mAlbumNameDesc:Landroid/widget/TextView;

    invoke-virtual {p2}, Lcom/miui/gallery/model/Album;->getLocalizedAlbumName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_0
    invoke-virtual {p2}, Lcom/miui/gallery/model/Album;->getCount()I

    move-result p1

    const/4 p2, 0x1

    if-le p1, p2, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/AlbumPageListLocalItem;->mMoreAlbumHint:Landroid/widget/TextView;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_1

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/AlbumPageListLocalItem;->mMoreAlbumHint:Landroid/widget/TextView;

    const/16 p2, 0x8

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setVisibility(I)V

    :goto_1
    return-void
.end method

.method protected onFinishInflate()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/ui/AlbumPageListItemBase;->onFinishInflate()V

    const v0, 0x7f0901e1

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/AlbumPageListLocalItem;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/miui/gallery/ui/AlbumPageListLocalItem;->mMoreAlbumHint:Landroid/widget/TextView;

    const v0, 0x7f09003c

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/AlbumPageListLocalItem;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/miui/gallery/ui/AlbumPageListLocalItem;->mAlbumNameDesc:Landroid/widget/TextView;

    return-void
.end method
