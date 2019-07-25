.class public final enum Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$Tab;
.super Ljava/lang/Enum;
.source "TextEditDialog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Tab"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$Tab;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$Tab;

.field public static final enum FONT:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$Tab;

.field public static final enum KEYBOARD:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$Tab;

.field public static final enum STYLE:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$Tab;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$Tab;

    const-string v1, "KEYBOARD"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$Tab;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$Tab;->KEYBOARD:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$Tab;

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$Tab;

    const-string v1, "STYLE"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$Tab;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$Tab;->STYLE:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$Tab;

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$Tab;

    const-string v1, "FONT"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$Tab;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$Tab;->FONT:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$Tab;

    const/4 v0, 0x3

    new-array v0, v0, [Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$Tab;

    sget-object v1, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$Tab;->KEYBOARD:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$Tab;

    aput-object v1, v0, v2

    sget-object v1, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$Tab;->STYLE:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$Tab;

    aput-object v1, v0, v3

    sget-object v1, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$Tab;->FONT:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$Tab;

    aput-object v1, v0, v4

    sput-object v0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$Tab;->$VALUES:[Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$Tab;

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

.method public static valueOf(Ljava/lang/String;)Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$Tab;
    .locals 1

    const-class v0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$Tab;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$Tab;

    return-object p0
.end method

.method public static values()[Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$Tab;
    .locals 1

    sget-object v0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$Tab;->$VALUES:[Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$Tab;

    invoke-virtual {v0}, [Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$Tab;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$Tab;

    return-object v0
.end method


# virtual methods
.method public getSubMenu(Landroid/content/Context;Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$ConfigChangeListener;Landroid/view/ViewGroup;)Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogSubMenu;
    .locals 2

    sget-object v0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$3;->$SwitchMap$com$miui$gallery$editor$photo$core$imports$text$editdialog$TextEditDialog$Tab:[I

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$Tab;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    const/4 v0, 0x0

    goto :goto_0

    :pswitch_0
    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;

    invoke-direct {v0, p1, p3, p2}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;-><init>(Landroid/content/Context;Landroid/view/ViewGroup;Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$ConfigChangeListener;)V

    goto :goto_0

    :pswitch_1
    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;

    invoke-direct {v0, p1, p3, p2}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;-><init>(Landroid/content/Context;Landroid/view/ViewGroup;Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$ConfigChangeListener;)V

    goto :goto_0

    :pswitch_2
    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogKeyboardMenu;

    invoke-direct {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogKeyboardMenu;-><init>(Landroid/content/Context;)V

    :goto_0
    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
