.class public Lcom/xiaomi/mipush/sdk/stat/db/MessageDeleteJob;
.super Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$DeleteJob;
.source "MessageDeleteJob.java"


# instance fields
.field protected mDescription:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$DeleteJob;-><init>(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    const-string p1, "MessageDeleteJob"

    iput-object p1, p0, Lcom/xiaomi/mipush/sdk/stat/db/MessageDeleteJob;->mDescription:Ljava/lang/String;

    iput-object p4, p0, Lcom/xiaomi/mipush/sdk/stat/db/MessageDeleteJob;->mDescription:Ljava/lang/String;

    return-void
.end method

.method public static deleteUploadedJob(Ljava/lang/String;)Lcom/xiaomi/mipush/sdk/stat/db/MessageDeleteJob;
    .locals 4

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "status = ?"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    new-instance v2, Lcom/xiaomi/mipush/sdk/stat/db/MessageDeleteJob;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v3, "a job build to delete uploaded job"

    invoke-direct {v2, p0, v0, v1, v3}, Lcom/xiaomi/mipush/sdk/stat/db/MessageDeleteJob;-><init>(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    return-object v2
.end method
