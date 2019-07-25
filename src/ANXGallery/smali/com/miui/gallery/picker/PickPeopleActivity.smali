.class public Lcom/miui/gallery/picker/PickPeopleActivity;
.super Lcom/miui/gallery/picker/PickerActivity;
.source "PickPeopleActivity.java"


# instance fields
.field private mFragment:Lcom/miui/gallery/picker/PickPeoplePageFragment;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/picker/PickerActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected done(I)V
    .locals 3

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    const-string v1, "internal_key_updated_selection"

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickPeopleActivity;->getPicker()Lcom/miui/gallery/picker/helper/Picker;

    move-result-object v2

    invoke-static {v2}, Lcom/miui/gallery/picker/PickPeopleActivity;->copyPicker(Lcom/miui/gallery/picker/helper/Picker;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    invoke-virtual {p0, p1, v0}, Lcom/miui/gallery/picker/PickPeopleActivity;->setResult(ILandroid/content/Intent;)V

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickPeopleActivity;->finish()V

    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 3

    invoke-super {p0, p1, p2, p3}, Lcom/miui/gallery/picker/PickerActivity;->onActivityResult(IILandroid/content/Intent;)V

    if-eqz p2, :cond_8

    const-string p1, "internal_key_updated_selection"

    invoke-virtual {p3, p1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    if-nez p1, :cond_0

    return-void

    :cond_0
    new-instance p3, Ljava/util/ArrayList;

    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    iget-object v0, p0, Lcom/miui/gallery/picker/PickPeopleActivity;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

    invoke-interface {v0}, Lcom/miui/gallery/picker/helper/Picker;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-interface {p1, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    invoke-virtual {p3, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_2
    invoke-virtual {p3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :goto_1
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iget-object v1, p0, Lcom/miui/gallery/picker/PickPeopleActivity;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

    invoke-interface {v1, v0}, Lcom/miui/gallery/picker/helper/Picker;->remove(Ljava/lang/String;)Z

    goto :goto_1

    :cond_3
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_4
    :goto_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_5

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/String;

    iget-object v0, p0, Lcom/miui/gallery/picker/PickPeopleActivity;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

    invoke-interface {v0, p3}, Lcom/miui/gallery/picker/helper/Picker;->contains(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/miui/gallery/picker/PickPeopleActivity;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

    invoke-interface {v0, p3}, Lcom/miui/gallery/picker/helper/Picker;->pick(Ljava/lang/String;)Z

    goto :goto_2

    :cond_5
    iget-object p1, p0, Lcom/miui/gallery/picker/PickPeopleActivity;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

    invoke-interface {p1}, Lcom/miui/gallery/picker/helper/Picker;->getMode()Lcom/miui/gallery/picker/helper/Picker$Mode;

    move-result-object p1

    sget-object p3, Lcom/miui/gallery/picker/helper/Picker$Mode;->SINGLE:Lcom/miui/gallery/picker/helper/Picker$Mode;

    if-eq p1, p3, :cond_6

    const/4 p1, -0x1

    if-ne p2, p1, :cond_7

    :cond_6
    iget-object p1, p0, Lcom/miui/gallery/picker/PickPeopleActivity;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

    invoke-interface {p1}, Lcom/miui/gallery/picker/helper/Picker;->done()V

    :cond_7
    return-void

    :cond_8
    iget-object p1, p0, Lcom/miui/gallery/picker/PickPeopleActivity;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

    invoke-interface {p1}, Lcom/miui/gallery/picker/helper/Picker;->cancel()V

    return-void
.end method

.method public onBackPressed()V
    .locals 1

    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/miui/gallery/picker/PickPeopleActivity;->done(I)V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2

    invoke-super {p0, p1}, Lcom/miui/gallery/picker/PickerActivity;->onCreate(Landroid/os/Bundle;)V

    iget-object p1, p0, Lcom/miui/gallery/picker/PickPeopleActivity;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

    if-nez p1, :cond_0

    return-void

    :cond_0
    const p1, 0x7f0b0115

    invoke-virtual {p0, p1}, Lcom/miui/gallery/picker/PickPeopleActivity;->setContentView(I)V

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickPeopleActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v0, "pick_people"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p1

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickPeopleActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    const v1, 0x7f090214

    invoke-virtual {v0, v1}, Landroid/app/FragmentManager;->findFragmentById(I)Landroid/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/picker/PickPeoplePageFragment;

    iput-object v0, p0, Lcom/miui/gallery/picker/PickPeopleActivity;->mFragment:Lcom/miui/gallery/picker/PickPeoplePageFragment;

    iget-object v0, p0, Lcom/miui/gallery/picker/PickPeopleActivity;->mFragment:Lcom/miui/gallery/picker/PickPeoplePageFragment;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/picker/PickPeoplePageFragment;->setIsPickPeople(Z)V

    if-eqz p1, :cond_2

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickPeopleActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v0, "pick_people_candidate_name"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    const p1, 0x7f1000ff

    invoke-virtual {p0, p1}, Lcom/miui/gallery/picker/PickPeopleActivity;->getString(I)Ljava/lang/String;

    move-result-object p1

    :cond_1
    invoke-virtual {p0, p1}, Lcom/miui/gallery/picker/PickPeopleActivity;->setTitle(Ljava/lang/CharSequence;)V

    :cond_2
    return-void
.end method

.method protected onCreatePicker()Lcom/miui/gallery/picker/helper/Picker;
    .locals 8

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickPeopleActivity;->getIntent()Landroid/content/Intent;

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

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickPeopleActivity;->getIntent()Landroid/content/Intent;

    move-result-object v6

    const-string v7, "pick_people"

    invoke-virtual {v6, v7, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v6

    if-eqz v6, :cond_0

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    :cond_0
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
    .locals 1

    const/4 v0, -0x1

    invoke-virtual {p0, v0}, Lcom/miui/gallery/picker/PickPeopleActivity;->done(I)V

    return-void
.end method
