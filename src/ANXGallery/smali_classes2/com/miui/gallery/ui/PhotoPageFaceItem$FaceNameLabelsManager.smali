.class Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;
.super Ljava/lang/Object;
.source "PhotoPageFaceItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPageFaceItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FaceNameLabelsManager"
.end annotation


# instance fields
.field private mLables:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private mLastFaces:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/cloud/peopleface/PeopleFace;",
            ">;"
        }
    .end annotation
.end field

.field private mOrientation:I

.field final synthetic this$0:Lcom/miui/gallery/ui/PhotoPageFaceItem;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/ui/PhotoPageFaceItem;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFaceItem;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;->mLables:Ljava/util/ArrayList;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;->mLastFaces:Ljava/util/ArrayList;

    const/4 p1, 0x0

    iput p1, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;->mOrientation:I

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/ui/PhotoPageFaceItem;Lcom/miui/gallery/ui/PhotoPageFaceItem$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;-><init>(Lcom/miui/gallery/ui/PhotoPageFaceItem;)V

    return-void
.end method

.method static synthetic access$1000(Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;Lcom/miui/gallery/cloud/peopleface/PeopleFace;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;->viewAlbum(Lcom/miui/gallery/cloud/peopleface/PeopleFace;)V

    return-void
.end method

.method static synthetic access$300(Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;)Z
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;->isVisible()Z

    move-result p0

    return p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;Lcom/miui/gallery/model/CloudItem;Ljava/util/ArrayList;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;->bindViewAndData(Lcom/miui/gallery/model/CloudItem;Ljava/util/ArrayList;)V

    return-void
.end method

.method static synthetic access$500(Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;ZIIII)V
    .locals 0

    invoke-direct/range {p0 .. p5}, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;->onLayout(ZIIII)V

    return-void
.end method

.method static synthetic access$700(Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;Lcom/miui/gallery/cloud/peopleface/PeopleFace;Lcom/miui/gallery/model/BaseDataItem;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;->showMenuDialog(Lcom/miui/gallery/cloud/peopleface/PeopleFace;Lcom/miui/gallery/model/BaseDataItem;)V

    return-void
.end method

.method private bindViewAndData(Lcom/miui/gallery/model/CloudItem;Ljava/util/ArrayList;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/model/CloudItem;",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/cloud/peopleface/PeopleFace;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;->isVisible()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;->removeFacelabel()V

    return-void

    :cond_0
    if-eqz p1, :cond_4

    invoke-virtual {p1}, Lcom/miui/gallery/model/CloudItem;->getServerId()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_4

    if-eqz p2, :cond_3

    invoke-direct {p0, p2}, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;->notChangedFaces(Ljava/util/ArrayList;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto/16 :goto_2

    :cond_1
    invoke-virtual {p1}, Lcom/miui/gallery/model/CloudItem;->getOrientation()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;->mOrientation:I

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;->removeFacelabel()V

    invoke-virtual {p2}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;->mLastFaces:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/cloud/peopleface/PeopleFace;

    new-instance v1, Landroid/widget/TextView;

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFaceItem;

    iget-object v2, v2, Lcom/miui/gallery/ui/PhotoPageFaceItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {v2}, Luk/co/senab/photoview/PhotoView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iget-object v2, v0, Lcom/miui/gallery/cloud/peopleface/PeopleFace;->peopleName:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_2

    iget-object v2, v0, Lcom/miui/gallery/cloud/peopleface/PeopleFace;->peopleName:Ljava/lang/String;

    goto :goto_1

    :cond_2
    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFaceItem;

    iget-object v2, v2, Lcom/miui/gallery/ui/PhotoPageFaceItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {v2}, Luk/co/senab/photoview/PhotoView;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f100784

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    :goto_1
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v2, 0x7f090117

    invoke-virtual {v1, v2, v0}, Landroid/widget/TextView;->setTag(ILjava/lang/Object;)V

    const/16 v2, 0x11

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setGravity(I)V

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFaceItem;

    iget-object v3, v3, Lcom/miui/gallery/ui/PhotoPageFaceItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {v3}, Luk/co/senab/photoview/PhotoView;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f060229

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v1, v2, v3}, Landroid/widget/TextView;->setTextSize(IF)V

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFaceItem;

    invoke-virtual {v2}, Lcom/miui/gallery/ui/PhotoPageFaceItem;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0501a4

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    const v2, 0x7f070115

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setBackgroundResource(I)V

    new-instance v2, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v3, -0x2

    invoke-direct {v2, v3, v3}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    iget-object v3, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFaceItem;

    invoke-virtual {v3, v1, v2}, Lcom/miui/gallery/ui/PhotoPageFaceItem;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v2, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager$1;

    invoke-direct {v2, p0, v0, p1}, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager$1;-><init>(Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;Lcom/miui/gallery/cloud/peopleface/PeopleFace;Lcom/miui/gallery/model/CloudItem;)V

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;->mLables:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    :cond_3
    :goto_2
    return-void

    :cond_4
    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;->removeFacelabel()V

    :cond_5
    return-void
.end method

.method private isVisible()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFaceItem;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageFaceItem;->access$800(Lcom/miui/gallery/ui/PhotoPageFaceItem;)Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHandler;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFaceItem;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageFaceItem;->access$800(Lcom/miui/gallery/ui/PhotoPageFaceItem;)Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHandler;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceHandler;->shouldShow()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFaceItem;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageFaceItem;->access$1100(Lcom/miui/gallery/ui/PhotoPageFaceItem;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private notChangedFaces(Ljava/util/ArrayList;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/cloud/peopleface/PeopleFace;",
            ">;)Z"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;->mLastFaces:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    if-ne v0, v1, :cond_2

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/cloud/peopleface/PeopleFace;

    iget-object v3, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;->mLastFaces:Ljava/util/ArrayList;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/miui/gallery/cloud/peopleface/PeopleFace;

    invoke-virtual {v1, v3}, Lcom/miui/gallery/cloud/peopleface/PeopleFace;->equalMainInfoWith(Lcom/miui/gallery/cloud/peopleface/PeopleFace;)Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-ne v0, p1, :cond_2

    const/4 p1, 0x1

    return p1

    :cond_2
    return v2
.end method

.method private onLayout(ZIIII)V
    .locals 2

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFaceItem;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFaceItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {p1}, Luk/co/senab/photoview/PhotoView;->getDrawableSize()Landroid/graphics/RectF;

    move-result-object p1

    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result p2

    const/4 p3, 0x0

    cmpl-float p2, p2, p3

    if-eqz p2, :cond_0

    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    move-result p2

    cmpl-float p2, p2, p3

    if-eqz p2, :cond_0

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;->mLables:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_0

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Landroid/view/View;

    const p4, 0x7f090117

    invoke-virtual {p3, p4}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Lcom/miui/gallery/cloud/peopleface/PeopleFace;

    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result p5

    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    move-result v0

    iget v1, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;->mOrientation:I

    invoke-static {p5, v0, p4, v1}, Lcom/miui/gallery/ui/PhotoPageFaceItem;->access$900(FFLcom/miui/gallery/cloud/peopleface/PeopleFace;I)Landroid/graphics/RectF;

    move-result-object p4

    iget-object p5, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFaceItem;

    iget-object p5, p5, Lcom/miui/gallery/ui/PhotoPageFaceItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {p5, p4}, Luk/co/senab/photoview/PhotoView;->getAbsoluteRect(Landroid/graphics/RectF;)Z

    iget p5, p4, Landroid/graphics/RectF;->left:F

    float-to-int p5, p5

    iget v0, p4, Landroid/graphics/RectF;->right:F

    float-to-int v0, v0

    add-int/2addr p5, v0

    div-int/lit8 p5, p5, 0x2

    invoke-virtual {p3}, Landroid/view/View;->getMeasuredWidth()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    sub-int/2addr p5, v0

    iget p4, p4, Landroid/graphics/RectF;->top:F

    float-to-int p4, p4

    invoke-virtual {p3}, Landroid/view/View;->getMeasuredHeight()I

    move-result v0

    sub-int/2addr p4, v0

    add-int/lit8 p4, p4, -0x14

    invoke-virtual {p3}, Landroid/view/View;->getMeasuredWidth()I

    move-result v0

    add-int/2addr v0, p5

    invoke-virtual {p3}, Landroid/view/View;->getMeasuredHeight()I

    move-result v1

    add-int/2addr v1, p4

    invoke-virtual {p3, p5, p4, v0, v1}, Landroid/view/View;->layout(IIII)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method private removeFacelabel()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;->mLables:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;->mLables:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFaceItem;

    invoke-virtual {v2, v1}, Lcom/miui/gallery/ui/PhotoPageFaceItem;->removeView(Landroid/view/View;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;->mLables:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;->mLastFaces:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    return-void
.end method

.method private showMenuDialog(Lcom/miui/gallery/cloud/peopleface/PeopleFace;Lcom/miui/gallery/model/BaseDataItem;)V
    .locals 5

    const/4 p2, 0x2

    new-array p2, p2, [Ljava/lang/String;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFaceItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFaceItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoView;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f10077e

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    aput-object v0, p2, v1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFaceItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFaceItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoView;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Object;

    iget-object v4, p1, Lcom/miui/gallery/cloud/peopleface/PeopleFace;->peopleName:Ljava/lang/String;

    aput-object v4, v3, v1

    const v1, 0x7f1004e4

    invoke-virtual {v0, v1, v3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    aput-object v0, p2, v2

    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFaceItem;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageFaceItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {v1}, Luk/co/senab/photoview/PhotoView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    new-instance v1, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager$2;

    invoke-direct {v1, p0, p1}, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager$2;-><init>(Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;Lcom/miui/gallery/cloud/peopleface/PeopleFace;)V

    const/4 p1, -0x1

    invoke-virtual {v0, p2, p1, v1}, Landroid/app/AlertDialog$Builder;->setSingleChoiceItems([Ljava/lang/CharSequence;ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/Dialog;->show()V

    return-void
.end method

.method private viewAlbum(Lcom/miui/gallery/cloud/peopleface/PeopleFace;)V
    .locals 4

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    iget-object v1, p1, Lcom/miui/gallery/cloud/peopleface/PeopleFace;->groupId:Ljava/lang/String;

    iget-object v2, p1, Lcom/miui/gallery/cloud/peopleface/PeopleFace;->localGroupId:Ljava/lang/String;

    const-string v3, "server_id_of_album"

    invoke-virtual {v0, v3, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "local_id_of_album"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "album_name"

    iget-object p1, p1, Lcom/miui/gallery/cloud/peopleface/PeopleFace;->peopleName:Ljava/lang/String;

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFaceItem;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFaceItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {p1}, Luk/co/senab/photoview/PhotoView;->getContext()Landroid/content/Context;

    move-result-object p1

    const-class v1, Lcom/miui/gallery/activity/facebaby/FacePageActivity;

    invoke-virtual {v0, p1, v1}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFaceItem;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFaceItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {p1}, Luk/co/senab/photoview/PhotoView;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method


# virtual methods
.method public final onMatrixChanged(Landroid/graphics/RectF;)V
    .locals 7

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;->isVisible()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v2, 0x1

    iget v0, p1, Landroid/graphics/RectF;->left:F

    float-to-int v3, v0

    iget v0, p1, Landroid/graphics/RectF;->top:F

    float-to-int v4, v0

    iget v0, p1, Landroid/graphics/RectF;->right:F

    float-to-int v5, v0

    iget p1, p1, Landroid/graphics/RectF;->bottom:F

    float-to-int v6, p1

    move-object v1, p0

    invoke-direct/range {v1 .. v6}, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;->onLayout(ZIIII)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFaceItem;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageFaceItem;->invalidate()V

    goto :goto_0

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFaceItem$FaceNameLabelsManager;->removeFacelabel()V

    :goto_0
    return-void
.end method
