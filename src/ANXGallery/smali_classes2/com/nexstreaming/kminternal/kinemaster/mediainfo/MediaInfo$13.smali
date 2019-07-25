.class Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$13;
.super Landroid/os/AsyncTask;
.source "MediaInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->c(Ljava/io/File;)Lcom/nexstreaming/app/common/task/ResultTask;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/io/File;",
        "Ljava/lang/Integer;",
        "Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$a;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic a:Lcom/nexstreaming/app/common/task/ResultTask;

.field final synthetic b:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;


# direct methods
.method constructor <init>(Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;Lcom/nexstreaming/app/common/task/ResultTask;)V
    .locals 0

    iput-object p1, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$13;->b:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;

    iput-object p2, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$13;->a:Lcom/nexstreaming/app/common/task/ResultTask;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method

.method private a(Ljava/io/File;)Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$a;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    new-instance v0, Ljava/io/DataInputStream;

    new-instance v1, Ljava/io/BufferedInputStream;

    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v1, v2}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v0, v1}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-virtual {v0}, Ljava/io/DataInputStream;->readInt()I

    move-result p1

    invoke-virtual {v0}, Ljava/io/DataInputStream;->readInt()I

    move-result v1

    invoke-virtual {v0}, Ljava/io/DataInputStream;->readInt()I

    move-result v2

    new-array v3, v2, [I

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v2, :cond_0

    invoke-virtual {v0}, Ljava/io/DataInputStream;->readInt()I

    move-result v5

    aput v5, v3, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_0
    invoke-static {v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v0

    new-instance v2, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$a;

    invoke-direct {v2, p1, v1, v3, v0}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$a;-><init>(II[ILandroid/graphics/Bitmap;)V

    return-object v2
.end method


# virtual methods
.method protected varargs a([Ljava/io/File;)Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$a;
    .locals 1

    const/4 v0, 0x0

    :try_start_0
    aget-object p1, p1, v0

    invoke-direct {p0, p1}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$13;->a(Ljava/io/File;)Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$a;

    move-result-object p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/io/IOException;->printStackTrace()V

    const/4 p1, 0x0

    return-object p1
.end method

.method protected a(Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$a;)V
    .locals 3

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$13;->a:Lcom/nexstreaming/app/common/task/ResultTask;

    invoke-virtual {v0, p1}, Lcom/nexstreaming/app/common/task/ResultTask;->setResult(Ljava/lang/Object;)V

    iget-object p1, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$13;->a:Lcom/nexstreaming/app/common/task/ResultTask;

    const/4 v0, 0x3

    new-array v0, v0, [Lcom/nexstreaming/app/common/task/Task$Event;

    sget-object v1, Lcom/nexstreaming/app/common/task/Task$Event;->RESULT_AVAILABLE:Lcom/nexstreaming/app/common/task/Task$Event;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/app/common/task/Task$Event;->SUCCESS:Lcom/nexstreaming/app/common/task/Task$Event;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/app/common/task/Task$Event;->COMPLETE:Lcom/nexstreaming/app/common/task/Task$Event;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    invoke-virtual {p1, v0}, Lcom/nexstreaming/app/common/task/ResultTask;->signalEvent([Lcom/nexstreaming/app/common/task/Task$Event;)V

    return-void
.end method

.method protected synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, [Ljava/io/File;

    invoke-virtual {p0, p1}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$13;->a([Ljava/io/File;)Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$a;

    move-result-object p1

    return-object p1
.end method

.method protected synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$a;

    invoke-virtual {p0, p1}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$13;->a(Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$a;)V

    return-void
.end method
