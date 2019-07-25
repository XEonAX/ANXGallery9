.class Lcom/miui/gallery/util/IntentUtil$SupportNewVideoPlayer;
.super Lcom/miui/gallery/util/LazyValue;
.source "IntentUtil.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/util/IntentUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SupportNewVideoPlayer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/util/LazyValue<",
        "Ljava/lang/Void;",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/util/LazyValue;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/util/IntentUtil$1;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/util/IntentUtil$SupportNewVideoPlayer;-><init>()V

    return-void
.end method


# virtual methods
.method protected onInit(Ljava/lang/Void;)Ljava/lang/Boolean;
    .locals 1

    invoke-static {}, Lcom/miui/gallery/video/VideoFrameProvider;->isDeviceSupport()Z

    move-result p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1

    :cond_0
    new-instance p1, Landroid/content/Intent;

    const-string v0, "com.miui.videoplayer.GALLERY_VIDEO_PLAY"

    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v0, "com.miui.video"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    const-string v0, "content:///"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->isIntentSupported(Landroid/content/Intent;)Z

    move-result p1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method

.method protected bridge synthetic onInit(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/util/IntentUtil$SupportNewVideoPlayer;->onInit(Ljava/lang/Void;)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method
