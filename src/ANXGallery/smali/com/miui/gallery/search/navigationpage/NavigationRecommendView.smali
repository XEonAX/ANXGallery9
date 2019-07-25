.class public Lcom/miui/gallery/search/navigationpage/NavigationRecommendView;
.super Landroid/widget/GridView;
.source "NavigationRecommendView.java"

# interfaces
.implements Lcom/miui/gallery/search/navigationpage/NavigationSectionContentView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/search/navigationpage/NavigationRecommendView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/miui/gallery/search/navigationpage/NavigationRecommendView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Landroid/widget/GridView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public getContentAdapter()Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/search/navigationpage/NavigationRecommendView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/search/navigationpage/NavigationRecommendView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter;

    :goto_0
    return-object v0
.end method

.method public onMeasure(II)V
    .locals 1

    const p2, 0x1fffffff

    const/high16 v0, -0x80000000

    invoke-static {p2, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p2

    invoke-super {p0, p1, p2}, Landroid/widget/GridView;->onMeasure(II)V

    return-void
.end method

.method public setContentAdapter(Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter;)V
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/search/navigationpage/NavigationRecommendView;->setAdapter(Landroid/widget/ListAdapter;)V

    return-void
.end method
