.class public Lcn/kuaipan/android/http/client/IgnoreCertificationTrustManger;
.super Ljava/lang/Object;
.source "IgnoreCertificationTrustManger.java"

# interfaces
.implements Ljavax/net/ssl/X509TrustManager;


# instance fields
.field private certificates:[Ljava/security/cert/X509Certificate;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public checkClientTrusted([Ljava/security/cert/X509Certificate;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateException;
        }
    .end annotation

    iget-object p2, p0, Lcn/kuaipan/android/http/client/IgnoreCertificationTrustManger;->certificates:[Ljava/security/cert/X509Certificate;

    if-nez p2, :cond_0

    iput-object p1, p0, Lcn/kuaipan/android/http/client/IgnoreCertificationTrustManger;->certificates:[Ljava/security/cert/X509Certificate;

    :cond_0
    return-void
.end method

.method public checkServerTrusted([Ljava/security/cert/X509Certificate;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateException;
        }
    .end annotation

    iget-object p2, p0, Lcn/kuaipan/android/http/client/IgnoreCertificationTrustManger;->certificates:[Ljava/security/cert/X509Certificate;

    if-nez p2, :cond_0

    iput-object p1, p0, Lcn/kuaipan/android/http/client/IgnoreCertificationTrustManger;->certificates:[Ljava/security/cert/X509Certificate;

    :cond_0
    return-void
.end method

.method public getAcceptedIssuers()[Ljava/security/cert/X509Certificate;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method
