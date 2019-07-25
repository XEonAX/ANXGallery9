.class public Lcom/miui/gallery/editor/blocksdk/Block;
.super Ljava/lang/Object;
.source "Block.java"


# instance fields
.field public mHeight:I

.field public mOffset:I

.field public mStatus:I

.field public mWidth:I

.field public totalHeight:I


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput v0, p0, Lcom/miui/gallery/editor/blocksdk/Block;->mStatus:I

    return-void
.end method
