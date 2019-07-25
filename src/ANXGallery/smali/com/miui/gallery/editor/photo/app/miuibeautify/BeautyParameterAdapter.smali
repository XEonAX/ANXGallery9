.class Lcom/miui/gallery/editor/photo/app/miuibeautify/BeautyParameterAdapter;
.super Lcom/miui/gallery/ui/SimpleRecyclerView$Adapter;
.source "BeautyParameterAdapter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/ui/SimpleRecyclerView$Adapter<",
        "Lcom/miui/gallery/editor/photo/app/miuibeautify/ParameterViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field private mIcons:[I

.field private mParameterData:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautifyData;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/util/List;[I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautifyData;",
            ">;[I)V"
        }
    .end annotation

    invoke-direct {p0}, Lcom/miui/gallery/ui/SimpleRecyclerView$Adapter;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/BeautyParameterAdapter;->mParameterData:Ljava/util/List;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/BeautyParameterAdapter;->mIcons:[I

    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/BeautyParameterAdapter;->mParameterData:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    check-cast p1, Lcom/miui/gallery/editor/photo/app/miuibeautify/ParameterViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/editor/photo/app/miuibeautify/BeautyParameterAdapter;->onBindViewHolder(Lcom/miui/gallery/editor/photo/app/miuibeautify/ParameterViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/miui/gallery/editor/photo/app/miuibeautify/ParameterViewHolder;I)V
    .locals 2

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/ui/SimpleRecyclerView$Adapter;->onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/BeautyParameterAdapter;->mIcons:[I

    aget v0, v0, p2

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/BeautyParameterAdapter;->mParameterData:Ljava/util/List;

    invoke-interface {v1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautifyData;

    invoke-virtual {p1, v0, p2}, Lcom/miui/gallery/editor/photo/app/miuibeautify/ParameterViewHolder;->bind(ILcom/miui/gallery/editor/photo/core/imports/miuibeauty/MiuiBeautifyData;)V

    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/editor/photo/app/miuibeautify/BeautyParameterAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/miui/gallery/editor/photo/app/miuibeautify/ParameterViewHolder;

    move-result-object p1

    return-object p1
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/miui/gallery/editor/photo/app/miuibeautify/ParameterViewHolder;
    .locals 3

    new-instance p2, Lcom/miui/gallery/editor/photo/app/miuibeautify/ParameterViewHolder;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/miuibeautify/BeautyParameterAdapter;->getInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0b00b2

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-direct {p2, p1}, Lcom/miui/gallery/editor/photo/app/miuibeautify/ParameterViewHolder;-><init>(Landroid/view/View;)V

    return-object p2
.end method
