.class public Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;
.super Ljava/lang/Object;
.source "MediaInfo.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;,
        Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$e;,
        Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$d;,
        Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;,
        Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$MediaInfoError;,
        Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$a;,
        Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$f;
    }
.end annotation


# static fields
.field private static B:Ljava/util/Deque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Deque<",
            "Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c<",
            "Lcom/nexstreaming/kminternal/kinemaster/mediainfo/h;",
            "Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$f;",
            ">;>;"
        }
    .end annotation
.end field

.field private static C:I

.field private static D:Ljava/util/Deque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Deque<",
            "Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c<",
            "Lcom/nexstreaming/kminternal/kinemaster/mediainfo/b;",
            "Ljava/lang/Void;",
            ">;>;"
        }
    .end annotation
.end field

.field private static E:Lcom/nexstreaming/app/common/task/Task;

.field private static F:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c<",
            "**>;>;"
        }
    .end annotation
.end field

.field private static G:Z

.field private static H:Z

.field private static I:Ljava/lang/Object;

.field private static J:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$k;

.field private static K:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$j;

.field private static L:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$h;

.field private static M:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$m;

.field private static a:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/ref/WeakReference<",
            "Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;",
            ">;>;"
        }
    .end annotation
.end field

.field private static b:Lcom/nexstreaming/kminternal/kinemaster/config/ExclusionList;

.field private static v:Ljava/util/concurrent/Executor;

.field private static w:Ljava/util/concurrent/Executor;

.field private static y:Ljava/io/File;

.field private static z:Ljava/io/File;


# instance fields
.field private A:Z

.field private c:Ljava/lang/String;

.field private d:I

.field private e:Ljava/io/File;

.field private f:Ljava/io/File;

.field private g:Ljava/io/File;

.field private h:Ljava/io/File;

.field private i:Ljava/io/File;

.field private j:Ljava/io/File;

.field private k:Ljava/io/File;

.field private l:Ljava/io/File;

.field private m:Ljava/lang/String;

.field private n:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

.field private o:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c<",
            "Lcom/nexstreaming/kminternal/kinemaster/mediainfo/h;",
            "Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$f;",
            ">;"
        }
    .end annotation
.end field

.field private p:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c<",
            "Lcom/nexstreaming/kminternal/kinemaster/mediainfo/b;",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field

.field private q:Lcom/nexstreaming/app/common/task/ResultTask;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/nexstreaming/app/common/task/ResultTask<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field private r:Lcom/nexstreaming/app/common/task/ResultTask;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/nexstreaming/app/common/task/ResultTask<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field private s:Lcom/nexstreaming/app/common/task/ResultTask;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/nexstreaming/app/common/task/ResultTask<",
            "[I>;"
        }
    .end annotation
.end field

.field private t:Landroid/os/AsyncTask;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/AsyncTask<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            "[I>;"
        }
    .end annotation
.end field

.field private u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

.field private x:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->v:Ljava/util/concurrent/Executor;

    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->w:Ljava/util/concurrent/Executor;

    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    sput-object v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->B:Ljava/util/Deque;

    const/4 v0, 0x0

    sput v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->C:I

    new-instance v1, Ljava/util/ArrayDeque;

    invoke-direct {v1}, Ljava/util/ArrayDeque;-><init>()V

    sput-object v1, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->D:Ljava/util/Deque;

    const/4 v1, 0x0

    sput-object v1, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->E:Lcom/nexstreaming/app/common/task/Task;

    new-instance v1, Landroid/util/SparseArray;

    invoke-direct {v1}, Landroid/util/SparseArray;-><init>()V

    sput-object v1, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->F:Landroid/util/SparseArray;

    sput-boolean v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->G:Z

    sput-boolean v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->H:Z

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->I:Ljava/lang/Object;

    new-instance v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$4;

    invoke-direct {v0}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$4;-><init>()V

    sput-object v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->J:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$k;

    new-instance v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$5;

    invoke-direct {v0}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$5;-><init>()V

    sput-object v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->K:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$j;

    new-instance v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$6;

    invoke-direct {v0}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$6;-><init>()V

    sput-object v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->L:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$h;

    new-instance v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$7;

    invoke-direct {v0}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$7;-><init>()V

    sput-object v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->M:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$m;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IZ)V
    .locals 10

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->d:I

    sget-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->NONE:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    iput-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->n:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->o:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;

    iput-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->p:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;

    iput-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->q:Lcom/nexstreaming/app/common/task/ResultTask;

    iput-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->r:Lcom/nexstreaming/app/common/task/ResultTask;

    iput-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->s:Lcom/nexstreaming/app/common/task/ResultTask;

    iput-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->t:Landroid/os/AsyncTask;

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->A:Z

    iput-object p1, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->c:Ljava/lang/String;

    iput p2, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->d:I

    if-nez p2, :cond_1

    invoke-static {p1}, Lcom/nexstreaming/app/common/util/FileType;->fromFile(Ljava/lang/String;)Lcom/nexstreaming/app/common/util/FileType;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-virtual {v2}, Lcom/nexstreaming/app/common/util/FileType;->isImage()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {v2}, Lcom/nexstreaming/app/common/util/FileType;->isSupportedFormat()Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-direct {p0}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->M()V

    return-void

    :cond_0
    iput-boolean v1, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->x:Z

    return-void

    :cond_1
    new-instance v2, Ljava/io/File;

    sget-object v3, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->y:Ljava/io/File;

    const-string v4, ".km_mediainfo"

    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "none_%08X"

    new-array v5, v1, [Ljava/lang/Object;

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const/4 v7, 0x0

    aput-object v6, v5, v7

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    if-nez p2, :cond_2

    new-instance p2, Ljava/io/File;

    invoke-direct {p2, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {p2}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->b(Ljava/io/File;)Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    :cond_2
    if-ne p2, v1, :cond_3

    invoke-static {p1}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->c(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    :cond_3
    :goto_0
    const-string p2, "MediaInfo"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "mediaInfoDir="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {p2, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance p2, Ljava/io/File;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "_info.dat"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p2, v2, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object p2, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->e:Ljava/io/File;

    new-instance p2, Ljava/io/File;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "_seek.dat"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p2, v2, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object p2, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->f:Ljava/io/File;

    new-instance p2, Ljava/io/File;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "_vthumb.dat"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p2, v2, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object p2, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->g:Ljava/io/File;

    new-instance p2, Ljava/io/File;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "_vthumb_large.dat"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p2, v2, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object p2, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->h:Ljava/io/File;

    new-instance p2, Ljava/io/File;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "_vthumb_large_end.dat"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p2, v2, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object p2, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->i:Ljava/io/File;

    new-instance p2, Ljava/io/File;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "_vthumb_raw.dat"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p2, v2, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object p2, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->j:Ljava/io/File;

    new-instance p2, Ljava/io/File;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "_pcm.dat"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p2, v2, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object p2, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->k:Ljava/io/File;

    iput-object v2, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->l:Ljava/io/File;

    iput-object v3, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->m:Ljava/lang/String;

    iput-boolean p3, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->A:Z

    const/16 p2, 0x9

    if-eqz p3, :cond_4

    iget-object v2, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->e:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_4

    const-string v2, "MediaInfo"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "getInfo("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, ") info file exists -> attemptng to read"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v2, Lcom/google/gson_nex/Gson;

    invoke-direct {v2}, Lcom/google/gson_nex/Gson;-><init>()V

    :try_start_0
    new-instance v4, Ljava/io/BufferedReader;

    new-instance v5, Ljava/io/FileReader;

    iget-object v6, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->e:Ljava/io/File;

    invoke-direct {v5, v6}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    invoke-direct {v4, v5}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lcom/google/gson_nex/JsonSyntaxException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lcom/google/gson_nex/JsonIOException; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    const-class v5, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    invoke-virtual {v2, v4, v5}, Lcom/google/gson_nex/Gson;->fromJson(Ljava/io/Reader;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    invoke-virtual {v4}, Ljava/io/Reader;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Lcom/google/gson_nex/JsonSyntaxException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Lcom/google/gson_nex/JsonIOException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_1

    :catchall_0
    move-exception v5

    :try_start_3
    invoke-virtual {v4}, Ljava/io/Reader;->close()V

    throw v5
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Lcom/google/gson_nex/JsonSyntaxException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Lcom/google/gson_nex/JsonIOException; {:try_start_3 .. :try_end_3} :catch_0

    :catch_0
    move-object v5, v0

    :catch_1
    :goto_1
    if-eqz v5, :cond_5

    iget v4, v5, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;->a:I

    if-ne v4, p2, :cond_5

    const-string p2, "MediaInfo"

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "getInfo("

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ") info from disk cache"

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iput-object v5, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    return-void

    :cond_4
    move-object v2, v0

    :cond_5
    sget-object v4, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->b:Lcom/nexstreaming/kminternal/kinemaster/config/ExclusionList;

    if-eqz v4, :cond_6

    sget-object v4, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->b:Lcom/nexstreaming/kminternal/kinemaster/config/ExclusionList;

    invoke-virtual {v4, v3}, Lcom/nexstreaming/kminternal/kinemaster/config/ExclusionList;->isExcluded(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_6

    const-string p2, "MediaInfo"

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "getInfo("

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ") skip due to exclusion"

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iput-boolean v1, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->x:Z

    return-void

    :cond_6
    new-instance v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexClipInfo;

    invoke-direct {v4}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexClipInfo;-><init>()V

    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->Q()Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    move-result-object v5

    if-nez v5, :cond_7

    sget-object p2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->NO_INSTANCE_AVAILABLE:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    iput-object p2, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->n:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string p2, "MediaInfo"

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "getInfo("

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ") failure:"

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->n:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_7
    sget-object v6, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->b:Lcom/nexstreaming/kminternal/kinemaster/config/ExclusionList;

    invoke-virtual {v6, v3}, Lcom/nexstreaming/kminternal/kinemaster/config/ExclusionList;->add(Ljava/lang/String;)V

    const-string v6, "MediaInfo"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "getInfo("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, ") call editor for info"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v6, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v5, p1, v4, v7, v7}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(Ljava/lang/String;Lcom/nexstreaming/kminternal/nexvideoeditor/NexClipInfo;ZI)Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    move-result-object v5

    iput-object v5, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->n:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const-string v5, "MediaInfo"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "getInfo("

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, ") returned from editor"

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v5, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->b:Lcom/nexstreaming/kminternal/kinemaster/config/ExclusionList;

    invoke-virtual {v5, v3}, Lcom/nexstreaming/kminternal/kinemaster/config/ExclusionList;->remove(Ljava/lang/String;)V

    new-instance v3, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    invoke-direct {v3, v0}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;-><init>(Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$1;)V

    iput-object v3, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->n:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    sget-object v3, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->NONE:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    if-eq v0, v3, :cond_8

    const-string p2, "MediaInfo"

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "getInfo("

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ") failure:"

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->n:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_8
    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    iput p2, v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;->a:I

    iget-object p2, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    iput-object p1, p2, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;->b:Ljava/lang/String;

    iget-object p2, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    iget v0, v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexClipInfo;->mExistAudio:I

    if-eqz v0, :cond_9

    const/4 v0, 0x1

    goto :goto_2

    :cond_9
    const/4 v0, 0x0

    :goto_2
    iput-boolean v0, p2, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;->d:Z

    iget-object p2, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    iget v0, v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexClipInfo;->mExistVideo:I

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    goto :goto_3

    :cond_a
    const/4 v0, 0x0

    :goto_3
    iput-boolean v0, p2, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;->e:Z

    iget-object p2, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    iput-boolean v7, p2, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;->f:Z

    iget-object p2, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    iget v0, v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexClipInfo;->mAudioDuration:I

    iput v0, p2, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;->k:I

    iget-object p2, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    iget v0, v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexClipInfo;->mVideoDuration:I

    iput v0, p2, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;->l:I

    iget-object p2, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    invoke-direct {p0}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->N()J

    move-result-wide v5

    iput-wide v5, p2, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;->c:J

    iget-object p2, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    iget v0, v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexClipInfo;->mVideoWidth:I

    iput v0, p2, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;->g:I

    iget-object p2, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    iget v0, v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexClipInfo;->mVideoHeight:I

    iput v0, p2, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;->h:I

    iget-object p2, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    iget v0, v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexClipInfo;->mDisplayVideoWidth:I

    iput v0, p2, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;->i:I

    iget-object p2, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    iget v0, v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexClipInfo;->mDisplayVideoHeight:I

    iput v0, p2, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;->j:I

    iget-object p2, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    iget v0, v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexClipInfo;->mSeekPointCount:I

    iput v0, p2, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;->m:I

    iget-object p2, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    iget v0, v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexClipInfo;->mFPS:I

    iput v0, p2, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;->n:I

    iget-object p2, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    iget v0, v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexClipInfo;->mVideoH264Profile:I

    iput v0, p2, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;->o:I

    iget-object p2, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    iget v0, v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexClipInfo;->mVideoH264Level:I

    iput v0, p2, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;->p:I

    iget-object p2, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    iget v0, v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexClipInfo;->mVideoH264Interlaced:I

    iput v0, p2, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;->q:I

    iget-object p2, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    iget v0, v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexClipInfo;->mVideoOrientation:I

    iput v0, p2, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;->v:I

    iget-object p2, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    iget v0, v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexClipInfo;->mVideoBitRate:I

    iput v0, p2, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;->r:I

    iget-object p2, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    iget v0, v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexClipInfo;->mAudioBitRate:I

    iput v0, p2, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;->s:I

    iget-object p2, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    iget v0, v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexClipInfo;->mAudioSampleRate:I

    iput v0, p2, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;->t:I

    iget-object p2, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    iget v0, v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexClipInfo;->mAudioChannels:I

    iput v0, p2, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;->u:I

    iget-object p2, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    iget v0, v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexClipInfo;->mVideoRenderType:I

    iput v0, p2, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;->w:I

    iget-object p2, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    iget v0, v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexClipInfo;->mVideoCodecType:I

    iput v0, p2, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;->x:I

    iget-object p2, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    iget v0, v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexClipInfo;->mAudioCodecType:I

    iput v0, p2, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;->y:I

    iget-object p2, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    iget v0, v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexClipInfo;->mVideoHDRType:I

    iput v0, p2, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;->z:I

    if-eqz p3, :cond_c

    if-nez v2, :cond_b

    new-instance v2, Lcom/google/gson_nex/Gson;

    invoke-direct {v2}, Lcom/google/gson_nex/Gson;-><init>()V

    :cond_b
    const-string p2, "MediaInfo"

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "getInfo("

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ") writing:"

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->e:Ljava/io/File;

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {p2, p3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :try_start_4
    new-instance p2, Ljava/io/BufferedWriter;

    new-instance p3, Ljava/io/FileWriter;

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->e:Ljava/io/File;

    invoke-direct {p3, v0}, Ljava/io/FileWriter;-><init>(Ljava/io/File;)V

    invoke-direct {p2, p3}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    :try_start_5
    iget-object p3, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    invoke-virtual {v2, p3, p2}, Lcom/google/gson_nex/Gson;->toJson(Ljava/lang/Object;Ljava/lang/Appendable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    :try_start_6
    invoke-virtual {p2}, Ljava/io/Writer;->close()V

    iget-object p2, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->e:Ljava/io/File;

    invoke-virtual {p2, v1}, Ljava/io/File;->setReadable(Z)Z

    goto :goto_4

    :catchall_1
    move-exception p3

    invoke-virtual {p2}, Ljava/io/Writer;->close()V

    iget-object p2, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->e:Ljava/io/File;

    invoke-virtual {p2, v1}, Ljava/io/File;->setReadable(Z)Z

    throw p3
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_2

    :catch_2
    move-exception p2

    invoke-virtual {p2}, Ljava/io/IOException;->printStackTrace()V

    :cond_c
    :goto_4
    const-string p2, "MediaInfo"

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "getInfo("

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ") out"

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method static synthetic E()V
    .locals 0

    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->S()V

    return-void
.end method

.method static synthetic F()Ljava/util/Deque;
    .locals 1

    sget-object v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->B:Ljava/util/Deque;

    return-object v0
.end method

.method static synthetic G()Ljava/util/concurrent/Executor;
    .locals 1

    sget-object v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->v:Ljava/util/concurrent/Executor;

    return-object v0
.end method

.method static synthetic H()Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;
    .locals 1

    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->Q()Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    move-result-object v0

    return-object v0
.end method

.method static synthetic I()Ljava/util/Deque;
    .locals 1

    sget-object v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->D:Ljava/util/Deque;

    return-object v0
.end method

.method static synthetic J()V
    .locals 0

    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->R()V

    return-void
.end method

.method static synthetic K()Landroid/util/SparseArray;
    .locals 1

    sget-object v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->F:Landroid/util/SparseArray;

    return-object v0
.end method

.method static synthetic L()Lcom/nexstreaming/app/common/task/Task;
    .locals 1

    sget-object v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->E:Lcom/nexstreaming/app/common/task/Task;

    return-object v0
.end method

.method private M()V
    .locals 6

    iget v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->d:I

    const/16 v1, 0x9

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    new-instance v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    invoke-direct {v0, v2}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;-><init>(Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$1;)V

    iput-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    iput v1, v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;->a:I

    return-void

    :cond_0
    new-instance v0, Ljava/io/File;

    iget-object v3, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->c:Ljava/lang/String;

    invoke-direct {v0, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    new-instance v3, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v3}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    const/4 v4, 0x1

    iput-boolean v4, v3, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5, v3}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    new-instance v5, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    invoke-direct {v5, v2}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;-><init>(Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$1;)V

    iput-object v5, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    iget-object v2, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    iput v1, v2, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;->a:I

    iget-object v1, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;->b:Ljava/lang/String;

    iget-object v1, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    const/4 v2, 0x0

    iput-boolean v2, v1, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;->d:Z

    iget-object v1, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    iput-boolean v2, v1, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;->e:Z

    iget-object v1, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    iput-boolean v4, v1, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;->f:Z

    iget-object v1, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    iput v2, v1, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;->k:I

    iget-object v1, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    iput v2, v1, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;->l:I

    iget-object v1, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v4

    iput-wide v4, v1, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;->c:J

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    iget v1, v3, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    iput v1, v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;->g:I

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    iget v1, v3, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    iput v1, v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;->h:I

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    iput v2, v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;->m:I

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    iput v2, v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;->n:I

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    iput v2, v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;->o:I

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    iput v2, v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;->p:I

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    iput v2, v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;->q:I

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    iput v2, v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;->w:I

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    iput v2, v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;->x:I

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    iput v2, v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;->y:I

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    iput v2, v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;->z:I

    iput-boolean v2, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->x:Z

    sget-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->NONE:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    iput-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->n:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    return-void
.end method

.method private N()J
    .locals 4

    iget v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->d:I

    if-nez v0, :cond_0

    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->c:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v0

    return-wide v0

    :cond_0
    iget v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->d:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->c:Ljava/lang/String;

    iget-object v2, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->c:Ljava/lang/String;

    const/16 v3, 0x3a

    invoke-virtual {v2, v3}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v2

    add-int/2addr v2, v1

    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    int-to-long v0, v0

    return-wide v0

    :cond_1
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method private O()Lcom/nexstreaming/app/common/task/Task;
    .locals 9

    new-instance v7, Lcom/nexstreaming/app/common/task/Task;

    invoke-direct {v7}, Lcom/nexstreaming/app/common/task/Task;-><init>()V

    new-instance v0, Ljava/io/File;

    sget-object v1, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->y:Ljava/io/File;

    const-string v2, ".km_mediainfo"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    new-instance v8, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$1;

    iget-object v2, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->j:Ljava/io/File;

    iget-object v3, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->g:Ljava/io/File;

    iget-object v4, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->h:Ljava/io/File;

    iget-object v5, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->i:Ljava/io/File;

    move-object v0, v8

    move-object v1, p0

    move-object v6, v7

    invoke-direct/range {v0 .. v6}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$1;-><init>(Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;Ljava/io/File;Ljava/io/File;Ljava/io/File;Ljava/io/File;Lcom/nexstreaming/app/common/task/Task;)V

    sget-object v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->v:Ljava/util/concurrent/Executor;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Integer;

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-virtual {v8, v0, v1}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$1;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-object v7
.end method

.method private P()Lcom/nexstreaming/app/common/task/ResultTask;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/nexstreaming/app/common/task/ResultTask<",
            "Lcom/nexstreaming/kminternal/kinemaster/mediainfo/b;",
            ">;"
        }
    .end annotation

    new-instance v0, Lcom/nexstreaming/app/common/task/ResultTask;

    invoke-direct {v0}, Lcom/nexstreaming/app/common/task/ResultTask;-><init>()V

    new-instance v1, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$14;

    invoke-direct {v1, p0, v0}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$14;-><init>(Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;Lcom/nexstreaming/app/common/task/ResultTask;)V

    sget-object v2, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->w:Ljava/util/concurrent/Executor;

    const/4 v3, 0x1

    new-array v3, v3, [Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;

    const/4 v4, 0x0

    aput-object p0, v3, v4

    invoke-virtual {v1, v2, v3}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$14;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-object v0
.end method

.method private static Q()Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;
    .locals 3

    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/config/EditorGlobal;->a()Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    move-result-object v0

    if-nez v0, :cond_0

    const-string v0, "MediaInfo"

    const-string v1, "getEditor : NULL EDITOR"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    return-object v0

    :cond_0
    const-string v0, "MediaInfo"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getEditor : setting sClipInfoDoneListener="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->K:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$j;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/config/EditorGlobal;->a()Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    move-result-object v0

    sget-object v1, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->K:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$j;

    invoke-virtual {v0, v1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$j;)V

    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/config/EditorGlobal;->a()Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    move-result-object v0

    sget-object v1, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->M:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$m;

    invoke-virtual {v0, v1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$m;)V

    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/config/EditorGlobal;->a()Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    move-result-object v0

    sget-object v1, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->L:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$h;

    invoke-virtual {v0, v1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$h;)V

    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/config/EditorGlobal;->a()Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    move-result-object v0

    sget-object v1, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->J:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$k;

    invoke-virtual {v0, v1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$k;)V

    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/config/EditorGlobal;->a()Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    move-result-object v0

    return-object v0
.end method

.method private static R()V
    .locals 4

    sget-object v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->D:Ljava/util/Deque;

    invoke-interface {v0}, Ljava/util/Deque;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->Q()Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    sget-object v1, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->D:Ljava/util/Deque;

    invoke-interface {v1}, Ljava/util/Deque;->remove()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;

    invoke-static {v1}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;->b(Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;)Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;

    move-result-object v2

    iget-object v2, v2, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->c:Ljava/lang/String;

    invoke-static {v1}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;->b(Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;)Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;

    move-result-object v3

    iget-object v3, v3, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->k:Ljava/io/File;

    invoke-virtual {v1}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;->getTaskId()I

    move-result v1

    invoke-virtual {v0, v2, v3, v1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(Ljava/lang/String;Ljava/io/File;I)Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    :cond_1
    return-void
.end method

.method private static S()V
    .locals 13

    sget-object v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->I:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    const-string v1, "MediaInfo"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "startPendingThumbnailTask taskcount="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v3, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->B:Ljava/util/Deque;

    invoke-interface {v3}, Ljava/util/Deque;->size()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v1, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->B:Ljava/util/Deque;

    invoke-interface {v1}, Ljava/util/Deque;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_5

    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->Q()Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    move-result-object v2

    if-nez v2, :cond_0

    monitor-exit v0

    return-void

    :cond_0
    const/4 v1, 0x0

    const/4 v3, 0x1

    :goto_0
    sget-object v4, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->B:Ljava/util/Deque;

    invoke-interface {v4}, Ljava/util/Deque;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_2

    sget-object v1, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->B:Ljava/util/Deque;

    invoke-interface {v1}, Ljava/util/Deque;->remove()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;

    iget-boolean v4, v1, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;->b:Z

    if-eqz v4, :cond_1

    const-string v4, "MediaInfo"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "startPendingThumbnailTask cancel thumbnail TaskId="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;->getTaskId()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->GETCLIPINFO_USER_CANCEL:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    invoke-virtual {v1, v4}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;->sendFailure(Lcom/nexstreaming/app/common/task/Task$TaskError;)V

    goto :goto_0

    :cond_1
    const/4 v3, 0x0

    :cond_2
    if-eqz v3, :cond_3

    const-string v1, "MediaInfo"

    const-string v2, "startPendingThumbnailTask all canceled."

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    monitor-exit v0

    return-void

    :cond_3
    invoke-static {v1}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;->a(Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$f;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    iget-object v4, v3, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$f;->i:[I

    if-eqz v4, :cond_4

    const-string v4, "MediaInfo"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "startPendingThumbnailTask use TimeTable sThumbnailsRunTaskId="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;->getTaskId()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v4, v3, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$f;->a:Ljava/lang/String;

    iget-object v5, v3, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$f;->b:Ljava/io/File;

    iget v6, v3, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$f;->c:I

    iget v7, v3, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$f;->d:I

    iget-object v8, v3, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$f;->i:[I

    array-length v8, v8

    iget-object v9, v3, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$f;->i:[I

    iget v10, v3, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$f;->h:I

    invoke-virtual {v1}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;->getTaskId()I

    move-result v11

    move-object v3, v4

    move-object v4, v5

    move v5, v6

    move v6, v7

    move v7, v8

    move-object v8, v9

    move v9, v10

    move v10, v11

    invoke-virtual/range {v2 .. v10}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(Ljava/lang/String;Ljava/io/File;III[III)Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    goto :goto_1

    :cond_4
    const-string v4, "MediaInfo"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "startPendingThumbnailTask range time sThumbnailsRunTaskId="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;->getTaskId()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v4, v3, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$f;->a:Ljava/lang/String;

    iget-object v5, v3, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$f;->b:Ljava/io/File;

    iget v6, v3, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$f;->c:I

    iget v7, v3, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$f;->d:I

    iget v8, v3, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$f;->e:I

    iget v9, v3, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$f;->f:I

    iget v10, v3, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$f;->g:I

    iget v11, v3, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$f;->h:I

    invoke-virtual {v1}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;->getTaskId()I

    move-result v12

    move-object v3, v4

    move-object v4, v5

    move v5, v6

    move v6, v7

    move v7, v8

    move v8, v9

    move v9, v10

    move v10, v11

    move v11, v12

    invoke-virtual/range {v2 .. v11}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(Ljava/lang/String;Ljava/io/File;IIIIIII)Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    :catch_0
    move-exception v2

    :try_start_2
    invoke-static {v2}, Lcom/nexstreaming/app/common/task/Task;->makeTaskError(Ljava/lang/Exception;)Lcom/nexstreaming/app/common/task/Task$TaskError;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;->sendFailure(Lcom/nexstreaming/app/common/task/Task$TaskError;)V

    goto :goto_1

    :cond_5
    const-string v1, "MediaInfo"

    const-string v2, "startPendingThumbnailTask all run end."

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :goto_1
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1
.end method

.method static synthetic a(I)I
    .locals 0

    sput p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->C:I

    return p0
.end method

.method static synthetic a(Landroid/util/SparseArray;)Landroid/util/SparseArray;
    .locals 0

    sput-object p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->F:Landroid/util/SparseArray;

    return-object p0
.end method

.method static synthetic a(Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;Ljava/io/File;)Lcom/nexstreaming/app/common/task/ResultTask;
    .locals 0

    invoke-direct {p0, p1}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->c(Ljava/io/File;)Lcom/nexstreaming/app/common/task/ResultTask;

    move-result-object p0

    return-object p0
.end method

.method public static a(Ljava/lang/String;)Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;
    .locals 1

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->a(Ljava/lang/String;Z)Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;

    move-result-object p0

    return-object p0
.end method

.method public static a(Ljava/lang/String;Z)Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;
    .locals 4

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    const-string v0, "MediaInfo"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getInfo("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->a:Ljava/util/Map;

    if-nez v0, :cond_1

    const-string v0, "MediaInfo"

    const-string v1, "getInfo : init cache"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->a:Ljava/util/Map;

    :cond_1
    sget-object v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->b:Lcom/nexstreaming/kminternal/kinemaster/config/ExclusionList;

    if-nez v0, :cond_2

    const-string v0, "MediaInfo"

    const-string v1, "getInfo : init exclusion list"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Ljava/io/File;

    sget-object v1, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->y:Ljava/io/File;

    const-string v2, ".km_mediainfo"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    new-instance v1, Ljava/io/File;

    const-string v2, "mediainfo_exclude.dat"

    invoke-direct {v1, v0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v1}, Lcom/nexstreaming/kminternal/kinemaster/config/ExclusionList;->exclusionListBackedBy(Ljava/io/File;)Lcom/nexstreaming/kminternal/kinemaster/config/ExclusionList;

    move-result-object v0

    sput-object v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->b:Lcom/nexstreaming/kminternal/kinemaster/config/ExclusionList;

    :cond_2
    invoke-static {p0}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->b(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_3

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_3
    move-object v1, p0

    :goto_0
    if-eqz p1, :cond_4

    sget-object v2, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->a:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/ref/WeakReference;

    if-eqz v2, :cond_4

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;

    if-eqz v2, :cond_4

    const-string p1, "MediaInfo"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "getInfo("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, ") using cache. duration="

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->p()I

    move-result p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-object v2

    :cond_4
    const/4 v2, 0x1

    if-ne v0, v2, :cond_5

    const/4 p1, 0x0

    :cond_5
    new-instance v2, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;

    invoke-direct {v2, p0, v0, p1}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;-><init>(Ljava/lang/String;IZ)V

    iget-object p1, v2, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->n:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    sget-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->NO_INSTANCE_AVAILABLE:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    if-ne p1, v0, :cond_6

    return-object v2

    :cond_6
    const-string p1, "MediaInfo"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getInfo("

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, ") adding to cache duration="

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->p()I

    move-result p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-object p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->a:Ljava/util/Map;

    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, v2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-interface {p0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v2
.end method

.method static synthetic a(Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;)Ljava/io/File;
    .locals 0

    iget-object p0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->j:Ljava/io/File;

    return-object p0
.end method

.method static synthetic a(Ljava/util/Deque;)Ljava/util/Deque;
    .locals 0

    sput-object p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->B:Ljava/util/Deque;

    return-object p0
.end method

.method public static a(Landroid/content/Context;)V
    .locals 0

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object p0

    sput-object p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->y:Ljava/io/File;

    return-void
.end method

.method public static a(Ljava/io/File;)V
    .locals 0

    sput-object p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->z:Ljava/io/File;

    return-void
.end method

.method public static a()Z
    .locals 8

    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->Q()Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    const-string v2, "MediaInfo"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "cancelAllGetThumbnails : Pending size="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v4, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->B:Ljava/util/Deque;

    invoke-interface {v4}, Ljava/util/Deque;->size()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v2, "MediaInfo"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "cancelAllGetThumbnails : Active size="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v4, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->F:Landroid/util/SparseArray;

    invoke-virtual {v4}, Landroid/util/SparseArray;->size()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v2, 0x0

    :goto_0
    sget-object v3, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->F:Landroid/util/SparseArray;

    invoke-virtual {v3}, Landroid/util/SparseArray;->size()I

    move-result v3

    const/4 v4, 0x1

    if-ge v2, v3, :cond_1

    sget-object v3, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->F:Landroid/util/SparseArray;

    invoke-virtual {v3, v2}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;

    iput v1, v3, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;->a:I

    iput-boolean v4, v3, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;->b:Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    sget-object v2, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->B:Ljava/util/Deque;

    invoke-interface {v2}, Ljava/util/Deque;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;

    const-string v5, "MediaInfo"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "cancelAllGetThumbnails : id="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;->getTaskId()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iput v1, v3, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;->a:I

    iput-boolean v4, v3, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;->b:Z

    goto :goto_1

    :cond_2
    invoke-virtual {v0, v1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->l(I)Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    return v4
.end method

.method private static b(Ljava/lang/String;)I
    .locals 1

    if-eqz p0, :cond_1

    const-string v0, "nexasset://"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    const/4 p0, -0x1

    return p0
.end method

.method static synthetic b(Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->c:Ljava/lang/String;

    return-object p0
.end method

.method private static b(Ljava/io/File;)Ljava/lang/String;
    .locals 9

    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    invoke-virtual {p0}, Ljava/io/File;->lastModified()J

    move-result-wide v2

    invoke-virtual {p0}, Ljava/io/File;->length()J

    move-result-wide v4

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result p0

    const/4 v6, 0x0

    const/16 v7, 0x20

    if-le p0, v7, :cond_0

    invoke-virtual {v0, v6, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    :cond_0
    const-wide/32 v7, 0xcaa8261

    mul-long v2, v2, v7

    const-wide/32 v7, 0xb9d3415

    mul-long v4, v4, v7

    add-long/2addr v2, v4

    int-to-long v4, v1

    add-long/2addr v2, v4

    const-wide/32 v4, 0xfffffff

    rem-long/2addr v2, v4

    long-to-int p0, v2

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "_"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "%08X"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    aput-object p0, v3, v6

    invoke-static {v0, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private c(Ljava/io/File;)Lcom/nexstreaming/app/common/task/ResultTask;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            ")",
            "Lcom/nexstreaming/app/common/task/ResultTask<",
            "Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$a;",
            ">;"
        }
    .end annotation

    new-instance v0, Lcom/nexstreaming/app/common/task/ResultTask;

    invoke-direct {v0}, Lcom/nexstreaming/app/common/task/ResultTask;-><init>()V

    new-instance v1, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$13;

    invoke-direct {v1, p0, v0}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$13;-><init>(Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;Lcom/nexstreaming/app/common/task/ResultTask;)V

    sget-object v2, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->w:Ljava/util/concurrent/Executor;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/io/File;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    invoke-virtual {v1, v2, v3}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$13;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-object v0
.end method

.method static synthetic c(Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;)Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;
    .locals 0

    iget-object p0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->o:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;

    return-object p0
.end method

.method private static c(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    const/16 v0, 0xb

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    const/16 v0, 0x3a

    const/16 v1, 0x5f

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "nexasset_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic d(Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;)Ljava/io/File;
    .locals 0

    iget-object p0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->g:Ljava/io/File;

    return-object p0
.end method

.method static synthetic e(Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;)Lcom/nexstreaming/app/common/task/Task;
    .locals 0

    invoke-direct {p0}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->O()Lcom/nexstreaming/app/common/task/Task;

    move-result-object p0

    return-object p0
.end method

.method static synthetic f(Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;)Ljava/io/File;
    .locals 0

    iget-object p0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->k:Ljava/io/File;

    return-object p0
.end method

.method static synthetic g(Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;)Lcom/nexstreaming/app/common/task/ResultTask;
    .locals 0

    invoke-direct {p0}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->P()Lcom/nexstreaming/app/common/task/ResultTask;

    move-result-object p0

    return-object p0
.end method

.method static synthetic h(Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;)Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;
    .locals 0

    iget-object p0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->p:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;

    return-object p0
.end method

.method static synthetic i(Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;)Ljava/io/File;
    .locals 0

    iget-object p0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->f:Ljava/io/File;

    return-object p0
.end method

.method static synthetic j(Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;)Lcom/nexstreaming/app/common/task/ResultTask;
    .locals 0

    iget-object p0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->s:Lcom/nexstreaming/app/common/task/ResultTask;

    return-object p0
.end method

.method public static k()Z
    .locals 1

    sget-object v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->F:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0
.end method


# virtual methods
.method public A()I
    .locals 1

    iget-boolean v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->x:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->n:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->isError()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    iget v0, v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;->w:I

    return v0

    :cond_1
    :goto_0
    const/4 v0, 0x0

    return v0
.end method

.method public B()I
    .locals 1

    iget-boolean v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->x:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->n:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->isError()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    iget v0, v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;->x:I

    return v0

    :cond_1
    :goto_0
    const/4 v0, 0x0

    return v0
.end method

.method public C()I
    .locals 1

    iget-boolean v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->x:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->n:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->isError()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    iget v0, v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;->y:I

    return v0

    :cond_1
    :goto_0
    const/4 v0, 0x0

    return v0
.end method

.method public D()I
    .locals 1

    iget-boolean v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->x:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->n:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->isError()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    iget v0, v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;->z:I

    return v0

    :cond_1
    :goto_0
    const/4 v0, 0x0

    return v0
.end method

.method public a(IIIIII[ILcom/nexstreaming/kminternal/kinemaster/mediainfo/c;)Lcom/nexstreaming/app/common/task/Task;
    .locals 15

    move-object v0, p0

    move/from16 v10, p5

    move-object/from16 v11, p8

    sget v1, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->C:I

    const/4 v12, 0x1

    add-int/2addr v1, v12

    sput v1, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->C:I

    iget-object v1, v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->l:Ljava/io/File;

    sget-object v2, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->z:Ljava/io/File;

    if-eqz v2, :cond_0

    sget-object v1, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->z:Ljava/io/File;

    const-string v2, "MediaInfo"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "getDetailThumbnails::temp cache dir="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_1

    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    :cond_1
    new-instance v13, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->m:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "_detail_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move/from16 v6, p1

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, "_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move/from16 v7, p2

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, "_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move/from16 v8, p3

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, "_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move/from16 v9, p4

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, "_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, "_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v3, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->C:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v13, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    if-eqz p7, :cond_2

    new-instance v2, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$f;

    iget-object v4, v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->c:Ljava/lang/String;

    move-object v3, v2

    move-object v5, v13

    move/from16 v6, p1

    move/from16 v7, p2

    move-object/from16 v8, p7

    move/from16 v9, p6

    invoke-direct/range {v3 .. v9}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$f;-><init>(Ljava/lang/String;Ljava/io/File;II[II)V

    move-object v14, v2

    goto :goto_0

    :cond_2
    new-instance v14, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$f;

    iget-object v2, v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->c:Ljava/lang/String;

    move-object v1, v14

    move-object v3, v13

    move/from16 v4, p1

    move/from16 v5, p2

    move/from16 v6, p3

    move/from16 v7, p4

    move/from16 v8, p5

    move/from16 v9, p6

    invoke-direct/range {v1 .. v9}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$f;-><init>(Ljava/lang/String;Ljava/io/File;IIIIII)V

    :goto_0
    new-instance v1, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;

    new-instance v2, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$9;

    invoke-direct {v2, p0, v13, v11, v10}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$9;-><init>(Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;Ljava/io/File;Lcom/nexstreaming/kminternal/kinemaster/mediainfo/c;I)V

    new-instance v3, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$10;

    invoke-direct {v3, p0, v11}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$10;-><init>(Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;Lcom/nexstreaming/kminternal/kinemaster/mediainfo/c;)V

    invoke-direct {v1, p0, v14, v2, v3}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;-><init>(Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;Ljava/lang/Object;Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$d;Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$e;)V

    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->Q()Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    move-result-object v2

    if-eqz v2, :cond_3

    sget-object v2, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->B:Ljava/util/Deque;

    invoke-interface {v2}, Ljava/util/Deque;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_3

    goto :goto_1

    :cond_3
    const/4 v12, 0x0

    :goto_1
    sget-object v2, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->B:Ljava/util/Deque;

    invoke-interface {v2, v1}, Ljava/util/Deque;->add(Ljava/lang/Object;)Z

    if-eqz v12, :cond_4

    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->S()V

    :cond_4
    return-object v1
.end method

.method public a(ZZ)Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;
    .locals 3

    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->Q()Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    move-result-object v0

    if-nez v0, :cond_0

    sget-object p1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->GENERAL:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    return-object p1

    :cond_0
    const/4 v1, 0x0

    if-eqz p1, :cond_1

    const/16 p1, 0x100

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    :goto_0
    if-eqz p2, :cond_2

    or-int/lit8 p1, p1, 0x10

    :cond_2
    new-instance p2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexClipInfo;

    invoke-direct {p2}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexClipInfo;-><init>()V

    iget-object v2, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->c:Ljava/lang/String;

    invoke-virtual {v0, v2, p2, p1, v1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(Ljava/lang/String;Lcom/nexstreaming/kminternal/nexvideoeditor/NexClipInfo;II)Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    move-result-object p1

    return-object p1
.end method

.method public b()Lcom/nexstreaming/app/common/task/ResultTask;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/nexstreaming/app/common/task/ResultTask<",
            "Lcom/nexstreaming/kminternal/kinemaster/mediainfo/h;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->g:Ljava/io/File;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->j:Ljava/io/File;

    if-nez v0, :cond_0

    sget-object v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$MediaInfoError;->ThumbnailsNotAvailable:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$MediaInfoError;

    invoke-static {v0}, Lcom/nexstreaming/app/common/task/ResultTask;->failedResultTask(Lcom/nexstreaming/app/common/task/Task$TaskError;)Lcom/nexstreaming/app/common/task/ResultTask;

    move-result-object v0

    return-object v0

    :cond_0
    const-string v0, "MediaInfo"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getThumbnails("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->c:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ") sPendingThumbnailTasks="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->B:Ljava/util/Deque;

    invoke-interface {v2}, Ljava/util/Deque;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->o:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->o:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;

    sget-object v1, Lcom/nexstreaming/app/common/task/Task$Event;->FAIL:Lcom/nexstreaming/app/common/task/Task$Event;

    invoke-virtual {v0, v1}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;->didSignalEvent(Lcom/nexstreaming/app/common/task/Task$Event;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "MediaInfo"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getThumbnails("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->c:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ") returning existing task"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->o:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;

    return-object v0

    :cond_1
    new-instance v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$f;

    iget-object v2, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->c:Ljava/lang/String;

    iget-object v3, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->j:Ljava/io/File;

    const/16 v4, 0x280

    const/16 v5, 0x168

    const/4 v6, 0x0

    invoke-virtual {p0}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->r()I

    move-result v7

    const/16 v8, 0x1e

    const/4 v9, 0x0

    move-object v1, v0

    invoke-direct/range {v1 .. v9}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$f;-><init>(Ljava/lang/String;Ljava/io/File;IIIIII)V

    new-instance v1, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;

    new-instance v2, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$11;

    invoke-direct {v2, p0}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$11;-><init>(Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;)V

    invoke-direct {v1, p0, v0, v2}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;-><init>(Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;Ljava/lang/Object;Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$d;)V

    iput-object v1, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->o:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->g:Ljava/io/File;

    invoke-direct {p0, v0}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->c(Ljava/io/File;)Lcom/nexstreaming/app/common/task/ResultTask;

    move-result-object v0

    new-instance v1, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$12;

    invoke-direct {v1, p0}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$12;-><init>(Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;)V

    invoke-virtual {v0, v1}, Lcom/nexstreaming/app/common/task/ResultTask;->onResultAvailable(Lcom/nexstreaming/app/common/task/ResultTask$OnResultAvailableListener;)Lcom/nexstreaming/app/common/task/ResultTask;

    const-string v0, "MediaInfo"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getThumbnails("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->c:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ") returning NEW task"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->o:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;

    return-object v0
.end method

.method public c()Lcom/nexstreaming/app/common/task/ResultTask;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/nexstreaming/app/common/task/ResultTask<",
            "Lcom/nexstreaming/kminternal/kinemaster/mediainfo/b;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->k:Ljava/io/File;

    if-nez v0, :cond_0

    sget-object v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$MediaInfoError;->PCMLevelsNotAvailable:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$MediaInfoError;

    invoke-static {v0}, Lcom/nexstreaming/app/common/task/ResultTask;->failedResultTask(Lcom/nexstreaming/app/common/task/Task$TaskError;)Lcom/nexstreaming/app/common/task/ResultTask;

    move-result-object v0

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->p:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->p:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;

    sget-object v1, Lcom/nexstreaming/app/common/task/Task$Event;->FAIL:Lcom/nexstreaming/app/common/task/Task$Event;

    invoke-virtual {v0, v1}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;->didSignalEvent(Lcom/nexstreaming/app/common/task/Task$Event;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->p:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;

    return-object v0

    :cond_1
    new-instance v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;

    const/4 v1, 0x0

    new-instance v2, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$15;

    invoke-direct {v2, p0}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$15;-><init>(Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;)V

    invoke-direct {v0, p0, v1, v2}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;-><init>(Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;Ljava/lang/Object;Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$d;)V

    iput-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->p:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;

    invoke-direct {p0}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->P()Lcom/nexstreaming/app/common/task/ResultTask;

    move-result-object v0

    new-instance v1, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$2;

    invoke-direct {v1, p0}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$2;-><init>(Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;)V

    invoke-virtual {v0, v1}, Lcom/nexstreaming/app/common/task/ResultTask;->onResultAvailable(Lcom/nexstreaming/app/common/task/ResultTask$OnResultAvailableListener;)Lcom/nexstreaming/app/common/task/ResultTask;

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->p:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;

    return-object v0
.end method

.method public d()[I
    .locals 2

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->t:Landroid/os/AsyncTask;

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->e()Lcom/nexstreaming/app/common/task/ResultTask;

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->t:Landroid/os/AsyncTask;

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    :cond_1
    :goto_0
    const/4 v0, 0x0

    :try_start_0
    iget-object v1, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->t:Landroid/os/AsyncTask;

    invoke-virtual {v1}, Landroid/os/AsyncTask;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [I
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    :catch_0
    move-exception v1

    invoke-virtual {v1}, Ljava/util/concurrent/ExecutionException;->printStackTrace()V

    return-object v0

    :catch_1
    move-exception v1

    invoke-virtual {v1}, Ljava/lang/InterruptedException;->printStackTrace()V

    return-object v0
.end method

.method public e()Lcom/nexstreaming/app/common/task/ResultTask;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/nexstreaming/app/common/task/ResultTask<",
            "[I>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->f:Ljava/io/File;

    if-nez v0, :cond_0

    sget-object v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$MediaInfoError;->SeekPointsNotAvailable:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$MediaInfoError;

    invoke-static {v0}, Lcom/nexstreaming/app/common/task/ResultTask;->failedResultTask(Lcom/nexstreaming/app/common/task/Task$TaskError;)Lcom/nexstreaming/app/common/task/ResultTask;

    move-result-object v0

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->s:Lcom/nexstreaming/app/common/task/ResultTask;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->s:Lcom/nexstreaming/app/common/task/ResultTask;

    sget-object v1, Lcom/nexstreaming/app/common/task/Task$Event;->FAIL:Lcom/nexstreaming/app/common/task/Task$Event;

    invoke-virtual {v0, v1}, Lcom/nexstreaming/app/common/task/ResultTask;->didSignalEvent(Lcom/nexstreaming/app/common/task/Task$Event;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->s:Lcom/nexstreaming/app/common/task/ResultTask;

    return-object v0

    :cond_1
    const-string v0, "MediaInfo"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getSeekPoints("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->c:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Lcom/nexstreaming/app/common/task/ResultTask;

    invoke-direct {v0}, Lcom/nexstreaming/app/common/task/ResultTask;-><init>()V

    iput-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->s:Lcom/nexstreaming/app/common/task/ResultTask;

    new-instance v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$3;

    invoke-direct {v0, p0}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$3;-><init>(Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;)V

    sget-object v1, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->w:Ljava/util/concurrent/Executor;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->c:Ljava/lang/String;

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$3;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    move-result-object v0

    iput-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->t:Landroid/os/AsyncTask;

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->s:Lcom/nexstreaming/app/common/task/ResultTask;

    return-object v0
.end method

.method public f()I
    .locals 1

    iget-boolean v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->x:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->n:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->isError()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    iget v0, v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;->m:I

    return v0

    :cond_1
    :goto_0
    const/4 v0, 0x0

    return v0
.end method

.method public g()Z
    .locals 4

    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->getDeviceProfile()Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->getMaxResolution()I

    move-result v0

    iget-object v1, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->n:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    sget-object v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->UNSUPPORT_MAX_RESOLUTION:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/4 v3, 0x0

    if-ne v1, v2, :cond_0

    return v3

    :cond_0
    invoke-virtual {p0}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->o()I

    move-result v1

    invoke-virtual {p0}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->n()I

    move-result v2

    mul-int v1, v1, v2

    mul-int/lit8 v0, v0, 0x6e

    div-int/lit8 v0, v0, 0x64

    if-le v1, v0, :cond_1

    return v3

    :cond_1
    const/4 v0, 0x1

    return v0
.end method

.method public h()Z
    .locals 2

    iget-boolean v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->x:Z

    const/4 v1, 0x0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->n:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->isError()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->g()Z

    move-result v0

    if-nez v0, :cond_1

    return v1

    :cond_1
    const/4 v0, 0x1

    return v0

    :cond_2
    :goto_0
    return v1
.end method

.method public i()Z
    .locals 1

    iget-boolean v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->x:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->n:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->isError()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public j()I
    .locals 2

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->n:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->isError()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$8;->a:[I

    iget-object v1, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->n:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    invoke-virtual {v1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    const/16 v0, -0xc

    return v0

    :pswitch_0
    const/16 v0, -0xb

    return v0

    :pswitch_1
    const/16 v0, -0xa

    return v0

    :pswitch_2
    const/16 v0, -0x9

    return v0

    :pswitch_3
    const/4 v0, -0x8

    return v0

    :pswitch_4
    const/4 v0, -0x7

    return v0

    :pswitch_5
    const/4 v0, -0x6

    return v0

    :pswitch_6
    const/4 v0, -0x5

    return v0

    :pswitch_7
    const/4 v0, -0x4

    return v0

    :pswitch_8
    const/4 v0, -0x3

    return v0

    :pswitch_9
    const/4 v0, -0x2

    return v0

    :cond_0
    invoke-virtual {p0}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->h()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    goto :goto_0

    :cond_1
    const/4 v0, -0x1

    :goto_0
    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public l()Z
    .locals 1

    iget-boolean v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->x:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->n:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->isError()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    iget-boolean v0, v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;->d:Z

    return v0

    :cond_1
    :goto_0
    const/4 v0, 0x0

    return v0
.end method

.method public m()Z
    .locals 1

    iget-boolean v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->x:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->n:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->isError()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    iget-boolean v0, v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;->e:Z

    return v0

    :cond_1
    :goto_0
    const/4 v0, 0x0

    return v0
.end method

.method public n()I
    .locals 1

    iget-boolean v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->x:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->n:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->isError()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    iget v0, v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;->g:I

    return v0

    :cond_1
    :goto_0
    const/4 v0, 0x0

    return v0
.end method

.method public o()I
    .locals 1

    iget-boolean v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->x:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->n:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->isError()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    iget v0, v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;->h:I

    return v0

    :cond_1
    :goto_0
    const/4 v0, 0x0

    return v0
.end method

.method public p()I
    .locals 1

    iget-boolean v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->x:Z

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->n:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->isError()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    iget-boolean v0, v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;->d:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    iget v0, v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;->k:I

    return v0

    :cond_1
    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    iget v0, v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;->l:I

    return v0

    :cond_2
    :goto_0
    const/4 v0, 0x0

    return v0
.end method

.method public q()I
    .locals 1

    iget-boolean v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->x:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->n:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->isError()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    iget v0, v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;->k:I

    return v0

    :cond_1
    :goto_0
    const/4 v0, 0x0

    return v0
.end method

.method public r()I
    .locals 1

    iget-boolean v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->x:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->n:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->isError()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    iget v0, v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;->l:I

    return v0

    :cond_1
    :goto_0
    const/4 v0, 0x0

    return v0
.end method

.method public s()I
    .locals 1

    iget-boolean v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->x:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->n:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->isError()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    iget v0, v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;->n:I

    return v0

    :cond_1
    :goto_0
    const/4 v0, 0x0

    return v0
.end method

.method public t()I
    .locals 1

    iget-boolean v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->x:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->n:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->isError()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    iget v0, v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;->v:I

    return v0

    :cond_1
    :goto_0
    const/4 v0, 0x0

    return v0
.end method

.method public u()I
    .locals 1

    iget-boolean v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->x:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->n:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->isError()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    iget v0, v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;->o:I

    return v0

    :cond_1
    :goto_0
    const/4 v0, 0x0

    return v0
.end method

.method public v()I
    .locals 1

    iget-boolean v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->x:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->n:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->isError()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    iget v0, v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;->p:I

    return v0

    :cond_1
    :goto_0
    const/4 v0, 0x0

    return v0
.end method

.method public w()I
    .locals 1

    iget-boolean v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->x:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->n:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->isError()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    iget v0, v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;->r:I

    return v0

    :cond_1
    :goto_0
    const/4 v0, 0x0

    return v0
.end method

.method public x()I
    .locals 1

    iget-boolean v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->x:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->n:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->isError()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    iget v0, v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;->s:I

    return v0

    :cond_1
    :goto_0
    const/4 v0, 0x0

    return v0
.end method

.method public y()I
    .locals 1

    iget-boolean v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->x:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->n:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->isError()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    iget v0, v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;->t:I

    return v0

    :cond_1
    :goto_0
    const/4 v0, 0x0

    return v0
.end method

.method public z()I
    .locals 1

    iget-boolean v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->x:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->n:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->isError()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->u:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;

    iget v0, v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$b;->u:I

    return v0

    :cond_1
    :goto_0
    const/4 v0, 0x0

    return v0
.end method
