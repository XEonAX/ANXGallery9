.class public abstract Lcn/kuaipan/android/http/multipart/PartBase;
.super Lcn/kuaipan/android/http/multipart/Part;
.source "PartBase.java"


# instance fields
.field private charSet:Ljava/lang/String;

.field private contentType:Ljava/lang/String;

.field private name:Ljava/lang/String;

.field private transferEncoding:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Lcn/kuaipan/android/http/multipart/Part;-><init>()V

    if-eqz p1, :cond_0

    iput-object p1, p0, Lcn/kuaipan/android/http/multipart/PartBase;->name:Ljava/lang/String;

    iput-object p2, p0, Lcn/kuaipan/android/http/multipart/PartBase;->contentType:Ljava/lang/String;

    iput-object p3, p0, Lcn/kuaipan/android/http/multipart/PartBase;->charSet:Ljava/lang/String;

    iput-object p4, p0, Lcn/kuaipan/android/http/multipart/PartBase;->transferEncoding:Ljava/lang/String;

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Name must not be null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public getCharSet()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcn/kuaipan/android/http/multipart/PartBase;->charSet:Ljava/lang/String;

    return-object v0
.end method

.method public getContentType()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcn/kuaipan/android/http/multipart/PartBase;->contentType:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcn/kuaipan/android/http/multipart/PartBase;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getTransferEncoding()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcn/kuaipan/android/http/multipart/PartBase;->transferEncoding:Ljava/lang/String;

    return-object v0
.end method
