.class public abstract Lcom/miui/gallery/editor/photo/core/common/model/DoodleData;
.super Lcom/miui/gallery/editor/photo/core/Metadata;
.source "DoodleData.java"


# instance fields
.field public final normal:I

.field public final selected:I

.field public final talkback:I


# direct methods
.method public constructor <init>(SLjava/lang/String;III)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/editor/photo/core/Metadata;-><init>(SLjava/lang/String;)V

    iput p3, p0, Lcom/miui/gallery/editor/photo/core/common/model/DoodleData;->normal:I

    iput p4, p0, Lcom/miui/gallery/editor/photo/core/common/model/DoodleData;->selected:I

    iput p5, p0, Lcom/miui/gallery/editor/photo/core/common/model/DoodleData;->talkback:I

    return-void
.end method
