.class Lcom/miui/gallery/share/ShareAlbumBaseActivity$2;
.super Ljava/lang/Object;
.source "ShareAlbumBaseActivity.java"

# interfaces
.implements Lcom/miui/gallery/share/DBCache$OnDBCacheChangedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/share/ShareAlbumBaseActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/share/DBCache$OnDBCacheChangedListener<",
        "Ljava/lang/String;",
        "Ljava/util/List<",
        "Lcom/miui/gallery/share/CloudUserCacheEntry;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/share/ShareAlbumBaseActivity;


# direct methods
.method constructor <init>(Lcom/miui/gallery/share/ShareAlbumBaseActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/share/ShareAlbumBaseActivity$2;->this$0:Lcom/miui/gallery/share/ShareAlbumBaseActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDBCacheChanged(Lcom/miui/gallery/share/DBCache;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/share/DBCache<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/miui/gallery/share/CloudUserCacheEntry;",
            ">;>;)V"
        }
    .end annotation

    iget-object p1, p0, Lcom/miui/gallery/share/ShareAlbumBaseActivity$2;->this$0:Lcom/miui/gallery/share/ShareAlbumBaseActivity;

    invoke-virtual {p1}, Lcom/miui/gallery/share/ShareAlbumBaseActivity;->updateSharers()V

    return-void
.end method
