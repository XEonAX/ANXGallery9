.class Lcom/miui/gallery/widget/ScrollableViewDrawer$AdapterViewWrapper;
.super Ljava/lang/Object;
.source "ScrollableViewDrawer.java"

# interfaces
.implements Lcom/miui/gallery/widget/ScrollableViewDrawer$IScrollableView;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/widget/ScrollableViewDrawer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "AdapterViewWrapper"
.end annotation


# instance fields
.field private iAdapterView:Landroid/widget/AdapterView;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/widget/AdapterView<",
            "*>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/widget/AdapterView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer$AdapterViewWrapper;->iAdapterView:Landroid/widget/AdapterView;

    return-void
.end method


# virtual methods
.method public canScroll()Z
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer$AdapterViewWrapper;->iAdapterView:Landroid/widget/AdapterView;

    invoke-virtual {v0}, Landroid/widget/AdapterView;->getFirstVisiblePosition()I

    move-result v0

    const/4 v1, 0x1

    if-lez v0, :cond_0

    const-string v2, "ScrollableViewDrawer"

    const-string v3, "canScrollDown true first visible %s"

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v2, v3, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return v1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer$AdapterViewWrapper;->iAdapterView:Landroid/widget/AdapterView;

    invoke-virtual {v0}, Landroid/widget/AdapterView;->getPaddingTop()I

    move-result v0

    iget-object v2, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer$AdapterViewWrapper;->iAdapterView:Landroid/widget/AdapterView;

    invoke-virtual {v2}, Landroid/widget/AdapterView;->getChildCount()I

    move-result v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v2, :cond_2

    iget-object v5, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer$AdapterViewWrapper;->iAdapterView:Landroid/widget/AdapterView;

    invoke-virtual {v5, v4}, Landroid/widget/AdapterView;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/View;->getTop()I

    move-result v5

    if-ge v5, v0, :cond_1

    const-string v0, "ScrollableViewDrawer"

    const-string v2, "canScrollDown true %s"

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v0, v2, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return v1

    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_2
    return v3
.end method
