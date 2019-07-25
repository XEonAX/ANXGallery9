.class Lcom/miui/gallery/ui/AIAlbumDisplayHelper$AIAlbumDisplayHelperHolder;
.super Ljava/lang/Object;
.source "AIAlbumDisplayHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/AIAlbumDisplayHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "AIAlbumDisplayHelperHolder"
.end annotation


# static fields
.field private static final S_INSTANCE:Lcom/miui/gallery/ui/AIAlbumDisplayHelper;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/miui/gallery/ui/AIAlbumDisplayHelper;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/miui/gallery/ui/AIAlbumDisplayHelper;-><init>(Lcom/miui/gallery/ui/AIAlbumDisplayHelper$1;)V

    sput-object v0, Lcom/miui/gallery/ui/AIAlbumDisplayHelper$AIAlbumDisplayHelperHolder;->S_INSTANCE:Lcom/miui/gallery/ui/AIAlbumDisplayHelper;

    return-void
.end method

.method static synthetic access$100()Lcom/miui/gallery/ui/AIAlbumDisplayHelper;
    .locals 1

    sget-object v0, Lcom/miui/gallery/ui/AIAlbumDisplayHelper$AIAlbumDisplayHelperHolder;->S_INSTANCE:Lcom/miui/gallery/ui/AIAlbumDisplayHelper;

    return-object v0
.end method
