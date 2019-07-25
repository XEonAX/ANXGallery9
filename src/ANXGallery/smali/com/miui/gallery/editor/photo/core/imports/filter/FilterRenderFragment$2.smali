.class Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$2;
.super Ljava/lang/Object;
.source "FilterRenderFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$2;->this$0:Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$2;->this$0:Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->access$400(Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;)Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$2;->this$0:Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->access$500(Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;Z)V

    return-void
.end method
