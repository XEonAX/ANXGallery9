.class Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ParseFileMetaValue;
.super Ljava/lang/Object;
.source "StoryAlbumFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ParseFileMetaValue"
.end annotation


# instance fields
.field downloadUri:Landroid/net/Uri;

.field originFilePath:Ljava/lang/String;

.field position:I

.field final synthetic this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

.field thumnailFilePath:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;Landroid/database/Cursor;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ParseFileMetaValue;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p2, :cond_0

    invoke-interface {p2}, Landroid/database/Cursor;->getPosition()I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ParseFileMetaValue;->position:I

    const/4 p1, 0x2

    invoke-interface {p2, p1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ParseFileMetaValue;->thumnailFilePath:Ljava/lang/String;

    const/4 p1, 0x3

    invoke-interface {p2, p1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ParseFileMetaValue;->originFilePath:Ljava/lang/String;

    const/4 p1, 0x0

    invoke-interface {p2, p1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide p1

    invoke-static {p1, p2}, Lcom/miui/gallery/util/uil/CloudUriAdapter;->getDownloadUri(J)Landroid/net/Uri;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ParseFileMetaValue;->downloadUri:Landroid/net/Uri;

    :cond_0
    return-void
.end method
