.class public Lcom/miui/gallery/editor/photo/app/sticker/HeaderHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;
.source "HeaderHolder.java"


# instance fields
.field private mTitle:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 1

    invoke-direct {p0, p1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    instance-of v0, p1, Landroid/widget/TextView;

    if-eqz v0, :cond_0

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/sticker/HeaderHolder;->mTitle:Landroid/widget/TextView;

    :cond_0
    return-void
.end method


# virtual methods
.method bind(Lcom/miui/gallery/editor/photo/core/common/model/StickerCategory;)V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/sticker/HeaderHolder;->mTitle:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/sticker/HeaderHolder;->mTitle:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    iget-object p1, p1, Lcom/miui/gallery/editor/photo/core/common/model/StickerCategory;->name:Ljava/lang/String;

    const-string v2, "string"

    const-string v3, "com.miui.gallery"

    invoke-virtual {v1, p1, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p1

    if-eqz p1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/sticker/HeaderHolder;->mTitle:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method
