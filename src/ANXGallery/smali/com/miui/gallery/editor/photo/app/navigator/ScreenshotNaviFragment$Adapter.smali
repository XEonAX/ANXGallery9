.class final Lcom/miui/gallery/editor/photo/app/navigator/ScreenshotNaviFragment$Adapter;
.super Lcom/miui/gallery/ui/SimpleRecyclerView$Adapter;
.source "ScreenshotNaviFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/app/navigator/ScreenshotNaviFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Adapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/ui/SimpleRecyclerView$Adapter<",
        "Lcom/miui/gallery/editor/photo/app/navigator/ScreenshotNaviFragment$NavigatorHolder;",
        ">;"
    }
.end annotation


# instance fields
.field private mNavigatorData:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Lcom/miui/gallery/ui/SimpleRecyclerView$Adapter;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/navigator/ScreenshotNaviFragment$Adapter;->mNavigatorData:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/navigator/ScreenshotNaviFragment$Adapter;->mNavigatorData:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    check-cast p1, Lcom/miui/gallery/editor/photo/app/navigator/ScreenshotNaviFragment$NavigatorHolder;

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/editor/photo/app/navigator/ScreenshotNaviFragment$Adapter;->onBindViewHolder(Lcom/miui/gallery/editor/photo/app/navigator/ScreenshotNaviFragment$NavigatorHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/miui/gallery/editor/photo/app/navigator/ScreenshotNaviFragment$NavigatorHolder;I)V
    .locals 1

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/ui/SimpleRecyclerView$Adapter;->onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/navigator/ScreenshotNaviFragment$Adapter;->mNavigatorData:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/app/navigator/ScreenshotNaviFragment$NavigatorHolder;->bind(Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;)V

    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/editor/photo/app/navigator/ScreenshotNaviFragment$Adapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/miui/gallery/editor/photo/app/navigator/ScreenshotNaviFragment$NavigatorHolder;

    move-result-object p1

    return-object p1
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/miui/gallery/editor/photo/app/navigator/ScreenshotNaviFragment$NavigatorHolder;
    .locals 3

    new-instance p2, Lcom/miui/gallery/editor/photo/app/navigator/ScreenshotNaviFragment$NavigatorHolder;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/navigator/ScreenshotNaviFragment$Adapter;->getInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0b005f

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-direct {p2, p1}, Lcom/miui/gallery/editor/photo/app/navigator/ScreenshotNaviFragment$NavigatorHolder;-><init>(Landroid/view/View;)V

    return-object p2
.end method
