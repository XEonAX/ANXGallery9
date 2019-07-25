.class public final synthetic Lcom/miui/gallery/movie/ui/adapter/-$$Lambda$BaseResourceAdapter$BaseResourceHolder$YofyEWqdkEzxPr3Rg5Ni13NdhuY;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic f$0:Lcom/miui/gallery/movie/entity/MovieResource;


# direct methods
.method public synthetic constructor <init>(Lcom/miui/gallery/movie/entity/MovieResource;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/movie/ui/adapter/-$$Lambda$BaseResourceAdapter$BaseResourceHolder$YofyEWqdkEzxPr3Rg5Ni13NdhuY;->f$0:Lcom/miui/gallery/movie/entity/MovieResource;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/adapter/-$$Lambda$BaseResourceAdapter$BaseResourceHolder$YofyEWqdkEzxPr3Rg5Ni13NdhuY;->f$0:Lcom/miui/gallery/movie/entity/MovieResource;

    invoke-static {v0}, Lcom/miui/gallery/movie/ui/adapter/BaseResourceAdapter$BaseResourceHolder;->lambda$bindView$131(Lcom/miui/gallery/movie/entity/MovieResource;)V

    return-void
.end method
