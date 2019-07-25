.class public final enum Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;
.super Ljava/lang/Enum;
.source "DoodleItem.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;

.field public static final enum ARROW:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;

.field public static final enum CIRCULAR:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;

.field public static final enum LINE:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;

.field public static final enum PATH:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;

.field public static final enum RECTANGLE:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;

.field public static final enum SCREEN_ARROW:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;

.field public static final enum SCREEN_CIRCULAR:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;

.field public static final enum SCREEN_LINE:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;

.field public static final enum SCREEN_PATH:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;

.field public static final enum SCREEN_RECTANGLE:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;


# instance fields
.field public final normal:I

.field public final selected:I

.field public final talkback:I

.field public final type:I


# direct methods
.method static constructor <clinit>()V
    .locals 15

    new-instance v7, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;

    const-string v1, "PATH"

    const/4 v2, 0x0

    const v3, 0x7f0700eb

    const v4, 0x7f0700ec

    const v5, 0x7f100553

    const/4 v6, 0x1

    move-object v0, v7

    invoke-direct/range {v0 .. v6}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;-><init>(Ljava/lang/String;IIIII)V

    sput-object v7, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;->PATH:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;

    const-string v9, "LINE"

    const/4 v10, 0x1

    const v11, 0x7f0700e9

    const v12, 0x7f0700ea

    const v13, 0x7f100552

    const/4 v14, 0x1

    move-object v8, v0

    invoke-direct/range {v8 .. v14}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;-><init>(Ljava/lang/String;IIIII)V

    sput-object v0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;->LINE:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;

    const-string v2, "RECTANGLE"

    const/4 v3, 0x2

    const v4, 0x7f0700ed

    const v5, 0x7f0700ee

    const v6, 0x7f100554

    const/4 v7, 0x1

    move-object v1, v0

    invoke-direct/range {v1 .. v7}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;-><init>(Ljava/lang/String;IIIII)V

    sput-object v0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;->RECTANGLE:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;

    const-string v9, "CIRCULAR"

    const/4 v10, 0x3

    const v11, 0x7f0700e7

    const v12, 0x7f0700e8

    const v13, 0x7f100551

    move-object v8, v0

    invoke-direct/range {v8 .. v14}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;-><init>(Ljava/lang/String;IIIII)V

    sput-object v0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;->CIRCULAR:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;

    const-string v2, "ARROW"

    const/4 v3, 0x4

    const v4, 0x7f0700e5

    const v5, 0x7f0700e6

    const v6, 0x7f100550

    move-object v1, v0

    invoke-direct/range {v1 .. v7}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;-><init>(Ljava/lang/String;IIIII)V

    sput-object v0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;->ARROW:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;

    const-string v9, "SCREEN_PATH"

    const/4 v10, 0x5

    const v11, 0x7f0700eb

    const v12, 0x7f0700ec

    const v13, 0x7f100553

    const/4 v14, 0x0

    move-object v8, v0

    invoke-direct/range {v8 .. v14}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;-><init>(Ljava/lang/String;IIIII)V

    sput-object v0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;->SCREEN_PATH:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;

    const-string v2, "SCREEN_LINE"

    const/4 v3, 0x6

    const v4, 0x7f0700e9

    const v5, 0x7f0700ea

    const v6, 0x7f100552

    const/4 v7, 0x0

    move-object v1, v0

    invoke-direct/range {v1 .. v7}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;-><init>(Ljava/lang/String;IIIII)V

    sput-object v0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;->SCREEN_LINE:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;

    const-string v9, "SCREEN_RECTANGLE"

    const/4 v10, 0x7

    const v11, 0x7f0700ed

    const v12, 0x7f0700ee

    const v13, 0x7f100554

    move-object v8, v0

    invoke-direct/range {v8 .. v14}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;-><init>(Ljava/lang/String;IIIII)V

    sput-object v0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;->SCREEN_RECTANGLE:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;

    const-string v2, "SCREEN_CIRCULAR"

    const/16 v3, 0x8

    const v4, 0x7f0700e7

    const v5, 0x7f0700e8

    const v6, 0x7f100551

    move-object v1, v0

    invoke-direct/range {v1 .. v7}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;-><init>(Ljava/lang/String;IIIII)V

    sput-object v0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;->SCREEN_CIRCULAR:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;

    const-string v9, "SCREEN_ARROW"

    const/16 v10, 0x9

    const v11, 0x7f0700e5

    const v12, 0x7f0700e6

    const v13, 0x7f100550

    move-object v8, v0

    invoke-direct/range {v8 .. v14}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;-><init>(Ljava/lang/String;IIIII)V

    sput-object v0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;->SCREEN_ARROW:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;

    const/16 v0, 0xa

    new-array v0, v0, [Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;

    sget-object v1, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;->PATH:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;->LINE:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;->RECTANGLE:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    sget-object v1, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;->CIRCULAR:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    sget-object v1, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;->ARROW:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;

    const/4 v2, 0x4

    aput-object v1, v0, v2

    sget-object v1, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;->SCREEN_PATH:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;

    const/4 v2, 0x5

    aput-object v1, v0, v2

    sget-object v1, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;->SCREEN_LINE:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;

    const/4 v2, 0x6

    aput-object v1, v0, v2

    sget-object v1, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;->SCREEN_RECTANGLE:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;

    const/4 v2, 0x7

    aput-object v1, v0, v2

    sget-object v1, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;->SCREEN_CIRCULAR:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;

    const/16 v2, 0x8

    aput-object v1, v0, v2

    sget-object v1, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;->SCREEN_ARROW:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;

    const/16 v2, 0x9

    aput-object v1, v0, v2

    sput-object v0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;->$VALUES:[Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IIIII)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IIII)V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;->normal:I

    iput p4, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;->selected:I

    iput p5, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;->talkback:I

    iput p6, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;->type:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;
    .locals 1

    const-class v0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;

    return-object p0
.end method

.method public static values()[Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;
    .locals 1

    sget-object v0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;->$VALUES:[Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;

    invoke-virtual {v0}, [Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;

    return-object v0
.end method


# virtual methods
.method public getDoodleDrawable(Landroid/content/res/Resources;)Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;
    .locals 2

    sget-object v0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem$1;->$SwitchMap$com$miui$gallery$editor$photo$core$imports$doodle$painter$DoodleItem:[I

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    const/4 v0, 0x0

    goto :goto_0

    :pswitch_0
    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleArrowNode;

    invoke-direct {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleArrowNode;-><init>(Landroid/content/res/Resources;)V

    goto :goto_0

    :pswitch_1
    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleCircularNode;

    invoke-direct {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleCircularNode;-><init>(Landroid/content/res/Resources;)V

    goto :goto_0

    :pswitch_2
    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleRectangleNode;

    invoke-direct {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleRectangleNode;-><init>(Landroid/content/res/Resources;)V

    goto :goto_0

    :pswitch_3
    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleLineNode;

    invoke-direct {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleLineNode;-><init>(Landroid/content/res/Resources;)V

    goto :goto_0

    :pswitch_4
    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/path/DoodlePathNode;

    invoke-direct {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/path/DoodlePathNode;-><init>(Landroid/content/res/Resources;)V

    :goto_0
    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_4
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public isScreenData()Z
    .locals 1

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;->type:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
