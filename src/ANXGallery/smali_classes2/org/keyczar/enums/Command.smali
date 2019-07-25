.class public final enum Lorg/keyczar/enums/Command;
.super Ljava/lang/Enum;
.source "Command.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/keyczar/enums/Command;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/keyczar/enums/Command;

.field public static final enum ADDKEY:Lorg/keyczar/enums/Command;

.field public static final enum CREATE:Lorg/keyczar/enums/Command;

.field public static final enum DEMOTE:Lorg/keyczar/enums/Command;

.field public static final enum EXPORT_KEY:Lorg/keyczar/enums/Command;

.field public static final enum IMPORT_KEY:Lorg/keyczar/enums/Command;

.field public static final enum PROMOTE:Lorg/keyczar/enums/Command;

.field public static final enum PUBKEY:Lorg/keyczar/enums/Command;

.field public static final enum REVOKE:Lorg/keyczar/enums/Command;

.field public static final enum USEKEY:Lorg/keyczar/enums/Command;


# instance fields
.field private final name:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 12

    new-instance v0, Lorg/keyczar/enums/Command;

    const-string v1, "CREATE"

    const-string v2, "create"

    const/4 v3, 0x0

    invoke-direct {v0, v1, v3, v2}, Lorg/keyczar/enums/Command;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/keyczar/enums/Command;->CREATE:Lorg/keyczar/enums/Command;

    new-instance v0, Lorg/keyczar/enums/Command;

    const-string v1, "ADDKEY"

    const-string v2, "addkey"

    const/4 v4, 0x1

    invoke-direct {v0, v1, v4, v2}, Lorg/keyczar/enums/Command;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/keyczar/enums/Command;->ADDKEY:Lorg/keyczar/enums/Command;

    new-instance v0, Lorg/keyczar/enums/Command;

    const-string v1, "PUBKEY"

    const-string v2, "pubkey"

    const/4 v5, 0x2

    invoke-direct {v0, v1, v5, v2}, Lorg/keyczar/enums/Command;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/keyczar/enums/Command;->PUBKEY:Lorg/keyczar/enums/Command;

    new-instance v0, Lorg/keyczar/enums/Command;

    const-string v1, "PROMOTE"

    const-string v2, "promote"

    const/4 v6, 0x3

    invoke-direct {v0, v1, v6, v2}, Lorg/keyczar/enums/Command;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/keyczar/enums/Command;->PROMOTE:Lorg/keyczar/enums/Command;

    new-instance v0, Lorg/keyczar/enums/Command;

    const-string v1, "DEMOTE"

    const-string v2, "demote"

    const/4 v7, 0x4

    invoke-direct {v0, v1, v7, v2}, Lorg/keyczar/enums/Command;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/keyczar/enums/Command;->DEMOTE:Lorg/keyczar/enums/Command;

    new-instance v0, Lorg/keyczar/enums/Command;

    const-string v1, "REVOKE"

    const-string v2, "revoke"

    const/4 v8, 0x5

    invoke-direct {v0, v1, v8, v2}, Lorg/keyczar/enums/Command;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/keyczar/enums/Command;->REVOKE:Lorg/keyczar/enums/Command;

    new-instance v0, Lorg/keyczar/enums/Command;

    const-string v1, "USEKEY"

    const-string v2, "usekey"

    const/4 v9, 0x6

    invoke-direct {v0, v1, v9, v2}, Lorg/keyczar/enums/Command;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/keyczar/enums/Command;->USEKEY:Lorg/keyczar/enums/Command;

    new-instance v0, Lorg/keyczar/enums/Command;

    const-string v1, "IMPORT_KEY"

    const-string v2, "importkey"

    const/4 v10, 0x7

    invoke-direct {v0, v1, v10, v2}, Lorg/keyczar/enums/Command;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/keyczar/enums/Command;->IMPORT_KEY:Lorg/keyczar/enums/Command;

    new-instance v0, Lorg/keyczar/enums/Command;

    const-string v1, "EXPORT_KEY"

    const-string v2, "exportkey"

    const/16 v11, 0x8

    invoke-direct {v0, v1, v11, v2}, Lorg/keyczar/enums/Command;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/keyczar/enums/Command;->EXPORT_KEY:Lorg/keyczar/enums/Command;

    const/16 v0, 0x9

    new-array v0, v0, [Lorg/keyczar/enums/Command;

    sget-object v1, Lorg/keyczar/enums/Command;->CREATE:Lorg/keyczar/enums/Command;

    aput-object v1, v0, v3

    sget-object v1, Lorg/keyczar/enums/Command;->ADDKEY:Lorg/keyczar/enums/Command;

    aput-object v1, v0, v4

    sget-object v1, Lorg/keyczar/enums/Command;->PUBKEY:Lorg/keyczar/enums/Command;

    aput-object v1, v0, v5

    sget-object v1, Lorg/keyczar/enums/Command;->PROMOTE:Lorg/keyczar/enums/Command;

    aput-object v1, v0, v6

    sget-object v1, Lorg/keyczar/enums/Command;->DEMOTE:Lorg/keyczar/enums/Command;

    aput-object v1, v0, v7

    sget-object v1, Lorg/keyczar/enums/Command;->REVOKE:Lorg/keyczar/enums/Command;

    aput-object v1, v0, v8

    sget-object v1, Lorg/keyczar/enums/Command;->USEKEY:Lorg/keyczar/enums/Command;

    aput-object v1, v0, v9

    sget-object v1, Lorg/keyczar/enums/Command;->IMPORT_KEY:Lorg/keyczar/enums/Command;

    aput-object v1, v0, v10

    sget-object v1, Lorg/keyczar/enums/Command;->EXPORT_KEY:Lorg/keyczar/enums/Command;

    aput-object v1, v0, v11

    sput-object v0, Lorg/keyczar/enums/Command;->$VALUES:[Lorg/keyczar/enums/Command;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lorg/keyczar/enums/Command;->name:Ljava/lang/String;

    return-void
.end method

.method public static getCommand(Ljava/lang/String;)Lorg/keyczar/enums/Command;
    .locals 3

    if-eqz p0, :cond_9

    sget-object v0, Lorg/keyczar/enums/Command;->CREATE:Lorg/keyczar/enums/Command;

    invoke-virtual {v0}, Lorg/keyczar/enums/Command;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object p0, Lorg/keyczar/enums/Command;->CREATE:Lorg/keyczar/enums/Command;

    return-object p0

    :cond_0
    sget-object v0, Lorg/keyczar/enums/Command;->ADDKEY:Lorg/keyczar/enums/Command;

    invoke-virtual {v0}, Lorg/keyczar/enums/Command;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object p0, Lorg/keyczar/enums/Command;->ADDKEY:Lorg/keyczar/enums/Command;

    return-object p0

    :cond_1
    sget-object v0, Lorg/keyczar/enums/Command;->PUBKEY:Lorg/keyczar/enums/Command;

    invoke-virtual {v0}, Lorg/keyczar/enums/Command;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    sget-object p0, Lorg/keyczar/enums/Command;->PUBKEY:Lorg/keyczar/enums/Command;

    return-object p0

    :cond_2
    sget-object v0, Lorg/keyczar/enums/Command;->PROMOTE:Lorg/keyczar/enums/Command;

    invoke-virtual {v0}, Lorg/keyczar/enums/Command;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    sget-object p0, Lorg/keyczar/enums/Command;->PROMOTE:Lorg/keyczar/enums/Command;

    return-object p0

    :cond_3
    sget-object v0, Lorg/keyczar/enums/Command;->DEMOTE:Lorg/keyczar/enums/Command;

    invoke-virtual {v0}, Lorg/keyczar/enums/Command;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    sget-object p0, Lorg/keyczar/enums/Command;->DEMOTE:Lorg/keyczar/enums/Command;

    return-object p0

    :cond_4
    sget-object v0, Lorg/keyczar/enums/Command;->REVOKE:Lorg/keyczar/enums/Command;

    invoke-virtual {v0}, Lorg/keyczar/enums/Command;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    sget-object p0, Lorg/keyczar/enums/Command;->REVOKE:Lorg/keyczar/enums/Command;

    return-object p0

    :cond_5
    sget-object v0, Lorg/keyczar/enums/Command;->USEKEY:Lorg/keyczar/enums/Command;

    invoke-virtual {v0}, Lorg/keyczar/enums/Command;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_6

    sget-object p0, Lorg/keyczar/enums/Command;->USEKEY:Lorg/keyczar/enums/Command;

    return-object p0

    :cond_6
    sget-object v0, Lorg/keyczar/enums/Command;->IMPORT_KEY:Lorg/keyczar/enums/Command;

    invoke-virtual {v0}, Lorg/keyczar/enums/Command;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_7

    sget-object p0, Lorg/keyczar/enums/Command;->IMPORT_KEY:Lorg/keyczar/enums/Command;

    return-object p0

    :cond_7
    sget-object v0, Lorg/keyczar/enums/Command;->EXPORT_KEY:Lorg/keyczar/enums/Command;

    invoke-virtual {v0}, Lorg/keyczar/enums/Command;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_8

    sget-object p0, Lorg/keyczar/enums/Command;->EXPORT_KEY:Lorg/keyczar/enums/Command;

    return-object p0

    :cond_8
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p0, v1, v2

    const-string p0, "Command.UnknownCommand"

    invoke-static {p0, v1}, Lorg/keyczar/i18n/Messages;->getString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_9
    new-instance p0, Ljava/lang/NullPointerException;

    invoke-direct {p0}, Ljava/lang/NullPointerException;-><init>()V

    throw p0
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/keyczar/enums/Command;
    .locals 1

    const-class v0, Lorg/keyczar/enums/Command;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lorg/keyczar/enums/Command;

    return-object p0
.end method

.method public static values()[Lorg/keyczar/enums/Command;
    .locals 1

    sget-object v0, Lorg/keyczar/enums/Command;->$VALUES:[Lorg/keyczar/enums/Command;

    invoke-virtual {v0}, [Lorg/keyczar/enums/Command;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/keyczar/enums/Command;

    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lorg/keyczar/enums/Command;->name:Ljava/lang/String;

    return-object v0
.end method
