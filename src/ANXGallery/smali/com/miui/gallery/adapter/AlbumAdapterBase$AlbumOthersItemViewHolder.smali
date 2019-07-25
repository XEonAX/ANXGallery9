.class public Lcom/miui/gallery/adapter/AlbumAdapterBase$AlbumOthersItemViewHolder;
.super Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;
.source "AlbumAdapterBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/adapter/AlbumAdapterBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AlbumOthersItemViewHolder"
.end annotation


# direct methods
.method private constructor <init>(Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;-><init>(Landroid/view/View;)V

    return-void
.end method

.method public static newInstance(Landroid/view/ViewGroup;)Lcom/miui/gallery/adapter/AlbumAdapterBase$AlbumOthersItemViewHolder;
    .locals 2

    new-instance v0, Lcom/miui/gallery/adapter/AlbumAdapterBase$AlbumOthersItemViewHolder;

    const v1, 0x7f0b0019

    invoke-static {p0, v1}, Lcom/miui/gallery/adapter/AlbumAdapterBase$AlbumOthersItemViewHolder;->getView(Landroid/view/ViewGroup;I)Landroid/view/View;

    move-result-object p0

    invoke-direct {v0, p0}, Lcom/miui/gallery/adapter/AlbumAdapterBase$AlbumOthersItemViewHolder;-><init>(Landroid/view/View;)V

    return-object v0
.end method
