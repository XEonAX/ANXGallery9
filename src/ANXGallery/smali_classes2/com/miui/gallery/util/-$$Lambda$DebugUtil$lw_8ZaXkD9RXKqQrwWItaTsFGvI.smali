.class public final synthetic Lcom/miui/gallery/util/-$$Lambda$DebugUtil$lw_8ZaXkD9RXKqQrwWItaTsFGvI;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lcom/miui/gallery/threadpool/ThreadPool$Job;


# static fields
.field public static final synthetic INSTANCE:Lcom/miui/gallery/util/-$$Lambda$DebugUtil$lw_8ZaXkD9RXKqQrwWItaTsFGvI;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/miui/gallery/util/-$$Lambda$DebugUtil$lw_8ZaXkD9RXKqQrwWItaTsFGvI;

    invoke-direct {v0}, Lcom/miui/gallery/util/-$$Lambda$DebugUtil$lw_8ZaXkD9RXKqQrwWItaTsFGvI;-><init>()V

    sput-object v0, Lcom/miui/gallery/util/-$$Lambda$DebugUtil$lw_8ZaXkD9RXKqQrwWItaTsFGvI;->INSTANCE:Lcom/miui/gallery/util/-$$Lambda$DebugUtil$lw_8ZaXkD9RXKqQrwWItaTsFGvI;

    return-void
.end method

.method private synthetic constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Object;
    .locals 0

    invoke-static {p1}, Lcom/miui/gallery/util/DebugUtil;->lambda$exportDB$13(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method
