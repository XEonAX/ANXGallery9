.class Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment$AutoCropTask;
.super Landroid/os/AsyncTask;
.source "CropMenuFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AutoCropTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment$AutoCropTask;->this$0:Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment$AutoCropTask;-><init>(Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;)V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment$AutoCropTask;->doInBackground([Ljava/lang/Void;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Void;
    .locals 2

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment$AutoCropTask;->this$0:Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;->access$2200(Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;)Landroid/graphics/Bitmap;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment$AutoCropTask;->this$0:Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;->access$2000(Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;)Lcom/miui/gallery/editor/photo/app/crop/AutoCropData;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/miui/gallery/editor/photo/app/crop/AutoCropUtils;->getAutoCropData(Landroid/graphics/Bitmap;Lcom/miui/gallery/editor/photo/app/crop/AutoCropData;)V

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    const-string v0, "result"

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment$AutoCropTask;->this$0:Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;->access$2000(Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;)Lcom/miui/gallery/editor/photo/app/crop/AutoCropData;

    move-result-object v1

    iget v1, v1, Lcom/miui/gallery/editor/photo/app/crop/AutoCropData;->rotationResult:I

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "photo_editor"

    const-string v1, "crop_auto_rotation_result"

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    const/4 p1, 0x0

    return-object p1
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment$AutoCropTask;->onPostExecute(Ljava/lang/Void;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/Void;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment$AutoCropTask;->this$0:Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;->isAdded()Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment$AutoCropTask;->this$0:Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;->isRemoving()Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment$AutoCropTask;->this$0:Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;->access$200(Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;)Landroid/widget/TextView;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment$AutoCropTask;->this$0:Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;->access$400(Lcom/miui/gallery/editor/photo/app/crop/CropMenuFragment;)V

    return-void

    :cond_1
    :goto_0
    const-string p1, "CropMenuFragment"

    const-string v0, "AutoCrop fragment isRemoved"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
