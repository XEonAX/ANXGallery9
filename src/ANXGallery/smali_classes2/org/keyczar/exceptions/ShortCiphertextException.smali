.class public Lorg/keyczar/exceptions/ShortCiphertextException;
.super Lorg/keyczar/exceptions/KeyczarException;
.source "ShortCiphertextException.java"


# static fields
.field private static final serialVersionUID:J = 0x6842caf11ab6b223L


# direct methods
.method public constructor <init>(I)V
    .locals 3

    const-string v0, "CiphertextTooShort"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-static {v0, v1}, Lorg/keyczar/i18n/Messages;->getString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lorg/keyczar/exceptions/KeyczarException;-><init>(Ljava/lang/String;)V

    return-void
.end method
