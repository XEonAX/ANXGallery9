.class Lcom/miui/gallery/share/ShareUserAdapterBase$ViewHolder;
.super Ljava/lang/Object;
.source "ShareUserAdapterBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/share/ShareUserAdapterBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ViewHolder"
.end annotation


# instance fields
.field public final mIcon:Landroid/widget/ImageView;

.field public final mIconEffect:Landroid/widget/ImageView;

.field public final mMark:Landroid/widget/ImageView;

.field public final mText:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/miui/gallery/share/ShareUserAdapterBase;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/share/ShareUserAdapterBase;Lcom/miui/gallery/share/CloudUserCacheEntry;Landroid/view/View;)V
    .locals 1

    iput-object p1, p0, Lcom/miui/gallery/share/ShareUserAdapterBase$ViewHolder;->this$0:Lcom/miui/gallery/share/ShareUserAdapterBase;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const v0, 0x7f09016a

    invoke-virtual {p3, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/miui/gallery/share/ShareUserAdapterBase$ViewHolder;->mIcon:Landroid/widget/ImageView;

    iget-object v0, p0, Lcom/miui/gallery/share/ShareUserAdapterBase$ViewHolder;->mIcon:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    invoke-virtual {p1, p2, v0}, Lcom/miui/gallery/share/ShareUserAdapterBase;->setIconSize(Lcom/miui/gallery/share/CloudUserCacheEntry;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    iget p2, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    iput p2, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    const p1, 0x7f0901bb

    invoke-virtual {p3, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lcom/miui/gallery/share/ShareUserAdapterBase$ViewHolder;->mMark:Landroid/widget/ImageView;

    const p1, 0x7f0902d6

    invoke-virtual {p3, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/miui/gallery/share/ShareUserAdapterBase$ViewHolder;->mText:Landroid/widget/TextView;

    const p1, 0x7f090169

    invoke-virtual {p3, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lcom/miui/gallery/share/ShareUserAdapterBase$ViewHolder;->mIconEffect:Landroid/widget/ImageView;

    return-void
.end method
