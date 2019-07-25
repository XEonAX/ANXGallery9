.class public Lcom/miui/gallery/editor/photo/app/longcrop/LongCropFragment;
.super Lcom/miui/gallery/editor/photo/app/MenuFragment;
.source "LongCropFragment.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/editor/photo/app/MenuFragment<",
        "Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractLongCropFragment;",
        "Lcom/miui/gallery/editor/photo/core/SdkProvider<",
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractLongCropFragment;",
        ">;>;"
    }
.end annotation


# instance fields
.field private mDecodeTask:Landroid/os/AsyncTask;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/AsyncTask<",
            "Ljava/lang/Void;",
            "Ljava/lang/Void;",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field private mTitle:Landroid/widget/TextView;


# direct methods
.method public constructor <init>()V
    .locals 1

    sget-object v0, Lcom/miui/gallery/editor/photo/core/Effect;->LONG_CROP:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/app/MenuFragment;-><init>(Lcom/miui/gallery/editor/photo/core/Effect;)V

    new-instance v0, Lcom/miui/gallery/editor/photo/app/longcrop/LongCropFragment$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/app/longcrop/LongCropFragment$1;-><init>(Lcom/miui/gallery/editor/photo/app/longcrop/LongCropFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/longcrop/LongCropFragment;->mDecodeTask:Landroid/os/AsyncTask;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/editor/photo/app/longcrop/LongCropFragment;)Landroid/graphics/Bitmap;
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/longcrop/LongCropFragment;->decodeOrigin()Landroid/graphics/Bitmap;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/editor/photo/app/longcrop/LongCropFragment;)Ljava/util/List;
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/longcrop/LongCropFragment;->getPreRenderData()Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/editor/photo/app/longcrop/LongCropFragment;)Lcom/miui/gallery/editor/photo/core/RenderFragment;
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/longcrop/LongCropFragment;->getRenderFragment()Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 2

    invoke-super {p0, p1}, Lcom/miui/gallery/editor/photo/app/MenuFragment;->onCreate(Landroid/os/Bundle;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/longcrop/LongCropFragment;->mDecodeTask:Landroid/os/AsyncTask;

    sget-object v0, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {p1, v0, v1}, Landroid/os/AsyncTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    const p3, 0x7f0b0061

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/editor/photo/app/MenuFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    const p2, 0x7f0902fa

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/longcrop/LongCropFragment;->mTitle:Landroid/widget/TextView;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/longcrop/LongCropFragment;->mTitle:Landroid/widget/TextView;

    const p2, 0x7f100521

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    return-void
.end method
