.class public final synthetic Lcom/miui/gallery/movie/utils/-$$Lambda$MovieBackgroundDownloadManager$KLrQYZSJxvxhuGVp6lqQt-EHBYY;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lio/reactivex/functions/Predicate;


# static fields
.field public static final synthetic INSTANCE:Lcom/miui/gallery/movie/utils/-$$Lambda$MovieBackgroundDownloadManager$KLrQYZSJxvxhuGVp6lqQt-EHBYY;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/miui/gallery/movie/utils/-$$Lambda$MovieBackgroundDownloadManager$KLrQYZSJxvxhuGVp6lqQt-EHBYY;

    invoke-direct {v0}, Lcom/miui/gallery/movie/utils/-$$Lambda$MovieBackgroundDownloadManager$KLrQYZSJxvxhuGVp6lqQt-EHBYY;-><init>()V

    sput-object v0, Lcom/miui/gallery/movie/utils/-$$Lambda$MovieBackgroundDownloadManager$KLrQYZSJxvxhuGVp6lqQt-EHBYY;->INSTANCE:Lcom/miui/gallery/movie/utils/-$$Lambda$MovieBackgroundDownloadManager$KLrQYZSJxvxhuGVp6lqQt-EHBYY;

    return-void
.end method

.method private synthetic constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final test(Ljava/lang/Object;)Z
    .locals 0

    check-cast p1, Lcom/miui/gallery/movie/entity/TemplateResource;

    invoke-static {p1}, Lcom/miui/gallery/movie/utils/MovieBackgroundDownloadManager;->lambda$downloadTemplate$115(Lcom/miui/gallery/movie/entity/TemplateResource;)Z

    move-result p1

    return p1
.end method
