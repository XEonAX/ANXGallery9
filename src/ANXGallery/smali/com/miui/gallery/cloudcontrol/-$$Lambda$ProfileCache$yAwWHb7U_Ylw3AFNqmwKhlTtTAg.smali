.class public final synthetic Lcom/miui/gallery/cloudcontrol/-$$Lambda$ProfileCache$yAwWHb7U_Ylw3AFNqmwKhlTtTAg;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lio/reactivex/functions/Predicate;


# instance fields
.field private final synthetic f$0:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/cloudcontrol/-$$Lambda$ProfileCache$yAwWHb7U_Ylw3AFNqmwKhlTtTAg;->f$0:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final test(Ljava/lang/Object;)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/cloudcontrol/-$$Lambda$ProfileCache$yAwWHb7U_Ylw3AFNqmwKhlTtTAg;->f$0:Ljava/lang/String;

    check-cast p1, Ljava/lang/String;

    invoke-static {v0, p1}, Lcom/miui/gallery/cloudcontrol/ProfileCache;->lambda$registerStrategyObserver$1(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p1

    return p1
.end method
