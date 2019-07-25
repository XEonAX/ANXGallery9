.class public final synthetic Lcom/miui/gallery/movie/ui/fragment/-$$Lambda$MovieEditorMenuFragment$6M79r08JTv7KvVYHxb6hD52fUXg;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic f$0:Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;

.field private final synthetic f$1:Lcom/miui/gallery/movie/entity/MovieResource;


# direct methods
.method public synthetic constructor <init>(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;Lcom/miui/gallery/movie/entity/MovieResource;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/-$$Lambda$MovieEditorMenuFragment$6M79r08JTv7KvVYHxb6hD52fUXg;->f$0:Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;

    iput-object p2, p0, Lcom/miui/gallery/movie/ui/fragment/-$$Lambda$MovieEditorMenuFragment$6M79r08JTv7KvVYHxb6hD52fUXg;->f$1:Lcom/miui/gallery/movie/entity/MovieResource;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/-$$Lambda$MovieEditorMenuFragment$6M79r08JTv7KvVYHxb6hD52fUXg;->f$0:Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;

    iget-object v1, p0, Lcom/miui/gallery/movie/ui/fragment/-$$Lambda$MovieEditorMenuFragment$6M79r08JTv7KvVYHxb6hD52fUXg;->f$1:Lcom/miui/gallery/movie/entity/MovieResource;

    invoke-static {v0, v1}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->lambda$notifyResourceAdapter$130(Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;Lcom/miui/gallery/movie/entity/MovieResource;)V

    return-void
.end method
