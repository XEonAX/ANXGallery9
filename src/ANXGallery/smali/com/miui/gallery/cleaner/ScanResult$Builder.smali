.class public Lcom/miui/gallery/cleaner/ScanResult$Builder;
.super Ljava/lang/Object;
.source "ScanResult.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/cleaner/ScanResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private mAction:I

.field private mContext:Landroid/content/Context;

.field private mCount:I

.field private mCountText:I

.field private mDescription:I

.field private mImages:[Lcom/miui/gallery/cleaner/ScanResult$ResultImage;

.field private mOnClickListener:Lcom/miui/gallery/cleaner/ScanResult$OnScanResultClickListener;

.field private mSize:J

.field private mTitle:I

.field private mType:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Lcom/miui/gallery/cleaner/ScanResult$Builder;->mType:I

    iput-object p1, p0, Lcom/miui/gallery/cleaner/ScanResult$Builder;->mContext:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public build()Lcom/miui/gallery/cleaner/ScanResult;
    .locals 6

    iget v0, p0, Lcom/miui/gallery/cleaner/ScanResult$Builder;->mType:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_4

    iget v0, p0, Lcom/miui/gallery/cleaner/ScanResult$Builder;->mTitle:I

    if-eqz v0, :cond_3

    iget v0, p0, Lcom/miui/gallery/cleaner/ScanResult$Builder;->mAction:I

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/cleaner/ScanResult$Builder;->mOnClickListener:Lcom/miui/gallery/cleaner/ScanResult$OnScanResultClickListener;

    if-eqz v0, :cond_1

    new-instance v0, Lcom/miui/gallery/cleaner/ScanResult;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/miui/gallery/cleaner/ScanResult;-><init>(Lcom/miui/gallery/cleaner/ScanResult$1;)V

    iget v1, p0, Lcom/miui/gallery/cleaner/ScanResult$Builder;->mType:I

    invoke-static {v0, v1}, Lcom/miui/gallery/cleaner/ScanResult;->access$102(Lcom/miui/gallery/cleaner/ScanResult;I)I

    iget-wide v1, p0, Lcom/miui/gallery/cleaner/ScanResult$Builder;->mSize:J

    const-wide/16 v3, 0x0

    cmp-long v5, v1, v3

    if-gez v5, :cond_0

    goto :goto_0

    :cond_0
    iget-wide v3, p0, Lcom/miui/gallery/cleaner/ScanResult$Builder;->mSize:J

    :goto_0
    invoke-static {v0, v3, v4}, Lcom/miui/gallery/cleaner/ScanResult;->access$202(Lcom/miui/gallery/cleaner/ScanResult;J)J

    iget-object v1, p0, Lcom/miui/gallery/cleaner/ScanResult$Builder;->mImages:[Lcom/miui/gallery/cleaner/ScanResult$ResultImage;

    invoke-static {v0, v1}, Lcom/miui/gallery/cleaner/ScanResult;->access$302(Lcom/miui/gallery/cleaner/ScanResult;[Lcom/miui/gallery/cleaner/ScanResult$ResultImage;)[Lcom/miui/gallery/cleaner/ScanResult$ResultImage;

    iget v1, p0, Lcom/miui/gallery/cleaner/ScanResult$Builder;->mCount:I

    invoke-static {v0, v1}, Lcom/miui/gallery/cleaner/ScanResult;->access$402(Lcom/miui/gallery/cleaner/ScanResult;I)I

    iget v1, p0, Lcom/miui/gallery/cleaner/ScanResult$Builder;->mTitle:I

    invoke-static {v0, v1}, Lcom/miui/gallery/cleaner/ScanResult;->access$502(Lcom/miui/gallery/cleaner/ScanResult;I)I

    iget v1, p0, Lcom/miui/gallery/cleaner/ScanResult$Builder;->mDescription:I

    invoke-static {v0, v1}, Lcom/miui/gallery/cleaner/ScanResult;->access$602(Lcom/miui/gallery/cleaner/ScanResult;I)I

    iget v1, p0, Lcom/miui/gallery/cleaner/ScanResult$Builder;->mAction:I

    invoke-static {v0, v1}, Lcom/miui/gallery/cleaner/ScanResult;->access$702(Lcom/miui/gallery/cleaner/ScanResult;I)I

    iget v1, p0, Lcom/miui/gallery/cleaner/ScanResult$Builder;->mCountText:I

    invoke-static {v0, v1}, Lcom/miui/gallery/cleaner/ScanResult;->access$802(Lcom/miui/gallery/cleaner/ScanResult;I)I

    iget-object v1, p0, Lcom/miui/gallery/cleaner/ScanResult$Builder;->mOnClickListener:Lcom/miui/gallery/cleaner/ScanResult$OnScanResultClickListener;

    invoke-static {v0, v1}, Lcom/miui/gallery/cleaner/ScanResult;->access$902(Lcom/miui/gallery/cleaner/ScanResult;Lcom/miui/gallery/cleaner/ScanResult$OnScanResultClickListener;)Lcom/miui/gallery/cleaner/ScanResult$OnScanResultClickListener;

    return-object v0

    :cond_1
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "the OnScanResultClickListener must not be null"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "the action must not be empty."

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_3
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "the title must not be empty."

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_4
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "the type must set."

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setAction(I)Lcom/miui/gallery/cleaner/ScanResult$Builder;
    .locals 0

    iput p1, p0, Lcom/miui/gallery/cleaner/ScanResult$Builder;->mAction:I

    return-object p0
.end method

.method public setCount(I)Lcom/miui/gallery/cleaner/ScanResult$Builder;
    .locals 0

    iput p1, p0, Lcom/miui/gallery/cleaner/ScanResult$Builder;->mCount:I

    return-object p0
.end method

.method public setCountText(I)Lcom/miui/gallery/cleaner/ScanResult$Builder;
    .locals 0

    iput p1, p0, Lcom/miui/gallery/cleaner/ScanResult$Builder;->mCountText:I

    return-object p0
.end method

.method public setDescription(I)Lcom/miui/gallery/cleaner/ScanResult$Builder;
    .locals 0

    iput p1, p0, Lcom/miui/gallery/cleaner/ScanResult$Builder;->mDescription:I

    return-object p0
.end method

.method public setImages([Lcom/miui/gallery/cleaner/ScanResult$ResultImage;)Lcom/miui/gallery/cleaner/ScanResult$Builder;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/cleaner/ScanResult$Builder;->mImages:[Lcom/miui/gallery/cleaner/ScanResult$ResultImage;

    return-object p0
.end method

.method public setOnScanResultClickListener(Lcom/miui/gallery/cleaner/ScanResult$OnScanResultClickListener;)Lcom/miui/gallery/cleaner/ScanResult$Builder;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/cleaner/ScanResult$Builder;->mOnClickListener:Lcom/miui/gallery/cleaner/ScanResult$OnScanResultClickListener;

    return-object p0
.end method

.method public setSize(J)Lcom/miui/gallery/cleaner/ScanResult$Builder;
    .locals 0

    iput-wide p1, p0, Lcom/miui/gallery/cleaner/ScanResult$Builder;->mSize:J

    return-object p0
.end method

.method public setTitle(I)Lcom/miui/gallery/cleaner/ScanResult$Builder;
    .locals 0

    iput p1, p0, Lcom/miui/gallery/cleaner/ScanResult$Builder;->mTitle:I

    return-object p0
.end method

.method public setType(I)Lcom/miui/gallery/cleaner/ScanResult$Builder;
    .locals 0

    iput p1, p0, Lcom/miui/gallery/cleaner/ScanResult$Builder;->mType:I

    return-object p0
.end method
