.class public final synthetic Lcom/miui/gallery/movie/ui/fragment/-$$Lambda$MovieEditorMenuFragment$23jZtsJVOf0_yBGkkiGpAr6Yo10;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lio/reactivex/functions/Function;


# static fields
.field public static final synthetic INSTANCE:Lcom/miui/gallery/movie/ui/fragment/-$$Lambda$MovieEditorMenuFragment$23jZtsJVOf0_yBGkkiGpAr6Yo10;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/miui/gallery/movie/ui/fragment/-$$Lambda$MovieEditorMenuFragment$23jZtsJVOf0_yBGkkiGpAr6Yo10;

    invoke-direct {v0}, Lcom/miui/gallery/movie/ui/fragment/-$$Lambda$MovieEditorMenuFragment$23jZtsJVOf0_yBGkkiGpAr6Yo10;-><init>()V

    sput-object v0, Lcom/miui/gallery/movie/ui/fragment/-$$Lambda$MovieEditorMenuFragment$23jZtsJVOf0_yBGkkiGpAr6Yo10;->INSTANCE:Lcom/miui/gallery/movie/ui/fragment/-$$Lambda$MovieEditorMenuFragment$23jZtsJVOf0_yBGkkiGpAr6Yo10;

    return-void
.end method

.method private synthetic constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Lcom/miui/gallery/util/OptionalResult;

    invoke-static {p1}, Lcom/miui/gallery/movie/ui/fragment/MovieEditorMenuFragment;->lambda$loadTemplate$123(Lcom/miui/gallery/util/OptionalResult;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method
