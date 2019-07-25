.class Lcom/xiaomi/mistatistic/sdk/controller/o$2;
.super Ljava/lang/Object;
.source "RemoteDataUploadManager.java"

# interfaces
.implements Lcom/xiaomi/mistatistic/sdk/controller/asyncjobs/c$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xiaomi/mistatistic/sdk/controller/o;->a(Ljava/lang/String;JJIZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:J

.field final synthetic b:J

.field final synthetic c:Lcom/xiaomi/mistatistic/sdk/controller/o;


# direct methods
.method constructor <init>(Lcom/xiaomi/mistatistic/sdk/controller/o;JJ)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/mistatistic/sdk/controller/o$2;->c:Lcom/xiaomi/mistatistic/sdk/controller/o;

    iput-wide p2, p0, Lcom/xiaomi/mistatistic/sdk/controller/o$2;->a:J

    iput-wide p4, p0, Lcom/xiaomi/mistatistic/sdk/controller/o$2;->b:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(ZLjava/lang/String;Z)V
    .locals 7

    if-eqz p1, :cond_0

    const-string p1, "u"

    invoke-static {p1, p2}, Lcom/xiaomi/mistatistic/sdk/controller/n;->a(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/xiaomi/mistatistic/sdk/controller/o$2;->c:Lcom/xiaomi/mistatistic/sdk/controller/o;

    iget-wide v1, p0, Lcom/xiaomi/mistatistic/sdk/controller/o$2;->a:J

    iget-wide v3, p0, Lcom/xiaomi/mistatistic/sdk/controller/o$2;->b:J

    move-object v5, p2

    move v6, p3

    invoke-static/range {v0 .. v6}, Lcom/xiaomi/mistatistic/sdk/controller/o;->a(Lcom/xiaomi/mistatistic/sdk/controller/o;JJLjava/lang/String;Z)V

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/xiaomi/mistatistic/sdk/controller/o;->c()Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    const-string p1, "RDUM"

    const-string p3, "upload failed, set Uploading %b"

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    invoke-static {}, Lcom/xiaomi/mistatistic/sdk/controller/o;->c()Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    aput-object v1, v0, p2

    invoke-static {p3, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/xiaomi/mistatistic/sdk/controller/j;->a(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method
