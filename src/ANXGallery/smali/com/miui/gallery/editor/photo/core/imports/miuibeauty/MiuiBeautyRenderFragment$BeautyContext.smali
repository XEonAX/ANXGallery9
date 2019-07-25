.class Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyRenderFragment$BeautyContext;
.super Lcom/miui/gallery/editor/photo/core/GLFragment$GLContext;
.source "MiuiBeautyRenderFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyRenderFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "BeautyContext"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyRenderFragment;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyRenderFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyRenderFragment$BeautyContext;->this$0:Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyRenderFragment;

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/GLFragment$GLContext;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyRenderFragment;Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyRenderFragment$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyRenderFragment$BeautyContext;-><init>(Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautyRenderFragment;)V

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

.method triggerCreated()V
    .locals 0

    invoke-super {p0}, Lcom/miui/gallery/editor/photo/core/GLFragment$GLContext;->performCreated()V

    return-void
.end method
