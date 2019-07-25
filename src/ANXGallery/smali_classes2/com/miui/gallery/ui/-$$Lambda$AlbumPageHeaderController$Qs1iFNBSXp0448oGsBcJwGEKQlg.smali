.class public final synthetic Lcom/miui/gallery/ui/-$$Lambda$AlbumPageHeaderController$Qs1iFNBSXp0448oGsBcJwGEKQlg;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/util/concurrent/Callable;


# static fields
.field public static final synthetic INSTANCE:Lcom/miui/gallery/ui/-$$Lambda$AlbumPageHeaderController$Qs1iFNBSXp0448oGsBcJwGEKQlg;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/miui/gallery/ui/-$$Lambda$AlbumPageHeaderController$Qs1iFNBSXp0448oGsBcJwGEKQlg;

    invoke-direct {v0}, Lcom/miui/gallery/ui/-$$Lambda$AlbumPageHeaderController$Qs1iFNBSXp0448oGsBcJwGEKQlg;-><init>()V

    sput-object v0, Lcom/miui/gallery/ui/-$$Lambda$AlbumPageHeaderController$Qs1iFNBSXp0448oGsBcJwGEKQlg;->INSTANCE:Lcom/miui/gallery/ui/-$$Lambda$AlbumPageHeaderController$Qs1iFNBSXp0448oGsBcJwGEKQlg;

    return-void
.end method

.method private synthetic constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    invoke-static {}, Lcom/miui/gallery/ui/AlbumPageHeaderController;->lambda$takeSnapshot4PeopleAlbum$22()Lio/reactivex/CompletableSource;

    move-result-object v0

    return-object v0
.end method
