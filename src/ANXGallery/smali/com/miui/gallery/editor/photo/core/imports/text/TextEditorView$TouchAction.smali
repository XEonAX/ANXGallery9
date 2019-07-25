.class final enum Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;
.super Ljava/lang/Enum;
.source "TextEditorView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "TouchAction"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;

.field public static final enum DELETE:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;

.field public static final enum EDIT:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;

.field public static final enum MIRROR:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;

.field public static final enum NONE:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;

.field public static final enum REVERSE_BLACK:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;

.field public static final enum REVERSE_WHITE:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;

.field public static final enum SCALE:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;

    const-string v1, "NONE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;->NONE:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;

    const-string v1, "DELETE"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;->DELETE:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;

    const-string v1, "SCALE"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;->SCALE:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;

    const-string v1, "MIRROR"

    const/4 v5, 0x3

    invoke-direct {v0, v1, v5}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;->MIRROR:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;

    const-string v1, "EDIT"

    const/4 v6, 0x4

    invoke-direct {v0, v1, v6}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;->EDIT:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;

    const-string v1, "REVERSE_WHITE"

    const/4 v7, 0x5

    invoke-direct {v0, v1, v7}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;->REVERSE_WHITE:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;

    const-string v1, "REVERSE_BLACK"

    const/4 v8, 0x6

    invoke-direct {v0, v1, v8}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;->REVERSE_BLACK:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;

    const/4 v0, 0x7

    new-array v0, v0, [Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;

    sget-object v1, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;->NONE:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;

    aput-object v1, v0, v2

    sget-object v1, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;->DELETE:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;

    aput-object v1, v0, v3

    sget-object v1, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;->SCALE:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;

    aput-object v1, v0, v4

    sget-object v1, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;->MIRROR:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;

    aput-object v1, v0, v5

    sget-object v1, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;->EDIT:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;

    aput-object v1, v0, v6

    sget-object v1, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;->REVERSE_WHITE:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;

    aput-object v1, v0, v7

    sget-object v1, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;->REVERSE_BLACK:Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;

    aput-object v1, v0, v8

    sput-object v0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;->$VALUES:[Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;

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

.method public static valueOf(Ljava/lang/String;)Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;
    .locals 1

    const-class v0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;

    return-object p0
.end method

.method public static values()[Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;
    .locals 1

    sget-object v0, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;->$VALUES:[Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;

    invoke-virtual {v0}, [Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TouchAction;

    return-object v0
.end method
