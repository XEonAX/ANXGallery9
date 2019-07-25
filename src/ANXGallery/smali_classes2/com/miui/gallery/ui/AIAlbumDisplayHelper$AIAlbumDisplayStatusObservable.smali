.class Lcom/miui/gallery/ui/AIAlbumDisplayHelper$AIAlbumDisplayStatusObservable;
.super Ljava/util/Observable;
.source "AIAlbumDisplayHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/AIAlbumDisplayHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AIAlbumDisplayStatusObservable"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/AIAlbumDisplayHelper;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/ui/AIAlbumDisplayHelper;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/AIAlbumDisplayHelper$AIAlbumDisplayStatusObservable;->this$0:Lcom/miui/gallery/ui/AIAlbumDisplayHelper;

    invoke-direct {p0}, Ljava/util/Observable;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/ui/AIAlbumDisplayHelper;Lcom/miui/gallery/ui/AIAlbumDisplayHelper$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/AIAlbumDisplayHelper$AIAlbumDisplayStatusObservable;-><init>(Lcom/miui/gallery/ui/AIAlbumDisplayHelper;)V

    return-void
.end method


# virtual methods
.method onUpdateStatus(Landroid/util/SparseBooleanArray;)V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AIAlbumDisplayHelper$AIAlbumDisplayStatusObservable;->setChanged()V

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/AIAlbumDisplayHelper$AIAlbumDisplayStatusObservable;->notifyObservers(Ljava/lang/Object;)V

    return-void
.end method
