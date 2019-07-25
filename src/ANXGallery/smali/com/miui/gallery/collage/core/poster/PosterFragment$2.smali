.class Lcom/miui/gallery/collage/core/poster/PosterFragment$2;
.super Ljava/lang/Object;
.source "PosterFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/collage/core/poster/PosterFragment;->setPosterModelToPosterLayout(Lcom/miui/gallery/collage/core/poster/PosterModel;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/collage/core/poster/PosterFragment;

.field final synthetic val$posterModel:Lcom/miui/gallery/collage/core/poster/PosterModel;


# direct methods
.method constructor <init>(Lcom/miui/gallery/collage/core/poster/PosterFragment;Lcom/miui/gallery/collage/core/poster/PosterModel;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/collage/core/poster/PosterFragment$2;->this$0:Lcom/miui/gallery/collage/core/poster/PosterFragment;

    iput-object p2, p0, Lcom/miui/gallery/collage/core/poster/PosterFragment$2;->val$posterModel:Lcom/miui/gallery/collage/core/poster/PosterModel;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    iget-object v0, p0, Lcom/miui/gallery/collage/core/poster/PosterFragment$2;->this$0:Lcom/miui/gallery/collage/core/poster/PosterFragment;

    invoke-static {v0}, Lcom/miui/gallery/collage/core/poster/PosterFragment;->access$100(Lcom/miui/gallery/collage/core/poster/PosterFragment;)Lcom/miui/gallery/collage/widget/PosterLayout;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/collage/widget/PosterLayout;->getWidth()I

    move-result v3

    iget-object v0, p0, Lcom/miui/gallery/collage/core/poster/PosterFragment$2;->this$0:Lcom/miui/gallery/collage/core/poster/PosterFragment;

    invoke-static {v0}, Lcom/miui/gallery/collage/core/poster/PosterFragment;->access$100(Lcom/miui/gallery/collage/core/poster/PosterFragment;)Lcom/miui/gallery/collage/widget/PosterLayout;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/collage/widget/PosterLayout;->getHeight()I

    move-result v4

    new-instance v1, Lcom/miui/gallery/collage/render/PosterElementRender;

    invoke-direct {v1}, Lcom/miui/gallery/collage/render/PosterElementRender;-><init>()V

    iget-object v2, p0, Lcom/miui/gallery/collage/core/poster/PosterFragment$2;->val$posterModel:Lcom/miui/gallery/collage/core/poster/PosterModel;

    iget-object v0, p0, Lcom/miui/gallery/collage/core/poster/PosterFragment$2;->this$0:Lcom/miui/gallery/collage/core/poster/PosterFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/collage/core/poster/PosterFragment;->getActivity()Landroid/app/Activity;

    move-result-object v5

    new-instance v6, Lcom/miui/gallery/collage/core/poster/PosterFragment$2$1;

    invoke-direct {v6, p0, v1}, Lcom/miui/gallery/collage/core/poster/PosterFragment$2$1;-><init>(Lcom/miui/gallery/collage/core/poster/PosterFragment$2;Lcom/miui/gallery/collage/render/PosterElementRender;)V

    invoke-virtual/range {v1 .. v6}, Lcom/miui/gallery/collage/render/PosterElementRender;->initializeAsync(Lcom/miui/gallery/collage/core/poster/PosterModel;IILandroid/content/Context;Lcom/miui/gallery/collage/render/PosterElementRender$LoadDataListener;)V

    return-void
.end method
