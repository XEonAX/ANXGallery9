.class public Lcom/miui/gallery/data/DBImage$ExifDataConst;
.super Ljava/lang/Object;
.source "DBImage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/data/DBImage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ExifDataConst"
.end annotation


# instance fields
.field public final cloudTagName:Ljava/lang/String;

.field public final columnIndex:I

.field public final exifTagName:Ljava/lang/String;

.field public final exifValueType:I


# direct methods
.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/miui/gallery/data/DBImage$ExifDataConst;->columnIndex:I

    iput-object p2, p0, Lcom/miui/gallery/data/DBImage$ExifDataConst;->cloudTagName:Ljava/lang/String;

    iput-object p3, p0, Lcom/miui/gallery/data/DBImage$ExifDataConst;->exifTagName:Ljava/lang/String;

    iput p4, p0, Lcom/miui/gallery/data/DBImage$ExifDataConst;->exifValueType:I

    return-void
.end method
