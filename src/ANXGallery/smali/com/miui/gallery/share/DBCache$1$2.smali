.class Lcom/miui/gallery/share/DBCache$1$2;
.super Ljava/lang/Object;
.source "DBCache.java"

# interfaces
.implements Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/share/DBCache$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener<",
        "Ljava/lang/Void;",
        "Ljava/util/Map<",
        "TK;TV;>;>;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/share/DBCache$1;


# direct methods
.method constructor <init>(Lcom/miui/gallery/share/DBCache$1;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/share/DBCache$1$2;->this$1:Lcom/miui/gallery/share/DBCache$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onCompletion(Ljava/lang/Object;Ljava/lang/Object;IZ)V
    .locals 0

    check-cast p1, Ljava/lang/Void;

    check-cast p2, Ljava/util/Map;

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/miui/gallery/share/DBCache$1$2;->onCompletion(Ljava/lang/Void;Ljava/util/Map;IZ)V

    return-void
.end method

.method public onCompletion(Ljava/lang/Void;Ljava/util/Map;IZ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Void;",
            "Ljava/util/Map<",
            "TK;TV;>;IZ)V"
        }
    .end annotation

    if-nez p3, :cond_0

    if-eqz p2, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/share/DBCache$1$2;->this$1:Lcom/miui/gallery/share/DBCache$1;

    iget-object p1, p1, Lcom/miui/gallery/share/DBCache$1;->this$0:Lcom/miui/gallery/share/DBCache;

    invoke-static {p1, p2}, Lcom/miui/gallery/share/DBCache;->access$000(Lcom/miui/gallery/share/DBCache;Ljava/util/Map;)V

    iget-object p1, p0, Lcom/miui/gallery/share/DBCache$1$2;->this$1:Lcom/miui/gallery/share/DBCache$1;

    iget-object p1, p1, Lcom/miui/gallery/share/DBCache$1;->this$0:Lcom/miui/gallery/share/DBCache;

    const/4 p2, 0x0

    invoke-static {p1, p2}, Lcom/miui/gallery/share/DBCache;->access$100(Lcom/miui/gallery/share/DBCache;Z)Z

    :cond_0
    return-void
.end method
