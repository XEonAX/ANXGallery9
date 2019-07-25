.class Lcom/miui/gallery/cloudcontrol/strategies/UploadSupportedFileTypeStrategy$FileType;
.super Ljava/lang/Object;
.source "UploadSupportedFileTypeStrategy.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/cloudcontrol/strategies/UploadSupportedFileTypeStrategy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "FileType"
.end annotation


# instance fields
.field public extension:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "extension"
    .end annotation
.end field

.field public mimeType:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "mime-type"
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/cloudcontrol/strategies/UploadSupportedFileTypeStrategy$FileType;->extension:Ljava/lang/String;

    iput-object p2, p0, Lcom/miui/gallery/cloudcontrol/strategies/UploadSupportedFileTypeStrategy$FileType;->mimeType:Ljava/lang/String;

    return-void
.end method
