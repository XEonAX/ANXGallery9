.class public final enum Lcom/nexstreaming/app/common/task/Task$Event;
.super Ljava/lang/Enum;
.source "Task.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nexstreaming/app/common/task/Task;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Event"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/nexstreaming/app/common/task/Task$Event;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/nexstreaming/app/common/task/Task$Event;

.field public static final enum CANCEL:Lcom/nexstreaming/app/common/task/Task$Event;

.field public static final enum COMPLETE:Lcom/nexstreaming/app/common/task/Task$Event;

.field public static final enum FAIL:Lcom/nexstreaming/app/common/task/Task$Event;

.field public static final enum PROGRESS:Lcom/nexstreaming/app/common/task/Task$Event;

.field public static final enum RESULT_AVAILABLE:Lcom/nexstreaming/app/common/task/Task$Event;

.field public static final enum SUCCESS:Lcom/nexstreaming/app/common/task/Task$Event;

.field public static final enum UPDATE_OR_RESULT_AVAILABLE:Lcom/nexstreaming/app/common/task/Task$Event;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    new-instance v0, Lcom/nexstreaming/app/common/task/Task$Event;

    const-string v1, "SUCCESS"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/nexstreaming/app/common/task/Task$Event;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/nexstreaming/app/common/task/Task$Event;->SUCCESS:Lcom/nexstreaming/app/common/task/Task$Event;

    new-instance v0, Lcom/nexstreaming/app/common/task/Task$Event;

    const-string v1, "FAIL"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lcom/nexstreaming/app/common/task/Task$Event;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/nexstreaming/app/common/task/Task$Event;->FAIL:Lcom/nexstreaming/app/common/task/Task$Event;

    new-instance v0, Lcom/nexstreaming/app/common/task/Task$Event;

    const-string v1, "COMPLETE"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4}, Lcom/nexstreaming/app/common/task/Task$Event;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/nexstreaming/app/common/task/Task$Event;->COMPLETE:Lcom/nexstreaming/app/common/task/Task$Event;

    new-instance v0, Lcom/nexstreaming/app/common/task/Task$Event;

    const-string v1, "CANCEL"

    const/4 v5, 0x3

    invoke-direct {v0, v1, v5}, Lcom/nexstreaming/app/common/task/Task$Event;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/nexstreaming/app/common/task/Task$Event;->CANCEL:Lcom/nexstreaming/app/common/task/Task$Event;

    new-instance v0, Lcom/nexstreaming/app/common/task/Task$Event;

    const-string v1, "PROGRESS"

    const/4 v6, 0x4

    invoke-direct {v0, v1, v6}, Lcom/nexstreaming/app/common/task/Task$Event;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/nexstreaming/app/common/task/Task$Event;->PROGRESS:Lcom/nexstreaming/app/common/task/Task$Event;

    new-instance v0, Lcom/nexstreaming/app/common/task/Task$Event;

    const-string v1, "RESULT_AVAILABLE"

    const/4 v7, 0x5

    invoke-direct {v0, v1, v7}, Lcom/nexstreaming/app/common/task/Task$Event;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/nexstreaming/app/common/task/Task$Event;->RESULT_AVAILABLE:Lcom/nexstreaming/app/common/task/Task$Event;

    new-instance v0, Lcom/nexstreaming/app/common/task/Task$Event;

    const-string v1, "UPDATE_OR_RESULT_AVAILABLE"

    const/4 v8, 0x6

    invoke-direct {v0, v1, v8}, Lcom/nexstreaming/app/common/task/Task$Event;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/nexstreaming/app/common/task/Task$Event;->UPDATE_OR_RESULT_AVAILABLE:Lcom/nexstreaming/app/common/task/Task$Event;

    const/4 v0, 0x7

    new-array v0, v0, [Lcom/nexstreaming/app/common/task/Task$Event;

    sget-object v1, Lcom/nexstreaming/app/common/task/Task$Event;->SUCCESS:Lcom/nexstreaming/app/common/task/Task$Event;

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/app/common/task/Task$Event;->FAIL:Lcom/nexstreaming/app/common/task/Task$Event;

    aput-object v1, v0, v3

    sget-object v1, Lcom/nexstreaming/app/common/task/Task$Event;->COMPLETE:Lcom/nexstreaming/app/common/task/Task$Event;

    aput-object v1, v0, v4

    sget-object v1, Lcom/nexstreaming/app/common/task/Task$Event;->CANCEL:Lcom/nexstreaming/app/common/task/Task$Event;

    aput-object v1, v0, v5

    sget-object v1, Lcom/nexstreaming/app/common/task/Task$Event;->PROGRESS:Lcom/nexstreaming/app/common/task/Task$Event;

    aput-object v1, v0, v6

    sget-object v1, Lcom/nexstreaming/app/common/task/Task$Event;->RESULT_AVAILABLE:Lcom/nexstreaming/app/common/task/Task$Event;

    aput-object v1, v0, v7

    sget-object v1, Lcom/nexstreaming/app/common/task/Task$Event;->UPDATE_OR_RESULT_AVAILABLE:Lcom/nexstreaming/app/common/task/Task$Event;

    aput-object v1, v0, v8

    sput-object v0, Lcom/nexstreaming/app/common/task/Task$Event;->$VALUES:[Lcom/nexstreaming/app/common/task/Task$Event;

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

.method public static valueOf(Ljava/lang/String;)Lcom/nexstreaming/app/common/task/Task$Event;
    .locals 1

    const-class v0, Lcom/nexstreaming/app/common/task/Task$Event;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/nexstreaming/app/common/task/Task$Event;

    return-object p0
.end method

.method public static values()[Lcom/nexstreaming/app/common/task/Task$Event;
    .locals 1

    sget-object v0, Lcom/nexstreaming/app/common/task/Task$Event;->$VALUES:[Lcom/nexstreaming/app/common/task/Task$Event;

    invoke-virtual {v0}, [Lcom/nexstreaming/app/common/task/Task$Event;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/nexstreaming/app/common/task/Task$Event;

    return-object v0
.end method
