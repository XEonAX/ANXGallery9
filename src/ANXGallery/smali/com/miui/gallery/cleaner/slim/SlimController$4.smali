.class Lcom/miui/gallery/cleaner/slim/SlimController$4;
.super Ljava/lang/Object;
.source "SlimController.java"

# interfaces
.implements Lcom/miui/gallery/util/SafeDBUtil$QueryHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/cleaner/slim/SlimController;->queryMediaItem([J)Ljava/util/LinkedList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/util/SafeDBUtil$QueryHandler<",
        "Ljava/util/LinkedList<",
        "Lcom/miui/gallery/cleaner/slim/SlimController$MediaItem;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/cleaner/slim/SlimController;


# direct methods
.method constructor <init>(Lcom/miui/gallery/cleaner/slim/SlimController;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/cleaner/slim/SlimController$4;->this$0:Lcom/miui/gallery/cleaner/slim/SlimController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic handle(Landroid/database/Cursor;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/cleaner/slim/SlimController$4;->handle(Landroid/database/Cursor;)Ljava/util/LinkedList;

    move-result-object p1

    return-object p1
.end method

.method public handle(Landroid/database/Cursor;)Ljava/util/LinkedList;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/Cursor;",
            ")",
            "Ljava/util/LinkedList<",
            "Lcom/miui/gallery/cleaner/slim/SlimController$MediaItem;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    if-eqz p1, :cond_1

    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    invoke-static {p1}, Lcom/miui/gallery/cleaner/slim/SlimController$MediaItem;->cursorToEntity(Landroid/database/Cursor;)Lcom/miui/gallery/cleaner/slim/SlimController$MediaItem;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-nez v1, :cond_0

    :cond_1
    return-object v0
.end method
