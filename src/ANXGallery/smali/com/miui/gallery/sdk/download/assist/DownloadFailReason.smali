.class public Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;
.super Ljava/lang/Object;
.source "DownloadFailReason.java"


# instance fields
.field private final mCause:Ljava/lang/Throwable;

.field private final mCode:Lcom/miui/gallery/error/core/ErrorCode;

.field private final mDesc:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/error/core/ErrorCode;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;->mCode:Lcom/miui/gallery/error/core/ErrorCode;

    iput-object p2, p0, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;->mDesc:Ljava/lang/String;

    iput-object p3, p0, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;->mCause:Ljava/lang/Throwable;

    return-void
.end method


# virtual methods
.method public getCause()Ljava/lang/Throwable;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;->mCause:Ljava/lang/Throwable;

    return-object v0
.end method

.method public getCode()Lcom/miui/gallery/error/core/ErrorCode;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;->mCode:Lcom/miui/gallery/error/core/ErrorCode;

    return-object v0
.end method

.method public getDesc()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;->mDesc:Ljava/lang/String;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "code: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;->mCode:Lcom/miui/gallery/error/core/ErrorCode;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " desc: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;->mDesc:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " cause: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;->mCause:Ljava/lang/Throwable;

    invoke-static {v1}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
