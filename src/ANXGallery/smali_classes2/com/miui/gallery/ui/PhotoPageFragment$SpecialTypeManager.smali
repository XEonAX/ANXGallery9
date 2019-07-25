.class Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;
.super Ljava/lang/Object;
.source "PhotoPageFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPageFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SpecialTypeManager"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager$Callback;
    }
.end annotation


# instance fields
.field private mCallbacks:Landroid/util/LongSparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/LongSparseArray<",
            "Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager$Callback;",
            ">;"
        }
    .end annotation
.end field

.field private mEnterView:Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeEnterView;

.field private mFragment:Lcom/miui/gallery/ui/PhotoPageFragment;

.field private mMediaType:I

.field private mOperationMask:I

.field private mRecognitionCallback:Lcom/miui/gallery/ui/PhotoPageFragment$RecognitionTask$Callback;

.field private mRecognitionTask:Lcom/miui/gallery/ui/PhotoPageFragment$RecognitionTask;

.field private mSupportEnter:Z


# direct methods
.method public constructor <init>(Lcom/miui/gallery/ui/PhotoPageFragment;)V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/miui/gallery/ui/-$$Lambda$PhotoPageFragment$SpecialTypeManager$z3nGU8nYFJaoEVESa564ZqIbxzc;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/-$$Lambda$PhotoPageFragment$SpecialTypeManager$z3nGU8nYFJaoEVESa564ZqIbxzc;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->mRecognitionCallback:Lcom/miui/gallery/ui/PhotoPageFragment$RecognitionTask$Callback;

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->mFragment:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$4600(Lcom/miui/gallery/ui/PhotoPageFragment;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->mSupportEnter:Z

    new-instance v0, Landroid/util/LongSparseArray;

    invoke-direct {v0}, Landroid/util/LongSparseArray;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->mCallbacks:Landroid/util/LongSparseArray;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const/4 v1, -0x1

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const-string v2, "support_operation_mask"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v1

    :goto_0
    iput v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->mOperationMask:I

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeEnterView;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->getView()Landroid/view/View;

    move-result-object p1

    const v1, 0x7f09021b

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup;

    invoke-direct {v0, p1, p0}, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeEnterView;-><init>(Landroid/view/ViewGroup;Landroid/view/View$OnClickListener;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->mEnterView:Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeEnterView;

    invoke-static {}, Lcom/miui/gallery/util/SpecialTypeMediaUtils;->isMTSpecialAITypeSupport()Z

    move-result p1

    if-eqz p1, :cond_1

    iget p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->mMediaType:I

    or-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->mMediaType:I

    :cond_1
    return-void
.end method

.method private getCallback(Lcom/miui/gallery/model/BaseDataItem;)Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager$Callback;
    .locals 6

    const/4 v0, 0x0

    if-eqz p1, :cond_3

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getSpecialTypeFlags()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long v5, v1, v3

    if-gtz v5, :cond_0

    goto :goto_1

    :cond_0
    const/4 v1, 0x0

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->mCallbacks:Landroid/util/LongSparseArray;

    invoke-virtual {v2}, Landroid/util/LongSparseArray;->size()I

    move-result v2

    :goto_0
    if-ge v1, v2, :cond_2

    iget-object v3, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->mCallbacks:Landroid/util/LongSparseArray;

    invoke-virtual {v3, v1}, Landroid/util/LongSparseArray;->keyAt(I)J

    move-result-wide v3

    invoke-virtual {p1, v3, v4}, Lcom/miui/gallery/model/BaseDataItem;->isSpecialType(J)Z

    move-result v3

    if-eqz v3, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->mCallbacks:Landroid/util/LongSparseArray;

    invoke-virtual {p1, v1}, Landroid/util/LongSparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager$Callback;

    return-object p1

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    return-object v0

    :cond_3
    :goto_1
    return-object v0
.end method

.method private getCurrentItem()Lcom/miui/gallery/model/BaseDataItem;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->mFragment:Lcom/miui/gallery/ui/PhotoPageFragment;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->mFragment:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/ViewPager;->getCurrentItem()I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->mFragment:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageFragment;->mAdapter:Lcom/miui/gallery/adapter/PhotoPageAdapter;

    invoke-virtual {v1, v0}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->getDataItem(I)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object v0

    return-object v0
.end method

.method public static synthetic lambda$new$8(Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;Lcom/miui/gallery/model/BaseDataItem;)V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->getCurrentItem()Lcom/miui/gallery/model/BaseDataItem;

    move-result-object v0

    if-eqz p1, :cond_0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/model/BaseDataItem;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->onRecognized(Lcom/miui/gallery/model/BaseDataItem;)V

    :cond_0
    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->updateItemSpecialIndicator(Lcom/miui/gallery/model/BaseDataItem;)V

    return-void
.end method

.method private onRecognized(Lcom/miui/gallery/model/BaseDataItem;)V
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->mFragment:Lcom/miui/gallery/ui/PhotoPageFragment;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->mCallbacks:Landroid/util/LongSparseArray;

    invoke-virtual {v0}, Landroid/util/LongSparseArray;->size()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_2

    iget-object v3, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->mCallbacks:Landroid/util/LongSparseArray;

    invoke-virtual {v3, v2}, Landroid/util/LongSparseArray;->keyAt(I)J

    move-result-wide v3

    iget-object v5, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->mCallbacks:Landroid/util/LongSparseArray;

    invoke-virtual {v5, v2}, Landroid/util/LongSparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager$Callback;

    if-eqz p1, :cond_1

    invoke-virtual {p1, v3, v4}, Lcom/miui/gallery/model/BaseDataItem;->isSpecialType(J)Z

    move-result v3

    if-eqz v3, :cond_1

    const/4 v3, 0x1

    goto :goto_1

    :cond_1
    const/4 v3, 0x0

    :goto_1
    invoke-interface {v5, p1, v3}, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager$Callback;->onRecognized(Lcom/miui/gallery/model/BaseDataItem;Z)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->updateEnterView(Lcom/miui/gallery/model/BaseDataItem;)V

    return-void
.end method

.method private submitRecognizeTask(Lcom/miui/gallery/model/BaseDataItem;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->mRecognitionTask:Lcom/miui/gallery/ui/PhotoPageFragment$RecognitionTask;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageFragment$RecognitionTask;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->mRecognitionCallback:Lcom/miui/gallery/ui/PhotoPageFragment$RecognitionTask$Callback;

    invoke-direct {v0, v1}, Lcom/miui/gallery/ui/PhotoPageFragment$RecognitionTask;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment$RecognitionTask$Callback;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->mRecognitionTask:Lcom/miui/gallery/ui/PhotoPageFragment$RecognitionTask;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->mRecognitionTask:Lcom/miui/gallery/ui/PhotoPageFragment$RecognitionTask;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$RecognitionTask;->execute(Lcom/miui/gallery/model/BaseDataItem;)V

    return-void
.end method

.method private updateEnterView()V
    .locals 1

    iget v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->mMediaType:I

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->getCurrentItem()Lcom/miui/gallery/model/BaseDataItem;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->updateEnterView(Lcom/miui/gallery/model/BaseDataItem;)V

    return-void
.end method

.method private updateEnterView(Lcom/miui/gallery/model/BaseDataItem;)V
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->mFragment:Lcom/miui/gallery/ui/PhotoPageFragment;

    if-eqz v0, :cond_6

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->mSupportEnter:Z

    if-nez v0, :cond_0

    goto :goto_4

    :cond_0
    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getSupportOperations()I

    move-result v2

    iget v3, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->mOperationMask:I

    and-int/2addr v2, v3

    const/16 v3, 0x200

    invoke-static {v2, v3}, Lcom/miui/gallery/util/PhotoOperationsUtil;->isSupportedOptions(II)Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v2, 0x1

    goto :goto_0

    :cond_1
    const/4 v2, 0x0

    :goto_0
    if-eqz v2, :cond_2

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->getCallback(Lcom/miui/gallery/model/BaseDataItem;)Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager$Callback;

    move-result-object v2

    if-eqz v2, :cond_2

    invoke-interface {v2}, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager$Callback;->getEnterDrawableId()I

    move-result v3

    invoke-interface {v2}, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager$Callback;->getEnterTextId()I

    move-result v2

    goto :goto_1

    :cond_2
    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_1
    iget-object v4, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->mEnterView:Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeEnterView;

    if-eqz v4, :cond_5

    if-eqz p1, :cond_3

    if-lez v3, :cond_3

    iget-object v4, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->mFragment:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v4}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$1200(Lcom/miui/gallery/ui/PhotoPageFragment;)Z

    move-result v4

    if-eqz v4, :cond_3

    const/4 v4, 0x1

    goto :goto_2

    :cond_3
    const/4 v4, 0x0

    :goto_2
    iget-object v5, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->mEnterView:Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeEnterView;

    if-eqz p1, :cond_4

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->isVideo()Z

    move-result p1

    if-eqz p1, :cond_4

    goto :goto_3

    :cond_4
    const/4 v0, 0x0

    :goto_3
    invoke-virtual {v5, v4, v0, v3, v2}, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeEnterView;->update(ZZII)V

    :cond_5
    return-void

    :cond_6
    :goto_4
    return-void
.end method

.method private updateItemSpecialIndicator(Lcom/miui/gallery/model/BaseDataItem;)V
    .locals 3

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->getCurrentItem()Lcom/miui/gallery/model/BaseDataItem;

    move-result-object v0

    if-eqz p1, :cond_0

    if-eqz v0, :cond_0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/model/BaseDataItem;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getSpecialTypeFlags()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/model/BaseDataItem;->setSpecialTypeFlags(J)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->mFragment:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragment;->mPagerHelper:Lcom/miui/gallery/ui/PhotoPagerHelper;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPagerHelper;->getCurrentItem()Lcom/miui/gallery/ui/PhotoPageItem;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageItem;->updateSpecialTypeIndicator()V

    :cond_0
    return-void
.end method


# virtual methods
.method public addTypeCallback(JLcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager$Callback;I)V
    .locals 1

    if-nez p3, :cond_0

    return-void

    :cond_0
    iget v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->mMediaType:I

    or-int/2addr p4, v0

    iput p4, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->mMediaType:I

    iget-object p4, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->mCallbacks:Landroid/util/LongSparseArray;

    invoke-virtual {p4, p1, p2, p3}, Landroid/util/LongSparseArray;->put(JLjava/lang/Object;)V

    return-void
.end method

.method public onActionBarVisibilityChanged()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->updateEnterView()V

    return-void
.end method

.method public onActivityResult()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->updateEnterView()V

    return-void
.end method

.method public onActivityTransition()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->mEnterView:Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeEnterView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->mEnterView:Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeEnterView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeEnterView;->setVisibility(I)V

    :cond_0
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1

    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result p1

    if-eqz p1, :cond_0

    return-void

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->getCurrentItem()Lcom/miui/gallery/model/BaseDataItem;

    move-result-object p1

    if-nez p1, :cond_1

    return-void

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->mFragment:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$2900(Lcom/miui/gallery/ui/PhotoPageFragment;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->mFragment:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$3000(Lcom/miui/gallery/ui/PhotoPageFragment;)V

    :cond_2
    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->getCallback(Lcom/miui/gallery/model/BaseDataItem;)Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager$Callback;

    move-result-object v0

    if-eqz v0, :cond_3

    invoke-interface {v0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager$Callback;->onEnterClick(Lcom/miui/gallery/model/BaseDataItem;)V

    :cond_3
    return-void
.end method

.method public onDestroy()V
    .locals 2

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->mEnterView:Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeEnterView;

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->mFragment:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->mCallbacks:Landroid/util/LongSparseArray;

    invoke-virtual {v1}, Landroid/util/LongSparseArray;->clear()V

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->mRecognitionTask:Lcom/miui/gallery/ui/PhotoPageFragment$RecognitionTask;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->mRecognitionTask:Lcom/miui/gallery/ui/PhotoPageFragment$RecognitionTask;

    invoke-virtual {v1}, Lcom/miui/gallery/ui/PhotoPageFragment$RecognitionTask;->release()V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->mRecognitionTask:Lcom/miui/gallery/ui/PhotoPageFragment$RecognitionTask;

    :cond_0
    return-void
.end method

.method public setEnterVisible(Z)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->mEnterView:Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeEnterView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->mEnterView:Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeEnterView;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeEnterView;->startEnterAlphaAnim(Z)V

    :cond_0
    return-void
.end method

.method public updateItem(Lcom/miui/gallery/model/BaseDataItem;)V
    .locals 2

    iget v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->mMediaType:I

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    if-eqz p1, :cond_a

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->isImage()Z

    move-result v1

    if-nez v1, :cond_1

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->isVideo()Z

    move-result v1

    if-eqz v1, :cond_a

    :cond_1
    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->hasFace()Z

    move-result v1

    if-eqz v1, :cond_2

    goto :goto_1

    :cond_2
    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->isSpecialTypeRecognized()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->onRecognized(Lcom/miui/gallery/model/BaseDataItem;)V

    return-void

    :cond_3
    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->isBurstItem()Z

    move-result v1

    if-eqz v1, :cond_4

    iget v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->mMediaType:I

    and-int/lit8 v1, v1, 0x4

    if-nez v1, :cond_4

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->onRecognized(Lcom/miui/gallery/model/BaseDataItem;)V

    return-void

    :cond_4
    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->isVideo()Z

    move-result v1

    if-eqz v1, :cond_5

    iget v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->mMediaType:I

    and-int/lit8 v1, v1, 0x2

    if-eqz v1, :cond_6

    :cond_5
    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->isImage()Z

    move-result v1

    if-eqz v1, :cond_7

    iget v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->mMediaType:I

    and-int/lit8 v1, v1, 0x1

    if-nez v1, :cond_7

    :cond_6
    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->onRecognized(Lcom/miui/gallery/model/BaseDataItem;)V

    return-void

    :cond_7
    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_9

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->isSecret()Z

    move-result v1

    if-eqz v1, :cond_8

    goto :goto_0

    :cond_8
    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->submitRecognizeTask(Lcom/miui/gallery/model/BaseDataItem;)V

    return-void

    :cond_9
    :goto_0
    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->onRecognized(Lcom/miui/gallery/model/BaseDataItem;)V

    return-void

    :cond_a
    :goto_1
    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->onRecognized(Lcom/miui/gallery/model/BaseDataItem;)V

    return-void
.end method
