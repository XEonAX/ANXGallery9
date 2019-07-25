.class Lcom/miui/gallery/cleaner/ScanResultAdapter$ScanResultHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;
.source "ScanResultAdapter.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/cleaner/ScanResultAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ScanResultHolder"
.end annotation


# instance fields
.field private mAction:Landroid/widget/TextView;

.field private mContentLayout:Landroid/view/View;

.field private mContentLayoutParams:Landroid/view/ViewGroup$LayoutParams;

.field private mDescription:Landroid/widget/TextView;

.field private mDivider:Landroid/view/View;

.field private mImages:[Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;

.field private mScanResult:Lcom/miui/gallery/cleaner/ScanResult;

.field private mSize:Landroid/widget/TextView;

.field private mTitle:Landroid/widget/TextView;

.field private mTitleLayoutParams:Landroid/widget/RelativeLayout$LayoutParams;

.field final synthetic this$0:Lcom/miui/gallery/cleaner/ScanResultAdapter;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/cleaner/ScanResultAdapter;Landroid/view/View;)V
    .locals 2

    iput-object p1, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter$ScanResultHolder;->this$0:Lcom/miui/gallery/cleaner/ScanResultAdapter;

    invoke-direct {p0, p2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    const p1, 0x7f0902fa

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter$ScanResultHolder;->mTitle:Landroid/widget/TextView;

    iget-object p1, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter$ScanResultHolder;->mTitle:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroid/widget/RelativeLayout$LayoutParams;

    iput-object p1, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter$ScanResultHolder;->mTitleLayoutParams:Landroid/widget/RelativeLayout$LayoutParams;

    const p1, 0x7f0902aa

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter$ScanResultHolder;->mSize:Landroid/widget/TextView;

    const p1, 0x7f0900d0

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter$ScanResultHolder;->mDescription:Landroid/widget/TextView;

    const/high16 p1, 0x7f090000

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter$ScanResultHolder;->mAction:Landroid/widget/TextView;

    iget-object p1, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter$ScanResultHolder;->mAction:Landroid/widget/TextView;

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p2, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const p1, 0x7f0900e3

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter$ScanResultHolder;->mDivider:Landroid/view/View;

    const/4 p1, 0x4

    new-array p1, p1, [Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;

    iput-object p1, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter$ScanResultHolder;->mImages:[Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;

    iget-object p1, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter$ScanResultHolder;->mImages:[Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;

    new-instance v0, Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;

    const v1, 0x7f09016f

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    invoke-direct {v0, v1}, Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;-><init>(Landroid/widget/ImageView;)V

    const/4 v1, 0x0

    aput-object v0, p1, v1

    iget-object p1, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter$ScanResultHolder;->mImages:[Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;

    new-instance v0, Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;

    const v1, 0x7f090170

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    invoke-direct {v0, v1}, Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;-><init>(Landroid/widget/ImageView;)V

    const/4 v1, 0x1

    aput-object v0, p1, v1

    iget-object p1, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter$ScanResultHolder;->mImages:[Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;

    new-instance v0, Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;

    const v1, 0x7f090171

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    invoke-direct {v0, v1}, Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;-><init>(Landroid/widget/ImageView;)V

    const/4 v1, 0x2

    aput-object v0, p1, v1

    iget-object p1, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter$ScanResultHolder;->mImages:[Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;

    new-instance v0, Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;

    const v1, 0x7f090172

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    invoke-direct {v0, v1}, Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;-><init>(Landroid/widget/ImageView;)V

    const/4 v1, 0x3

    aput-object v0, p1, v1

    const p1, 0x7f0900b1

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter$ScanResultHolder;->mContentLayout:Landroid/view/View;

    iget-object p1, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter$ScanResultHolder;->mContentLayout:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter$ScanResultHolder;->mContentLayoutParams:Landroid/view/ViewGroup$LayoutParams;

    return-void
.end method


# virtual methods
.method public bindData(Lcom/miui/gallery/cleaner/ScanResult;Z)V
    .locals 9

    iput-object p1, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter$ScanResultHolder;->mScanResult:Lcom/miui/gallery/cleaner/ScanResult;

    iget-object v0, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter$ScanResultHolder;->mTitle:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter$ScanResultHolder;->this$0:Lcom/miui/gallery/cleaner/ScanResultAdapter;

    invoke-static {v1}, Lcom/miui/gallery/cleaner/ScanResultAdapter;->access$000(Lcom/miui/gallery/cleaner/ScanResultAdapter;)Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/miui/gallery/cleaner/ScanResult;->getMergedTitle(Landroid/content/Context;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter$ScanResultHolder;->mSize:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter$ScanResultHolder;->this$0:Lcom/miui/gallery/cleaner/ScanResultAdapter;

    invoke-static {v1}, Lcom/miui/gallery/cleaner/ScanResultAdapter;->access$000(Lcom/miui/gallery/cleaner/ScanResultAdapter;)Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p1}, Lcom/miui/gallery/cleaner/ScanResult;->getSize()J

    move-result-wide v2

    invoke-static {v1, v2, v3}, Lcom/miui/gallery/util/FormatUtil;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter$ScanResultHolder;->mAction:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/miui/gallery/cleaner/ScanResult;->getAction()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    iget-object v0, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter$ScanResultHolder;->mDivider:Landroid/view/View;

    const/16 v1, 0x8

    const/4 v2, 0x0

    if-eqz p2, :cond_0

    const/4 p2, 0x0

    goto :goto_0

    :cond_0
    const/16 p2, 0x8

    :goto_0
    invoke-virtual {v0, p2}, Landroid/view/View;->setVisibility(I)V

    iget-object p2, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter$ScanResultHolder;->this$0:Lcom/miui/gallery/cleaner/ScanResultAdapter;

    invoke-static {p2}, Lcom/miui/gallery/cleaner/ScanResultAdapter;->access$000(Lcom/miui/gallery/cleaner/ScanResultAdapter;)Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p1}, Lcom/miui/gallery/cleaner/ScanResult;->getDescription()I

    move-result v0

    invoke-virtual {p2, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    const/16 v0, 0xf

    if-eqz p2, :cond_1

    iget-object p2, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter$ScanResultHolder;->mDescription:Landroid/widget/TextView;

    invoke-virtual {p2, v1}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object p2, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter$ScanResultHolder;->mTitleLayoutParams:Landroid/widget/RelativeLayout$LayoutParams;

    iput v2, p2, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    iget-object p2, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter$ScanResultHolder;->mTitleLayoutParams:Landroid/widget/RelativeLayout$LayoutParams;

    invoke-virtual {p2, v0}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    iget-object p2, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter$ScanResultHolder;->mContentLayoutParams:Landroid/view/ViewGroup$LayoutParams;

    iget-object v0, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter$ScanResultHolder;->this$0:Lcom/miui/gallery/cleaner/ScanResultAdapter;

    invoke-static {v0}, Lcom/miui/gallery/cleaner/ScanResultAdapter;->access$100(Lcom/miui/gallery/cleaner/ScanResultAdapter;)I

    move-result v0

    iput v0, p2, Landroid/view/ViewGroup$LayoutParams;->height:I

    goto :goto_1

    :cond_1
    iget-object p2, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter$ScanResultHolder;->mDescription:Landroid/widget/TextView;

    invoke-virtual {p2, v2}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object p2, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter$ScanResultHolder;->mDescription:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/miui/gallery/cleaner/ScanResult;->getDescription()I

    move-result v1

    invoke-virtual {p2, v1}, Landroid/widget/TextView;->setText(I)V

    iget-object p2, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter$ScanResultHolder;->mTitleLayoutParams:Landroid/widget/RelativeLayout$LayoutParams;

    iget-object v1, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter$ScanResultHolder;->this$0:Lcom/miui/gallery/cleaner/ScanResultAdapter;

    invoke-static {v1}, Lcom/miui/gallery/cleaner/ScanResultAdapter;->access$200(Lcom/miui/gallery/cleaner/ScanResultAdapter;)I

    move-result v1

    iput v1, p2, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    iget-object p2, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter$ScanResultHolder;->mTitleLayoutParams:Landroid/widget/RelativeLayout$LayoutParams;

    invoke-virtual {p2, v0}, Landroid/widget/RelativeLayout$LayoutParams;->removeRule(I)V

    iget-object p2, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter$ScanResultHolder;->mContentLayoutParams:Landroid/view/ViewGroup$LayoutParams;

    const/4 v0, -0x2

    iput v0, p2, Landroid/view/ViewGroup$LayoutParams;->height:I

    :goto_1
    iget-object p2, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter$ScanResultHolder;->mTitle:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter$ScanResultHolder;->mTitleLayoutParams:Landroid/widget/RelativeLayout$LayoutParams;

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object p2, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter$ScanResultHolder;->mContentLayout:Landroid/view/View;

    iget-object v0, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter$ScanResultHolder;->mContentLayoutParams:Landroid/view/ViewGroup$LayoutParams;

    invoke-virtual {p2, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p1}, Lcom/miui/gallery/cleaner/ScanResult;->getImages()[Lcom/miui/gallery/cleaner/ScanResult$ResultImage;

    move-result-object p1

    const/4 p2, 0x0

    :goto_2
    iget-object v0, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter$ScanResultHolder;->mImages:[Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;

    array-length v0, v0

    if-ge p2, v0, :cond_3

    array-length v0, p1

    if-le v0, p2, :cond_2

    aget-object v0, p1, p2

    if-eqz v0, :cond_2

    iget-object v1, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter$ScanResultHolder;->mImages:[Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;

    aget-object v1, v1, p2

    invoke-virtual {v1}, Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;->getWrappedView()Landroid/widget/ImageView;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object v3, v0, Lcom/miui/gallery/cleaner/ScanResult$ResultImage;->mPath:Ljava/lang/String;

    iget-wide v0, v0, Lcom/miui/gallery/cleaner/ScanResult$ResultImage;->mId:J

    invoke-static {v0, v1}, Lcom/miui/gallery/util/uil/CloudUriAdapter;->getDownloadUri(J)Landroid/net/Uri;

    move-result-object v4

    sget-object v5, Lcom/miui/gallery/sdk/download/DownloadType;->MICRO:Lcom/miui/gallery/sdk/download/DownloadType;

    iget-object v0, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter$ScanResultHolder;->mImages:[Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;

    aget-object v6, v0, p2

    iget-object v0, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter$ScanResultHolder;->this$0:Lcom/miui/gallery/cleaner/ScanResultAdapter;

    invoke-static {v0}, Lcom/miui/gallery/cleaner/ScanResultAdapter;->access$300(Lcom/miui/gallery/cleaner/ScanResultAdapter;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v7

    iget-object v0, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter$ScanResultHolder;->this$0:Lcom/miui/gallery/cleaner/ScanResultAdapter;

    invoke-static {v0}, Lcom/miui/gallery/cleaner/ScanResultAdapter;->access$400(Lcom/miui/gallery/cleaner/ScanResultAdapter;)Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    move-result-object v8

    invoke-static/range {v3 .. v8}, Lcom/miui/gallery/util/BindImageHelper;->bindImage(Ljava/lang/String;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;)V

    goto :goto_3

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter$ScanResultHolder;->mImages:[Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;

    aget-object v0, v0, p2

    invoke-virtual {v0}, Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;->getWrappedView()Landroid/widget/ImageView;

    move-result-object v0

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    :goto_3
    add-int/lit8 p2, p2, 0x1

    goto :goto_2

    :cond_3
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter$ScanResultHolder;->mScanResult:Lcom/miui/gallery/cleaner/ScanResult;

    iget-object v0, p0, Lcom/miui/gallery/cleaner/ScanResultAdapter$ScanResultHolder;->this$0:Lcom/miui/gallery/cleaner/ScanResultAdapter;

    invoke-static {v0}, Lcom/miui/gallery/cleaner/ScanResultAdapter;->access$000(Lcom/miui/gallery/cleaner/ScanResultAdapter;)Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/cleaner/ScanResult;->onClick(Landroid/content/Context;)V

    return-void
.end method
