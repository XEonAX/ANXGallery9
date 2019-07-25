.class Lcom/miui/gallery/util/ShareComponentSorter$LoadTask;
.super Landroid/os/AsyncTask;
.source "ShareComponentSorter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/util/ShareComponentSorter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "LoadTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/String;",
        "Ljava/lang/Void;",
        "Ljava/util/Map<",
        "Lcom/miui/gallery/util/ShareComponentSorter$Tag;",
        "Lcom/miui/gallery/util/ShareComponentSorter$ComponentRecord;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/util/ShareComponentSorter;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/util/ShareComponentSorter;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/util/ShareComponentSorter$LoadTask;->this$0:Lcom/miui/gallery/util/ShareComponentSorter;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/util/ShareComponentSorter;Lcom/miui/gallery/util/ShareComponentSorter$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/util/ShareComponentSorter$LoadTask;-><init>(Lcom/miui/gallery/util/ShareComponentSorter;)V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/util/ShareComponentSorter$LoadTask;->doInBackground([Ljava/lang/String;)Ljava/util/Map;

    move-result-object p1

    return-object p1
.end method

.method protected varargs doInBackground([Ljava/lang/String;)Ljava/util/Map;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map<",
            "Lcom/miui/gallery/util/ShareComponentSorter$Tag;",
            "Lcom/miui/gallery/util/ShareComponentSorter$ComponentRecord;",
            ">;"
        }
    .end annotation

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    new-instance v3, Ljava/io/File;

    iget-object v4, p0, Lcom/miui/gallery/util/ShareComponentSorter$LoadTask;->this$0:Lcom/miui/gallery/util/ShareComponentSorter;

    invoke-static {v4}, Lcom/miui/gallery/util/ShareComponentSorter;->access$500(Lcom/miui/gallery/util/ShareComponentSorter;)Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v4

    const/4 v5, 0x0

    aget-object p1, p1, v5

    invoke-direct {v3, v4, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result p1

    if-nez p1, :cond_0

    const-string p1, "ShareComponentSorter"

    const-string v0, "no file found, create a empty record"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-object v2

    :cond_0
    const-string p1, "ShareComponentSorter"

    const-string v4, "read records from file"

    invoke-static {p1, v4}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v4, 0x0

    :try_start_0
    new-instance v6, Ljava/io/FileReader;

    invoke-direct {v6, v3}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/16 v4, 0x200

    :try_start_1
    new-array v4, v4, [C

    :goto_0
    invoke-virtual {v6, v4}, Ljava/io/FileReader;->read([C)I

    move-result v7

    const/4 v8, -0x1

    if-eq v7, v8, :cond_1

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    :cond_1
    :try_start_2
    invoke-virtual {v6}, Ljava/io/FileReader;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_4

    goto :goto_3

    :catch_0
    move-exception v4

    goto :goto_1

    :catch_1
    move-exception v4

    goto :goto_2

    :catchall_0
    move-exception p1

    move-object v6, v4

    goto/16 :goto_6

    :catch_2
    move-exception v6

    move-object v11, v6

    move-object v6, v4

    move-object v4, v11

    :goto_1
    :try_start_3
    const-string v7, "ShareComponentSorter"

    invoke-static {v7, v4}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    if-eqz v6, :cond_2

    :try_start_4
    invoke-virtual {v6}, Ljava/io/FileReader;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_4

    goto :goto_3

    :catch_3
    move-exception v6

    move-object v11, v6

    move-object v6, v4

    move-object v4, v11

    :goto_2
    :try_start_5
    const-string v7, "ShareComponentSorter"

    invoke-static {v7, v4}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    if-eqz v6, :cond_2

    :try_start_6
    invoke-virtual {v6}, Ljava/io/FileReader;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_4

    goto :goto_3

    :catch_4
    move-exception v4

    const-string v6, "ShareComponentSorter"

    invoke-static {v6, v4}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_2
    :goto_3
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_3

    const-string p1, "ShareComponentSorter"

    const-string v0, "record file is empty, skip"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-object v2

    :cond_3
    const/4 v4, 0x1

    :try_start_7
    new-instance v6, Lorg/json/JSONArray;

    invoke-direct {v6, p1}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    const-string p1, "ShareComponentSorter"

    const-string v7, "start parsing %d records"

    invoke-virtual {v6}, Lorg/json/JSONArray;->length()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-static {p1, v7, v8}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    const/4 p1, 0x0

    :goto_4
    invoke-virtual {v6}, Lorg/json/JSONArray;->length()I

    move-result v7

    if-ge v5, v7, :cond_5

    invoke-virtual {v6, v5}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v7

    invoke-static {v7}, Lcom/miui/gallery/util/ShareComponentSorter$ComponentRecord;->fromJson(Lorg/json/JSONObject;)Lcom/miui/gallery/util/ShareComponentSorter$ComponentRecord;

    move-result-object v7

    if-eqz v7, :cond_4

    new-instance v8, Lcom/miui/gallery/util/ShareComponentSorter$Tag;

    invoke-static {v7}, Lcom/miui/gallery/util/ShareComponentSorter$ComponentRecord;->access$600(Lcom/miui/gallery/util/ShareComponentSorter$ComponentRecord;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v7}, Lcom/miui/gallery/util/ShareComponentSorter$ComponentRecord;->access$700(Lcom/miui/gallery/util/ShareComponentSorter$ComponentRecord;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v8, v9, v10}, Lcom/miui/gallery/util/ShareComponentSorter$Tag;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v2, v8, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_7
    .catch Lorg/json/JSONException; {:try_start_7 .. :try_end_7} :catch_5

    goto :goto_5

    :cond_4
    const/4 p1, 0x1

    :goto_5
    add-int/lit8 v5, v5, 0x1

    goto :goto_4

    :catch_5
    move-exception p1

    const-string v5, "ShareComponentSorter"

    const-string v6, "read history failed, abort:"

    invoke-static {v5, v6}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    const-string v5, "ShareComponentSorter"

    invoke-static {v5, p1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 p1, 0x1

    :cond_5
    if-eqz p1, :cond_6

    const-string p1, "ShareComponentSorter"

    const-string v4, "file is illegal, delete file: %b"

    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    move-result v3

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-static {p1, v4, v3}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_6
    const-string p1, "ShareComponentSorter"

    const-string v3, "read from file: %dms"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long/2addr v4, v0

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {p1, v3, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-object v2

    :catchall_1
    move-exception p1

    :goto_6
    if-eqz v6, :cond_7

    :try_start_8
    invoke-virtual {v6}, Ljava/io/FileReader;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_6

    goto :goto_7

    :catch_6
    move-exception v0

    const-string v1, "ShareComponentSorter"

    invoke-static {v1, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_7
    :goto_7
    throw p1
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Ljava/util/Map;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/util/ShareComponentSorter$LoadTask;->onPostExecute(Ljava/util/Map;)V

    return-void
.end method

.method protected onPostExecute(Ljava/util/Map;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Lcom/miui/gallery/util/ShareComponentSorter$Tag;",
            "Lcom/miui/gallery/util/ShareComponentSorter$ComponentRecord;",
            ">;)V"
        }
    .end annotation

    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    const-string v0, "ShareComponentSorter"

    const-string v1, "initialized finish."

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/util/ShareComponentSorter$LoadTask;->this$0:Lcom/miui/gallery/util/ShareComponentSorter;

    invoke-static {v0, p1}, Lcom/miui/gallery/util/ShareComponentSorter;->access$802(Lcom/miui/gallery/util/ShareComponentSorter;Ljava/util/Map;)Ljava/util/Map;

    iget-object p1, p0, Lcom/miui/gallery/util/ShareComponentSorter$LoadTask;->this$0:Lcom/miui/gallery/util/ShareComponentSorter;

    invoke-static {p1}, Lcom/miui/gallery/util/ShareComponentSorter;->access$900(Lcom/miui/gallery/util/ShareComponentSorter;)Ljava/util/Map;

    move-result-object p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/util/ShareComponentSorter$LoadTask;->this$0:Lcom/miui/gallery/util/ShareComponentSorter;

    invoke-static {p1}, Lcom/miui/gallery/util/ShareComponentSorter;->access$900(Lcom/miui/gallery/util/ShareComponentSorter;)Ljava/util/Map;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Map;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_1

    const-string p1, "ShareComponentSorter"

    const-string v0, "has temp records, do transfer"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/util/ShareComponentSorter$LoadTask;->this$0:Lcom/miui/gallery/util/ShareComponentSorter;

    invoke-static {p1}, Lcom/miui/gallery/util/ShareComponentSorter;->access$900(Lcom/miui/gallery/util/ShareComponentSorter;)Ljava/util/Map;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Long;

    iget-object v3, p0, Lcom/miui/gallery/util/ShareComponentSorter$LoadTask;->this$0:Lcom/miui/gallery/util/ShareComponentSorter;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/miui/gallery/util/ShareComponentSorter$Tag;

    invoke-static {v4}, Lcom/miui/gallery/util/ShareComponentSorter$Tag;->access$1000(Lcom/miui/gallery/util/ShareComponentSorter$Tag;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/miui/gallery/util/ShareComponentSorter$Tag;

    invoke-static {v5}, Lcom/miui/gallery/util/ShareComponentSorter$Tag;->access$200(Lcom/miui/gallery/util/ShareComponentSorter$Tag;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    invoke-static {v3, v4, v5, v6, v7}, Lcom/miui/gallery/util/ShareComponentSorter;->access$1100(Lcom/miui/gallery/util/ShareComponentSorter;Ljava/lang/String;Ljava/lang/String;J)V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/util/ShareComponentSorter$LoadTask;->this$0:Lcom/miui/gallery/util/ShareComponentSorter;

    invoke-static {p1}, Lcom/miui/gallery/util/ShareComponentSorter;->access$1200(Lcom/miui/gallery/util/ShareComponentSorter;)Z

    move-result p1

    if-eqz p1, :cond_2

    const-string p1, "ShareComponentSorter"

    const-string v0, "requested save when initializing, do save"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/util/ShareComponentSorter$LoadTask;->this$0:Lcom/miui/gallery/util/ShareComponentSorter;

    invoke-virtual {p1}, Lcom/miui/gallery/util/ShareComponentSorter;->save()V

    iget-object p1, p0, Lcom/miui/gallery/util/ShareComponentSorter$LoadTask;->this$0:Lcom/miui/gallery/util/ShareComponentSorter;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/miui/gallery/util/ShareComponentSorter;->access$1202(Lcom/miui/gallery/util/ShareComponentSorter;Z)Z

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/util/ShareComponentSorter$LoadTask;->this$0:Lcom/miui/gallery/util/ShareComponentSorter;

    invoke-static {p1}, Lcom/miui/gallery/util/ShareComponentSorter;->access$1300(Lcom/miui/gallery/util/ShareComponentSorter;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/util/ShareComponentSorter$OnInitializedListener;

    invoke-interface {v0}, Lcom/miui/gallery/util/ShareComponentSorter$OnInitializedListener;->onInitialized()V

    goto :goto_1

    :cond_3
    return-void
.end method
