.class Lcom/miui/gallery/share/AlbumShareOperations$12$1;
.super Ljava/lang/Object;
.source "AlbumShareOperations.java"

# interfaces
.implements Lcom/miui/gallery/util/GalleryUtils$ConcatConverter;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/share/AlbumShareOperations$12;->call()Lcom/miui/gallery/share/AsyncResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/util/GalleryUtils$ConcatConverter<",
        "Lcom/miui/gallery/share/UserInfo;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/share/AlbumShareOperations$12;


# direct methods
.method constructor <init>(Lcom/miui/gallery/share/AlbumShareOperations$12;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/share/AlbumShareOperations$12$1;->this$0:Lcom/miui/gallery/share/AlbumShareOperations$12;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public convertToString(Lcom/miui/gallery/share/UserInfo;)Ljava/lang/String;
    .locals 0

    invoke-virtual {p1}, Lcom/miui/gallery/share/UserInfo;->getUserId()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic convertToString(Ljava/lang/Object;)Ljava/lang/String;
    .locals 0

    check-cast p1, Lcom/miui/gallery/share/UserInfo;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/share/AlbumShareOperations$12$1;->convertToString(Lcom/miui/gallery/share/UserInfo;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method
