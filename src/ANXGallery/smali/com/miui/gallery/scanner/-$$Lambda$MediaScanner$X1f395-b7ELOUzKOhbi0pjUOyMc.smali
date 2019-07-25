.class public final synthetic Lcom/miui/gallery/scanner/-$$Lambda$MediaScanner$X1f395-b7ELOUzKOhbi0pjUOyMc;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lcom/miui/gallery/util/SafeDBUtil$QueryHandler;


# instance fields
.field private final synthetic f$0:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ljava/util/List;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/scanner/-$$Lambda$MediaScanner$X1f395-b7ELOUzKOhbi0pjUOyMc;->f$0:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final handle(Landroid/database/Cursor;)Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/scanner/-$$Lambda$MediaScanner$X1f395-b7ELOUzKOhbi0pjUOyMc;->f$0:Ljava/util/List;

    invoke-static {v0, p1}, Lcom/miui/gallery/scanner/MediaScanner;->lambda$refreshIgnoreList$36(Ljava/util/List;Landroid/database/Cursor;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method
