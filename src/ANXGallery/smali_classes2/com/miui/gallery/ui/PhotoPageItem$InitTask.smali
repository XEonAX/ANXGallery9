.class Lcom/miui/gallery/ui/PhotoPageItem$InitTask;
.super Landroid/os/AsyncTask;
.source "PhotoPageItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPageItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "InitTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Lcom/miui/gallery/model/BaseDataItem;",
        ">;"
    }
.end annotation


# instance fields
.field private mClock:J

.field final synthetic this$0:Lcom/miui/gallery/ui/PhotoPageItem;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/ui/PhotoPageItem;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$InitTask;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/ui/PhotoPageItem;Lcom/miui/gallery/ui/PhotoPageItem$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageItem$InitTask;-><init>(Lcom/miui/gallery/ui/PhotoPageItem;)V

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Lcom/miui/gallery/model/BaseDataItem;
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem$InitTask;->isCancelled()Z

    move-result p1

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    return-object v0

    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iput-wide v1, p0, Lcom/miui/gallery/ui/PhotoPageItem$InitTask;->mClock:J

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$InitTask;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->reloadCache()V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem$InitTask;->isCancelled()Z

    move-result v1

    if-eqz v1, :cond_1

    return-object v0

    :cond_1
    return-object p1
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/PhotoPageItem$InitTask;->doInBackground([Ljava/lang/Void;)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object p1

    return-object p1
.end method

.method protected onPostExecute(Lcom/miui/gallery/model/BaseDataItem;)V
    .locals 6

    const-string v0, "PhotoPageItem"

    const-string v1, "init costs %d, task is cancelled: %b"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/miui/gallery/ui/PhotoPageItem$InitTask;->mClock:J

    sub-long/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem$InitTask;->isCancelled()Z

    move-result v3

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-static {v0, v1, v2, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem$InitTask;->isCancelled()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$InitTask;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    if-ne p1, v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$InitTask;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/PhotoPageItem;->displayImage(Lcom/miui/gallery/model/BaseDataItem;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$InitTask;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageItem;->onPostInitialized()V

    :cond_0
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/PhotoPageItem$InitTask;->onPostExecute(Lcom/miui/gallery/model/BaseDataItem;)V

    return-void
.end method
