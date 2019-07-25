.class Lcom/miui/gallery/picker/PickerActivity$Decor$Multiple$3;
.super Landroid/database/DataSetObserver;
.source "PickerActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/picker/PickerActivity$Decor$Multiple;->applyActionBar()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/picker/PickerActivity$Decor$Multiple;


# direct methods
.method constructor <init>(Lcom/miui/gallery/picker/PickerActivity$Decor$Multiple;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/picker/PickerActivity$Decor$Multiple$3;->this$0:Lcom/miui/gallery/picker/PickerActivity$Decor$Multiple;

    invoke-direct {p0}, Landroid/database/DataSetObserver;-><init>()V

    return-void
.end method


# virtual methods
.method public onChanged()V
    .locals 3

    invoke-super {p0}, Landroid/database/DataSetObserver;->onChanged()V

    iget-object v0, p0, Lcom/miui/gallery/picker/PickerActivity$Decor$Multiple$3;->this$0:Lcom/miui/gallery/picker/PickerActivity$Decor$Multiple;

    iget-object v0, v0, Lcom/miui/gallery/picker/PickerActivity$Decor$Multiple;->mActivity:Lcom/miui/gallery/picker/PickerActivity;

    invoke-virtual {v0}, Lcom/miui/gallery/picker/PickerActivity;->updateTitle()V

    iget-object v0, p0, Lcom/miui/gallery/picker/PickerActivity$Decor$Multiple$3;->this$0:Lcom/miui/gallery/picker/PickerActivity$Decor$Multiple;

    invoke-static {v0}, Lcom/miui/gallery/picker/PickerActivity$Decor$Multiple;->access$000(Lcom/miui/gallery/picker/PickerActivity$Decor$Multiple;)Landroid/widget/Button;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/picker/PickerActivity$Decor$Multiple$3;->this$0:Lcom/miui/gallery/picker/PickerActivity$Decor$Multiple;

    iget-object v1, v1, Lcom/miui/gallery/picker/PickerActivity$Decor$Multiple;->mActivity:Lcom/miui/gallery/picker/PickerActivity;

    iget-object v1, v1, Lcom/miui/gallery/picker/PickerActivity;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

    invoke-interface {v1}, Lcom/miui/gallery/picker/helper/Picker;->count()I

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/picker/PickerActivity$Decor$Multiple$3;->this$0:Lcom/miui/gallery/picker/PickerActivity$Decor$Multiple;

    iget-object v2, v2, Lcom/miui/gallery/picker/PickerActivity$Decor$Multiple;->mActivity:Lcom/miui/gallery/picker/PickerActivity;

    iget-object v2, v2, Lcom/miui/gallery/picker/PickerActivity;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

    invoke-interface {v2}, Lcom/miui/gallery/picker/helper/Picker;->baseline()I

    move-result v2

    if-lt v1, v2, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    return-void
.end method

.method public onInvalidated()V
    .locals 3

    invoke-super {p0}, Landroid/database/DataSetObserver;->onInvalidated()V

    iget-object v0, p0, Lcom/miui/gallery/picker/PickerActivity$Decor$Multiple$3;->this$0:Lcom/miui/gallery/picker/PickerActivity$Decor$Multiple;

    iget-object v0, v0, Lcom/miui/gallery/picker/PickerActivity$Decor$Multiple;->mActivity:Lcom/miui/gallery/picker/PickerActivity;

    invoke-virtual {v0}, Lcom/miui/gallery/picker/PickerActivity;->updateTitle()V

    iget-object v0, p0, Lcom/miui/gallery/picker/PickerActivity$Decor$Multiple$3;->this$0:Lcom/miui/gallery/picker/PickerActivity$Decor$Multiple;

    invoke-static {v0}, Lcom/miui/gallery/picker/PickerActivity$Decor$Multiple;->access$000(Lcom/miui/gallery/picker/PickerActivity$Decor$Multiple;)Landroid/widget/Button;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/picker/PickerActivity$Decor$Multiple$3;->this$0:Lcom/miui/gallery/picker/PickerActivity$Decor$Multiple;

    iget-object v1, v1, Lcom/miui/gallery/picker/PickerActivity$Decor$Multiple;->mActivity:Lcom/miui/gallery/picker/PickerActivity;

    iget-object v1, v1, Lcom/miui/gallery/picker/PickerActivity;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

    invoke-interface {v1}, Lcom/miui/gallery/picker/helper/Picker;->count()I

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/picker/PickerActivity$Decor$Multiple$3;->this$0:Lcom/miui/gallery/picker/PickerActivity$Decor$Multiple;

    iget-object v2, v2, Lcom/miui/gallery/picker/PickerActivity$Decor$Multiple;->mActivity:Lcom/miui/gallery/picker/PickerActivity;

    iget-object v2, v2, Lcom/miui/gallery/picker/PickerActivity;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

    invoke-interface {v2}, Lcom/miui/gallery/picker/helper/Picker;->baseline()I

    move-result v2

    if-lt v1, v2, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    return-void
.end method
