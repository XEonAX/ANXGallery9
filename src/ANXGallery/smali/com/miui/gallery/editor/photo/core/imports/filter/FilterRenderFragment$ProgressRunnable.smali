.class Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$ProgressRunnable;
.super Ljava/lang/Object;
.source "FilterRenderFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ProgressRunnable"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$ProgressRunnable;->this$0:Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$ProgressRunnable;-><init>(Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$ProgressRunnable;->this$0:Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->access$200(Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;)Landroid/widget/ProgressBar;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    return-void
.end method
