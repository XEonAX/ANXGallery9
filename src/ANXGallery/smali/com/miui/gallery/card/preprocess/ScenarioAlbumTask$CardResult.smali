.class public final enum Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;
.super Ljava/lang/Enum;
.source "ScenarioAlbumTask.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "CardResult"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;

.field public static final enum CREATED:Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;

.field public static final enum DUPLICATED:Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;

.field public static final enum HAVE_UNPROCESSED_IMAGES:Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;

.field public static final enum IMAGE_PROCESS_FAIL:Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;

.field public static final enum INPUT_ERROR:Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;

.field public static final enum NO_ENOUGH_IMAGE:Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    new-instance v0, Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;

    const-string v1, "CREATED"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;->CREATED:Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;

    new-instance v0, Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;

    const-string v1, "INPUT_ERROR"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;->INPUT_ERROR:Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;

    new-instance v0, Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;

    const-string v1, "HAVE_UNPROCESSED_IMAGES"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4}, Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;->HAVE_UNPROCESSED_IMAGES:Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;

    new-instance v0, Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;

    const-string v1, "DUPLICATED"

    const/4 v5, 0x3

    invoke-direct {v0, v1, v5}, Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;->DUPLICATED:Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;

    new-instance v0, Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;

    const-string v1, "NO_ENOUGH_IMAGE"

    const/4 v6, 0x4

    invoke-direct {v0, v1, v6}, Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;->NO_ENOUGH_IMAGE:Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;

    new-instance v0, Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;

    const-string v1, "IMAGE_PROCESS_FAIL"

    const/4 v7, 0x5

    invoke-direct {v0, v1, v7}, Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;->IMAGE_PROCESS_FAIL:Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;

    const/4 v0, 0x6

    new-array v0, v0, [Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;

    sget-object v1, Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;->CREATED:Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;

    aput-object v1, v0, v2

    sget-object v1, Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;->INPUT_ERROR:Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;

    aput-object v1, v0, v3

    sget-object v1, Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;->HAVE_UNPROCESSED_IMAGES:Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;

    aput-object v1, v0, v4

    sget-object v1, Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;->DUPLICATED:Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;

    aput-object v1, v0, v5

    sget-object v1, Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;->NO_ENOUGH_IMAGE:Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;

    aput-object v1, v0, v6

    sget-object v1, Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;->IMAGE_PROCESS_FAIL:Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;

    aput-object v1, v0, v7

    sput-object v0, Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;->$VALUES:[Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;

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

.method public static valueOf(Ljava/lang/String;)Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;
    .locals 1

    const-class v0, Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;

    return-object p0
.end method

.method public static values()[Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;
    .locals 1

    sget-object v0, Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;->$VALUES:[Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;

    invoke-virtual {v0}, [Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;

    return-object v0
.end method
