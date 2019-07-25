.class public final synthetic Lcom/miui/gallery/ui/-$$Lambda$HsxTmekaKE_eSp8SvVyT4vGiMmM;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lio/reactivex/functions/Function;


# static fields
.field public static final synthetic INSTANCE:Lcom/miui/gallery/ui/-$$Lambda$HsxTmekaKE_eSp8SvVyT4vGiMmM;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/miui/gallery/ui/-$$Lambda$HsxTmekaKE_eSp8SvVyT4vGiMmM;

    invoke-direct {v0}, Lcom/miui/gallery/ui/-$$Lambda$HsxTmekaKE_eSp8SvVyT4vGiMmM;-><init>()V

    sput-object v0, Lcom/miui/gallery/ui/-$$Lambda$HsxTmekaKE_eSp8SvVyT4vGiMmM;->INSTANCE:Lcom/miui/gallery/ui/-$$Lambda$HsxTmekaKE_eSp8SvVyT4vGiMmM;

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

    check-cast p1, Ljava/util/List;

    invoke-static {p1}, Lcom/miui/gallery/provider/PeopleFaceSnapshotHelper;->persist(Ljava/util/List;)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    return-object p1
.end method
