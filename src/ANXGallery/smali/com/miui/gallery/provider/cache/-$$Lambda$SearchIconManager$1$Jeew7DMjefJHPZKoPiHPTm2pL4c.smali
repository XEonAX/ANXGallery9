.class public final synthetic Lcom/miui/gallery/provider/cache/-$$Lambda$SearchIconManager$1$Jeew7DMjefJHPZKoPiHPTm2pL4c;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lcom/miui/gallery/threadpool/ThreadPool$Job;


# instance fields
.field private final synthetic f$0:Lcom/miui/gallery/provider/cache/SearchIconManager$1;


# direct methods
.method public synthetic constructor <init>(Lcom/miui/gallery/provider/cache/SearchIconManager$1;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/provider/cache/-$$Lambda$SearchIconManager$1$Jeew7DMjefJHPZKoPiHPTm2pL4c;->f$0:Lcom/miui/gallery/provider/cache/SearchIconManager$1;

    return-void
.end method


# virtual methods
.method public final run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/-$$Lambda$SearchIconManager$1$Jeew7DMjefJHPZKoPiHPTm2pL4c;->f$0:Lcom/miui/gallery/provider/cache/SearchIconManager$1;

    invoke-static {v0, p1}, Lcom/miui/gallery/provider/cache/SearchIconManager$1;->lambda$onChange$18(Lcom/miui/gallery/provider/cache/SearchIconManager$1;Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method
