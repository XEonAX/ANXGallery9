.class public final synthetic Lcom/miui/gallery/cloudcontrol/-$$Lambda$ProfileCache$1Q724HrxhEehynTQNZoEMTMnfGc;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lio/reactivex/functions/Function;


# instance fields
.field private final synthetic f$0:Lcom/miui/gallery/cloudcontrol/ProfileCache;

.field private final synthetic f$1:Ljava/lang/Class;

.field private final synthetic f$2:Lcom/miui/gallery/cloudcontrol/Merger;


# direct methods
.method public synthetic constructor <init>(Lcom/miui/gallery/cloudcontrol/ProfileCache;Ljava/lang/Class;Lcom/miui/gallery/cloudcontrol/Merger;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/cloudcontrol/-$$Lambda$ProfileCache$1Q724HrxhEehynTQNZoEMTMnfGc;->f$0:Lcom/miui/gallery/cloudcontrol/ProfileCache;

    iput-object p2, p0, Lcom/miui/gallery/cloudcontrol/-$$Lambda$ProfileCache$1Q724HrxhEehynTQNZoEMTMnfGc;->f$1:Ljava/lang/Class;

    iput-object p3, p0, Lcom/miui/gallery/cloudcontrol/-$$Lambda$ProfileCache$1Q724HrxhEehynTQNZoEMTMnfGc;->f$2:Lcom/miui/gallery/cloudcontrol/Merger;

    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/cloudcontrol/-$$Lambda$ProfileCache$1Q724HrxhEehynTQNZoEMTMnfGc;->f$0:Lcom/miui/gallery/cloudcontrol/ProfileCache;

    iget-object v1, p0, Lcom/miui/gallery/cloudcontrol/-$$Lambda$ProfileCache$1Q724HrxhEehynTQNZoEMTMnfGc;->f$1:Ljava/lang/Class;

    iget-object v2, p0, Lcom/miui/gallery/cloudcontrol/-$$Lambda$ProfileCache$1Q724HrxhEehynTQNZoEMTMnfGc;->f$2:Lcom/miui/gallery/cloudcontrol/Merger;

    check-cast p1, Ljava/lang/String;

    invoke-static {v0, v1, v2, p1}, Lcom/miui/gallery/cloudcontrol/ProfileCache;->lambda$registerStrategyObserver$2(Lcom/miui/gallery/cloudcontrol/ProfileCache;Ljava/lang/Class;Lcom/miui/gallery/cloudcontrol/Merger;Ljava/lang/String;)Landroid/support/v4/util/Pair;

    move-result-object p1

    return-object p1
.end method
