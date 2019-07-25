.class Lcom/miui/gallery/picker/PickPeoplePageFragment$1;
.super Ljava/lang/Object;
.source "PickPeoplePageFragment.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/picker/PickPeoplePageFragment;->onInflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/picker/PickPeoplePageFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/picker/PickPeoplePageFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/picker/PickPeoplePageFragment$1;->this$0:Lcom/miui/gallery/picker/PickPeoplePageFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    new-instance p1, Landroid/content/Intent;

    invoke-direct {p1}, Landroid/content/Intent;-><init>()V

    iget-object p4, p0, Lcom/miui/gallery/picker/PickPeoplePageFragment$1;->this$0:Lcom/miui/gallery/picker/PickPeoplePageFragment;

    invoke-static {p4}, Lcom/miui/gallery/picker/PickPeoplePageFragment;->access$000(Lcom/miui/gallery/picker/PickPeoplePageFragment;)Lcom/miui/gallery/adapter/PeoplePageAdapter;

    move-result-object p4

    invoke-virtual {p4, p3}, Lcom/miui/gallery/adapter/PeoplePageAdapter;->getPeopleIdOfItem(I)Ljava/lang/String;

    move-result-object p4

    iget-object p5, p0, Lcom/miui/gallery/picker/PickPeoplePageFragment$1;->this$0:Lcom/miui/gallery/picker/PickPeoplePageFragment;

    invoke-static {p5}, Lcom/miui/gallery/picker/PickPeoplePageFragment;->access$000(Lcom/miui/gallery/picker/PickPeoplePageFragment;)Lcom/miui/gallery/adapter/PeoplePageAdapter;

    move-result-object p5

    invoke-virtual {p5, p3}, Lcom/miui/gallery/adapter/PeoplePageAdapter;->getPeopleLocalIdOfItem(I)Ljava/lang/String;

    move-result-object p5

    const-string v0, "server_id_of_album"

    invoke-virtual {p1, v0, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p4, "local_id_of_album"

    invoke-virtual {p1, p4, p5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p4, "album_name"

    check-cast p2, Lcom/miui/gallery/ui/PeoplePageGridItem;

    invoke-virtual {p2}, Lcom/miui/gallery/ui/PeoplePageGridItem;->getName()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p4, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object p2, p0, Lcom/miui/gallery/picker/PickPeoplePageFragment$1;->this$0:Lcom/miui/gallery/picker/PickPeoplePageFragment;

    invoke-static {p2}, Lcom/miui/gallery/picker/PickPeoplePageFragment;->access$100(Lcom/miui/gallery/picker/PickPeoplePageFragment;)Z

    move-result p2

    const/4 p4, -0x1

    if-eqz p2, :cond_0

    iget-object p2, p0, Lcom/miui/gallery/picker/PickPeoplePageFragment$1;->this$0:Lcom/miui/gallery/picker/PickPeoplePageFragment;

    iget-object p2, p2, Lcom/miui/gallery/picker/PickPeoplePageFragment;->mActivity:Landroid/app/Activity;

    invoke-virtual {p2, p4, p1}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    iget-object p1, p0, Lcom/miui/gallery/picker/PickPeoplePageFragment$1;->this$0:Lcom/miui/gallery/picker/PickPeoplePageFragment;

    iget-object p1, p1, Lcom/miui/gallery/picker/PickPeoplePageFragment;->mActivity:Landroid/app/Activity;

    invoke-virtual {p1}, Landroid/app/Activity;->finish()V

    return-void

    :cond_0
    const-string p2, "relationType"

    iget-object p5, p0, Lcom/miui/gallery/picker/PickPeoplePageFragment$1;->this$0:Lcom/miui/gallery/picker/PickPeoplePageFragment;

    invoke-static {p5}, Lcom/miui/gallery/picker/PickPeoplePageFragment;->access$000(Lcom/miui/gallery/picker/PickPeoplePageFragment;)Lcom/miui/gallery/adapter/PeoplePageAdapter;

    move-result-object p5

    invoke-virtual {p5, p3}, Lcom/miui/gallery/adapter/PeoplePageAdapter;->getRelationTypeOfItem(I)I

    move-result p3

    invoke-virtual {p1, p2, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    iget-object p2, p0, Lcom/miui/gallery/picker/PickPeoplePageFragment$1;->this$0:Lcom/miui/gallery/picker/PickPeoplePageFragment;

    iget-object p2, p2, Lcom/miui/gallery/picker/PickPeoplePageFragment;->mActivity:Landroid/app/Activity;

    const-class p3, Lcom/miui/gallery/picker/PickFaceAlbumActivity;

    invoke-virtual {p1, p2, p3}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    iget-object p2, p0, Lcom/miui/gallery/picker/PickPeoplePageFragment$1;->this$0:Lcom/miui/gallery/picker/PickPeoplePageFragment;

    iget-object p2, p2, Lcom/miui/gallery/picker/PickPeoplePageFragment;->mActivity:Landroid/app/Activity;

    check-cast p2, Lcom/miui/gallery/picker/PickerActivity;

    invoke-virtual {p2}, Lcom/miui/gallery/picker/PickerActivity;->getPicker()Lcom/miui/gallery/picker/helper/Picker;

    move-result-object p2

    const-string p3, "pick-upper-bound"

    invoke-interface {p2}, Lcom/miui/gallery/picker/helper/Picker;->getMode()Lcom/miui/gallery/picker/helper/Picker$Mode;

    move-result-object p5

    sget-object v0, Lcom/miui/gallery/picker/helper/Picker$Mode;->UNLIMITED:Lcom/miui/gallery/picker/helper/Picker$Mode;

    if-ne p5, v0, :cond_1

    goto :goto_0

    :cond_1
    invoke-interface {p2}, Lcom/miui/gallery/picker/helper/Picker;->capacity()I

    move-result p4

    :goto_0
    invoke-virtual {p1, p3, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string p3, "pick-lower-bound"

    iget-object p4, p0, Lcom/miui/gallery/picker/PickPeoplePageFragment$1;->this$0:Lcom/miui/gallery/picker/PickPeoplePageFragment;

    iget-object p4, p4, Lcom/miui/gallery/picker/PickPeoplePageFragment;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

    invoke-interface {p4}, Lcom/miui/gallery/picker/helper/Picker;->baseline()I

    move-result p4

    invoke-virtual {p1, p3, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string p3, "picker_media_type"

    invoke-interface {p2}, Lcom/miui/gallery/picker/helper/Picker;->getMediaType()Lcom/miui/gallery/picker/helper/Picker$MediaType;

    move-result-object p4

    invoke-virtual {p4}, Lcom/miui/gallery/picker/helper/Picker$MediaType;->ordinal()I

    move-result p4

    invoke-virtual {p1, p3, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string p3, "picker_result_set"

    invoke-static {p2}, Lcom/miui/gallery/picker/PickerActivity;->copyPicker(Lcom/miui/gallery/picker/helper/Picker;)Ljava/util/ArrayList;

    move-result-object p4

    invoke-virtual {p1, p3, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    const-string p3, "picker_result_type"

    invoke-interface {p2}, Lcom/miui/gallery/picker/helper/Picker;->getResultType()Lcom/miui/gallery/picker/helper/Picker$ResultType;

    move-result-object p2

    invoke-virtual {p2}, Lcom/miui/gallery/picker/helper/Picker$ResultType;->ordinal()I

    move-result p2

    invoke-virtual {p1, p3, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    iget-object p2, p0, Lcom/miui/gallery/picker/PickPeoplePageFragment$1;->this$0:Lcom/miui/gallery/picker/PickPeoplePageFragment;

    iget-object p2, p2, Lcom/miui/gallery/picker/PickPeoplePageFragment;->mActivity:Landroid/app/Activity;

    const/4 p3, 0x1

    invoke-virtual {p2, p1, p3}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method
