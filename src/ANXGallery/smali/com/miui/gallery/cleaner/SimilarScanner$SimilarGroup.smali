.class public Lcom/miui/gallery/cleaner/SimilarScanner$SimilarGroup;
.super Ljava/lang/Object;
.source "SimilarScanner.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/cleaner/SimilarScanner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "SimilarGroup"
.end annotation


# instance fields
.field public mGroupId:J

.field public mImageIdsInGroup:[Ljava/lang/Long;

.field final synthetic this$0:Lcom/miui/gallery/cleaner/SimilarScanner;


# direct methods
.method constructor <init>(Lcom/miui/gallery/cleaner/SimilarScanner;J[Ljava/lang/Long;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/cleaner/SimilarScanner$SimilarGroup;->this$0:Lcom/miui/gallery/cleaner/SimilarScanner;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p4, p0, Lcom/miui/gallery/cleaner/SimilarScanner$SimilarGroup;->mImageIdsInGroup:[Ljava/lang/Long;

    iput-wide p2, p0, Lcom/miui/gallery/cleaner/SimilarScanner$SimilarGroup;->mGroupId:J

    return-void
.end method
