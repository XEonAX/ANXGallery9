.class Lcom/miui/gallery/ui/PhotoPageFragment$RecognitionTask$1;
.super Ljava/lang/Object;
.source "PhotoPageFragment.java"

# interfaces
.implements Lcom/miui/gallery/threadpool/ThreadPool$Job;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/PhotoPageFragment$RecognitionTask;->execute(Lcom/miui/gallery/model/BaseDataItem;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/threadpool/ThreadPool$Job<",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/PhotoPageFragment$RecognitionTask;

.field final synthetic val$dataItem:Lcom/miui/gallery/model/BaseDataItem;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/PhotoPageFragment$RecognitionTask;Lcom/miui/gallery/model/BaseDataItem;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$RecognitionTask$1;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment$RecognitionTask;

    iput-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$RecognitionTask$1;->val$dataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$RecognitionTask$1;->run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method public run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Void;
    .locals 8

    invoke-interface {p1}, Lcom/miui/gallery/threadpool/ThreadPool$JobContext;->isCancelled()Z

    move-result p1

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    return-object v0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$RecognitionTask$1;->val$dataItem:Lcom/miui/gallery/model/BaseDataItem;

    if-nez p1, :cond_1

    return-object v0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$RecognitionTask$1;->val$dataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2

    return-object v0

    :cond_2
    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$RecognitionTask$1;->val$dataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v1}, Lcom/miui/gallery/model/BaseDataItem;->isImage()Z

    move-result v1

    const-wide/16 v2, 0x0

    if-eqz v1, :cond_4

    invoke-static {p1}, Lcom/miui/gallery/util/SpecialTypeMediaUtils;->parseFlagsForImage(Ljava/lang/String;)J

    move-result-wide v4

    const-wide/16 v6, 0x20

    and-long/2addr v6, v4

    cmp-long v1, v6, v2

    if-eqz v1, :cond_3

    invoke-static {p1}, Lcom/miui/gallery/util/XmpHelper;->readMicroVideoOffset(Ljava/lang/String;)J

    move-result-wide v6

    cmp-long p1, v6, v2

    if-lez p1, :cond_5

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$RecognitionTask$1;->val$dataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {p1, v6, v7}, Lcom/miui/gallery/model/BaseDataItem;->setMotionOffset(J)V

    :cond_3
    move-wide v2, v4

    goto :goto_0

    :cond_4
    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$RecognitionTask$1;->val$dataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v1}, Lcom/miui/gallery/model/BaseDataItem;->isVideo()Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-static {p1}, Lcom/miui/gallery/util/SpecialTypeMediaUtils;->parseFlagsForVideo(Ljava/lang/String;)J

    move-result-wide v4

    const-wide/16 v6, 0x10

    and-long/2addr v6, v4

    cmp-long v1, v6, v2

    if-eqz v1, :cond_3

    invoke-static {p1}, Lcom/miui/gallery/util/SpecialTypeMediaUtils;->is960VideoEditable(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_3

    :cond_5
    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$RecognitionTask$1;->val$dataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {p1, v2, v3}, Lcom/miui/gallery/model/BaseDataItem;->setSpecialTypeFlags(J)V

    return-object v0
.end method
