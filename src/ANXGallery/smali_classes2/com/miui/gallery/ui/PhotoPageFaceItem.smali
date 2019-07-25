.class public Lcom/miui/gallery/ui/PhotoPageFaceItem;
.super Lcom/miui/gallery/ui/PhotoPageItem;
.source "PhotoPageFaceItem.java"

# interfaces
.implements Lcom/miui/gallery/data/CacheOfAllFacesInOnePhoto$PhotoViewProvider;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;,
        Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;,
        Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHandler;
    }
.end annotation


# instance fields
.field private mFaceHandler:Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHandler;

.field private mFaceHighLightManager:Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;

.field private mFaceNameLablesManager:Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/ui/PhotoPageItem;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method static synthetic access$1100(Lcom/miui/gallery/ui/PhotoPageFaceItem;)Z
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFaceItem;->isCheckInAction()Z

    move-result p0

    return p0
.end method

.method static synthetic access$600(Lcom/miui/gallery/ui/PhotoPageFaceItem;Lcom/miui/gallery/model/BaseDataItem;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFaceItem;->bindFaceAnymore(Lcom/miui/gallery/model/BaseDataItem;)V

    return-void
.end method

.method static synthetic access$800(Lcom/miui/gallery/ui/PhotoPageFaceItem;)Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHandler;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem;->mFaceHandler:Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHandler;

    return-object p0
.end method

.method static synthetic access$900(FFLcom/miui/gallery/cloud/peopleface/PeopleFace;I)Landroid/graphics/RectF;
    .locals 0

    invoke-static {p0, p1, p2, p3}, Lcom/miui/gallery/ui/PhotoPageFaceItem;->getFaceRect(FFLcom/miui/gallery/cloud/peopleface/PeopleFace;I)Landroid/graphics/RectF;

    move-result-object p0

    return-object p0
.end method

.method private bindFaceAnymore(Lcom/miui/gallery/model/BaseDataItem;)V
    .locals 2

    move-object v0, p1

    check-cast v0, Lcom/miui/gallery/model/CloudItem;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem;->mFaceHighLightManager:Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;

    invoke-virtual {v1}, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->isVisible()Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem;->mFaceNameLablesManager:Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;

    invoke-static {v1}, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;->access$300(Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;)Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    if-eqz p1, :cond_1

    invoke-virtual {v0}, Lcom/miui/gallery/model/CloudItem;->getServerId()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_1

    invoke-static {}, Lcom/miui/gallery/data/CacheOfAllFacesInOnePhoto;->getInstance()Lcom/miui/gallery/data/CacheOfAllFacesInOnePhoto;

    move-result-object p1

    invoke-virtual {v0}, Lcom/miui/gallery/model/CloudItem;->getServerId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, p0, v1}, Lcom/miui/gallery/data/CacheOfAllFacesInOnePhoto;->requestFacesOfThePhoto(Lcom/miui/gallery/data/CacheOfAllFacesInOnePhoto$PhotoViewProvider;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    :goto_0
    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem;->mFaceNameLablesManager:Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;

    invoke-static {v1, v0, p1}, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;->access$400(Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;Lcom/miui/gallery/model/CloudItem;Ljava/util/ArrayList;)V

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem;->mFaceHighLightManager:Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;

    invoke-virtual {v1, v0, p1}, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->bindViewAndData(Lcom/miui/gallery/model/CloudItem;Ljava/util/ArrayList;)V

    return-void
.end method

.method private static getFaceRect(FFLcom/miui/gallery/cloud/peopleface/PeopleFace;I)Landroid/graphics/RectF;
    .locals 12

    iget-wide v0, p2, Lcom/miui/gallery/cloud/peopleface/PeopleFace;->faceXScale:D

    iget-wide v2, p2, Lcom/miui/gallery/cloud/peopleface/PeopleFace;->faceYScale:D

    iget-wide v4, p2, Lcom/miui/gallery/cloud/peopleface/PeopleFace;->faceWScale:D

    iget-wide v6, p2, Lcom/miui/gallery/cloud/peopleface/PeopleFace;->faceHScale:D

    const/4 v8, 0x1

    const-wide/high16 v9, 0x3ff0000000000000L    # 1.0

    const/4 v11, 0x0

    packed-switch p3, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    const/4 v11, 0x1

    :pswitch_1
    iget-wide v0, p2, Lcom/miui/gallery/cloud/peopleface/PeopleFace;->faceYScale:D

    sub-double v0, v9, v0

    iget-wide v2, p2, Lcom/miui/gallery/cloud/peopleface/PeopleFace;->faceHScale:D

    sub-double/2addr v0, v2

    iget-wide v2, p2, Lcom/miui/gallery/cloud/peopleface/PeopleFace;->faceXScale:D

    iget-wide v4, p2, Lcom/miui/gallery/cloud/peopleface/PeopleFace;->faceHScale:D

    iget-wide v6, p2, Lcom/miui/gallery/cloud/peopleface/PeopleFace;->faceWScale:D

    goto :goto_0

    :pswitch_2
    const/4 v11, 0x1

    :pswitch_3
    iget-wide v0, p2, Lcom/miui/gallery/cloud/peopleface/PeopleFace;->faceYScale:D

    iget-wide v2, p2, Lcom/miui/gallery/cloud/peopleface/PeopleFace;->faceXScale:D

    sub-double v2, v9, v2

    iget-wide v4, p2, Lcom/miui/gallery/cloud/peopleface/PeopleFace;->faceWScale:D

    sub-double/2addr v2, v4

    iget-wide v4, p2, Lcom/miui/gallery/cloud/peopleface/PeopleFace;->faceHScale:D

    iget-wide v6, p2, Lcom/miui/gallery/cloud/peopleface/PeopleFace;->faceWScale:D

    goto :goto_0

    :pswitch_4
    const/4 v11, 0x1

    :pswitch_5
    iget-wide v0, p2, Lcom/miui/gallery/cloud/peopleface/PeopleFace;->faceXScale:D

    sub-double v0, v9, v0

    iget-wide v2, p2, Lcom/miui/gallery/cloud/peopleface/PeopleFace;->faceWScale:D

    sub-double/2addr v0, v2

    iget-wide v2, p2, Lcom/miui/gallery/cloud/peopleface/PeopleFace;->faceYScale:D

    sub-double v2, v9, v2

    iget-wide p2, p2, Lcom/miui/gallery/cloud/peopleface/PeopleFace;->faceHScale:D

    sub-double/2addr v2, p2

    goto :goto_0

    :pswitch_6
    const/4 v11, 0x1

    :goto_0
    :pswitch_7
    if-eqz v11, :cond_0

    sub-double/2addr v9, v0

    sub-double v0, v9, v4

    :cond_0
    float-to-double p2, p0

    invoke-static {p2, p3}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v0, v0, p2

    double-to-float p0, v0

    float-to-double v0, p1

    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v2, v2, v0

    double-to-float p1, v2

    invoke-static {p2, p3}, Ljava/lang/Double;->isNaN(D)Z

    mul-double p2, p2, v4

    double-to-float p2, p2

    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v0, v0, v6

    double-to-float p3, v0

    new-instance v0, Landroid/graphics/RectF;

    add-float/2addr p2, p0

    add-float/2addr p3, p1

    invoke-direct {v0, p0, p1, p2, p3}, Landroid/graphics/RectF;-><init>(FFFF)V

    return-object v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_3
    .end packed-switch
.end method

.method private isCheckInAction()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem;->mCheckManager:Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->inAction()Z

    move-result v0

    return v0
.end method


# virtual methods
.method public animExit(Lcom/miui/gallery/util/photoview/ItemViewInfo;Lcom/miui/gallery/ui/PhotoPageItem$TransitionListener;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem;->mFaceHighLightManager:Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->isVisible()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem;->mFaceHighLightManager:Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->isExiting()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem;->mFaceHighLightManager:Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->onExiting()Z

    :cond_0
    invoke-super {p0, p1, p2}, Lcom/miui/gallery/ui/PhotoPageItem;->animExit(Lcom/miui/gallery/util/photoview/ItemViewInfo;Lcom/miui/gallery/ui/PhotoPageItem$TransitionListener;)V

    return-void
.end method

.method protected dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/PhotoPageItem;->dispatchDraw(Landroid/graphics/Canvas;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem;->mFaceHighLightManager:Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->isVisible()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem;->mFaceHighLightManager:Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->onDraw(Landroid/graphics/Canvas;)V

    :cond_0
    return-void
.end method

.method protected doOnMatrixChanged(Landroid/graphics/RectF;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/PhotoPageItem;->doOnMatrixChanged(Landroid/graphics/RectF;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem;->mFaceNameLablesManager:Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem;->mFaceNameLablesManager:Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;->onMatrixChanged(Landroid/graphics/RectF;)V

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem;->mFaceHighLightManager:Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem;->mFaceHighLightManager:Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->onMatrixChanged()V

    :cond_1
    return-void
.end method

.method public onActionBarVisibleChanged(Ljava/lang/Boolean;I)V
    .locals 0

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/ui/PhotoPageItem;->onActionBarVisibleChanged(Ljava/lang/Boolean;I)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFaceItem;->bindFaceAnymore(Lcom/miui/gallery/model/BaseDataItem;)V

    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 2

    const/4 v0, -0x1

    const/4 v1, 0x0

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    if-eqz p3, :cond_0

    if-ne p2, v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFaceItem;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p3}, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;->getContactInfo(Landroid/content/Context;Landroid/content/Intent;)Lcom/miui/gallery/model/PeopleContactInfo;

    move-result-object v1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem;->mFaceHandler:Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHandler;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHandler;->mRemoveFromFaceAlbumHandler:Lcom/miui/gallery/ui/renameface/RemoveFromFaceAlbumHandler;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem;->mFaceHandler:Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHandler;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHandler;->mRemoveFromFaceAlbumHandler:Lcom/miui/gallery/ui/renameface/RemoveFromFaceAlbumHandler;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/renameface/RemoveFromFaceAlbumHandler;->finishWhenGetContact(Lcom/miui/gallery/model/PeopleContactInfo;)V

    goto :goto_0

    :pswitch_1
    if-eqz p3, :cond_1

    if-ne p2, v0, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFaceItem;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p3}, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;->getContactInfo(Landroid/content/Context;Landroid/content/Intent;)Lcom/miui/gallery/model/PeopleContactInfo;

    move-result-object v1

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem;->mFaceHandler:Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHandler;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHandler;->mFaceAlbumRenameHandler:Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem;->mFaceHandler:Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHandler;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHandler;->mFaceAlbumRenameHandler:Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;->finishWhenGetContact(Lcom/miui/gallery/model/PeopleContactInfo;)V

    :cond_2
    :goto_0
    invoke-super {p0, p1, p2, p3}, Lcom/miui/gallery/ui/PhotoPageItem;->onActivityResult(IILandroid/content/Intent;)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x10
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected onDetachedFromWindow()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/ui/PhotoPageItem;->onDetachedFromWindow()V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem;->mFaceHighLightManager:Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem;->mFaceHighLightManager:Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->onDestroy()V

    :cond_0
    return-void
.end method

.method protected onFinishInflate()V
    .locals 2

    invoke-super {p0}, Lcom/miui/gallery/ui/PhotoPageItem;->onFinishInflate()V

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;-><init>(Lcom/miui/gallery/ui/PhotoPageFaceItem;Lcom/miui/gallery/ui/PhotoPageFaceItem$1;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem;->mFaceNameLablesManager:Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;-><init>(Lcom/miui/gallery/ui/PhotoPageFaceItem;Lcom/miui/gallery/ui/PhotoPageFaceItem$1;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem;->mFaceHighLightManager:Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHandler;

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHandler;-><init>(Lcom/miui/gallery/ui/PhotoPageFaceItem;Lcom/miui/gallery/ui/PhotoPageFaceItem$1;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem;->mFaceHandler:Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHandler;

    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem;->mFaceHighLightManager:Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->isVisible()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    invoke-super {p0, p1}, Lcom/miui/gallery/ui/PhotoPageItem;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public onInvalidated()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem;->mFaceHandler:Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHandler;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem;->mFaceHandler:Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHandler;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHandler;->notifyChanged()V

    :cond_0
    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 7

    invoke-super/range {p0 .. p5}, Lcom/miui/gallery/ui/PhotoPageItem;->onLayout(ZIIII)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem;->mFaceNameLablesManager:Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;->access$300(Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem;->mFaceNameLablesManager:Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    invoke-static/range {v1 .. v6}, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;->access$500(Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;ZIIII)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem;->mFaceHighLightManager:Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->isVisible()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem;->mFaceHighLightManager:Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    invoke-virtual/range {v1 .. v6}, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHighLightManager;->onLayout(ZIIII)V

    :cond_1
    return-void
.end method

.method public swapItem(Lcom/miui/gallery/model/BaseDataItem;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/PhotoPageItem;->swapItem(Lcom/miui/gallery/model/BaseDataItem;)V

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFaceItem;->bindFaceAnymore(Lcom/miui/gallery/model/BaseDataItem;)V

    return-void
.end method
