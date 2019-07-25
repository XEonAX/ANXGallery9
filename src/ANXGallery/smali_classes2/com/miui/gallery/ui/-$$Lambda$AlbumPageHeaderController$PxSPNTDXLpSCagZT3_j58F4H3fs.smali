.class public final synthetic Lcom/miui/gallery/ui/-$$Lambda$AlbumPageHeaderController$PxSPNTDXLpSCagZT3_j58F4H3fs;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lio/reactivex/functions/Function;


# instance fields
.field private final synthetic f$0:Lcom/miui/gallery/ui/AlbumPageHeaderController;

.field private final synthetic f$1:I


# direct methods
.method public synthetic constructor <init>(Lcom/miui/gallery/ui/AlbumPageHeaderController;I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/ui/-$$Lambda$AlbumPageHeaderController$PxSPNTDXLpSCagZT3_j58F4H3fs;->f$0:Lcom/miui/gallery/ui/AlbumPageHeaderController;

    iput p2, p0, Lcom/miui/gallery/ui/-$$Lambda$AlbumPageHeaderController$PxSPNTDXLpSCagZT3_j58F4H3fs;->f$1:I

    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/-$$Lambda$AlbumPageHeaderController$PxSPNTDXLpSCagZT3_j58F4H3fs;->f$0:Lcom/miui/gallery/ui/AlbumPageHeaderController;

    iget v1, p0, Lcom/miui/gallery/ui/-$$Lambda$AlbumPageHeaderController$PxSPNTDXLpSCagZT3_j58F4H3fs;->f$1:I

    check-cast p1, Ljava/util/ArrayList;

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/ui/AlbumPageHeaderController;->lambda$subscribeSubject$28(Lcom/miui/gallery/ui/AlbumPageHeaderController;ILjava/util/ArrayList;)Lio/reactivex/ObservableSource;

    move-result-object p1

    return-object p1
.end method
