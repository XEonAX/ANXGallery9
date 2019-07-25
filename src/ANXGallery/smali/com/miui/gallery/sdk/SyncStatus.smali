.class public final enum Lcom/miui/gallery/sdk/SyncStatus;
.super Ljava/lang/Enum;
.source "SyncStatus.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/miui/gallery/sdk/SyncStatus;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/miui/gallery/sdk/SyncStatus;

.field public static final enum STATUS_ABADON:Lcom/miui/gallery/sdk/SyncStatus;

.field public static final enum STATUS_INIT:Lcom/miui/gallery/sdk/SyncStatus;

.field public static final enum STATUS_INTERRUPT:Lcom/miui/gallery/sdk/SyncStatus;

.field public static final enum STATUS_NONE:Lcom/miui/gallery/sdk/SyncStatus;

.field public static final enum STATUS_SUCCESS:Lcom/miui/gallery/sdk/SyncStatus;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    new-instance v0, Lcom/miui/gallery/sdk/SyncStatus;

    const-string v1, "STATUS_NONE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/miui/gallery/sdk/SyncStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/sdk/SyncStatus;->STATUS_NONE:Lcom/miui/gallery/sdk/SyncStatus;

    new-instance v0, Lcom/miui/gallery/sdk/SyncStatus;

    const-string v1, "STATUS_INIT"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lcom/miui/gallery/sdk/SyncStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/sdk/SyncStatus;->STATUS_INIT:Lcom/miui/gallery/sdk/SyncStatus;

    new-instance v0, Lcom/miui/gallery/sdk/SyncStatus;

    const-string v1, "STATUS_INTERRUPT"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4}, Lcom/miui/gallery/sdk/SyncStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/sdk/SyncStatus;->STATUS_INTERRUPT:Lcom/miui/gallery/sdk/SyncStatus;

    new-instance v0, Lcom/miui/gallery/sdk/SyncStatus;

    const-string v1, "STATUS_SUCCESS"

    const/4 v5, 0x3

    invoke-direct {v0, v1, v5}, Lcom/miui/gallery/sdk/SyncStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/sdk/SyncStatus;->STATUS_SUCCESS:Lcom/miui/gallery/sdk/SyncStatus;

    new-instance v0, Lcom/miui/gallery/sdk/SyncStatus;

    const-string v1, "STATUS_ABADON"

    const/4 v6, 0x4

    invoke-direct {v0, v1, v6}, Lcom/miui/gallery/sdk/SyncStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/sdk/SyncStatus;->STATUS_ABADON:Lcom/miui/gallery/sdk/SyncStatus;

    const/4 v0, 0x5

    new-array v0, v0, [Lcom/miui/gallery/sdk/SyncStatus;

    sget-object v1, Lcom/miui/gallery/sdk/SyncStatus;->STATUS_NONE:Lcom/miui/gallery/sdk/SyncStatus;

    aput-object v1, v0, v2

    sget-object v1, Lcom/miui/gallery/sdk/SyncStatus;->STATUS_INIT:Lcom/miui/gallery/sdk/SyncStatus;

    aput-object v1, v0, v3

    sget-object v1, Lcom/miui/gallery/sdk/SyncStatus;->STATUS_INTERRUPT:Lcom/miui/gallery/sdk/SyncStatus;

    aput-object v1, v0, v4

    sget-object v1, Lcom/miui/gallery/sdk/SyncStatus;->STATUS_SUCCESS:Lcom/miui/gallery/sdk/SyncStatus;

    aput-object v1, v0, v5

    sget-object v1, Lcom/miui/gallery/sdk/SyncStatus;->STATUS_ABADON:Lcom/miui/gallery/sdk/SyncStatus;

    aput-object v1, v0, v6

    sput-object v0, Lcom/miui/gallery/sdk/SyncStatus;->$VALUES:[Lcom/miui/gallery/sdk/SyncStatus;

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

.method public static toSyncStatus(I)Lcom/miui/gallery/sdk/SyncStatus;
    .locals 3

    packed-switch p0, :pswitch_data_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "unknown status: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_0
    sget-object p0, Lcom/miui/gallery/sdk/SyncStatus;->STATUS_ABADON:Lcom/miui/gallery/sdk/SyncStatus;

    return-object p0

    :pswitch_1
    sget-object p0, Lcom/miui/gallery/sdk/SyncStatus;->STATUS_SUCCESS:Lcom/miui/gallery/sdk/SyncStatus;

    return-object p0

    :pswitch_2
    sget-object p0, Lcom/miui/gallery/sdk/SyncStatus;->STATUS_INTERRUPT:Lcom/miui/gallery/sdk/SyncStatus;

    return-object p0

    :pswitch_3
    sget-object p0, Lcom/miui/gallery/sdk/SyncStatus;->STATUS_INIT:Lcom/miui/gallery/sdk/SyncStatus;

    return-object p0

    :pswitch_4
    sget-object p0, Lcom/miui/gallery/sdk/SyncStatus;->STATUS_NONE:Lcom/miui/gallery/sdk/SyncStatus;

    return-object p0

    nop

    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/miui/gallery/sdk/SyncStatus;
    .locals 1

    const-class v0, Lcom/miui/gallery/sdk/SyncStatus;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/sdk/SyncStatus;

    return-object p0
.end method

.method public static values()[Lcom/miui/gallery/sdk/SyncStatus;
    .locals 1

    sget-object v0, Lcom/miui/gallery/sdk/SyncStatus;->$VALUES:[Lcom/miui/gallery/sdk/SyncStatus;

    invoke-virtual {v0}, [Lcom/miui/gallery/sdk/SyncStatus;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/miui/gallery/sdk/SyncStatus;

    return-object v0
.end method
