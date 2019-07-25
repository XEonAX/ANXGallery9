.class public final enum Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$LayerType;
.super Ljava/lang/Enum;
.source "KMIntentData.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "LayerType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$LayerType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$LayerType;

.field public static final enum Image:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$LayerType;

.field public static final enum Sticker:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$LayerType;

.field public static final enum Text:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$LayerType;

.field public static final enum Video:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$LayerType;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    new-instance v0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$LayerType;

    const-string v1, "Image"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$LayerType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$LayerType;->Image:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$LayerType;

    new-instance v0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$LayerType;

    const-string v1, "Video"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$LayerType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$LayerType;->Video:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$LayerType;

    new-instance v0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$LayerType;

    const-string v1, "Text"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$LayerType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$LayerType;->Text:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$LayerType;

    new-instance v0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$LayerType;

    const-string v1, "Sticker"

    const/4 v5, 0x3

    invoke-direct {v0, v1, v5}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$LayerType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$LayerType;->Sticker:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$LayerType;

    const/4 v0, 0x4

    new-array v0, v0, [Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$LayerType;

    sget-object v1, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$LayerType;->Image:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$LayerType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$LayerType;->Video:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$LayerType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$LayerType;->Text:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$LayerType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$LayerType;->Sticker:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$LayerType;

    aput-object v1, v0, v5

    sput-object v0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$LayerType;->$VALUES:[Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$LayerType;

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

.method public static valueOf(Ljava/lang/String;)Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$LayerType;
    .locals 1

    const-class v0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$LayerType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$LayerType;

    return-object p0
.end method

.method public static values()[Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$LayerType;
    .locals 1

    sget-object v0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$LayerType;->$VALUES:[Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$LayerType;

    invoke-virtual {v0}, [Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$LayerType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/KMIntentData$LayerType;

    return-object v0
.end method
