.class public Lcom/miui/gallery/adapter/BurstPhotoPageAdapter;
.super Lcom/miui/gallery/adapter/PhotoPageAdapter;
.source "BurstPhotoPageAdapter.java"


# direct methods
.method public constructor <init>(ILcom/miui/gallery/model/ImageLoadParams;Lcom/miui/gallery/util/photoview/ItemViewInfo;Lcom/miui/gallery/adapter/PhotoPageAdapter$OnPreviewedListener;Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageInteractionListener;)V
    .locals 0

    invoke-direct/range {p0 .. p5}, Lcom/miui/gallery/adapter/PhotoPageAdapter;-><init>(ILcom/miui/gallery/model/ImageLoadParams;Lcom/miui/gallery/util/photoview/ItemViewInfo;Lcom/miui/gallery/adapter/PhotoPageAdapter$OnPreviewedListener;Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageInteractionListener;)V

    return-void
.end method


# virtual methods
.method protected getLayoutId(I)I
    .locals 0

    const p1, 0x7f0b0101

    return p1
.end method

.method protected getViewType(I)I
    .locals 0

    const/4 p1, 0x4

    return p1
.end method

.method protected getViewTypeCount()I
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->getViewTypeCount()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    return v0
.end method

.method protected isTypeMatch(Ljava/lang/Object;I)Z
    .locals 1

    invoke-static {p1}, Lcom/miui/gallery/adapter/BurstPhotoPageAdapter;->isItemValidate(Ljava/lang/Object;)Z

    move-result p2

    const/4 v0, 0x0

    if-eqz p2, :cond_1

    check-cast p1, Lcom/miui/gallery/ui/PhotoPageItem;

    const p2, 0x7f0902d5

    invoke-virtual {p1, p2}, Lcom/miui/gallery/ui/PhotoPageItem;->getTag(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    const/4 p2, 0x4

    if-ne p1, p2, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0

    :cond_1
    return v0
.end method
