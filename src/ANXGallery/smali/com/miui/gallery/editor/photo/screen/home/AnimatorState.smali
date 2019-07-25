.class public final enum Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;
.super Ljava/lang/Enum;
.source "AnimatorState.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;

.field public static final enum ANIMATOR_END:Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;

.field public static final enum ANIMATOR_PRE_START:Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;

.field public static final enum ANIMATOR_START:Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;

.field public static final enum ANIMATOR_UPDATE:Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    new-instance v0, Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;

    const-string v1, "ANIMATOR_PRE_START"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;->ANIMATOR_PRE_START:Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;

    new-instance v0, Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;

    const-string v1, "ANIMATOR_START"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;->ANIMATOR_START:Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;

    new-instance v0, Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;

    const-string v1, "ANIMATOR_UPDATE"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4}, Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;->ANIMATOR_UPDATE:Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;

    new-instance v0, Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;

    const-string v1, "ANIMATOR_END"

    const/4 v5, 0x3

    invoke-direct {v0, v1, v5}, Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;->ANIMATOR_END:Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;

    const/4 v0, 0x4

    new-array v0, v0, [Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;

    sget-object v1, Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;->ANIMATOR_PRE_START:Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;

    aput-object v1, v0, v2

    sget-object v1, Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;->ANIMATOR_START:Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;

    aput-object v1, v0, v3

    sget-object v1, Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;->ANIMATOR_UPDATE:Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;

    aput-object v1, v0, v4

    sget-object v1, Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;->ANIMATOR_END:Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;

    aput-object v1, v0, v5

    sput-object v0, Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;->$VALUES:[Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;

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

.method public static valueOf(Ljava/lang/String;)Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;
    .locals 1

    const-class v0, Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;

    return-object p0
.end method

.method public static values()[Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;
    .locals 1

    sget-object v0, Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;->$VALUES:[Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;

    invoke-virtual {v0}, [Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;

    return-object v0
.end method
