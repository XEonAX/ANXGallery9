.class public abstract Lcom/miui/gallery/editor/photo/core/common/model/TextData;
.super Lcom/miui/gallery/editor/photo/core/Metadata;
.source "TextData.java"


# instance fields
.field public backgroundColor:I

.field public final iconPath:Ljava/lang/String;

.field public showBackgroundColor:Z


# direct methods
.method public constructor <init>(SLjava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/editor/photo/core/Metadata;-><init>(SLjava/lang/String;)V

    iput-object p3, p0, Lcom/miui/gallery/editor/photo/core/common/model/TextData;->iconPath:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(SLjava/lang/String;Ljava/lang/String;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/editor/photo/core/Metadata;-><init>(SLjava/lang/String;)V

    iput-object p3, p0, Lcom/miui/gallery/editor/photo/core/common/model/TextData;->iconPath:Ljava/lang/String;

    iput p4, p0, Lcom/miui/gallery/editor/photo/core/common/model/TextData;->backgroundColor:I

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/core/common/model/TextData;->showBackgroundColor:Z

    return-void
.end method
