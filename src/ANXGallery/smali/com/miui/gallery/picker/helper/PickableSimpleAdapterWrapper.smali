.class public Lcom/miui/gallery/picker/helper/PickableSimpleAdapterWrapper;
.super Lcom/miui/gallery/picker/helper/AbsAdapterWrapper;
.source "PickableSimpleAdapterWrapper.java"


# instance fields
.field private mPicker:Lcom/miui/gallery/picker/helper/Picker;

.field private mPickerItemCheckedListener:Lcom/miui/gallery/picker/helper/PickerItemCheckedListener;

.field private mWrapped:Landroid/widget/CursorAdapter;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/picker/helper/Picker;Landroid/widget/CursorAdapter;)V
    .locals 0

    invoke-direct {p0, p2}, Lcom/miui/gallery/picker/helper/AbsAdapterWrapper;-><init>(Landroid/widget/CursorAdapter;)V

    iput-object p1, p0, Lcom/miui/gallery/picker/helper/PickableSimpleAdapterWrapper;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

    iput-object p2, p0, Lcom/miui/gallery/picker/helper/PickableSimpleAdapterWrapper;->mWrapped:Landroid/widget/CursorAdapter;

    new-instance p1, Lcom/miui/gallery/picker/helper/PickerItemCheckedListener;

    iget-object p2, p0, Lcom/miui/gallery/picker/helper/PickableSimpleAdapterWrapper;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

    invoke-direct {p1, p2}, Lcom/miui/gallery/picker/helper/PickerItemCheckedListener;-><init>(Lcom/miui/gallery/picker/helper/Picker;)V

    iput-object p1, p0, Lcom/miui/gallery/picker/helper/PickableSimpleAdapterWrapper;->mPickerItemCheckedListener:Lcom/miui/gallery/picker/helper/PickerItemCheckedListener;

    return-void
.end method


# virtual methods
.method public bridge synthetic areAllItemsEnabled()Z
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/picker/helper/AbsAdapterWrapper;->areAllItemsEnabled()Z

    move-result v0

    return v0
.end method

.method public bridge synthetic getCount()I
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/picker/helper/AbsAdapterWrapper;->getCount()I

    move-result v0

    return v0
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/picker/helper/AbsAdapterWrapper;->getItem(I)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic getItemId(I)J
    .locals 2

    invoke-super {p0, p1}, Lcom/miui/gallery/picker/helper/AbsAdapterWrapper;->getItemId(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public bridge synthetic getItemViewType(I)I
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/picker/helper/AbsAdapterWrapper;->getItemViewType(I)I

    move-result p1

    return p1
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/picker/helper/PickableSimpleAdapterWrapper;->mWrapped:Landroid/widget/CursorAdapter;

    invoke-virtual {v0, p1, p2, p3}, Landroid/widget/CursorAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    iget-object p3, p0, Lcom/miui/gallery/picker/helper/PickableSimpleAdapterWrapper;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

    invoke-interface {p3}, Lcom/miui/gallery/picker/helper/Picker;->getMode()Lcom/miui/gallery/picker/helper/Picker$Mode;

    move-result-object p3

    sget-object v0, Lcom/miui/gallery/picker/helper/Picker$Mode;->SINGLE:Lcom/miui/gallery/picker/helper/Picker$Mode;

    const/4 v1, 0x1

    if-ne p3, v0, :cond_0

    instance-of p3, p2, Lcom/miui/gallery/ui/MicroThumbGridItem;

    if-eqz p3, :cond_1

    move-object p3, p2

    check-cast p3, Lcom/miui/gallery/ui/MicroThumbGridItem;

    invoke-virtual {p3, v1}, Lcom/miui/gallery/ui/MicroThumbGridItem;->setSimilarMarkEnable(Z)V

    goto :goto_0

    :cond_0
    instance-of p3, p2, Lcom/miui/gallery/ui/Checkable;

    if-eqz p3, :cond_1

    move-object p3, p2

    check-cast p3, Lcom/miui/gallery/ui/Checkable;

    invoke-interface {p3, v1}, Lcom/miui/gallery/ui/Checkable;->setCheckable(Z)V

    iget-object v0, p0, Lcom/miui/gallery/picker/helper/PickableSimpleAdapterWrapper;->mWrapped:Landroid/widget/CursorAdapter;

    invoke-virtual {v0}, Landroid/widget/CursorAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v0

    invoke-interface {v0, p1}, Landroid/database/Cursor;->moveToPosition(I)Z

    iget-object v1, p0, Lcom/miui/gallery/picker/helper/PickableSimpleAdapterWrapper;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

    invoke-static {v0}, Lcom/miui/gallery/picker/helper/CursorUtils;->getSha1(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v0}, Lcom/miui/gallery/picker/helper/Picker;->contains(Ljava/lang/String;)Z

    move-result v0

    invoke-interface {p3, v0}, Lcom/miui/gallery/ui/Checkable;->setChecked(Z)V

    :cond_1
    :goto_0
    iget-object p3, p0, Lcom/miui/gallery/picker/helper/PickableSimpleAdapterWrapper;->mWrapped:Landroid/widget/CursorAdapter;

    iget-object v0, p0, Lcom/miui/gallery/picker/helper/PickableSimpleAdapterWrapper;->mPickerItemCheckedListener:Lcom/miui/gallery/picker/helper/PickerItemCheckedListener;

    invoke-static {p1, p2, p3, v0}, Lcom/miui/gallery/picker/helper/PickerItemHolder;->bindView(ILandroid/view/View;Landroid/widget/ListAdapter;Lcom/miui/gallery/picker/helper/PickerItemCheckedListener;)V

    return-object p2
.end method

.method public bridge synthetic getViewTypeCount()I
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/picker/helper/AbsAdapterWrapper;->getViewTypeCount()I

    move-result v0

    return v0
.end method

.method public bridge synthetic hasStableIds()Z
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/picker/helper/AbsAdapterWrapper;->hasStableIds()Z

    move-result v0

    return v0
.end method

.method public bridge synthetic isEmpty()Z
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/picker/helper/AbsAdapterWrapper;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public bridge synthetic isEnabled(I)Z
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/picker/helper/AbsAdapterWrapper;->isEnabled(I)Z

    move-result p1

    return p1
.end method

.method public bridge synthetic notifyDataSetChanged()V
    .locals 0

    invoke-super {p0}, Lcom/miui/gallery/picker/helper/AbsAdapterWrapper;->notifyDataSetChanged()V

    return-void
.end method

.method public bridge synthetic notifyDataSetInvalidated()V
    .locals 0

    invoke-super {p0}, Lcom/miui/gallery/picker/helper/AbsAdapterWrapper;->notifyDataSetInvalidated()V

    return-void
.end method

.method public bridge synthetic registerDataSetObserver(Landroid/database/DataSetObserver;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/picker/helper/AbsAdapterWrapper;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    return-void
.end method

.method public bridge synthetic swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/picker/helper/AbsAdapterWrapper;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic unregisterDataSetObserver(Landroid/database/DataSetObserver;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/picker/helper/AbsAdapterWrapper;->unregisterDataSetObserver(Landroid/database/DataSetObserver;)V

    return-void
.end method
