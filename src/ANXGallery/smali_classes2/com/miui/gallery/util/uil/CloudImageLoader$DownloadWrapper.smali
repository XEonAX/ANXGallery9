.class Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;
.super Ljava/lang/Object;
.source "CloudImageLoader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/util/uil/CloudImageLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DownloadWrapper"
.end annotation


# instance fields
.field private final curSize:J

.field private final downloadedItem:Lcom/miui/gallery/sdk/download/assist/DownloadedItem;

.field private final failReason:Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;

.field final synthetic this$0:Lcom/miui/gallery/util/uil/CloudImageLoader;

.field private final totalSize:J

.field private final type:Lcom/miui/gallery/sdk/download/DownloadType;

.field private final uri:Landroid/net/Uri;


# direct methods
.method constructor <init>(Lcom/miui/gallery/util/uil/CloudImageLoader;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)V
    .locals 10

    const/4 v4, 0x0

    const/4 v5, 0x0

    const-wide/16 v6, 0x0

    const-wide/16 v8, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    invoke-direct/range {v0 .. v9}, Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;-><init>(Lcom/miui/gallery/util/uil/CloudImageLoader;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/miui/gallery/sdk/download/assist/DownloadedItem;Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;JJ)V

    return-void
.end method

.method constructor <init>(Lcom/miui/gallery/util/uil/CloudImageLoader;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;JJ)V
    .locals 10

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-wide v6, p4

    move-wide/from16 v8, p6

    invoke-direct/range {v0 .. v9}, Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;-><init>(Lcom/miui/gallery/util/uil/CloudImageLoader;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/miui/gallery/sdk/download/assist/DownloadedItem;Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;JJ)V

    return-void
.end method

.method constructor <init>(Lcom/miui/gallery/util/uil/CloudImageLoader;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;)V
    .locals 10

    const/4 v4, 0x0

    const-wide/16 v6, 0x0

    const-wide/16 v8, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v9}, Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;-><init>(Lcom/miui/gallery/util/uil/CloudImageLoader;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/miui/gallery/sdk/download/assist/DownloadedItem;Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;JJ)V

    return-void
.end method

.method constructor <init>(Lcom/miui/gallery/util/uil/CloudImageLoader;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/miui/gallery/sdk/download/assist/DownloadedItem;)V
    .locals 10

    const/4 v5, 0x0

    const-wide/16 v6, 0x0

    const-wide/16 v8, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-direct/range {v0 .. v9}, Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;-><init>(Lcom/miui/gallery/util/uil/CloudImageLoader;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/miui/gallery/sdk/download/assist/DownloadedItem;Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;JJ)V

    return-void
.end method

.method constructor <init>(Lcom/miui/gallery/util/uil/CloudImageLoader;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/miui/gallery/sdk/download/assist/DownloadedItem;Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;JJ)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;->this$0:Lcom/miui/gallery/util/uil/CloudImageLoader;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;->uri:Landroid/net/Uri;

    iput-object p3, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;->type:Lcom/miui/gallery/sdk/download/DownloadType;

    iput-object p4, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;->downloadedItem:Lcom/miui/gallery/sdk/download/assist/DownloadedItem;

    iput-object p5, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;->failReason:Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;

    iput-wide p6, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;->curSize:J

    iput-wide p8, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;->totalSize:J

    return-void
.end method

.method static synthetic access$200(Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;)Landroid/net/Uri;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;->uri:Landroid/net/Uri;

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;)Lcom/miui/gallery/sdk/download/DownloadType;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;->type:Lcom/miui/gallery/sdk/download/DownloadType;

    return-object p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;)Lcom/miui/gallery/sdk/download/assist/DownloadedItem;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;->downloadedItem:Lcom/miui/gallery/sdk/download/assist/DownloadedItem;

    return-object p0
.end method

.method static synthetic access$500(Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;)Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;->failReason:Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;

    return-object p0
.end method

.method static synthetic access$600(Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;)J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;->curSize:J

    return-wide v0
.end method

.method static synthetic access$700(Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;)J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;->totalSize:J

    return-wide v0
.end method
