.class Lcom/miui/gallery/search/core/query/QueryPackageHelper$BatchQueryTask$1;
.super Ljava/lang/Object;
.source "QueryPackageHelper.java"

# interfaces
.implements Lcom/miui/gallery/search/core/Consumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/search/core/query/QueryPackageHelper$BatchQueryTask;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/search/core/Consumer<",
        "Lcom/miui/gallery/search/core/result/SourceResult;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/search/core/query/QueryPackageHelper$BatchQueryTask;


# direct methods
.method constructor <init>(Lcom/miui/gallery/search/core/query/QueryPackageHelper$BatchQueryTask;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/search/core/query/QueryPackageHelper$BatchQueryTask$1;->this$0:Lcom/miui/gallery/search/core/query/QueryPackageHelper$BatchQueryTask;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public consume(Lcom/miui/gallery/search/core/result/SourceResult;)Z
    .locals 10

    iget-object v0, p0, Lcom/miui/gallery/search/core/query/QueryPackageHelper$BatchQueryTask$1;->this$0:Lcom/miui/gallery/search/core/query/QueryPackageHelper$BatchQueryTask;

    invoke-static {v0}, Lcom/miui/gallery/search/core/query/QueryPackageHelper$BatchQueryTask;->access$000(Lcom/miui/gallery/search/core/query/QueryPackageHelper$BatchQueryTask;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    :cond_0
    if-eqz p1, :cond_6

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v2, p0, Lcom/miui/gallery/search/core/query/QueryPackageHelper$BatchQueryTask$1;->this$0:Lcom/miui/gallery/search/core/query/QueryPackageHelper$BatchQueryTask;

    invoke-static {v2}, Lcom/miui/gallery/search/core/query/QueryPackageHelper$BatchQueryTask;->access$100(Lcom/miui/gallery/search/core/query/QueryPackageHelper$BatchQueryTask;)Lcom/miui/gallery/search/core/query/QueryResult;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/miui/gallery/search/core/query/QueryResult;->addSourceResults(Ljava/util/List;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v2, p0, Lcom/miui/gallery/search/core/query/QueryPackageHelper$BatchQueryTask$1;->this$0:Lcom/miui/gallery/search/core/query/QueryPackageHelper$BatchQueryTask;

    invoke-static {v2}, Lcom/miui/gallery/search/core/query/QueryPackageHelper$BatchQueryTask;->access$200(Lcom/miui/gallery/search/core/query/QueryPackageHelper$BatchQueryTask;)Z

    move-result v2

    if-eqz v2, :cond_1

    new-instance v2, Lcom/miui/gallery/search/core/query/QueryPackageHelper$BatchQueryTask$SourceResultDataSetObserver;

    iget-object v3, p0, Lcom/miui/gallery/search/core/query/QueryPackageHelper$BatchQueryTask$1;->this$0:Lcom/miui/gallery/search/core/query/QueryPackageHelper$BatchQueryTask;

    invoke-direct {v2, v3, p1}, Lcom/miui/gallery/search/core/query/QueryPackageHelper$BatchQueryTask$SourceResultDataSetObserver;-><init>(Lcom/miui/gallery/search/core/query/QueryPackageHelper$BatchQueryTask;Lcom/miui/gallery/search/core/result/SourceResult;)V

    invoke-interface {p1, v2}, Lcom/miui/gallery/search/core/result/SourceResult;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    new-instance v2, Lcom/miui/gallery/search/core/query/QueryPackageHelper$BatchQueryTask$SourceResultContentObserver;

    iget-object v3, p0, Lcom/miui/gallery/search/core/query/QueryPackageHelper$BatchQueryTask$1;->this$0:Lcom/miui/gallery/search/core/query/QueryPackageHelper$BatchQueryTask;

    invoke-direct {v2, v3, p1}, Lcom/miui/gallery/search/core/query/QueryPackageHelper$BatchQueryTask$SourceResultContentObserver;-><init>(Lcom/miui/gallery/search/core/query/QueryPackageHelper$BatchQueryTask;Lcom/miui/gallery/search/core/result/SourceResult;)V

    invoke-interface {p1, v2}, Lcom/miui/gallery/search/core/result/SourceResult;->registerContentObserver(Landroid/database/ContentObserver;)V

    :cond_1
    invoke-interface {p1}, Lcom/miui/gallery/search/core/result/SourceResult;->getSource()Lcom/miui/gallery/search/core/source/Source;

    move-result-object v2

    if-eqz v2, :cond_5

    iget-object v3, p0, Lcom/miui/gallery/search/core/query/QueryPackageHelper$BatchQueryTask$1;->this$0:Lcom/miui/gallery/search/core/query/QueryPackageHelper$BatchQueryTask;

    invoke-static {v3}, Lcom/miui/gallery/search/core/query/QueryPackageHelper$BatchQueryTask;->access$300(Lcom/miui/gallery/search/core/query/QueryPackageHelper$BatchQueryTask;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3, v2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v3

    if-ltz v3, :cond_2

    iget-object v4, p0, Lcom/miui/gallery/search/core/query/QueryPackageHelper$BatchQueryTask$1;->this$0:Lcom/miui/gallery/search/core/query/QueryPackageHelper$BatchQueryTask;

    invoke-static {v4}, Lcom/miui/gallery/search/core/query/QueryPackageHelper$BatchQueryTask;->access$400(Lcom/miui/gallery/search/core/query/QueryPackageHelper$BatchQueryTask;)[Lcom/miui/gallery/search/core/query/QueryTask;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v5, v4, v3

    :cond_2
    invoke-interface {p1}, Lcom/miui/gallery/search/core/result/SourceResult;->getResultExtras()Landroid/os/Bundle;

    move-result-object v4

    if-eqz v4, :cond_3

    invoke-interface {p1}, Lcom/miui/gallery/search/core/result/SourceResult;->getResultExtras()Landroid/os/Bundle;

    move-result-object p1

    const-string v4, "need_requery"

    invoke-virtual {p1, v4, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    if-eqz p1, :cond_3

    const/4 p1, 0x1

    goto :goto_0

    :cond_3
    const/4 p1, 0x0

    :goto_0
    if-eqz p1, :cond_5

    iget-object p1, p0, Lcom/miui/gallery/search/core/query/QueryPackageHelper$BatchQueryTask$1;->this$0:Lcom/miui/gallery/search/core/query/QueryPackageHelper$BatchQueryTask;

    invoke-static {p1}, Lcom/miui/gallery/search/core/query/QueryPackageHelper$BatchQueryTask;->access$000(Lcom/miui/gallery/search/core/query/QueryPackageHelper$BatchQueryTask;)Z

    move-result p1

    if-eqz p1, :cond_4

    return v1

    :cond_4
    new-instance p1, Lcom/miui/gallery/search/core/QueryInfo$Builder;

    invoke-direct {p1}, Lcom/miui/gallery/search/core/QueryInfo$Builder;-><init>()V

    iget-object v1, p0, Lcom/miui/gallery/search/core/query/QueryPackageHelper$BatchQueryTask$1;->this$0:Lcom/miui/gallery/search/core/query/QueryPackageHelper$BatchQueryTask;

    invoke-static {v1}, Lcom/miui/gallery/search/core/query/QueryPackageHelper$BatchQueryTask;->access$500(Lcom/miui/gallery/search/core/query/QueryPackageHelper$BatchQueryTask;)Lcom/miui/gallery/search/core/QueryInfo;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/miui/gallery/search/core/QueryInfo$Builder;->cloneFrom(Lcom/miui/gallery/search/core/QueryInfo;)Lcom/miui/gallery/search/core/QueryInfo$Builder;

    move-result-object p1

    const-string v1, "use_persistent_response"

    invoke-virtual {p1, v1}, Lcom/miui/gallery/search/core/QueryInfo$Builder;->removeParam(Ljava/lang/String;)Ljava/lang/String;

    new-instance v1, Lcom/miui/gallery/search/core/query/QueryTask;

    invoke-virtual {p1}, Lcom/miui/gallery/search/core/QueryInfo$Builder;->build()Lcom/miui/gallery/search/core/QueryInfo;

    move-result-object v5

    iget-object p1, p0, Lcom/miui/gallery/search/core/query/QueryPackageHelper$BatchQueryTask$1;->this$0:Lcom/miui/gallery/search/core/query/QueryPackageHelper$BatchQueryTask;

    invoke-static {p1}, Lcom/miui/gallery/search/core/query/QueryPackageHelper$BatchQueryTask;->access$600(Lcom/miui/gallery/search/core/query/QueryPackageHelper$BatchQueryTask;)Lcom/miui/gallery/search/core/Consumer;

    move-result-object v7

    iget-object p1, p0, Lcom/miui/gallery/search/core/query/QueryPackageHelper$BatchQueryTask$1;->this$0:Lcom/miui/gallery/search/core/query/QueryPackageHelper$BatchQueryTask;

    invoke-static {p1}, Lcom/miui/gallery/search/core/query/QueryPackageHelper$BatchQueryTask;->access$700(Lcom/miui/gallery/search/core/query/QueryPackageHelper$BatchQueryTask;)Landroid/os/Handler;

    move-result-object v8

    const/4 v9, 0x1

    move-object v4, v1

    move-object v6, v2

    invoke-direct/range {v4 .. v9}, Lcom/miui/gallery/search/core/query/QueryTask;-><init>(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/source/SuggestionResultProvider;Lcom/miui/gallery/search/core/Consumer;Landroid/os/Handler;I)V

    iget-object p1, p0, Lcom/miui/gallery/search/core/query/QueryPackageHelper$BatchQueryTask$1;->this$0:Lcom/miui/gallery/search/core/query/QueryPackageHelper$BatchQueryTask;

    invoke-static {p1}, Lcom/miui/gallery/search/core/query/QueryPackageHelper$BatchQueryTask;->access$400(Lcom/miui/gallery/search/core/query/QueryPackageHelper$BatchQueryTask;)[Lcom/miui/gallery/search/core/query/QueryTask;

    move-result-object p1

    iget-object v4, p0, Lcom/miui/gallery/search/core/query/QueryPackageHelper$BatchQueryTask$1;->this$0:Lcom/miui/gallery/search/core/query/QueryPackageHelper$BatchQueryTask;

    invoke-static {v4}, Lcom/miui/gallery/search/core/query/QueryPackageHelper$BatchQueryTask;->access$300(Lcom/miui/gallery/search/core/query/QueryPackageHelper$BatchQueryTask;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    add-int/2addr v4, v3

    aput-object v1, p1, v4

    iget-object p1, p0, Lcom/miui/gallery/search/core/query/QueryPackageHelper$BatchQueryTask$1;->this$0:Lcom/miui/gallery/search/core/query/QueryPackageHelper$BatchQueryTask;

    invoke-static {p1}, Lcom/miui/gallery/search/core/query/QueryPackageHelper$BatchQueryTask;->access$800(Lcom/miui/gallery/search/core/query/QueryPackageHelper$BatchQueryTask;)Lcom/miui/gallery/search/core/context/TaskExecutor;

    move-result-object p1

    invoke-interface {p1, v1}, Lcom/miui/gallery/search/core/context/TaskExecutor;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;)V

    const-string p1, "QueryPackageHelper"

    const-string v1, "Submit requery task, source: [%s]"

    invoke-interface {v2}, Lcom/miui/gallery/search/core/source/Source;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v1, v2}, Lcom/miui/gallery/search/utils/SearchLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_5
    return v0

    :cond_6
    new-instance p1, Ljava/lang/RuntimeException;

    const-string v0, "Receive a null source result!"

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public bridge synthetic consume(Ljava/lang/Object;)Z
    .locals 0

    check-cast p1, Lcom/miui/gallery/search/core/result/SourceResult;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/search/core/query/QueryPackageHelper$BatchQueryTask$1;->consume(Lcom/miui/gallery/search/core/result/SourceResult;)Z

    move-result p1

    return p1
.end method
