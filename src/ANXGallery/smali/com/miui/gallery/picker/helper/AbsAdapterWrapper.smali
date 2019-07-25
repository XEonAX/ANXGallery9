.class abstract Lcom/miui/gallery/picker/helper/AbsAdapterWrapper;
.super Landroid/widget/BaseAdapter;
.source "AbsAdapterWrapper.java"


# instance fields
.field private mWrapped:Landroid/widget/CursorAdapter;


# direct methods
.method public constructor <init>(Landroid/widget/CursorAdapter;)V
    .locals 0

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/picker/helper/AbsAdapterWrapper;->mWrapped:Landroid/widget/CursorAdapter;

    return-void
.end method


# virtual methods
.method public areAllItemsEnabled()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/picker/helper/AbsAdapterWrapper;->mWrapped:Landroid/widget/CursorAdapter;

    invoke-virtual {v0}, Landroid/widget/CursorAdapter;->areAllItemsEnabled()Z

    move-result v0

    return v0
.end method

.method public getCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/picker/helper/AbsAdapterWrapper;->mWrapped:Landroid/widget/CursorAdapter;

    invoke-virtual {v0}, Landroid/widget/CursorAdapter;->getCount()I

    move-result v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/picker/helper/AbsAdapterWrapper;->mWrapped:Landroid/widget/CursorAdapter;

    invoke-virtual {v0, p1}, Landroid/widget/CursorAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public getItemId(I)J
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/picker/helper/AbsAdapterWrapper;->mWrapped:Landroid/widget/CursorAdapter;

    invoke-virtual {v0, p1}, Landroid/widget/CursorAdapter;->getItemId(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getItemViewType(I)I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/picker/helper/AbsAdapterWrapper;->mWrapped:Landroid/widget/CursorAdapter;

    invoke-virtual {v0, p1}, Landroid/widget/CursorAdapter;->getItemViewType(I)I

    move-result p1

    return p1
.end method

.method public getViewTypeCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/picker/helper/AbsAdapterWrapper;->mWrapped:Landroid/widget/CursorAdapter;

    invoke-virtual {v0}, Landroid/widget/CursorAdapter;->getViewTypeCount()I

    move-result v0

    return v0
.end method

.method public hasStableIds()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/picker/helper/AbsAdapterWrapper;->mWrapped:Landroid/widget/CursorAdapter;

    invoke-virtual {v0}, Landroid/widget/CursorAdapter;->hasStableIds()Z

    move-result v0

    return v0
.end method

.method public isEmpty()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/picker/helper/AbsAdapterWrapper;->mWrapped:Landroid/widget/CursorAdapter;

    invoke-virtual {v0}, Landroid/widget/CursorAdapter;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public isEnabled(I)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/picker/helper/AbsAdapterWrapper;->mWrapped:Landroid/widget/CursorAdapter;

    invoke-virtual {v0, p1}, Landroid/widget/CursorAdapter;->isEnabled(I)Z

    move-result p1

    return p1
.end method

.method public notifyDataSetChanged()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/picker/helper/AbsAdapterWrapper;->mWrapped:Landroid/widget/CursorAdapter;

    invoke-virtual {v0}, Landroid/widget/CursorAdapter;->notifyDataSetChanged()V

    return-void
.end method

.method public notifyDataSetInvalidated()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/picker/helper/AbsAdapterWrapper;->mWrapped:Landroid/widget/CursorAdapter;

    invoke-virtual {v0}, Landroid/widget/CursorAdapter;->notifyDataSetInvalidated()V

    return-void
.end method

.method public registerDataSetObserver(Landroid/database/DataSetObserver;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/picker/helper/AbsAdapterWrapper;->mWrapped:Landroid/widget/CursorAdapter;

    invoke-virtual {v0, p1}, Landroid/widget/CursorAdapter;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    return-void
.end method

.method public swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/picker/helper/AbsAdapterWrapper;->mWrapped:Landroid/widget/CursorAdapter;

    invoke-virtual {v0, p1}, Landroid/widget/CursorAdapter;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    move-result-object p1

    return-object p1
.end method

.method public unregisterDataSetObserver(Landroid/database/DataSetObserver;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/picker/helper/AbsAdapterWrapper;->mWrapped:Landroid/widget/CursorAdapter;

    invoke-virtual {v0, p1}, Landroid/widget/CursorAdapter;->unregisterDataSetObserver(Landroid/database/DataSetObserver;)V

    return-void
.end method
