.class public final synthetic Lcom/miui/gallery/util/-$$Lambda$DeleteDataUtil$O0ZEM8Hx1ihGaTo0iD4KIRm3aAQ;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lcom/miui/gallery/util/GalleryUtils$QueryHandler;


# static fields
.field public static final synthetic INSTANCE:Lcom/miui/gallery/util/-$$Lambda$DeleteDataUtil$O0ZEM8Hx1ihGaTo0iD4KIRm3aAQ;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/miui/gallery/util/-$$Lambda$DeleteDataUtil$O0ZEM8Hx1ihGaTo0iD4KIRm3aAQ;

    invoke-direct {v0}, Lcom/miui/gallery/util/-$$Lambda$DeleteDataUtil$O0ZEM8Hx1ihGaTo0iD4KIRm3aAQ;-><init>()V

    sput-object v0, Lcom/miui/gallery/util/-$$Lambda$DeleteDataUtil$O0ZEM8Hx1ihGaTo0iD4KIRm3aAQ;->INSTANCE:Lcom/miui/gallery/util/-$$Lambda$DeleteDataUtil$O0ZEM8Hx1ihGaTo0iD4KIRm3aAQ;

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

    invoke-static {p1}, Lcom/miui/gallery/util/DeleteDataUtil;->lambda$deleteHiddenFiles$43(Landroid/database/Cursor;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method
