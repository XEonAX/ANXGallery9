.class Lcom/miui/gallery/cleaner/SimilarScanner$5;
.super Ljava/lang/Object;
.source "SimilarScanner.java"

# interfaces
.implements Lcom/miui/gallery/threadpool/ThreadPool$Job;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/cleaner/SimilarScanner;->handleRemainImages()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/threadpool/ThreadPool$Job<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field private mOnCompleteListener:Lcom/miui/gallery/cleaner/SimilarScanner$OnClusterCompletedListener;

.field final synthetic this$0:Lcom/miui/gallery/cleaner/SimilarScanner;


# direct methods
.method constructor <init>(Lcom/miui/gallery/cleaner/SimilarScanner;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/cleaner/SimilarScanner$5;->this$0:Lcom/miui/gallery/cleaner/SimilarScanner;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Lcom/miui/gallery/cleaner/SimilarScanner$5$1;

    invoke-direct {p1, p0}, Lcom/miui/gallery/cleaner/SimilarScanner$5$1;-><init>(Lcom/miui/gallery/cleaner/SimilarScanner$5;)V

    iput-object p1, p0, Lcom/miui/gallery/cleaner/SimilarScanner$5;->mOnCompleteListener:Lcom/miui/gallery/cleaner/SimilarScanner$OnClusterCompletedListener;

    return-void
.end method


# virtual methods
.method public run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Object;
    .locals 3

    iget-object p1, p0, Lcom/miui/gallery/cleaner/SimilarScanner$5;->this$0:Lcom/miui/gallery/cleaner/SimilarScanner;

    invoke-static {p1}, Lcom/miui/gallery/cleaner/SimilarScanner;->access$400(Lcom/miui/gallery/cleaner/SimilarScanner;)Z

    move-result p1

    if-eqz p1, :cond_0

    const-string p1, "SimilarScanner"

    const-string v0, "handle remain images"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/cleaner/SimilarScanner$5;->this$0:Lcom/miui/gallery/cleaner/SimilarScanner;

    const/16 v0, 0x3e8

    const/16 v1, 0x1e

    iget-object v2, p0, Lcom/miui/gallery/cleaner/SimilarScanner$5;->mOnCompleteListener:Lcom/miui/gallery/cleaner/SimilarScanner$OnClusterCompletedListener;

    invoke-static {p1, v0, v1, v2}, Lcom/miui/gallery/cleaner/SimilarScanner;->access$800(Lcom/miui/gallery/cleaner/SimilarScanner;IILcom/miui/gallery/cleaner/SimilarScanner$OnClusterCompletedListener;)Z

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method
