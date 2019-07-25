.class public Lcom/miui/gallery/ui/AddRemoveFavoritesTask$Param;
.super Ljava/lang/Object;
.source "AddRemoveFavoritesTask.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/AddRemoveFavoritesTask;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Param"
.end annotation


# instance fields
.field private mAddRemoveBy:I

.field private mData:[Ljava/lang/String;

.field private mIds:[J

.field private mOperationType:I


# direct methods
.method public constructor <init>(II[J)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/miui/gallery/ui/AddRemoveFavoritesTask$Param;->mOperationType:I

    iput p2, p0, Lcom/miui/gallery/ui/AddRemoveFavoritesTask$Param;->mAddRemoveBy:I

    iput-object p3, p0, Lcom/miui/gallery/ui/AddRemoveFavoritesTask$Param;->mIds:[J

    return-void
.end method

.method public constructor <init>(II[Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/miui/gallery/ui/AddRemoveFavoritesTask$Param;->mOperationType:I

    iput p2, p0, Lcom/miui/gallery/ui/AddRemoveFavoritesTask$Param;->mAddRemoveBy:I

    iput-object p3, p0, Lcom/miui/gallery/ui/AddRemoveFavoritesTask$Param;->mData:[Ljava/lang/String;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/ui/AddRemoveFavoritesTask$Param;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/ui/AddRemoveFavoritesTask$Param;->mOperationType:I

    return p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/ui/AddRemoveFavoritesTask$Param;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/ui/AddRemoveFavoritesTask$Param;->mAddRemoveBy:I

    return p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/ui/AddRemoveFavoritesTask$Param;)[Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/AddRemoveFavoritesTask$Param;->mData:[Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/ui/AddRemoveFavoritesTask$Param;)[J
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/AddRemoveFavoritesTask$Param;->mIds:[J

    return-object p0
.end method
