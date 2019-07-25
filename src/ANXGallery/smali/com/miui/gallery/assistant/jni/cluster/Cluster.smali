.class public Lcom/miui/gallery/assistant/jni/cluster/Cluster;
.super Ljava/lang/Object;
.source "Cluster.java"


# instance fields
.field private final imageIds:[J


# direct methods
.method public constructor <init>([J)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/assistant/jni/cluster/Cluster;->imageIds:[J

    return-void
.end method


# virtual methods
.method public getImageIds()[J
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/assistant/jni/cluster/Cluster;->imageIds:[J

    return-object v0
.end method
