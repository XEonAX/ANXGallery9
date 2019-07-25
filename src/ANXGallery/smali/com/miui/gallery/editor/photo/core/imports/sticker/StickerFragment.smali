.class public Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerFragment;
.super Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;
.source "StickerFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerFragment$DecodeTask;
    }
.end annotation


# instance fields
.field private mData:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerItem;",
            ">;"
        }
    .end annotation
.end field

.field private mStickerEditorView:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerFragment;->mData:Ljava/util/List;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerFragment;)Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerFragment;->mStickerEditorView:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    return-object p0
.end method


# virtual methods
.method public add(Lcom/miui/gallery/editor/photo/core/Metadata;Ljava/lang/Object;)V
    .locals 6

    check-cast p1, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerItem;

    sget-object p2, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;->INSTANCE:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;

    invoke-virtual {p2, p1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;->fromCache(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerItem;)Landroid/graphics/Bitmap;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerFragment;->mStickerEditorView:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    iget-object v2, p1, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerItem;->content:Ljava/lang/String;

    iget-wide v3, p1, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerItem;->id:J

    iget-object v5, p1, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerItem;->cateName:Ljava/lang/String;

    invoke-virtual/range {v0 .. v5}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->add(Landroid/graphics/Bitmap;Ljava/lang/String;JLjava/lang/String;)V

    goto :goto_0

    :cond_0
    new-instance p2, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerFragment$DecodeTask;

    invoke-direct {p2, p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerFragment$DecodeTask;-><init>(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerFragment;Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerItem;)V

    sget-object v0, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {p2, v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerFragment$DecodeTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    :goto_0
    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerFragment;->mData:Ljava/util/List;

    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object p2, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;->INSTANCE:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;

    invoke-virtual {p2, p1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;->touch(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerItem;)V

    return-void
.end method

.method public clear()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerFragment;->mData:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerFragment;->mStickerEditorView:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->onClear()V

    return-void
.end method

.method public isEmpty()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerFragment;->mData:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;->onCreate(Landroid/os/Bundle;)V

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    const p3, 0x7f0b0071

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup;

    new-instance p2, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerFragment;->getActivity()Landroid/app/Activity;

    move-result-object p3

    invoke-direct {p2, p3}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerFragment;->mStickerEditorView:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerFragment;->mStickerEditorView:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerFragment;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object p3

    invoke-virtual {p2, p3}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->setBitmap(Landroid/graphics/Bitmap;)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerFragment;->mStickerEditorView:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    const/4 p3, -0x1

    invoke-virtual {p1, p2, p3, p3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V

    return-object p1
.end method

.method public onDestroy()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;->onDestroy()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerFragment;->mStickerEditorView:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->onDestroy()V

    return-void
.end method

.method public onDestroyView()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;->onDestroyView()V

    sget-object v0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;->INSTANCE:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;->writeRecentToFile()V

    return-void
.end method

.method public onExport()Lcom/miui/gallery/editor/photo/core/RenderData;
    .locals 2

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerRenderData;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerFragment;->mStickerEditorView:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->export()Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$StickerEntry;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerRenderData;-><init>(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView$StickerEntry;)V

    return-object v0
.end method

.method protected onSample()Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerFragment;->mStickerEditorView:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->getCacheNode()Ljava/util/List;

    move-result-object v1

    invoke-static {v1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;

    iget-object v3, v2, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->mStickerCateName:Ljava/lang/String;

    iget-wide v4, v2, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->mStickerId:J

    invoke-static {v4, v5}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v2

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "(%s)"

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v7

    add-int/lit8 v7, v7, -0x2

    invoke-virtual {v2, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v5, v6

    invoke-static {v4, v3, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public remove(Lcom/miui/gallery/editor/photo/core/Metadata;)V
    .locals 0

    return-void
.end method

.method public render()V
    .locals 0

    return-void
.end method

.method public setBitmap(Landroid/graphics/Bitmap;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;->setBitmap(Landroid/graphics/Bitmap;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerFragment;->mStickerEditorView:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerFragment;->mStickerEditorView:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEditorView;->setBitmap(Landroid/graphics/Bitmap;)V

    :cond_0
    return-void
.end method
