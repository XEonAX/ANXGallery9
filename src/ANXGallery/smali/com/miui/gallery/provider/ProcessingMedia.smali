.class public Lcom/miui/gallery/provider/ProcessingMedia;
.super Ljava/lang/Object;
.source "ProcessingMedia.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/provider/ProcessingMedia$ProcessingMetadata;,
        Lcom/miui/gallery/provider/ProcessingMedia$Factory;
    }
.end annotation


# instance fields
.field private final mMediaStoreId:J

.field private final mMediaType:I

.field private final mPath:Ljava/lang/String;

.field private final mProcessingMetadata:Lcom/miui/gallery/provider/ProcessingMedia$ProcessingMetadata;

.field private final mSpecialTypeId:Ljava/lang/String;

.field private final mUri:Landroid/net/Uri;


# direct methods
.method private constructor <init>(Landroid/net/Uri;JLjava/lang/String;Ljava/lang/String;ILcom/miui/gallery/provider/ProcessingMedia$ProcessingMetadata;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/provider/ProcessingMedia;->mUri:Landroid/net/Uri;

    iput-wide p2, p0, Lcom/miui/gallery/provider/ProcessingMedia;->mMediaStoreId:J

    iput-object p4, p0, Lcom/miui/gallery/provider/ProcessingMedia;->mPath:Ljava/lang/String;

    iput-object p5, p0, Lcom/miui/gallery/provider/ProcessingMedia;->mSpecialTypeId:Ljava/lang/String;

    iput p6, p0, Lcom/miui/gallery/provider/ProcessingMedia;->mMediaType:I

    iput-object p7, p0, Lcom/miui/gallery/provider/ProcessingMedia;->mProcessingMetadata:Lcom/miui/gallery/provider/ProcessingMedia$ProcessingMetadata;

    return-void
.end method

.method synthetic constructor <init>(Landroid/net/Uri;JLjava/lang/String;Ljava/lang/String;ILcom/miui/gallery/provider/ProcessingMedia$ProcessingMetadata;Lcom/miui/gallery/provider/ProcessingMedia$1;)V
    .locals 0

    invoke-direct/range {p0 .. p7}, Lcom/miui/gallery/provider/ProcessingMedia;-><init>(Landroid/net/Uri;JLjava/lang/String;Ljava/lang/String;ILcom/miui/gallery/provider/ProcessingMedia$ProcessingMetadata;)V

    return-void
.end method


# virtual methods
.method public getMediaStoreId()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/provider/ProcessingMedia;->mMediaStoreId:J

    return-wide v0
.end method

.method public getPath()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/provider/ProcessingMedia;->mPath:Ljava/lang/String;

    return-object v0
.end method

.method public getProcessingMetadata()Lcom/miui/gallery/provider/ProcessingMedia$ProcessingMetadata;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/provider/ProcessingMedia;->mProcessingMetadata:Lcom/miui/gallery/provider/ProcessingMedia$ProcessingMetadata;

    return-object v0
.end method

.method public getUri()Landroid/net/Uri;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/provider/ProcessingMedia;->mUri:Landroid/net/Uri;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "ProcessingMedia{mUri="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/miui/gallery/provider/ProcessingMedia;->mUri:Landroid/net/Uri;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", mMediaStoreId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/miui/gallery/provider/ProcessingMedia;->mMediaStoreId:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ", mPath=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/miui/gallery/provider/ProcessingMedia;->mPath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v2, ", mSpecialTypeId=\'"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/miui/gallery/provider/ProcessingMedia;->mSpecialTypeId:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v1, ", mMediaType="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/miui/gallery/provider/ProcessingMedia;->mMediaType:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", mProcessingMetadata="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/miui/gallery/provider/ProcessingMedia;->mProcessingMetadata:Lcom/miui/gallery/provider/ProcessingMedia$ProcessingMetadata;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
