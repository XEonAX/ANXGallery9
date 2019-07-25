.class public Lcom/miui/gallery/ui/DeletionTask$Param;
.super Ljava/lang/Object;
.source "DeletionTask.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/DeletionTask;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Param"
.end annotation


# instance fields
.field public mAlbumId:J

.field public mAlbumName:Ljava/lang/String;

.field public mDeleteBy:I

.field public mDeleteOptions:I

.field public mDeleteReason:I

.field public mDupType:I

.field public mIds:[J

.field public mIsBurstItems:Z

.field public mPaths:[Ljava/lang/String;


# direct methods
.method public constructor <init>([JII)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/ui/DeletionTask$Param;->mDupType:I

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/miui/gallery/ui/DeletionTask$Param;->mAlbumId:J

    const/4 v0, 0x2

    iput v0, p0, Lcom/miui/gallery/ui/DeletionTask$Param;->mDeleteBy:I

    iput-object p1, p0, Lcom/miui/gallery/ui/DeletionTask$Param;->mIds:[J

    iput p2, p0, Lcom/miui/gallery/ui/DeletionTask$Param;->mDeleteOptions:I

    iput p3, p0, Lcom/miui/gallery/ui/DeletionTask$Param;->mDeleteReason:I

    return-void
.end method

.method public constructor <init>([JIJLjava/lang/String;I)V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/ui/DeletionTask$Param;->mDupType:I

    const-wide/16 v1, -0x1

    iput-wide v1, p0, Lcom/miui/gallery/ui/DeletionTask$Param;->mAlbumId:J

    iput-object p1, p0, Lcom/miui/gallery/ui/DeletionTask$Param;->mIds:[J

    iput p2, p0, Lcom/miui/gallery/ui/DeletionTask$Param;->mDupType:I

    iput-wide p3, p0, Lcom/miui/gallery/ui/DeletionTask$Param;->mAlbumId:J

    iput-object p5, p0, Lcom/miui/gallery/ui/DeletionTask$Param;->mAlbumName:Ljava/lang/String;

    iput v0, p0, Lcom/miui/gallery/ui/DeletionTask$Param;->mDeleteBy:I

    iput p6, p0, Lcom/miui/gallery/ui/DeletionTask$Param;->mDeleteReason:I

    return-void
.end method

.method public constructor <init>([JIJLjava/lang/String;IZ)V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/ui/DeletionTask$Param;->mDupType:I

    const-wide/16 v1, -0x1

    iput-wide v1, p0, Lcom/miui/gallery/ui/DeletionTask$Param;->mAlbumId:J

    iput-object p1, p0, Lcom/miui/gallery/ui/DeletionTask$Param;->mIds:[J

    iput p2, p0, Lcom/miui/gallery/ui/DeletionTask$Param;->mDupType:I

    iput-wide p3, p0, Lcom/miui/gallery/ui/DeletionTask$Param;->mAlbumId:J

    iput-object p5, p0, Lcom/miui/gallery/ui/DeletionTask$Param;->mAlbumName:Ljava/lang/String;

    iput v0, p0, Lcom/miui/gallery/ui/DeletionTask$Param;->mDeleteBy:I

    iput p6, p0, Lcom/miui/gallery/ui/DeletionTask$Param;->mDeleteReason:I

    iput-boolean p7, p0, Lcom/miui/gallery/ui/DeletionTask$Param;->mIsBurstItems:Z

    return-void
.end method

.method public constructor <init>([Ljava/lang/String;II)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/ui/DeletionTask$Param;->mDupType:I

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/miui/gallery/ui/DeletionTask$Param;->mAlbumId:J

    const/4 v0, 0x1

    iput v0, p0, Lcom/miui/gallery/ui/DeletionTask$Param;->mDeleteBy:I

    iput-object p1, p0, Lcom/miui/gallery/ui/DeletionTask$Param;->mPaths:[Ljava/lang/String;

    iput p2, p0, Lcom/miui/gallery/ui/DeletionTask$Param;->mDeleteOptions:I

    iput p3, p0, Lcom/miui/gallery/ui/DeletionTask$Param;->mDeleteReason:I

    return-void
.end method


# virtual methods
.method public getItemsCount()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/ui/DeletionTask$Param;->mDeleteBy:I

    packed-switch v0, :pswitch_data_0

    const/4 v0, 0x0

    return v0

    :pswitch_0
    iget-object v0, p0, Lcom/miui/gallery/ui/DeletionTask$Param;->mIds:[J

    array-length v0, v0

    return v0

    :pswitch_1
    iget-object v0, p0, Lcom/miui/gallery/ui/DeletionTask$Param;->mPaths:[Ljava/lang/String;

    array-length v0, v0

    return v0

    :pswitch_2
    iget-object v0, p0, Lcom/miui/gallery/ui/DeletionTask$Param;->mIds:[J

    array-length v0, v0

    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
