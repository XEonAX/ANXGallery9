.class public Lcom/miui/gallery/ui/PhotoPageBurstItem;
.super Lcom/miui/gallery/ui/PhotoPageImageBaseItem;
.source "PhotoPageBurstItem.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/PhotoPageBurstItem$BurstCheckManager;
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/ui/PhotoPageImageBaseItem;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method protected createCheckManager()Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;
    .locals 1

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageBurstItem$BurstCheckManager;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/PhotoPageBurstItem$BurstCheckManager;-><init>(Lcom/miui/gallery/ui/PhotoPageBurstItem;)V

    return-object v0
.end method

.method protected onImageLoadFinish(Lcom/miui/gallery/error/core/ErrorCode;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/PhotoPageImageBaseItem;->onImageLoadFinish(Lcom/miui/gallery/error/core/ErrorCode;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageBurstItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Luk/co/senab/photoview/PhotoView;->setInterceptTouch(Z)V

    return-void
.end method
