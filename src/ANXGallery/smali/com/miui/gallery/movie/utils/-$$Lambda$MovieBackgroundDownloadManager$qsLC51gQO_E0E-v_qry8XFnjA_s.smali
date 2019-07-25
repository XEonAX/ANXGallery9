.class public final synthetic Lcom/miui/gallery/movie/utils/-$$Lambda$MovieBackgroundDownloadManager$qsLC51gQO_E0E-v_qry8XFnjA_s;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lio/reactivex/functions/Function;


# instance fields
.field private final synthetic f$0:Lcom/miui/gallery/movie/utils/MovieBackgroundDownloadManager;


# direct methods
.method public synthetic constructor <init>(Lcom/miui/gallery/movie/utils/MovieBackgroundDownloadManager;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/movie/utils/-$$Lambda$MovieBackgroundDownloadManager$qsLC51gQO_E0E-v_qry8XFnjA_s;->f$0:Lcom/miui/gallery/movie/utils/MovieBackgroundDownloadManager;

    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/movie/utils/-$$Lambda$MovieBackgroundDownloadManager$qsLC51gQO_E0E-v_qry8XFnjA_s;->f$0:Lcom/miui/gallery/movie/utils/MovieBackgroundDownloadManager;

    check-cast p1, Ljava/lang/String;

    invoke-static {v0, p1}, Lcom/miui/gallery/movie/utils/MovieBackgroundDownloadManager;->lambda$downloadTemplate$114(Lcom/miui/gallery/movie/utils/MovieBackgroundDownloadManager;Ljava/lang/String;)Lcom/miui/gallery/movie/entity/TemplateResource;

    move-result-object p1

    return-object p1
.end method
