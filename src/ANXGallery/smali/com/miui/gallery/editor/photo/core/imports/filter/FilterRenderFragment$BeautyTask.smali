.class Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$BeautyTask;
.super Landroid/os/AsyncTask;
.source "FilterRenderFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "BeautyTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Landroid/graphics/Bitmap;",
        "Ljava/lang/Void;",
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$BeautyTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$BeautyTask;-><init>(Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;)V

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 2

    const/4 v0, 0x0

    aget-object p1, p1, v0

    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/arcsoftbeauty/ArcsoftBeautyJni;->smartBeauty(Landroid/graphics/Bitmap;)V

    return-object p1
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, [Landroid/graphics/Bitmap;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$BeautyTask;->doInBackground([Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object p1

    return-object p1
.end method

.method protected onPostExecute(Landroid/graphics/Bitmap;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$BeautyTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;

    invoke-static {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->access$802(Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$BeautyTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;->access$900(Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;)V

    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Landroid/graphics/Bitmap;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment$BeautyTask;->onPostExecute(Landroid/graphics/Bitmap;)V

    return-void
.end method
