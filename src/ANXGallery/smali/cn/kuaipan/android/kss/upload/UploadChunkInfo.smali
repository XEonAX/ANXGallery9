.class Lcn/kuaipan/android/kss/upload/UploadChunkInfo;
.super Ljava/lang/Object;
.source "UploadChunkInfo.java"

# interfaces
.implements Lcn/kuaipan/android/kss/KssDef;


# static fields
.field private static final sReRequestSet:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final sReTrySet:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final commit_meta:Ljava/lang/String;

.field public expect_info:Lcn/kuaipan/android/kss/upload/ServerExpect;

.field public left_bytes:J

.field public next_pos:J

.field public final stat:Ljava/lang/String;

.field public final upload_id:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Lcn/kuaipan/android/kss/upload/UploadChunkInfo;->sReRequestSet:Ljava/util/HashSet;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Lcn/kuaipan/android/kss/upload/UploadChunkInfo;->sReTrySet:Ljava/util/HashSet;

    sget-object v0, Lcn/kuaipan/android/kss/upload/UploadChunkInfo;->sReRequestSet:Ljava/util/HashSet;

    const-string v1, "ERR_INVALID_FILE_META"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcn/kuaipan/android/kss/upload/UploadChunkInfo;->sReRequestSet:Ljava/util/HashSet;

    const-string v1, "ERR_INVALID_BLOCK_META"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcn/kuaipan/android/kss/upload/UploadChunkInfo;->sReRequestSet:Ljava/util/HashSet;

    const-string v1, "ERR_INVALID_UPLOAD_ID"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcn/kuaipan/android/kss/upload/UploadChunkInfo;->sReRequestSet:Ljava/util/HashSet;

    const-string v1, "ERR_INVALID_CHUNK_POS"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcn/kuaipan/android/kss/upload/UploadChunkInfo;->sReRequestSet:Ljava/util/HashSet;

    const-string v1, "ERR_INVALID_CHUNK_SIZE"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcn/kuaipan/android/kss/upload/UploadChunkInfo;->sReRequestSet:Ljava/util/HashSet;

    const-string v1, "ERR_CHUNK_OUT_OF_RANGE"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcn/kuaipan/android/kss/upload/UploadChunkInfo;->sReTrySet:Ljava/util/HashSet;

    const-string v1, "ERR_CHUNK_CORRUPTED"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcn/kuaipan/android/kss/upload/UploadChunkInfo;->sReTrySet:Ljava/util/HashSet;

    const-string v1, "ERR_SERVER_EXCEPTION"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcn/kuaipan/android/kss/upload/UploadChunkInfo;->sReTrySet:Ljava/util/HashSet;

    const-string v1, "ERR_STORAGE_REQUEST_ERROR"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcn/kuaipan/android/kss/upload/UploadChunkInfo;->sReTrySet:Ljava/util/HashSet;

    const-string v1, "ERR_STORAGE_REQUEST_FAILED"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public constructor <init>(JJLjava/lang/String;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "CONTINUE_UPLOAD"

    iput-object v0, p0, Lcn/kuaipan/android/kss/upload/UploadChunkInfo;->stat:Ljava/lang/String;

    iput-wide p1, p0, Lcn/kuaipan/android/kss/upload/UploadChunkInfo;->next_pos:J

    iput-wide p3, p0, Lcn/kuaipan/android/kss/upload/UploadChunkInfo;->left_bytes:J

    iput-object p5, p0, Lcn/kuaipan/android/kss/upload/UploadChunkInfo;->upload_id:Ljava/lang/String;

    const/4 p1, 0x0

    iput-object p1, p0, Lcn/kuaipan/android/kss/upload/UploadChunkInfo;->commit_meta:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/util/Map;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "stat"

    invoke-static {p1, v0}, Lcn/kuaipan/android/utils/ApiDataHelper;->asString(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcn/kuaipan/android/kss/upload/UploadChunkInfo;->stat:Ljava/lang/String;

    const-string v0, "next_pos"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    const/4 v1, -0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v2}, Lcn/kuaipan/android/utils/ApiDataHelper;->asNumber(Ljava/lang/Object;Ljava/lang/Number;)Ljava/lang/Number;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Number;->longValue()J

    move-result-wide v2

    iput-wide v2, p0, Lcn/kuaipan/android/kss/upload/UploadChunkInfo;->next_pos:J

    const-string v0, "left_bytes"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v0, v1}, Lcn/kuaipan/android/utils/ApiDataHelper;->asNumber(Ljava/lang/Object;Ljava/lang/Number;)Ljava/lang/Number;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    iput-wide v0, p0, Lcn/kuaipan/android/kss/upload/UploadChunkInfo;->left_bytes:J

    const-string v0, "upload_id"

    invoke-static {p1, v0}, Lcn/kuaipan/android/utils/ApiDataHelper;->asString(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcn/kuaipan/android/kss/upload/UploadChunkInfo;->upload_id:Ljava/lang/String;

    const-string v0, "commit_meta"

    invoke-static {p1, v0}, Lcn/kuaipan/android/utils/ApiDataHelper;->asString(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcn/kuaipan/android/kss/upload/UploadChunkInfo;->commit_meta:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public canRetry()Z
    .locals 2

    iget-object v0, p0, Lcn/kuaipan/android/kss/upload/UploadChunkInfo;->stat:Ljava/lang/String;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcn/kuaipan/android/kss/upload/UploadChunkInfo;->stat:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v0

    :goto_0
    sget-object v1, Lcn/kuaipan/android/kss/upload/UploadChunkInfo;->sReTrySet:Ljava/util/HashSet;

    invoke-virtual {v1, v0}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isComplete()Z
    .locals 2

    const-string v0, "BLOCK_COMPLETED"

    iget-object v1, p0, Lcn/kuaipan/android/kss/upload/UploadChunkInfo;->stat:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isContinue()Z
    .locals 2

    const-string v0, "CONTINUE_UPLOAD"

    iget-object v1, p0, Lcn/kuaipan/android/kss/upload/UploadChunkInfo;->stat:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public needBlockRetry()Z
    .locals 2

    const-string v0, "ERR_BLOCK_CORRUPTED"

    iget-object v1, p0, Lcn/kuaipan/android/kss/upload/UploadChunkInfo;->stat:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method
