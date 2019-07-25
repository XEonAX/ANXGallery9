.class public Lcom/miui/gallery/picker/helper/PickerItemHolder;
.super Ljava/lang/Object;
.source "PickerItemHolder.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private mAdapter:Landroid/widget/ListAdapter;

.field private mCheckListener:Lcom/miui/gallery/picker/helper/PickerItemCheckedListener;

.field private mPosition:I


# direct methods
.method public constructor <init>(Landroid/view/View;Landroid/widget/ListAdapter;Lcom/miui/gallery/picker/helper/PickerItemCheckedListener;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/miui/gallery/picker/helper/PickerItemHolder;->mAdapter:Landroid/widget/ListAdapter;

    iput-object p3, p0, Lcom/miui/gallery/picker/helper/PickerItemHolder;->mCheckListener:Lcom/miui/gallery/picker/helper/PickerItemCheckedListener;

    instance-of p3, p2, Lcom/miui/gallery/adapter/CheckableAdapter;

    if-eqz p3, :cond_0

    check-cast p2, Lcom/miui/gallery/adapter/CheckableAdapter;

    invoke-interface {p2, p1}, Lcom/miui/gallery/adapter/CheckableAdapter;->getCheckableView(Landroid/view/View;)Landroid/view/View;

    move-result-object p2

    if-eqz p2, :cond_0

    invoke-virtual {p2, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p3, Lcom/miui/gallery/util/ScalableTouchDelegate;

    const v0, 0x3fe66666    # 1.8f

    invoke-direct {p3, v0, p1, p2}, Lcom/miui/gallery/util/ScalableTouchDelegate;-><init>(FLandroid/view/View;Landroid/view/View;)V

    invoke-virtual {p1, p3}, Landroid/view/View;->setTouchDelegate(Landroid/view/TouchDelegate;)V

    :cond_0
    return-void
.end method

.method public static bindView(ILandroid/view/View;Landroid/widget/ListAdapter;Lcom/miui/gallery/picker/helper/PickerItemCheckedListener;)V
    .locals 2

    const v0, 0x7f0902d1

    invoke-virtual {p1, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/picker/helper/PickerItemHolder;

    if-nez v1, :cond_0

    new-instance v1, Lcom/miui/gallery/picker/helper/PickerItemHolder;

    invoke-direct {v1, p1, p2, p3}, Lcom/miui/gallery/picker/helper/PickerItemHolder;-><init>(Landroid/view/View;Landroid/widget/ListAdapter;Lcom/miui/gallery/picker/helper/PickerItemCheckedListener;)V

    invoke-virtual {p1, v0, v1}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    :cond_0
    invoke-virtual {v1, p0}, Lcom/miui/gallery/picker/helper/PickerItemHolder;->setPosition(I)V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/picker/helper/PickerItemHolder;->mCheckListener:Lcom/miui/gallery/picker/helper/PickerItemCheckedListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/picker/helper/PickerItemHolder;->mAdapter:Landroid/widget/ListAdapter;

    iget v1, p0, Lcom/miui/gallery/picker/helper/PickerItemHolder;->mPosition:I

    invoke-interface {v0, v1}, Landroid/widget/ListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/database/Cursor;

    iget-object v1, p0, Lcom/miui/gallery/picker/helper/PickerItemHolder;->mCheckListener:Lcom/miui/gallery/picker/helper/PickerItemCheckedListener;

    invoke-virtual {v1, v0, p1}, Lcom/miui/gallery/picker/helper/PickerItemCheckedListener;->onItemChecked(Landroid/database/Cursor;Landroid/view/View;)V

    :cond_0
    return-void
.end method

.method public setPosition(I)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/picker/helper/PickerItemHolder;->mPosition:I

    return-void
.end method
