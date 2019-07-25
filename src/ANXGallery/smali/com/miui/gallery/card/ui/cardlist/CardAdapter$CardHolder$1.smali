.class Lcom/miui/gallery/card/ui/cardlist/CardAdapter$CardHolder$1;
.super Lcom/miui/gallery/widget/AntiDoubleClickListener;
.source "CardAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/card/ui/cardlist/CardAdapter$CardHolder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/card/ui/cardlist/CardAdapter$CardHolder;


# direct methods
.method constructor <init>(Lcom/miui/gallery/card/ui/cardlist/CardAdapter$CardHolder;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/card/ui/cardlist/CardAdapter$CardHolder$1;->this$1:Lcom/miui/gallery/card/ui/cardlist/CardAdapter$CardHolder;

    invoke-direct {p0}, Lcom/miui/gallery/widget/AntiDoubleClickListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onAntiDoubleClick(Landroid/view/View;)V
    .locals 1

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    const v0, 0x7f090075

    if-eq p1, v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/card/ui/cardlist/CardAdapter$CardHolder$1;->this$1:Lcom/miui/gallery/card/ui/cardlist/CardAdapter$CardHolder;

    invoke-static {p1}, Lcom/miui/gallery/card/ui/cardlist/CardAdapter$CardHolder;->access$000(Lcom/miui/gallery/card/ui/cardlist/CardAdapter$CardHolder;)V

    :goto_0
    return-void
.end method
