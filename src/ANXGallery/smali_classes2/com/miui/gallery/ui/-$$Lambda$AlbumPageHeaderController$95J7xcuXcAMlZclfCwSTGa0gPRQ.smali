.class public final synthetic Lcom/miui/gallery/ui/-$$Lambda$AlbumPageHeaderController$95J7xcuXcAMlZclfCwSTGa0gPRQ;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lcom/miui/gallery/util/SafeDBUtil$QueryHandler;


# static fields
.field public static final synthetic INSTANCE:Lcom/miui/gallery/ui/-$$Lambda$AlbumPageHeaderController$95J7xcuXcAMlZclfCwSTGa0gPRQ;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/miui/gallery/ui/-$$Lambda$AlbumPageHeaderController$95J7xcuXcAMlZclfCwSTGa0gPRQ;

    invoke-direct {v0}, Lcom/miui/gallery/ui/-$$Lambda$AlbumPageHeaderController$95J7xcuXcAMlZclfCwSTGa0gPRQ;-><init>()V

    sput-object v0, Lcom/miui/gallery/ui/-$$Lambda$AlbumPageHeaderController$95J7xcuXcAMlZclfCwSTGa0gPRQ;->INSTANCE:Lcom/miui/gallery/ui/-$$Lambda$AlbumPageHeaderController$95J7xcuXcAMlZclfCwSTGa0gPRQ;

    return-void
.end method

.method private synthetic constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final handle(Landroid/database/Cursor;)Ljava/lang/Object;
    .locals 0

    invoke-static {p1}, Lcom/miui/gallery/ui/AlbumPageHeaderController;->lambda$isAlbumCoverValid$23(Landroid/database/Cursor;)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method
