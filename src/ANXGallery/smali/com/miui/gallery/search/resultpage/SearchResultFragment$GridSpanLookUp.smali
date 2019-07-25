.class Lcom/miui/gallery/search/resultpage/SearchResultFragment$GridSpanLookUp;
.super Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;
.source "SearchResultFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/search/resultpage/SearchResultFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "GridSpanLookUp"
.end annotation


# instance fields
.field private final mFullSpanDelegate:Lcom/miui/gallery/search/core/display/FullSpanDelegate;

.field private final mLayoutManager:Landroid/support/v7/widget/GridLayoutManager;

.field final synthetic this$0:Lcom/miui/gallery/search/resultpage/SearchResultFragment;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/search/resultpage/SearchResultFragment;Landroid/support/v7/widget/GridLayoutManager;Lcom/miui/gallery/search/core/display/FullSpanDelegate;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragment$GridSpanLookUp;->this$0:Lcom/miui/gallery/search/resultpage/SearchResultFragment;

    invoke-direct {p0}, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;-><init>()V

    iput-object p2, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragment$GridSpanLookUp;->mLayoutManager:Landroid/support/v7/widget/GridLayoutManager;

    iput-object p3, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragment$GridSpanLookUp;->mFullSpanDelegate:Lcom/miui/gallery/search/core/display/FullSpanDelegate;

    return-void
.end method


# virtual methods
.method public getSpanSize(I)I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragment$GridSpanLookUp;->mFullSpanDelegate:Lcom/miui/gallery/search/core/display/FullSpanDelegate;

    invoke-interface {v0, p1}, Lcom/miui/gallery/search/core/display/FullSpanDelegate;->isFullSpan(I)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragment$GridSpanLookUp;->mLayoutManager:Landroid/support/v7/widget/GridLayoutManager;

    invoke-virtual {p1}, Landroid/support/v7/widget/GridLayoutManager;->getSpanCount()I

    move-result p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x1

    :goto_0
    return p1
.end method
