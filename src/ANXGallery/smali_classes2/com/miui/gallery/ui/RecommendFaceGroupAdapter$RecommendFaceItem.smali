.class Lcom/miui/gallery/ui/RecommendFaceGroupAdapter$RecommendFaceItem;
.super Ljava/lang/Object;
.source "RecommendFaceGroupAdapter.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RecommendFaceItem"
.end annotation


# instance fields
.field private mCheckbox:Landroid/widget/CheckBox;

.field private mCoverImage:Landroid/widget/ImageView;

.field private mCoverImageAware:Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;

.field private mFacePath:Ljava/lang/String;

.field private mFileLength:J

.field private mPhotoCloudId:J

.field private mServerId:Ljava/lang/String;

.field final synthetic this$0:Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;Landroid/view/View;)V
    .locals 1

    iput-object p1, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter$RecommendFaceItem;->this$0:Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const p1, 0x7f090252

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter$RecommendFaceItem;->mCoverImage:Landroid/widget/ImageView;

    new-instance p1, Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;

    iget-object v0, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter$RecommendFaceItem;->mCoverImage:Landroid/widget/ImageView;

    invoke-direct {p1, v0}, Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;-><init>(Landroid/widget/ImageView;)V

    iput-object p1, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter$RecommendFaceItem;->mCoverImageAware:Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;

    const p1, 0x7f090110

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/CheckBox;

    iput-object p1, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter$RecommendFaceItem;->mCheckbox:Landroid/widget/CheckBox;

    iget-object p1, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter$RecommendFaceItem;->mCoverImage:Landroid/widget/ImageView;

    invoke-virtual {p1, p0}, Landroid/widget/ImageView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter$RecommendFaceItem;->mCoverImage:Landroid/widget/ImageView;

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setClickable(Z)V

    iget-object p1, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter$RecommendFaceItem;->mCheckbox:Landroid/widget/CheckBox;

    invoke-virtual {p1, p0}, Landroid/widget/CheckBox;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter$RecommendFaceItem;->mCheckbox:Landroid/widget/CheckBox;

    invoke-virtual {p1, p2}, Landroid/widget/CheckBox;->setChecked(Z)V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/ui/RecommendFaceGroupAdapter$RecommendFaceItem;)J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter$RecommendFaceItem;->mFileLength:J

    return-wide v0
.end method


# virtual methods
.method public bindImage(Ljava/lang/String;Landroid/net/Uri;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Landroid/graphics/RectF;Lcom/miui/gallery/sdk/download/DownloadType;)V
    .locals 13

    move-object v0, p0

    invoke-static {}, Lcom/miui/gallery/cloud/NetworkUtils;->isActiveNetworkMetered()Z

    move-result v1

    if-eqz v1, :cond_0

    sget-object v1, Lcom/miui/gallery/sdk/download/DownloadType;->MICRO:Lcom/miui/gallery/sdk/download/DownloadType;

    :goto_0
    move-object v4, v1

    goto :goto_1

    :cond_0
    sget-object v1, Lcom/miui/gallery/sdk/download/DownloadType;->THUMBNAIL:Lcom/miui/gallery/sdk/download/DownloadType;

    goto :goto_0

    :goto_1
    iget-object v5, v0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter$RecommendFaceItem;->mCoverImage:Landroid/widget/ImageView;

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object v1

    iget-object v7, v1, Lcom/miui/gallery/Config$ThumbConfig;->sMicroTargetSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    const/4 v9, 0x1

    const/4 v10, 0x1

    iget-object v1, v0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter$RecommendFaceItem;->this$0:Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;

    invoke-static {v1}, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;->access$200(Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;)Lcom/miui/gallery/util/BindImageHelper$OnImageLoadingCompleteListener;

    move-result-object v11

    move-object v2, p1

    move-object v3, p2

    move-object/from16 v6, p3

    move-object/from16 v8, p4

    invoke-static/range {v2 .. v11}, Lcom/miui/gallery/util/BindImageHelper;->bindImage(Ljava/lang/String;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Landroid/widget/ImageView;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Landroid/graphics/RectF;ZZLcom/miui/gallery/util/BindImageHelper$OnImageLoadingCompleteListener;)V

    sget-object v1, Lcom/miui/gallery/sdk/download/DownloadType;->MICRO:Lcom/miui/gallery/sdk/download/DownloadType;

    move-object/from16 v2, p5

    if-ne v1, v2, :cond_1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    invoke-static {}, Lcom/miui/gallery/cloud/NetworkUtils;->isActiveNetworkMetered()Z

    move-result v1

    if-nez v1, :cond_1

    invoke-static {}, Lcom/miui/gallery/util/uil/CloudImageLoader;->getInstance()Lcom/miui/gallery/util/uil/CloudImageLoader;

    move-result-object v2

    sget-object v4, Lcom/miui/gallery/sdk/download/DownloadType;->THUMBNAIL:Lcom/miui/gallery/sdk/download/DownloadType;

    iget-object v5, v0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter$RecommendFaceItem;->mCoverImage:Landroid/widget/ImageView;

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object v1

    iget-object v7, v1, Lcom/miui/gallery/Config$ThumbConfig;->sMicroTargetSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    iget-object v1, v0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter$RecommendFaceItem;->this$0:Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;

    invoke-static {v1}, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;->access$500(Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;)Lcom/miui/gallery/util/uil/CloudImageLoadingListener;

    move-result-object v8

    const/4 v9, 0x0

    const/4 v11, 0x1

    const/4 v12, 0x0

    move-object v3, p2

    move-object/from16 v6, p3

    move-object/from16 v10, p4

    invoke-virtual/range {v2 .. v12}, Lcom/miui/gallery/util/uil/CloudImageLoader;->displayImage(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Landroid/widget/ImageView;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Lcom/miui/gallery/util/uil/CloudImageLoadingListener;Lcom/miui/gallery/util/uil/CloudImageLoadingProgressListener;Landroid/graphics/RectF;ZZ)V

    :cond_1
    return-void
.end method

.method public needToFresh(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)V
    .locals 11

    iget-object v0, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter$RecommendFaceItem;->mFacePath:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter$RecommendFaceItem;->mServerId:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    new-array v0, v0, [Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter$RecommendFaceItem;->mServerId:Ljava/lang/String;

    invoke-static {v1, v0}, Lcom/miui/gallery/provider/FaceManager;->queryCoverImageOfOneFace(Ljava/lang/String;[Landroid/graphics/RectF;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter$RecommendFaceItem;->mFacePath:Ljava/lang/String;

    iget-object v2, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter$RecommendFaceItem;->mFacePath:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v3

    sget-object v2, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->FILE:Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    invoke-virtual {v2, v1}, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->wrap(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter$RecommendFaceItem;->mCoverImageAware:Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v1, 0x0

    aget-object v10, v0, v1

    move-object v6, p1

    invoke-virtual/range {v3 .. v10}, Lcom/nostra13/universalimageloader/core/ImageLoader;->displayImage(Ljava/lang/String;Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;Lcom/nostra13/universalimageloader/core/listener/ImageLoadingProgressListener;Landroid/graphics/RectF;)V

    :cond_0
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    const v0, 0x7f090110

    if-eq p1, v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter$RecommendFaceItem;->this$0:Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;

    iget-object v0, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter$RecommendFaceItem;->mServerId:Ljava/lang/String;

    iget-object v1, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter$RecommendFaceItem;->mCheckbox:Landroid/widget/CheckBox;

    invoke-virtual {v1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v1

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;->access$300(Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;Ljava/lang/String;Z)V

    :goto_0
    return-void
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 12

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const/4 v1, 0x0

    const v2, 0x7f090252

    if-ne v0, v2, :cond_1

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/4 v2, 0x3

    const/4 v3, 0x1

    if-eq v0, v2, :cond_0

    packed-switch v0, :pswitch_data_0

    goto :goto_1

    :pswitch_0
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v0

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    sub-float/2addr v0, v2

    float-to-int v0, v0

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    move-result v2

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result p2

    sub-float/2addr v2, p2

    float-to-int p2, v2

    invoke-static {v0, p2, p1, v1}, Lcom/miui/gallery/util/photoview/ItemViewInfo;->getImageInfo(IILandroid/view/View;I)Lcom/miui/gallery/util/photoview/ItemViewInfo;

    move-result-object v6

    iget-object v4, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter$RecommendFaceItem;->this$0:Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;

    iget-object v5, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter$RecommendFaceItem;->mFacePath:Ljava/lang/String;

    iget-object v7, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter$RecommendFaceItem;->mServerId:Ljava/lang/String;

    iget-wide v8, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter$RecommendFaceItem;->mPhotoCloudId:J

    iget-wide v10, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter$RecommendFaceItem;->mFileLength:J

    invoke-static/range {v4 .. v11}, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;->access$400(Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;Ljava/lang/String;Lcom/miui/gallery/util/photoview/ItemViewInfo;Ljava/lang/String;JJ)V

    goto :goto_0

    :pswitch_1
    invoke-virtual {p1, v3}, Landroid/view/View;->setPressed(Z)V

    goto :goto_1

    :cond_0
    :goto_0
    invoke-virtual {p1, v1}, Landroid/view/View;->setPressed(Z)V

    :goto_1
    return v3

    :cond_1
    return v1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public setChecked(Z)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter$RecommendFaceItem;->mCheckbox:Landroid/widget/CheckBox;

    invoke-virtual {v0, p1}, Landroid/widget/CheckBox;->setChecked(Z)V

    return-void
.end method

.method public setCloudId(J)V
    .locals 0

    iput-wide p1, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter$RecommendFaceItem;->mPhotoCloudId:J

    return-void
.end method

.method public setFacePath(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter$RecommendFaceItem;->mFacePath:Ljava/lang/String;

    return-void
.end method

.method public setFileLength(J)V
    .locals 0

    iput-wide p1, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter$RecommendFaceItem;->mFileLength:J

    return-void
.end method

.method public setServerId(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter$RecommendFaceItem;->mServerId:Ljava/lang/String;

    return-void
.end method
