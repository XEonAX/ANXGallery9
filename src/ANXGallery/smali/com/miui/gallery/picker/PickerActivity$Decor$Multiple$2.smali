.class Lcom/miui/gallery/picker/PickerActivity$Decor$Multiple$2;
.super Lcom/miui/gallery/listener/SingleClickListener;
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

    iput-object p1, p0, Lcom/miui/gallery/picker/PickerActivity$Decor$Multiple$2;->this$0:Lcom/miui/gallery/picker/PickerActivity$Decor$Multiple;

    invoke-direct {p0}, Lcom/miui/gallery/listener/SingleClickListener;-><init>()V

    return-void
.end method


# virtual methods
.method protected onSingleClick(Landroid/view/View;)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/picker/PickerActivity$Decor$Multiple$2;->this$0:Lcom/miui/gallery/picker/PickerActivity$Decor$Multiple;

    iget-object p1, p1, Lcom/miui/gallery/picker/PickerActivity$Decor$Multiple;->mActivity:Lcom/miui/gallery/picker/PickerActivity;

    iget-object p1, p1, Lcom/miui/gallery/picker/PickerActivity;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

    invoke-interface {p1}, Lcom/miui/gallery/picker/helper/Picker;->done()V

    return-void
.end method
