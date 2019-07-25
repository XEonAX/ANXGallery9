.class Lcom/miui/gallery/data/LocationManager$3;
.super Ljava/lang/Object;
.source "LocationManager.java"

# interfaces
.implements Lcom/miui/gallery/util/SafeDBUtil$QueryHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/data/LocationManager;->loadLocation(J)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/util/SafeDBUtil$QueryHandler<",
        "Lcom/miui/gallery/data/LocationManager$CloudItem;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/data/LocationManager;


# direct methods
.method constructor <init>(Lcom/miui/gallery/data/LocationManager;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/data/LocationManager$3;->this$0:Lcom/miui/gallery/data/LocationManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handle(Landroid/database/Cursor;)Lcom/miui/gallery/data/LocationManager$CloudItem;
    .locals 1

    if-eqz p1, :cond_0

    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/data/LocationManager$3;->this$0:Lcom/miui/gallery/data/LocationManager;

    invoke-static {v0, p1}, Lcom/miui/gallery/data/LocationManager;->access$100(Lcom/miui/gallery/data/LocationManager;Landroid/database/Cursor;)Lcom/miui/gallery/data/LocationManager$CloudItem;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public bridge synthetic handle(Landroid/database/Cursor;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/data/LocationManager$3;->handle(Landroid/database/Cursor;)Lcom/miui/gallery/data/LocationManager$CloudItem;

    move-result-object p1

    return-object p1
.end method
