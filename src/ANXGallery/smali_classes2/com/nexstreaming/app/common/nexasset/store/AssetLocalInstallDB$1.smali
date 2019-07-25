.class Lcom/nexstreaming/app/common/nexasset/store/AssetLocalInstallDB$1;
.super Landroid/os/AsyncTask;
.source "AssetLocalInstallDB.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nexstreaming/app/common/nexasset/store/AssetLocalInstallDB;->installPackageAsync(I)Lcom/nexstreaming/app/common/task/Task;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Integer;",
        "Ljava/lang/Void;",
        "Ljava/lang/Exception;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/nexstreaming/app/common/nexasset/store/AssetLocalInstallDB;

.field final synthetic val$task:Lcom/nexstreaming/app/common/task/Task;


# direct methods
.method constructor <init>(Lcom/nexstreaming/app/common/nexasset/store/AssetLocalInstallDB;Lcom/nexstreaming/app/common/task/Task;)V
    .locals 0

    iput-object p1, p0, Lcom/nexstreaming/app/common/nexasset/store/AssetLocalInstallDB$1;->this$0:Lcom/nexstreaming/app/common/nexasset/store/AssetLocalInstallDB;

    iput-object p2, p0, Lcom/nexstreaming/app/common/nexasset/store/AssetLocalInstallDB$1;->val$task:Lcom/nexstreaming/app/common/task/Task;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Integer;)Ljava/lang/Exception;
    .locals 13

    const/4 v0, 0x0

    invoke-static {v0}, Landroid/os/Process;->setThreadPriority(I)V

    aget-object p1, p1, v0

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    if-nez p1, :cond_4

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    invoke-static {}, Lcom/nexstreaming/app/common/nexasset/store/AssetLocalInstallDB;->access$000()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-virtual {v2}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v2

    array-length v3, v2

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v3, :cond_2

    aget-object v5, v2, v4

    new-instance v6, Ljava/io/File;

    invoke-direct {v6, v1, v5}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v6}, Ljava/io/File;->isFile()Z

    move-result v7

    if-eqz v7, :cond_1

    const-string v7, ".zip"

    invoke-virtual {v5, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-virtual {v6}, Ljava/io/File;->length()J

    move-result-wide v7

    const-wide/16 v9, 0x2

    cmp-long v11, v7, v9

    if-lez v11, :cond_1

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v7

    add-int/lit8 v7, v7, -0x4

    invoke-virtual {v5, v0, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    iget-object v8, p0, Lcom/nexstreaming/app/common/nexasset/store/AssetLocalInstallDB$1;->this$0:Lcom/nexstreaming/app/common/nexasset/store/AssetLocalInstallDB;

    invoke-static {v8, v1, v7}, Lcom/nexstreaming/app/common/nexasset/store/AssetLocalInstallDB;->access$100(Lcom/nexstreaming/app/common/nexasset/store/AssetLocalInstallDB;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-virtual {p1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_0
    invoke-virtual {v6}, Ljava/io/File;->delete()Z

    :cond_1
    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_2
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-nez v1, :cond_3

    const-string p1, "AssetLocalInstallDB"

    const-string v0, "download asset package not found."

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance p1, Landroid/content/res/Resources$NotFoundException;

    const-string v0, "download asset package not found"

    invoke-direct {p1, v0}, Landroid/content/res/Resources$NotFoundException;-><init>(Ljava/lang/String;)V

    return-object p1

    :cond_3
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    new-array v1, v1, [Ljava/lang/String;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    :goto_2
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v3, v4, :cond_5

    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    aput-object v4, v1, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    :cond_4
    iget-object v1, p0, Lcom/nexstreaming/app/common/nexasset/store/AssetLocalInstallDB$1;->this$0:Lcom/nexstreaming/app/common/nexasset/store/AssetLocalInstallDB;

    invoke-static {}, Lcom/nexstreaming/app/common/nexasset/store/AssetLocalInstallDB;->access$000()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/nexstreaming/app/common/nexasset/store/AssetLocalInstallDB;->access$100(Lcom/nexstreaming/app/common/nexasset/store/AssetLocalInstallDB;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_9

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/String;

    new-array v1, v1, [Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ".zip"

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    aput-object p1, v2, v0

    move-object v12, v2

    move-object v2, v1

    move-object v1, v12

    :cond_5
    const/4 p1, 0x0

    :goto_3
    array-length v3, v1

    if-ge p1, v3, :cond_8

    aget-object v3, v1, p1

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x4

    invoke-virtual {v3, v0, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    :try_start_0
    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    invoke-static {}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->a()Lcom/nexstreaming/app/common/nexasset/assetpackage/c;

    move-result-object v4

    invoke-virtual {v4, v3}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->b(I)Lcom/nexstreaming/app/common/nexasset/assetpackage/b;

    move-result-object v4

    if-eqz v4, :cond_7

    const-string v5, "AssetLocalInstallDB"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "already installed Asset="

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-interface {v4}, Lcom/nexstreaming/app/common/nexasset/assetpackage/b;->getInstallSourceType()Lcom/nexstreaming/app/common/nexasset/assetpackage/InstallSourceType;

    move-result-object v4

    sget-object v5, Lcom/nexstreaming/app/common/nexasset/assetpackage/InstallSourceType;->STORE:Lcom/nexstreaming/app/common/nexasset/assetpackage/InstallSourceType;
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    if-ne v4, v5, :cond_6

    :try_start_1
    iget-object v4, p0, Lcom/nexstreaming/app/common/nexasset/store/AssetLocalInstallDB$1;->this$0:Lcom/nexstreaming/app/common/nexasset/store/AssetLocalInstallDB;

    invoke-static {v4, v3, v0}, Lcom/nexstreaming/app/common/nexasset/store/AssetLocalInstallDB;->access$200(Lcom/nexstreaming/app/common/nexasset/store/AssetLocalInstallDB;IZ)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_4

    :cond_6
    :try_start_2
    const-string v4, "AssetLocalInstallDB"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "installed Asset is not store type. idx="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v4, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_4

    :catch_0
    const-string v3, "AssetLocalInstallDB"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "baseId is not Integer baseId="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :catch_1
    :cond_7
    :goto_4
    iget-object v3, p0, Lcom/nexstreaming/app/common/nexasset/store/AssetLocalInstallDB$1;->this$0:Lcom/nexstreaming/app/common/nexasset/store/AssetLocalInstallDB;

    invoke-static {v3, v7}, Lcom/nexstreaming/app/common/nexasset/store/AssetLocalInstallDB;->access$300(Lcom/nexstreaming/app/common/nexasset/store/AssetLocalInstallDB;Ljava/lang/String;)Ljava/io/File;

    move-result-object v8

    iget-object v3, p0, Lcom/nexstreaming/app/common/nexasset/store/AssetLocalInstallDB$1;->val$task:Lcom/nexstreaming/app/common/task/Task;

    add-int/lit8 v4, p1, 0x1

    array-length v5, v1

    invoke-virtual {v3, v4, v5}, Lcom/nexstreaming/app/common/task/Task;->setProgress(II)V

    :try_start_3
    iget-object v5, p0, Lcom/nexstreaming/app/common/nexasset/store/AssetLocalInstallDB$1;->this$0:Lcom/nexstreaming/app/common/nexasset/store/AssetLocalInstallDB;

    aget-object v6, v1, p1

    iget-object v9, p0, Lcom/nexstreaming/app/common/nexasset/store/AssetLocalInstallDB$1;->val$task:Lcom/nexstreaming/app/common/task/Task;

    const/4 v10, 0x0

    aget-object v11, v2, p1

    invoke-static/range {v5 .. v11}, Lcom/nexstreaming/app/common/nexasset/store/AssetLocalInstallDB;->access$400(Lcom/nexstreaming/app/common/nexasset/store/AssetLocalInstallDB;Ljava/lang/String;Ljava/lang/String;Ljava/io/File;Lcom/nexstreaming/app/common/task/Task;ZLjava/lang/String;)V

    const-string v3, "AssetLocalInstallDB"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "install asset completed : asset = ["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-object v6, v1, p1

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "]"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catch Ljava/io/FileNotFoundException; {:try_start_3 .. :try_end_3} :catch_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move p1, v4

    goto/16 :goto_3

    :catchall_0
    move-exception p1

    goto :goto_5

    :catch_2
    move-exception v0

    :try_start_4
    const-string v2, "AssetLocalInstallDB"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "install asset failed : asset = ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-object v4, v1, p1

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v2, Ljava/io/File;

    invoke-static {}, Lcom/nexstreaming/app/common/nexasset/store/AssetLocalInstallDB;->access$000()Ljava/lang/String;

    move-result-object v3

    aget-object p1, v1, p1

    invoke-direct {v2, v3, p1}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    return-object v0

    :catch_3
    move-exception v0

    const-string v2, "AssetLocalInstallDB"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "install asset failed : asset = ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-object p1, v1, p1

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "]"

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    return-object v0

    :goto_5
    throw p1

    :cond_8
    const/4 p1, 0x0

    return-object p1

    :cond_9
    const-string v0, "AssetLocalInstallDB"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "download asset package not found. AssetIdx="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance p1, Landroid/content/res/Resources$NotFoundException;

    const-string v0, "download asset package not found"

    invoke-direct {p1, v0}, Landroid/content/res/Resources$NotFoundException;-><init>(Ljava/lang/String;)V

    return-object p1
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, [Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/nexstreaming/app/common/nexasset/store/AssetLocalInstallDB$1;->doInBackground([Ljava/lang/Integer;)Ljava/lang/Exception;

    move-result-object p1

    return-object p1
.end method

.method protected onPostExecute(Ljava/lang/Exception;)V
    .locals 3

    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/nexstreaming/app/common/nexasset/store/AssetLocalInstallDB$1;->this$0:Lcom/nexstreaming/app/common/nexasset/store/AssetLocalInstallDB;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/nexstreaming/app/common/nexasset/store/AssetLocalInstallDB;->access$502(Lcom/nexstreaming/app/common/nexasset/store/AssetLocalInstallDB;Z)Z

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/app/common/nexasset/store/AssetLocalInstallDB$1;->val$task:Lcom/nexstreaming/app/common/task/Task;

    new-instance v1, Lcom/nexstreaming/app/common/nexasset/store/AssetLocalInstallDB$InstallTaskError;

    const-string v2, "asset_install_failed"

    invoke-direct {v1, v2, p1}, Lcom/nexstreaming/app/common/nexasset/store/AssetLocalInstallDB$InstallTaskError;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    invoke-virtual {v0, v1}, Lcom/nexstreaming/app/common/task/Task;->sendFailure(Lcom/nexstreaming/app/common/task/Task$TaskError;)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/nexstreaming/app/common/nexasset/store/AssetLocalInstallDB$1;->val$task:Lcom/nexstreaming/app/common/task/Task;

    const/4 v0, 0x1

    new-array v0, v0, [Lcom/nexstreaming/app/common/task/Task$Event;

    sget-object v2, Lcom/nexstreaming/app/common/task/Task$Event;->COMPLETE:Lcom/nexstreaming/app/common/task/Task$Event;

    aput-object v2, v0, v1

    invoke-virtual {p1, v0}, Lcom/nexstreaming/app/common/task/Task;->signalEvent([Lcom/nexstreaming/app/common/task/Task$Event;)V

    :goto_0
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Ljava/lang/Exception;

    invoke-virtual {p0, p1}, Lcom/nexstreaming/app/common/nexasset/store/AssetLocalInstallDB$1;->onPostExecute(Ljava/lang/Exception;)V

    return-void
.end method

.method protected onPreExecute()V
    .locals 0

    invoke-super {p0}, Landroid/os/AsyncTask;->onPreExecute()V

    return-void
.end method
