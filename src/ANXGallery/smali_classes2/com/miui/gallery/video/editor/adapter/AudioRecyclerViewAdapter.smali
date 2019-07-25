.class public Lcom/miui/gallery/video/editor/adapter/AudioRecyclerViewAdapter;
.super Lcom/miui/gallery/video/editor/widget/SingleChoiceRecyclerView$SingleChoiceRecyclerViewAdapter;
.source "AudioRecyclerViewAdapter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/video/editor/widget/SingleChoiceRecyclerView$SingleChoiceRecyclerViewAdapter<",
        "Lcom/miui/gallery/video/editor/adapter/AudioViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field private final VIEW_TYPE_NORMAL:I

.field private mAudioList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/video/editor/LocalAudio;",
            ">;"
        }
    .end annotation
.end field

.field private mFirstMarginLeft:I

.field private mLayoutInflater:Landroid/view/LayoutInflater;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Lcom/miui/gallery/video/editor/LocalAudio;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/widget/SingleChoiceRecyclerView$SingleChoiceRecyclerViewAdapter;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/video/editor/adapter/AudioRecyclerViewAdapter;->VIEW_TYPE_NORMAL:I

    iput v0, p0, Lcom/miui/gallery/video/editor/adapter/AudioRecyclerViewAdapter;->mFirstMarginLeft:I

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/video/editor/adapter/AudioRecyclerViewAdapter;->mLayoutInflater:Landroid/view/LayoutInflater;

    iput-object p2, p0, Lcom/miui/gallery/video/editor/adapter/AudioRecyclerViewAdapter;->mAudioList:Ljava/util/List;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f060526

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/video/editor/adapter/AudioRecyclerViewAdapter;->mFirstMarginLeft:I

    return-void
.end method


# virtual methods
.method public getAuido(I)Lcom/miui/gallery/video/editor/LocalAudio;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/adapter/AudioRecyclerViewAdapter;->mAudioList:Ljava/util/List;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/adapter/AudioRecyclerViewAdapter;->mAudioList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge p1, v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/adapter/AudioRecyclerViewAdapter;->mAudioList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/video/editor/LocalAudio;

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public getItemCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/adapter/AudioRecyclerViewAdapter;->mAudioList:Ljava/util/List;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/adapter/AudioRecyclerViewAdapter;->mAudioList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public getItemViewType(I)I
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public onBindView(Lcom/miui/gallery/video/editor/adapter/AudioViewHolder;I)V
    .locals 3

    const/4 v0, 0x0

    if-nez p2, :cond_0

    iget v1, p0, Lcom/miui/gallery/video/editor/adapter/AudioRecyclerViewAdapter;->mFirstMarginLeft:I

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    invoke-virtual {p1, v1}, Lcom/miui/gallery/video/editor/adapter/AudioViewHolder;->setMarginLeft(I)V

    iget-object v1, p0, Lcom/miui/gallery/video/editor/adapter/AudioRecyclerViewAdapter;->mAudioList:Ljava/util/List;

    invoke-interface {v1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/video/editor/LocalAudio;

    invoke-virtual {v1}, Lcom/miui/gallery/video/editor/LocalAudio;->getNameResId()I

    move-result v2

    invoke-virtual {p1, v2}, Lcom/miui/gallery/video/editor/adapter/AudioViewHolder;->setName(I)V

    invoke-virtual {v1}, Lcom/miui/gallery/video/editor/LocalAudio;->getIconUrl()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {v1}, Lcom/miui/gallery/video/editor/LocalAudio;->getIconResId()I

    move-result v2

    invoke-virtual {p1, v2}, Lcom/miui/gallery/video/editor/adapter/AudioViewHolder;->setIcon(I)V

    goto :goto_1

    :cond_1
    invoke-virtual {v1}, Lcom/miui/gallery/video/editor/LocalAudio;->getIconUrl()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Lcom/miui/gallery/video/editor/adapter/AudioViewHolder;->setIcon(Ljava/lang/String;)V

    :goto_1
    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/adapter/AudioRecyclerViewAdapter;->getSelectedItemPosition()I

    move-result v2

    if-ne v2, p2, :cond_2

    const/4 v0, 0x1

    :cond_2
    invoke-virtual {v1}, Lcom/miui/gallery/video/editor/LocalAudio;->isDownloaded()Z

    move-result p2

    invoke-virtual {p1, v0, p2}, Lcom/miui/gallery/video/editor/adapter/AudioViewHolder;->updateSelected(ZZ)V

    invoke-virtual {v1}, Lcom/miui/gallery/video/editor/LocalAudio;->getDownloadState()I

    move-result p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/video/editor/adapter/AudioViewHolder;->setStateImage(I)V

    return-void
.end method

.method public bridge synthetic onBindView(Lcom/miui/gallery/video/editor/widget/SingleChoiceRecyclerView$SingleChoiceRecyclerViewAdapter$SingleChoiceViewHolder;I)V
    .locals 0

    check-cast p1, Lcom/miui/gallery/video/editor/adapter/AudioViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/video/editor/adapter/AudioRecyclerViewAdapter;->onBindView(Lcom/miui/gallery/video/editor/adapter/AudioViewHolder;I)V

    return-void
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;ILjava/util/List;)V
    .locals 0

    check-cast p1, Lcom/miui/gallery/video/editor/adapter/AudioViewHolder;

    invoke-virtual {p0, p1, p2, p3}, Lcom/miui/gallery/video/editor/adapter/AudioRecyclerViewAdapter;->onBindViewHolder(Lcom/miui/gallery/video/editor/adapter/AudioViewHolder;ILjava/util/List;)V

    return-void
.end method

.method public onBindViewHolder(Lcom/miui/gallery/video/editor/adapter/AudioViewHolder;ILjava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/video/editor/adapter/AudioViewHolder;",
            "I",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    invoke-interface {p3}, Ljava/util/List;->isEmpty()Z

    move-result p3

    if-eqz p3, :cond_0

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/video/editor/adapter/AudioRecyclerViewAdapter;->onBindViewHolder(Lcom/miui/gallery/video/editor/widget/SingleChoiceRecyclerView$SingleChoiceRecyclerViewAdapter$SingleChoiceViewHolder;I)V

    goto :goto_1

    :cond_0
    iget-object p3, p0, Lcom/miui/gallery/video/editor/adapter/AudioRecyclerViewAdapter;->mAudioList:Ljava/util/List;

    invoke-interface {p3, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/miui/gallery/video/editor/LocalAudio;

    invoke-virtual {p3}, Lcom/miui/gallery/video/editor/LocalAudio;->getDownloadState()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/video/editor/adapter/AudioViewHolder;->setStateImage(I)V

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/adapter/AudioRecyclerViewAdapter;->getSelectedItemPosition()I

    move-result v0

    if-ne v0, p2, :cond_1

    const/4 p2, 0x1

    goto :goto_0

    :cond_1
    const/4 p2, 0x0

    :goto_0
    invoke-virtual {p3}, Lcom/miui/gallery/video/editor/LocalAudio;->isDownloaded()Z

    move-result v0

    invoke-virtual {p1, p2, v0}, Lcom/miui/gallery/video/editor/adapter/AudioViewHolder;->updateSelected(ZZ)V

    invoke-virtual {p3}, Lcom/miui/gallery/video/editor/LocalAudio;->isDownloadSuccess()Z

    move-result p1

    if-eqz p1, :cond_2

    const/16 p1, 0x11

    invoke-virtual {p3, p1}, Lcom/miui/gallery/video/editor/LocalAudio;->setDownloadState(I)V

    :cond_2
    :goto_1
    return-void
.end method

.method public onCreateSingleChoiceViewHolder(Landroid/view/ViewGroup;I)Lcom/miui/gallery/video/editor/adapter/AudioViewHolder;
    .locals 2

    iget-object p2, p0, Lcom/miui/gallery/video/editor/adapter/AudioRecyclerViewAdapter;->mLayoutInflater:Landroid/view/LayoutInflater;

    const v0, 0x7f0b0185

    const/4 v1, 0x0

    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    new-instance p2, Lcom/miui/gallery/video/editor/adapter/AudioViewHolder;

    invoke-direct {p2, p1}, Lcom/miui/gallery/video/editor/adapter/AudioViewHolder;-><init>(Landroid/view/View;)V

    return-object p2
.end method

.method public bridge synthetic onCreateSingleChoiceViewHolder(Landroid/view/ViewGroup;I)Lcom/miui/gallery/video/editor/widget/SingleChoiceRecyclerView$SingleChoiceRecyclerViewAdapter$SingleChoiceViewHolder;
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/video/editor/adapter/AudioRecyclerViewAdapter;->onCreateSingleChoiceViewHolder(Landroid/view/ViewGroup;I)Lcom/miui/gallery/video/editor/adapter/AudioViewHolder;

    move-result-object p1

    return-object p1
.end method
