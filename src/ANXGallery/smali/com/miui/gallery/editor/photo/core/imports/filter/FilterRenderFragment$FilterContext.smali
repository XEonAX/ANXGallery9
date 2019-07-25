.class Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$FilterContext;
.super Lcom/miui/gallery/editor/photo/core/GLFragment$GLContext;
.source "FilterRenderFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FilterContext"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$FilterContext;->this$0:Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/GLFragment$GLContext;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$FilterContext;-><init>(Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;)V

    return-void
.end method


# virtual methods
.method protected onPause()V
    .locals 0

    return-void
.end method

.method protected onResume()V
    .locals 0

    return-void
.end method

.method surfaceCreated()V
    .locals 0

    invoke-super {p0}, Lcom/miui/gallery/editor/photo/core/GLFragment$GLContext;->performCreated()V

    return-void
.end method

.method surfaceDestroyed()V
    .locals 0

    invoke-super {p0}, Lcom/miui/gallery/editor/photo/core/GLFragment$GLContext;->performDestroyed()V

    return-void
.end method
