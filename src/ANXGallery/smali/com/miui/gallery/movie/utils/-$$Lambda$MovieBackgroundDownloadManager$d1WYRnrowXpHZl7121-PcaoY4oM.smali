.class public final synthetic Lcom/miui/gallery/movie/utils/-$$Lambda$MovieBackgroundDownloadManager$d1WYRnrowXpHZl7121-PcaoY4oM;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lio/reactivex/functions/Consumer;


# static fields
.field public static final synthetic INSTANCE:Lcom/miui/gallery/movie/utils/-$$Lambda$MovieBackgroundDownloadManager$d1WYRnrowXpHZl7121-PcaoY4oM;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/miui/gallery/movie/utils/-$$Lambda$MovieBackgroundDownloadManager$d1WYRnrowXpHZl7121-PcaoY4oM;

    invoke-direct {v0}, Lcom/miui/gallery/movie/utils/-$$Lambda$MovieBackgroundDownloadManager$d1WYRnrowXpHZl7121-PcaoY4oM;-><init>()V

    sput-object v0, Lcom/miui/gallery/movie/utils/-$$Lambda$MovieBackgroundDownloadManager$d1WYRnrowXpHZl7121-PcaoY4oM;->INSTANCE:Lcom/miui/gallery/movie/utils/-$$Lambda$MovieBackgroundDownloadManager$d1WYRnrowXpHZl7121-PcaoY4oM;

    return-void
.end method

.method private synthetic constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Lcom/miui/gallery/movie/entity/TemplateResource;

    invoke-static {p1}, Lcom/miui/gallery/movie/utils/MovieBackgroundDownloadManager;->lambda$downloadTemplate$116(Lcom/miui/gallery/movie/entity/TemplateResource;)V

    return-void
.end method
