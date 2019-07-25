.class Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$9;
.super Ljava/lang/Object;
.source "ScreenEditorActivity.java"

# interfaces
.implements Lcom/miui/gallery/editor/photo/screen/longcrop/ScreenLongCropFragment$ScreenLongCropCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$9;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getScreenRect()[I
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$9;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "ThumbnailRect"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getIntArrayExtra(Ljava/lang/String;)[I

    move-result-object v0

    return-object v0
.end method

.method public onLoadPreview()Landroid/graphics/Bitmap;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$9;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->access$1200(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;)Lcom/miui/gallery/editor/photo/app/DraftManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/app/DraftManager;->getPreview()Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public startAnimator()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$9;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->access$100(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;)Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->startLongCropEditPageEnterAnimator()V

    return-void
.end method
