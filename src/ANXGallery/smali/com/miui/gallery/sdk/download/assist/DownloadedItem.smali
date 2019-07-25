.class public Lcom/miui/gallery/sdk/download/assist/DownloadedItem;
.super Ljava/lang/Object;
.source "DownloadedItem.java"


# instance fields
.field private mFileCipher:[B

.field private mFilePath:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;[B)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/sdk/download/assist/DownloadedItem;->mFilePath:Ljava/lang/String;

    iput-object p2, p0, Lcom/miui/gallery/sdk/download/assist/DownloadedItem;->mFileCipher:[B

    return-void
.end method


# virtual methods
.method public getFileCipher()[B
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/sdk/download/assist/DownloadedItem;->mFileCipher:[B

    return-object v0
.end method

.method public getFilePath()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/sdk/download/assist/DownloadedItem;->mFilePath:Ljava/lang/String;

    return-object v0
.end method
