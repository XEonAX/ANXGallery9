.class Lcom/miui/gallery/share/DBCache$2;
.super Landroid/database/ContentObserver;
.source "DBCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/share/DBCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/share/DBCache;


# direct methods
.method constructor <init>(Lcom/miui/gallery/share/DBCache;Landroid/os/Handler;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/share/DBCache$2;->this$0:Lcom/miui/gallery/share/DBCache;

    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    return-void
.end method


# virtual methods
.method public onChange(Z)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/share/DBCache$2;->this$0:Lcom/miui/gallery/share/DBCache;

    const/4 v0, 0x1

    invoke-static {p1, v0}, Lcom/miui/gallery/share/DBCache;->access$202(Lcom/miui/gallery/share/DBCache;Z)Z

    iget-object p1, p0, Lcom/miui/gallery/share/DBCache$2;->this$0:Lcom/miui/gallery/share/DBCache;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/miui/gallery/share/DBCache;->access$100(Lcom/miui/gallery/share/DBCache;Z)Z

    return-void
.end method
