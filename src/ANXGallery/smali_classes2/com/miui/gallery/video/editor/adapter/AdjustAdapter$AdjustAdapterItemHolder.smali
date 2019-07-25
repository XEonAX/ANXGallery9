.class Lcom/miui/gallery/video/editor/adapter/AdjustAdapter$AdjustAdapterItemHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;
.source "AdjustAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/video/editor/adapter/AdjustAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "AdjustAdapterItemHolder"
.end annotation


# instance fields
.field private mIconView:Landroid/widget/ImageView;

.field private mLabelView:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 1

    invoke-direct {p0, p1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    const v0, 0x7f090197

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/miui/gallery/video/editor/adapter/AdjustAdapter$AdjustAdapterItemHolder;->mLabelView:Landroid/widget/TextView;

    const v0, 0x7f09016b

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lcom/miui/gallery/video/editor/adapter/AdjustAdapter$AdjustAdapterItemHolder;->mIconView:Landroid/widget/ImageView;

    return-void
.end method


# virtual methods
.method bind(Lcom/miui/gallery/video/editor/model/AdjustData;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/video/editor/adapter/AdjustAdapter$AdjustAdapterItemHolder;->mIconView:Landroid/widget/ImageView;

    iget v1, p1, Lcom/miui/gallery/video/editor/model/AdjustData;->icon:I

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/adapter/AdjustAdapter$AdjustAdapterItemHolder;->mLabelView:Landroid/widget/TextView;

    iget-object p1, p1, Lcom/miui/gallery/video/editor/model/AdjustData;->name:Ljava/lang/String;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method
