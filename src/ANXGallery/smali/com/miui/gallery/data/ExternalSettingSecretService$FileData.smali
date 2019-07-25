.class final Lcom/miui/gallery/data/ExternalSettingSecretService$FileData;
.super Ljava/lang/Object;
.source "ExternalSettingSecretService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/data/ExternalSettingSecretService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "FileData"
.end annotation


# instance fields
.field final mFileNameInExif:Ljava/lang/String;

.field final mLocalGroupId:I

.field final mSha1:Ljava/lang/String;

.field final mSha1InExif:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/data/ExternalSettingSecretService$FileData;->mSha1:Ljava/lang/String;

    iput-object p2, p0, Lcom/miui/gallery/data/ExternalSettingSecretService$FileData;->mSha1InExif:Ljava/lang/String;

    iput-object p3, p0, Lcom/miui/gallery/data/ExternalSettingSecretService$FileData;->mFileNameInExif:Ljava/lang/String;

    iput p4, p0, Lcom/miui/gallery/data/ExternalSettingSecretService$FileData;->mLocalGroupId:I

    return-void
.end method
