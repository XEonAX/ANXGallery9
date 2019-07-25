.class Landroid/support/media/ExifInterface$ExifTag;
.super Ljava/lang/Object;
.source "ExifInterface.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/media/ExifInterface;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ExifTag"
.end annotation


# instance fields
.field public final name:Ljava/lang/String;

.field public final number:I

.field public final primaryFormat:I

.field public final secondaryFormat:I


# direct methods
.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroid/support/media/ExifInterface$ExifTag;->name:Ljava/lang/String;

    iput p2, p0, Landroid/support/media/ExifInterface$ExifTag;->number:I

    iput p3, p0, Landroid/support/media/ExifInterface$ExifTag;->primaryFormat:I

    const/4 p1, -0x1

    iput p1, p0, Landroid/support/media/ExifInterface$ExifTag;->secondaryFormat:I

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;III)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroid/support/media/ExifInterface$ExifTag;->name:Ljava/lang/String;

    iput p2, p0, Landroid/support/media/ExifInterface$ExifTag;->number:I

    iput p3, p0, Landroid/support/media/ExifInterface$ExifTag;->primaryFormat:I

    iput p4, p0, Landroid/support/media/ExifInterface$ExifTag;->secondaryFormat:I

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;IIILandroid/support/media/ExifInterface$1;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3, p4}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;III)V

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;II)V

    return-void
.end method
