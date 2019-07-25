.class public Lcom/miui/gallery/picker/helper/PickerItemCheckedListener;
.super Ljava/lang/Object;
.source "PickerItemCheckedListener.java"


# instance fields
.field private mPicker:Lcom/miui/gallery/picker/helper/Picker;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/picker/helper/Picker;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/picker/helper/PickerItemCheckedListener;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

    return-void
.end method


# virtual methods
.method public onItemChecked(Landroid/database/Cursor;Landroid/view/View;)V
    .locals 6

    invoke-static {p1}, Lcom/miui/gallery/picker/helper/CursorUtils;->getSha1(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/picker/helper/PickerItemCheckedListener;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

    invoke-interface {v0, p1}, Lcom/miui/gallery/picker/helper/Picker;->contains(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/picker/helper/PickerItemCheckedListener;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

    invoke-interface {v0, p1}, Lcom/miui/gallery/picker/helper/Picker;->remove(Ljava/lang/String;)Z

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/picker/helper/PickerItemCheckedListener;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

    invoke-interface {v0}, Lcom/miui/gallery/picker/helper/Picker;->isFull()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/picker/helper/PickerItemCheckedListener;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

    invoke-interface {v0, p1}, Lcom/miui/gallery/picker/helper/Picker;->pick(Ljava/lang/String;)Z

    goto :goto_0

    :cond_1
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f100595

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/miui/gallery/picker/helper/PickerItemCheckedListener;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

    invoke-interface {v5}, Lcom/miui/gallery/picker/helper/Picker;->capacity()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    :goto_0
    instance-of v0, p2, Landroid/widget/Checkable;

    if-eqz v0, :cond_2

    check-cast p2, Landroid/widget/Checkable;

    iget-object v0, p0, Lcom/miui/gallery/picker/helper/PickerItemCheckedListener;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

    invoke-interface {v0, p1}, Lcom/miui/gallery/picker/helper/Picker;->contains(Ljava/lang/String;)Z

    move-result p1

    invoke-interface {p2, p1}, Landroid/widget/Checkable;->setChecked(Z)V

    :cond_2
    return-void
.end method
