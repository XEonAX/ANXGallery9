.class Lcom/miui/gallery/search/SearchStatusLoader$1;
.super Landroid/database/ContentObserver;
.source "SearchStatusLoader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/search/SearchStatusLoader;->onStartLoading()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/search/SearchStatusLoader;


# direct methods
.method constructor <init>(Lcom/miui/gallery/search/SearchStatusLoader;Landroid/os/Handler;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/search/SearchStatusLoader$1;->this$0:Lcom/miui/gallery/search/SearchStatusLoader;

    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    return-void
.end method


# virtual methods
.method public onChange(Z)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/search/SearchStatusLoader$1;->this$0:Lcom/miui/gallery/search/SearchStatusLoader;

    invoke-virtual {p1}, Lcom/miui/gallery/search/SearchStatusLoader;->onContentChanged()V

    return-void
.end method
