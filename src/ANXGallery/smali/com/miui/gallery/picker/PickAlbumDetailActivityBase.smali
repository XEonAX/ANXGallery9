.class public Lcom/miui/gallery/picker/PickAlbumDetailActivityBase;
.super Lcom/miui/gallery/picker/PickerActivity;
.source "PickAlbumDetailActivityBase.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;
    }
.end annotation


# instance fields
.field protected mAlbumDetailFragment:Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;

.field protected mItemStateListener:Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$ItemStateListener;

.field private mResultCode:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/picker/PickerActivity;-><init>()V

    return-void
.end method


# virtual methods
.method public onBackPressed()V
    .locals 1

    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase;->setResultCode(I)V

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase;->getPicker()Lcom/miui/gallery/picker/helper/Picker;

    move-result-object v0

    invoke-interface {v0}, Lcom/miui/gallery/picker/helper/Picker;->done()V

    return-void
.end method

.method protected onCreateDecor()Lcom/miui/gallery/picker/PickerActivity$Decor;
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase;->getPicker()Lcom/miui/gallery/picker/helper/Picker;

    move-result-object v0

    invoke-interface {v0}, Lcom/miui/gallery/picker/helper/Picker;->getMode()Lcom/miui/gallery/picker/helper/Picker$Mode;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/picker/helper/Picker$Mode;->SINGLE:Lcom/miui/gallery/picker/helper/Picker$Mode;

    if-ne v0, v1, :cond_0

    invoke-super {p0}, Lcom/miui/gallery/picker/PickerActivity;->onCreateDecor()Lcom/miui/gallery/picker/PickerActivity$Decor;

    move-result-object v0

    return-object v0

    :cond_0
    new-instance v0, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;

    invoke-direct {v0, p0}, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase$SelectAllDecor;-><init>(Lcom/miui/gallery/picker/PickAlbumDetailActivityBase;)V

    return-object v0
.end method

.method protected onCreatePicker()Lcom/miui/gallery/picker/helper/Picker;
    .locals 8

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "pick-upper-bound"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    const-string v3, "pick-lower-bound"

    const/4 v4, 0x1

    invoke-virtual {v0, v3, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    invoke-static {}, Lcom/miui/gallery/picker/helper/Picker$MediaType;->values()[Lcom/miui/gallery/picker/helper/Picker$MediaType;

    move-result-object v4

    const-string v5, "picker_media_type"

    invoke-virtual {v0, v5, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v5

    aget-object v4, v4, v5

    const-string v5, "picker_result_set"

    invoke-virtual {v0, v5}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v5

    check-cast v5, Ljava/util/ArrayList;

    invoke-static {}, Lcom/miui/gallery/picker/helper/Picker$ResultType;->values()[Lcom/miui/gallery/picker/helper/Picker$ResultType;

    move-result-object v6

    const-string v7, "picker_result_type"

    invoke-virtual {v0, v7, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    aget-object v0, v6, v0

    new-instance v2, Lcom/miui/gallery/picker/PickerActivity$SimplePicker;

    invoke-direct {v2, p0, v1, v3, v5}, Lcom/miui/gallery/picker/PickerActivity$SimplePicker;-><init>(Lcom/miui/gallery/picker/PickerActivity;IILjava/util/List;)V

    invoke-interface {v2, v4}, Lcom/miui/gallery/picker/helper/Picker;->setMediaType(Lcom/miui/gallery/picker/helper/Picker$MediaType;)V

    invoke-interface {v2, v0}, Lcom/miui/gallery/picker/helper/Picker;->setResultType(Lcom/miui/gallery/picker/helper/Picker$ResultType;)V

    return-object v2
.end method

.method protected onDone()V
    .locals 3

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    const-string v1, "internal_key_updated_selection"

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase;->getPicker()Lcom/miui/gallery/picker/helper/Picker;

    move-result-object v2

    invoke-static {v2}, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase;->copyPicker(Lcom/miui/gallery/picker/helper/Picker;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    iget v1, p0, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase;->mResultCode:I

    invoke-virtual {p0, v1, v0}, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase;->setResult(ILandroid/content/Intent;)V

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase;->finish()V

    return-void
.end method

.method public setResultCode(I)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase;->mResultCode:I

    return-void
.end method
