.class public Lcom/miui/gallery/movie/ui/adapter/BaseResourceAdapter;
.super Lcom/miui/gallery/movie/ui/adapter/BaseAdapter;
.source "BaseResourceAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/movie/ui/adapter/BaseResourceAdapter$BaseResourceHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/miui/gallery/movie/entity/MovieResource;",
        ">",
        "Lcom/miui/gallery/movie/ui/adapter/BaseAdapter<",
        "TT;>;"
    }
.end annotation


# instance fields
.field private mPlaceColors:[I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/movie/ui/adapter/BaseAdapter;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x6

    new-array p1, p1, [I

    fill-array-data p1, :array_0

    iput-object p1, p0, Lcom/miui/gallery/movie/ui/adapter/BaseResourceAdapter;->mPlaceColors:[I

    return-void

    :array_0
    .array-data 4
        0x7f0701c6
        0x7f0701c7
        0x7f0701c8
        0x7f0701c9
        0x7f0701ca
        0x7f0701cb
    .end array-data
.end method

.method static synthetic access$000(Lcom/miui/gallery/movie/ui/adapter/BaseResourceAdapter;)[I
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/movie/ui/adapter/BaseResourceAdapter;->mPlaceColors:[I

    return-object p0
.end method


# virtual methods
.method protected bridge synthetic getHolder(Landroid/view/View;)Lcom/miui/gallery/movie/ui/adapter/BaseAdapter$BaseHolder;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/movie/ui/adapter/BaseResourceAdapter;->getHolder(Landroid/view/View;)Lcom/miui/gallery/movie/ui/adapter/BaseResourceAdapter$BaseResourceHolder;

    move-result-object p1

    return-object p1
.end method

.method protected getHolder(Landroid/view/View;)Lcom/miui/gallery/movie/ui/adapter/BaseResourceAdapter$BaseResourceHolder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            ")",
            "Lcom/miui/gallery/movie/ui/adapter/BaseResourceAdapter<",
            "TT;>.BaseResourceHolder;"
        }
    .end annotation

    new-instance v0, Lcom/miui/gallery/movie/ui/adapter/BaseResourceAdapter$BaseResourceHolder;

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/movie/ui/adapter/BaseResourceAdapter$BaseResourceHolder;-><init>(Lcom/miui/gallery/movie/ui/adapter/BaseResourceAdapter;Landroid/view/View;)V

    return-object v0
.end method

.method protected getLayoutId()I
    .locals 1

    const v0, 0x7f0b00c0

    return v0
.end method
