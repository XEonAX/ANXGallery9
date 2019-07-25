.class public Lcom/miui/gallery/movie/ui/adapter/AudioAdapter;
.super Lcom/miui/gallery/movie/ui/adapter/BaseResourceAdapter;
.source "AudioAdapter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/movie/ui/adapter/BaseResourceAdapter<",
        "Lcom/miui/gallery/movie/entity/AudioResource;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/movie/ui/adapter/BaseResourceAdapter;-><init>(Landroid/content/Context;)V

    const/4 p1, -0x1

    iput p1, p0, Lcom/miui/gallery/movie/ui/adapter/AudioAdapter;->mSelectedItemPosition:I

    return-void
.end method
