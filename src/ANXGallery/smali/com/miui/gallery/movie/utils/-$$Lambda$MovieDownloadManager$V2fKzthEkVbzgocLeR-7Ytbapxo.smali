.class public final synthetic Lcom/miui/gallery/movie/utils/-$$Lambda$MovieDownloadManager$V2fKzthEkVbzgocLeR-7Ytbapxo;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lio/reactivex/ObservableOnSubscribe;


# instance fields
.field private final synthetic f$0:Lcom/miui/gallery/movie/utils/MovieDownloadManager;

.field private final synthetic f$1:Lcom/miui/gallery/movie/entity/MovieResource;

.field private final synthetic f$2:Z


# direct methods
.method public synthetic constructor <init>(Lcom/miui/gallery/movie/utils/MovieDownloadManager;Lcom/miui/gallery/movie/entity/MovieResource;Z)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/movie/utils/-$$Lambda$MovieDownloadManager$V2fKzthEkVbzgocLeR-7Ytbapxo;->f$0:Lcom/miui/gallery/movie/utils/MovieDownloadManager;

    iput-object p2, p0, Lcom/miui/gallery/movie/utils/-$$Lambda$MovieDownloadManager$V2fKzthEkVbzgocLeR-7Ytbapxo;->f$1:Lcom/miui/gallery/movie/entity/MovieResource;

    iput-boolean p3, p0, Lcom/miui/gallery/movie/utils/-$$Lambda$MovieDownloadManager$V2fKzthEkVbzgocLeR-7Ytbapxo;->f$2:Z

    return-void
.end method


# virtual methods
.method public final subscribe(Lio/reactivex/ObservableEmitter;)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/movie/utils/-$$Lambda$MovieDownloadManager$V2fKzthEkVbzgocLeR-7Ytbapxo;->f$0:Lcom/miui/gallery/movie/utils/MovieDownloadManager;

    iget-object v1, p0, Lcom/miui/gallery/movie/utils/-$$Lambda$MovieDownloadManager$V2fKzthEkVbzgocLeR-7Ytbapxo;->f$1:Lcom/miui/gallery/movie/entity/MovieResource;

    iget-boolean v2, p0, Lcom/miui/gallery/movie/utils/-$$Lambda$MovieDownloadManager$V2fKzthEkVbzgocLeR-7Ytbapxo;->f$2:Z

    invoke-static {v0, v1, v2, p1}, Lcom/miui/gallery/movie/utils/MovieDownloadManager;->lambda$downloadResource$117(Lcom/miui/gallery/movie/utils/MovieDownloadManager;Lcom/miui/gallery/movie/entity/MovieResource;ZLio/reactivex/ObservableEmitter;)V

    return-void
.end method
