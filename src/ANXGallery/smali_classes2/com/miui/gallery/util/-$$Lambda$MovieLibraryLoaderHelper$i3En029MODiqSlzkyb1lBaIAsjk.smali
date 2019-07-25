.class public final synthetic Lcom/miui/gallery/util/-$$Lambda$MovieLibraryLoaderHelper$i3En029MODiqSlzkyb1lBaIAsjk;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lio/reactivex/functions/Consumer;


# instance fields
.field private final synthetic f$0:Lcom/miui/gallery/util/MovieLibraryLoaderHelper;

.field private final synthetic f$1:Z


# direct methods
.method public synthetic constructor <init>(Lcom/miui/gallery/util/MovieLibraryLoaderHelper;Z)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/util/-$$Lambda$MovieLibraryLoaderHelper$i3En029MODiqSlzkyb1lBaIAsjk;->f$0:Lcom/miui/gallery/util/MovieLibraryLoaderHelper;

    iput-boolean p2, p0, Lcom/miui/gallery/util/-$$Lambda$MovieLibraryLoaderHelper$i3En029MODiqSlzkyb1lBaIAsjk;->f$1:Z

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/util/-$$Lambda$MovieLibraryLoaderHelper$i3En029MODiqSlzkyb1lBaIAsjk;->f$0:Lcom/miui/gallery/util/MovieLibraryLoaderHelper;

    iget-boolean v1, p0, Lcom/miui/gallery/util/-$$Lambda$MovieLibraryLoaderHelper$i3En029MODiqSlzkyb1lBaIAsjk;->f$1:Z

    check-cast p1, Lcom/miui/gallery/util/OptionalResult;

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/MovieLibraryLoaderHelper;->lambda$startDownloadWithCheckLibrary$12(Lcom/miui/gallery/util/MovieLibraryLoaderHelper;ZLcom/miui/gallery/util/OptionalResult;)V

    return-void
.end method
