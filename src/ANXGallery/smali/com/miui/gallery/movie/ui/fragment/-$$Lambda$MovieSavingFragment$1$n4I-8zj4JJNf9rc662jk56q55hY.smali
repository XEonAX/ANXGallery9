.class public final synthetic Lcom/miui/gallery/movie/ui/fragment/-$$Lambda$MovieSavingFragment$1$n4I-8zj4JJNf9rc662jk56q55hY;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lcom/miui/gallery/threadpool/ThreadPool$Job;


# instance fields
.field private final synthetic f$0:Ljava/lang/String;

.field private final synthetic f$1:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/-$$Lambda$MovieSavingFragment$1$n4I-8zj4JJNf9rc662jk56q55hY;->f$0:Ljava/lang/String;

    iput-object p2, p0, Lcom/miui/gallery/movie/ui/fragment/-$$Lambda$MovieSavingFragment$1$n4I-8zj4JJNf9rc662jk56q55hY;->f$1:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Object;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/-$$Lambda$MovieSavingFragment$1$n4I-8zj4JJNf9rc662jk56q55hY;->f$0:Ljava/lang/String;

    iget-object v1, p0, Lcom/miui/gallery/movie/ui/fragment/-$$Lambda$MovieSavingFragment$1$n4I-8zj4JJNf9rc662jk56q55hY;->f$1:Landroid/content/Context;

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment$1;->lambda$onEncodeEnd$137(Ljava/lang/String;Landroid/content/Context;Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method
