.class public final enum Lcom/miui/gallery/assistant/library/Library$LibraryStatus;
.super Ljava/lang/Enum;
.source "Library.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/assistant/library/Library;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "LibraryStatus"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/miui/gallery/assistant/library/Library$LibraryStatus;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/miui/gallery/assistant/library/Library$LibraryStatus;

.field public static final enum STATE_ABI_UNAVAILABLE:Lcom/miui/gallery/assistant/library/Library$LibraryStatus;

.field public static final enum STATE_AVAILABLE:Lcom/miui/gallery/assistant/library/Library$LibraryStatus;

.field public static final enum STATE_DEFAULT:Lcom/miui/gallery/assistant/library/Library$LibraryStatus;

.field public static final enum STATE_DOWNLOADING:Lcom/miui/gallery/assistant/library/Library$LibraryStatus;

.field public static final enum STATE_LOADED:Lcom/miui/gallery/assistant/library/Library$LibraryStatus;

.field public static final enum STATE_NOT_DOWNLOADED:Lcom/miui/gallery/assistant/library/Library$LibraryStatus;

.field public static final enum STATE_NO_LIBRARY_INFO:Lcom/miui/gallery/assistant/library/Library$LibraryStatus;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    new-instance v0, Lcom/miui/gallery/assistant/library/Library$LibraryStatus;

    const-string v1, "STATE_DEFAULT"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/miui/gallery/assistant/library/Library$LibraryStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/assistant/library/Library$LibraryStatus;->STATE_DEFAULT:Lcom/miui/gallery/assistant/library/Library$LibraryStatus;

    new-instance v0, Lcom/miui/gallery/assistant/library/Library$LibraryStatus;

    const-string v1, "STATE_NO_LIBRARY_INFO"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lcom/miui/gallery/assistant/library/Library$LibraryStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/assistant/library/Library$LibraryStatus;->STATE_NO_LIBRARY_INFO:Lcom/miui/gallery/assistant/library/Library$LibraryStatus;

    new-instance v0, Lcom/miui/gallery/assistant/library/Library$LibraryStatus;

    const-string v1, "STATE_NOT_DOWNLOADED"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4}, Lcom/miui/gallery/assistant/library/Library$LibraryStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/assistant/library/Library$LibraryStatus;->STATE_NOT_DOWNLOADED:Lcom/miui/gallery/assistant/library/Library$LibraryStatus;

    new-instance v0, Lcom/miui/gallery/assistant/library/Library$LibraryStatus;

    const-string v1, "STATE_DOWNLOADING"

    const/4 v5, 0x3

    invoke-direct {v0, v1, v5}, Lcom/miui/gallery/assistant/library/Library$LibraryStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/assistant/library/Library$LibraryStatus;->STATE_DOWNLOADING:Lcom/miui/gallery/assistant/library/Library$LibraryStatus;

    new-instance v0, Lcom/miui/gallery/assistant/library/Library$LibraryStatus;

    const-string v1, "STATE_ABI_UNAVAILABLE"

    const/4 v6, 0x4

    invoke-direct {v0, v1, v6}, Lcom/miui/gallery/assistant/library/Library$LibraryStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/assistant/library/Library$LibraryStatus;->STATE_ABI_UNAVAILABLE:Lcom/miui/gallery/assistant/library/Library$LibraryStatus;

    new-instance v0, Lcom/miui/gallery/assistant/library/Library$LibraryStatus;

    const-string v1, "STATE_AVAILABLE"

    const/4 v7, 0x5

    invoke-direct {v0, v1, v7}, Lcom/miui/gallery/assistant/library/Library$LibraryStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/assistant/library/Library$LibraryStatus;->STATE_AVAILABLE:Lcom/miui/gallery/assistant/library/Library$LibraryStatus;

    new-instance v0, Lcom/miui/gallery/assistant/library/Library$LibraryStatus;

    const-string v1, "STATE_LOADED"

    const/4 v8, 0x6

    invoke-direct {v0, v1, v8}, Lcom/miui/gallery/assistant/library/Library$LibraryStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/assistant/library/Library$LibraryStatus;->STATE_LOADED:Lcom/miui/gallery/assistant/library/Library$LibraryStatus;

    const/4 v0, 0x7

    new-array v0, v0, [Lcom/miui/gallery/assistant/library/Library$LibraryStatus;

    sget-object v1, Lcom/miui/gallery/assistant/library/Library$LibraryStatus;->STATE_DEFAULT:Lcom/miui/gallery/assistant/library/Library$LibraryStatus;

    aput-object v1, v0, v2

    sget-object v1, Lcom/miui/gallery/assistant/library/Library$LibraryStatus;->STATE_NO_LIBRARY_INFO:Lcom/miui/gallery/assistant/library/Library$LibraryStatus;

    aput-object v1, v0, v3

    sget-object v1, Lcom/miui/gallery/assistant/library/Library$LibraryStatus;->STATE_NOT_DOWNLOADED:Lcom/miui/gallery/assistant/library/Library$LibraryStatus;

    aput-object v1, v0, v4

    sget-object v1, Lcom/miui/gallery/assistant/library/Library$LibraryStatus;->STATE_DOWNLOADING:Lcom/miui/gallery/assistant/library/Library$LibraryStatus;

    aput-object v1, v0, v5

    sget-object v1, Lcom/miui/gallery/assistant/library/Library$LibraryStatus;->STATE_ABI_UNAVAILABLE:Lcom/miui/gallery/assistant/library/Library$LibraryStatus;

    aput-object v1, v0, v6

    sget-object v1, Lcom/miui/gallery/assistant/library/Library$LibraryStatus;->STATE_AVAILABLE:Lcom/miui/gallery/assistant/library/Library$LibraryStatus;

    aput-object v1, v0, v7

    sget-object v1, Lcom/miui/gallery/assistant/library/Library$LibraryStatus;->STATE_LOADED:Lcom/miui/gallery/assistant/library/Library$LibraryStatus;

    aput-object v1, v0, v8

    sput-object v0, Lcom/miui/gallery/assistant/library/Library$LibraryStatus;->$VALUES:[Lcom/miui/gallery/assistant/library/Library$LibraryStatus;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/miui/gallery/assistant/library/Library$LibraryStatus;
    .locals 1

    const-class v0, Lcom/miui/gallery/assistant/library/Library$LibraryStatus;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/assistant/library/Library$LibraryStatus;

    return-object p0
.end method

.method public static values()[Lcom/miui/gallery/assistant/library/Library$LibraryStatus;
    .locals 1

    sget-object v0, Lcom/miui/gallery/assistant/library/Library$LibraryStatus;->$VALUES:[Lcom/miui/gallery/assistant/library/Library$LibraryStatus;

    invoke-virtual {v0}, [Lcom/miui/gallery/assistant/library/Library$LibraryStatus;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/miui/gallery/assistant/library/Library$LibraryStatus;

    return-object v0
.end method
